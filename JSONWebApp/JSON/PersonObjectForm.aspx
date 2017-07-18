<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonObjectForm.aspx.cs" Inherits="JSONWebApp.JSON.PersonObjectForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Person JSON</title>
    <script>
        function GetPerson() {
            var jPersonObject =
                {
                    "Name": "Tintin", "Age": 21,
                    "Email": "tintin@t.com", "Phone": "1212121"
                };
            alert("PersonObject\n" + jPersonObject);
            document.getElementById("jName").innerHTML = jPersonObject.Name;
            document.getElementById("jAge").innerHTML = jPersonObject.Age;
            document.getElementById("jEmail").innerHTML = jPersonObject.Email;
            document.getElementById("jPhone").innerHTML = jPersonObject.Phone;
        }
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                Name: <span id="jName"></span><br />
                Age: <span id="jAge"></span><br />
                Email: <span id="jEmail"></span><br />
                Phone: <span id="jPhone"></span><br />
                <input type="submit" value="Get Person" onclick="GetPerson(); return false;"/>
            </p>
        </div>
    </form>
</body>
</html>
