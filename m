Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2337179lfc;
        Sun, 31 May 2020 08:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW4i/J6I1RLfyfefXAvNEJCfdZvrjA89N89k+92VpKS8HbQBkvm9ijdk8hK9KqXhJZM2S8
X-Received: by 2002:a25:cd82:: with SMTP id d124mr28529527ybf.150.1590940701133;
        Sun, 31 May 2020 08:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590940701; cv=none;
        d=google.com; s=arc-20160816;
        b=Xwy3fh1SSRaAvMkNXYe8jJ7NI9dycdqarH2sUKXoJ1q+LL8LP4W3ZMlCpDYa+HjejR
         0lG/cF8ncgSfORKtjJPc3kgjvCce87KYET+HeTVXNI/WWROgU4i5uSuPKDc0A043w2v8
         v8WoLDYY+34x8EN/RMO7MYRVA7YRKgj2gTjlcvCTeu2VtmLIY83YlxKiTbaZ/mc3o3lH
         M0wrdVvxT++StEZMm4eDaB/3L+pURJzS3KRIH6l0Q6UzuVespRdxRf2hSeHpw5sCXg8k
         jsVvUxBrR+Jt1zULgTqVFMVWZcJlD2Ygs+8AfNXj/YPQ0UU7lyGNb4ODFi44c7XMUlzw
         eHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:ironport-sdr:ironport-sdr;
        bh=VcshUsntyE+737Db8PTsl7zOSx3FQWsR4XI0a+MW/iY=;
        b=bbnh61OlNdQVn+qD8H/46drhni1Z6wgAuTXXnsfuQEsVNh61wwzSPpklz4jIG9/pld
         4MaoDitZUGcZUQhrFjFc+uNTpDeq1HwkiYua8v/K3foZtyD+CRTrNihkrjSeSbZoi3b4
         YlWhdf+ox96ueLVNeU9rDucL+3uMEDNEbHKfw5o+u1RorsIOtE6HletGpkkwmPemj7bF
         O63ReXebnnxxzKrR3czAc/aY5LMj29kOV2RdW52EwqdYivc6UiJvXj7kLQzmyM27XHXA
         cRirZnnuw/ubhMiUw+4uV66cwjPRYwe66+BQhKAG1NQGb0JIUJbC9to2FNdBpnDBzGEn
         C/Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si12591541yba.363.2020.05.31.08.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 08:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfQLs-0007eE-DR
	for alex.bennee@linaro.org; Sun, 31 May 2020 11:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mina_Magdy@mentor.com>)
 id 1jfGa9-0007Xk-96
 for qemu-arm@nongnu.org; Sun, 31 May 2020 01:32:25 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:49392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mina_Magdy@mentor.com>)
 id 1jfGa6-0006ga-AV
 for qemu-arm@nongnu.org; Sun, 31 May 2020 01:32:24 -0400
IronPort-SDR: 4hk44ranVNU/srte5xLxdeyXa3+dkLWLHHVKuTmvSEm8PihpUniA4IbhWx3m+Ab8QsYnNQ6Pk7
 4mzOUc5jHC+xJUVTPI91EK0i2ZRo9RHjJfa518+FM5B28lVu3Ny0Ablgq0Ki6tF9Wma3UN3j47
 NTqcjLpj134qij7oaWW5pYj8ZTvCZZC8897F0BTn/9n2F63uApBc477Gf/ZBkdVds14lhoV5dM
 VqcW0ocTbJNdF38ruFvQ4CpLmqC0YJH1RD23UC1T8wBI2i0cQxpfyLxKDoxlDV5jEFNSiSaaac
 soc=
X-IronPort-AV: E=Sophos;i="5.73,455,1583222400"; d="scan'208,217";a="51411530"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 30 May 2020 21:32:16 -0800
IronPort-SDR: UCt7OwULJwCJkhIJLNAXpxAa/jWEEjBqxpMoAWC1tDRXZNlt6HRsbb+C+Ytt0BQaq9XiSfjbbN
 W6FpEvFb8Ovlb/b7CyxKx+EdhFGqez98OZ6QaGVVJlS4Tg3l9ptl9xN/XL76k+GmffEZTptg+h
 JaEdk4d0MetVlAaWp1JFc16ckTez2gyxOW/RHC86QLYEdRRwNe20s1UfEeLXzmF1q3mjqR8RoF
 zZwq4VcbZrMyFEz4QoNaen/d85AAbVPeaSrgxjGZ0G0k6hEpIB3HaV8yoLI1dzohx3hWpYyp0t
 3zI=
