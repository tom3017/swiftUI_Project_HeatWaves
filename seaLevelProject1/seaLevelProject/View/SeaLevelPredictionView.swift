//
//  SeaLevelPredictionView.swift
//  SeaLevel9
//
//  Created by 기태우 on 6/17/24.
//

import SwiftUI

struct SeaLevelPredictionView: View {
    @StateObject private var seaLevelModel5 = SeaLevel5Model()
    @State private var co2Input: String = ""
    @State private var yearInput: String = ""

    var body: some View {
        VStack {
            ZStack {
                // y축 눈금 표시
                YAxisView()
                    .frame(height: 500)

                // 해수면
                SeaLevelShape(seaLevel: seaLevelModel5.seaLevel)
                    .fill(Color.blue.opacity(1))
                    .frame(height: 500)

                // 집 아이콘
                Image("house_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 560) // 5m 높이
                    .offset(y: 100) // 집 아이콘을 해수면 위로 배치하기 위해 offset 사용
            }
            .frame(height: 500)

            Spacer()

            // 입력 필드 및 버튼
            VStack(spacing: 8) { // 간격을 줄이기 위해 spacing 설정
                HStack {
                    TextField("연도 입력(Year)", text: $yearInput)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }

                HStack {
                    TextField("탄소배출량(단위 MtC)", text: $co2Input)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                
                Button(action: {
                    if let year = Int(yearInput), let carbon = Int(co2Input) {
                        seaLevelModel5.fetchSeaLevel(year: year, carbon: carbon)
                    } else {
                        print("Invalid input")
                    }
                }) {
                    Text("해수면 예측")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            // 해수면 변화 예측 텍스트
            Text("해수면 변화 예측(cm): \(seaLevelModel5.seaLevel, specifier: "%.2f")")

            // 온도 변화 텍스트
            Text("예상 온도 변화: \(seaLevelModel5.temperature, specifier: "%.2f")°C")
                .padding()
        }
    }
}

struct SeaLevelPredictionView_Previews: PreviewProvider {
    static var previews: some View {
        SeaLevelPredictionView()
    }
}