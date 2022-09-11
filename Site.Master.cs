using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace NonkosiBoutique
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void SearcBox_TextChanged(object sender, EventArgs e)
        {
            Session["search"] = SearcBox.Text;
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["search"] = SearcBox.Text;
            Response.Redirect("~/item.aspx");
        }

        
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session["search"] = "wedding gown";
            Response.Redirect("~/item.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["search"] = "Suits";
            Response.Redirect("~/item.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Session["search"] = "Dress";
            Response.Redirect("~/item.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Session["search"] = "Shoes";
            Response.Redirect("~/item.aspx");
        }

        protected void Package1_Click(object sender, EventArgs e)
        {
            Session["search"] = "Package1";
            Response.Redirect("~/item.aspx");
        }

        protected void Package2_Click(object sender, EventArgs e)
        {
            Session["search"] = "Package2";
            Response.Redirect("~/item.aspx");
        }

        protected void Package3_Click(object sender, EventArgs e)
        {
            Session["search"] = "Package3";
            Response.Redirect("~/item.aspx");
        }

        protected void Package4_Click(object sender, EventArgs e)
        {
            Session["search"] = "Package4";
            Response.Redirect("~/item.aspx");
        }

        protected void Package5_Click(object sender, EventArgs e)
        {
            Session["search"] = "Package5";
            Response.Redirect("~/item.aspx");
        }

        protected void historyBookings_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/HistoryBookings.aspx");
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }

        protected void Cart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }
    }

}