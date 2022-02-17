//
//  ContentView.swift
//  MPmeteo
//
//  Created by Pierric Marye on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityVM = CityViewViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityVM: cityVM)
                    .padding()
                ScrollView(showsIndicators: false) {
                    CityView(cityVM: cityVM)
                }
                .padding(15.0)
            }
            .padding(.top, 30)
        }
        .background(Color("Color4"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
