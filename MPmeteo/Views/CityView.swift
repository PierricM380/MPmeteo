//
//  CityView.swift
//  MPmeteo
//
//  Created by Pierric Marye on 15/02/2022.
//

import SwiftUI

struct CityView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        VStack {
            CityNameView(city: cityVM.city, date: cityVM.date)
                .shadow(radius: 0)
            TodayWeatherView(cityVM: cityVM)
            HourlyWeatherView(cityVM: cityVM)
            DailyWeatherView(cityVM: cityVM)
        }
        .padding(.bottom, 30)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
