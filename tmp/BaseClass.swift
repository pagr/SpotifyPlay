//
//  BaseClass.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class BaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let segments = "segments"
    static let tatums = "tatums"
    static let meta = "meta"
    static let track = "track"
    static let sections = "sections"
    static let bars = "bars"
    static let beats = "beats"
  }

  // MARK: Properties
  public var segments: [Segments]?
  public var tatums: [Tatums]?
  public var meta: Meta?
  public var track: Track?
  public var sections: [Sections]?
  public var bars: [Bars]?
  public var beats: [Beats]?

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
    if let items = json[SerializationKeys.segments].array { segments = items.map { Segments(json: $0) } }
    if let items = json[SerializationKeys.tatums].array { tatums = items.map { Tatums(json: $0) } }
    meta = Meta(json: json[SerializationKeys.meta])
    track = Track(json: json[SerializationKeys.track])
    if let items = json[SerializationKeys.sections].array { sections = items.map { Sections(json: $0) } }
    if let items = json[SerializationKeys.bars].array { bars = items.map { Bars(json: $0) } }
    if let items = json[SerializationKeys.beats].array { beats = items.map { Beats(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = segments { dictionary[SerializationKeys.segments] = value.map { $0.dictionaryRepresentation() } }
    if let value = tatums { dictionary[SerializationKeys.tatums] = value.map { $0.dictionaryRepresentation() } }
    if let value = meta { dictionary[SerializationKeys.meta] = value.dictionaryRepresentation() }
    if let value = track { dictionary[SerializationKeys.track] = value.dictionaryRepresentation() }
    if let value = sections { dictionary[SerializationKeys.sections] = value.map { $0.dictionaryRepresentation() } }
    if let value = bars { dictionary[SerializationKeys.bars] = value.map { $0.dictionaryRepresentation() } }
    if let value = beats { dictionary[SerializationKeys.beats] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.segments = aDecoder.decodeObject(forKey: SerializationKeys.segments) as? [Segments]
    self.tatums = aDecoder.decodeObject(forKey: SerializationKeys.tatums) as? [Tatums]
    self.meta = aDecoder.decodeObject(forKey: SerializationKeys.meta) as? Meta
    self.track = aDecoder.decodeObject(forKey: SerializationKeys.track) as? Track
    self.sections = aDecoder.decodeObject(forKey: SerializationKeys.sections) as? [Sections]
    self.bars = aDecoder.decodeObject(forKey: SerializationKeys.bars) as? [Bars]
    self.beats = aDecoder.decodeObject(forKey: SerializationKeys.beats) as? [Beats]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(segments, forKey: SerializationKeys.segments)
    aCoder.encode(tatums, forKey: SerializationKeys.tatums)
    aCoder.encode(meta, forKey: SerializationKeys.meta)
    aCoder.encode(track, forKey: SerializationKeys.track)
    aCoder.encode(sections, forKey: SerializationKeys.sections)
    aCoder.encode(bars, forKey: SerializationKeys.bars)
    aCoder.encode(beats, forKey: SerializationKeys.beats)
  }

}
