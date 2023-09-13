function out = FP(in)
%%
FINAL_PER_BOX = [ 40 08 48 16 56 24 64 32
                  39 07 47 15 55 23 63 31
                  38 06 46 14 54 22 62 30
                  37 05 45 13 53 21 61 29
                  36 04 44 12 52 20 60 28
                  35 03 43 11 51 19 59 27
                  34 02 42 10 50 18 58 26
                  33 01 41 09 49 17 57 25
                   ];
final_per_box = [];
for i = 1:8
    final_per_box = [final_per_box FINAL_PER_BOX(i,:)];
end
final_per_box;
%%
for i = 1:64
    out(1,i) = in(1,final_per_box(1,i));
end