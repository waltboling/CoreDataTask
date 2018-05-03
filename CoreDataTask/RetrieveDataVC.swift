//
//  RetrieveDataVC.swift
//  CoreDataTask
//
//  Created by Jon Boling on 5/2/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit
import CoreData

class RetrieveDataVC: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var retrieveTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                retrieveTextField.text = data.value(forKey:"itemText") as? String
            }
        } catch {
            print("Failed Retrieval")
        }
    }
}
