//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DairyFarm.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Gestation
    {
        public int IdGestation { get; set; }
        public int IdCattle { get; set; }
        public System.DateTime StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public Nullable<System.DateTime> DateCalve { get; set; }
        public string CalveSex { get; set; }
        public string Comment { get; set; }
        public Nullable<bool> DeathCalve { get; set; }
    
        public virtual Cattle Cattle { get; set; }
    }
}