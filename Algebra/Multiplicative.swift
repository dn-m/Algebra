//
//  Multiplicative.swift
//  Algebra
//
//  Created by James Bean on 7/9/17.
//
//

/// Semigroups with a one identity.
public protocol Multiplicative: Semigroup {
    static var one: Self { get }
    static func * (lhs: Self, rhs: Self) -> Self
}
