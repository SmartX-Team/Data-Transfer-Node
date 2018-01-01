@cherrypy.expose
def connect(self):
    return """<html>
        <head><title>Connect Server</title></head>
        <body>
        <form method="get" action="connecting">
        server:<br>
        <input type="text" name="_server"><br>
        port:<br>
        <input type="text" name="_port"><br>
        <input type="submit" value="Connect">
        </form>
        </body>
        </html>"""

@cherrypy.expose
def connecting(self, _server, _port):
    response = os.system("nc -z -v " + _server + " " + _port)
    if response == 0:
        cherrypy.session['server'] = _server
        return "Successfully connected " + _server + " : " + _port + self.back
    else:
        return "Failed to connect " + _server + " : " + _port + self.back

    if __name__ == "__main__":
        conf = {
        '/': {
        'tools.sessions.on': True
        }
        }
        cherrypy.server.socket_host = '192.168.0.161'
        cherrypy.quickstart(ImgTransfer(), '/', conf)
