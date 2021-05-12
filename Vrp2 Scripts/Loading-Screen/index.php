<!DOCTYPE html>
<html lang="en">
<head>
	<title>loading screen</title>
	<meta charset="utf-8">
	<meta content="width=device-width,initial-scale=1,user-scalable=no" name="viewport">
	<link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet" type="text/css">
	<style>
	         html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
	         overflow: hidden;
	         margin: 0;
	         padding: 0;
	         border: 0;
	         font-size: 100%;
	         font: inherit;
	         vertical-align: baseline;}
	      *, *:before, *:after {
	         box-sizing: border-box;
	      }

	      strong {
	         color: inherit;
	         font-weight: bolder;
	      }

	      body:before {
	         content: '';
	         display: block;
	         position: fixed;
	         top: 0;
	         left: 0;
	         width: 100vw;
	         height: 100vh;
	         z-index: 0;
	         -moz-pointer-events: none;
	         -webkit-pointer-events: none;
	         -ms-pointer-events: none;
	         pointer-events: none;
	         -moz-transform: scale(1);
	         -webkit-transform: scale(1);
	         -ms-transform: scale(1);
	         transform: scale(1);
	         background-image: linear-gradient(to top, rgba(31, 31, 31, 0.851), rgba(31, 31, 31, 0.851)), url('bg.jpg');
	         background-position: 0% 0%, center;
	         background-repeat: repeat, repeat;
	         background-size: auto, cover;
	         background-attachment: scroll;
	         background-color: #FFFFFF;
	      }


	      html {
	         font-size: 18pt;
	      }
	      #wrapper {
	         -webkit-overflow-scrolling: touch;
	         display: -moz-flex;
	         display: -webkit-flex;
	         display: -ms-flex;
	         display: flex;
	         -moz-flex-direction: column;
	         -webkit-flex-direction: column;
	         -ms-flex-direction: column;
	         flex-direction: column;
	         -moz-align-items: center;
	         -webkit-align-items: center;
	         -ms-align-items: center;
	         align-items: center;
	         -moz-justify-content: center;
	         -webkit-justify-content: center;
	         -ms-justify-content: center;
	         justify-content: center;
	         min-height: 100vh;
	         position: relative;
	         z-index: 2;
	         overflow: hidden;
	      }
	      #main {
	         display: -moz-flex;
	         display: -webkit-flex;
	         display: -ms-flex;
	         display: flex;
	         position: relative;
	         max-width: 100%;
	         z-index: 1;
	         -moz-align-items: center;
	         -webkit-align-items: center;
	         -ms-align-items: center;
	         align-items: center;
	         -moz-justify-content: center;
	         -webkit-justify-content: center;
	         -ms-justify-content: center;
	         justify-content: center;
	         -moz-flex-grow: 0;
	         -webkit-flex-grow: 0;
	         -ms-flex-grow: 0;
	         flex-grow: 0;
	         -moz-flex-shrink: 0;
	         -webkit-flex-shrink: 0;
	         -ms-flex-shrink: 0;
	         flex-shrink: 0;
	         text-align: center;
	         -moz-transition: opacity 1.5s ease-in-out 0.5s;
	         -webkit-transition: opacity 1.5s ease-in-out 0.5s;
	         -ms-transition: opacity 1.5s ease-in-out 0.5s;
	         transition: opacity 1.5s ease-in-out 0.5s;
	      }
	      #main>.inner {
	         position: relative;
	         z-index: 1;
	         border-radius: inherit;
	         padding: 3.75rem 3rem;
	         max-width: 100%;
	         width: 40rem;
	      }
	      #main>.inner>* {
	         margin-top: 1.5rem;
	         margin-bottom: 1.5rem;
	      }
	      #main>.inner> :first-child {
	         margin-top: 0 !important;
	      }
	      #main>.inner> :last-child {
	         margin-bottom: 0 !important;
	      }
	      #main>.inner>.full {
	         margin-left: calc(-3rem);
	         width: calc(100% + 6rem + 0.4725px);
	         max-width: calc(100% + 6rem + 0.4725px);
	      }
	      #main>.inner>.full:first-child {
	         margin-top: -3.75rem !important;
	         border-top-left-radius: inherit;
	         border-top-right-radius: inherit;
	      }
	      #main>.inner>.full:last-child {
	         margin-bottom: -3.75rem !important;
	         border-bottom-left-radius: inherit;
	         border-bottom-right-radius: inherit;
	      }
	      #main>.inner>.full.screen {
	         width: 100vw;
	         max-width: 100vw;
	         position: relative;
	         border-radius: 0 !important;
	         left: 50%;
	         right: auto;
	         margin-left: -50vw;
	      }

	      footer {
	       color: white;
	       position: absolute;
	       bottom: 0;
	       right: 0;
	       font-family: 'Permanent Marker', cursive;
	       padding: 15px;
	      }

	      h1 br+br, h2 br+br, h3 br+br, p br+br {
	         display: block;
	         content: ' ';
	         margin-top: 0.9rem;
	      }
	      h1 .li, h2 .li, h3 .li, p .li {
	         display: list-item;
	         padding-left: 0.5em;
	         margin: 0.75em 0 0 1em;
	      }
	      #text01 br+br {
	         margin-top: 1.05rem;
	      }
	      #text01 {
	         font-size: 2em;
	         line-height: 1.75;
	      }
	      h1, h2, h3, p {
	         color: #FFFFFF;
	         font-family: 'Permanent Marker', cursive;
	         font-size: 2.5em;
	         line-height: 1.5;
	         font-weight: 100;
	      }
	      hr {
	         width: 100%;
	         position: relative;
	         padding: 0;
	         border: 0;
	         height: 0.5rem;
	         line-height: 0.5rem;
	      }
	      hr:before {
	         content: '';
	         display: inline-block;
	         vertical-align: middle;
	         width: 15%;
	         background-color: #FFFFFF;
	         height: 1px;
	      }
	      @media (max-width: 1680px) {
	         html {
	             font-size: 13pt;
	         }
	      }
	      @media (max-width: 1280px) {
	         html {
	             font-size: 13pt;
	         }
	      }
	      @media (max-width: 980px) {
	         html {
	             font-size: 11pt;
	         }
	      }
	      @media (max-width: 736px) {
	         html {
	             font-size: 11pt;
	         }
	         #main>.inner {
	             padding: 3.5rem 2rem;
	         }
	         #main>.inner>* {
	             margin-top: 1.5rem;
	             margin-bottom: 1.5rem;
	         }
	         #main>.inner>.full {
	             margin-left: calc(-2rem);
	             width: calc(100% + 4rem + 0.4725px);
	             max-width: calc(100% + 4rem + 0.4725px);
	         }
	         #main>.inner>.full:first-child {
	             margin-top: -3.5rem !important;
	         }
	         #main>.inner>.full:last-child {
	             margin-bottom: -3.5rem !important;
	         }
	         #main>.inner>.full.screen {
	             margin-left: -50vw;
	         }
	         #divider02 {
	             height: 0.5rem;
	             line-height: 0.5rem;
	         }
	      }

	      }
	      @media (max-width: 360px) {
	         #main>.inner {
	             padding: 2.625rem 1.5rem;
	         }
	         #main>.inner>* {
	             margin-top: 1.125rem;
	             margin-bottom: 1.125rem;
	         }
	         #main>.inner>.full {
	             margin-left: calc(-1.5rem);
	             width: calc(100% + 3rem + 0.4725px);
	             max-width: calc(100% + 3rem + 0.4725px);
	         }
	         #main>.inner>.full:first-child {
	             margin-top: -2.625rem !important;
	         }
	         #main>.inner>.full:last-child {
	             margin-bottom: -2.625rem !important;
	         }
	         #main>.inner>.full.screen {
	             margin-left: -50vw;
	         }
	         #text02 {
	             font-size: 6em;
	         }
	      }
	         .spinner {
	         overflow: hidden;
	       width: 40px;
	       height: 40px;
	       margin: 100px auto;
	       background-color: #FFF;

	       border-radius: 100%;  
	       -webkit-animation: sk-scaleout 1.0s infinite ease-in-out;
	       animation: sk-scaleout 1.0s infinite ease-in-out;
	      }

	      @-webkit-keyframes sk-scaleout {
	       0% { -webkit-transform: scale(0) }
	       100% {
	         -webkit-transform: scale(1.0);
	         opacity: 0;
	       }
	      }

	      @keyframes sk-scaleout {
	       0% { 
	         -webkit-transform: scale(0);
	         transform: scale(0);
	       } 100% {
	         -webkit-transform: scale(1.0);
	         transform: scale(1.0);
	         opacity: 0;
	       }
	      }
	      #rules {
	      height: 40px;
	      width: 816px;
	      background-color: rgba(0, 0, 0, .5);
	      font-size: 25px;
	   }
	   p #rules {
	      width: 816px;
	      color: white;
	      font-family: 'Permanent Marker', cursive;
	   }
	   @media (max-width:1680px) {
	      #rules {
	          width: 600px
	      }
	   }
	.heart {
	 fill: red;
	 position: relative;
	 top: 7px;
	 padding: 5px;
	 width: 30px;
	 animation: pulse 1s ease infinite;
	}

	@keyframes pulse {
	 0% {
	   transform: scale(1);
	 }
	 50% {
	   transform: scale(1.3);
	 }
	 100% {
	   transform: scale(1);
	 }
	}
	</style>
</head>
<body>
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<h1 id="text02 title" style="font-size:6em;">ВОСХОД</h1>
				<p id="text01 desc" style="font-size:4em;">RolePlay</p>
				<p id="rules"></p>
				<hr id="divider02">
				<p id="text01">коннект...</p>
				<div class="spinner"></div>
			</div>
		</div>
		<footer>
			
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	</script> 
	<script src="config.js">
	</script>
</body>
</html>