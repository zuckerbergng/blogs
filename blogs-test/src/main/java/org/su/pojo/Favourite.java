package org.su.pojo;

public class Favourite {

  private String username;
  private int blogId;

  public Favourite() {
  }

  public Favourite(String username, int blogId) {
    this.username = username;
    this.blogId = blogId;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public int getBlogId() {
    return blogId;
  }

  public void setBlogId(int blogId) {
    this.blogId = blogId;
  }

}
