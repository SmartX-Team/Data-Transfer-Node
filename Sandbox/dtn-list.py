@cherrypy.expose
def list(self):
    if "server" not in cherrypy.session or cherrypy.session['server'] == "":
        server_notify = "<h3>No server is connected</h3>"
    else:
        server_notify = "<h3>Server is connected: " + cherrypy.session['server'] + "</h3>"
    return """<html>
        <head><title>Image Transfer</title></head>
        <body>""" + server_notify + """
        <button type="button" onclick="location.href='send'">Send</button>
        <button type="button" onclick="location.href='receive'">Receive</button>
        <button type="button" onclick="location.href='connect'">Connect</button>
        </body></html>"""
