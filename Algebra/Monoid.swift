//
//  Monoid.swift
//  Algebra
//
//  Created by James Bean on 7/11/17.
//
//

/// Interface defining objects with two methods:
///
/// - `Identity` element
/// - `Composition` operation (inherited from `Semigroup`).
///
public protocol Monoid: Semigroup {

    // MARK: - Type Properties

    /// Identity of `Monoid`.
    ///
    ///     monoid <> identity = monoid
    ///
    static var identity: Self { get }
}

extension Sequence where Iterator.Element: Monoid {

    /// - Returns: The values contained herein, reduced from the `.identity` value of the `Monoid`,
    /// composing with the `<>` operation of the `Monoid`.
    public var reduced: Iterator.Element {
        return reduce(.identity, <>)
    }
}
