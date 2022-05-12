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
    
    var everyone = [listOfTournaments(type: "Everyone", tournaments: [Tournament(name: "Rocket League", description: "Rocket League is a fantastical sport-based video game, developed by Psyonix (it's “soccer with cars”). It features a competitive game mode based on teamwork and outmaneuvering opponents. Players work with their team to advance the ball down the field, and score goals in their opponents' net.", image: #imageLiteral(resourceName: "6609d2e1-62d9-4094-9cb7-26d9a7f5ba3f_2560x1440-071db7b0d39d5635f684940c1e3c4ec3")), Tournament(name: "Sonic Riders", description: "Sonic Riders is based around characters racing each other using devices known as Extreme Gear, anti-gravity-equipped vehicles consisting of hover boards, hover skates, and hover bikes. Players compete to finish three laps around a racetrack before their opponents and complete the race in first place.", image: #imageLiteral(resourceName: "83699918-599c-4471-955c-af182981587d"))])]
    
    var everyoneTen = [listOfTournaments(type: "Everyone 10+", tournaments: [Tournament(name: "Super Smash Bros. Ultimate", description: "Super Smash Bros. Ultimate is a platform fighter for up to eight players in which characters from Nintendo games and other third-party franchises must try to knock each other out of an arena.", image: #imageLiteral(resourceName: "smash special")), Tournament(name: "Test2", description: "Test Description 2", image: #imageLiteral(resourceName: "Screen Shot 2022-02-28 at 3.43.55 PM"))])]
    
    var teen = [listOfTournaments(type: "Teen", tournaments: [Tournament(name: "Dragon Ball FighterZ", description: "DRAGON BALL FighterZ is born from what makes the DRAGON BALL series so loved and famous: endless spectacular fights with its all-powerful fighters. Partnering with Arc System Works, DRAGON BALL FighterZ maximizes high end Anime graphics and brings easy to learn but difficult to master fighting gameplay.", image: #imageLiteral(resourceName: "capsule_616x353")), Tournament(name: "Lethal League Blaze", description: "Lethal League Blaze is an intense, high speed ball game, with unique characters, outta sight sounds and none of that weak stuff. In Shine City, the anti-gravity ball game has long been illegal. The group who kept playing was dubbed the Lethal League.", image: #imageLiteral(resourceName: "maxresdefault"))])]
    
    
    
    var mature = [listOfTournaments(type: "Mature", tournaments: [Tournament(name: "Rainbow Six Siege", description: "Rainbow Six Siege is a high-precision, tactical shooter that prioritises careful planning teamwork and finely tuned tactical play. Since its release in 2015, the game has radically expanded, adding extra maps, new operators, weapons, and themed seasonal events.", image: #imageLiteral(resourceName: "capsule_616x353(1)")), Tournament(name: "Mortal Kombat 11", description: "Mortal Kombat 11 is both the 11th fighting game and the 22nd installment in the Mortal Kombat series, developed by NetherRealm Studios, QLOC & Shiver and published by Warner Bros. Interactive Entertainment. It was released on April 23rd, 2019 for the PlayStation 4, Xbox One, Nintendo Switch, and Microsoft Windows via Steam.", image: #imageLiteral(resourceName: "SbTOirUJUZ3oNQG0eGDZAuCr"))])]

    override func viewDidLoad() {
        super.viewDidLoad()
        //tourneyTable.dataSource = self
        //tourneyTable.delegate = self
        tourneys.append(contentsOf: everyone)
        tourneys.append(contentsOf: everyoneTen)
        tourneys.append(contentsOf: teen)
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
