//
//  TournamentTableViewController.swift
//  kapstone the squel
//
//  Created by Lisette Antigua on 3/4/22.
//

import UIKit

class TournamentTableViewController: UITableViewController {

    @IBOutlet var tourneyTable: UITableView!
   
    var tourneys = [listOfTournaments]()
    
    var everyone = [listOfTournaments(type: "Everyone", tournaments: [Tournament(name: "Test1", description: "Test Description 1", image: #imageLiteral(resourceName: "Screen Shot 2022-02-28 at 3.43.55 PM")), Tournament(name: "Test2", description: "Test Description 2", image: #imageLiteral(resourceName: "Screen Shot 2022-02-28 at 3.43.55 PM"))])]
    
    var mature = [listOfTournaments(type: "Mature", tournaments: [Tournament(name: "Test1", description: "Test Description 1", image: #imageLiteral(resourceName: "Screen Shot 2022-02-28 at 3.43.55 PM")), Tournament(name: "Test2", description: "Test Description 2", image: #imageLiteral(resourceName: "Screen Shot 2022-02-28 at 3.43.55 PM"))])]

    override func viewDidLoad() {
        super.viewDidLoad()
        //tourneyTable.dataSource = self
        //tourneyTable.delegate = self
        tourneys.append(contentsOf: everyone)
        tourneys.append(contentsOf: mature)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       
         return tourneys.count

        

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        tourneys[section].tournaments.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tourney", for: indexPath)
     
        let announce2 = tourneys[indexPath.section].tournaments[indexPath.row]
        //let announce2 = tourneys.section[indexPath.row]
       
        cell.textLabel?.text = (announce2.name)
        cell.detailTextLabel?.text = announce2.description
        cell.imageView?.image = announce2.image


        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let announce = tourneys[section]
        
        return announce.type
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? TournamentsDetailsViewController {
            destination.allTourneys = tourneys[(tourneyTable.indexPathForSelectedRow?.section)!]
            destination.indexpath = tourneyTable.indexPathForSelectedRow?.row ?? 0
            tourneyTable.deselectRow(at: tourneyTable.indexPathForSelectedRow!, animated: true)
    }
        
        
    }


}
