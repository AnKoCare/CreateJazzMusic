f = 450;

noteCreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));

noteNames = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};
song = {'E' 'D' 'F#' 'G#' 'C#' 'B' 'D' 'E' 'B' 'A' 'C#' 'E' 'A' 'E' 'D' 'F#' 'G#' 'C#' 'B' 'D' 'E' 'B' 'A' 'C#' 'E' 'A'};
song_1 = {'G' 'D' 'B' 'G' 'E' 'C#' 'G' 'D' 'B' 'G' 'E' 'A' 'D' 'G' 'A' 'B' 'C#' 'B' 'A' 'B' 'A' 'G' 'A' 'E' 'G' 'G' 'A' 'F#' 'E' 'D' 'E' 'B' 'B' 'D' 'G' 'A' 'B' 'C#' 'B' 'A' 'B'};
song_2 = {'B' 'A' 'B' 'A' 'C#' 'B' 'A' 'B' 'A' 'A' 'G' 'F#' 'E' 'D' 'E' 'E' 'D' 'G' 'A' 'B' 'C#' 'B' 'A' 'B' 'A' 'G' 'A' 'E' 'G' 'G' 'A' 'F#' 'E' 'D' 'E' 'B' 'B' 'D' 'G' 'A' 'B' 'C#' 'B' 'A' 'B' 'A' 'A' 'G' 'A' 'E' 'G' 'G' 'A' 'F#' 'E' 'D' 'E' 'E'};

songIdx = zeros(1, length(song));
songIdx_1 = zeros(1, length(song_1));
songIdx_2 = zeros(1, length(song_2));

for k1 = 1:length(song)
    idx = strcmp(song(k1), noteNames);
    songIdx(k1) = find(idx);
end 

for k1 = 1:length(song_1)
    idx = strcmp(song_1(k1), noteNames);
    songIdx_1(k1) = find(idx);
end 

for k1 = 1:length(song_2)
    idx = strcmp(song_2(k1), noteNames);
    songIdx_2(k1) = find(idx);
end

dur = 0.2*8192;
songNotes = [];
for k1 = 1:length(songIdx)
    dur = 0.2*8192;
    f = f - 100;
    songNotes = [songNotes; [noteCreate(songIdx(k1),dur)]'];
    f = f + 100;
    dur = 0.25*8192;
end

for k1 = 1:length(songIdx_1)
    dur = 0.25*8192;
    f = f - 150;;
    songNotes = [songNotes; [noteCreate(songIdx_1(k1),dur)]'];
    f = f + 150;
    dur = 0.2*8192;
end

for k1 = 1:length(songIdx)
    dur = 0.23*8192;
    f = f - 200;
    songNotes = [songNotes; [noteCreate(songIdx(k1),dur)]'];
    f = f + 200;
    dur = 0.25*8192;
end

for k1 = 1:length(songIdx_2)
    dur = 0.15*8192;
    f = f - 150;
    songNotes = [songNotes; [noteCreate(songIdx_2(k1),dur)]'];
    f = f + 150;
    dur = 0.2*8192;
end

for k1 = 1:length(songIdx)
    dur = 0.2*8192;
    f = f - 200;
    songNotes = [songNotes; [noteCreate(songIdx(k1),dur)]'];
    f = f + 200;
    dur = 0.25*8192;
end

for k1 = 1:length(songIdx_1)
    dur = 0.27*8192;
    f = f - 150;
    songNotes = [songNotes; [noteCreate(songIdx_1(k1),dur)]'];
    f = f + 150;
    dur = 0.2*8192;
end

for k1 = 1:length(songIdx_2)
    dur = 0.18*8192;
    f = f - 150;
    songNotes = [songNotes; [noteCreate(songIdx_2(k1),dur)]'];
    f = f + 150;
    dur = 0.2*8192;
end

for k1 = 1:length(songIdx)
    dur = 0.23*8192;
    f = f - 200;
    songNotes = [songNotes; [noteCreate(songIdx(k1),dur)]'];
    f = f + 200;
    dur = 0.25*8192;
end

for k1 = 1:length(songIdx_1)
    dur = 0.18*8192;
    f = f - 150;
    songNotes = [songNotes; [noteCreate(songIdx_1(k1),dur)]'];
    f = f + 150;
    dur = 0.2*8192;
end
soundsc(songNotes, 8192)

filename = 'jazzTest2.wav';
audiowrite(filename, songNotes, 8192);
