import XCTest
import UIKit
@testable import UIKitStackBuilder

final class UIKitStackBuilderTests: XCTestCase {

	func testExample() {
		// MARK: Asserts that default arguments on UIStackView and UIStack are the same
		stackAssertions(
			stack1: makeDefaultUIStackView(),
			stack2: makeDefaultUIStack()
		)

		// MARK: Asserts that custom arguments on UIStackView and UIStack are the same
		stackAssertions(
			stack1: makeCustomizedUIStackView(),
			stack2: makeCustomizedUIStack()
		)

		// MARK: Asserts that UIStack with .vertical axis is the same as UIVStack
		stackAssertions(
			stack1: makeCustomizedUIStack(axis: .vertical),
			stack2: makeCustomizedUIVStack()
		)

		// MARK: Asserts that UIStack with .horizontal axis is the same as UIHStack
		stackAssertions(
			stack1: makeCustomizedUIStack(axis: .horizontal),
			stack2: makeCustomizedUIHStack()
		)
	}
}

// MARK: Helpers
extension UIKitStackBuilderTests {
	fileprivate func label(withText text: String) -> UILabel {
		let label = UILabel()
		label.text = text
		return label
	}

	fileprivate func stackAssertions(stack1: UIStackView, stack2: UIStackView) {
		XCTAssertEqual(stack1.translatesAutoresizingMaskIntoConstraints, stack2.translatesAutoresizingMaskIntoConstraints)
		XCTAssertEqual(stack1.axis, stack2.axis)
		XCTAssertEqual(stack1.alignment, stack2.alignment)
		XCTAssertEqual(stack1.distribution, stack2.distribution)
		XCTAssertEqual(stack1.spacing, stack2.spacing)
		XCTAssertEqual(
			stack1.arrangedSubviews.compactMap { ($0 as? UILabel)?.text },
			stack2.arrangedSubviews.compactMap { ($0 as? UILabel)?.text }
		)
	}
}

// MARK: Default Stack Helpers
extension UIKitStackBuilderTests {
	fileprivate func makeDefaultUIStackView() -> UIStackView {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical

		stack.addArrangedSubview(label(withText: "Label 1"))

		if true {
			stack.addArrangedSubview(label(withText: "Label true"))
		}

		if let _ = Int("20") {
			stack.addArrangedSubview(label(withText: "Label opt"))
		}

		stack.addArrangedSubview(label(withText: "Label end"))
		return stack
	}

	fileprivate func makeDefaultUIStack() -> UIStackView {
		UIStack(axis: .vertical) {
			label(withText: "Label 1")

			if true {
				label(withText: "Label true")
			}

			if let _ = Int("20") {
				label(withText: "Label opt")
			}

			label(withText: "Label end")
		}
	}
}

// MARK: Customized Stack Helpers
extension UIKitStackBuilderTests {
	fileprivate func makeCustomizedUIStackView() -> UIStackView {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.alignment = .center
		stack.distribution = .fill
		stack.spacing = 5

		stack.addArrangedSubview(label(withText: "Label 1"))

		if true {
			stack.addArrangedSubview(label(withText: "Label true"))
		}

		if let _ = Int("20") {
			stack.addArrangedSubview(label(withText: "Label opt"))
		}

		stack.addArrangedSubview(label(withText: "Label end"))

		return stack
	}

	fileprivate func makeCustomizedUIStack() -> UIStackView {
		UIStack(
			axis: .vertical,
			alignment: .center,
			distribution: .fill,
			spacing: 5
		) {
			label(withText: "Label 1")

			if true {
				label(withText: "Label true")
			}

			if let _ = Int("20") {
				label(withText: "Label opt")
			}

			label(withText: "Label end")
		}
	}
}

// MARK: V and H Stack Helpers
extension UIKitStackBuilderTests {
	fileprivate func makeCustomizedUIStack(axis: NSLayoutConstraint.Axis) -> UIStack {
		UIStack(axis: axis) {
			label(withText: "Label 1")

			if true {
				label(withText: "Label true")
			}

			if let _ = Int("20") {
				label(withText: "Label opt")
			}

			label(withText: "Label end")
		}
	}

	fileprivate func makeCustomizedUIVStack() -> UIVStack {
		UIVStack {
			label(withText: "Label 1")

			if true {
				label(withText: "Label true")
			}

			if let _ = Int("20") {
				label(withText: "Label opt")
			}

			label(withText: "Label end")
		}
	}

	fileprivate func makeCustomizedUIHStack() -> UIHStack {
		UIHStack {
			label(withText: "Label 1")

			if true {
				label(withText: "Label true")
			}

			if let _ = Int("20") {
				label(withText: "Label opt")
			}

			label(withText: "Label end")
		}
	}
}