From: "Magdy, Mina" <Mina_Magdy@mentor.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: [Qemu-devel] [PATCH 10/20] nvic: Add NS alias SCS region
Thread-Topic: [Qemu-devel] [PATCH 10/20] nvic: Add NS alias SCS region
Thread-Index: AdY3DL+vCCrTWOV6Tb6NxcKWhoC+3Q==
Date: Sun, 31 May 2020 05:32:11 +0000
Message-ID: <4bdfe2a9431643f5b6265e5198a8620f@svr-ies-mbx-02.mgc.mentorg.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: multipart/alternative;
 boundary="_000_4bdfe2a9431643f5b6265e5198a8620fsvriesmbx02mgcmentorgco_"
MIME-Version: 1.0
Received-SPF: pass client-ip=68.232.129.153;
 envelope-from=Mina_Magdy@mentor.com; helo=esa1.mentor.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/31 01:32:17
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 31 May 2020 11:58:12 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zf++mDjaisVI

--_000_4bdfe2a9431643f5b6265e5198a8620fsvriesmbx02mgcmentorgco_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I hope everything is going well with you.
I'm currently going through this QEMU patch<https://lists.gnu.org/archive/h=
tml/qemu-devel/2017-08/msg04168.html> that related to adding the NS alias f=
or SCS region in ARMv8m cores.

So I've an enquiry about this code modification, if possible.

Why did you assumed that secure accesses to the alias act like NS accesses =
to the real region registers. I discovered the any register that is accesse=
d through its alias address behaves like accessing it in no secure state (e=
xcept some cases where current security state is also considered along with=
 the accessed region) ?

My question was come up due to an issue while setting Application Interrupt=
 and Reset Control Register (AIRCR). BFHFNMINS , I tried to set in secure s=
tate  but through the alias register. But as investigated from QEMU code, t=
he current security state is set to 0 (no secure) but the CPU state is stil=
l secure and wasn't switched at this point.
So any help for this issue. I really appreciate your help and your consider=
ation.

Best Regards,
Mina.


--_000_4bdfe2a9431643f5b6265e5198a8620fsvriesmbx02mgcmentorgco_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hello all,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I hope everything is g=
oing well with you.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I&#8217;m currently go=
ing through this QEMU
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg04168.h=
tml">patch</a> that related to adding the NS alias for SCS region in ARMv8m=
 cores.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">So I&#8217;ve an enqui=
ry about this code modification, if possible.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Why did you assumed th=
at secure accesses to the alias act like NS accesses to the real region reg=
isters. I discovered the any register that is accessed through its alias ad=
dress behaves like accessing it in no
 secure state (except some cases where current security state is also consi=
dered along with the accessed region) ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"color:=
#1F497D">My question was come up due to an issue while setting
<b>Application Interrupt and Reset Control Register (AIRCR).</b></span><spa=
n class=3D"MsoHyperlink">
</span><b><span style=3D"color:#1F497D">BFHFNMINS</span></b> <span style=3D=
"color:#1F497D">
, I tried to set in secure state</span><span dir=3D"RTL"></span><span dir=
=3D"RTL" style=3D"font-family:&quot;Arial&quot;,sans-serif;color:#1F497D"><=
span dir=3D"RTL"></span>
</span><span lang=3D"AR-SA" dir=3D"RTL" style=3D"color:#1F497D">&nbsp;</spa=
n><span style=3D"color:#1F497D">but through the alias register. But as inve=
stigated from QEMU code, the current security state is set to 0 (no secure)=
 but the CPU state is still secure and wasn&#8217;t
 switched at this point.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">So any help for this i=
ssue. I really appreciate your help and your consideration.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
mic Sans MS&quot;;color:#1F497D;mso-fareast-language:JA">Best Regards,<br>
Mina.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
</div>
</body>
</html>

--_000_4bdfe2a9431643f5b6265e5198a8620fsvriesmbx02mgcmentorgco_--
