// ignore_for_file: file_names

class PatchNotes {
  String patchNoteDetails;
  String patchNoteReleaseDate;
  String patchNoteVersion;
  String patchNoteSteam;
  String patchNoteUC;

  PatchNotes(this.patchNoteDetails, this.patchNoteReleaseDate,
      this.patchNoteVersion, this.patchNoteSteam, this.patchNoteUC);

  factory PatchNotes.fromJson(Map<dynamic, dynamic> json) {
    return PatchNotes(
        json["Patch Note Details"],
        json["Patch Note Release Date"],
        json["Patch Note Version"],
        json["Patch Size Steam"],
        json["Patch Size UC"]);
  }
}
