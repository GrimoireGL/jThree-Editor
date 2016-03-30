$ = require 'jquery'
generateIframe = (gomlCode, jsCode) -> $ ->
  iframe = $('<iframe id="jthree-iframe"></iframe>')[0]
  code = """
    <!DOCTYPE html>
    <html lang="ja">
      <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css">
        <script type="text/javascript" src="/js/j3.js"></script>
        <style>
          .container {
            background: #fafafa;
            height: 100vh;
          }
          .canvasContainer {
            /* padding: 8px;
             border: 1px solid #ddd;*/
            margin: 0 !important;
            height: 100vh;
            width: 100vh;
          }
          .canvasContainer canvas {
            width: 100vw;
            height: 100vh;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div id="canvas" class="canvasContainer"/>
        </div>
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
