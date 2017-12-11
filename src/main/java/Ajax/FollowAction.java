package Ajax;

import DAO.FollowDAO;
import DAO.UsersDAO;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;

public class FollowAction extends ActionSupport{
    private String teacherId;
    private int followType;

    public String execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        UsersEntity usersEntity = (UsersEntity) session.getAttribute("user");
        FollowDAO followDAO = new FollowDAO();
        followDAO.add(usersEntity.getId(),teacherId,followType);
        UsersDAO usersDAO = new UsersDAO();
        usersEntity = usersDAO.get(usersEntity.getId());
        session.setAttribute("user",usersEntity);
        return SUCCESS;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public void setFollowType(int followType) {
        this.followType = followType;
    }
}
