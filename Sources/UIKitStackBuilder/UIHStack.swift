//
//  UIHStack.swift
//  UIKitStackBuilder
//
//  Created by Yash Shah on 22/02/2023.
//

import UIKit

/// Convenience subclass of `UIStackView`, similar to SwiftUI's `HStack`, which set's `UIStackView`'s axis property to `NSLayoutConstraint.Axis.horizontal`
public class UIHStack: UIStackView {
	/// convenience initializer which provides access to common properties on UIStackView
	/// - Parameters:
	///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis. Set to `UIStackView.Alignment.fill` by default.
	///   - distribution: The distribution of the arranged views along the stack view’s axis. Set to `UIStackView.Distribution.fill` by default.
	///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views. Set to `0` by default
	///   - arrangedSubviews: A result builder that creates the arranged subviews for the stack view
	public init(
		alignment: UIStackView.Alignment = .fill,
		distribution: UIStackView.Distribution = .fill,
		spacing: CGFloat = 0,
		@UIViewBuilder arrangedSubviews: () -> [UIView]
	) {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		self.axis = .horizontal
		self.alignment = alignment
		self.distribution = distribution
		self.spacing = spacing
		arrangedSubviews().forEach(addArrangedSubview)
	}

	@available(*, unavailable)
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
