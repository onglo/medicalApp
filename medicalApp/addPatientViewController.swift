//
//  addPatientViewController.swift
//  medicalApp
//
//  Created by Edouard Long on 16/01/2018.
//  Copyright © 2018 Edouard Long. All rights reserved.
//

import UIKit

class addPatientViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var dateOfAdmissionTextField: UITextField!
    
    @IBOutlet weak var natureOfInjuryTextField: UITextField!
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var seriousSelector: UISegmentedControl!
    
    var patientId:Int!
    
    @IBAction func addPatientPressed(_ sender: Any) {
        
        // generate a patient id
        patientId = Int(arc4random())
        
        // create a new patient instance and push it into the patient array
        let newPatient:Patient = Patient(name: nameTextField.text, DOB: dateOfBirthTextField.text, doctor: doctorNameTextField.text, dateAdmitted: dateOfAdmissionTextField.text, natureOfInjury: natureOfInjuryTextField.text, injurySeriousIndex: seriousSelector.selectedSegmentIndex, idNumber: patientId)
        
        patientData.append(newPatient)
        
        patients.addItemToQueue(itemToAdd: newPatient)
        
        print(patientData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! medicationViewController
        dest.id = patientId
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
