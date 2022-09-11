using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonkosiBoutique
{
    public partial class item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["search"].ToString();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            string value = b.CommandArgument;
            Session["count"] = value;
            Response.Redirect("~/User/detailsItems.aspx");
        }

        protected void searchItem_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            string value = b.CommandArgument;
            Session["count"] = value;
            Response.Redirect("~/User/detailsItems.aspx");
        }

        protected void packageItem_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            string value = b.CommandArgument;
            Session["count"] = value;
            Response.Redirect("~/User/detailsItems.aspx");
        }
    }
}