//
//  Sections.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Sections: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let loudness = "loudness"
    static let timeSignatureConfidence = "time_signature_confidence"
    static let timeSignature = "time_signature"
    static let tempoConfidence = "tempo_confidence"
    static let tempo = "tempo"
    static let key = "key"
    static let keyConfidence = "key_confidence"
    static let mode = "mode"
    static let duration = "duration"
    static let start = "start"
    static let confidence = "confidence"
    static let modeConfidence = "mode_confidence"
  }

  // MARK: Properties
  public var loudness: Float?
  public var timeSignatureConfidence: Int?
  public var timeSignature: Int?
  public var tempoConfidence: Float?
  public var tempo: Float?
  public var key: Int?
  public var keyConfidence: Int?
  public var mode: Int?
  public var duration: Float?
  public var start: Float?
  public var confidence: Float?
  public var modeConfidence: Int?

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
    loudness = json[SerializationKeys.loudness].float
    timeSignatureConfidence = json[SerializationKeys.timeSignatureConfidence].int
    timeSignature = json[SerializationKeys.timeSignature].int
    tempoConfidence = json[SerializationKeys.tempoConfidence].float
    tempo = json[SerializationKeys.tempo].float
    key = json[SerializationKeys.key].int
    keyConfidence = json[SerializationKeys.keyConfidence].int
    mode = json[SerializationKeys.mode].int
    duration = json[SerializationKeys.duration].float
    start = json[SerializationKeys.start].float
    confidence = json[SerializationKeys.confidence].float
    modeConfidence = json[SerializationKeys.modeConfidence].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = loudness { dictionary[SerializationKeys.loudness] = value }
    if let value = timeSignatureConfidence { dictionary[SerializationKeys.timeSignatureConfidence] = value }
    if let value = timeSignature { dictionary[SerializationKeys.timeSignature] = value }
    if let value = tempoConfidence { dictionary[SerializationKeys.tempoConfidence] = value }
    if let value = tempo { dictionary[SerializationKeys.tempo] = value }
    if let value = key { dictionary[SerializationKeys.key] = value }
    if let value = keyConfidence { dictionary[SerializationKeys.keyConfidence] = value }
    if let value = mode { dictionary[SerializationKeys.mode] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = start { dictionary[SerializationKeys.start] = value }
    if let value = confidence { dictionary[SerializationKeys.confidence] = value }
    if let value = modeConfidence { dictionary[SerializationKeys.modeConfidence] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.loudness = aDecoder.decodeObject(forKey: SerializationKeys.loudness) as? Float
    self.timeSignatureConfidence = aDecoder.decodeObject(forKey: SerializationKeys.timeSignatureConfidence) as? Int
    self.timeSignature = aDecoder.decodeObject(forKey: SerializationKeys.timeSignature) as? Int
    self.tempoConfidence = aDecoder.decodeObject(forKey: SerializationKeys.tempoConfidence) as? Float
    self.tempo = aDecoder.decodeObject(forKey: SerializationKeys.tempo) as? Float
    self.key = aDecoder.decodeObject(forKey: SerializationKeys.key) as? Int
    self.keyConfidence = aDecoder.decodeObject(forKey: SerializationKeys.keyConfidence) as? Int
    self.mode = aDecoder.decodeObject(forKey: SerializationKeys.mode) as? Int
    self.duration = aDecoder.decodeObject(forKey: SerializationKeys.duration) as? Float
    self.start = aDecoder.decodeObject(forKey: SerializationKeys.start) as? Float
    self.confidence = aDecoder.decodeObject(forKey: SerializationKeys.confidence) as? Float
    self.modeConfidence = aDecoder.decodeObject(forKey: SerializationKeys.modeConfidence) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(loudness, forKey: SerializationKeys.loudness)
    aCoder.encode(timeSignatureConfidence, forKey: SerializationKeys.timeSignatureConfidence)
    aCoder.encode(timeSignature, forKey: SerializationKeys.timeSignature)
    aCoder.encode(tempoConfidence, forKey: SerializationKeys.tempoConfidence)
    aCoder.encode(tempo, forKey: SerializationKeys.tempo)
    aCoder.encode(key, forKey: SerializationKeys.key)
    aCoder.encode(keyConfidence, forKey: SerializationKeys.keyConfidence)
    aCoder.encode(mode, forKey: SerializationKeys.mode)
    aCoder.encode(duration, forKey: SerializationKeys.duration)
    aCoder.encode(start, forKey: SerializationKeys.start)
    aCoder.encode(confidence, forKey: SerializationKeys.confidence)
    aCoder.encode(modeConfidence, forKey: SerializationKeys.modeConfidence)
  }

}
