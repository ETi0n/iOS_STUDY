//
//  ContentView.swift
//  ListNavDemo
//
//  Created by ETiOn on 12/30/25.
//

import SwiftUI

struct ContentView: View {
    @State var carStore = CarStore(cars: carData)
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(carStore.cars) { car in
                    NavigationLink(value: car) {
                        ListCell(car: car)
                    }
                }
            }
            .navigationDestination(for: Car.self) { car in CarDetail(selectedCar: car)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack { // 가로 정렬
            Image(car.imageName)
                .resizable() // 이미지 크기 조절
                .aspectRatio(contentMode: .fit) // 이미지 비율 조정 - 컨텐츠에 맞춤
                .frame(width: 100, height: 60) // frame의 크기
            Text(car.name)
        }
    }
}
