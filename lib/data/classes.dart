// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromMap(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.courses,
    this.warnings,
  });

  final List<Course> courses;
  final List<Warning> warnings;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
        warnings: List<Warning>.from(
            json["warnings"].map((x) => Warning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
        "warnings": List<dynamic>.from(warnings.map((x) => x.toJson())),
      };
}

class Course {
  Course({
    this.id,
    this.fullname,
    this.shortname,
    this.timemodified,
    this.assignments,
  });

  final int id;
  final String fullname;
  final String shortname;
  final int timemodified;
  final List<Assignment> assignments;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        fullname: json["fullname"],
        shortname: json["shortname"],
        timemodified: json["timemodified"],
        assignments: List<Assignment>.from(
            json["assignments"].map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "shortname": shortname,
        "timemodified": timemodified,
        "assignments": List<dynamic>.from(assignments.map((x) => x.toJson())),
      };
}

class Assignment {
  Assignment({
    this.id,
    this.cmid,
    this.course,
    this.name,
    this.nosubmissions,
    this.submissiondrafts,
    this.sendnotifications,
    this.sendlatenotifications,
    this.sendstudentnotifications,
    this.duedate,
    this.allowsubmissionsfromdate,
    this.grade,
    this.timemodified,
    this.completionsubmit,
    this.cutoffdate,
    this.gradingduedate,
    this.teamsubmission,
    this.requireallteammemberssubmit,
    this.teamsubmissiongroupingid,
    this.blindmarking,
    this.hidegrader,
    this.revealidentities,
    this.attemptreopenmethod,
    this.maxattempts,
    this.markingworkflow,
    this.markingallocation,
    this.requiresubmissionstatement,
    this.preventsubmissionnotingroup,
    this.configs,
    this.intro,
    this.introformat,
    this.introfiles,
    this.introattachments,
  });

  final int id;
  final int cmid;
  final int course;
  final String name;
  final int nosubmissions;
  final int submissiondrafts;
  final int sendnotifications;
  final int sendlatenotifications;
  final int sendstudentnotifications;
  final int duedate;
  final int allowsubmissionsfromdate;
  final int grade;
  final int timemodified;
  final int completionsubmit;
  final int cutoffdate;
  final int gradingduedate;
  final int teamsubmission;
  final int requireallteammemberssubmit;
  final int teamsubmissiongroupingid;
  final int blindmarking;
  final int hidegrader;
  final int revealidentities;
  final String attemptreopenmethod;
  final int maxattempts;
  final int markingworkflow;
  final int markingallocation;
  final int requiresubmissionstatement;
  final int preventsubmissionnotingroup;
  final List<Config> configs;
  final String intro;
  final int introformat;
  final List<dynamic> introfiles;
  final List<Introattachment> introattachments;

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        cmid: json["cmid"],
        course: json["course"],
        name: json["name"],
        nosubmissions: json["nosubmissions"],
        submissiondrafts: json["submissiondrafts"],
        sendnotifications: json["sendnotifications"],
        sendlatenotifications: json["sendlatenotifications"],
        sendstudentnotifications: json["sendstudentnotifications"],
        duedate: json["duedate"],
        allowsubmissionsfromdate: json["allowsubmissionsfromdate"],
        grade: json["grade"],
        timemodified: json["timemodified"],
        completionsubmit: json["completionsubmit"],
        cutoffdate: json["cutoffdate"],
        gradingduedate: json["gradingduedate"],
        teamsubmission: json["teamsubmission"],
        requireallteammemberssubmit: json["requireallteammemberssubmit"],
        teamsubmissiongroupingid: json["teamsubmissiongroupingid"],
        blindmarking: json["blindmarking"],
        hidegrader: json["hidegrader"],
        revealidentities: json["revealidentities"],
        attemptreopenmethod: json["attemptreopenmethod"],
        maxattempts: json["maxattempts"],
        markingworkflow: json["markingworkflow"],
        markingallocation: json["markingallocation"],
        requiresubmissionstatement: json["requiresubmissionstatement"],
        preventsubmissionnotingroup: json["preventsubmissionnotingroup"],
        configs:
            List<Config>.from(json["configs"].map((x) => Config.fromJson(x))),
        intro: json["intro"],
        introformat: json["introformat"],
        introfiles: List<dynamic>.from(json["introfiles"].map((x) => x)),
        introattachments: List<Introattachment>.from(
            json["introattachments"].map((x) => Introattachment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cmid": cmid,
        "course": course,
        "name": name,
        "nosubmissions": nosubmissions,
        "submissiondrafts": submissiondrafts,
        "sendnotifications": sendnotifications,
        "sendlatenotifications": sendlatenotifications,
        "sendstudentnotifications": sendstudentnotifications,
        "duedate": duedate,
        "allowsubmissionsfromdate": allowsubmissionsfromdate,
        "grade": grade,
        "timemodified": timemodified,
        "completionsubmit": completionsubmit,
        "cutoffdate": cutoffdate,
        "gradingduedate": gradingduedate,
        "teamsubmission": teamsubmission,
        "requireallteammemberssubmit": requireallteammemberssubmit,
        "teamsubmissiongroupingid": teamsubmissiongroupingid,
        "blindmarking": blindmarking,
        "hidegrader": hidegrader,
        "revealidentities": revealidentities,
        "attemptreopenmethod": attemptreopenmethod,
        "maxattempts": maxattempts,
        "markingworkflow": markingworkflow,
        "markingallocation": markingallocation,
        "requiresubmissionstatement": requiresubmissionstatement,
        "preventsubmissionnotingroup": preventsubmissionnotingroup,
        "configs": List<dynamic>.from(configs.map((x) => x.toJson())),
        "intro": intro,
        "introformat": introformat,
        "introfiles": List<dynamic>.from(introfiles.map((x) => x)),
        "introattachments":
            List<dynamic>.from(introattachments.map((x) => x.toJson())),
      };
}

class Config {
  Config({
    this.plugin,
    this.subtype,
    this.name,
    this.value,
  });

  final String plugin;
  final String subtype;
  final String name;
  final String value;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        plugin: json["plugin"],
        subtype: json["subtype"],
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "plugin": plugin,
        "subtype": subtype,
        "name": name,
        "value": value,
      };
}

class Introattachment {
  Introattachment({
    this.filename,
    this.filepath,
    this.filesize,
    this.fileurl,
    this.timemodified,
    this.mimetype,
    this.isexternalfile,
  });

  final String filename;
  final String filepath;
  final int filesize;
  final String fileurl;
  final int timemodified;
  final String mimetype;
  final bool isexternalfile;

  factory Introattachment.fromJson(Map<String, dynamic> json) =>
      Introattachment(
        filename: json["filename"],
        filepath: json["filepath"],
        filesize: json["filesize"],
        fileurl: json["fileurl"],
        timemodified: json["timemodified"],
        mimetype: json["mimetype"],
        isexternalfile: json["isexternalfile"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "filepath": filepath,
        "filesize": filesize,
        "fileurl": fileurl,
        "timemodified": timemodified,
        "mimetype": mimetype,
        "isexternalfile": isexternalfile,
      };
}

class Warning {
  Warning({
    this.item,
    this.itemid,
    this.warningcode,
    this.message,
  });

  final String item;
  final int itemid;
  final String warningcode;
  final String message;

  factory Warning.fromJson(Map<String, dynamic> json) => Warning(
        item: json["item"],
        itemid: json["itemid"],
        warningcode: json["warningcode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "itemid": itemid,
        "warningcode": warningcode,
        "message": message,
      };
}
