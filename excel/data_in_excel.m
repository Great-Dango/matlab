%%
filename = "fileExcel.xlsx";
t = readtable(filename,'TextType','string','VariableNamingRule','preserve');
manager = t.("ФИО")(t.("Роль") == "Руководитель");
executor = t.("ФИО")(t.("Роль") == "Исполнитель");
T = table(["Руководитель";"Исполнитель"],[join(manager,';');join(executor,';')]);
T.Properties.VariableNames = {'Роли' 'Люди'};
writetable(T,'outFile.xlsx');
%%
list = [["fileExcel.xlsx","Data"]; ["fileExcel.xlsx","Лист2"]]; %названия файлов и листов задаются попарно
name_role = [];
for i = 1:length(list)
    t = readtable(list(i,1),'Sheet',list(i,2),'TextType','string','VariableNamingRule','preserve');
    name_role = [name_role; t.("Роль"),t.("ФИО")];
end
r = unique(name_role(:,1));
r = [r, zeros(length(r),1)];
for i = 1:length(r)
    r(i,2) = join(name_role(name_role(:,1)==r(i,1),2),';');
end
T = table(r(:,1),r(:,2));
T.Properties.VariableNames = {'Роли' 'Люди'};
writetable(T,'outFile.xlsx');
%%
filename = "Data_18032020";
t = readtable(filename,'VariableNamingRule','preserve');
birth = t.("дата рождения");
age = zeros(length(birth),1);
for i = 1:length(age)
    age(i) = years(datetime(date) - birth(i));
end
age;% возраст участников
id = [t.("id1") t.("id2")];
publ = [t.("Публикация")];
p = [];
for i = 1:length(publ)
    if length(char(id(i,1))) == 11 || length(char(id(i,2))) == 11
        p = [p; publ(i)];
    end
end
p;% какие публикации имеют значение в столбцах id1,id2 длинной 11 символов
k = double(t.("Кол-во авторов внутренних"))./double(t.("Кол-во всего авторов"));% отношение авторов
K = zeros(length(k),1);
for i = 1:length(k)
    if k(i) <= 0.1
        K(i) = 0.1;
    elseif k(i) <= 0.2
        K(i) = 0.1;
    elseif k(i) <= 0.3
        K(i) = 0.4;
    elseif k(i) <= 0.4
        K(i) = 0.6;
    elseif k(i) <= 0.5
        K(i) = 0.8;
    else
        K(i) = 1;
    end
end
t.("возраст") = age;
t.("k") = K;
writetable(t,'outFile.xlsx');