//
//  HistoryTableViewController.swift
//  Tip Calc
//
//  Created by Thao Tran Thi Phuong on 1/30/17.
//  Copyright © 2017 Thao Tran Thi Phuong. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    var array = [String]()
    var defaults = UserDefaults.standard
    var billNumber = (UserDefaults.standard.integer(forKey: "billNumber"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return billNumber
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        array = (defaults.array(forKey: "bill No." + String(indexPath.row+1)) ?? ["", "", "", ""]) as! [String]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "HistoryCell")

        cell.textLabel?.text = array[4]
        cell.detailTextLabel?.text = "total: array[2] - tip: array[1]"
        return cell
    }
    
    @IBAction func onClearHistory(_ sender: Any) {
        for bill in 0...billNumber{
            defaults.removeObject(forKey: "bill No."+String(bill))
        }
        defaults.set(0, forKey: "billNumber")
        billNumber = 0
        
        tableView.reloadData()
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
