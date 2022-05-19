//
//  Signup.swift
//  kapstone the squel
//
//  Created by Julian Jackson on 5/3/22.
//

import UIKit
import Firebase

class Signup: UIViewController {

    // MARK: Constants

     let loginToList = "LoginToList"

      

     // MARK: Outlets

     @IBOutlet weak var enterEmail: UITextField!

     @IBOutlet weak var enterPassword: UITextField!



     // MARK: Properties

     var handle: AuthStateDidChangeListenerHandle?



     override var preferredStatusBarStyle: UIStatusBarStyle {

       return .lightContent

     }



     // MARK: UIViewController Lifecycle

     override func viewDidLoad() {

       super.viewDidLoad()

        // enterEmail.delegate = self

         //enterPassword.delegate = self

     }



     override func viewWillAppear(_ animated: Bool) {

       super.viewWillAppear(animated)

       navigationController?.setNavigationBarHidden(true, animated: false)

       handle = Auth.auth().addStateDidChangeListener { _, user in

         if user == nil {

        //   self.navigationController?.popToRootViewController(animated: true)

         } else {

           self.performSegue(withIdentifier: self.loginToList, sender: nil)



           

           self.enterEmail.text = nil

           self.enterPassword.text = nil

             

         }

       }

     }

       @IBAction func signUpDidTouch(_ sender: AnyObject) {

         guard

           let email = enterEmail.text,

           let password = enterPassword.text,

           !email.isEmpty,

           !password.isEmpty

         else { return }



         Auth.auth().createUser(withEmail: email, password: password) { _, error in

           if error == nil {

             Auth.auth().signIn(withEmail: email, password: password)

               

           } else {

             print("Error in createUser: \(error?.localizedDescription ?? "")")

           }

         }

       }

       @IBAction func forgotPassword(_ sender: Any) {

           

           Auth.auth().sendPasswordReset(withEmail: enterEmail.text!) { error in

                      DispatchQueue.main.async {

                          if self.enterEmail.text?.isEmpty==true || error != nil {

                              let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)

                              resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                              self.present(resetFailedAlert, animated: true, completion: nil)

                          }

                          if error == nil && self.enterEmail.text?.isEmpty==false{

                              let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)

                              resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                              self.present(resetEmailAlertSent, animated: true, completion: nil)

                          }

                      }

                  }

       }

       

     override func viewWillDisappear(_ animated: Bool) {

       super.viewWillDisappear(animated)

       navigationController?.setNavigationBarHidden(false, animated: false)

     }



     override func viewDidDisappear(_ animated: Bool) {

       super.viewDidDisappear(animated)

       guard let handle = handle else { return }

       Auth.auth().removeStateDidChangeListener(handle)

     }



     // MARK: Actions

     @IBAction func loginDidTouch(_ sender: AnyObject) {

       guard

         let email = enterEmail.text,

         let password = enterPassword.text,

         !email.isEmpty,

         !password.isEmpty

       else { return }



       Auth.auth().signIn(withEmail: email, password: password) { user, error in

         if let error = error, user == nil {

           let alert = UIAlertController(

             title: "Sign In Failed",

             message: error.localizedDescription,

             preferredStyle: .alert)



           alert.addAction(UIAlertAction(title: "OK", style: .default))

           self.present(alert, animated: true, completion: nil)

         }

       }

     }



    

   }



   // MARK: - UITextFieldDelegate

   extension Signup: UITextFieldDelegate {

     func textFieldShouldReturn(_ textField: UITextField) -> Bool {

       if textField == enterEmail {

         enterPassword.becomeFirstResponder()

       }



       if textField == enterPassword {

         textField.resignFirstResponder()

       }

       return true

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

