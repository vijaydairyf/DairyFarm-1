//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DairyFarm.Core.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class CattleType
    {
        public CattleType()
        {
            this.Herds = new HashSet<Herd>();
            this.Diets = new HashSet<Diet>();
        }
    
        public int IdCattleType { get; set; }
        public string Label { get; set; }
        public string Sex { get; set; }
        public int Rank { get; set; }
    
        public virtual ICollection<Herd> Herds { get; set; }
        public virtual ICollection<Diet> Diets { get; set; }
    }
}
