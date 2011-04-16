<cfcomponent displayname="FarCry Twitter" extends="farcry.core.packages.rules.rules" bObjectBroker="true" lObjectBrokerWebskins="execute">
<!---
	Name			: ruleFarcryTwitter.cfc
	Author			: Michael Sharman
	Created			: April 16, 2011
	Last Updated		: April 16, 2011
	History			: Initial release (mps 16/04/2011)
	Purpose			: FarCry publishing rule for loading twitter feeds via the twitter api. Recommended to 
					: cache (via objectBroker) due to twitter rate limiting (150 per hour)
					: http://www.chapter31.com/farcrytwitter/
					: http://www.github/michaelsharman/farcrytwitter/
 --->

	<cfproperty ftSeq="1" ftFieldset="Preferences" name="username" type="string" dbPrecision="50" ftValidation="required" ftLabel="Twitter username">
	<cfproperty ftSeq="7" ftFieldset="Preferences" name="rpp" type="string" dbPrecision="10" ftValidation="required,number" ftDefault="5" ftLabel="Number of Tweets">
	<cfproperty ftSeq="10" ftFieldset="Preferences" name="live" type="string" ftType="boolean" dbPrecision="10" ftDefault="1" ftLabel="Poll for new results?">
	<cfproperty ftSeq="11" ftFieldset="Preferences" name="avatars" type="string" ftType="boolean" dbPrecision="10" ftDefault="1" ftLabel="Show avatars?">
	<cfproperty ftSeq="12" ftFieldset="Preferences" name="hashtags" type="string" ftType="boolean" dbPrecision="10" ftDefault="1" ftLabel="Show hashtags?">
	<cfproperty ftSeq="13" ftFieldset="Preferences" name="timestamp" type="string" ftType="boolean" dbPrecision="10" ftDefault="1" ftLabel="Show timestamps?">
	<cfproperty ftSeq="15" ftFieldset="Preferences" name="scrollbar" type="string" dbPrecision="10" ftType="boolean" ftLabel="Scrollbar?">
	<cfproperty ftSeq="30" ftFieldset="Appearance (Frame)" name="theme_background" type="string" dbPrecision="10" ftLabel="Background Colour">
	<cfproperty ftSeq="31" ftFieldset="Appearance (Frame)" name="theme_color" type="string" dbPrecision="10" ftLabel="Text Colour">
	<cfproperty ftSeq="32" ftFieldset="Appearance (Tweets)" name="tweets_background" type="string" dbPrecision="10" ftLabel="Background Colour">
	<cfproperty ftSeq="33" ftFieldset="Appearance (Tweets)" name="tweets_color" type="string" dbPrecision="10" ftLabel="Text Colour">
	<cfproperty ftSeq="34" ftFieldset="Appearance (Tweets)" name="tweets_links" type="string" dbPrecision="10" ftLabel="Link Colour">
	<cfproperty ftSeq="35" ftFieldset="Dimensions" name="width" type="string" dbPrecision="10" ftValidation="required" ftDefault="280" ftLabel="Width" ftHelp="Integer or 'auto'">
	<cfproperty ftSeq="36" ftFieldset="Dimensions" name="height" type="string" dbPrecision="10" ftValidation="required,number" ftDefault="340" ftLabel="Height">
	<cfproperty ftSeq="40" ftFieldset="Behaviour" name="behaviour" type="string" dbPrecision="100" ftType="list" ftRenderType="radio" ftList="all:Load all tweets?,default:Timed Interval?" ftDefault="all" ftLabel="Load behaviour?">
	<cfproperty ftSeq="41" ftFieldset="Behaviour" name="loopResults" type="string" dbPrecision="10" ftType="boolean" ftLabel="Loop results? Relevant if timed interval">
	<cfproperty ftSeq="42" ftFieldset="Behaviour" name="tweetInterval" type="string" dbPrecision="10" ftValidation="number" ftDefault="" ftLabel="Tweet interval (milliseconds). Relevant if timed interval">
	<cfproperty ftSeq="50" ftFieldset="Config" name="scriptSourceType" type="string" ftType="list" ftList="internal:Internal (load from your site),external:External (load from twitter)" ftDefault="external" dbPrecision="100" ftLabel="Script source type">
	<cfproperty ftSeq="51" ftFieldset="Config" name="scriptPath" type="string" dbPrecision="100" ftLabel="Set script path (needed if above is internal)">
	

</cfcomponent>