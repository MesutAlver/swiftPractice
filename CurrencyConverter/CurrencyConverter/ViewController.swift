//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by mesut alver on 11.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var jpnLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1- Request & Session
        // 2- Response - Data
        // 3- Parsing: veriyi işlemek ya da JSON serialization
        
        
        // 1- Request işlemleri
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        let session = URLSession.shared
        
        //closure
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                
                //2- Response işlemleri
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC-thread işlemi
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                //print(rates)
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                    
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                        
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                    
                                }
                                if let jpn = rates["JPN"] as? Double {
                                    self.jpnLabel.text = "JPN: \(jpn)"
                                    
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                    
                                }
                                if let tryl = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(tryl)"
                                    
                                }
                
                            }
                        }
                        
                        
                    } catch {
                        print("Error")
                    }
                    
                    
                }
                
            }
        }
        task.resume()
        
        
    }
    

}

