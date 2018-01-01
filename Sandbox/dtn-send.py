@cherrypy.expose
def send(self):
    if 'server' not in cherrypy.session:
        return self.not_connect_notify + self.back
    else:
        return """<html>
            <head><title>Image Send</title></head>
            <body>
            <form method="get" action="command">
            Client:<br>
            ftp://<input type="text" name="_file"><br>
            Server:<br>
            ftp://{}<input type="text" name="_dest"><br>
            <input type="hidden" name="action" value="send">
            <input type="submit" value="send">
            </form>
            </body>
            </html>""".format(cherrypy.session['server'])
