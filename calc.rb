def work1(operator, n1, n2)

    case operator.downcase
    when "add"
        result = n1.to_i + n2.to_i
    when "subtract"
        result = n1.to_i - n2.to_i
    when "multiply"
        result = n1.to_i * n2.to_i
    when "divide"
        calc_div(n1, n2)
    end
    result
end

def work2(num1, num2)
    if num2.to_i == 0
        false
    else
       numresult = num1.to_i / num2.to_i
    end
    numresult
end

    