$ = require 'jquery'
generateIframe = (gomlCode, jsCode) -> $ ->
  iframe = $('<iframe id="jthree-iframe"></iframe>')[0]
  code = """
    <!DOCTYPE html>
    <html lang="ja">
      <head>
        <meta charset="utf-8"/>
        <script>
          //<![CDATA[
          //]]>
        </script>
        <script type="text/javascript" src="/js/j3.js"></script>
      </head>
      <body>
        <div id="canvas" class="canvasContainer"/>
        <script type="text/goml">
          <!-- your goml here --> """ +
          gomlCode + """
        </script>
        <script type="text/javascript">
          //<![CDATA[
            // your js here """ +
            jsCode + """
          //]]>
        </script>
      </body>
    </html>
  """
  $('#target').html(iframe)
  doc = iframe.contentWindow.document
  doc.open()
  doc.write code
  doc.close()

module.exports = generateIframe
