//
//  AddEdiitSuggestionsTableViewController.swift
//  kapstone the squel
//
//  Created by Lisette Antigua on 3/9/22.
//

import UIKit

class AddEdiitSuggestionsTableViewController: UITableViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    var suggest:Suggestions?
    
    @IBOutlet weak var gameGenre: UIPickerView!
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
    var selected: String{
        return UserDefaults.standard.string(forKey: "selected") ?? ""
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var pickerData: [String] = [String]()

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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    override func viewDidLoad() {
        pickerData = ["Sandbox", "Shooters", "Multiplayer online battle arena (MOBA)", "Simulation", "Sports", "Action"]
        
        gameGenre.delegate = self
        gameGenre.dataSource = self
        
       
        if let suggest = suggest {
            gameName.text = suggest.gameName
            gameRating.text = suggest.rating
            imageView.image = suggest.image
            gameLink.text = suggest.genre
            if let row = pickerData.firstIndex(of: suggest.genre){
            gameGenre.selectRow(row, inComponent: 0, animated: true)
            }
           
                title = "Edit Game" } else {
                    title = "Add Game"
                    
                }
        updateSaveButtonState()

    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gameLink.text = pickerData[row]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { guard segue.identifier == "saveUnwind"
        else {
        return
            
        }
     
        let name = gameName.text ?? "No Text"
        let rating =  gameRating.text ?? ""
        let image = imageView.image ?? #imageLiteral(resourceName: "CSGOcoverMarch2020")
        let genre = gameLink.text ?? ""
        suggest = Suggestions(gameName: name, rating: rating, image: image, genre: genre)
        
    }
    
}
