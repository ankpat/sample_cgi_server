#!/usr/bin/env python3
import cgi
import cgitb
import urllib.request

"""
URL to query - this should probably just return a JSON object.
play with the code as needed.
"""
json_url = "http://jsonplaceholder.typicode.com/posts/1"
additional_data = None


cgitb.enable()
print("Content-Type: text/html;charset=utf-8")
print()


result = urllib.request.urlopen(json_url, additional_data )
print(result.read().decode("utf-8"))
