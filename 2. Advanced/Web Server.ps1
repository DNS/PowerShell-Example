$server = New-Object System.Net.HttpListener
$server.Prefixes.Add("http://localhost:8080/")
$server.Start()

while ($server.IsListening) {
  $context = $server.GetContext()
  $request = $context.Request
  $response = $context.Response

  $response.ContentType = "text/html"
  $response.StatusCode = 200
  $response.OutputStream.Write([Text.Encoding]::UTF8.GetBytes("<html><body>Hello, World!</body></html>"))
  $response.Close()
}


