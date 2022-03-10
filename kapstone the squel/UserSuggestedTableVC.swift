//
//  UserSuggestedTableVC.swift
//  kapstone the squel
//
//  Created by Jonathan Tarver on 3/9/22.
//

import UIKit

class UserSuggestedTableVC: UITableViewController {

    
    var userSuggest:[Suggestions] = [Suggestions(gameName: "Counter Strike: Global Offense", rating: "M", image: #imageLiteral(resourceName: "CSGOcoverMarch2020"), link: "")]
    override func viewDidLoad() {
        super.viewDidLoad()

       
      //  self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindToUserSuggestionTable(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind", let sourceViewController = segue.source as? AddEdiitSuggestionsTableViewController, let suggest = sourceViewController.suggest else { return }
        if let selectedIndexPath = tableView.indexPathForSelectedRow { userSuggest[selectedIndexPath.row] = suggest
            tableView.reloadRows(at: [selectedIndexPath], with: .none) } else { let newIndexPath = IndexPath(row: userSuggest.count, section: 0)
                userSuggest
                .append(suggest)
            tableView.insertRows(at: [newIndexPath], with: .automatic) }
    }
    @IBSegueAction func addEditSuggestions(_ coder: NSCoder, sender: Any?) -> AddEdiitSuggestionsTableViewController? {
        if let cell = sender as? UITableViewCell
            , let indexPath = tableView.indexPath(for: cell){
            
            let suggestionEdit = userSuggest[indexPath.row]
        return AddEdiitSuggestionsTableViewController(coder: coder, suggest: suggestionEdit)
    }
    
    else{
        return AddEdiitSuggestionsTableViewController(coder: coder, suggest: nil)
    }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userSuggest.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestionCell", for: indexPath)

        let suggestions = userSuggest[indexPath.row]

        var content = cell.defaultContentConfiguration()

        content.text = "\(suggestions.gameName)"
        content.image = suggestions.image


        cell.contentConfiguration = content


        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            userSuggest.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
