//
//  CarStore.swift
//  ListNavDemo
//
//  Created by ETiOn on 1/2/26.
//

import SwiftUI

@Observable
class CarStore {
    var cars: [Car]
    
    init(cars: [Car] = []) { // 없으면 빈 배열
        self.cars = cars
    }
}
