Instance: immunization-adverse-event-example
InstanceOf: ImmunizationAdverseEvent
Title: "Immunization Adverse Event Example"
Description: "Anaphylactic reaction to COVID-19 vaccination"
* subject = Reference(mary-roe)
* category = SCT#264519003 // Drug reaction (qualifier value)
* event = MDR#10002198 "Anaphylatcic reaction"
* event.text = "Anaphylaxis self-reported, self-treated by Epi pen."
* extension[grade].valueCodeableConcept = SCT#6736007 "Moderate (severity modifier) (qualifier value)"
* seriousness = AES#non-serious "Non-serious"
* date = "2020-10-31"
* recordedDate = "2020-11-02"
* outcome = AEO#resolved
* recorder = Reference(mary-roe)  // self-reported
* suspectEntity.instance = Reference(Immunization/immunizationprofile-example)
* suspectEntity.causality.assessment = AEA#probably-likely "Probably/Likely"


Instance: mary-roe
InstanceOf: Patient
Description: "Patient Example"
* identifier.use = #usual
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR "Medical Record Number"
* identifier.system = "http://hospital.example.org"
* identifier.value = "m123"
* name.family = "Roe"
* name.given[0] = "Mary"
* contact.telecom[0].system = #phone
* contact.telecom[0].value = "555-555-5555"
* contact.telecom[0].use = #home
* contact.telecom[1].system = #email
* contact.telecom[1].value = "mary.roe@example.com"
* gender = #female
* birthDate = "1958-01-20"
* address.line = "123 Main St"
* address.city = "Anytown"
* address.postalCode = "12345"
* address.country = "US"
* communication.language = urn:ietf:bcp:47#en-US "English (Region=United States)"
* communication.language.text = "English"
