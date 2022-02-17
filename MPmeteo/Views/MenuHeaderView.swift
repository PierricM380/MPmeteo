//
//  MenuHeaderView.swift
//  MPmeteo
//
//  Created by Pierric Marye on 15/02/2022.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    @State private var searchTerm = ""
    
    var body: some View {
        HStack {
            TextField("", text: $searchTerm)
                .padding(.leading, 10.0)
            
            Button{
                cityVM.city = searchTerm
                hideKeyboard()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("Color2").opacity(0.5))
                    
                    Image(systemName: "magnifyingglass")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(Color("Color3"))
        .padding()
        .background(ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .top, endPoint: .bottom)).opacity(0.3)
        })
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
