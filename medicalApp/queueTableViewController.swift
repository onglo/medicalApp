//
//  queueTableViewController.swift
//  medicalApp
//
//  Created by Edouard Long on 26/01/2018.
//  Copyright © 2018 Edouard Long. All rights reserved.
//

import UIKit

class queueTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func dequeuePatient(_ sender: Any) {
        
        let dequeued = patients.dequeItem()
        
        let alert = UIAlertController(title: "Patient \(dequeued.name) dequeued", message: "He was seen by doctor: \(dequeued.doctor!)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
        
        tableView.reloadData()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return patients.returnQueue().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(patients.returnQueue())
        if (patients.returnQueue().count == 0) {
            // if there is no patient data return cell saaying there is no data
            let cell = tableView.dequeueReusableCell(withIdentifier: "noData")
            return cell!
        }
            
        else {
            
            let patientInfo = patients.returnQueue()
            
            let patientCell:patientTableViewCell = tableView.dequeueReusableCell(withIdentifier: "patientCell") as! patientTableViewCell
            
            patientCell.nameLabel.text = "\(String(describing: patientInfo[indexPath.row].name!)) - \(String(describing: patientInfo[indexPath.row].idNumber!))"
            
            patientCell.datesLabel.text = "DOB:\(String(describing: patientInfo[indexPath.row].DOB!)), Date Admitted:\(String(describing: patientInfo[indexPath.row].dateAdmitted!))"
            
            patientCell.priorityLabel.text = "Priority: \(String(describing: patientInfo[indexPath.row].injurySeriousIndex!))"
            
            return patientCell
        }
    }
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
