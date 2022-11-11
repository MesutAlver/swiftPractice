//
//  ViewController.swift
//  actorBook
//
//  Created by mesut alver on 7.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayMatrix = [Matrix]()
    var matrixCasts : Matrix?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //matrix objects
        
        let morpheus = Matrix(name: "Laurence Fishburne", nameInFilm: "Morpheus", age: 61, image: UIImage(named: "morpheus")!)
        let neo = Matrix(name: "Keanu Reeves", nameInFilm: "Neo", age: 58, image: UIImage(named: "neo")!)
        let trinity = Matrix(name: "Carrie-Anne Moss", nameInFilm: "Trinity", age: 55, image: UIImage(named: "trinity")!)
        let smith = Matrix(name: "Hugo Weaving", nameInFilm: "Smith", age: 62, image: UIImage(named: "smith")!)
        let cypher = Matrix(name: "Joe Pantoliano", nameInFilm: "Cyper", age: 71, image: UIImage(named: "cypher")!)

        
        arrayMatrix.append(morpheus)
        arrayMatrix.append(neo)
        arrayMatrix.append(trinity)
        arrayMatrix.append(smith)
        arrayMatrix.append(cypher)

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
    }
    
    
    @objc func addButton() {
            // segue
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMatrix.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayMatrix[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        matrixCasts = arrayMatrix[indexPath.row]
        self.performSegue(withIdentifier: "toSecondView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {
            let destinationVC = segue.destination as! toSecondView
            destinationVC.selectedMatrix = matrixCasts
            
        }
    }
    


}

