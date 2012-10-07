function do_counter() {
        var _date = new Date();
        _date.setMonth(10);
        _date.setDate(-5);
        _date.setHours(-4);
        _date.setMinutes(0);
        _date.setSeconds(0);
        $('#counter').countdown({
            startTime: _date,
            stepTime: 1,
            digitImages: 6,
            digitWidth: 53,
            digitHeight: 77,
            image: "images/digits.png"
        });
};
