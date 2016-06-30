Received: by 10.25.21.96 with SMTP id l93csp81923lfi;
        Thu, 30 Jun 2016 20:43:09 -0700 (PDT)
X-Received: by 10.200.33.172 with SMTP id 41mr29266769qty.26.1467344589659;
        Thu, 30 Jun 2016 20:43:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g186si1182357qke.185.2016.06.30.20.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 20:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@purdue0.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIpMD-0006gr-21
	for alex.bennee@linaro.org; Thu, 30 Jun 2016 23:43:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhais@purdue.edu>) id 1bIklA-0004zl-Nr
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 18:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhais@purdue.edu>) id 1bIkl6-0001hN-V7
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 18:48:36 -0400
Received: from mail-sn1nam01on0130.outbound.protection.outlook.com
	([104.47.32.130]:42665
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhais@purdue.edu>)
	id 1bIkl6-0001cH-9y; Thu, 30 Jun 2016 18:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=purdue0.onmicrosoft.com; s=selector1-purdue-edu;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=p77fLTB7bPyzaf+myLOZ4Vh1tKvNoRb9Rdp07etSI1s=;
	b=TgqChCP6T3nFnYcTXbQfwO26zcGV4q0O8ReqiKW/Qbv1cY/dw8riWgj3hzw9lpCv3aqQVoJPHctyWKcbRtr406b9mW1BaE/hbjuGoA42oOXjGLJL6hiNvHLE7Q8xkH+fFvaKB4xU1rGH4ONv8apOkiI+vTiz39GstZoX3E7aaZ4=
Received: from DM2PR08MB1372.namprd08.prod.outlook.com (10.161.143.23) by
	DM2PR08MB1371.namprd08.prod.outlook.com (10.161.143.22) with Microsoft
	SMTP Server (TLS) id 15.1.523.4; Thu, 30 Jun 2016 18:13:57 +0000
Received: from DM2PR08MB1372.namprd08.prod.outlook.com ([10.161.143.23]) by
	DM2PR08MB1372.namprd08.prod.outlook.com ([10.161.143.23]) with mapi id
	15.01.0523.024; Thu, 30 Jun 2016 18:13:57 +0000
From: Shuang Zhai <zhais@purdue.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: Expensive emulation of CPU condition flags
Thread-Index: AQHR0voX1uPiC3KB3UmTT4v7qgWzrg==
Date: Thu, 30 Jun 2016 18:13:56 +0000
Message-ID: <DM2PR08MB1372F250DD79F123EDC2525ECA240@DM2PR08MB1372.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=zhais@purdue.edu; 
x-originating-ip: [25.160.91.4]
x-ms-office365-filtering-correlation-id: 1d70c215-9748-4f6b-d6c5-08d3a1124d89
x-microsoft-exchange-diagnostics: 1; DM2PR08MB1371;
	6:u8rRRCeqJR7OzGTWV3fJzhsyTuK8ZT8Od8EUDEHSIGxtt1j+FJ3GRnkf+Nh3KyvXe0gl9ASDFdC5Kb7LdXjD/9STbAhIkXYuQngqpcLC39xuqhAb8BN4N3RZFhUrbZX56f3MlDZvz5FkvIbVykvjPvw22vntI/WStrht5a7Pq9cJXFUN6PA38LiW9xVFZmix8/6jYWLUjGyPxTF9d6fdYwbO81Iag7/oglNuOVcdO7T/MpLEcXgDhECQc7yTsRIRnKuWKYE8T9PtxgTLRK9CSAgC2QZehdpzSfShu4/tYPVLa2fiooAMkf4dtmjO9HM0;
	5:VVlLihY8EJB43qbMpXo7K9CpG9gJiDGINN8+z4HhzPxzv3XXD+y3Eh4v3bxpT/1j0YG/G3MQVNIXDxRngYS4WnCCmvjJ0lHNUvG39KXbzjYpT1vqC8smeSPLPqfHLlK1hdDkjWncXhlHc6s3L+0HNA==;
	24:weMIXc4GFdv3oJeVdzV3UdNSU+9n/6k2rj20BGuyFPoeKrdse7Kli5H1RPvma6RRa0GFDdUIjACogI4skqU7OY1ukQHQLY2/9BFpvRbDPqA=;
	7:9v0YfoCtcXBaX8jP5mC5+Q5+8oim0XPtPohUH2q+dU5cldu7XdR1WejTTgWmh1VfwtVuZUdBg5DGfRUAWVHs4qqduTqh//RSVbjwjgSaYi4nKmf2i87narIusFu1/ULDoPBHNYPJ5clpR8CFJ738srXJTvce7IXryueCwlx7DtERpQrgm20ZZ5sm18PfWZpoP5zdZ1Ng6MlGp/bBHmD/4aRU1X5Qj9xzJKF5rDISGhKKj+xgF1Epv4pm4h2pTjR6TPDCLm6q2dNbJ23q+u+kLg==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR08MB1371;
