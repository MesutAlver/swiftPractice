//
//  AddPlaceVC.swift
//  foursquareClone
//
//  Created by mesut alver on 19.11.2022.
//

import UIKit

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var placeNameText: UITextField!
    
    @IBOutlet weak var placeTypeText: UITextField!
    
    @IBOutlet weak var atmosphereText: UITextField!
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //imageview'a tıklanmasını sağlama
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        placeImageView.isUserInteractionEnabled = true
        placeImageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func selectImage() {
        // galeriden fotoğraf seçme
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker,animated: true)
        
    }
    
    
    // gorsel seçilince ne yapacagımızı seçeceğimiz fonksiyon
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if placeNameText.text != nil && placeTypeText.text != nil && atmosphereText.text != nil {
            if let chosenImage = placeImageView.image {
                let placeModel = PlaceModel.sharedInctance
                 placeModel.placeName = placeNameText.text!
                 placeModel.placeType = placeTypeText.text!
                 placeModel.placeAtmosphere = atmosphereText.text!
                 placeModel.placeImage = chosenImage
                
        
            }
            performSegue(withIdentifier: "toMapVC", sender: nil)
        }else {
            let alert = UIAlertController(title: "Error", message: "Place/ Name/ Atmopsphere ??", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            self.present(alert,animated: true)
        }
       
        
        
    }
    
    
}
