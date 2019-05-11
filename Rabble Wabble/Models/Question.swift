public class Question: Codable {
	public var answer: String
	public var hint: String?
	public var prompt: String
	init(answer: String, hint: String, prompt: String) {
		self.answer = answer
		self.hint = hint
		self.prompt = prompt
	}
}
