require "express"
fs = require "fs"
express = require("express")
server = express()

cache = {}
cache['app.html'] = fs.readFileSync 'bin/app.html'

server.use '/static', express.static('bin/')
server.get '/', (req, res)->
   res.setHeader('Content-Type', 'text/html')
   res.send cache['app.html']


server.listen(3000)

