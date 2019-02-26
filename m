Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11169506wrx;
        Tue, 26 Feb 2019 07:06:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbdFCd/dtH4gY3ZS/Slxx2mqaUdHWrGBWq0JWB2Egpe1sBMH3mMlAuyV9gY5UptztsWpVtU
X-Received: by 2002:a25:3716:: with SMTP id e22mr8995409yba.41.1551193602464;
        Tue, 26 Feb 2019 07:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551193602; cv=none;
        d=google.com; s=arc-20160816;
        b=e7VCdI9vDGZp0G4frf+ZoYDi2n5SgMNm8sW8LB4Z3OG0dWqRUP5eauDxdwvsk2uoOg
         Jkf/qBu0gT0foDpTLfLl5w9EmbZ0T/UKrj/qnYY8iNc/Sf33Qf2/0KkVauvHePAm+iJP
         jys1ZylSx8s6lGAwKmDaU3Na1vhDmDKhUleT961EI8u+j+JBHRc89UmJJUXVaRODnQTV
         kvhGEDX4vR0xb9od03OVTJuI1IzX5/xI+BpoEc7+hplFkDOziYfStHMgYodAlQ6ABQ3X
         0X09+WLpfK44qRgP2DQgjWzoDqEx/vMrCXKdILgoi9keRWM9+l8mTmAKIcKgjEnS0iiX
         FllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature;
        bh=N6gflsgnQPQ8y4ea1uT6OjGYKn225zDsNUBM/VyeWvk=;
        b=E6ReG0fHRIN5LrkIJUHdz/wRLWrrLlToZGk56OYMoURYeCPcV78ErPHKvUq3jX9ua2
         FprSe5cEj5hMHEsqF5etVjfVOPjB+NxpLEyZKuMuLYadXVEKaGivFvm0TcUDSFmo3v4J
         y0HJ3EWOpVJp4O7rgMHX09C83A8YTmz3qxB6sz21NA1WFDbB4ts/0crfKZMgKad1B7DE
         phhIhz2AxyrUYaCyjEwi01++np0K7Zsc1yzKyXDxtUwyFISKYW55YVGdn/uciwkfFHkx
         gRaz0TsRADR3kKibpVpMwpWi9i8tLMsGeCCA88pX4bVer7VYPXDhBKwpvArk6VXMEXYT
         718g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@capgemini.com header.s=group2 header.b="EYt5/g3E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=capgemini.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u130si7031853ybb.221.2019.02.26.07.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 07:06:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@capgemini.com header.s=group2 header.b="EYt5/g3E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=capgemini.com
Received: from localhost ([127.0.0.1]:56873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyeJd-0006Rp-S8
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 10:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julien.a.rey@capgemini.com>) id 1gybrH-00039y-4I
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 07:29:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julien.a.rey@capgemini.com>) id 1gybrD-0001Jc-U8
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 07:29:15 -0500
Received: from spfnldca6.capgemini.com ([80.253.212.211]:62458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <julien.a.rey@capgemini.com>)
	id 1gybrC-0001E6-J4
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 07:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=capgemini.com; i=@capgemini.com; q=dns/txt; s=group2;
	t=1551183045; x=1582719045;
	h=from:to:subject:date:message-id:mime-version;
	bh=h+gxdxiBrbte2hwG54NuuPhikYETcWj3GFKr2RSNpoY=;
	b=EYt5/g3EUUHFuXLeZnN/GQQyU1if02AloBmpM/oR5eT78rkyqfT2TEQQ
	TG5OJd9r5+UdpphhwxPHYDPWkrwygv6hSSFdDgRvT/A65m3O5agu0tO4G
	gjUYodZDB5z3W8GY6y0iJqdjY3h3MepjjpZtTXD/Rnm+v690pXUQ2uCJ6 I=;
X-IronPort-AV: E=Sophos;i="5.58,415,1544482800"; 
	d="png'150?scan'150,208,217,150";a="127509867"
Received: from gddlppraplv04p.corp.capgemini.com ([10.247.137.142])
	by IRFRPAR-C690-06-D2-incoming.capgemini.com with
	ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2019 13:10:32 +0100
