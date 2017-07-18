<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JSONTypesForm.aspx.cs" Inherits="JSONWebApp.JSON.JSONTypesForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JSON Types</title>
    <script>
        function GetPersonArray() {
            var peopleArray = [
                {
                    "Name": "Tintin", "Age": 21, "Email": "tintin@t.com", "Phone": "1212121"
                },
                {
                    "Name": "Snowy", "Age": 7, "Email": "snowy@s.com", "Phone": "2121212"
                },
                {
                    "Name": "Hadhock", "Age": 31, "Email": "hadhock@h.com", "Phone": "3131313"
                },
                {
                    "Name": "Thomson", "Age": 22, "Email": "thomson@t.com", "Phone": "131313131"
                }
            ];
            var display = document.getElementById("PeopleDiv");
            for (var i = 0; i < peopleArray.length; i++) {
                var personSpan = document.createElement("span");
                var person = "Name: " + peopleArray[i].Name + ", Age: " + peopleArray[i].Age + ", Email: " + peopleArray[i].Email + " and Phone: " + peopleArray[i].Phone + "<br/>";
                personSpan.innerHTML = person;
                display.appendChild(personSpan);
            }
        }

        function GetParsedPerson()
        {
            var text = '{"Person": [' +
                '{"Name": "Mickey", "FavColor": "Red"},' +
                '{"Name": "Mini", "FavColor": "Blue"},' +
                '{"Name": "Goffy", "FavColor": "Green"}' +
                ']}';//text

            var result = eval("(" + text + ")");

            var display = document.getElementById("PeopleDiv");
            for (var i = 0; i < result.Person.length; i++) {
                var personSpan = document.createElement("span");
                var pp = "Name: " + result.Person[i].Name + ", FavColor: " + result.Person[i].FavColor;
                var hrr = document.createElement("hr");
                hrr.setAttribute("color", result.Person[i].FavColor);
                personSpan.innerHTML = pp;
                display.appendChild(personSpan).appendChild(hrr);
            }

        }

        var regAllExp = 
            {
                "dateFormat": /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{4}$/,
                "regex": ".+\\@.+\\..+"
            }

        function CheckDate() {
            var reg = new RegExp(regAllExp.dateFormat);
            var dd = document.getElementById("DateText").value;
            var result = reg.exec(dd);
            if (result != null) {
                document.getElementById("dateDiv").innerHTML = "Valid Date Format....";
            }
            else {
                document.getElementById("dateDiv").innerHTML = "InValid Date Format....";
            }
        }

        function CheckEmail() {
            var emailReg = new RegExp(regAllExp.regex);
            var emailText = document.getElementById("EmailText").value;
            var result = emailReg.exec(emailText);
            if (result != null) {
                document.getElementById("emailDiv").innerHTML = "Valid email Format....";
            }
            else {
                document.getElementById("emailDiv").innerHTML = "InValid email Format....";
            }
        }

        function JSONReviver() {
            var text = '{"firstName": "Peter", "lastName": "Parker", "Birthdate": "17-07-1999"}';
            //var contact = JSON.parse(text);
            //alert("Contact\n" + contact);
            //document.getElementById("fullNameDiv").innerHTML = contact.firstName + ". " + contact.lastName;
            var bDate = JSON.parse(text, BirthdateReviver);
            document.getElementById("displayReviver").innerHTML = bDate.Birthdate.toString();
        }

        function BirthdateReviver(key, value)
        {
            var dateResult;
            if (typeof value === 'string') {
                dateResult = /^(\d{2})-(\d{2})-(\d{4})$/.exec(value);
                if (dateResult) {
                    alert("dateResult\n" + dateResult);
                    return new Date(Date.UTC(dateResult[3], dateResult[2] - 1, dateResult[1]));
                }
            }
            return value;
        }

        function ContactStringify() {
            var contact = new Object();
            contact.FirstName = "Bruce";
            contact.LastName = "Wayne";
            contact.Phone = "1212001";

            var memberFilter = new Array();
            memberFilter[0] = "FirstName";
            memberFilter[1] = "Phone";

            //var result = JSON.stringify(contact);
            var result = JSON.stringify(contact, memberFilter, "\t");

            //alert("Result\n" + result);
            document.getElementById("stringifyResult").innerHTML = result;

            var res = JSON.stringify(contact, function (key, value) {
                if (key == "FirstName") {
                    if (typeof value === "string") {
                        return value += "->MN";
                    }
                }
                else {
                    return value;
                }
            });
            alert(res);


        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="PeopleDiv"></div>
            <div>
                <input type="submit" value="Get People" onclick="GetPersonArray(); return false;" /><br />
                <input type="submit" value="Get Parsed Person" onclick="GetParsedPerson(); return false;" /><br />
            </div>
            <hr />
            <h1>Regular Expression...</h1>
            <div>
                <p>
                    Date dd/mm/yyyy:
                    <input type="text" id="DateText" style="width:120px; height: 30px;" /> &nbsp;
                    <input  type="submit" value="Check Date" onclick="CheckDate(); return false;" />
                </p>
                <div id="dateDiv"></div>
            </div>
            <div>
                <p>
                    Email:
                    <input type="text" id="EmailText" style="width:120px; height: 30px;" /> &nbsp;
                    <input  type="submit" value="Check Email" onclick="CheckEmail(); return false;" />
                </p>
                <div id="emailDiv"></div>
            </div>
            <div>
                <p>
                    <input type="submit" value="Check Birthdate" onclick="JSONReviver(); return false;" />
                </p>
                <div id="fullNameDiv"></div>
                <div id="displayReviver"></div>
            </div>

            <div>
                <p>
                    <input type="submit" value="Stringify" onclick="ContactStringify(); return false;" />
                </p>
                <div id="stringifyResult"></div>
            </div>

        </div>
    </form>
</body>
</html>
