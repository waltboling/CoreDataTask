//
//  ViewController.swift
//  CoreDataTask
//
//  Created by Jon Boling on 5/2/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a 
    }
    
    
    @IBAction func saveButtonWasTapped(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
        
        let userText = NSManagedObject(entity: entity!, insertInto: context)
        userText.setValue(inputTextField.text, forKey: "itemText")
        
        do {
            try context.save()
        } catch {
            print("Failed save")
        }
    }
    
    @IBAction func showButton(_ sender: Any) {
        performSegue(withIdentifier: "toNewView", sender: self)
    }
}

