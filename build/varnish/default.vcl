vcl 4.0;

backend default {
  .host = "web";
  .port = "80";
}

# Called when a request is received
sub vcl_recv {
  if (
    req.method != "GET" &&
    req.method != "HEAD" &&
    req.method != "OPTIONS" &&
    req.method != "TRACE"
  ) {
    return (pipe);
  }

  if (req.url ~ "^/uncacheable.php") {
    return (pass);
  }
}

# Called when the requested object has been retrieved from the backend
sub vcl_deliver {
  # For example, we can add a header
  set resp.http.X-Varnish-Custom = "uncacheable";
  unset resp.http.X-Powered-By;
}