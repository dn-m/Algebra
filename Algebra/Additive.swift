//
//  Additive.swift
//  Algebra
//
//  Created by James Bean on 7/9/17.
//
//

/// Semigroups with a zero identity.
public protocol Additive: Semigroup {
    static var zero: Self { get }
    static func + (lhs: Self, rhs: Self) -> Self
}
