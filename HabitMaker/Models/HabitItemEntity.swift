//
//  HabitItemEntity.swift
//  HabitMaker
//
//  Created by 田内　翔太郎 on 2019/11/23.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import Foundation
import Ballcap
import FirebaseFirestore

/**
 * 習慣のItemの情報を取得するentity
 *
 * Object → FireStoreのcollectionの名前を定義して、DocumentReferenceを保持できる
 * DataRepresentable　→ ObjectにDataを保持させることを担う
 * DataListenable → ObjectのDataの変更を監視するための機能を持っている
 * ObservableObject → @PublisedをSwiftUIへ伝える
 * Identifiable → SwiftUIのListなどに必要
 */
final class HabitItemEntity: Object, DataRepresentable, DataListenable, ObservableObject, Identifiable {

    typealias ID = String

    // コレクションの名前を定義
    override class var name: String { "tasks" }

    struct Model: Codable, Modelable {
        // 習慣のタイトル
        var title: String = ""
        // 期限
        var due: ServerTimestamp?
        // 連続達成日数
        var continuosCount: Int = 0
        // 挫折回数
        var frustrationCount: Int = 0
    }

    @Published var data: HabitItemEntity.Model?

    var listener: ListenerRegistration?
}
