function I = I_calculator(b, h) 

    if b <= 0 || h <= 0

       error('Width and height must be positive values.');
    end

    I = b*h^3/12;

end



