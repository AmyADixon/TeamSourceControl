//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TeamSourceControl
{
    using System;
    using System.Collections.Generic;
    
    public partial class FeaturedArtists
    {
        public int ArtistID { get; set; }
        public Nullable<int> EventID { get; set; }
    
        public virtual Artists Artists { get; set; }
        public virtual GalleryEvents GalleryEvents { get; set; }
    }
}
