using System.Web;
using System.Web.Mvc;

namespace Vinhbaobao_2011065103
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
