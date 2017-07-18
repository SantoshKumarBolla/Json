using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.Linq.Mapping;

namespace JSONWebApp.AJ
{
    [Table(Name = "Categories")]
    public class Category
    {
        [Column]
        public int CategoryID { get; set; }
        [Column]
        public string CategoryName { get; set; }
    }
}