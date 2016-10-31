//
//  workLoadMain.swift
//  RsyncOSX
//
//  Created by Thomas Evensen on 13/10/2016.
//  Copyright © 2016 Thomas Evensen. All rights reserved.
//

import Foundation

enum singleWorkTask {
    case estimate_singlerun
    case execute_singlerun
    case abort
    case empty
    case done
    case batchrun
}

final class singleTask {

    // Work Queue
    private var work: [singleWorkTask]?

    // Returns the top most element.
    // Top element is read only
    func readworking() -> singleWorkTask {
        if (self.work != nil) {
            if self.work!.count > 0 {
                return self.work![0]
            } else {
                return .empty
            }
        } else {
            return .empty
        }
    }

    // Returns the top most element.
    // Top element is removed
    func working() -> singleWorkTask {
        if (self.work != nil) {
            if self.work!.count > 0 {
                return self.work!.removeFirst()
            } else {
                return .empty
            }
        } else {
            return .empty
        }
    }

    // Single run
    init() {
        self.work = [singleWorkTask]()
        self.work!.append(.estimate_singlerun)
        self.work!.append(.execute_singlerun)
        self.work!.append(.done)
    }

    // Either Abort or Batchrun
    init (task: singleWorkTask) {
        self.work = [singleWorkTask]()
        self.work!.append(task)
    }
}
