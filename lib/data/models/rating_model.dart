class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    final double? rate;
    final int? count;

    factory Rating.fromJson(Map<String, dynamic> json){ 
        return Rating(
            rate: (json["rate"] as num).toDouble(),
            count: json["count"],
        );
    }

}