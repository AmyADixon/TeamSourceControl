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
    
    public partial class GalleryVisitors {
        public int MemberID { get; set; }
        public string MemberEmail { get; set; }
        public string MemberFirstName { get; set; }
        public string MemberLastName { get; set; }
        public string MemberPhone { get; set; }
        public string MemberCity { get; set; }
        public string MemberState { get; set; }
        public string MemberStreet { get; set; }
        public string MemberZip { get; set; }
    
        public virtual VirtualGallery VirtualGallery { get; set; }
    }
}