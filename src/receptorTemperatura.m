clear all
clc

ComTest = serial('COM4');
set(ComTest,'BaudRate',9600);
set(ComTest,'DataBits',8);
set(ComTest,'Parity','none');
set(ComTest,'StopBits',1);
set(ComTest,'FlowControl','none');
set(ComTest,'InputBufferSize',512);
fopen(ComTest)

st = 0;
am = input('Numero de amostras:');
t = input('Intervalo (em segundos):');
media = 0;

while (st < am)
dado=fscanf(ComTest,'%f');
disp(['Temperatura ' num2str(st) ': ' num2str(dado)]);
st=st+1;
media = media + dado;
pause(t);
end

media = media / am;
disp(['Temperatura media:' num2str(media)]);

fclose(ComTest);
delete(ComTest)