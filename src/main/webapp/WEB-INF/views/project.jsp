<%@include file="header.jsp"%>
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
			<h1>${project.name}
		    	<div class="btn-group btn-group-sm" role="group" aria-label="..."  >
		    		<button type="button" class="btn btn-primary"
				  		  data-toggle="modal" data-target="#projectTraitsManagerModal"
				  		  >
				  		<i class="fa fa-bars" aria-hidden="true"></i>
				  		Project Traits Manager
				  	</button>
				  	<button type="button" class="btn btn-warning"
				  		  data-toggle="modal" data-target="#editProjectModal"
				  		  >
				  		<i class="fa fa-pencil" aria-hidden="true"></i>
				  		Edit Project
				  	</button>
				  		<a class="btn btn-danger" href="<c:url value="/delete/project/${project.id}/" />">
				  		<i class="fa fa-trash" aria-hidden="true"></i>
				  		Delete Project 	</a>
				  	</button>
				</div>
			</h1>
			<h3>Description</h3>
			<p> <c:choose>
					<c:when test="${empty project.description}">
						Empty
					</c:when>
					<c:otherwise>
						${project.description}
					</c:otherwise>
				</c:choose>
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-5 col-sm-offset-1">
			<h3>Start Date</h3>
			<p>${project.startDate}</p>
		</div>
		<div class="col-sm-5">
			<h3>End Date</h3>
			<p>${project.endDate}</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-5 col-sm-offset-1">
			<h3>Status</h3>
			<p>
				<c:choose>
					<c:when test="${project.isCompleted}">
						Completed
					</c:when>
					<c:otherwise>
						Active
					</c:otherwise>
				</c:choose>
			</p>
		</div>
		<div class="col-sm-5">
			
				<h3>Cheid Mentor</h3>
				<p>
					<c:choose>
						<c:when test="${project.chiefMentor ne null}">
							${project.chiefMentor.firstName} ${project.chiefMentor.lastName}
						</c:when>
						<c:otherwise>
							Not assigned yet
						</c:otherwise>
					</c:choose>
			</p>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
			<h2>Files
				<button type="button" class="btn btn-success"
					data-toggle="modal" data-target="#addFileToProjectModal">
					<i class="fa fa-plus-circle" aria-hidden="true"></i>
						Add file
				</button>
			</h2>
			
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
			<h2>Teams
				<button type="button" class="btn btn-success"
					data-toggle="modal" data-target="#createTeamModal">
					<i class="fa fa-plus-circle" aria-hidden="true"></i>
						Create team
				</button>
			</h2>
			
		</div>
	</div>

<!-- editProjectModal -->
	<div class="modal fade" id="editProjectModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Edit Project</h4>
	      </div>
	      <form name="createProjectForm" id="createProjectForm" onsubmit="onSubmitEditProjectForm();"
	        	action="/spms/update/project/${project.id}/" method="post">
	      	<div class="modal-body">
	        
				<div class="form-group">
					<label for="name">Project name:</label>
				    <input type="text" class="form-control" name="name" id="newProjectName" placeholder="Enter new project name" value="${project.name}" required>
				</div>
				<div class="form-group">
					<label for="description">Project description:</label>
				    <textarea class="form-control" rows="3" name="description" id="newProjectDescription" placeholder="Enter project description" ></textarea>
				</div>
				<div class="form-group">
		        	<label for="startDate">Start date:</label>
		            <div class='input-group date' id='datetimepicker6'>
		                <input type='text' class="form-control" name="startDate" id="endProjectStartDate" placeholder="Enter start date"  required/>
		                <span class="input-group-addon">
		                    <span class="glyphicon glyphicon-calendar"></span>
		                </span>
		            </div>
		        </div>

		        <div class="form-group">
		        	<label for="endDate">End Date:</label>
		            <div class='input-group date' id='datetimepicker7'>
		                <input type='text' class="form-control" name="endDate" id="endProjectStartDate" placeholder="Enter end date" required/>
		                <span class="input-group-addon">
		                    <span class="glyphicon glyphicon-calendar"></span>
		                </span>
		            </div>
		        </div>
		        <script type="text/javascript">
				    $(function () {
				    	console.log(new Date('${project.startDate}'));
				        $('#datetimepicker6').datetimepicker();
						
				        $('#datetimepicker7').datetimepicker({
				            useCurrent: false //Important! See issue #1075
				        });
				        
				        $("#datetimepicker6").on("dp.change", function (e) {
				            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
				        });
				        $("#datetimepicker7").on("dp.change", function (e) {
				            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
				        });
				        $('#datetimepicker6').data("DateTimePicker").date(moment('${project.startDate}'));
				        $('#datetimepicker7').data("DateTimePicker").date(moment('${project.endDate}'));
				    });
					
				</script>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	        <button type="submit" value="Submit" class="btn btn-primary" >Update</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>

<%@include file="footer.jsp"%>