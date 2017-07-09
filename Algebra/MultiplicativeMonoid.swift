//
//  MultiplicativeMonoid.swift
//  Algebra
//
//  Created by James Bean on 7/9/17.
//
//

extension Multiplicative {

    /// - Returns: A `MultiplicativeMonoid` view of `self`.
    public var product: MultiplicativeMonoid<Self> {
        return MultiplicativeMonoid(self)
    }
}

public struct MultiplicativeMonoid <T: Multiplicative>: Monoid {

    // MARK: - Type Properties

    /// - Returns: The multiplicative identity wrapped in a `MultiplicativeMonoid`.
    public static var identity: MultiplicativeMonoid {
        return MultiplicativeMonoid(T.one)
    }

    // MARK: - Type Methods

    /// - Returns: The composition of the two given values.
    public static func <> (lhs: MultiplicativeMonoid, rhs: MultiplicativeMonoid)
        -> MultiplicativeMonoid
    {
        return MultiplicativeMonoid(lhs.value * rhs.value)
    }

    // MARK: - Instance Properties

    /// Value wrapped by `MultiplativeMonoid`.
    public let value: T

    // MARK: - Initializers

    /// Creates a `MultiplicativeMonoid` with the given `value.`
    public init(_ value: T) {
        self.value = value
    }
}

extension Sequence where Iterator.Element: Multiplicative {

    /// - Returns: Product of all values contained herein.
    public var product: Iterator.Element {
        return map { $0.product }.reduced
    }
}