Received: from gddlppraplv04p.corp.capgemini.com
	(gddlppraplv04p.corp.capgemini.com [127.0.0.1])
	by gddlppraplv04p.corp.capgemini.com (Service) with ESMTP id
	909FE8208179
	for <qemu-arm@nongnu.org>; Tue, 26 Feb 2019 13:26:05 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
	[104.47.8.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gddlppraplv04p.corp.capgemini.com (Service) with ESMTPS id
	5DAF9820816E
	for <qemu-arm@nongnu.org>; Tue, 26 Feb 2019 13:26:05 +0100 (CET)
Received: from AM0PR02MB3587.eurprd02.prod.outlook.com (52.133.63.12) by
	AM0PR02MB5587.eurprd02.prod.outlook.com (10.255.30.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.16; Tue, 26 Feb 2019 12:28:56 +0000
Received: from AM0PR02MB3587.eurprd02.prod.outlook.com
	([fe80::510e:2dc4:8524:c485]) by
	AM0PR02MB3587.eurprd02.prod.outlook.com
	([fe80::510e:2dc4:8524:c485%3]) with mapi id 15.20.1643.019;
	Tue, 26 Feb 2019 12:28:56 +0000
From: "REY, Julien" <julien.a.rey@capgemini.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Qemu ARM M4 emulation
Thread-Index: AdTNztFv2PuoEa24SwSSU432qgg4Fg==
Date: Tue, 26 Feb 2019 12:28:56 +0000
Message-ID: <AM0PR02MB3587ECB5D599D4DA99C1B021D87B0@AM0PR02MB3587.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=julien.a.rey@capgemini.com; 
x-originating-ip: [193.57.249.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff2f5994-6648-45ab-1e3e-08d69be5fa5c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:AM0PR02MB5587; 
x-ms-traffictypediagnostic: AM0PR02MB5587:
x-ms-exchange-purlcount: 9
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; AM0PR02MB5587;
	23:rWs3pNCy4JoruUyWotBD/dNMiANIpx5gsVCCxyJ4u?=
	=?us-ascii?Q?40e08ASoJuF4hSzUb4g6NV7bl/Rjxezoy2AX0XWn5YcSA4hAI8mAGCEHOfK0?=
	=?us-ascii?Q?AdPC29v3565cdBHyllJ+Xscxej1ffNCMKT0eATc7eawk9lZv8dx/3wAvuZsV?=
	=?us-ascii?Q?ssvJIJIzz0FvEgJqnwYKu57lHaC4ZgmtL0zFopoYNjl755NB98pkimM/d4Wb?=
	=?us-ascii?Q?KtAlvrxPEEpv9wFP/mPTLhOUp2mkuYGG2v+JNrcxFr+yJH+BEZVGqcl7ZY68?=
	=?us-ascii?Q?3E8gXMGEauO00TieMcJu8JaukJBjFjnfb9D9lUC11E/aaB+4ERftPLMWb+UU?=
	=?us-ascii?Q?vz/obh8dUWWM+4798XAOMBEKS3Wuo5MmZ2mVagHYCvKOm9rwortwqiY7BOjf?=
	=?us-ascii?Q?IoIp+ioNwYCloledwwyTxA3LmSf3wVBsDwpehWmBJKQ/KobFbSNhx8JH5gug?=
	=?us-ascii?Q?bdqsLibHRVEs8NsH+zQx4nDXA+IBsfWh2mLBWxb4cOT5T3PNeKLUzpyaU9tU?=
	=?us-ascii?Q?jzT50dQZavp2wEuU/5/THtIku9YEPVjwbVUdu8eEa2jhxHau4Okonf0Sv866?=
	=?us-ascii?Q?dR9LQLRmI96BtoxmR/c9lMfKlDEy9GO3jOlIHsJt2reDcFN5C9BFnBBL6vBV?=
	=?us-ascii?Q?AW6UDTzT0RgiGTvt/NspYsZVwQ1cJiRrxdZM0tAH1sbvW1Q5xz1nw9tkuKeM?=
	=?us-ascii?Q?TLiiJ/x20GssEw2s/lXQ4aY71XYgoPFm8bvOT3xz8kogDfKCq0QYMBWGDrrL?=
	=?us-ascii?Q?qCODNX6dwg2zO17xJAYK7oDysPOfUDwRGM298cXRrDZaBvOnVQjrkb1bSPgO?=
	=?us-ascii?Q?MHhAU4J3wXzqXnnt6uR1IYBduVgKdrQ6Kjm2X636lueMKX29o/hFOT7nMisc?=
	=?us-ascii?Q?qa6n2FlfEJKMuw9EkvOE7wRPbPWGLq3r5V0G57t7mAO7IM9sRzEPpSQpIZ6x?=
	=?us-ascii?Q?ZcQX9Km96wv3tpjsWK9cuZEKZIz+5t0C+YeTr+n04y8VJp00NjGjDD91n0j6?=
	=?us-ascii?Q?8lusIk/qvcy3TB27Wk/SH2ekx8KnVhu/tv48bWmRQrZGtOxLL2yHEe9l4gM+?=
	=?us-ascii?Q?PTIFrxMg0nRaFnEkc5/+EAy3LJJiIgNxoWvknlcPc3k981VCfFulRCXBgLEy?=
	=?us-ascii?Q?ThUoIPbuh4UrdYDp8/32mP+SaJOpv5hm/FFt0nQ79D3+NdFBxZsz9SGvnuDL?=
	=?us-ascii?Q?lrEvDyNEAECF8Net3uwYS4Lgw7/p8Cccj+z2beUjGIP2Mrm9SsUWpYdReL6l?=
	=?us-ascii?Q?M5d4DjtvGTgaLHbWuXVt5uvRsPXOmXd+ZSTABAeozPThbo7/7LlRakATbJGP?=
	=?us-ascii?Q?vLEiwswPFL4NqY/JWF+1NFUXksLIx6d0HzPivsJz80Q?=
x-microsoft-antispam-prvs: <AM0PR02MB5587DB261E65D6D0F899DC62D87B0@AM0PR02MB5587.eurprd02.prod.outlook.com>
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(396003)(376002)(346002)(366004)(504964003)(199004)(189003)(7696005)(606006)(486006)(74316002)(8936002)(66066001)(2501003)(3846002)(6116002)(790700001)(99286004)(52536013)(81156014)(81166006)(97736004)(476003)(5640700003)(71200400001)(55016002)(26005)(733005)(186003)(9686003)(478600001)(14454004)(86362001)(5660300002)(861006)(8676002)(236005)(54896002)(6306002)(54556002)(6436002)(53936002)(71190400001)(99936001)(7736002)(2906002)(2351001)(106356001)(105586002)(256004)(14444005)(68736007)(25786009)(6506007)(102836004)(316002)(33656002)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5587;
	H:AM0PR02MB3587.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V0E0roYkSDK0bLjxi/ihWgCU/MV1fa11kCPnkOtNBuxtvEy+IkQRUSDwRwYhHBs78PVeR+XJhCH6YF2G2R9IQKpI9UAAx+qEU+esCR6oVB2r6RShThFVo0AwVyPdAac0CIDHa2RsXzXoqKbV32GyNkjtLBT3Q4Bi2zfcUDuL9j9UxCkGVtkF9TMy/UyoQ/q2mJ++Owdf9XwBWqqrgQ2qvJH0vnh+u47peNo+5FABi1mVV4yIguiCwtcVEbygKY45FvDMcx2NVarv5/ch+/ztWw4MQ59qP0o7crEirkx9ZEMFpPrLtaXeCaUULgBHuqiP6UJoEtI6A9DLVWCirRuCQNHZee2iPIuuxp3KWrb2FcqEA+wSk49IYDkRry5eJcjAYiQ/vxgJHec/vuHBZxelvUYJnjvFNzudAEWtmgtqs00=
Content-Type: multipart/related;
	boundary="_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: capgemini.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2f5994-6648-45ab-1e3e-08d69be5fa5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 12:28:56.8650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 76a2ae5a-9f00-4f6b-95ed-5d33d77c4d61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5587
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.253.212.211
X-Mailman-Approved-At: Tue, 26 Feb 2019 10:02:21 -0500
Subject: [Qemu-arm] Qemu ARM M4 emulation
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
X-TUID: w2RAmEzFranh

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: multipart/alternative;
	boundary="_000_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_"

--_000_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I have got some questions about Qemu, I will start by explain you our probl=
em :

Our customer want to virtualize their physical test bench. Their test bench=
 is composed by a controller device who contained embedded C code executed =
by a Cortex ARM M4 kernel and their physical system with sensors and actuat=
ors. The virtualization of the physical system is not a problem for us.

The main problem is the controller emulation. The solution we have is to em=
ulate the ARM M4 Kernel for execute the embedded code developed and then to=
 connect to the virtual system.

We tought of Qemu to do that. We have experimented the emulation of a basic=
 OS iso but for a Kernel whitout OS we don't know where to start.

Main challenges :


  *   Run an emulation of ARM M4 kernel
  *   Compile and execute code
  *   Taking into account Imputs/Outputs and the card controller architectu=
re.

Do you think that Qemu can be a solution to our problem ?

Thank you in advance.
____________________________________________________________________
Julien REY

Capgemini Digital Engineering & Manufacturing Services| System Engineering =
& Operations

Tel.: +33 5 82 28 06 89
SOGETI HIGH TECH | AEROPARK - 3 Chemin Laporte | 31300 TOULOUSE
www.capgemini.com<http://www.capgemini.com/>  www.sogeti-hightech.fr<http:/=
/www.sogeti-hightech.fr/>

[https://visualidentity.capgemini.com/capgemini.png]
____________________________________________________________________
Connect with Capgemini:
[cid:image016.png@01D4CDD7.383F4400]<https://www.capgemini.com/insights-and=
-resources/blogs> [cid:image017.png@01D4CDD7.383F4400] <https://www.twitter=
.com/capgemini>  [cid:image018.png@01D4CDD7.383F4400] <https://www.facebook=
.com/capgemini>  [cid:image019.png@01D4CDD7.383F4400] <https://www.linkedin=
.com/company/capgemini>  [cid:image020.png@01D4CDD7.383F4400] <https://www.=
youtube.com/capgeminimedia>  [cid:image021.png@01D4CDD7.383F4400] <https://=
www.slideshare.net/capgemini>  [cid:image022.png@01D4CDD7.383F4400] <https:=
//plus.google.com/+CapgeminiGlobal>

Please consider the environment and do not print this email unless absolute=
ly necessary.
Capgemini encourages environmental awareness.

This message contains information that may be privileged or confidential an=
d is the property of the Capgemini Group. It is intended only for the perso=
n to whom it is addressed. If you are not the intended recipient, you are n=
ot authorized to read, print, retain, copy, disseminate, distribute, or use=
 this message or any part thereof. If you receive this message in error, pl=
ease notify the sender immediately and delete all copies of this message.

--_000_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1504315018;
	mso-list-type:hybrid;
	mso-list-template-ids:303353392 -2041566810 67895299 67895301 67895297 678=
95299 67895301 67895297 67895299 67895301;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have got some questions about=
 Qemu, I will start by explain you our problem&nbsp;:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Our customer want to virtualize=
 their physical test bench. Their test bench is composed by a controller de=
vice who contained embedded C code executed by a Cortex ARM M4 kernel and t=
heir physical system with sensors and
 actuators. The virtualization of the physical system is not a problem for =
us.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The main problem is the control=
ler emulation. The solution we have is to emulate the ARM M4 Kernel for exe=
cute the embedded code developed and then to connect to the virtual system.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We tought of Qemu to do that. W=
e have experimented the emulation of a basic OS iso but for a Kernel whitou=
t OS we don&#8217;t know where to start.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Main challenges :<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo1"><span lang=3D"EN-=
US">Run an emulation of ARM M4 kernel<o:p></o:p></span></li><li class=3D"Ms=
oNormal" style=3D"mso-list:l0 level1 lfo1"><span lang=3D"EN-US">Compile and=
 execute code<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"mso-li=
st:l0 level1 lfo1"><span lang=3D"EN-US">Taking into account Imputs/Outputs =
and the card controller architecture.<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do you think that Qemu can be a=
 solution to our problem ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you in advance.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Verdana&quot;,sans-serif;color:#AEAAAA;mso-fareast-language:FR=
">____________________________________________________________________</spa=
n><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-family:&quot;Verdana&=
quot;,sans-serif;color:#AEAAAA;mso-fareast-language:FR"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-top:6.0pt"><b><span lang=3D"EN-US" s=
tyle=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#=
0070AD;mso-fareast-language:FR">Julien REY<o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"margin-top:6.0pt"><b><span lang=3D"EN-US" s=
tyle=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#=
0070AD;mso-fareast-language:FR"><o:p>&nbsp;</o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:&quot;Verdana&quot;,sans-serif;color:#0070AD;mso-fareast-language:FR"=
>Capgemini Digital Engineering &amp; Manufacturing Services| System Enginee=
ring &amp; Operations<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:&quot;Verdana&quot;,sans-serif;color:black;mso-fareast-language:FR">&=
nbsp;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Verdana&quot;,s=
ans-serif;color:black;mso-fareast-language:FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:&quot;Verdana&quot;,sans-serif;color:#2B0A3D;mso-fareast-language:FR"=
>Tel.:
</span><span lang=3D"EN-US" style=3D"mso-fareast-language:FR">&#43;33 5 82 =
28 06 89</span><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-family:&q=
uot;Verdana&quot;,sans-serif;color:#2B0A3D;mso-fareast-language:FR"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:&quot;Verdana&quot;,sans-serif;color:#2B0A3D;mso-fareast-language:FR"=
>SOGETI HIGH TECH | AEROPARK &#8211; 3 Chemin Laporte | 31300 TOULOUSE</spa=
n><span lang=3D"EN-US" style=3D"font-family:&quot;Verdana&quot;,sans-serif;=
color:#2B0A3D;mso-fareast-language:FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:FR"><a href=3D"h=
ttp://www.capgemini.com/"><span lang=3D"EN-US" style=3D"font-size:8.0pt;fon=
t-family:&quot;Verdana&quot;,sans-serif;color:#2B0A3D">www.capgemini.com</s=
pan></a></span><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-family:&q=
uot;Verdana&quot;,sans-serif;color:#2B0A3D;mso-fareast-language:FR">&nbsp;
</span><span style=3D"font-size:8.0pt;font-family:&quot;Verdana&quot;,sans-=
serif;mso-fareast-language:FR"><a href=3D"http://www.sogeti-hightech.fr/"><=
span lang=3D"EN-US" style=3D"color:windowtext">www.sogeti-hightech.fr</span=
></a></span><span lang=3D"EN-US" style=3D"font-family:&quot;Verdana&quot;,s=
ans-serif;color:#2B0A3D;mso-fareast-language:FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:&quot;Verdana&quot;,sans-serif;color:#2B0A3D;mso-fareast-language:FR"=
>&nbsp;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Verdana&quot;=
,sans-serif;color:#2B0A3D;mso-fareast-language:FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ver=
dana&quot;,sans-serif;mso-fareast-language:FR"><img border=3D"0" width=3D"1=
42" height=3D"42" style=3D"width:1.4791in;height:.4375in" id=3D"_x0000_i103=
2" src=3D"cid:image001.png@01D4CDD6.BBC4CF80" alt=3D"https://visualidentity=
.capgemini.com/capgemini.png"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Verdana&quot;,sans-serif;color:#AEAAAA;mso-fareast-language:FR=
">____________________________________________________________________</spa=
n><span lang=3D"EN-US" style=3D"font-family:&quot;Verdana&quot;,sans-serif;=
color:#AEAAAA;mso-fareast-language:FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:4.0pt;margin-right:0cm;m=
argin-bottom:2.0pt;margin-left:0cm">
<b><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-family:&quot;Verdana&=
quot;,sans-serif;color:black;mso-fareast-language:FR">Connect with Capgemin=
i:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><a href=3D"https://www.capgemini.com/insights-and-re=
sources/blogs"><span style=3D"color:windowtext;mso-fareast-language:FR;text=
-decoration:none"><img border=3D"0" width=3D"24" height=3D"24" style=3D"wid=
th:.25in;height:.25in" id=3D"Picture_x0020_1" src=3D"cid:image016.png@01D4C=
DD7.383F4400"></span></a><span style=3D"font-size:4.0pt;font-family:&quot;V=
erdana&quot;,sans-serif;color:#00C27A;mso-fareast-language:FR">
</span><a href=3D"https://www.twitter.com/capgemini"><span style=3D"color:w=
indowtext;mso-fareast-language:FR;text-decoration:none"><img border=3D"0" w=
idth=3D"24" height=3D"24" style=3D"width:.25in;height:.25in" id=3D"Picture_=
x0020_4" src=3D"cid:image017.png@01D4CDD7.383F4400"></span></a><span style=
=3D"font-size:4.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#00C27=
A;mso-fareast-language:FR">&nbsp;</span><a href=3D"https://www.facebook.com=
/capgemini"><span style=3D"color:windowtext;mso-fareast-language:FR;text-de=
coration:none"><img border=3D"0" width=3D"24" height=3D"24" style=3D"width:=
.25in;height:.25in" id=3D"Picture_x0020_7" src=3D"cid:image018.png@01D4CDD7=
.383F4400"></span></a><span style=3D"font-size:4.0pt;font-family:&quot;Verd=
ana&quot;,sans-serif;color:#00C27A;mso-fareast-language:FR">&nbsp;</span><a=
 href=3D"https://www.linkedin.com/company/capgemini"><span style=3D"color:w=
indowtext;mso-fareast-language:FR;text-decoration:none"><img border=3D"0" w=
idth=3D"24" height=3D"24" style=3D"width:.25in;height:.25in" id=3D"Picture_=
x0020_8" src=3D"cid:image019.png@01D4CDD7.383F4400"></span></a><span style=
=3D"font-size:4.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#00C27=
A;mso-fareast-language:FR">&nbsp;</span><a href=3D"https://www.youtube.com/=
capgeminimedia"><span style=3D"color:windowtext;mso-fareast-language:FR;tex=
t-decoration:none"><img border=3D"0" width=3D"24" height=3D"24" style=3D"wi=
dth:.25in;height:.25in" id=3D"Picture_x0020_12" src=3D"cid:image020.png@01D=
4CDD7.383F4400"></span></a><span style=3D"font-size:4.0pt;font-family:&quot=
;Verdana&quot;,sans-serif;color:#00C27A;mso-fareast-language:FR">&nbsp;</sp=
an><a href=3D"https://www.slideshare.net/capgemini"><span style=3D"color:wi=
ndowtext;mso-fareast-language:FR;text-decoration:none"><img border=3D"0" wi=
dth=3D"24" height=3D"24" style=3D"width:.25in;height:.25in" id=3D"Picture_x=
0020_13" src=3D"cid:image021.png@01D4CDD7.383F4400"></span></a><span style=
=3D"font-size:4.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#00C27=
A;mso-fareast-language:FR">&nbsp;</span><a href=3D"https://plus.google.com/=
&#43;CapgeminiGlobal"><span style=3D"color:windowtext;mso-fareast-language:=
FR;text-decoration:none"><img border=3D"0" width=3D"24" height=3D"24" style=
=3D"width:.25in;height:.25in" id=3D"Picture_x0020_14" src=3D"cid:image022.p=
ng@01D4CDD7.383F4400"></span></a><span lang=3D"EN-US" style=3D"font-size:8.=
0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#00C27A;mso-fareast-la=
nguage:FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:&quot;Verdana&quot;,sans-serif;color:#00C27A;mso-fareast-language:FR"=
><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-f=
amily:&quot;Verdana&quot;,sans-serif;color:#00C37B;mso-fareast-language:FR"=
>Please consider the environment and do not print this email unless absolut=
ely necessary.</span><span lang=3D"EN-US" style=3D"font-family:&quot;Verdan=
a&quot;,sans-serif;color:#00C37B;mso-fareast-language:FR"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ver=
dana&quot;,sans-serif;color:#00C37B;mso-fareast-language:FR">Capgemini enco=
urages environmental awareness.</span><span style=3D"font-family:&quot;Verd=
ana&quot;,sans-serif;color:#1F4E79;mso-fareast-language:FR"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<span style=3D"font-size: 9px; line-height: 10px;">This message contains in=
formation that may be privileged or confidential and is the property of the=
 Capgemini Group. It is intended only for the person to whom it is addresse=
d. If you are not the intended recipient, you are not authorized to read, p=
rint, retain, copy, disseminate, distribute, or use this message or any par=
t thereof. If you receive this message in error, please notify the sender i=
mmediately and delete all copies of this message.</span></body>
</html>

--_000_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_--

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=4046;
	creation-date="Tue, 26 Feb 2019 12:28:55 GMT";
	modification-date="Tue, 26 Feb 2019 12:28:55 GMT"
Content-ID: <image001.png@01D4CDD6.BBC4CF80>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAI0AAAApCAYAAAAI06pdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA25pVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1
OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
Ok9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDozQzA2NkNFREIzMDYxMUU3OUUxMDg4MjRDMDdF
QjREMyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpGODc4QjY2QkIzRTMxMUU3OEQ5MEI4RDRG
QzUyQzFEQSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpGODc4QjY2QUIzRTMxMUU3OEQ5MEI4
RDRGQzUyQzFEQSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxNyAoV2lu
ZG93cykiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowNDE0
NDg3Yy0yNGNmLWI1NGMtOTU5Yi1lODJkYjYyMjM0YjQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5k
aWQ6M0MwNjZDRURCMzA2MTFFNzlFMTA4ODI0QzA3RUI0RDMiLz4gPC9yZGY6RGVzY3JpcHRpb24+
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

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: image/png; name="image016.png"
Content-Description: image016.png
Content-Disposition: inline; filename="image016.png"; size=606;
	creation-date="Tue, 26 Feb 2019 12:28:55 GMT";
	modification-date="Tue, 26 Feb 2019 12:28:55 GMT"
Content-ID: <image016.png@01D4CDD7.383F4400>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAHeSURBVEjH
Y2hsbGQA4fmVaR7Xciz3v0tT/f4pVek/ORikf1VpbALMTBAGEwcLvPvJNRQbPptrv76jo4MDbMGi
8qQAahoOw9uLAhrAFtzNMjkPE/z75vH/fx9f/f9z48T/X0fX/P82K+//52JzsiwABTXIFwzIYQ6y
ABv4fX7X/689kSRbMrW62IABWQCXBTAA8tmXWleiLZhdmeGAYgHIAELg39eP/7/PLyXPAhj+UmH3
/9vU9P+/T23GadHPTRPJtwAZgyIZZNj/Xz8wLPm+pIY0C0ApB2QYKPV8afJB9RWQ//f5HQxLQGqJ
tgA9kn9fOYgaqVmaGMEGSta4kjJBC+DhvXse2HCYJX/unkORB/mcKAt+rGz+/+vAUqxBAfINzBKQ
i9Edgy2f4I3kr+3BGC4FWwKVB6UyFDlg0JGeioAuBnkfJeUg5YG/j64ihdMPRDDitQCoCCUFoYU5
KFJhBoGCFF+KwrDg24QEcE4FAVAYw1IHyEKsBgEtQolsYPyRVFQgZyRkOVDhhy3loccD2ALk0hSU
HHGlDOTgAKUybBaD2Bil6c0c8+PIZRAoUkEG/FjbhaIYJdWAIhQp92OzGORwcIUDqotpWqPRqk5G
qfSRWxWUGAyqfrG2KmiJAUwKLweHfTI8AAAAAElFTkSuQmCC

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: image/png; name="image017.png"
Content-Description: image017.png
Content-Disposition: inline; filename="image017.png"; size=510;
	creation-date="Tue, 26 Feb 2019 12:28:56 GMT";
	modification-date="Tue, 26 Feb 2019 12:28:56 GMT"
Content-ID: <image017.png@01D4CDD7.383F4400>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAF+SURBVEjH
Y2hsbGQA4Y6ODg63udsLdDZcXq6w7f5+UrH6hhvrXebvrihvaBCAmQnCYKK4pUdBfNeL8wzH//+n
FPMc+Pw8rWemBYoFMtsfH6eG4ciWwHzCEDp9VQQ1DYdhh8X7G8AWmK840U8LC1Q23d4OtgDEoIUF
Avve3wdbAEoB2BRwnMSt2eLy//8Nj///N7gE4cNokiyY/+r/f4/rmOIgg5HB+S///1c8JMOC/R//
///+F6IZ5huJM/+xApClJFsQcBPVkOOf//+f/gK7BWTFAcgwkA8Igfs/yLQA3Qe4QPtTMi0AYZBm
QgBbCiLagoQ7+A3HFrkkWQBL889/YRq+/T3+vEJUHCx/gz2iQQkAn+FE+8DhKiQYQJkOZGjGPUhe
oEpRQbWyiFalKcjhYAsCZ69LoIUFIIeDLQDVxSJ7X1+npuHsh3+8L+/okIBXmWkdUw1A1Ry1DA+f
viwApU4GYVAdarPscDu5kQ6q1w3WnJ+f1zNRA6NVQUsMAKbLLCFxEaBgAAAAAElFTkSuQmCC

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: image/png; name="image018.png"
Content-Description: image018.png
Content-Disposition: inline; filename="image018.png"; size=429;
	creation-date="Tue, 26 Feb 2019 12:28:56 GMT";
	modification-date="Tue, 26 Feb 2019 12:28:56 GMT"
Content-ID: <image018.png@01D4CDD7.383F4400>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAEtSURBVEjH
Y2hsbGQA4YaGBoG0ytkVMZWr1kdWrt9PKgbpA+kHmQMzE4TBRHlDh0Fw+bb7PmX7/lOKQyq2XAeZ
B7cAZCO1DIdhkHkwnzCkVC9sp6bhMJxWNbcBbAEo/GhhQXTl2u1gC/zK9nwnVlN4/aH/U9fd/L9s
9/3/LQsvEQwmsAXEGl4549z/L99+/4eBPaefU9eCgxdegg0GWUITHzx+9RVswer9D4hOSSRZ8PLd
d7AFINdT1YJLd9//xwYI+YRiC7qWXhkiQTRqweCxYPam22DDQUUGSRaElW88T4vSFFRKQ+qDykX9
tLAAZC7YAmD1JuFfvus9NQ0PLN/xHGQuvE4urJ3oQS1LQOaAzEOp9KEVv0RC1dLp4RUbjpNjMEgf
SD/M5RgW0AoDAPMLh7UyXJ52AAAAAElFTkSuQmCC

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: image/png; name="image019.png"
Content-Description: image019.png
Content-Disposition: inline; filename="image019.png"; size=491;
	creation-date="Tue, 26 Feb 2019 12:28:56 GMT";
	modification-date="Tue, 26 Feb 2019 12:28:56 GMT"
Content-ID: <image019.png@01D4CDD7.383F4400>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAFrSURBVEjH
Y2hsbGQA4YaGBgGPpkUVBq2b12u07dhPDnZqWtae1tBjATMThMFESsNkB7GWw8+52079pwYGWQS3
oLyhQ4KahsNwcNPsBLAFdk0r+6ltOAgLtR19D7ZAsXXPeVpYAMJZDT0GDPxtJ77TygJQ3DLgkgxY
cfP/999//x96+Ik2FvQce/YfBECWSPWdpb4FIEPr9j8G+4QmPvBYcv1/6+Gn/8t2PwTzI9bcBvPT
t9z7rzTxPJgG8fO3PyDPApBmEHjw4QeYv/jiazD/5pvvYDFkAApOqlkAswTE//D9D4oaqlgAinTh
rjMoCQEEqGbBxRdf4WpA8UB1C5DzxQi3QGvqRXBecFx4Dcw3nHkJzLecewWuBpQfQGIgjNMCmpem
5i1r59PCcFAp3dHRwcFQ3NCiQIsiG1S/w+vkyIbpAaAaiFqGg0IFpdIHYVDdbN2yZjqodUCOoTKt
+66DWiQJDVM9MFoVtMQABu55kh8/ZkoAAAAASUVORK5CYII=

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: image/png; name="image020.png"
Content-Description: image020.png
Content-Disposition: inline; filename="image020.png"; size=453;
	creation-date="Tue, 26 Feb 2019 12:28:56 GMT";
	modification-date="Tue, 26 Feb 2019 12:28:56 GMT"
Content-ID: <image020.png@01D4CDD7.383F4400>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAFFSURBVEjH
Y2hsbGSA4c1JCRmXA32W3/N03U8O3hsT0dBRXi6BbCaY6KmuVnjk4Xz8r4XRf0rxV1vz96tSUiJQ
LADZTg3DYfinlcn3icXFGmALlmWkBVDTcBi+5u+1HmzBsfCQflpYAAoqsAU3fT2208ICEAZbQO3w
J9qCf9Mm/f939gwY///86T8cPLgPFwfjLZv+//V2JdGClPj/JIHLl0izAOR6dPBv1w7cFvz8SaIF
K5ZimPE30Of/3/Cg//8O7sdqB2kWAMMVqwUw+f4eGlkQG0klH6xbjRkHoNREtTjAEgT4wL/jR0lM
pnYW+F2MlDzBeSErdRDmZKpZQPPSdF1KUgItLACFDNiCjo4OjmdujuepbcHMvDwLeJUJqt5eONld
p1Z1CWo8oNTJINzQ0CBwODq8ndxIBzkQ1CKBuRzDAlphAFhkt+g2lW3cAAAAAElFTkSuQmCC

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: image/png; name="image021.png"
Content-Description: image021.png
Content-Disposition: inline; filename="image021.png"; size=650;
	creation-date="Tue, 26 Feb 2019 12:28:56 GMT";
	modification-date="Tue, 26 Feb 2019 12:28:56 GMT"
Content-ID: <image021.png@01D4CDD7.383F4400>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAIKSURBVEjH
3VY9SAJhGL4hyKHBLceGIIcGtxwdGhprCBydpCna/DmEE4SOEEQiwiGMIo0CjSSEiiQkkhAsiv6o
REIMiaQCjSK+eg4+uTvvRD+aeuH1uNe753l/no/3OL/fz8GnhYB5yLuWNLoTRc61Q1h8wLOemfDN
OygmXPqZ9IXtPa5UgxVY7Ui0SeASBFOva7tG/zQF9ok7fU2Evduu3BbJKUhG+YhbIhjhoyEaNPBp
Uqt/ksz9c1fgi7kSqbx9EMfGWZMAHRFF0cD1ezYLNGiPFUjxpc7UlvGVvEQkjzkF0cLJe48MkD3T
gMUDEs0/KmIO35yNUwT+HQEUhfvG17c0TBpL31QJDD2HMJgJQtkHIjdz8LAlBmEwEyQvnhRg1oUj
Ej8tK2IzqcvOCFD6VfVdQQBA6BuGtqhjeB7vUQJInFakWQGyQb+RydjSCTEKu1IcrVEP1RLOSlec
4NnMnXRAkQSdiSYBHMCF8itRG7JG/+mA5YakQCIH1yWgDtV0Ysgc7dHCaEswlThvAVMPnWavh9GW
QC1HGFSmZUwVoKedElAxaBLobTAtMK0YpKqXpJMPWjmLdzmq98BxqaYAgyShdblBdXrv/y4zIyeV
ofMASscscPhwpTLGPeTaDnzYuxpv7mT5VvsL73NvVbCKmwRwfA3IdzOrD/KxNAVXEFDHYNA2FkfP
1Xg/QHi1iWpER1gAAAAASUVORK5CYII=

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_
Content-Type: image/png; name="image022.png"
Content-Description: image022.png
Content-Disposition: inline; filename="image022.png"; size=565;
	creation-date="Tue, 26 Feb 2019 12:28:56 GMT";
	modification-date="Tue, 26 Feb 2019 12:28:56 GMT"
Content-ID: <image022.png@01D4CDD7.383F4400>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAG1SURBVEjH
Y2hsbGQA4YaGBoGdWSkVV5PC19+LDdlPKgbpA+kHmQMzE4TBxNTycoO3kd73/wS7/qcUv4jyuw4y
D24ByEZqGQ7DIPNgPmE4nJHQTk3DYXhvVlID2AJQ+NHCgpsJYdvBFvwIcf9OCwtAwQS2gBjFf4sz
aGBBhPf/f+uW/////u1/MPj18/+/c6f+/63Mo4IFIMPv3/kPA/+uXPj//8tnMPvv/OmUWwB2Ochg
oCV/MmMg4nGB///2tWI17P/LF///Tukm3gKYa/8kh0PEgPTfuhIUDLLwT14SmA0KRpCjwOJA3+O3
AKgJDICugkcy0HXoAGTYv307McRhPsZtAdAF6Ir/tlSB4wElLkCuJTeI/p08CokDoAvRkysoNYGC
BBYUYPVH9oMdQbQF4HAFGQSy5Oa1//9WLgIbAnM9iE9xPgBbAvQ6Ovi3eS11czI4/IEu/ttZj0hV
1C4qKCqLnkYHnKeFBaBSGmzBsfT4flpYADIXbEFHQ7nElzDP99Q0/EO493OQufA6eVFhnge1LAGZ
AzIPpdIHYZCNp1Njpz+KCzpOjsEgfSD9MJdjWEArDACKycXfaiESxgAAAABJRU5ErkJggg==

--_011_AM0PR02MB3587ECB5D599D4DA99C1B021D87B0AM0PR02MB3587eurp_--

