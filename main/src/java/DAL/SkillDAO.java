/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Skill;

/**
 *
 * @author ADMIN
 */
public class SkillDAO extends BaseDAO<Skill> {

    public ArrayList<Skill> getSkills() {
        ArrayList<Skill> skills = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Skills,SkillStatus where Skills.skillStatusId=SkillStatus.skillStatusId \n";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Skill s = new Skill();
                s.setSkillId(rs.getInt("skillId"));
                s.setSkillName(rs.getString("skillName"));
                s.setSkillStatus(rs.getString("skillStatus"));
                skills.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return skills;
    }

    public Skill getSkillById(int skillId) {
        Skill s = new Skill();
        try {
            String sql = "SELECT * FROM Skills,SkillStatus where Skills.skillStatusId=SkillStatus.skillStatusId and Skills.skillId=? \n";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, skillId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                s.setSkillId(rs.getInt("skillId"));
                s.setSkillName(rs.getString("skillName"));
                s.setSkillStatus(rs.getString("skillStatus"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean insertSkill(Skill ski) {
        try {
            String sql = "insert into Skills(skillName,skillStatusId) values(?,?)\n;";
            PreparedStatement statement = connection.prepareStatement(sql);
            int skillStatusId;
            statement.setString(1, ski.getSkillName());
            if (ski.getSkillStatus().equalsIgnoreCase("Active")) {
                skillStatusId = 1;
            } else {
                skillStatusId = 0;
            }
            statement.setInt(2, skillStatusId);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean updateSkillStatus(int skillId,String status) {
        String sql = "update Skills set skillStatusId = ? where skillId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            if(status.equalsIgnoreCase("Active"))stm.setInt(1,1);
            else stm.setInt(1, 0);
            stm.setInt(2, skillId);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }
    public static void main(String[] args) {
        SkillDAO db=new SkillDAO();
        db.updateSkillStatus(5, "Inactive");
        System.out.println(db.getSkillById(5).toString());
    }
}