x-microsoft-antispam-prvs: <DM2PR08MB1371CFC85AD86A8B2B8DDCDFCA240@DM2PR08MB1371.namprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:DM2PR08MB1371; BCL:0; PCL:0; RULEID:; SRVR:DM2PR08MB1371; 
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(199003)(53754006)(189002)(189998001)(19625215002)(110136002)(87936001)(97736004)(9686002)(90282001)(2900100001)(68736007)(2501003)(3846002)(450100001)(74316002)(122556002)(101416001)(54356999)(6116002)(229853001)(50986999)(11100500001)(586003)(16236675004)(7846002)(86362001)(102836003)(7696003)(81156014)(3660700001)(2351001)(99286002)(5640700001)(77096005)(7736002)(5003600100003)(8676002)(33656002)(3280700002)(105586002)(2906002)(76576001)(10400500002)(66066001)(19627405001)(5002640100001)(4326007)(92566002)(106356001)(88552002)(8936002)(89122001)(106116001)(81166006)(75432002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR08MB1371;
	H:DM2PR08MB1372.namprd08.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: purdue.edu does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
	boundary="_000_DM2PR08MB1372F250DD79F123EDC2525ECA240DM2PR08MB1372namp_"
MIME-Version: 1.0
X-OriginatorOrg: purdue.edu
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2016 18:13:56.8771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4130bd39-7c53-419c-b1e5-8758d6d63f21
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR08MB1371
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.130
X-Mailman-Approved-At: Thu, 30 Jun 2016 23:43:02 -0400
Subject: [Qemu-arm] Expensive emulation of CPU condition flags
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x+5cTMCuUAC7

--_000_DM2PR08MB1372F250DD79F123EDC2525ECA240DM2PR08MB1372namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone.


In running an ARMv7 guest on an x86 host, we observed that a guest instruct=
ion affecting condition flags is often translated into 10+ host instruction=
s. The reason seems to be the way that the frontend emulates the condition =
flags. For instance:


Target ARM instruction:

cmp  r9, 0x21 ;


IR instruction:

movi_i32 tmp5,$0x21

sub_i32 NF,r9,tmp5

mov_i32 ZF,NF

setcond_i32 CF,r9,tmp5,geu

xor_i32 VF,NF,r9

xor_i32 tmp7,r9,tmp5

and_i32 VF,VF,tmp7


Host x86 instruction:


sub    $0x21,%ebx

mov    %ebx,0x208(%r14)

mov    %ebx,%r12d

mov    %r12d,0x20c(%r14)

cmp    $0x21,%ebp

setae  %r13b

movzbl %r13b,%r13d

mov    %r13d,0x200(%r14)

xor    %ebp,%ebx

xor    $0x21,%ebp

and    %ebp,%ebx

mov    %ebx,0x204(%r14)


Imaging in a tight loop where a cmp instruction is used to compute the term=
ination condition, this can be pretty expensive. And lazy evaluation seems =
not to help here.


We wonder if there exists any optimization, e.g., directly mapping the fron=
tend flags to that of the backend? Any suggestions are appreciated.


Shuang

--_000_DM2PR08MB1372F250DD79F123EDC2525ECA240DM2PR08MB1372namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;back=
ground-color:#FFFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
 id=3D"docs-internal-guid-9c476afc-a27c-99fa-4d4e-837b97c004e0">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">Hi everyone.</span></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;=
background-color:#ffffff;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;"><br>
</span></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;=
background-color:#ffffff;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;">In
 running an ARMv7 guest on an x86 host, we observed that a guest instructio=
n affecting condition flags is often translated into 10&#43; host instructi=
ons. The reason seems to be the way that the frontend emulates the conditio=
n flags. For instance:
</span></p>
<br>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;=
background-color:#ffffff;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;">Target
 ARM instruction:</span></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">cmp &nbsp;r9, 0x21 ;</spa=
n></p>
<br>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;=
background-color:#ffffff;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;">IR
 instruction:</span></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">movi_i32 tmp5,$0x21</span=
></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">sub_i32 NF,r9,tmp5</span>=
</p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">mov_i32 ZF,NF</span></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">setcond_i32 CF,r9,tmp5,ge=
u</span></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">xor_i32 VF,NF,r9</span></=
p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">xor_i32 tmp7,r9,tmp5</spa=
n></p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">and_i32 VF,VF,tmp7</span>=
</p>
<br>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;=
background-color:#ffffff;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;">Host
 x86 instruction:</span></p>
<br>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">sub</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">$0x21,%ebx</span><=
/p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">mov</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">%ebx,0x208(%r14)</=
span></p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">mov</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">%ebx,%r12d</span><=
/p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">mov</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">%r12d,0x20c(%r14)<=
/span></p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">cmp</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">$0x21,%ebp</span><=
/p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">setae &nbsp;%r13b</span><=
/p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">movzbl %r13b,%r13d</span>=
</p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">mov</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">%r13d,0x200(%r14)<=
/span></p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">xor</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">%ebp,%ebx</span></=
p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">xor</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">$0x21,%ebp</span><=
/p>
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt;=
text-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">and</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">%ebp,%ebx</span></=
p>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;t=
ext-indent: 36pt;">
<span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;b=
ackground-color:#ffffff;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;">mov</span><span style=3D"=
font-size:16px;font-family:'Times New Roman';color:#000000;background-color=
:#ffffff;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;">&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:16px;font-family:'Times New Roman';color:#0=
00000;background-color:#ffffff;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;">%ebx,0x204(%r14)</=
span></p>
<br>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;=
background-color:#ffffff;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;">Imaging
 in a tight loop where a cmp instruction is used to compute the termination=
 condition, this can be pretty expensive. And lazy evaluation seems not to =
help here.
</span></p>
<br>
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size:16px;font-family:'Times New Roman';color:#000000;=
background-color:#ffffff;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;">We
 wonder if there exists any optimization, e.g., directly mapping the fronte=
nd flags to that of the backend?
<span style=3D"font-size: 12pt;">Any suggestions are appreciated. </span></=
span></p>
<p></p>
<p><br>
</p>
<p><span style=3D"font-size: 12pt; font-family: &quot;Times New Roman&quot;=
,Times,serif;">Shuang</span><br>
</p>
</div>
</body>
</html>

--_000_DM2PR08MB1372F250DD79F123EDC2525ECA240DM2PR08MB1372namp_--
