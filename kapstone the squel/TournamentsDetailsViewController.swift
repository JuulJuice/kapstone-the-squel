//
//  TournamentsDetailsViewController.swift
//  kapstone the squel
//
//  Created by Lisette Antigua on 3/7/22.
//

import UIKit

class TournamentsDetailsViewController: UIViewController {
    @IBOutlet weak var tName: UILabel!
    var allTourneys: listOfTournaments!
    var indexpath:Int = 0
    
    @IBOutlet weak var tDescription: UITextView!
 
    
    @IBOutlet weak var tImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tName.text = "\((allTourneys.tournaments[indexpath].name))"
        tDescription.text = "\((allTourneys.tournaments[indexpath].description))"
        
        tImage.image = ((allTourneys.tournaments[indexpath].image))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
