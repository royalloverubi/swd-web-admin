<%-- 
    Document   : cyberinfo
    Created on : Nov 11, 2018, 11:35:57 PM
    Author     : royal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="fontawesome-free-5.4.1-web/css/all.css">
        <link rel="stylesheet" href="bootstrap-3.1.1-dist/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Cyber Page</title>
        <style>
            .checked {
                color: orange;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <hr/>
            </div>
            <div class="row">
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <p class="navbar-brand">Quản lí quán net</p>
                        </div>
                        <ul class="nav navbar-nav">
                            <li><a href="cyber">Yêu cầu đặt chỗ</a></li>
                            <li><a href="cyberInfo">Thông tin quán net</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> <s:property value="%{#session.CYBER.username}"/></a></li>
                            <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Đăng xuất</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="row">
                <h3 class="text-center">Thông tin cơ bản</h3>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <img src="<s:property value="%{cyberDetail.logo}"/>" width="100%">
                </div>
                <div class="col-md-10">
                    <h4><b>Tên quán :</b> <s:property value="%{cyberDetail.name}"/></h4>
                    <h4><b>Địa chỉ :</b> <s:property value="%{cyberDetail.address}"/></h4>
                    <h4><b>Đánh giá người dùng : </b><span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span></h4>
                </div>

            </div>

            <div class="row">
                <h3 class="text-center">Thông tin phòng</h3>
            </div>
            <div class="row">
                <s:if test="%{listRoom != null}">
                    <table class="table">
                        <thead>
                        <th>STT</th>
                        <th>Tên Phòng</th>
                        <th>Mô tả</th>
                        <th>Giá</th>
                        </thead>
                        <tbody>
                            <s:iterator value="listRoom" status="counter">
                                <tr>
                                    <s:form action="updateRoom" theme="simple">
                                        <td>
                                            <s:property value="%{#counter.count}"/>
                                            <s:hidden name="id" value="%{id}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="name" cssClass="form-control" value="%{name}"/>
                                        </td>
                                        <td>
                                            <s:textarea name="description" cssClass="form-control" value="%{description}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="price" cssClass="form-control" value="%{price}"/>
                                        </td>
                                        <td>
                                            <s:submit value="Lưu" cssClass="btn btn-info"/>
                                        </td>
                                    </s:form>
                                    <td>
                                        <form action="deleteRoom">
                                            <s:hidden name="id" value="%{id}"/>
                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                        </form>
                                    </td>
                                </tr>
                            </s:iterator>
                            <tr>
                                <s:form action="insertRoom" theme="simple">
                                    <td>
                                    </td>
                                    <td>
                                        <s:textfield name="name"  cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:textarea name="description"  cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:textfield name="price"  cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:submit value="Thêm" cssClass="btn btn-success"/>
                                    </td>
                                </s:form>
                            </tr>
                        </tbody>
                    </table>
                </s:if>
            </div>
            <div class="row">
                <h3 class="text-center">Cấu hình máy</h3>
            </div>
            <div class="row">
                <s:if test="%{listConfig != null}">
                    <table class="table">
                        <thead>
                        <th>STT</th>
                        <th>Tên cấu hình</th>
                        <th>CPU</th>
                        <th>GPU</th>
                        <th>RAM</th>
                        <th>Chuột</th>
                        <th>Bàn phím</th>
                        <th>Tai nghe</th>
                        <th>Giá</th>
                        </thead>
                        <tbody>
                            <s:iterator value="listConfig" status="counter">
                                <tr>
                                    <s:form action="updateConfig" theme="simple">
                                        <td>
                                            <s:property value="%{#counter.count}"/>
                                            <s:hidden name="id" value="%{id}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="name" cssClass="form-control" value="%{name}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="cpu" cssClass="form-control" value="%{cpu}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="gpu" cssClass="form-control" value="%{gpu}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="ram" cssClass="form-control" value="%{ram}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="mouse" cssClass="form-control" value="%{mouse}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="keyboard" cssClass="form-control" value="%{keyboard}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="headphone" cssClass="form-control" value="%{headphone}"/>
                                        </td>
                                        <td>
                                            <s:textfield name="price" cssClass="form-control" value="%{price}"/>
                                        </td>
                                        <td>
                                            <s:submit value="Lưu" cssClass="btn btn-info"/>
                                        </td>
                                    </s:form>
                                    <td>
                                        <form action="deleteConfig">
                                            <s:hidden name="id" value="%{id}"/>
                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                        </form>
                                    </td>
                                </tr>
                            </s:iterator>
                            <tr>
                                <s:form action="insertConfig" theme="simple">
                                    <td></td>
                                    <td>
                                        <s:textfield name="name" cssClass="form-control" label="Tên cấu hình : "/>
                                    </td>
                                    <td>
                                        <s:textfield name="cpu" cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:textfield name="gpu" cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:textfield name="ram" cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:textfield name="mouse" cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:textfield name="keyboard" cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:textfield name="headphone" cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:textfield name="price" cssClass="form-control"/>
                                    </td>
                                    <td>
                                        <s:submit value="Thêm" cssClass="btn btn-success"/>
                                    </td>
                                    <td></td>
                                </s:form>
                            </tr>

                        </tbody>
                    </table>
                </s:if>
            </div>

        </div>

    </body>
</html>
