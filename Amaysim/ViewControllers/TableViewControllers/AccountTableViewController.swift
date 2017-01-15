//
//  AccountTableViewController.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import UIKit
import Foundation

class AccountTableViewController: UITableViewController {

    
    let account =                           Accounts.sharedInstance
    let keys =                              [ "title", "firstName", "lastName", "dateOfBirth", "contactNumber", "email", "relatedServices"]
    var members: [String: String] =         [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mirrored_object = Mirror(reflecting: account)
        
        for (index, attr) in mirrored_object.children.enumerated() {
            if let property_name = attr.label as String! {
                members["\(property_name)"] = "\(attr.value)"
                print("Attr \(index): \(property_name) = \(attr.value)")
            }
        }
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return keys.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountsReuseIdentifier", for: indexPath)
        cell.textLabel?.text =                          keys[indexPath.row]
        if indexPath.row == keys.count - 1 {
            cell.detailTextLabel?.text =                account.relatedServices?[0].MSN
            cell.accessoryType =                        .disclosureIndicator
            cell.selectionStyle =                       .blue

        } else {
            cell.detailTextLabel?.text =                members[keys[indexPath.row]]
            cell.selectionStyle =                       .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == keys.count - 1 {
            self.performSegue(withIdentifier: "toServicesTableVCSegue", sender: self)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
