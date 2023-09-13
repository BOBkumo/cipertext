function out = KEY_GEN(in)
out = [];

%%
BOX = [  57	49	41	33	25	17	9 1	58	50	42	34	26	18  10	2	59	51	43	35	27   19	11	3	60	52	44	36 63	55	47	39	31	23	15  7  62	54	46	38	30	22  14	6	61	53	45	37	29  21	13	5	28	20	12	4];
BOX_2 = [14	17	11	24	1	5 3	28	15	6	21	10 23	19	12	4	26	8 16	7	27	20	13	2 41	52	31	37	47	55 30	40	51	45	33	48 44	49	39	56	34	53 46	42	50	36	29	32];
%% Parity
K_p = zeros(1,56);
for i = 1:56
    K_p(1,i) = in(1,BOX(1,i));
end
K_p;
%% shift 1
K_shift = K_p;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 2
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 3
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 4
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 5
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 6
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 7
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 8
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 9
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 10
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 11
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 12
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 13
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 14
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 15
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];
%% shift 16
K_shift = K_s;
K_s = [ K_shift(1,2:28) K_shift(1,1) K_shift(1,30:56) K_shift(1,29)];
K_c = zeros(1,48);
for i = 1:48
    K_c(1,i) = K_s(1,BOX_2(1,i));
end
K_c;
out = [out ; K_c];