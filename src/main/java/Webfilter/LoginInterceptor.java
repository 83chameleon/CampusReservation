package Webfilter;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor{
    protected String doIntercept(ActionInvocation invoker)throws Exception{
        Object loginUser = ActionContext.getContext().getSession().get("user");
        if(loginUser==null){
            System.out.println("11111111111111");
            return "Login";
        }
        System.out.println("-------------");
        return invoker.invoke();
    }
}
