<div class="navbar-header">
	<button type="button" class="navbar-toggle" id="mobile-menu">
		<span component="notifications/icon" class="notification-icon fa fa-fw fa-bell-o" data-content="0"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>


</div>

<div id="nav-dropdown" class="hidden-xs">

	<!-- IF !maintenanceHeader -->

	<!-- IF config.searchEnabled -->
	<ul class="nav navbar-nav navbar-right">
		<li>
			<form id="search-form" class="navbar-form navbar-right hidden-xs" role="search" method="GET" action="">
				<button id="search-button" type="button" class="btn btn-link"><i class="fa fa-search fa-fw" title="[[global:header.search]]"></i></button>
				<div class="hidden" id="search-fields">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="[[global:search]]" name="query" value="">
						<a href="#"><i class="fa fa-gears fa-fw advanced-search-link"></i></a>
					</div>
					<button type="submit" class="btn btn-default hide">[[global:search]]</button>
				</div>
			</form>
		</li>
		<li class="visible-xs" id="search-menu">
			<a href="{relative_path}/search">
				<i class="fa fa-search fa-fw"></i> [[global:search]]
			</a>
		</li>
	</ul>
	<!-- ENDIF config.searchEnabled -->

	<ul class="nav navbar-nav hidden-xs">
		<li>
			<a href="#" id="reconnect" class="hide" title="Connection to {title} has been lost, attempting to reconnect...">
				<i class="fa fa-check"></i>
			</a>
		</li>
	</ul>

	<ul class="nav navbar-nav pagination-block visible-lg visible-md">
		<li class="dropdown">
			<i class="fa fa-angle-double-up pointer fa-fw pagetop"></i>
			<i class="fa fa-angle-up pointer fa-fw pageup"></i>

			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<span class="pagination-text"></span>
			</a>

			<i class="fa fa-angle-down pointer fa-fw pagedown"></i>
			<i class="fa fa-angle-double-down pointer fa-fw pagebottom"></i>

			<div class="progress-container">
				<div class="progress-bar"></div>
			</div>

			<ul class="dropdown-menu" role="menu">
				<input type="text" class="form-control" id="indexInput" placeholder="[[global:pagination.enter_index]]">
			</ul>
		</li>
	</ul>

	<ul id="main-nav" class="nav navbar-nav menu">
		<!-- BEGIN navigation -->
		<!-- IF function.displayMenuItem, @index -->
		<li class="{navigation.class}">
			<a class="button" href="{navigation.route}" title="{navigation.title}" <!-- IF navigation.id -->id="{navigation.id}"<!-- ENDIF navigation.id --><!-- IF navigation.properties.targetBlank --> target="_blank"<!-- ENDIF navigation.properties.targetBlank -->>

							<!-- IF navigation.text -->
							<span class="{navigation.textClass}">{navigation.text}</span>
							<!-- ENDIF navigation.text -->
						</a>
		</li>
		<!-- ENDIF function.displayMenuItem -->
		<!-- END navigation -->
		<!-- IF config.loggedIn -->

		<li class="dropdown text-center hidden-xs">
			<a href="#" title="" class="dropdown-toggle button" data-toggle="dropdown" id="tools_dropdown">
				Tools
			</a>
			<ul class="dropdown-menu" aria-labelledby="tools_dropdown">
				<li><a href="{relative_path}/roster">Roster</a></li>
				<li><a href="https://www.warcraftlogs.com/guilds/2365/" target="_blank">Logs</a></li>
				<!--<li><a href="{relative_path}/applications">Applications</a></li>-->
					<!-- IF user.isAdmin -->
				<li><a href="{relative_path}/admin">Admin</a></li>
					<!-- ENDIF user.isAdmin -->
			</ul>

			<li class="notifications dropdown text-center hidden-xs" component="notifications">
				<a href="#" title="[[global:header.notifications]]" class="dropdown-toggle button" data-toggle="dropdown" id="notif_dropdown">
					<i component="notifications/icon" class="fa fa-fw fa-bell-o" data-content="0"></i>
				</a>
				<ul class="dropdown-menu" aria-labelledby="notif_dropdown">
					<li>
						<ul component="notifications/list" class="notification-list">
							<li>
								<a href="#"><i class="fa fa-refresh fa-spin"></i> [[global:notifications.loading]]</a>
							</li>
						</ul>
					</li>
					<li class="notif-dropdown-link"><a href="#" class="mark-all-read">[[notifications:mark_all_read]]</a></li>
					<li class="notif-dropdown-link"><a href="{relative_path}/notifications">[[notifications:see_all]]</a></li>
				</ul>

				<li id="user_label" class="dropdown">
					<a class="dropdown-toggle button" data-toggle="dropdown" href="#" id="user_dropdown" title="[[global:header.profile]]">
						<span id="user-header-name">Profile</span>
					</a>
					<ul id="user-control-list" component="header/usercontrol" class="dropdown-menu" aria-labelledby="user_dropdown">
						<li>
							<a component="header/profilelink" href="{relative_path}/user/{user.userslug}">
								<i component="user/status" class="fa fa-fw fa-circle status {user.status}"></i> <span component="header/username">{user.username}</span>
							</a>
						</li>
						<li role="presentation" class="divider"></li>
						<li>
							<a href="#" class="user-status" data-status="online">
								<i class="fa fa-fw fa-circle status online"></i><span> [[global:online]]</span>
							</a>
						</li>
						<li>
							<a href="#" class="user-status" data-status="away">
								<i class="fa fa-fw fa-circle status away"></i><span> [[global:away]]</span>
							</a>
						</li>
						<li>
							<a href="#" class="user-status" data-status="dnd">
								<i class="fa fa-fw fa-circle status dnd"></i><span> [[global:dnd]]</span>
							</a>
						</li>
						<li>
							<a href="#" class="user-status" data-status="offline">
								<i class="fa fa-fw fa-circle status offline"></i><span> [[global:invisible]]</span>
							</a>
						</li>
						<li role="presentation" class="divider"></li>
						<li>
							<a href="{relative_path}/user/{user.userslug}/edit">
								<i class="fa fa-fw fa-edit"></i> <span>[[user:edit-profile]]</span>
							</a>
						</li>
						<li>
							<a href="{relative_path}/user/{user.userslug}/settings">
								<i class="fa fa-fw fa-gear"></i> <span>[[user:settings]]</span>
							</a>
						</li>
						<li role="presentation" class="divider"></li>
						<li component="user/logout">
							<a href="#"><i class="fa fa-fw fa-sign-out"></i><span> [[global:logout]]</span></a>
						</li>
					</ul>
				</li>

				<!-- IF !config.disableChat -->
				<li class="chats dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="[[global:header.chats]]" id="chat_dropdown" component="chat/dropdown">
						<i component="chat/icon" class="fa fa-comment-o fa-fw"></i> <span class="visible-xs-inline">[[global:header.chats]]</span>
					</a>
					<ul class="dropdown-menu" aria-labelledby="chat_dropdown">
						<li>
							<ul component="chat/list" class="chat-list">
								<li>
									<a href="#"><i class="fa fa-refresh fa-spin"></i> [[global:chats.loading]]</a>
								</li>
							</ul>
						</li>
						<li class="notif-dropdown-link"><a href="#" class="mark-all-read" component="chats/mark-all-read">[[modules:chat.mark_all_read]]</a></li>
						<li class="notif-dropdown-link"><a href="{relative_path}/chats">[[modules:chat.see_all]]</a></li>
					</ul>
				</li>
				<!-- ENDIF !config.disableChat -->
	</ul>
	<!-- ELSE -->

	<!-- IF allowRegistration -->
	<li>
		<a href="{relative_path}/register" class="button">
			<i class="fa fa-pencil visible-xs-inline"></i>
			<span>[[global:register]]</span>
		</a>
	</li>
	<!-- ENDIF allowRegistration -->
	<li>
		<a href="{relative_path}/login" class="button">
			<i class="fa fa-sign-in visible-xs-inline"></i>
			<span>[[global:login]]</span>
		</a>
	</li>

	<!-- ENDIF config.loggedIn -->
	</ul>

	<!-- ELSE -->
	<ul class="nav navbar-nav navbar-right">
		<li>
			<a href="{relative_path}/login">
				<i class="fa fa-sign-in visible-xs-inline"></i>
				<span>[[global:login]]</span>
			</a>
		</li>
	</ul>
	<!-- ENDIF !maintenanceHeader -->
</div>