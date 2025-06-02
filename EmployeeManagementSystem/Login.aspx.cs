using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                // إذا كان المستخدم مسجلاً دخوله بالفعل، قم بتوجيهه للصفحة الرئيسية أو صفحة البحث
                Response.Redirect("~/SearchEmployee.aspx");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // هنا يتم التحقق من اسم المستخدم وكلمة المرور (المشفرة) من قاعدة البيانات
            // bool isValidUser = YourDataAccessLayer.ValidateUser(username, password); // يجب أن تتحقق من كلمة المرور المشفرة

            // ---- محاكاة التحقق ----
            bool isValidUser = false;
            string userRole = "User"; // افتراضي
            if (username.Equals("admin", StringComparison.OrdinalIgnoreCase) && password == "admin123")
            {
                isValidUser = true;
                userRole = "Admin"; // تحديد دور المدير
            }
            else if (username.Equals("user", StringComparison.OrdinalIgnoreCase) && password == "user123")
            {
                isValidUser = true;
                userRole = "User";
            }
            // ---- نهاية المحاكاة ----


            if (isValidUser)
            {
                // إنشاء تذكرة المصادقة وتخزين الدور في UserData (اختياري، لكن مفيد)
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                    1,                                     // version
                    username,                              // name
                    DateTime.Now,                          // issueDate
                    DateTime.Now.AddMinutes(30),           // expiration 
                    true,                                  // isPersistent
                    userRole,                              // userData (لتخزين الدور)
                    FormsAuthentication.FormsCookiePath);  // cookiePath

                string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                System.Web.HttpCookie authCookie = new System.Web.HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                Response.Cookies.Add(authCookie);

                // توجيه المستخدم إلى الصفحة المطلوبة بعد تسجيل الدخول
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (!string.IsNullOrEmpty(returnUrl))
                {
                    Response.Redirect(returnUrl);
                }
                else
                {
                    Response.Redirect("~/SearchEmployee.aspx"); // أو أي صفحة افتراضية أخرى
                }
            }
            else
            {
                lblLoginStatus.Text = "اسم المستخدم أو كلمة المرور غير صحيحة.";
                lblLoginStatus.CssClass = "text-center mb-3 block text-red-500";
            }
        }
    }
}