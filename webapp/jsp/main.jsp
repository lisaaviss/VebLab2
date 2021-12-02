    <%@ page import="model.Point" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="history" type="beans.History" scope="session"/>

    <!DOCTYPE html>
    <html>
    <head>
        <title>Лабараторная работа 2</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
    </head>
    <body>
        <div id="header" align="center">
            <p>Лисунов Артём, гр. З232</p>
            <p>Лаб 2 Вариант 32490</p>
        </div>
        <div class="main" align="center">
            <table width="100%">
                <tr>
                    <td width="50%">
                        <table width="100%">
                            <form id="inputForm" action="" method="get">
                                <p class="warn-checkbox" hidden>You should chose Radius!</p>
                                <h2>X coordinate:</h2>
                                <div class="button-div">
                                    <input type="hidden" name="X">
                                    <button type="button" class="button in-button x-button" value="-5">-5</button>
                                    <button type="button" class="button in-button x-button" value="-4">-4</button>
                                    <button type="button" class="button in-button x-button" value="-3">-3</button>
                                    <button type="button" class="button in-button x-button" value="-2">-2</button>
                                    <button type="button" class="button in-button x-button" value="-1">-1</button>
                                    <button type="button" class="button in-button x-button" value="0">0</button>
                                    <button type="button" class="button in-button x-button" value="1">1</button>
                                    <button type="button" class="button in-button x-button" value="2">2</button>
                                    <button type="button" class="button in-button x-button" value="3">3</button>
                                </div>

                                <p class="warn-checkbox" hidden>Incorrect X.</p>


                                <h2>Y coordinate:</h2>
                                <label>
                                    <input name="Y" placeholder="Digit from -3 to 3." size="20px" type="text">
                                </label>
                                <p class="warn-checkbox" hidden>It is not a number.</p>
                                <p class="warn-checkbox" hidden>Y should be in the range from -3 to 3.</p>
                                <p class="warn-checkbox" hidden>Reduce number of significant digits in the fractional part to 15.</p>
                                <p class="warn-checkbox" hidden>Enter the number.</p>


                                <h2>Radius R:</h2>
                                <div class="button-div">
                                    <input type="hidden" name="R">
                                    <button type="button" class="button in-button r-button" value="1">1</button>
                                    <button type="button" class="button in-button r-button" value="2">2</button>
                                    <button type="button" class="button in-button r-button" value="3">3</button>
                                    <button type="button" class="button in-button r-button" value="4">4</button>
                                    <button type="button" class="button in-button r-button" value="5">5</button>
                                </div>

                                <p class="warn-checkbox" hidden>Incorrect R.</p>


                                <br>
                                <input type="hidden" name="offset">
                                <button type="submit" class="button submit-button" id="submit">Check</button>
                                <button type="button" class="button submit-button">Clean</button>
                            </form>
                        </table>
                    </td>
                    <td>
                        <canvas height="320px" width="320px" style="margin: 15px"></canvas>
                    </td>

                </tr>
            </table>
            <%if (history.getList().size()>0){%>
            <h1>Query history</h1><button type="button" onclick="clearHistory(); location.reload()" id="history-button" class="button history-button">Clean history</button><br>
            <table id="result-table">
                <tr id="table-headers"><th>x-coordinate</th><th>y-coordinate</th><th>Radius</th><th>Hit</th><th>Time of request</th></tr>
                <%
                    List<Point> list = new ArrayList<Point>(history.getList());
                    Collections.reverse(list);
                    for (Point p : list){%>
                <tr><td><%=p.getX()%></td><td><%=p.getY()%></td><td><%=p.getR()%></td><td><%=p.isInArea()%></td><td><%=p.getTime()%></td></tr>
                <%}%>
            </table>
            <%}%>
        </div>
        <script src="${pageContext.request.contextPath}/scripts/drawing.js"></script>
        <script src="${pageContext.request.contextPath}/scripts/main.js"></script>
        <script src="${pageContext.request.contextPath}/scripts/ajax.js"></script>
    </body>
    </html>
