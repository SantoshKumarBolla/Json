<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryAndProductsForm.aspx.cs" Inherits="JSONWebApp.AJ.CategoryAndProductsForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function GetCategories() {
            NorthService.GetCategories(OnCategorySuccess, OnError);
        }

        function OnCategorySuccess(result) {
            var cats = eval("(" + result + ")")
            var catgoryOption = document.getElementById("CategorySelect");
            for (var i = 0; i < cats.length; i++) {
                var option = document.createElement("Option");
                option.setAttribute("value", cats[i].CategoryID);
                option.innerText = cats[i].CategoryName;
                catgoryOption.appendChild(option);
            }
        }

        function GetProducts() {
            var categoryID = document.getElementById("CategorySelect").value;
            alert("CategoryId: " + categoryID);
            NorthService.GetProductsByCategory(categoryID, OnProductSuccess, OnError)
        }

        function OnProductSuccess(result) {
            var prods = eval("(" + result + ")");
            alert("No Of Products: " + prods.length);
        }

        function OnError(result) {
            alert("Error\n" + result.get_message());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/AJ/NorthService.svc" />
            </Services>
        </asp:ScriptManager>
        <div>
            <asp:Label ID="CategoryLabel" text="Category" runat="server"></asp:Label>&nbsp;
            <select id="CategorySelect"></select> &nbsp;
            <asp:Button id="GetCategoriesButton" Text="Get Categories" runat="server" OnClientClick="GetCategories();return false;" />&nbsp;
            <asp:Button id="GetProductsButton" Text="Get Products" runat="server" OnClientClick="GetProducts();return false;" />
        </div>
    </form>
</body>
</html>
