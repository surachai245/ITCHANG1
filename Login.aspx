<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>
<%@ Register Src="wucHeader.ascx" TagName="wucHeader" TagPrefix="uc1" %>
<%@ Register Src="wucFooter.ascx" TagName="wucFooter" TagPrefix="uc2" %>
<%@ Register Src="wucMenu.ascx" TagName="wucMenu" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="css/style1.css" rel="stylesheet" type="text/css" />
   
</head>
<body>
    <form id="form1" runat="server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">

        <script type="text/javascript" language="javascript">
     
     function adjustContent()
     {
        var df=document.getElementById('<%=UpdateProgress.ClientID %>');
        dfs = df.style;
        dfs.position='absolute'  ;
        dfs.left = 0;
        dfs.top =0;
        
        var height = 0;  
        var width = 0;  
        var body = window.document.body;    
        if (window.innerHeight) {        
            height = window.innerHeight;    
            width = window.innerWidth;
            } 
        else if (body.parentElement.clientHeight) {        
            height = body.parentElement.clientHeight;    
            width = body.parentElement.clientWidth;
            } 
        else if (body && body.clientHeight) {        
            height = body.clientHeight;    
            width = body.clientWidth;
            }
        
        var pg = document.getElementById("progressTable");
        pg.style.height = height + "px";
        
        var pg = document.getElementById("tbContent");
        pg.style.height = height + "px";
        
        var dvContent = document.getElementById("dvContent");
        dvContent.style.height = (height-(80+50+65)) + "px";
         
       
    }
        
    window.onload=adjustContent;
    window.onresize=adjustContent;
    window.onscroll=adjustContent;
        </script>

    </asp:PlaceHolder>
    <Ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </Ajax:ToolkitScriptManager>
    <asp:UpdateProgress ID="UpdateProgress" runat="server">
        <ProgressTemplate>
            <table width="100%" cellspacing="0" cellpadding="0" id="progressTable">
                <tr>
                    <td align="center">
                        <img id="loading" src="images/help-loading.gif" alt="" />
                    </td>
                </tr>
            </table>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                &nbsp;
            </td>
            <td style="width: 1000px; background: #D9E0E4; border-left: 1px solid silver; border-right: 1px solid silver;"
                valign="top">
                <table style="width: 1000px;" cellspacing="0" cellpadding="0" id="tbContent" border="0">
                    <tr>
                        <td style="height: 50px;" valign="top">
                            <uc1:wucHeader ID="wucHeader1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px;">
                            <uc3:wucMenu ID="wucMenu1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="dvContent">
                                <asp:UpdatePanel ID="upContent" runat="server">
                                    <ContentTemplate>
                                        <div id="dvLogin" style="width: 300px; text-align: center; padding: 100px;">
                                            <table id="Table1" style="text-align: left; border: 1px solid #B1B6B7; background: #f0f0f0;
                                                width: 275px;">
                                                <tr>
                                                    <td style="padding: 5px 10px 2px 10px;">
                                                        <table id="login" width="100%" cellspacing="0" cellpadding="3">
                                                            <tr>
                                                                <td colspan="2" style="padding: 5px 0px 2px 0px; border-bottom: 1px solid #b1b2b3"
                                                                    class="title">
                                                                    &raquo; Log in
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 10px;">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="label">
                                                                    รหัสพนักงาน:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEmCode" runat="server" CssClass="textbox"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rqEmCode" runat="server" ControlToValidate="txtEmCode"
                                                                        Text="*"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="label">
                                                                    รหัสผ่าน:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rqPassword" runat="server" ControlToValidate="txtPassword"
                                                                        Text="*"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td style="padding-top: 5px;">
                                                                    <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="button" OnClick="btnLogin_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width: 275px;">
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="warning">
                                                        <asp:Literal ID="ltMessage" runat="server"></asp:Literal>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px; background: #333; color: #FFF;">
                            <uc2:wucFooter ID="wucFooter1" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
