//
//  Signout.swift
//  kapstone the squel
//
//  Created by Julian Jackson on 5/3/22.
//

import UIKit
import Firebase
class Signout: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOut(_ sender: Any) {

           

            // 1

            guard let user = Auth.auth().currentUser else { return }

           

              // 4

              do {

                try Auth.auth().signOut()

                self.navigationController?.popToRootViewController(animated: true)

              } catch let error {

                print("Auth sign out failed: \(error)")

              }

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
