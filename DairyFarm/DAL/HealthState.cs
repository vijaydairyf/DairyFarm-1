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
    
    public partial class HealthState
    {
        public HealthState()
        {
            this.Cattles = new HashSet<Cattle>();
        }
    
        public int IdState { get; set; }
        public string Label { get; set; }
    
        public virtual ICollection<Cattle> Cattles { get; set; }
    }
}
