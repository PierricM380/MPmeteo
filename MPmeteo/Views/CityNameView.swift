//
//  CityNameView.swift
//  MPmeteo
//
//  Created by Pierric Marye on 15/02/2022.
//

import SwiftUI

struct CityNameView: View {
    
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(city.capitalized)
                    .font(.title)
                    .bold()
                
                Text(date)
            }
            .foregroundColor(Color("Color3"))
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
