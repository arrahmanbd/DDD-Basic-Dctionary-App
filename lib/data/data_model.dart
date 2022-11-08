class Words {
  List<String>? pron;
  String? bn;
  String? en;
  List<String>? bnSyns;
  List<String>? enSyns;
  List<String>? sents;

  Words({this.pron, this.bn, this.en, this.bnSyns, this.enSyns, this.sents});

  Words.fromJson(Map<String, dynamic> json) {
    pron = json['pron'].cast<String>();
    bn = json['bn'];
    en = json['en'];
    bnSyns = json['bn_syns'].cast<String>();
    enSyns = json['en_syns'].cast<String>();
    sents = json['sents'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pron'] = this.pron;
    data['bn'] = this.bn;
    data['en'] = this.en;
    data['bn_syns'] = this.bnSyns;
    data['en_syns'] = this.enSyns;
    data['sents'] = this.sents;
    return data;
  }
}
