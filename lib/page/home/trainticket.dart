class TrainTicket {
  final String origin;
  final String destination;

  TrainTicket({
    required this.origin,
    required this.destination,
  });

  TrainTicket copyWith({
    String? origin,
    String? destination,
  }) {
    return TrainTicket(
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
    );
  }
}
