//
//  FeedViewController.swift
//  NewRootes
//
//  Created by Alvaro Sanchez on 2/22/20.
//  Copyright © 2020 Alvaro Sanchez. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import Firebase

class FeedViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var cameraImage: UIImageView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("pato")
    
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        self.performSegue(withIdentifier: K.createSegue, sender: self)
    }
    
}
