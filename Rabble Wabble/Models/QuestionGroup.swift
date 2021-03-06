public class QuestionGroup: Codable {
	public class Score: Codable {
		public var correctCount: Int = 0
		public var incorrectCount: Int = 0
		init() {
		}
	}
	public let questions: [Question]
	public var score: Score
	public let title: String
	init(questions: [Question], score: Score = Score(), title: String) {
		self.questions = questions
		self.score = score
		self.title = title
	}
}
