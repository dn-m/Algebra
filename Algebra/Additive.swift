//
//  Additive.swift
//  Algebra
//
//  Created by James Bean on 7/9/17.
//
//

/// Semigroups with a zero identity.
public protocol Additive: Monoid {

    /// Additive identity.
    static var zero: Self { get }

    /// Additive operation.
    static func + (lhs: Self, rhs: Self) -> Self
}
