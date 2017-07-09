//
//  Semigroup.swift
//  Algebra
//
//  Created by James Bean on 7/9/17.
//
//

infix operator <> : AdditionPrecedence

public protocol Semigroup {

    /// - Returns: Composition of two of the same `Semigroup` type values.
    static func <> (_ lhs: Self, _ rhs: Self) -> Self
}
