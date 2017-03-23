//
//  Beats.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Beats: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let start = "start"
    static let duration = "duration"
    static let confidence = "confidence"
  }

  // MARK: Properties
  public var start: Float?
  public var duration: Float?
  public var confidence: Float?

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
    start = json[SerializationKeys.start].float
    duration = json[SerializationKeys.duration].float
    confidence = json[SerializationKeys.confidence].float
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = start { dictionary[SerializationKeys.start] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = confidence { dictionary[SerializationKeys.confidence] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.start = aDecoder.decodeObject(forKey: SerializationKeys.start) as? Float
    self.duration = aDecoder.decodeObject(forKey: SerializationKeys.duration) as? Float
    self.confidence = aDecoder.decodeObject(forKey: SerializationKeys.confidence) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(start, forKey: SerializationKeys.start)
    aCoder.encode(duration, forKey: SerializationKeys.duration)
    aCoder.encode(confidence, forKey: SerializationKeys.confidence)
  }

}
