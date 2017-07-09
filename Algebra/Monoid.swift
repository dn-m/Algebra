//
//  Monoid.swift
//  Algebra
//
//  Created by James Bean on 7/9/17.
//
//

/// Interface defining objects with two methods:
///
/// - `Unit` element
/// - `Composition` operation (inherited from `Semigroup`).
///
public protocol Monoid: Semigroup {

    // MARK: - Associated Types

    /// Type of the value wrapped by `Monoid`.
    associatedtype Value

    // MARK: - Type Properties

    /// Identity of `Monoid`.
    ///
    ///     monoid <> identity = monoid
    ///
    static var identity: Self { get }

    // MARK: - Instance Properties

    /// Value wrapped by `Monoid`.
    var value: Value { get }

    // MARK: - Initializers

    /// Creates a `Monoid` with the given `value.
    init(_ value: Value)
}

extension Sequence where Iterator.Element: Monoid {

    /// - Returns: The values contained herein, reduced from the `.identity` value of the `Monoid`,
    /// composing with the `<>` operation of the `Monoid`.
    public var reduced: Iterator.Element.Value {
        return reduce(.identity, <>).value
    }
}


