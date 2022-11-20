//
//  PlaceModel.swift
//  foursquareClone
//
//  Created by mesut alver on 19.11.2022.
//

import Foundation
import UIKit

class PlaceModel {
    
    static let sharedInctance = PlaceModel()
 
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    
    
    private init() {
        
    }
}
