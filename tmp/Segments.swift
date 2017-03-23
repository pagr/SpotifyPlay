//
//  Segments.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Segments: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let pitches = "pitches"
    static let loudnessMax = "loudness_max"
    static let timbre = "timbre"
    static let loudnessEnd = "loudness_end"
    static let loudnessStart = "loudness_start"
    static let start = "start"
    static let duration = "duration"
    static let confidence = "confidence"
    static let loudnessMaxTime = "loudness_max_time"
  }

  // MARK: Properties
  public var pitches: [Float]?
  public var loudnessMax: Float?
  public var timbre: [Float]?
  public var loudnessEnd: Int?
  public var loudnessStart: Float?
  public var start: Float?
  public var duration: Float?
  public var confidence: Float?
  public var loudnessMaxTime: Float?

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
    if let items = json[SerializationKeys.pitches].array { pitches = items.map { $0.floatValue } }
    loudnessMax = json[SerializationKeys.loudnessMax].float
    if let items = json[SerializationKeys.timbre].array { timbre = items.map { $0.floatValue } }
    loudnessEnd = json[SerializationKeys.loudnessEnd].int
    loudnessStart = json[SerializationKeys.loudnessStart].float
    start = json[SerializationKeys.start].float
    duration = json[SerializationKeys.duration].float
    confidence = json[SerializationKeys.confidence].float
    loudnessMaxTime = json[SerializationKeys.loudnessMaxTime].float
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pitches { dictionary[SerializationKeys.pitches] = value }
    if let value = loudnessMax { dictionary[SerializationKeys.loudnessMax] = value }
    if let value = timbre { dictionary[SerializationKeys.timbre] = value }
    if let value = loudnessEnd { dictionary[SerializationKeys.loudnessEnd] = value }
    if let value = loudnessStart { dictionary[SerializationKeys.loudnessStart] = value }
    if let value = start { dictionary[SerializationKeys.start] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = confidence { dictionary[SerializationKeys.confidence] = value }
    if let value = loudnessMaxTime { dictionary[SerializationKeys.loudnessMaxTime] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.pitches = aDecoder.decodeObject(forKey: SerializationKeys.pitches) as? [Float]
    self.loudnessMax = aDecoder.decodeObject(forKey: SerializationKeys.loudnessMax) as? Float
    self.timbre = aDecoder.decodeObject(forKey: SerializationKeys.timbre) as? [Float]
    self.loudnessEnd = aDecoder.decodeObject(forKey: SerializationKeys.loudnessEnd) as? Int
    self.loudnessStart = aDecoder.decodeObject(forKey: SerializationKeys.loudnessStart) as? Float
    self.start = aDecoder.decodeObject(forKey: SerializationKeys.start) as? Float
    self.duration = aDecoder.decodeObject(forKey: SerializationKeys.duration) as? Float
    self.confidence = aDecoder.decodeObject(forKey: SerializationKeys.confidence) as? Float
    self.loudnessMaxTime = aDecoder.decodeObject(forKey: SerializationKeys.loudnessMaxTime) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(pitches, forKey: SerializationKeys.pitches)
    aCoder.encode(loudnessMax, forKey: SerializationKeys.loudnessMax)
    aCoder.encode(timbre, forKey: SerializationKeys.timbre)
    aCoder.encode(loudnessEnd, forKey: SerializationKeys.loudnessEnd)
    aCoder.encode(loudnessStart, forKey: SerializationKeys.loudnessStart)
    aCoder.encode(start, forKey: SerializationKeys.start)
    aCoder.encode(duration, forKey: SerializationKeys.duration)
    aCoder.encode(confidence, forKey: SerializationKeys.confidence)
    aCoder.encode(loudnessMaxTime, forKey: SerializationKeys.loudnessMaxTime)
  }

}
