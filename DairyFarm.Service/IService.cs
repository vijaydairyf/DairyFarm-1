﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DairyFarm.Core.DAL;

namespace DairyFarm.Service
{
    public interface IDairyFarmService
    {
        
        bool AddCattle(Cattle cattle);
        bool AddCattleProduction(CattleProduction cattle);
        bool AddDiseasesHistory(DiseasesHistory diseasesHistory);
        bool AddDGestation(Gestation gestation);
        Cattle GetCattleById(int? id);
        CattleProduction GetCattleProductionById(int? id);
        MedicalTreatment GetMedicalTreatmentById (int? id);
        Disease GetDiseaseById(int ?id);
        bool GetDiseaseContagious(int? id);
        IEnumerable<Disease> GetDiseases();
        IEnumerable<CattleType> GetCattleTypes();
        IEnumerable<Herd> GetHerds();
        IEnumerable<CattleProduction> GetCattleProductions();
        IEnumerable<MedicalTreatment> GetMedicalTreatments();
        IEnumerable<Cattle> GetCattles();
        IEnumerable<Cattle> GetCattlesByHerd(int idHerd);
        IEnumerable<Herd> GetHerdById(int idHerd);
        IQueryable<IGrouping<int, Cattle>> IndexCattle();

    }
}
