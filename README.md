# sample_cgi_server
Sample CGI server that can serve up JSON from an external site.

Quick and dirty CGI server!

Usage:

python3 httpserver.py

This script will start a web server on a hardcoded PORT (default is 8000).
It will serve up one file by default - index.html.

index.html sends a post request to a cgi script that will query a website and return a JSON object.

index.html will display the output from that script on startup. It also has a manual refresh option.

I didn't have the Frisco beer JSON url, so I used a generic test url.