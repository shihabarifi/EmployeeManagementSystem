using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class SearchEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // يمكن تهيئة أي قيم أولية هنا
                // BindEmptyGrid(); // لعرض الجدول فارغًا مع الرؤوس عند التحميل الأول
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearchTerm.Text.Trim();
            lblStatusSearch.Text = ""; // مسح أي رسالة سابقة

            if (string.IsNullOrEmpty(searchTerm))
            {
                lblStatusSearch.Text = "الرجاء إدخال اسم أو رقم هاتف للبحث.";
                lblStatusSearch.CssClass = "mt-4 text-sm text-red-500";
                gvSearchResults.DataSource = null;
                gvSearchResults.DataBind();
                return;
            }

            // هنا يتم استدعاء منطق البحث الفعلي من قاعدة البيانات
            // على سبيل المثال، استدعاء دالة في طبقة الوصول للبيانات (DAL)
            // var searchResults = YourDataAccessLayer.SearchEmployees(searchTerm);

            // ---- بيانات وهمية للتوضيح ----
            var mockResults = GetMockSearchResults(searchTerm);
            // ---- نهاية البيانات الوهمية ----

            if (mockResults.Rows.Count > 0)
            {
                gvSearchResults.DataSource = mockResults;
                gvSearchResults.DataBind();
            }
            else
            {
                // lblStatusSearch.Text = $"لا توجد نتائج مطابقة لـ \"{searchTerm}\".";
                // lblStatusSearch.CssClass = "mt-4 text-sm text-gray-600";
                gvSearchResults.DataSource = null; // تأكد من مسح البيانات
                gvSearchResults.DataBind(); // هذا سيعرض EmptyDataText
            }
        }

        // دالة لإنشاء بيانات وهمية (لأغراض الاختبار فقط)
        private DataTable GetMockSearchResults(string term)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("EmployeeName", typeof(string));
            dt.Columns.Add("EmployeeNumber", typeof(string));
            dt.Columns.Add("DepartmentName", typeof(string));
            dt.Columns.Add("StatusName", typeof(string));
            dt.Columns.Add("PhoneNumbers", typeof(string));

            // إضافة بيانات وهمية إذا كان مصطلح البحث يطابق شيئًا
            if (term.Contains("أحمد") || term.Contains("050"))
            {
                dt.Rows.Add("أحمد محمد عبدالله", "EMP001", "فرع الرياض", "نشط", "0501234567, 0557654321");
            }
            if (term.Contains("فاطمة") || term.Contains("053"))
            {
                dt.Rows.Add("فاطمة علي حسن", "EMP002", "فرع جدة", "نشط", "0539876543");
            }
            if (term.Contains("خالد") || term.Contains("EMP003"))
            {
                dt.Rows.Add("خالد عبدالله سالم", "EMP003", "المركز الرئيسي", "إجازة", "0500001122, 0112345678");
            }
            return dt;
        }

        // لعرض الجدول فارغًا مع الرؤوس عند التحميل الأول (اختياري)
        // private void BindEmptyGrid()
        // {
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("EmployeeName", typeof(string));
        //    dt.Columns.Add("EmployeeNumber", typeof(string));
        //    dt.Columns.Add("DepartmentName", typeof(string));
        //    dt.Columns.Add("StatusName", typeof(string));
        //    dt.Columns.Add("PhoneNumbers", typeof(string));
        //    // يمكنك إضافة صف فارغ إذا كنت تريد عرض رسالة "لا توجد بيانات" بشكل مختلف
        //    // dt.Rows.Add(dt.NewRow()); 
        //    gvSearchResults.DataSource = dt;
        //    gvSearchResults.DataBind();
        //    // إذا أضفت صفًا فارغًا، قد تحتاج إلى إخفائه
        //    // if (dt.Rows.Count == 1 && string.IsNullOrEmpty(dt.Rows[0][0]?.ToString()))
        //    //    gvSearchResults.Rows[0].Visible = false;
        // }
    }
}