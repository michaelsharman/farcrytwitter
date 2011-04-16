<cfsetting enablecfoutputonly="true">
<!---
	Name			: execute.cfm
	Author			: Michael Sharman
	Created			: April 16, 2011
	Last Updated		: April 16, 2011
	History			: Initial release (mps 16/04/2011)
	Purpose			: Execution template for the farcrytwitter plugin publishing rule.
					: Displays a twitter widget with user preferences (defined in via the rule)
					: http://www.chapter31.com/farcrytwitter/
					: http://www.github/michaelsharman/farcrytwitter/
 --->

<cfset scriptSource = "http://widgets.twimg.com/j/2/widget.js">
<cfparam name="stObj.scriptPath" default="">
<cfparam name="stObj.scriptSourceType" default="">
<cfparam name="stObj.username" default="">
<cfparam name="stObj.rpp" default="5">
<cfparam name="stObj.width" default="250">
<cfparam name="stObj.height" default="300">
<cfparam name="stObj.theme_background" default="##333333">
<cfparam name="stObj.theme_color" default="##ffffff">
<cfparam name="stObj.tweets_background" default="##000000">
<cfparam name="stObj.tweets_color" default="##fffff">
<cfparam name="stObj.tweets_links" default="##4aed05">
<cfparam name="stObj.avatars" default="false">
<cfparam name="stObj.hashtags" default="false">
<cfparam name="stObj.timestamp" default="">
<cfparam name="stObj.scrollbar" default="false">
<cfparam name="stObj.live" default="false">
<cfparam name="stObj.behaviour" default="">
<cfparam name="stObj.loopResults" default="false">
<cfparam name="stObj.tweetInterval" default="6000">


<!--- Note: If you want to load the js file locally, you must copy widget.js into your project webroot, or set an alias in your web config to the plugin www/statis/js/twitter folder --->
<cfif stObj.scriptSourceType EQ "internal" AND len(trim(stObj.scriptPath))>
	<cfset scriptSource = stObj.scriptPath>
</cfif>

<cfoutput>
<script src="#scriptSource#"></script>
<script>
	new TWTR.Widget({
		version: 2,
		type: 'profile',
		rpp: #stObj.rpp#,
		<cfif stObj.behaviour EQ "default">interval: #stObj.tweetInterval#,</cfif>
		width: #stObj.width#,
		height: #stObj.height#,
		theme: {
			shell: {
				background: '#stObj.theme_background#',
				color: '#stObj.theme_color#'
			},
			tweets: {
				background: '#stObj.tweets_background#',
				color: '#stObj.tweets_color#',
				links: '#stObj.tweets_links#'
			}
		},
		features: {
			avatars: #replaceList(stObj.avatars, "1,0", "true,false")#, // defaults to false for profile widget, but true for search & faves widget
			hashtags: #replaceList(stObj.hashtags, "1,0", "true,false")#,
			timestamp: #replaceList(stObj.timestamp, "1,0", "true,false")#,
			scrollbar: #replaceList(stObj.scrollbar, "1,0", "true,false")#,
			live: #replaceList(stObj.live, "1,0", "true,false")#,
			loop: #replaceList(stObj.loopResults, "1,0", "true,false")#,
			behavior: '#stObj.behaviour#',
		}
	}).render().setUser('#stObj.username#').start();
</script>
</cfoutput>


<cfsetting enablecfoutputonly="false">