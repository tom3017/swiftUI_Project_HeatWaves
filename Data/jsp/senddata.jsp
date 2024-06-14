<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript" charset="UTF-8">
        function javaScriptToIOS() {
            if (window.webkit?.messageHandlers?.serverEvent) {
                console.log('Send Event')
                window.webkit.messageHandlers.serverEvent.postMessage('Hello iOS')
            } else {
                console.log('Cannot send event')
            }
        }

        function iOSToJavaScript() {
            console.log('Event Occurred')
        }   
    </script>
    <style>
        .button {
          width: 500px;
          height: 300px;
          background-color: #4CAF50;
          border: none;
          color: white;
          padding: 15px 32px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 50px;
          margin: 4px 2px;
          cursor: pointer;
        }
        </style>
    <title>iOS <-> JavaScript</title>
</head>
<body>
    <button class="button" type="button" onclick="javaScriptToIOS()">JavaScript -> iOS로 데이터 전달</button>
</body>
</html>