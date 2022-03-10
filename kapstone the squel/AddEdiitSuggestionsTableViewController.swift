//
//  AddEdiitSuggestionsTableViewController.swift
//  kapstone the squel
//
//  Created by Lisette Antigua on 3/9/22.
//

import UIKit

class AddEdiitSuggestionsTableViewController: UITableViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var suggest:Suggestions?
    
    @IBOutlet weak var gameLink: UITextField!
    @IBOutlet weak var gameRating: UITextField!
    @IBOutlet weak var gameName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    init?(coder:NSCoder, suggest:Suggestions?)
    {
    self.suggest = suggest
    super.init(coder:coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            let alertController = UIAlertController(title:
               "Choose Image Source", message: nil,
               preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel",
               style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let cameraAction = UIAlertAction(title: "Camera",
                   style: .default, handler: { action in
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true, completion: nil)
                })
                alertController.addAction(cameraAction)
            }
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let photoLibraryAction = UIAlertAction(title: "Photo Library",
                   style: .default, handler: { action in
                    imagePicker.sourceType = .photoLibrary
                    self.present(imagePicker, animated: true, completion: nil)
                })
                alertController.addAction(photoLibraryAction)
            }
            alertController.popoverPresentationController?.sourceView = sender
            present(alertController, animated: true, completion: nil)
      
    }
    func updateSaveButtonState() {
        let nameText = gameName.text ?? ""
        saveButton.isEnabled = true
        
    }

    func imagePickerController(_ picker: UIImagePickerController,
       didFinishPickingMediaWithInfo info:
       [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as?
               UIImage else { return }
            imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        if let suggest = suggest { gameName.text = suggest.gameName
            gameRating.text = suggest.rating
            imageView.image = suggest.image
            gameLink.text = suggest.link
                title = "Edit Emoji" } else {
                    title = "Add Emoji"
                    
                }
        updateSaveButtonState()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { guard segue.identifier == "saveUnwind"
        else {
        return
            
        }
     
        let name = gameName.text ?? "No Text"
        let rating =  gameRating.text ?? ""
        let image = imageView.image ?? #imageLiteral(resourceName: "CSGOcoverMarch2020")
        let link = gameLink.text ?? ""
        suggest = Suggestions(gameName: name, rating: rating, image: image, link: link)
        
    }
    
}
