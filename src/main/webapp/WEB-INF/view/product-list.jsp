<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@page isELIgnored="false"%>
<%@ include file="header.jsp" %>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"> <strong class="text-black">Product List</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
    
      <div class="container">
      <sf:form action="/prod/search" method="post" modelAttribute="form">
        <div class="row mb-5">
          
          <sf:input type="hidden" path="id" />

		<sf:input type="hidden" path="pageNo" />
		<sf:input type="hidden" path="pageSize" />

		<sf:input type="hidden" path="listsize" />
		<sf:input type="hidden" path="total" />
		<sf:input type="hidden" path="pagenosize" />
          <div class="form-group row">
             <s:bind path="categoryId">
               
                  <div class="col-md-4">
                
										<sf:select class="form-control" path="${status.expression}">
									<sf:option value="-1" label="Select Brand" />
									<sf:options itemLabel="name" itemValue="id" items="${catList}" />
								</sf:select>
                  </div>
               </s:bind>
                  <s:bind path="price">
                <div class="col-md-4">
                    <sf:input  path="${status.expression}"
									placeholder="Enter Price" class="form-control" />
                </div>
               </s:bind>
               
                <div class="col-md-4">
                    <input type="submit" class="btn btn-primary btn-sm btn-block" name="operation" value="Search">
                </div>
               </div>
            <div class="site-blocks-table">
            <b><%@ include file="businessMessage.jsp" %></b>
              <table class="table table-bordered">
                <thead>
                  <tr>
                   <th class="product-thumbnail">Image</th>
                    <th class="product-name">Name</th>
                     <th class="product-price">Price</th>
                      <th class="product-price">Description</th>
                    <th class="product-remove">Edit</th>
                    <th class="product-remove">Remove</th>
                  </tr>
                </thead>
             
                <tbody>
                
                   <c:forEach items="${list}" var="pd" varStatus="cs">
                  <tr>
                    <td class="product-thumbnail">
                      <img src="/prod/getImage/<c:out value='${pd.id}'/>" alt="Image" class="img-fluid">
                    </td>
                    <td class="product-name">
                      <h2 class="h5 text-black">${pd.name}</h2>
                    </td>
                    <td>${pd.price}</td>
                    <td>${pd.description}</td>
                    <td><a href="/prod?id=${pd.id}" class="btn btn-primary btn-sm">Edit</a></td>
                    <td><a href="/prod/search?pidd=${pd.id}&operation=Delete" class="btn btn-primary btn-sm">X</a></td>
                  </tr>

                </c:forEach>
                </tbody>
              </table>
            </div>
          
        </div>

      <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
            
              <div class="col-md-6 mb-3 mb-md-0">
            	<input type="submit" name="operation" <c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
					class="btn btn-primary btn-sm btn-block" value="Previous">
              </div>
              <div class="col-md-6">
            	<input type="submit" name="operation" <c:if test="${total == pagenosize  || listsize < pageSize   }">disabled="disabled"</c:if>
					class="btn btn-primary btn-sm btn-block"  value="Next">
              </div>
            </div>
            
          </div>
         
      </div>
    </sf:form>
    </div>
    </div>
<div style=" margin-top: 60px">  
<%@ include file="footer.jsp" %>
</div>
</div>