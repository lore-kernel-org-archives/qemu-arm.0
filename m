Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp61606wrg;
        Fri, 14 Jun 2019 18:17:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHsEAQ6vvwFNZ08dpvNB3elgf3VV8aQSjU6nd6YBK9lkmNDTcjeiE63swpCyKX2gFEmJEv
X-Received: by 2002:a0c:ba0b:: with SMTP id w11mr10963927qvf.71.1560561472510;
        Fri, 14 Jun 2019 18:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560561472; cv=none;
        d=google.com; s=arc-20160816;
        b=DBFLxsVF+METVujJ7XUPbBU90G2a8qDbydy4j11Guk64ATsxN7XYhCr2noRD2pmLjU
         kPHIccYnLFxfqhlz9Bz2grIA8vWANuUeOpPlYFqcqGX3bLgXWVCm0JrlyAz50UCQ3mDo
         yGgF6jxHT6C9UiuB4rRu9yk9bGarybqgoxVVV+lvDvJP08KO+CIwcNKQ+9vzQ1H0jVog
         yKL/mE3qdkCExwiDQ8Uw61W7chD2r5JuWgBbClwSn2coErYbARrl00VzHbL0FihNRAYO
         sd0Ma4+OnbLIRAPECwPcm/AQgtVU0GILsZw8DRJFAwC90Ry9yEy4o8SYY2j9wICjb6oY
         cO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :msip_labels:content-language:accept-language:message-id:date
         :thread-index:thread-topic:to:from;
        bh=thNWobNovqBUADq3GX4hs9784CNq9Agpcj1emu37mfc=;
        b=MdXgQ2by3n+96gN+jAvrns083r/w9jqjntgKrYc9ePoiJ7h+rPekwfYWDSDOHi6xpU
         i9QVM8Y96xj00sLSRUkELH67fXKlDoVW1b5KpJIFgTQ8o6HPoF7h+zq1eblUYyX+lhyU
         iDlQvg4+UeAmslbfgaYS2d7hnkwoXfSHE48xfu6v6VCResd+KTaO58qBwsybcLXffEjS
         ZZ8W9UtaK/OWSNNCCeoANSj6AWRMWevZfJLJcOSxDg57CMQvNDJyXL3uAAgL/OYObgfj
         uQkKm//rS/ASljYMKAX3FxUk1TWJMniH2K3YYQzIjYicuLhe/Wn9xImO1Sh2nQCcSt9t
         TG9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=parsons.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g37si1035354qvd.137.2019.06.14.18.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 18:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=parsons.com
Received: from localhost ([::1]:57972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbxKJ-0007YD-KK
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 21:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=1068039716=alexander.bensch@parsons.com>)
 id 1hbrFm-0006jR-T6
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 14:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1068039716=alexander.bensch@parsons.com>)
 id 1hbrFi-0002kq-Cp
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 14:48:46 -0400
Received: from txdal11mx02.parsons.com ([206.219.199.110]:49400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <prvs=1068039716=alexander.bensch@parsons.com>)
 id 1hbrFe-0002c7-8s
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 14:48:39 -0400
Received: from pps.filterd (txdal11mx02.parsons.com [127.0.0.1])
 by txdal11mx02.parsons.com (8.16.0.27/8.16.0.27) with SMTP id x5EIYbbx007767
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 13:48:19 -0500
Received: from txdal11exch02.parsons.com (txdal11exch02.parsons.com
 [172.21.212.128])
 by txdal11mx02.parsons.com with ESMTP id 2t4d38s8cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 13:48:19 -0500
Received: from ALHUN12EXCH01.Parsons.com (10.62.8.71) by
 TXDAL11EXCH02.Parsons.com (172.21.212.128) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3; Fri, 14 Jun 2019 13:48:18 -0500
Received: from ALHUN12EXCH02.Parsons.com (10.62.8.72) by
 ALHUN12EXCH01.Parsons.com (10.62.8.71) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Fri, 14 Jun 2019 13:48:14 -0500
Received: from ALHUN12EXCH02.Parsons.com ([10.62.8.72]) by
 ALHUN12EXCH02.Parsons.com ([10.62.8.72]) with mapi id 15.00.1473.003; Fri, 14
 Jun 2019 13:48:14 -0500
From: "Bensch, Alexander" <Alexander.Bensch@parsons.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Custom machine: Forcing initial boot address
Thread-Index: AdUi4C/IbWVCrokzTPSV7EVz0baf/w==
Date: Fri, 14 Jun 2019 18:48:14 +0000
Message-ID: <7757fcde65574754a8123d473be4b8a2@ALHUN12EXCH02.Parsons.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_5c1e7834-6be8-4780-ac5e-8408bbf8216f_Enabled=True;
 MSIP_Label_5c1e7834-6be8-4780-ac5e-8408bbf8216f_SiteId=8d088ff8-7e52-4d0f-8187-dcd9ca37815a;
 MSIP_Label_5c1e7834-6be8-4780-ac5e-8408bbf8216f_Owner=Alexander.Bensch@parsons.com;
 MSIP_Label_5c1e7834-6be8-4780-ac5e-8408bbf8216f_SetDate=2019-06-14T18:48:12.7845994Z;
 MSIP_Label_5c1e7834-6be8-4780-ac5e-8408bbf8216f_Name=Sensitive, Proprietary;
 MSIP_Label_5c1e7834-6be8-4780-ac5e-8408bbf8216f_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_5c1e7834-6be8-4780-ac5e-8408bbf8216f_Extended_MSFT_Method=Manual;
 Sensitivity=Sensitive, Proprietary
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.21.212.10]
Content-Type: multipart/alternative;
 boundary="_000_7757fcde65574754a8123d473be4b8a2ALHUN12EXCH02Parsonscom_"
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_07:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 206.219.199.110
X-Mailman-Approved-At: Fri, 14 Jun 2019 21:15:46 -0400
Subject: [Qemu-arm] Custom machine: Forcing initial boot address
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
X-TUID: UcvQxfRbfB9Y

