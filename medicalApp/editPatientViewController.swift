//
//  editPatientViewController.swift
//  medicalApp
//
//  Created by Edouard Long on 19/01/2018.
//  Copyright © 2018 Edouard Long. All rights reserved.
//

import UIKit

class editPatientViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var dateOfAdmissionTextField: UITextField!
    
    @IBOutlet weak var natureOfInjuryTextField: UITextField!
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var seriousSelector: UISegmentedControl!
    
    var patientID:Int!
    
    
    @IBAction func updatePressed(_ sender: Any) {
        
        // create a new patient instance
        let newPatient:Patient = Patient(name: nameTextField.text, DOB: dateOfBirthTextField.text, doctor: doctorNameTextField.text, dateAdmitted: dateOfAdmissionTextField.text, natureOfInjury: natureOfInjuryTextField.text, injurySeriousIndex: seriousSelector.selectedSegmentIndex + 1, idNumber: patientData[patientID].idNumber)
        
        // update the patient
        patientData[patientID] = newPatient
        
        // return to table view
        self.performSegue(withIdentifier: "returnToTable", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // populate data
        nameTextField.text = patientData[patientID].name
        dateOfBirthTextField.text = patientData[patientID].DOB
        dateOfAdmissionTextField.text = patientData[patientID].dateAdmitted
        natureOfInjuryTextField.text = patientData[patientID].natureOfInjury
        doctorNameTextField.text = patientData[patientID].doctor
        seriousSelector.selectedSegmentIndex = patientData[patientID].injurySeriousIndex - 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
