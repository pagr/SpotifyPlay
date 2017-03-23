//
//  Search.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Search: Unmarshaling {

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

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    tracks = try? object.value(for: SerializationKeys.tracks)
    artists = try? object.value(for: SerializationKeys.artists)
    playlists = try? object.value(for: SerializationKeys.playlists)
    albums = try? object.value(for: SerializationKeys.albums)
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
