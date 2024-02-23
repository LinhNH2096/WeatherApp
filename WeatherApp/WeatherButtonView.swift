//
//  WeatherButtonView.swift
//  WeatherApp
//
//  Created by LinhNguyen DGWA on 23/02/2024.
//

import SwiftUI

struct WeatherButtonView: View {
    var title: String
    var body: some View {
        Text(title)
            .frame(width: 280, height: 56)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .cornerRadius(12)
    }
}
