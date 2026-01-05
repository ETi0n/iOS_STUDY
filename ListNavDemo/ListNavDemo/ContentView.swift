//
//  ContentView.swift
//  ListNavDemo
//
//  Created by ETiOn on 12/30/25.
//

import SwiftUI

struct ContentView: View {
    @State var carStore = CarStore(cars: carData)
    @State var stackPath = NavigationPath() // 경로 추적용 변수
    
    var body: some View {
        NavigationStack(path: $stackPath){ // 스택 페스를 바인딩
            List {
                ForEach(carStore.cars) { car in
                    NavigationLink(value: car) {
                        ListCell(car: car)
                    }
                }
            }
            .navigationTitle(Text("EV Cars"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    NavigationLink(value: "Add Car") {
                        Text("Add")
                            .foregroundStyle(.blue)
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    EditButton()
                })
            }
            .navigationDestination(for: String.self) { menuString in
                if menuString == "Add Car" {
                    AddNewCar(carStore: carStore, path: $stackPath)
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
