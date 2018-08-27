using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamSourceControl {
    class ArtDB {
        public static void Add(Art a) {
            CtrlArtGalleryEntities context = new CtrlArtGalleryEntities();

            context.Art.Add(a);

            context.SaveChanges();
        }
    }
}
