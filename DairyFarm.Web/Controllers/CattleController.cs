﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using DairyFarm.Core.DAL;
using DairyFarm.Core.Models;
using DairyFarm.Service;
using DairyFarm.Web.Models;

namespace DairyFarm.Web.Controllers
{
    [Authorize]
    public class CattleController : Controller
    {
        private readonly DairyFarmEntities _db = new DairyFarmEntities();
        private readonly IDairyFarmService _dairyFarmService;
        //private readonly DairyFarmEntities _db;
        public CattleController(IDairyFarmService dairyFarmService)
        {
            _dairyFarmService = dairyFarmService;
        }

        // GET: Cattle
        public ActionResult Index(string message,int? state)
        {
            var listGrouping = _dairyFarmService.IndexCattle();
            if (message != null)
            {
                ViewBag.Message = message;
                ViewBag.State = state;
            }
         
            return View(listGrouping);
        }

        // GET: Cattle/Details/5
        public ActionResult Details(int? id, string message, int? state)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cattle cattle = _dairyFarmService.GetCattleById(id);

            if (cattle == null)
            {
                return HttpNotFound();
            }
            var currentGestation = cattle.Gestations.FirstOrDefault(g => g.EndDateGestation == null);
            var currentDisease = cattle.DiseasesHistories.Where(d => d.EndDate == null).ToList();
            var cattleDetailViewModel = new CattleDetailViewModel
            {
                IdCattle = cattle.IdCattle,
                CodeCattle = cattle.CodeCattle,
                Cattletype = cattle.Herd.CattleType.Label,
                LabelHerd = cattle.Herd.Label,
                AgeYear = DateTime.Now.Year - cattle.DateBirth.Year,
                AgeMonth = DateTime.Now.Month - cattle.DateBirth.Month,
                MalParent = cattle.MalParent,
                FemaleParent = cattle.FemaleParent,
                Sex = cattle.Herd.CattleType.Sex,
                CurrentGestation = currentGestation,
            };
            foreach (DiseasesHistory disease in currentDisease)
            {
                if (disease != null)
                {
                    cattleDetailViewModel.CurrentDiseases.Add(disease);
                }
            }
            if (message != null)
            {
                ViewBag.Message = message;
                ViewBag.State = state;
            }

            if (cattle.Herd.IdCattleType == 5 || cattle.Herd.IdCattleType == 6 || cattle.Herd.IdCattleType == 8)
            {
                cattleDetailViewModel.canGestation = true;
            }
            return View(cattleDetailViewModel);
        }


        public ActionResult NewDisease()
        {
            // (liste a retourner, value, text)
            ViewBag.IdMedicalTreatments = new SelectList(_dairyFarmService.GetMedicalTreatments(), "IdTreatment", "Label");
            ViewBag.IdDisease = new SelectList(_dairyFarmService.GetDiseases(), "IdDisease", "Label");
            return PartialView("_DiseasesHistory");
        }

        public ActionResult NewGestation()
        {
            ViewBag.CalveSex = new SelectList(Util.Sexe);
            return PartialView("_Gestation");
        }

        public ActionResult CattleInQuarantine()
        {
            var cattleInquarantin = new CattleDiseaseList();
            
            foreach (var cattleI in _dairyFarmService.GetCattleInQuarantine())
            {
                cattleInquarantin.inQuarantine.Add(cattleI);
            }
            foreach (var cattleS in _dairyFarmService.GetSickCattle())
            {
                cattleInquarantin.sick.Add(cattleS);
            }
            return View(cattleInquarantin);
        }
        public ActionResult ChangeHerd(int idHerd)
        {
            ViewBag.Cattles = new SelectList(_dairyFarmService.GetCattlesByHerd(idHerd), "IdCattle", "CodeCattle");
            ViewBag.Herds = new SelectList(_dairyFarmService.GetHerdListById(idHerd), "IdHerd", "Label");
            return View();
        }
        [HttpPost]
        public ActionResult ChangeHerd(ChangeHerdViewModel changeHerd)
        {

            if (ModelState.IsValid) {
                var popup = new MessageInfo
                {
                    State = 1,
                    Message = "troupeau bien changé"
                };
               
            foreach (var idCattle in changeHerd.IdChangeCattle)
            {
                var herdDecrement = _dairyFarmService.GetCattleById(idCattle);
                _dairyFarmService.DecrementHerd(changeHerd.IdChangeHerd);
                _dairyFarmService.IncrementHerd(herdDecrement.IdHerd);
               ////var cattleToEdit = _dairyFarmService.GetCattleById(idCattle);
               //  herdDecrement.IdHerd = changeHerd.IdChangeHerd;
                //_db.Detach(order);
                int noOfRowUpdated = _db.Database.ExecuteSqlCommand("Update Cattles set IdHerd =" + changeHerd.IdChangeHerd + " where IdCattle=" + idCattle + "");
                if (noOfRowUpdated != 1)
                {
                    popup.State *= 0;
                }
                //_db.Entry(cattleToEdit).State = EntityState.Modified;
                //_db.SaveChanges();
            }
            return RedirectToAction("Index", new { message = popup.Message, state = popup.State });

            }
            return RedirectToAction("Index", new { message = "Erreur dans le changement du troupeau !", state = 0 });
        }
        // GET: Cattle/Create
        public ActionResult Create(string message, int? state)
        {
            ViewBag.IdCattletype = new SelectList(_dairyFarmService.GetCattleTypes(), "IdCattletype", "Label");
            ViewBag.IdHerd = new SelectList(new List<Herd>(), "IdHerd", "Label");
            if (message != null)
            {
                ViewBag.Message = message;
                ViewBag.State = state;
            }
            ViewBag.Sex = new SelectList(Util.Sexe);
            return View();
        }

