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
    
    public partial class Disease
    {
        public Disease()
        {
            this.DiseasesHistories = new HashSet<DiseasesHistory>();
        }
    
        public int IdDisease { get; set; }
        public string Label { get; set; }
        public bool Contagious { get; set; }
    
        public virtual ICollection<DiseasesHistory> DiseasesHistories { get; set; }
    }
}
