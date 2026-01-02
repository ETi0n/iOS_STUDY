//
//  CarDetail.swift
//  ListNavDemo
//
//  Created by ETiOn on 1/2/26.
//

import SwiftUI

struct CarDetail: View {
    let selectedCar: Car
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")){
                Image(selectedCar.imageName)
                    .resizable()
                    // conerRadius의 최신 코드 update
                    .clipShape(.rect(cornerRadius: 12)) // 모서리 처리
                    .aspectRatio(contentMode: .fit)
                    .padding() // 들여쓰기
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

#Preview {
    CarDetail(selectedCar: carData[0])
}
