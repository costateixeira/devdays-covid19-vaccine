### Devdays November 2020


#### Adverse Event Reporting

Modeled after the US Vaccine Adverse Event Reporting System (VAERS) https://vaers.hhs.gov/index.html

##### VAERS Fields

* = required

Report Information:
* Report date
* Reporter
* Relation to patient (self, practitioner, related person)
* Reporter address
* Reporter phone
* Reporter email
* Practitioner contact

Facility Information:
* Facility name
* Fax
* Address
* Phone
* Type of facility (Doctors office or urgent care or hospital, pharmacy or store, workplace clinic, public health clinic, nursing home or senior living facility, school or student health clinic, other, unknown)

Patient Data:
* Patient name, first, last
* Address
* Phone 
* Email
* **DOB**
* **Sex (M/F/U)**
* Pregnant (Y/N/U)
* Medications
* Allergies
* Illnesses (at time of vaccination or 1 month before)
* Chronic or long-standing conditions

Vaccination Information:
* Date and Time of Vaccination
* Type and brand name
* Manufacturer
* Lot Number
* Route
* Body Site
* Dose number in series

Event Information:
* **Onset (date/time)**
* **Verbatim (text)**
* MedDRA Preferred or Lowest Level Term
* Intensity (CTCAE Grade 1-5)
* Related medical and laboratory tests

Result Information:
* Patient recovered? (yes, no, unknown)
* **Outcome** (Office visit, ED visit, Hospitalization, Prolongation of existing hospitalization, life threatening illness, disability or permanent damage, death, congenital anomaly or birth defect, none of above)
* If death, date:
* If hospitalization:
  * Hospital name
  * Address


##### Terminology

* CTCAE (Common Terminology Criteria for Adverse Events) is an assessment scale from grade 1 (minor) to grade 5 (death). The definition of grades are specific to the type of AE
* MEDRA is used to describe the physical disorder of the adverse event. Either the preferred term (PT) or lowest level term (LLT) should be used.

##### Profiling AdverseEvent (FHIR R4)

> Note: AdverseEvent has significant changes between FHIR R4 and R5. This exercise is based on R4.

| VAERS Field  | AdverseEvent Field | Profile Action |
|--------------|--------------------|----------------|
| Vaccination  | suspectEntity.instance | restrict to Reference(Immunization) |
| Event description | event.text  | change to 1..1
| Event code |  event.coding  | restrict to MEDdra codes |
| Event grade |  none  |  add extension, restrict to CTCAE Grades |
| Outcome | seriousness | make existing value set required |

