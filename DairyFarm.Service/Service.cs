﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DairyFarm.Core.DAL;


namespace DairyFarm.Service
{
   public class DairyFarmService : IDairyFarmService
    {
       private readonly DairyFarmEntities _db;
       public DairyFarmService(DairyFarmEntities db)
       {
            this._db = db;
       }

       #region Cattle
       public bool AddCattle(Cattle cattle)
       {
           try
           {
               _db.Cattles.Add(cattle);
               _db.SaveChanges();
           }
           catch
           {
               return false;

           }
           return true;

       }

       public Cattle GetCattleById(int? id)
       {
           return _db.Cattles.Find(id);
       }

       public IEnumerable<Cattle> GetCattles()
       {
           return _db.Cattles;
       }

       public IQueryable<IGrouping<int, Cattle>> IndexCattle()
       {
          return  _db.Cattles.Where(c => c.Active != true ).GroupBy(c => c.IdHerd);
       }
       #endregion
       #region DiseaseHistory
       public bool AddDiseasesHistory(DiseasesHistory diseasesHistory)
       {
           try
           {
               _db.DiseasesHistories.Add(diseasesHistory);
               _db.SaveChanges();
               return true;
           }
           catch
           {
               return false;
           }

       }

       public bool EditCattle(Cattle cattle)
       {
           try
           {
               _db.Entry(cattle).State = EntityState.Modified;
               _db.SaveChanges();
               return true;

           }
           catch
           {
               return false;

           }
       }

       public bool DeleteCattle(int id)
       {
           var cattle = GetCattleById(id);
           cattle.Active = true;
            return EditCattle(cattle);
       }

       public IEnumerable<Cattle> GetCattleInQuarantine()
       {
           return _db.Cattles.Where(c => c.InQuarantine == true).ToList();
       }
       #endregion
       #region MedicalTreatments
       public IEnumerable<MedicalTreatment> GetMedicalTreatments()
       {
           return _db.MedicalTreatments;
       }
       public MedicalTreatment GetMedicalTreatmentById(int? id)
       {
           return _db.MedicalTreatments.Find(id);
       }
       #endregion
       #region Gestation
       public bool AddDGestation(Gestation gestation)
       {
           try
           {
               _db.Gestations.Add(gestation);
               _db.SaveChanges();
               return true;
           }
           catch
           {
               return false;
           }
       }
       #endregion
       #region Disease
       public IEnumerable<Disease> GetDiseases()
       {
           return _db.Diseases;

       }

       public Disease GetDiseaseById(int? id)
       {
           return _db.Diseases.Find(id);
       }

       public bool GetDiseaseContagious(int? id)
       {
           return _db.Diseases.Find(id).Contagious;
       }
       public IEnumerable<Cattle> GetCattlesByHerd(int idHerd)
       {
           return _db.Cattles.Where(c => c.IdHerd == idHerd).ToList();
       }
       #endregion
       #region CattleType
       public IEnumerable<CattleType> GetCattleTypes()
       {
           return _db.CattleTypes;
       }
       #endregion
       #region Herd
       public IEnumerable<Herd> GetHerds()
       {
           return _db.Herds;
       }
       public IEnumerable<Herd> GetHerdById(int idHerd)
       {
           var herdSelect = _db.Herds.Find(idHerd);
           if (herdSelect.Label == "Animal en quarantaine")
           {
               return _db.Herds.Where(c=> c.IdHerd != herdSelect.IdHerd).ToList();
               
           }
           return _db.Herds.Where(c => c.CattleType.Rank >= herdSelect.CattleType.Rank && c.CattleType.Sex == herdSelect.CattleType.Sex && c.IdHerd!=herdSelect.IdHerd).ToList();

       }
       #endregion
       #region CattleProduction
       public IEnumerable<CattleProduction> GetCattleProductions()
       {
           return _db.CattleProductions.Include(c => c.Cattle);
       }

       public bool AddCattleProduction(CattleProduction cattleProduction)
       {
           try
           {
               _db.CattleProductions.Add(cattleProduction);
               _db.SaveChanges();
               return true;
           }
           catch
           {
               return false;
           }
       }

       public CattleProduction GetCattleProductionById(int? id)
       {
           return _db.CattleProductions.Find(id);
       }
       public IEnumerable<CattleProduction> GetYesterdayProd(DateTime date)
       {
           var yesterday = DateTime.Today.AddDays(-1);
           return _db.CattleProductions.Where(c => c.Dateprod.Month == yesterday.Month && c.Dateprod.Day == yesterday.Day).ToList();
       }
       public bool EditCattleProductions(CattleProduction cattleProduction)
       {
           try
           {
               _db.Entry(cattleProduction).State = EntityState.Modified;
               _db.SaveChanges();
               return true;

           }
           catch
           {
               return false;

           }
       }
       public IEnumerable<CattleProduction> GetTodayProduction(DateTime date)
       {
           return _db.CattleProductions.Where(d => d.Dateprod.Month == date.Month && d.Dateprod.Day == date.Day);
       }
       #endregion
       #region Food
       #endregion
       #region Season
       #endregion
       #region Meal
       #endregion








      
    }
}
