using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace NonkosiBoutique
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Session_Start(object sender, EventArgs e) {

            Session.Add("count", 0);
            Session.Add("itemType", "null");
            Session.Add("user", "null");
            Session.Add("array", "null");
            Session.Add("arrayRow", 0);
            Session.Add("status", "stop");
            Session.Add("search", "all");
            Session.Add("price", 0);
            Session.Add("tolprice", 0);
            Session.Add("clearAllC", 0);
            Session.Add("clearRowT", "null");
            Session.Add("clearRowNo", 0);
            Session.Add("cart", null);

        }
    }
}