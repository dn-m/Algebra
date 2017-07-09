//
//  Monoid.swift
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

extension Additive {

    public var sum: AdditiveMonoid<Self> {
        return AdditiveMonoid(self)
    }
}

/// Semigroups with a one identity.
public protocol Multiplicative: Semigroup {
    static var one: Self { get }
    static func * (lhs: Self, rhs: Self) -> Self
}

extension Multiplicative {

    public var product: MultiplicativeMonoid<Self> {
        return MultiplicativeMonoid(self)
    }
}

public protocol Monoid: Semigroup {
    associatedtype Value
    static var identity: Self { get }
    var value: Value { get }
    init(_ value: Value)
}

public struct AdditiveMonoid <T: Additive>: Monoid {

    public static var identity: AdditiveMonoid { return AdditiveMonoid(T.zero) }

    public static func <> (lhs: AdditiveMonoid, rhs: AdditiveMonoid) -> AdditiveMonoid {
        return AdditiveMonoid(lhs.value + rhs.value)
    }

    public let value: T

    public init(_ value: T) {
        self.value = value
    }
}

public struct MultiplicativeMonoid <T: Multiplicative>: Monoid {

    public static var identity: MultiplicativeMonoid { return MultiplicativeMonoid(T.one) }

    public static func <> (lhs: MultiplicativeMonoid, rhs: MultiplicativeMonoid)
        -> MultiplicativeMonoid
    {
        return MultiplicativeMonoid(lhs.value * rhs.value)
    }

    public let value: T

    public init(_ value: T) {
        self.value = value
    }
}

extension Sequence where Iterator.Element: Monoid {

    public var reduced: Iterator.Element.Value {
        return reduce(Iterator.Element.identity, <>).value
    }
}

extension Sequence where Iterator.Element: Additive {

    public var sum: Iterator.Element {
        return map { $0.sum }.reduced
    }
}

extension Sequence where Iterator.Element: Multiplicative {

    public var product: Iterator.Element {
        return map { $0.product }.reduced
    }
}
