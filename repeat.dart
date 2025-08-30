String repeat({int? times, required String value}) => List.generate(times ?? 2, (_) => value).join(' ');


