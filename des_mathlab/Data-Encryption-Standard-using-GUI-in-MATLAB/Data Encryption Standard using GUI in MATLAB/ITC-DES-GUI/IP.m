function out = IP(in)
%%
INIT_PER_BOX =  [ 58 50 42 34 26 18 10 02 
                  60 52 44 36 28 20 12 04
                  62 54 46 38 30 22 14 06
                  64 56 48 40 32 24 16 08
                  57 49 41 33 25 17 09 01
                  59 51 43 35 27 19 11 03
                  61 53 45 37 29 21 13 05
                  63 55 47 39 31 23 15 07 ];
init_per_box = [];
for i = 1:8
    init_per_box = [init_per_box INIT_PER_BOX(i,:)];
end
init_per_box;
%%
for i = 1:64
    out(1,i) = in(1,init_per_box(1,i));
end
