//
//  HourlyWeatherView.swift
//  MPmeteo
//
//  Created by Pierric Marye on 15/02/2022.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(cityVM.weather.hourly) { weather in
                    let icon = cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityVM.getTimeFor(timestamp: weather.dt)
                    let temp = "\(cityVM.getTempFor(temp: weather.temp))°"
                    getHourlyView(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 10) {
            Text(hour)
            image
                .foregroundColor(Color("Color3"))
            Text(temp)
        }
        .frame(width: 75, height: 125)
        .foregroundColor(Color("Color3"))
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}
                                                                                   
struct HourlyWeatherView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
