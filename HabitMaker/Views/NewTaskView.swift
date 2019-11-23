//
//  NewTaskview.swift
//  HabitMaker
//
//  Created by 田内　翔太郎 on 2019/11/23.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import SwiftUI

struct NewTaskView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @ObservedObject(initialValue: HabitItemEntity()) var task: HabitItemEntity

    var body: some View {
        NavigationView {
            TextField("新しい習慣", text: self.$task[\.title])
            .navigationBarTitle("新しい習慣")
            .navigationBarItems(trailing: Button("保存") {
                self.task.save()
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct NewTaskview_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
