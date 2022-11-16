//
//  ViewController.swift
//  SimpsonBook
//
//  Created by mesut alver on 6.11.2022.
//

import UIKit
 
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mySimpsons = [Simpsons]()
    var choosenSimpson : Simpsons?



    @IBOutlet weak var tableVİew: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableVİew.delegate = self
        tableVİew.dataSource = self
        
        //Simpson objects
        
        let homer = Simpsons(name: "Homer Simpson", job: "Engineer", image: UIImage(named: "Homer")!)
        let bart = Simpsons(name: "Bart Simpson", job: "Studen", image: UIImage(named: "Bart")!)
        let maggie = Simpsons(name: "Maggie Simpson", job: "Babby", image: UIImage(named: "Maggie")!)
        let marge = Simpsons(name: "Marge Simpson", job: "Housewife", image: UIImage(named: "Marge")!)
        let lisa = Simpsons(name: "Lisa Simpson", job: "Student", image: UIImage(named: "Lisa")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(bart)
        mySimpsons.append(maggie)
        mySimpsons.append(marge)
        mySimpsons.append(lisa)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenSimpson = mySimpsons[indexPath.row]	
        self.performSegue(withIdentifier: "todetailsVC", sender: nil)
        
    }
    
    
        
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "todetailsVC" {
           let destinationVC = segue.destination as! toDetailsVC
           destinationVC.selectedSimpson = choosenSimpson
       }
        
    }

    

}

