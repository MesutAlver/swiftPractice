//
//  MapVC.swift
//  foursquareClone
//
//  Created by mesut alver on 19.11.2022.
//

import UIKit
import MapKit
import Parse

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    

    var locationManager = CLLocationManager()
    
    
    
        
        override func viewDidLoad() {
            super.viewDidLoad()

            navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveButtonClicked))
        
            navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonClicked))
            
                
            mapView.delegate = self
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
            
            let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
            recognizer.minimumPressDuration = 3
            mapView.addGestureRecognizer(recognizer)
            
        }
        
    @objc func chooseLocation(gestureRecognizer: UIGestureRecognizer) {
            
            if gestureRecognizer.state == UIGestureRecognizer.State.began {
                
                let touches = gestureRecognizer.location(in: self.mapView)
                let coordinates = self.mapView.convert(touches, toCoordinateFrom: self.mapView)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinates
                annotation.title = PlaceModel.sharedInctance.placeName
                annotation.subtitle = PlaceModel.sharedInctance.placeType
                
                self.mapView.addAnnotation(annotation)
                
                
                PlaceModel.sharedInctance.placeLatitude = String(coordinates.latitude)
                PlaceModel.sharedInctance.placeLongitude = String(coordinates.longitude)
                
            }
            
        }
        
         
    
    
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            //locationManager.stopUpdatingLocation()
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
    
    @objc func saveButtonClicked() {
        //PARSE
        // veri taban??nda s??n??f olu??turma ve verileri kaydetme.
        
        
        let placeModel = PlaceModel.sharedInctance
        
        let object = PFObject(className: "Places")
        object["name"] = placeModel.placeName
        object["type"] = placeModel.placeType
        object["atmosphere"] = placeModel.placeAtmosphere
        object["latitude"] = placeModel.placeLatitude
        object["longitude"] = placeModel.placeLongitude
            
        if let imageData = placeModel.placeImage.jpegData(compressionQuality: 0.5) {
            object["image"] = PFFileObject(name: "image.jpg", data: imageData)
        }
        
        object.saveInBackground { succes, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
                
            } else {
                self.performSegue(withIdentifier: "fromMapVCtoPlacesVC", sender: nil)
            }
        }
        
    }
    
    @objc func backButtonClicked() {
        
        self.dismiss(animated: true)
        
    }
    

}
