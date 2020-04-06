//
//  RequestTool.swift
//  Test
//
//  Created by 邹高成 on 2020/4/4.
//  Copyright © 2020 Yanfang.符. All rights reserved.
//

import Foundation

private var Base_Url = ""
private var BI_Url = ""

enum  NetworkEnvironment{
    case QA01
    case Prepare
    case Release
}

let CurrentNetWork : NetworkEnvironment = .QA01

private func judgeNetwork (network : NetworkEnvironment = CurrentNetWork) {
    switch network {
    case .QA01:
        Base_Url = "xxxxx"
        BI_Url = "xxxx"
        break
    case .Prepare:
        Base_Url = "xxxxx1"
        BI_Url = "xxxx1"
        break
    default:
        Base_Url = "xxxxx2"
        BI_Url = "xxxx2"
        break
    }
}
