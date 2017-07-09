//
//  AdditiveMonoid.swift
//  Algebra
//
//  Created by James Bean on 7/9/17.
//
//

extension Additive {

    /// - Returns: A `AdditiveMonoid` view of `self`.
    public var sum: AdditiveMonoid<Self> {
        return AdditiveMonoid(self)
    }
}

public struct AdditiveMonoid <T: Additive>: Monoid {

    // MARK: - Type Properties

    /// - Returns: The additive identity wrapped in a `AdditiveMonoid`.
    public static var identity: AdditiveMonoid {
        return AdditiveMonoid(T.zero)
    }

    // MARK: - Type Methods

    /// - Returns: The composition of the two given values.
    public static func <> (lhs: AdditiveMonoid, rhs: AdditiveMonoid) -> AdditiveMonoid {
        return AdditiveMonoid(lhs.value + rhs.value)
    }

    // MARK: - Instance Properties

    /// Value wrapped by `AdditiveMonoid`.
    public let value: T

    // MARK: - Initializers

    /// Creates a `AdditiveMonoid` with the given `value.`
    public init(_ value: T) {
        self.value = value
    }
}

extension Sequence where Iterator.Element: Additive {

    /// - Returns: Sum of all values contained herein.
    public var sum: Iterator.Element {
        return map { $0.sum }.reduced
    }
}
