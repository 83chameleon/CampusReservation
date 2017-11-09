package Helper;

import DAO.SreservationDAO;
import DAO.TreservationDAO;
import DAO.UsersDAO;
import Entity.SreservationEntity;
import Entity.TreservationEntity;
import Entity.UsersEntity;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Mapping {

    public Mapping(){

    }

    public Map reservationMap(String id){     //获取某教授或学生全部预约（教授部分+学生部分）
        UsersDAO usersDAO = new UsersDAO();
        SreservationDAO sreservationDAO = new SreservationDAO();
        TreservationDAO treservationDAO = new TreservationDAO();
        SreservationEntity sreservationEntity;
        TreservationEntity treservationEntity;
        UsersEntity usersEntity;
        Map<Object, Object> teacherMap = new HashMap<>();
        List list = sreservationDAO.get(id);
        while (true){
            sreservationEntity = (SreservationEntity) list.iterator().next();
            if(sreservationEntity != null){
                treservationEntity = treservationDAO.get(sreservationEntity.getTorder());
                usersEntity = usersDAO.get(sreservationEntity.getStudentId());
                teacherMap.put(sreservationEntity, treservationEntity);
                teacherMap.put(sreservationEntity, usersEntity);
            }
            else {
                break;
            }
        }
        return teacherMap;
    }

}