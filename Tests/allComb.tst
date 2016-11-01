test := module()

    export ModuleApply;

    local test1,
          test2,
          test3,
          test4;
    
    uses ParametricMatrixTools;
    
    ModuleApply := proc($)
    
        local passCount, failCount, test, testList; 
        
        testList := ['test1', 'test2', 'test3', 'test4'];
        
        printf("Testing allComb\n");
        
        passCount, failCount := 0, 0;
        
        for test in testList do
            printf("\t%a: ...", test);
            if test() then
                passCount := passCount + 1
            else
                failCount := failCount + 1;
            end if;
        end do;
        
        printf("\n");
        
        return passCount, failCount;
        
    end proc;


    test1 := proc($)

        local l, result, correct;
        
        l := [[1, 2, 3], [a, b, c], [x, y]];
        
        try
            result := ParametricMatrixTools:-allComb(l);
        catch:
            printf("\b\b\bFAIL: Error\n");
            return false;
        end try;
        
        correct := [[1, a, x], [2, a, x], [3, a, x], [1, b, x], [2, b, x], [3, b, x], [1, c, x], [2, c, x], [3, c, x], [1, a, y], [2, a, y], [3, a, y], [1, b, y], [2, b, y], [3, b, y], [1, c, y], [2, c, y], [3, c, y]];
        
        printf("\b\b\b");
        if evalb(result = correct) then
            printf("Pass\n");
            return true;
        else
            printf("FAIL: Incorrect result\n");
            return false;
        end if;
        
    end proc;
    
    
    test2 := proc($)
    
        local l, result, correct;
        
        l := [[1], [2], [3], [4]];
        
        try
            result := ParametricMatrixTools:-allComb(l);
        catch:
            printf("\b\b\bFAIL: Error\n");
            return false;
        end try;
        
        correct := [[1, 2, 3, 4]];
        
        printf("\b\b\b");
        if evalb(result = correct) then
            printf("Pass\n");
            return true;
        else
            printf("FAIL: Incorrect result\n");
            return false;
        end if;
        
    end proc;
    
    
    test3 := proc($)
    
        local l, result, correct;
        
        l := [[1, 2, 3, 4]];
        
        try
            result := ParametricMatrixTools:-allComb(l);
        catch:
            printf("\b\b\bFAIL: Error\n");
            return false;
        end try;
        
        correct := [[1], [2], [3], [4]];
        
        printf("\b\b\b");
        if evalb(result = correct) then
            printf("Pass\n");
            return true;
        else
            printf("FAIL: Incorrect result\n");
            return false;
        end if;
        
    end proc;
    
    
    test4 := proc($)
    
        local l, result, correct;
        
        l := [[1, 2, 3, 4, 5], [x]];
        
        try
            result := ParametricMatrixTools:-allComb(l);
        catch:
            printf("\b\b\bFAIL: Error\n");
            return false;
        end try;
        
        correct := [[1, x], [2, x], [3, x], [4, x], [5, x]];
        
        printf("\b\b\b");
        if evalb(result = correct) then
            printf("Pass\n");
            return true;
        else
            printf("FAIL: Incorrect result\n");
            return false;
        end if;
        
    end proc;
    
end module: