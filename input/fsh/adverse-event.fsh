Alias: MDR = http://terminology.hl7.org/CodeSystem/MDRAE
Alias: SCT = http://snomed.info/sct
Alias: AES = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness
Alias: AEO = http://terminology.hl7.org/CodeSystem/adverse-event-outcome
Alias: AEA = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess
/*
Profile changes on AdverseEvent:

| AdverseEvent Field | Profiling |
|--------------------|----------------|
| subject | restrict to Reference(Patient) |
| actuality | fix to #actual |
| category | fix to SCT#264519003 // Drug reaction (qualifier value) |
| suspectEntity.instance | restrict to Reference(Immunization) |
| event.text  | change to 1..1 |
| event.coding  | restrict to MEDdra codes |
| severity  |  change to 0..0 |
| none | add "grade" extension, restrict to the 5 CTCAE Grades* |
| seriousness | reduce value set to source, not-serious |

*/

Profile: ImmunizationAdverseEvent
Parent: AdverseEvent
Title: "Immunization Adverse Event Profile"
Id: immunization-adverse-event
Description: "Profile of adverse event, specialized for immunizations"
* subject only Reference(Patient)
* actuality = #actual
* category 1..*
* category = SCT#264519003 // Drug reaction (qualifier value)
* suspectEntity.instance only Reference(Immunization)
* event 1..1
* event from MedDRA_VS (required)
* event.text 1..1
* severity 0..0
* extension contains AdverseEventGrade named grade 0..1
* seriousness from AdverseEventSeriousness_VS

Extension: AdverseEventGrade
Id: adverse-event-grade
Title: "Adverse Event Grade Extension"
Description: "The grade associated with the severity of an adverse event, using CTCAE criteria. See https://ctep.cancer.gov/protocolDevelopment/electronic_applications/ctc.htm"
* value[x] only CodeableConcept
* value[x] from AdverseEventGrade_VS

ValueSet: MedDRA_VS
Id: meddra-value-set
Title: "MedDRA Value Set"
Description: "All codes from Medical Dictionary for Regulatory Activities Terminology (MedDRA), American English Equivalents, Version 7.0."
* include codes from system MDR // where concept in PT or LLT?

ValueSet: AdverseEventGrade_VS
Id: adverse-event-grade-value-set
Title: "Adverse Event Grade Value Set"
Description: "Five grades associated with the severity of an adverse event."
//* include codes from SCT where concept is-a #446401000124104 "National Cancer Institute common terminology criteria for adverse event grade finding (finding)"
* SCT#255604002 "Mild (qualifier value)"
* SCT#6736007 "Moderate (severity modifier) (qualifier value)"
* SCT#24484000 "Severe (severity modifier) (qualifier value)"
* SCT#442452003 "Life threatening severity (qualifier value)"
* SCT#399166001 "Fatal (qualifier value)"

ValueSet: AdverseEventSeriousness_VS
Id: adverse-event-seriousness-value-set
Title: "Adverse Event Seriousness Value Set"
Description: "An adverse event is considered serious if it results in any of the following outcomes: (1) Death, (2) Life-threatening experience 3) Inpatient hospitalization or prolongation of existing hospitalization (for > 24 hours) (4) Persistent or significant incapacity or substantial disruption of the ability to conduct normal life functions, (5) Congenital anomaly/birth defect, or (6) Important Medical Event (IME) that may jeopardize the patient or subject and may require medical or surgical intervention to prevent one of the outcomes listed in this definition. Reference: https://crawb.crab.org/txwb/CRA_MANUAL/Vol1/chapter%2013_Serious%20Adverse%20Events.pdf"
* AES#non-serious "Non-serious"
* AES#serious "Serious"