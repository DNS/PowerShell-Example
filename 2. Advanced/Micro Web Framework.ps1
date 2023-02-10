$server = New-Object System.Net.HttpListener
$server.Prefixes.Add("http://localhost:8080/")
$server.Start()

function Micro () {
	switch ($request.RawUrl) {
		"/" {
			'Return a default page'
		}
		"/about" {
			'Return an about page'
		}
		default {
			# Return a 404 page
			$response.StatusCode = 404
		}
	}
}

while ($server.IsListening) {
	$context = $server.GetContext()
	$request = $context.Request
	$response = $context.Response

	$response.ContentType = "text/html"
	$response.StatusCode = 200

	$response.OutputStream.Write([Text.Encoding]::UTF8.GetBytes(( Micro ) ))
	$response.Close()
}


