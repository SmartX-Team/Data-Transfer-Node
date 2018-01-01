@cherrypy.expose
def receive(self):
    if 'server' not in cherrypy.session:
        return self.not_connect_notify + self.back
    else:
        return """<html>
            <head><title>Image Receive</title></head>
            <body>
            <form method="get" action="command">
            Server:<br>
            	   ftp://{}<input type="text" name="_file"><br>
            Client:<br>
            ftp://<input type="text" name="_dest"><br>
            <input type="hidden" name="action" value="receive">
            <input type="submit" value="receive">
            </form>
            </body>
            </html>""".format(cherrypy.session['server']
