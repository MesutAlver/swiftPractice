//
//  thirdView.swift
//  FirstSwiftUIApp
//
//  Created by mesut alver on 28.11.2022.
//

import SwiftUI

struct thirdView: View {
    
    let myArray = ["james","lars","kirk","bob"]
    
    var body: some View {
        List (myArray, id: \.self) { element in
            Image("neo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)

            Text(element).font(.largeTitle)

        }
        
//        List {
//            ForEach(myArray, id: \.self) { element in
//            Text(element)
//
//            }
//        }
    }
}

struct thirdView_Previews: PreviewProvider {
    static var previews: some View {
        thirdView()
    }
}
