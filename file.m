[F, err] = fopen('output.txt','w');
if (F == -1)
    fprintf('%s\n',err);
else
    A = rand(3);
    for i = 1:3
        for j = 1:3
            fprintf(F, '%.4f ', A(i,j));
        end
        fprintf(F, '\n');
    end
end
fclose(F);