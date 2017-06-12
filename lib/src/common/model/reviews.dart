part of github.common;

enum PullRequestReviewState {
  commented, changesRequested, approved, pending, unknown
}

class PullRequestReview {
  PullRequestReview.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    user = User.fromJSON(json["user"]);
    body = json["body"];
    htmlURL = Uri.parse(json["html_url"]);
    pullRequestURL = Uri.parse(json["pull_request_url"]);
    submittedAt = DateTime.parse(json["submitted_at"]);
    commitID = json["commit_id"];

    switch (json["state"].toUpperCase()) {
      case "COMMENTED": state = PullRequestReviewState.commented; break;
      case "APPROVED": state = PullRequestReviewState.approved; break;
      case "CHANGES_REQUESTED": state = PullRequestReviewState.changesRequested; break;
      case "PENDING": state = PullRequestReviewState.pending; break;
      default: state = PullRequestReviewState.unknown;
    }
  }

  int id;
  User user;
  String body;
  PullRequestReviewState state;
  Uri htmlURL;
  Uri pullRequestURL;
  DateTime submittedAt;
  String commitID;
}