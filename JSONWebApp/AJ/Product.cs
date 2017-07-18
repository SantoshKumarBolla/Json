using System;
using System.Collections.Generic;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Web;

namespace JSONWebApp.AJ
{
    [Table(Name = "Products")]
    public class Product
    {
        [Column]
        public int ProductID { get; set; }
        [Column]
        public string ProductName { get; set; }
        [Column]
        public decimal UnitPrice { get; set; }
        [Column]
        public int CategoryID { get; set; }

    }
}