//
//  ViewController.swift
//  ToDoList
//
//  Created by rushabh on 20/02/17.
//  Copyright © 2017 CentennialCollege. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    var listItems = [NSManagedObject] ()
   
    
    
    @IBAction func btnEdit(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      //  self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(ViewController.addItem))
    }
    
    //func addItem(){
        
     //   let alertController = UIAlertController(title: "Type Something" , message: "Type.. ", preferredStyle: UIAlertControllerStyle.alert)
        
   //     let confirmAction = UIAlertAction(title: "Type", style: UIAlertActionStyle.default, handler: ({
      //      (_) in
   
     //        let field = alertController.textFields![0] as? UITextField {
            
            
     //   }
            
     //   ))
  //  }
    
    func saveItem(itemToSave : String){
        
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        let managedContext = appDelegate.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ListItems", in: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertInto: managedContext)
     
        do{
            try managedContext.save()
            listItems.append(item)
        }
        catch{
            
            print("error")
        }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
    //    cell.textLabel?.text=listItems[indexPath.row]
        return cell
    }
}

