Received: by 10.25.221.202 with SMTP id w71csp1827770lfi;
        Sat, 12 Aug 2017 00:25:06 -0700 (PDT)
X-Received: by 10.55.140.196 with SMTP id o187mr22548839qkd.80.1502522706554;
        Sat, 12 Aug 2017 00:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502522706; cv=none;
        d=google.com; s=arc-20160816;
        b=uU7ZEvqpsb9YQcdpIMBCIG4ylq61lFWi5RcfUcWwIFGTeetGuZ6lRY61CArKEla4MK
         M47jpRgPRUpu9IPcPqR6QwLyVRQVsLTg7bUiEGw66zRufJ47HPbj/r5XKpwF5GDhYdSd
         sZLbRGI1kkZt8072vLL0ei1914cJ4Q+wzEERFrXzeU8vMYzb8OJxDy+k3stW8rWeDEmi
         OQAr5AbQrBIXaz0DDEXwBfJLesyvo5dtgvi6JS/TALs4WFIgVMLf9Tuxs8Q4JJKQ6+CL
         v2S5Qw+lw3Xjng2Yzh/c6g4hzTnKBPsvHPQ8RYC4IsZ677eoR7OL7EdxgI9M5Q0dSzA3
         9BuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature:dkim-filter
         :arc-authentication-results;
        bh=HXL0BPXLj+FlK7vTzEYiJfn11XI19y+0jomuD1LNX/0=;
        b=NVEIqXpfLIwvcmYeqG6bVBfZ/bU1zTXFTNJDZo1U3jcjBT6chinSLPqX/DouQwGRf3
         W+Z0bjzUa95w7NdDsXxaO8B2yR31GoQdzwi64CM+yU07tEmV8sa0sAWGkXG+h35+w8BG
         VCDHVqNQz7944loq+aAZ9U1pH/ap1uqxJkq9mwhYmRiBOrnOPgjbTCyUZngjgH4esjnG
         W1tZlmffxhhWKJMiHIRXwYYjqryuVwN2AR9mlZfp41rMt+nw76QGO2v44ZYasCEEG6BI
         qgYtYbpXA8cmaqo8xyLT/klwC+YmbDhnQ7BhsNFLAWEPVp2m3a7T2Ee2+TzkKDpRWhjC
         DhsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@checkpoint.com header.s=default header.b=DtSWHHcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h37si2336507qtk.311.2017.08.12.00.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 00:25:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@checkpoint.com header.s=default header.b=DtSWHHcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgQn9-0005J3-Qg
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 03:25:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wagde@checkpoint.com>) id 1dgKCi-0001yS-KE
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 20:23:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wagde@checkpoint.com>) id 1dgKCd-0005UH-MD
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 20:23:00 -0400
Received: from michael.checkpoint.com ([194.29.34.68]:42698
	helo=smtp.checkpoint.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wagde@checkpoint.com>)
	id 1dgKCd-0005TK-Ai
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 20:22:55 -0400
x-m-msg: CPCHECK
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.checkpoint.com v7C0MmYi000544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=checkpoint.com;
	s=default; t=1502497369;
	bh=HXL0BPXLj+FlK7vTzEYiJfn11XI19y+0jomuD1LNX/0=;
	h=From:To:Subject:Date:From;
	b=DtSWHHcqK2LsQsFNdJQYSo2XBHlMqNoI6LBPLw/GbnO/Bm+3h5p77j8B71MDOgi6G
	CIM6fTQXfTElo6slf0KeoxttCqnFX574aor6qHVC5oNTxsFNZFJRV16Wj38cxRSUsT
	tNbK36vlECWxNstvLRZFZi2BU8V7QRz6R82Z01GE=
Received: from IL-EX10.ad.checkpoint.com ([194.29.34.147])
	by smtp.checkpoint.com (8.14.7/8.14.7) with ESMTP id v7C0MmYi000544
	for <qemu-arm@nongnu.org>; Sat, 12 Aug 2017 03:22:49 +0300
Received: from DAG-EX10.ad.checkpoint.com ([169.254.3.250]) by
	IL-EX10.ad.checkpoint.com ([169.254.2.190]) with mapi id 14.03.0351.000;
	Sat, 12 Aug 2017 03:22:48 +0300
From: Wagde Zabit <wagde@checkpoint.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: multiple network interfaces in vexpress-a15
Thread-Index: AdMTAPpReup0EM2HTyKDnMEsuAKuog==
Date: Sat, 12 Aug 2017 00:22:47 +0000
Message-ID: <6693042127413E41B2F161A6405E34A702438DD698@DAG-EX10.ad.checkpoint.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.29.34.193]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
x-cpdlp: 1138e86b8cc5adc6784394b3a63abcc4ca8bb4cca5
Content-Type: multipart/alternative;
	boundary="_000_6693042127413E41B2F161A6405E34A702438DD698DAGEX10adchec_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 194.29.34.68
X-Mailman-Approved-At: Sat, 12 Aug 2017 03:24:37 -0400
Subject: [Qemu-arm] multiple network interfaces in vexpress-a15
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gsz0N/1pmPjr

--_000_6693042127413E41B2F161A6405E34A702438DD698DAGEX10adchec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

I'm trying to create 2 network interfaces on my virtual machine with no luc=
k.
Does this machine support multiple network interfaces? How can I configure =
it?

Thanx

--_000_6693042127413E41B2F161A6405E34A702438DD698DAGEX10adchec_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-priority:99;
	mso-style-link:"Header Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-priority:99;
	mso-style-link:"Footer Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.HeaderChar
	{mso-style-name:"Header Char";
	mso-style-priority:99;
	mso-style-link:Header;}
span.FooterChar
	{mso-style-name:"Footer Char";
	mso-style-priority:99;
	mso-style-link:Footer;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m trying to create 2 network interfaces on m=
y virtual machine with no luck.<o:p></o:p></p>
<p class=3D"MsoNormal">Does this machine support multiple network interface=
s? How can I configure it?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanx<o:p></o:p></p>
</div>
</body>
</html>

--_000_6693042127413E41B2F161A6405E34A702438DD698DAGEX10adchec_--
