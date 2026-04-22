#Varnish Configuration (default.vcl)

vcl 4.1;

backend default {
    .host = "127.0.0.1";
    .port = "8080"; # Nginx backend port
}

sub vcl_recv {
    # Bypass cache for admin and customer account
    if (req.http.cookie ~ "admin" || req.url ~ "/admin" || req.url ~ "/customer/account") {
        return (pass);
    }
    # Standard Magento 2 header cleanup
    if (req.method == "PURGE") {
        return (purge);
    }
}
