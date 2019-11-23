//
//  ContentView.swift
//  HabitMaker
//
//  Created by 田内　翔太郎 on 2019/11/23.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import SwiftUI
import Ballcap

/**
 * DataSource → collectionを管理する機能
 */
struct ContentView: View {

    @State var tasks: [HabitItemEntity] = []

    let dataSource: DataSource<HabitItemEntity> = HabitItemEntity.order(by: "updatedAt").limit(to: 30).dataSource()

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HabitListItem(task: task)
                }
            }
            .navigationBarTitle("習慣一覧")
            .onAppear() {
                // 監視スタート
                self.dataSource
                    // snapshotをHabitItemEntityに変換
                    .retrieve(from: { (_, snapshot, done) in
                        let task: HabitItemEntity = HabitItemEntity(snapshot: snapshot)!
                        done(task)
                    })
                    .onChanged({ (_, shanpshot) in
                        // 変更後のデータを渡す
                        self.tasks = shanpshot.after
                    })
                    .listen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
