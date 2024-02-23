//
//  ContentView.swift
//  WeatherApp
//
//  Created by LinhNguyen DGWA on 22/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isNight: Bool = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Da Nang, VN")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 25)

                HStack(spacing: 24) {
                    let moke = WeatherInDay(dayOfWeek: "MON", weatherImageName: "cloud.sun.fill", temperature: 23)
                    WeatherDayView(weatherInDay: moke)
                    WeatherDayView(weatherInDay: moke)
                    WeatherDayView(weatherInDay: moke)
                    WeatherDayView(weatherInDay: moke)
                    WeatherDayView(weatherInDay: moke)
                }

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

struct WeatherInDay {
    var dayOfWeek: String
    var weatherImageName: String
    var temperature: Int
}

struct BackgroundView: View {
    @Binding var isNight: Bool
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
