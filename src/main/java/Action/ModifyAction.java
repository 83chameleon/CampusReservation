package Action;

import DAO.ReservationDA0;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

public class ModifyAction extends ActionSupport {
    private String name;
    private String contact;
    private String id;
    private String email;
    private String college;
    private byte sex;
    private String detail;
    private String question;
    private String answer;
    private UsersEntity user;
    private ArrayList unjudgedList;
    private ArrayList judgedList;
    private ArrayList unconfirmedList;
    private ArrayList confirmedList;
    private ArrayList refusedList;
    private List nullList;


    public String execute() throws Exception {
        UsersDAO usersDAO = new UsersDAO();
        ReservationDA0 reservationDA0 = new ReservationDA0();
        TreservationDAO treservationDAO = new TreservationDAO();
        user = usersDAO.get(id);
        user.setName(name);
        user.setEmail(email);
        user.setCollege(college);
        user.setContact(contact);
        user.setSex(sex);
        user.setDetail(detail);
        user.setAnswer(answer);
        user.setQuestion(question);
        usersDAO.update(user);
        unconfirmedList = reservationDA0.get(id, 0);
        confirmedList = reservationDA0.get(id, 1);
        unjudgedList = reservationDA0.get(id, 2);
        judgedList = reservationDA0.get(id, 3);
        if (user.getType() == 1) {
            nullList = treservationDAO.getNullList(id);
            return "successTea";
        } else {
            refusedList = reservationDA0.get(id, 4);
            return "successStu";
        }

    }

    public void setName(String name) {
        this.name = name;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public void setSex(byte sex) {
        this.sex = sex;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setId(String id) {
        this.id = id;
    }

    public UsersEntity getUser() {
        return user;
    }

    public ArrayList getUnjudgedList() {
        return unjudgedList;
    }

    public ArrayList getJudgedList() {
        return judgedList;
    }

    public ArrayList getUnconfirmedList() {
        return unconfirmedList;
    }

    public ArrayList getConfirmedList() {
        return confirmedList;
    }

    public ArrayList getRefusedList() {
        return refusedList;
    }

    public List getNullList() {
        return nullList;
    }
}