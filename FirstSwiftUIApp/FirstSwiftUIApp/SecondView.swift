//
//  SecondView.swift
//  FirstSwiftUIApp
//
//  Created by mesut alver on 27.11.2022.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("neo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.8, height:         UIScreen.main.bounds.height * 0.3)
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
