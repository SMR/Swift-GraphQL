import Foundation

// MARK: - GraphQL.Field Extensions

extension GraphQL.Field {
    public init(alias: String, operation: GraphQLOperation) {
        self.init(alias: alias, name: operation.name, arguments: operation.arguments, selectionSet: operation.selectionSet)
    }
    
    public init(operation: GraphQLOperation) {
        self.init(name: operation.name, arguments: operation.arguments, selectionSet: operation.selectionSet)
    }
}

extension GraphQL.Field: StringLiteralConvertible {
    public init(stringLiteral value: StringLiteralType) {
        self.init(name: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self.init(name: value)
    }
    
    public init(unicodeScalarLiteral value: StringLiteralType) {
        self.init(name: value)
    }
}

extension GraphQL.Field: CustomStringConvertible, CustomDebugStringConvertible {
    public var queryString: String {
        return description
    }
    
    public var description: String {
        var alias = ""
        if let value = self.alias where !value.isEmpty {
            alias = "\(value): "
        }
        
        return "\(alias)\(name)\(renderArgumentsList(arguments))\(renderSelectionSet(selectionSet, fragments: fragments))"
    }
    
    public var debugDescription: String {
        return "GraphQL.Field(\(description))"
    }
}