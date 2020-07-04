using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace GelisimYonetimLoglamaMantigi.Interfaces
{
    interface ISQL_Islemleri
    {
        void Kaydet();
        void Sil(int id);
    }
}
