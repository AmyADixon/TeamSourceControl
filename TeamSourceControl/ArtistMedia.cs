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
    
    public partial class ArtistMedia
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ArtistMedia()
        {
            this.MediaUsed = new HashSet<MediaUsed>();
        }
    
        public int MediaID { get; set; }
        public string MediaBrand { get; set; }
        public string MediaType { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MediaUsed> MediaUsed { get; set; }
    }
}
