<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SignalR4__hitCounter_.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id ="hitCount"></div>

    </div>
    </form>

    <script src="scripts/jquery-1.6.4.js"></script>
    <script src="scripts/jquery.signalR-2.2.1.js"></script>
    <script type="text/javascript">
        $(function () {
            var con = $.hubConnection();
            var hub = con.createHubProxy('hitCounter');
            hub.on('onHitRecorded', function (i) {
                $('#hitCount').text(i);
            });
            con.start(function () {
                hub.invoke('recordHit');
            });
            
        })
    </script>
</body>
</html>
