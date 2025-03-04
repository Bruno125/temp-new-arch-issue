import Foundation
import React

@objc(ExtraModulesChecker)
class ExtraModulesChecker: NSObject, RCTBridgeModule {
  @objc
  static func moduleName() -> String! {
    return "ExtraModulesChecker"
  }
  
  static var wasCalled: Bool = false
  
  @objc
  func constantsToExport() -> [AnyHashable : Any]! {
    return [:]
  }
  
  @objc(wasExtraModulesCalled:)
  func wasExtraModulesCalled(_ callback: @escaping RCTResponseSenderBlock) {
    callback([NSNumber(value: ExtraModulesChecker.wasCalled)])
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
} 