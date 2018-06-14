xml2js = require '../lib/xml2js'
assert = require 'assert'
equ = assert.equal

module.exports =
  'xml to js to xml': (test) ->

    xml = """
    <groceries>
       <dairy>milk</dairy>
       <produce>celery</produce>
       <dairy>eggs</dairy>
       <produce>apples</produce>
       <dairy>butter</dairy>
       <produce>eggplant</produce>
    </groceries>
    """
    console.log xml

    options =
      explicitChildren: true
      preserveChildrenOrder:true
      headless: true
      renderOpts:
        pretty: true

    xml2js.parseString xml, options, (err, js) ->
      if err
        throw err
      else
        console.log js
        builder = new xml2js.Builder options
        xml2 = builder.buildObject js
        console.log xml2

        # compare ignore whitespace
#        equ (xml.replace /\s+/g, " "), (xml2.replace /\s+/g, " ")
        test.done()