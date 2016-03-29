generateIframe = (gomlCode, jsCode) ->
  iframe = document.createElement('iframe')
  iframe.setAttribute('id', 'jthree-iframe')
  code = """
    <!DOCTYPE html>
    <html lang="ja">
      <head>
        <meta charset="utf-8"/>
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
  target = document.getElementById('target')
  if target.childNodes.length != 0
    target.removeChild(target.childNodes[0])
  target.appendChild iframe
  console.log document.getElementById('target')
  console.log code
  doc = iframe.contentWindow.document
  doc.open()
  doc.write code
  doc.close()

module.exports = generateIframe
