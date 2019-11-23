//
//  HabitListItem.swift
//  HabitMaker
//
//  Created by 田内　翔太郎 on 2019/11/23.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import SwiftUI

struct HabitListItem: View {

    @ObservedObject var task: HabitItemEntity = HabitItemEntity()

    var body: some View {
        HStack {
            // 習慣のタイトル
            Text(task[\.title])
                .font(.title)

            Text("連続: \(task[\.continuosCount]) / 挫折: \(task[\.frustrationCount])")

            Spacer()

            Text("達成")
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(Color.yellow)
            .cornerRadius(10)
            .onTapGesture {
                self.task[\.continuosCount] += 1
                self.task.update()
            }

            Text("未達成")
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(Color.red)
            .cornerRadius(10)
            .onTapGesture {
                self.task[\.frustrationCount] += 1
                self.task.update()
            }

        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct HabitListItem_Previews: PreviewProvider {
    static var previews: some View {
        HabitListItem()
    }
}
