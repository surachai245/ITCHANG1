using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Login : PageBase
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Configs.WebTitle;
        
        if (!IsPostBack)
        {            
            txtEmCode.Text = "";
            txtPassword.Text = "";
            ltMessage.Text = "";

            txtEmCode.Focus();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        

        System.Threading.Thread.Sleep(2000);

        ltMessage.Text = "";
        string emCode = txtEmCode.Text.Trim();
        string passwd = txtPassword.Text.Trim();

        UserStruct oUserStruct;
        UserClass oUser = new UserClass();
        

        if (oUser.Login(emCode, passwd, out oUserStruct))
        {
            Utils.WriteLog("Login success", RemoteAddress, emCode);
            UserLogin = oUserStruct;
            oUser.UpdateLogin(emCode, RemoteAddress);
            Response.Redirect("Default.aspx");
        }
        else
        {
            Utils.WriteLog("Login fail:" + oUser.Message, RemoteAddress, emCode);
            ltMessage.Text = oUser.Message;
        }
    }

    private void WriteMessage(string Message)
    {
        ltMessage.Text = Message;
    }
}
