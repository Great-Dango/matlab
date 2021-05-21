filename = "g_edges.csv";
t = readtable(filename);
g = digraph(t.Source,t.Target,t.Weight);
v = indegree(g);
g.Nodes.NodeColors = 2*sqrt(v-min(v))+0.2;
p = plot(g,'NodeCData',g.Nodes.NodeColors);
colorbar;
vs = sort(v);
top5 =  vs(length(vs)-5:length(vs));
ver5 = [];
for i=1:5
    ver5 = [ver5 find(v(:) == top5(i))];
end
name = g.Nodes(:,1);
for i=1:5
    name(ver5(i),1);%топ 5 человек у которых степень вершин наибольшаяя
end
path = shortestpath(g,'NED','TYRION');
highlight(p,path,'EdgeColor','red');