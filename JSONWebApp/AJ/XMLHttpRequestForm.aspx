<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XMLHttpRequestForm.aspx.cs" Inherits="JSONWebApp.AJ.XMLHttpRequestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        var _xmlHttpReqObj;

        function CreateXMLHttpRequest() {
            var xmlHttpReq;
            if (window.XMLHttpRequest) {
                xmlHttpReq = new XMLHttpRequest();
            }
            else {
                try {
                    xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }
            return xmlHttpReq;
        }

        function AsyncCall() {
            _xmlHttpReqObj = CreateXMLHttpRequest();
            _xmlHttpReqObj.open("GET", "Products.xml", true);
            _xmlHttpReqObj.onreadystatechange = RenderResponse;
            _xmlHttpReqObj.send();
        }

        function RenderResponse() {
            if (_xmlHttpReqObj.readyState == 4) {
                var productDisplay = document.getElementById("ProductDiv");
                //productDisplay.innerHTML = _xmlHttpReqObj.responseText;
                productDisplay.innerText = _xmlHttpReqObj.responseText;
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                <input type="button" value="Get Products" onclick="AsyncCall(); return false;" />
            </p>
            <div id="ProductDiv"></div>
        </div>
    </form>
</body>
</html>
