//
//  viewPatientsTableViewController.swift
//  medicalApp
//
//  Created by Edouard Long on 19/01/2018.
//  Copyright © 2018 Edouard Long. All rights reserved.
//

import UIKit

class viewPatientsTableViewController: UITableViewController, UISearchBarDelegate {
    
    var segueData:Int!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // keeps track of if we are searching
    var searching = false
    
    // array holds current search results
    var searchResuls = [Patient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // check if we are currenlty searching
        if searching {
            
            if searchResuls.count == 0 {
                return 1
            }
            else {
                return searchResuls.count
            }
        }
        
        // check if there is patient data if not we will put in a placeholder
        if (patientData.count == 0) {
            return 1
        }
        else {
            return patientData.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (patientData.count == 0 || (searching == true && searchResuls.count == 0)) {
            // if there is no patient data return cell saaying there is no data
            let cell = tableView.dequeueReusableCell(withIdentifier: "noData")
            return cell!
        }
        
        
        // check if we are searching
        if searching {
            let patientCell:patientTableViewCell = tableView.dequeueReusableCell(withIdentifier: "patientCell") as! patientTableViewCell
            
            patientCell.nameLabel.text = "\(String(describing: searchResuls[indexPath.row].name!)) - \(String(describing: searchResuls[indexPath.row].idNumber!))"
            
            patientCell.datesLabel.text = "DOB:\(String(describing: searchResuls[indexPath.row].DOB!)), Date Admitted:\(String(describing: searchResuls[indexPath.row].dateAdmitted!))"
            
            patientCell.priorityLabel.text = "Priority: \(String(describing: searchResuls[indexPath.row].injurySeriousIndex!))"
            
            return patientCell
        }
        
        else {
            
            let patientCell:patientTableViewCell = tableView.dequeueReusableCell(withIdentifier: "patientCell") as! patientTableViewCell
            
            patientCell.nameLabel.text = "\(String(describing: patientData[indexPath.row].name!)) - \(String(describing: patientData[indexPath.row].idNumber!))"
            
            patientCell.datesLabel.text = "DOB:\(String(describing: patientData[indexPath.row].DOB!)), Date Admitted:\(String(describing: patientData[indexPath.row].dateAdmitted!))"
            
            patientCell.priorityLabel.text = "Priority: \(String(describing: patientData[indexPath.row].injurySeriousIndex!))"
            
            return patientCell
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // delete the value from the array
            patientData.remove(at: indexPath.row)
            
            // updatetableview
            self.tableView.reloadData()
            
            
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // check that there is data
        if (patientData.count != 0) {
            
            // tell the segue which patient we need and segue to next screen
            segueData = indexPath.row
            self.performSegue(withIdentifier: "editPatient", sender: nil)
        }
        
    }
    
    // executed when we are searching
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // check if there is text
        if searchBar.text == "" || searchBar.text == nil {
            // reset the table
            searching = false
            view.endEditing(true)
            self.tableView.reloadData()
        }
        else {
            searching = true
            
            // set search results
            searchResuls = (patientData.filter({$0.name.lowercased().range(of: (searchBar.text?.lowercased())!) != nil}))
            
            tableView.reloadData()
        }
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // check going to edit patient
        if segue.identifier == "editPatient" {
            
            // set patient id in editVC
            let editView:editPatientViewController = segue.destination as! editPatientViewController
            
            editView.patientID = segueData
            
        }
        
        
    }
 

}
