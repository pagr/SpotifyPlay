//
//  Meta.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Meta: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let analyzerVersion = "analyzer_version"
    static let statusCode = "status_code"
    static let platform = "platform"
    static let analysisTime = "analysis_time"
    static let inputProcess = "input_process"
    static let detailedStatus = "detailed_status"
    static let timestamp = "timestamp"
  }

  // MARK: Properties
  public var analyzerVersion: String?
  public var statusCode: Int?
  public var platform: String?
  public var analysisTime: Float?
  public var inputProcess: String?
  public var detailedStatus: String?
  public var timestamp: Int?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    analyzerVersion = json[SerializationKeys.analyzerVersion].string
    statusCode = json[SerializationKeys.statusCode].int
    platform = json[SerializationKeys.platform].string
    analysisTime = json[SerializationKeys.analysisTime].float
    inputProcess = json[SerializationKeys.inputProcess].string
    detailedStatus = json[SerializationKeys.detailedStatus].string
    timestamp = json[SerializationKeys.timestamp].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = analyzerVersion { dictionary[SerializationKeys.analyzerVersion] = value }
    if let value = statusCode { dictionary[SerializationKeys.statusCode] = value }
    if let value = platform { dictionary[SerializationKeys.platform] = value }
    if let value = analysisTime { dictionary[SerializationKeys.analysisTime] = value }
    if let value = inputProcess { dictionary[SerializationKeys.inputProcess] = value }
    if let value = detailedStatus { dictionary[SerializationKeys.detailedStatus] = value }
    if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.analyzerVersion = aDecoder.decodeObject(forKey: SerializationKeys.analyzerVersion) as? String
    self.statusCode = aDecoder.decodeObject(forKey: SerializationKeys.statusCode) as? Int
    self.platform = aDecoder.decodeObject(forKey: SerializationKeys.platform) as? String
    self.analysisTime = aDecoder.decodeObject(forKey: SerializationKeys.analysisTime) as? Float
    self.inputProcess = aDecoder.decodeObject(forKey: SerializationKeys.inputProcess) as? String
    self.detailedStatus = aDecoder.decodeObject(forKey: SerializationKeys.detailedStatus) as? String
    self.timestamp = aDecoder.decodeObject(forKey: SerializationKeys.timestamp) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(analyzerVersion, forKey: SerializationKeys.analyzerVersion)
    aCoder.encode(statusCode, forKey: SerializationKeys.statusCode)
    aCoder.encode(platform, forKey: SerializationKeys.platform)
    aCoder.encode(analysisTime, forKey: SerializationKeys.analysisTime)
    aCoder.encode(inputProcess, forKey: SerializationKeys.inputProcess)
    aCoder.encode(detailedStatus, forKey: SerializationKeys.detailedStatus)
    aCoder.encode(timestamp, forKey: SerializationKeys.timestamp)
  }

}
