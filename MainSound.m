f = 450;
notecreate = @(frq,dur) sin(2*pi* [1:dur]/6000 * (f*2.^((frq-1)/12)));
notename = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};
song = {'E' 'D' 'F#' 'G#' 'C#' 'B' 'D' 'E' 'B' 'A' 'C#' 'E' 'A' 'E' 'D' 'F#' 'G#' 'C#' 'B' 'D' 'E' 'B' 'A' 'C#' 'E' 'A'};
song_1 = {'G' 'D' 'B' 'G' 'E' 'C#' 'G' 'D' 'B' 'G' 'E' 'A' 'D' 'G' 'A' 'B' 'C#' 'B' 'A' 'B' 'A' 'G' 'A' 'E' 'G' 'G' 'A' 'F#' 'E' 'D' 'E' 'B' 'B' 'D' 'G' 'A' 'B' 'C#' 'B' 'A' 'B'};
song_2 = {'B' 'A' 'B' 'A' 'C#' 'B' 'A' 'B' 'A' 'A' 'G' 'F#' 'E' 'D' 'E' 'E' 'D' 'G' 'A' 'B' 'C#' 'B' 'A' 'B' 'A' 'G' 'A' 'E' 'G' 'G' 'A' 'F#' 'E' 'D' 'E' 'B' 'B' 'D' 'G' 'A' 'B' 'C#' 'B' 'A' 'B' 'A' 'A' 'G' 'A' 'E' 'G' 'G' 'A' 'F#' 'E' 'D' 'E' 'E'};

songidx = zeros(1, length(song));
songidx_1 = zeros(1, length(song_1));
songidx_2 = zeros(1, length(song_2));

for k1 = 1:length(song)
    idx = strcmp(song(k1), notename);
    songidx(k1) = find(idx);
end 

for k1 = 1:length(song_1)
    idx = strcmp(song_1(k1), notename);
    songidx_1(k1) = find(idx);
end 

for k1 = 1:length(song_2)
    idx = strcmp(song_2(k1), notename);
    songidx_2(k1) = find(idx);
end

dur = 0.2*8192;
songnote = [];
for k1 = 1:length(songidx)
    f = f - 100;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
    f = f + 100;
    dur = 0.25*8192;
end

for k1 = 1:length(songidx_1)
    f = f - 150;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx_1(k1),dur)  zeros(1,75)]'];
    f = f + 150;
    dur = 0.2*8192;
end

for k1 = 1:length(songidx)
    f = f - 200;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
    f = f + 200;
    dur = 0.25*8192;
end

for k1 = 1:length(songidx_2)
    f = f - 150;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx_2(k1),dur)  zeros(1,75)]'];
    f = f + 150;
    dur = 0.2*8192;
end

for k1 = 1:length(songidx)
    f = f - 200;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
    f = f + 200;
    dur = 0.25*8192;
end

for k1 = 1:length(songidx_1)
    f = f - 150;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx_1(k1),dur)  zeros(1,75)]'];
    f = f + 150;
    dur = 0.2*8192;
end

for k1 = 1:length(songidx_2)
    f = f - 150;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx_2(k1),dur)  zeros(1,75)]'];
    f = f + 150;
    dur = 0.2*8192;
end

for k1 = 1:length(songidx)
    f = f - 200;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
    f = f + 200;
    dur = 0.25*8192;
end

for k1 = 1:length(songidx_1)
    f = f - 150;
    notecreate = @(frq,dur) sin(2*pi* (1:dur)/6000 * (f*2.^((frq-1)/12)));
    songnote = [songnote; [notecreate(songidx_1(k1),dur)  zeros(1,75)]'];
    f = f + 150;
    dur = 0.2*8192;
end
soundsc(songnote, 8192)
% Convert audio to MIDI-like representation
segment = mirsegment(songnote, 'Pitch');

% Extract MIDI-like representation
midiData = mirgetdata(segment, 'MIDI');
%mirsave(midiData, 'jazzMain123.mid');
%soundsc(songnote, 8192)
midi