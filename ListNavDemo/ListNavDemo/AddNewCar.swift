//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by ETiOn on 1/2/26.
//

import SwiftUI

struct AddNewCar: View {
    // 전달받는 파라미터
    var carStore: CarStore
    @Binding var path: NavigationPath
    
    @State private var isHybrid: Bool = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Car Detail")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }
                .padding()
            }
            
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString,
                         name: name,
                         description: description,
                         imageName: "telsa_model_3", //defalt
                         isHybrid: isHybrid) //생성자 함수
        carStore.cars.append(newCar)
        path.removeLast()
    }
}

// 커스텀 뷰: 입력 뷰
struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 테두리
        }
        .padding()
    }
}
