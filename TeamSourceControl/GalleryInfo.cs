//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TeamSourceControl {
    using System;
    using System.Collections.Generic;
    
    public partial class GalleryInfo {
        public int GalleryID { get; set; }
        public string GalleryPhone { get; set; }
        public string GalleryHours { get; set; }
    
        public virtual OtherGalleryWorks OtherGalleryWorks { get; set; }
    }
}