using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // يمكن إضافة منطق هنا يتم تنفيذه على كل الصفحات
            // على سبيل المثال، التحقق من صلاحيات المستخدم لعرض روابط معينة في شريط التنقل
            // if (Context.User.IsInRole("Admin")) { hlImport.Visible = true; }
            // else { hlImport.Visible = false; }
        }
    }
}