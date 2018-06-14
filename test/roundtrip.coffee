xml2js = require '../lib/xml2js'
assert = require 'assert'
equ = assert.equal


xml = "<groceries>Star<dairy><milk type='skim'>Wilson Farms</milk></dairy>Market<produce>celery</produce>Belmont<dairy>eggs</dairy><frozen>peas</frozen><produce>apples</produce><dairy>butter</dairy><produce>eggplant</produce></groceries>"
console.log xml
console.log "--------------------------------------------------------"
options =
  indexChildren: ['groceries']
  explicitChildren: false
  preserveChildrenOrder:true
  headless: true
  renderOpts:
    pretty: true

xml2js.parseString xml, options, (err, js) ->
  if err
    throw err
  else
    console.log "--------------------------------------------------------"
    console.log JSON.stringify js,null,4
    console.log "--------------------------------------------------------"
    builder = new xml2js.Builder options
    xml2 = builder.buildObject js
    console.log xml2

    expected = "<groceries>StarMarketBelmont<dairy><milk type='skim'>Wilson Farms</milk></dairy><produce>celery</produce><dairy>eggs</dairy><frozen>peas</frozen><produce>apples</produce><dairy>butter</dairy><produce>eggplant</produce></groceries>"
    # compare ignore whitespace
    equ (xml.replace /\s+/g, " "), (xml2.replace /\s+/g, " ")
