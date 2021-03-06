import 'dart:async';

static const countdownDuration = Duration(minutes: 10);
Duration duration = Duration();
Timer? timer;

bool countDown = true;

@override
void initState() {
  // TODO: implement initState
  super.initState();
  reset();
}

void reset(){
  if (countDown){
    setState(() =>
    duration = countdownDuration);
  } else{
    setState(() =>
    duration = Duration());
  }
}

void startTimer(){
  timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
}

void addTime(){
  final addSeconds = countDown ? -1 : 1;
  setState(() {
    final seconds = duration.inSeconds + addSeconds;
    if (seconds < 0){
      timer?.cancel();
    } else{
      duration = Duration(seconds: seconds);

    }
  });
}