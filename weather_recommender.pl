% Weather-Based Activity Recommendation System
% Language: Prolog

% 1. Knowledge Base
activity(sunny, cricket).
activity(sunny, walking).
activity(sunny, cycling).
activity(sunny, picnic).

activity(rainy, read_book).
activity(rainy, indoor_game).
activity(rainy, watch_movie).
activity(rainy, indoor_exercise).

activity(cloudy, photography).
activity(cloudy, nature_walk).
activity(cloudy, visit_park).

activity(windy, kite_flying).
activity(windy, indoor_game).

activity(cold, drink_hot_chocolate).
activity(cold, read_book).
activity(cold, watch_movie).

% 2. Recommendation Rule
recommend(Weather, Activity) :-
    activity(Weather, Activity).

% 3. Check Valid Weather
valid_weather(Weather) :-
    activity(Weather, _).

% 4. Collect Recommendations
recommendations(Weather, Activities) :-
    findall(Activity, activity(Weather, Activity), Activities),
    Activities \= [].

% 5. Display Recommendations
show_recommendations(Weather) :-
    (   recommendations(Weather, Activities)
    ->  format('~nWeather: ~w~n', [Weather]),
        writeln('Recommended Activities:'),
        print_activities(Activities)
    ;   format('~nNo recommendations available for ~w weather.~n',
               [Weather]),
        writeln('Supported weather: sunny, rainy, cloudy, windy, cold.')
    ).

% 6. Print Activities
print_activities([]).
print_activities([Activity | Rest]) :-
    format('- ~w~n', [Activity]),
    print_activities(Rest).

% 7. Interactive Program
start :-
    writeln('==================================='),
    writeln(' WEATHER ACTIVITY RECOMMENDER'),
    writeln('==================================='),
    writeln('Enter: sunny, rainy, cloudy, windy, or cold'),
    write('Weather condition: '),
    read(Weather),
    show_recommendations(Weather).