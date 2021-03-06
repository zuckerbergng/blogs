package org.su.mapper;

import org.apache.ibatis.annotations.Param;
import org.su.pojo.User;

import java.util.List;

public interface UserMapper {
    public void addUser(User user);

    public void removeUserByUserName(@Param("username") String username);

    public void updateUserByUserName(User user);

    public User getUser(@Param("username") String username,@Param("password") String password);

    public List<User> queryAll();

    User getUserByUserName(String username);

    int addFavouriteNums(String username);

    int addFansNum(String username);

    int addFollowersNum(String username);

    int removeFavouriteNums(String username);

    int removeFansNum(String username);

    int removeFollowersNum(String username);

    // List<User> queryFollowingBloggers(String username);
}
