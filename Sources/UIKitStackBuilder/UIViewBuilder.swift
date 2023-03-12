//
//  UIStackView+init.swift
//  UIViewBuilder
//
//  Created by Yash Shah on 22/02/2023.
//

import UIKit

@resultBuilder
struct UIViewBuilder {

	static func buildBlock() -> [UIView] { [] }

	static func buildBlock(_ components: UIView...) -> [UIView] {
		components
	}

	static func buildBlock(_ components: [UIView]...) -> [UIView] {
		components.flatMap { $0 }
	}

	static func buildExpression(_ expression: UIView) -> [UIView] {
		[expression]
	}

	static func buildExpression(_ expression: [UIView]) -> [UIView] {
		expression
	}

	static func buildOptional(_ component: [UIView]?) -> [UIView] {
		component ?? []
	}

	static func buildEither(first component: [UIView]) -> [UIView] {
		component
	}

	static func buildEither(second component: [UIView]) -> [UIView] {
		component
	}

	static func buildArray(_ components: [[UIView]]) -> [UIView] {
		components.flatMap { $0 }
	}

	static func buildLimitedAvailability(_ component: [UIView]) -> [UIView] {
		component
	}
	
}
