@cherrypy.expose
def command(self, _file, _dest, action):
    if action == "send":
        if "server" not in cherrypy.session:
            _file = "ftp://" + _file
        else:
            _file = "ftp://" + _file
            _dest = "ftp://" + cherrypy.session["server"] + _dest
    elif action == "receive":
        _file = "ftp://" + cherrypy.session["server"] + _file
        if "server" not in cherrypy.session:
            _dest = "ftp://" + _dest
        else:
            _dest = "ftp://" + _dest

    else:
        return "error in action " + self.back

    cmd = "globus-url-copy -vb " + _file + " " + _dest
    os.system(cmd)
    return cmd
