%writing a 3x3 matrix to a file
function write_matrix(filename)
    if exist(filename)
        [F, err] = fopen(filename,'w');
        if F == -1
            fprintf('%s\n',err);
        else
            A = rand(3);
            for i = 1:3
                for j = 1:3
                    fprintf(F, '%.4f ', A(i,j));
                end
                fprintf(F, '\n');
            end
            fclose(F);
        end
    else
        fprintf('File no exists\n');
    end
end
