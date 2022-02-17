//
//  TodayWeatherView.swift
//  MPmeteo
//
//  Created by Pierric Marye on 15/02/2022.
//

import SwiftUI

struct TodayWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Aujourd'hui")
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 10) {
                cityVM.getWeatherIconFor(icon: cityVM.weatherIcon)
                
                VStack(alignment: .leading) {
                    Text("\(cityVM.temperature)°")
                        .font(.system(size: 42))
                        
                    Text("\(cityVM.conditions)")
                    
                    Text("Ressenti \(cityVM.feelsLike)°")
                }
            }
            
            HStack(alignment: .center) {
                Spacer()
                widgetView(image: "wind", color: .black, title: "\(cityVM.windSpeed) km/h")
                Spacer()
                widgetView(image: "humidity.fill", color: .black, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(image: "barometer", color: .black, title: "\(cityVM.pressure) hpa")
                Spacer()
            }
        }
        .padding()
        .foregroundColor(Color("Color3"))
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
            
            Text(title)
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
