Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp561949lfc;
        Tue, 10 Mar 2020 03:23:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsE9BIqSNfLtOMv1vGB9qancOOv0WYJbqKDn9M3JRnLlc4eJQ2WpemUV4PFDnM8AwZTWN0h
X-Received: by 2002:a37:a1cc:: with SMTP id k195mr19294807qke.169.1583835812805;
        Tue, 10 Mar 2020 03:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583835812; cv=none;
        d=google.com; s=arc-20160816;
        b=otMHD+VBlRvOvdZ3xbzgq/SGOKrUfs436Wx2VxEEq5zjdMDgW3l1NNQkDPr/pEbVfU
         re066pALupdrLYeuIhpdUw5qnRBbdSdsYz57ND5ALYpRDbGQefP9/KrEdox/up98XACv
         +ghQu2pJLoYFcygCDMrjkqi5YJVA94ry7VdLNUonVU6fNyGSJD+xcLCM3FrW8z+4PGk2
         1fhFuEmOfahYkrf3miF5323wOPqC62KOaQ4drGAlRlrrBACvtBJpoJhqRLSAVtDzyEWb
         pAYQZCBGk3xCPk/6HfezIFjdx0zqmkwsIsQQ/cw+HXgEAMu1xPIIaxVzeWT2ywdmae3c
         WQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from;
        bh=YM2/PGBZRknYqgUt1V+0/ZdtgTBiTFeLNbDMoYQRBy4=;
        b=xeiulQ4ZTfrdbjAIy8oXXY2JPdfCvb+v5N72y5lhoH7ZV0HN1UK1+0wgwej8KHvZZj
         DrXP9xfAECa0PWzQ4lQlqj76t06omVyDdLdTWGb2O962IbDV4vdrMcmauf+POnGF52Kg
         6hxnAJq8ztKeegkNxQwFLiQeoH771xf3NyYACfn9/lioGTd5myVbKI3K5doFulvhcQwa
         jZKfc88mcfxo69bV8YiB6/VZ6nPau814bnOjlP5idJWuUdZ3BIfMDpyITlDlBbdDvtyk
         XtJlb+v6w/573UP1zbs+fmSLwWMBbCR5JJPv8BgJTScyfvZfDfYAEdWboKuixqaZXMX0
         NAag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si2275115qkc.82.2020.03.10.03.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 03:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBc2u-0000Ku-9l
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 06:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <btv1==3383fd5920c==Daniel.Rossier@heig-vd.ch>)
 id 1jBbxp-0004n1-0s
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 06:18:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <btv1==3383fd5920c==Daniel.Rossier@heig-vd.ch>)
 id 1jBbxn-0004L8-AG
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 06:18:16 -0400
Received: from gwsmtp1.avdtec.ch ([145.232.233.54]:41870
 helo=mail02.heig-vd.ch)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <btv1==3383fd5920c==Daniel.Rossier@heig-vd.ch>)
 id 1jBbxm-00046p-WD
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 06:18:15 -0400
X-ASG-Debug-ID: 1583835490-111d981c7c1ccb930001-yEWgzd
Received: from EIMAIL02.einet.ad.eivd.ch ([193.134.222.4]) by
 mail02.heig-vd.ch with ESMTP id kaobUXYUnpqDZaLg (version=TLSv1.2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO) for
 <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 11:18:10 +0100 (CET)
X-Barracuda-Envelope-From: Daniel.Rossier@heig-vd.ch
X-Barracuda-Effective-Source-IP: UNKNOWN[193.134.222.4]
X-Barracuda-Apparent-Source-IP: 193.134.222.4
Received: from EIMAIL02.einet.ad.eivd.ch (10.192.41.72) by
 EIMAIL02.einet.ad.eivd.ch (10.192.41.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 10 Mar 2020 11:18:10 +0100
Received: from EIMAIL02.einet.ad.eivd.ch ([fe80::bdef:6b1b:c4d1:62df]) by
 EIMAIL02.einet.ad.eivd.ch ([fe80::bdef:6b1b:c4d1:62df%9]) with mapi id
 15.01.1913.007; Tue, 10 Mar 2020 11:18:10 +0100
From: Rossier Daniel <Daniel.Rossier@heig-vd.ch>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: SO3 operating system running on Qemu/ARM
Thread-Topic: SO3 operating system running on Qemu/ARM
X-ASG-Orig-Subj: SO3 operating system running on Qemu/ARM
Thread-Index: AdX2xOOIPmpW0e2qTyKPyY5CbEj+zA==
Date: Tue, 10 Mar 2020 10:18:10 +0000
Message-ID: <a7f5c923f2f143b792736393fbc66a8f@heig-vd.ch>
Accept-Language: fr-FR, fr-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.204.11]
Content-Type: multipart/alternative;
 boundary="_000_a7f5c923f2f143b792736393fbc66a8fheigvdch_"
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[193.134.222.4]
X-Barracuda-Start-Time: 1583835490
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://quarantine.heig-vd.ch:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at heig-vd.ch
X-Barracuda-Scan-Msg-Size: 2958
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.80575
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.00 HTML_MESSAGE           BODY: HTML included in message
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 145.232.233.54
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
X-TUID: W9G6GkPes5nU

--_000_a7f5c923f2f143b792736393fbc66a8fheigvdch_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear all,
I just wanted to let you know about our new operating system called SO3 whi=
ch runs on Qemu as well as Raspberry Pi 4 and others.
This is a small, compact, efficient and full-featured OS strongly inspired =
from Linux.
Usable for academic and industrial projects/labs.

https://discourse.heig-vd.ch/c/so3

Cheers
Daniel

--_000_a7f5c923f2f143b792736393fbc66a8fheigvdch_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR-CH" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Dear all,<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I just wanted to let you know a=
bout our new operating system called SO3 which runs on Qemu as well as Rasp=
berry Pi 4 and others.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This is a small, compact, effic=
ient and full-featured OS strongly inspired from Linux.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Usable for academic and industr=
ial projects/labs.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><a href=3D"https://discourse.heig-vd.ch/c/so3"><span=
 lang=3D"EN-US">https://discourse.heig-vd.ch/c/so3</span></a><span lang=3D"=
EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Cheers<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Daniel<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_a7f5c923f2f143b792736393fbc66a8fheigvdch_--
