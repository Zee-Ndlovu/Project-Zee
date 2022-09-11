using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NonkosiBoutique
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Booksp_Click(object sender, EventArgs e)
        {
            Session["search"] = "all";
            Response.Redirect("item.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["search"] = "Package";
            Response.Redirect("item.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["search"] = "Dress";
            Response.Redirect("item.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["search"] = "Suit";
            Response.Redirect("item.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["search"] = "Wedding Gown";
            Response.Redirect("item.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session["search"] = "Suit";
            Response.Redirect("item.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Session["search"] = "Wedding Gown";
            Response.Redirect("item.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Session["search"] = "Dress";
            Response.Redirect("item.aspx");
        }
    }
}