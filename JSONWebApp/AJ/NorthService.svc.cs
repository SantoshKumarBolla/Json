using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Linq;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace JSONWebApp.AJ
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class NorthService
    {
        DataContext _ctx;
        Table<Category> _categoryTable;
        Table<Product> _productTable;

        public NorthService()
        {
            _ctx = new DataContext(ConfigurationManager.ConnectionStrings["NorthConnection"].ConnectionString);
            _categoryTable = _ctx.GetTable<Category>();
            _productTable = _ctx.GetTable<Product>();
        }

        [OperationContract]
        public string GetCategories()
        {
            var result = _categoryTable.ToList();
            MemoryStream mStream = new MemoryStream();
            DataContractJsonSerializer djs = new DataContractJsonSerializer(result.GetType());
            djs.WriteObject(mStream, result);
            mStream.Position = 0;
            StreamReader sReader = new StreamReader(mStream);
            return sReader.ReadToEnd();
        }

        [OperationContract]
        public string GetProductsByCategory(int categoryID)
        {
            var result = _productTable.Where(p => p.CategoryID == categoryID).ToList();
            MemoryStream mStream = new MemoryStream();
            DataContractJsonSerializer djs = new DataContractJsonSerializer(result.GetType());
            djs.WriteObject(mStream, result);
            mStream.Position = 0;
            StreamReader sReader = new StreamReader(mStream);
            return sReader.ReadToEnd();
        }


        #region Default
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        //[OperationContract]
        //public void DoWork()
        //{
        //    // Add your operation implementation here
        //    return;
        //}

        // Add more operations here and mark them with [OperationContract]

        #endregion
    }
}
