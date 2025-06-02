using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace EmployeeManagementSystem
{
    public class Global : HttpApplication
    {
        protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        {
            HttpCookie authCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (authCookie == null || authCookie.Value == "")
                return;

            FormsAuthenticationTicket authTicket;
            try
            {
                authTicket = FormsAuthentication.Decrypt(authCookie.Value);
            }
            catch
            {
                return;
            }

            if (authTicket == null || authTicket.Expired)
                return;

            // استرداد الأدوار المخزنة في UserData
            string[] roles = authTicket.UserData.Split(',');

            // إنشاء هوية جديدة مع الأدوار
            FormsIdentity id = new FormsIdentity(authTicket);
            GenericPrincipal principal = new GenericPrincipal(id, roles);

            // تعيين الهوية الحالية للمستخدم
            Context.User = principal;
        }
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}