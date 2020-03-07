//
//  QuestCreateController.swift
//  NewRootes
//
//  Created by Alvaro Sanchez on 2/25/20.
//  Copyright © 2020 Alvaro Sanchez. All rights reserved.
//

import Photos
import UIKit
import Firebase
import MapKit


class QuestCreateController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate  {
    
    @IBOutlet weak var photoTaken: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextView!

    var Quest: [QuestLocation] = []
    
    var counter = 0
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self;
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("poto")
        
        self.descriptionTextField.layer.cornerRadius = 8;
        self.descriptionTextField.layer.borderWidth = 1.0;

    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        photoTaken.image = image
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func nextLocationPressed(_ sender: Any) {
        let Location = QuestLocation(Image: photoTaken.image, LocationDescription: descriptionTextField.text)
        Quest.append(Location)
        print(Quest)
        let userID = Auth.auth().currentUser!.uid
        var ref: DocumentReference? = nil
        let db = Firestore.firestore()
        ref = db.collection("Log").document("quest1")
        let timestamp = NSDate().timeIntervalSince1970
        let myTimeInterval = TimeInterval(timestamp)
        ref!.setData([
            "\(counter)": ["Description": descriptionTextField.text!, "URL": "photoURL"],
            "Time": myTimeInterval,
            "UserID": userID,
        ], merge: true)
        counter += 1
        self.photoTaken.image = nil
        self.descriptionTextField.text = ""
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self;
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            }
        
    }

    @IBAction func donePressed(_ sender: Any) {
        let userID = Auth.auth().currentUser!.uid
        var ref: DocumentReference? = nil
        let db = Firestore.firestore()
        ref = db.collection("Log").document("quest1")
        let timestamp = NSDate().timeIntervalSince1970
        let myTimeInterval = TimeInterval(timestamp)
        ref!.setData([
            "\(counter)": ["Description": descriptionTextField.text!, "URL": "photoURL"],
            "Time": myTimeInterval,
            "UserID": userID,
        ], merge: true)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
}
