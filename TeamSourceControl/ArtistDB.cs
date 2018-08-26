using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamSourceControl {
    class ArtistDB {
        public static void Add(Artists a) {
            CtrlArtGalleryEntities context = new CtrlArtGalleryEntities();

            context.Artists.Add(a);

            context.SaveChanges();
        }
    }
}