        // POST: Cattle/Create
        [HttpPost]
        public ActionResult Create(CattleCreateViewModel cattleCreateViewModel)
        {

            if (ModelState.IsValid )
            {
                var popup = new MessageInfo
                {
                    State = 1,
                    Message = "Bête bien ajouté"
                };
                var cattle = new Cattle
                {
                    CodeCattle = cattleCreateViewModel.CodeCattle,
                    IdHerd = cattleCreateViewModel.IdHerd,
                    DateBirth = cattleCreateViewModel.DateBirth,
                };
                if(cattleCreateViewModel.CurrentDisease!=null){
                    }
                if (_dairyFarmService.AddCattle(cattle) == false)
                {
                    popup.State = 0;
                }


                if (cattleCreateViewModel.CurrentDisease != null)
                {
                    cattleCreateViewModel.CurrentDisease.IdCattle = cattle.IdCattle;

                    foreach (var idTreatment in cattleCreateViewModel.CurrentDisease.IdMedicalTreatments)
                    {
                        var medic = _dairyFarmService.GetMedicalTreatmentById(idTreatment);
                        cattleCreateViewModel.CurrentDisease.MedicalTreatments.Add(medic);
                    }

                    if (_dairyFarmService.AddDiseasesHistory(cattleCreateViewModel.CurrentDisease) == false)
                    {
                        popup.State = 0;
                    }

                }


                if (cattleCreateViewModel.CurrentGestation != null)
                {
                    cattleCreateViewModel.CurrentGestation.IdCattle = cattle.IdCattle;
                    if (_dairyFarmService.AddGestation(cattleCreateViewModel.CurrentGestation) == false)
                    {
                        popup.State = 0;
                    }
                }

                if (popup.State == 1)
                {
                    return RedirectToAction("Index", new {message = popup.Message, state = popup.State});

                }
                else
                {
                    return RedirectToAction("Create", new { message = "Erreur dans l'ajout", state = popup.State });
                    
                }

            }

            ViewBag.IdCattletype = new SelectList(_dairyFarmService.GetCattleTypes(), "IdCattletype", "Label", cattleCreateViewModel.IdCattletype);
            ViewBag.IdHerd = new SelectList(_dairyFarmService.GetHerds(), "IdHerd", "Label", cattleCreateViewModel.IdHerd);
            return RedirectToAction("Create", new { message = "Erreur dans l'ajout", state = 0 });
        }

        // GET: Cattle/Edit/5
        public ActionResult Edit(int id)
        {
            var parent = new ParentViewModel();
            var cattle = _db.Cattles.Find(id);
            parent.MalParent = cattle.MalParent;
            parent.FemaleParent = cattle.FemaleParent;
            parent.IdCattle = id;
            return View(parent);
        }

        // POST: Cattle/Edit/5
        [HttpPost]
        public ActionResult Edit(ParentViewModel parentViewModel)
        {
            int noOfRowUpdated = _db.Database.ExecuteSqlCommand("Update Cattles set MalParent =" + parentViewModel.MalParent + ", FemaleParent=" + parentViewModel.FemaleParent + " where IdCattle=" + parentViewModel.IdCattle + "");
            if (noOfRowUpdated == 1)
            {
                return RedirectToAction("Details", new { id = parentViewModel.IdCattle, message = "Bien editer", state = 1 });
            }
            else
            {
                return RedirectToAction("Details", new { id = parentViewModel.IdCattle, message = "Erreur dans l'edition", state = 0 });
            }
            return RedirectToAction("Details", new { id = parentViewModel.IdCattle, message = "Bien editer", state = 1 });

        }

        // GET: Cattle/Delete/5
        public ActionResult Delete(int id)
        {
            return PartialView(_dairyFarmService.GetCattleById(id));
        }

        // POST: Cattle/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            if (_dairyFarmService.DeleteCattle(id))
            {
                return RedirectToAction("Index", new { message = "Bien supprimer", state = 1 });
            }
            else
            {
                return RedirectToAction("Index", new { message = "Erreur dans la suppession", state = 0 });
                
            }

        }
        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        _db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}