--_000_7757fcde65574754a8123d473be4b8a2ALHUN12EXCH02Parsonscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sensitive / Proprietary

Hello all,

I am currently trying to modify the MPS2 board to emulate an ARMv7m device =
I am working on, as none of the included machines provide an environment cl=
ose enough to what I'm working on to be sufficient. I am running into an is=
sue in which I cannot get the machine to execute the bootROM from address 0=
xFFFF0000. The specs for the specific device I have (cannot share the devic=
e model, unfortunately) state that there is a control register that I assum=
e is present in all v7m chips that selects whether to boot at 0x0 or 0xFFFF=
0000. I can also see evidence of this register being emulated in QEMU in 't=
arget/arm/cpu.c'. However, since there is little API documentation I have b=
een able to find, I've effectively been reverse-engineering QEMU to figure =
out what needs to be set. So far, all of my attempts to modify control regi=
sters and addresses directly have resulted in unexpected behavior and parti=
al implementation of my goals. I have had success in forcing the ROM to loa=
d at the desired address, and with GDB I can force the PC and SP to where I=
 want, but the IVT must be at 0x0 by default. I was hoping someone knew how=
 to enable the control register that sets the boot address so that the IVT =
can be loaded from a different address.

I am running QEMU version 2.11.

Apologies if this is the wrong place or not the expected format. I haven't =
used a mailing list before and I couldn't find any guidelines or etiquette =
rules.
Thanks!

NOTICE: This email message and all attachments transmitted with it may cont=
ain privileged and confidential information, and information that is protec=
ted by, and proprietary to, Parsons Corporation, and is intended solely for=
 the use of the addressee for the specific purpose set forth in this commun=
ication. If the reader of this message is not the intended recipient, you a=
re hereby notified that any reading, dissemination, distribution, copying, =
or other use of this message or its attachments is strictly prohibited, and=
 you should delete this message and all copies and backups thereof. The rec=
ipient may not further distribute or use any of the information contained h=
erein without the express written authorization of the sender. If you have =
received this message in error, or if you have any questions regarding the =
use of the proprietary information contained therein, please contact the se=
nder of this message immediately, and the sender will provide you with furt=
her instructions.

--_000_7757fcde65574754a8123d473be4b8a2ALHUN12EXCH02Parsonscom_
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
	{font-family:"Helvetica Neue";}
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
	color:windowtext;}
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
<p class=3D"msipheader8e5185eb" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Franklin Gothic Book;color:#000000">Sens=
itive / Proprietary</span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
I am currently trying to modify the MPS2 board to emulate an ARMv7m device =
I am working on, as none of the included machines provide an environment cl=
ose enough to what I&#8217;m working on to be sufficient. I am running into=
 an issue in which I cannot get the machine
 to execute the bootROM from address 0xFFFF0000. The specs for the specific=
 device I have (cannot share the device model, unfortunately) state that th=
ere is a control register that I assume is present in all v7m chips that se=
lects whether to boot at 0x0 or
 0xFFFF0000. I can also see evidence of this register being emulated in QEM=
U in &#8216;target/arm/cpu.c&#8217;. However, since there is little API doc=
umentation I have been able to find, I&#8217;ve effectively been reverse-en=
gineering QEMU to figure out what needs to be set.
 So far, all of my attempts to modify control registers and addresses direc=
tly have resulted in unexpected behavior and partial implementation of my g=
oals. I have had success in forcing the ROM to load at the desired address,=
 and with GDB I can force the PC
 and SP to where I want, but the IVT must be at 0x0 by default. I was hopin=
g someone knew how to enable the control register that sets the boot addres=
s so that the IVT can be loaded from a different address.<br>
<br>
I am running QEMU version 2.11.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Apologies if this is the wrong place or not the expe=
cted format. I haven&#8217;t used a mailing list before and I couldn&#8217;=
t find any guidelines or etiquette rules.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Thanks!<b><span style=3D"font-size:10.0pt;font-famil=
y:&quot;Helvetica Neue&quot;;color:#353535"><o:p></o:p></span></b></p>
</div>
<br>
<div style=3D"font-size:10pt;  font-family: 'Franklin Gothic Book';">NOTICE=
: This email message and all attachments transmitted with it may contain pr=
ivileged and confidential information, and information that is protected by=
, and proprietary to, Parsons Corporation,
 and is intended solely for the use of the addressee for the specific purpo=
se set forth in this communication. If the reader of this message is not th=
e intended recipient, you are hereby notified that any reading, disseminati=
on, distribution, copying, or other
 use of this message or its attachments is strictly prohibited, and you sho=
uld delete this message and all copies and backups thereof. The recipient m=
ay not further distribute or use any of the information contained herein wi=
thout the express written authorization
 of the sender. If you have received this message in error, or if you have =
any questions regarding the use of the proprietary information contained th=
erein, please contact the sender of this message immediately, and the sende=
r will provide you with further
 instructions.</div>
</body>
</html>

--_000_7757fcde65574754a8123d473be4b8a2ALHUN12EXCH02Parsonscom_--
