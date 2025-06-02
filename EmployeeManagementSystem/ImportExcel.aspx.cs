using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class ImportExcel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // يمكن وضع منطق هنا للتحقق من صلاحيات المستخدم (Admin) قبل عرض الصفحة
            // if (!Context.User.IsInRole("Admin"))
            // {
            //    lblImportStatus.Text = "ليس لديك الصلاحية للوصول لهذه الصفحة.";
            //    lblImportStatus.CssClass = "mb-4 block text-red-500";
            //    pnlFileUploadWrapper.Visible = false; // إخفاء عناصر التحكم
            //    fuExcelFile.Visible = false;
            //    btnImportFile.Visible = false;
            //    rfvExcelFile.Enabled = false;
            // }
        }

        protected void BtnImportFile_Click(object sender, EventArgs e)
        {
            if (fuExcelFile.HasFile)
            {
                string fileExtension = Path.GetExtension(fuExcelFile.FileName).ToLower();
                if (fileExtension == ".xls" || fileExtension == ".xlsx")
                {
                    try
                    {
                        // حفظ الملف مؤقتًا على الخادم (اختياري، يمكن القراءة مباشرة من الـ stream)
                        // string tempFilePath = Server.MapPath("~/App_Data/Uploads/" + Guid.NewGuid().ToString() + fuExcelFile.FileName);
                        // fuExcelFile.SaveAs(tempFilePath);

                        // هنا يتم استدعاء منطق قراءة ملف Excel ومعالجة البيانات
                        // باستخدام مكتبة مثل EPPlus:
                        // using (var package = new ExcelPackage(fuExcelFile.FileContent)) // or new ExcelPackage(new FileInfo(tempFilePath)))
                        // {
                        //    ExcelWorksheet worksheet = package.Workbook.Worksheets[0]; // أو بالاسم
                        //    int rowCount = worksheet.Dimension.Rows;
                        //    for (int row = 2; row <= rowCount; row++) // افتراض أن الصف الأول هو رأس الجدول
                        //    {
                        //        string empNumber = worksheet.Cells[row, 1].Value?.ToString().Trim();
                        //        string empName = worksheet.Cells[row, 2].Value?.ToString().Trim();
                        //        // ... وهكذا لبقية الأعمدة
                        //        // ثم إدراج البيانات في قاعدة البيانات
                        //    }
                        // }

                        lblImportStatus.Text = $"تم استيراد الملف \"{fuExcelFile.FileName}\" بنجاح (محاكاة).";
                        lblImportStatus.CssClass = "mb-4 block text-green-600";
                        lblFileName.Text = ""; // مسح اسم الملف المعروض
                    }
                    catch (Exception ex)
                    {
                        lblImportStatus.Text = "حدث خطأ أثناء معالجة الملف: " + ex.Message;
                        lblImportStatus.CssClass = "mb-4 block text-red-500";
                        // LogError(ex);
                    }
                }
                else
                {
                    lblImportStatus.Text = "الرجاء اختيار ملف Excel صالح (xls أو xlsx).";
                    lblImportStatus.CssClass = "mb-4 block text-red-500";
                }
            }
            else
            {
                // RequiredFieldValidator سيتعامل مع هذا، ولكن يمكن إضافة رسالة إضافية إذا أردت
                lblImportStatus.Text = "الرجاء اختيار ملف أولاً.";
                lblImportStatus.CssClass = "mb-4 block text-red-500";
            }
        }
    }
}