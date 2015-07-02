"""
Sample JSON web server
"""

import http.server
import socketserver

PORT = 8000

httpd = http.server.HTTPServer(("", PORT), http.server.CGIHTTPRequestHandler)

print("serving at port", PORT)
httpd.serve_forever()