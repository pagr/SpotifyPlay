//
//  Track.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Track: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let synchVersion = "synch_version"
    static let windowSeconds = "window_seconds"
    static let key = "key"
    static let synchstring = "synchstring"
    static let mode = "mode"
    static let analysisChannels = "analysis_channels"
    static let rhythmstring = "rhythmstring"
    static let timeSignatureConfidence = "time_signature_confidence"
    static let echoprintstring = "echoprintstring"
    static let endOfFadeIn = "end_of_fade_in"
    static let duration = "duration"
    static let modeConfidence = "mode_confidence"
    static let analysisSampleRate = "analysis_sample_rate"
    static let sampleMd5 = "sample_md5"
    static let loudness = "loudness"
    static let codeVersion = "code_version"
    static let timeSignature = "time_signature"
    static let keyConfidence = "key_confidence"
    static let rhythmVersion = "rhythm_version"
    static let numSamples = "num_samples"
    static let codestring = "codestring"
    static let startOfFadeOut = "start_of_fade_out"
    static let tempo = "tempo"
    static let tempoConfidence = "tempo_confidence"
    static let echoprintVersion = "echoprint_version"
    static let offsetSeconds = "offset_seconds"
  }

  // MARK: Properties
  public var synchVersion: Int?
  public var windowSeconds: Int?
  public var key: Int?
  public var synchstring: String?
  public var mode: Int?
  public var analysisChannels: Int?
  public var rhythmstring: String?
  public var timeSignatureConfidence: Int?
  public var echoprintstring: String?
  public var endOfFadeIn: Float?
  public var duration: Float?
  public var modeConfidence: Float?
  public var analysisSampleRate: Int?
  public var sampleMd5: String?
  public var loudness: Float?
  public var codeVersion: Float?
  public var timeSignature: Int?
  public var keyConfidence: Float?
  public var rhythmVersion: Int?
  public var numSamples: Int?
  public var codestring: String?
  public var startOfFadeOut: Float?
  public var tempo: Float?
  public var tempoConfidence: Float?
  public var echoprintVersion: Float?
  public var offsetSeconds: Int?

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
    synchVersion = json[SerializationKeys.synchVersion].int
    windowSeconds = json[SerializationKeys.windowSeconds].int
    key = json[SerializationKeys.key].int
    synchstring = json[SerializationKeys.synchstring].string
    mode = json[SerializationKeys.mode].int
    analysisChannels = json[SerializationKeys.analysisChannels].int
    rhythmstring = json[SerializationKeys.rhythmstring].string
    timeSignatureConfidence = json[SerializationKeys.timeSignatureConfidence].int
    echoprintstring = json[SerializationKeys.echoprintstring].string
    endOfFadeIn = json[SerializationKeys.endOfFadeIn].float
    duration = json[SerializationKeys.duration].float
    modeConfidence = json[SerializationKeys.modeConfidence].float
    analysisSampleRate = json[SerializationKeys.analysisSampleRate].int
    sampleMd5 = json[SerializationKeys.sampleMd5].string
    loudness = json[SerializationKeys.loudness].float
    codeVersion = json[SerializationKeys.codeVersion].float
    timeSignature = json[SerializationKeys.timeSignature].int
    keyConfidence = json[SerializationKeys.keyConfidence].float
    rhythmVersion = json[SerializationKeys.rhythmVersion].int
    numSamples = json[SerializationKeys.numSamples].int
    codestring = json[SerializationKeys.codestring].string
    startOfFadeOut = json[SerializationKeys.startOfFadeOut].float
    tempo = json[SerializationKeys.tempo].float
    tempoConfidence = json[SerializationKeys.tempoConfidence].float
    echoprintVersion = json[SerializationKeys.echoprintVersion].float
    offsetSeconds = json[SerializationKeys.offsetSeconds].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = synchVersion { dictionary[SerializationKeys.synchVersion] = value }
    if let value = windowSeconds { dictionary[SerializationKeys.windowSeconds] = value }
    if let value = key { dictionary[SerializationKeys.key] = value }
    if let value = synchstring { dictionary[SerializationKeys.synchstring] = value }
    if let value = mode { dictionary[SerializationKeys.mode] = value }
    if let value = analysisChannels { dictionary[SerializationKeys.analysisChannels] = value }
    if let value = rhythmstring { dictionary[SerializationKeys.rhythmstring] = value }
    if let value = timeSignatureConfidence { dictionary[SerializationKeys.timeSignatureConfidence] = value }
    if let value = echoprintstring { dictionary[SerializationKeys.echoprintstring] = value }
    if let value = endOfFadeIn { dictionary[SerializationKeys.endOfFadeIn] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = modeConfidence { dictionary[SerializationKeys.modeConfidence] = value }
    if let value = analysisSampleRate { dictionary[SerializationKeys.analysisSampleRate] = value }
    if let value = sampleMd5 { dictionary[SerializationKeys.sampleMd5] = value }
    if let value = loudness { dictionary[SerializationKeys.loudness] = value }
    if let value = codeVersion { dictionary[SerializationKeys.codeVersion] = value }
    if let value = timeSignature { dictionary[SerializationKeys.timeSignature] = value }
    if let value = keyConfidence { dictionary[SerializationKeys.keyConfidence] = value }
    if let value = rhythmVersion { dictionary[SerializationKeys.rhythmVersion] = value }
    if let value = numSamples { dictionary[SerializationKeys.numSamples] = value }
    if let value = codestring { dictionary[SerializationKeys.codestring] = value }
    if let value = startOfFadeOut { dictionary[SerializationKeys.startOfFadeOut] = value }
    if let value = tempo { dictionary[SerializationKeys.tempo] = value }
    if let value = tempoConfidence { dictionary[SerializationKeys.tempoConfidence] = value }
    if let value = echoprintVersion { dictionary[SerializationKeys.echoprintVersion] = value }
    if let value = offsetSeconds { dictionary[SerializationKeys.offsetSeconds] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.synchVersion = aDecoder.decodeObject(forKey: SerializationKeys.synchVersion) as? Int
    self.windowSeconds = aDecoder.decodeObject(forKey: SerializationKeys.windowSeconds) as? Int
    self.key = aDecoder.decodeObject(forKey: SerializationKeys.key) as? Int
    self.synchstring = aDecoder.decodeObject(forKey: SerializationKeys.synchstring) as? String
    self.mode = aDecoder.decodeObject(forKey: SerializationKeys.mode) as? Int
    self.analysisChannels = aDecoder.decodeObject(forKey: SerializationKeys.analysisChannels) as? Int
    self.rhythmstring = aDecoder.decodeObject(forKey: SerializationKeys.rhythmstring) as? String
    self.timeSignatureConfidence = aDecoder.decodeObject(forKey: SerializationKeys.timeSignatureConfidence) as? Int
    self.echoprintstring = aDecoder.decodeObject(forKey: SerializationKeys.echoprintstring) as? String
    self.endOfFadeIn = aDecoder.decodeObject(forKey: SerializationKeys.endOfFadeIn) as? Float
    self.duration = aDecoder.decodeObject(forKey: SerializationKeys.duration) as? Float
    self.modeConfidence = aDecoder.decodeObject(forKey: SerializationKeys.modeConfidence) as? Float
    self.analysisSampleRate = aDecoder.decodeObject(forKey: SerializationKeys.analysisSampleRate) as? Int
    self.sampleMd5 = aDecoder.decodeObject(forKey: SerializationKeys.sampleMd5) as? String
    self.loudness = aDecoder.decodeObject(forKey: SerializationKeys.loudness) as? Float
    self.codeVersion = aDecoder.decodeObject(forKey: SerializationKeys.codeVersion) as? Float
    self.timeSignature = aDecoder.decodeObject(forKey: SerializationKeys.timeSignature) as? Int
    self.keyConfidence = aDecoder.decodeObject(forKey: SerializationKeys.keyConfidence) as? Float
    self.rhythmVersion = aDecoder.decodeObject(forKey: SerializationKeys.rhythmVersion) as? Int
    self.numSamples = aDecoder.decodeObject(forKey: SerializationKeys.numSamples) as? Int
    self.codestring = aDecoder.decodeObject(forKey: SerializationKeys.codestring) as? String
    self.startOfFadeOut = aDecoder.decodeObject(forKey: SerializationKeys.startOfFadeOut) as? Float
    self.tempo = aDecoder.decodeObject(forKey: SerializationKeys.tempo) as? Float
    self.tempoConfidence = aDecoder.decodeObject(forKey: SerializationKeys.tempoConfidence) as? Float
    self.echoprintVersion = aDecoder.decodeObject(forKey: SerializationKeys.echoprintVersion) as? Float
    self.offsetSeconds = aDecoder.decodeObject(forKey: SerializationKeys.offsetSeconds) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(synchVersion, forKey: SerializationKeys.synchVersion)
    aCoder.encode(windowSeconds, forKey: SerializationKeys.windowSeconds)
    aCoder.encode(key, forKey: SerializationKeys.key)
    aCoder.encode(synchstring, forKey: SerializationKeys.synchstring)
    aCoder.encode(mode, forKey: SerializationKeys.mode)
    aCoder.encode(analysisChannels, forKey: SerializationKeys.analysisChannels)
    aCoder.encode(rhythmstring, forKey: SerializationKeys.rhythmstring)
    aCoder.encode(timeSignatureConfidence, forKey: SerializationKeys.timeSignatureConfidence)
    aCoder.encode(echoprintstring, forKey: SerializationKeys.echoprintstring)
    aCoder.encode(endOfFadeIn, forKey: SerializationKeys.endOfFadeIn)
    aCoder.encode(duration, forKey: SerializationKeys.duration)
    aCoder.encode(modeConfidence, forKey: SerializationKeys.modeConfidence)
    aCoder.encode(analysisSampleRate, forKey: SerializationKeys.analysisSampleRate)
    aCoder.encode(sampleMd5, forKey: SerializationKeys.sampleMd5)
    aCoder.encode(loudness, forKey: SerializationKeys.loudness)
    aCoder.encode(codeVersion, forKey: SerializationKeys.codeVersion)
    aCoder.encode(timeSignature, forKey: SerializationKeys.timeSignature)
    aCoder.encode(keyConfidence, forKey: SerializationKeys.keyConfidence)
    aCoder.encode(rhythmVersion, forKey: SerializationKeys.rhythmVersion)
    aCoder.encode(numSamples, forKey: SerializationKeys.numSamples)
    aCoder.encode(codestring, forKey: SerializationKeys.codestring)
    aCoder.encode(startOfFadeOut, forKey: SerializationKeys.startOfFadeOut)
    aCoder.encode(tempo, forKey: SerializationKeys.tempo)
    aCoder.encode(tempoConfidence, forKey: SerializationKeys.tempoConfidence)
    aCoder.encode(echoprintVersion, forKey: SerializationKeys.echoprintVersion)
    aCoder.encode(offsetSeconds, forKey: SerializationKeys.offsetSeconds)
  }

}
