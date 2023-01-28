package com.heima.estatemanagement.exception;

import com.heima.estatemanagement.common.MessageConstant;
import com.heima.estatemanagement.common.Result;
import com.heima.estatemanagement.common.StatusCode;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Auth: axing
 * @Desc: 全局异常处理器
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 功能描述: 捕获Exception类型的异常，并进行友好错误提示
     * @param exception
     * @return : com.heima.estatemanagement.common.Result
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Result error(Exception exception){
        exception.printStackTrace();
        return new Result(false, StatusCode.ERROR, MessageConstant.SYSTEM_BUSY);
    }
}
