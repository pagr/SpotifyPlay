//
//  Search.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Search {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let tracks = "tracks"
    static let artists = "artists"
    static let playlists = "playlists"
    static let albums = "albums"
  }

  // MARK: Properties
  public var tracks: Tracks?
  public var artists: Artists?
  public var playlists: Playlists?
  public var albums: Albums?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    tracks = Tracks(json: json[SerializationKeys.tracks])
    artists = Artists(json: json[SerializationKeys.artists])
    playlists = Playlists(json: json[SerializationKeys.playlists])
    albums = Albums(json: json[SerializationKeys.albums])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = tracks { dictionary[SerializationKeys.tracks] = value.dictionaryRepresentation() }
    if let value = artists { dictionary[SerializationKeys.artists] = value.dictionaryRepresentation() }
    if let value = playlists { dictionary[SerializationKeys.playlists] = value.dictionaryRepresentation() }
    if let value = albums { dictionary[SerializationKeys.albums] = value.dictionaryRepresentation() }
    return dictionary
  }

}
