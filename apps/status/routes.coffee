routes = (app) ->

  rest = require 'restler'
  DATA_URL = 'https://script.google.com/macros/s/AKfycbwUqrOsqQk4rk0lY97Wl4bRsHVk6_CMVPz3hGHeyc3H2ZCahCIY/exec'

  app.get '/', (req, res) ->
    rest.get(DATA_URL)
      .on 'complete', (result, response) ->
        res.render "#{__dirname}/views/index",
          title: 'Tutonic3 Status'
          stylesheet: 'index'
          final: result['Final']
          draft: result['Draft']
          need: result['Need']

module.exports = routes
