using System;
using System.Collections.Generic;
namespace ssdt_sample_web.Models
{
    public partial class ItemModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public virtual ItemCategoryModel ItemCategory { get; set; }
    }
}
