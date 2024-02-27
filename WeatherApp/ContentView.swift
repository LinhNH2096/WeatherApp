//
//  ContentView.swift
//  WeatherApp
//
//  Created by LinhNguyen DGWA on 22/02/2024.
//

import SwiftUI
import WeatherKit

struct ContentView: View {
    @State var isNight: Bool = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Da Nang, VN")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 25)

                let moke = WeatherInDay(id: Date(), weatherImageName: "cloud.sun.fill", temperature: 23)
                let mokeArray = Array(repeating: moke, count: 5)
                HorizontalListWeatherDayView(weatherList: mokeArray)

                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time")
                }

                Spacer()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HorizontalListWeatherDayView: View {
    var weatherList: [WeatherInDay]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 25) {
                Spacer()
                ForEach(weatherList) { weatherInDay in
                    WeatherDayView(weatherInDay: weatherInDay)
                }
            }
        }
    }
}

struct WeatherDayView: View {
    var weatherInDay: WeatherInDay

    var body: some View {
        VStack {
            Text(weatherInDay.dayOfWeek.uppercased())
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
            Image(systemName: weatherInDay.weatherImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(weatherInDay.temperature)°")
                .font(.system(size: 28, weight: .medium, design: .rounded))
                .foregroundColor(.blue)
        }
    }
}

struct WeatherInDay: Identifiable {
    var id: Date
    var dayOfWeek: String {
        return id.formatted(Date.FormatStyle().weekday())
    }
    var weatherImageName: String
    var temperature: Int
}

struct BackgroundView: View {
    var isNight: Bool
    var body: some View {

        let topColor: Color = isNight ? .black : .blue
        let bottomColor: Color = isNight ? .gray : Color("LightBlue")
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .rounded))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)

            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundColor(.blue)
        }.padding(.bottom, 40)
    }
}
