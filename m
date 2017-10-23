Received: by 10.223.161.27 with SMTP id o27csp18268wro;
        Mon, 23 Oct 2017 08:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RcboV19o53GsJxlhoQtWoYSM3QGG5437uEq5ViMj4WNevgFca6+2Yzsvs3IUlsj4SzsIEE
X-Received: by 10.13.232.14 with SMTP id r14mr8850671ywe.146.1508774333185;
        Mon, 23 Oct 2017 08:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508774333; cv=none;
        d=google.com; s=arc-20160816;
        b=tnUtVurlz6RUzVl0KQ4RZBbhV4IENc7k8kMr3u9kZM1bTNQataGj1yk9WL5vol6vuU
         8bwcuX7dJOTeBV2RP55WmG+fgG9DDtyPmrGOgqahWhev4TitMLZ89b661tRkI3q91Avw
         F5d04DoZ67Nr74nF7e3CK/8TBgGZRoO6WHk8IGPdLHjTM+97qjsVNwIoEVFKSPaiURUb
         mC6qJgJb5Gm8WNVSgkZ+QeuzE3DB5DsFzhWUFPROuYRuJwdSgZMTckgz7j3K/DvQZOzy
         iD1kx1+6QaxSWJ8lTrXLTy/H88L4raNlUAWqam3JN+TD0SnCcdGm1eGxgA+XiV/3niBg
         rroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :spamdiagnosticmetadata:spamdiagnosticoutput:content-language
         :accept-language:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=3lBo8kRESkchHesd4kFdWP9FWX6X/Spz4JczNp9FTDs=;
        b=C1rGW4i2N170hGEU2YHYEb/AKP4F4KErgEeXp/NParL1+FgDY573e4PwNpYF2u+XtS
         pyhvofxivg57bM5VhGplX5QwXIa3T1wbQGutDxwVT9ul8UqFAnE4vzgsIUe4u9vrpKqx
         LiY85h8irtzcC/n+fpmbWqcF8+y3LZrzfLtOz3+sbbnDUpTHioKoh/NwkG1yFseS9BcF
         hqUZdsTQh+4uISxO5Lw1xrhAriFPi8lRp31hR6R+WOjgWRBP3xaw68wZgoLh/dmD8gfz
         oyKgVQLrPxfTIFjUMRuoFxr/RwOMHOFtrgjIfZIBw820873X7P/tAfGA32o172/xOj0A
         bRVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@Enea.onmicrosoft.com header.s=selector1-enea-com header.b=pnSNXjx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n16si1230011ybd.305.2017.10.23.08.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 08:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@Enea.onmicrosoft.com header.s=selector1-enea-com header.b=pnSNXjx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6f7s-0000cf-MY
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 11:58:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Cosmin.Smechea@enea.com>) id 1e6dH2-0005mL-Rm
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 10:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Cosmin.Smechea@enea.com>) id 1e6dGy-0006Wr-Tt
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 10:00:12 -0400
Received: from mail-ve1eur01on0097.outbound.protection.outlook.com
	([104.47.1.97]:51424
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Cosmin.Smechea@enea.com>)
	id 1e6dGy-0006No-Fz
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 10:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Enea.onmicrosoft.com; 
	s=selector1-enea-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3lBo8kRESkchHesd4kFdWP9FWX6X/Spz4JczNp9FTDs=;
	b=pnSNXjx6tnr0NxPlXQnK4UWdquy1ZEDR1xRVf8kE2Drbete7wqb4lq7gA6VqVvs6pqZvTAp2AMhaPbluWcqVnQvqEbnAi7aeaypcYkmrVJRkgFtQ4QfOfA9HkUcgL0lJfy3CdqG6xRj9tOU0Zxn64E4+liopwcg6aVAyutHOpyo=
Received: from VI1PR0701MB2031.eurprd07.prod.outlook.com (10.167.209.153) by
	DB5PR07MB1191.eurprd07.prod.outlook.com (10.169.32.25) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.3; Mon, 23 Oct 2017 13:59:57 +0000
Received: from VI1PR0701MB2031.eurprd07.prod.outlook.com
	([fe80::dcbe:d99b:bc6f:3392]) by
	VI1PR0701MB2031.eurprd07.prod.outlook.com
	([fe80::dcbe:d99b:bc6f:3392%13]) with mapi id 15.20.0156.006;
	Mon, 23 Oct 2017 13:59:56 +0000
From: Cosmin Smechea <Cosmin.Smechea@enea.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: aarch64 live migration failure between nodes with different CPU
	revisions
Thread-Index: AQHTTAbfRrGXc+8xekS+B1guxlwdPA==
Date: Mon, 23 Oct 2017 13:59:56 +0000
Message-ID: <VI1PR0701MB20317767B155FE8C60D1FA12F5460@VI1PR0701MB2031.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Cosmin.Smechea@enea.com; 
x-originating-ip: [193.202.22.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR07MB1191;
	20:O9fJq0SaqVy9iIVkA/qInGg42zg88KeNE8Uj26ANO/oYFR68dYoxxmKFswOVEkrIi4aQ5G5HkrKlm9rqBBuzI8P52/wvwezmonQHM0SEr6GO/g72tMmgUsgGHYawWtQHaagY35CykG5Ex03vNwNBbh8Vb9ErrfT4PgVJTMbsFm8=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10019020)(6009001)(39830400002)(346002)(376002)(199003)(189002)(288314003)(81166006)(55016002)(316002)(81156014)(9686003)(68736007)(7736002)(54356999)(54906003)(8936002)(3846002)(54896002)(2351001)(5250100002)(106356001)(105586002)(74316002)(72206003)(478600001)(86362001)(8676002)(53936002)(99286003)(2501003)(102836003)(6116002)(4326008)(189998001)(25786009)(19627405001)(6506006)(5640700003)(6436002)(66066001)(6606003)(50986999)(14454004)(33656002)(7696004)(3280700002)(2900100001)(6916009)(3660700001)(97736004)(2906002)(107886003)(101416001)(5660300001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR07MB1191;
	H:VI1PR0701MB2031.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-correlation-id: a7cea0f9-0e80-4753-8219-08d51a1e57a6
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DB5PR07MB1191; 
x-ms-traffictypediagnostic: DB5PR07MB1191:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <DB5PR07MB119126C0F61EA42574024C26F5460@DB5PR07MB1191.eurprd07.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3231020)(3002001)(10201501046)(6041248)(20161123562025)(20161123555025)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB5PR07MB1191; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB5PR07MB1191; 
x-forefront-prvs: 046985391D
received-spf: None (protection.outlook.com: enea.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0701MB20317767B155FE8C60D1FA12F5460VI1PR0701MB2031_"
MIME-Version: 1.0
X-OriginatorOrg: enea.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cea0f9-0e80-4753-8219-08d51a1e57a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2017 13:59:56.3726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8cdaed89-c47e-40b8-90b5-f28ad2c3fdca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB1191
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.97
X-Mailman-Approved-At: Mon, 23 Oct 2017 11:58:47 -0400
Subject: [Qemu-arm] aarch64 live migration failure between nodes with
 different CPU revisions
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
Cc: Alexandru Avadanii <Alexandru.Avadanii@enea.com>,
	Ciprian Barbu <Ciprian.Barbu@enea.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Cu1zWriiZFh

--_000_VI1PR0701MB20317767B155FE8C60D1FA12F5460VI1PR0701MB2031_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Live migration fails between two connected aarch64 machines.
QEMU emulator version 2.9.0 is used on both of these nodes.

How to reproduce:
=3D=3D=3D START =3D=3D=3D
Start a VM on the designated source node.

Source:
(qemu) migrate tcp:<TARGETIP>:49160

Target:
Warning: affinity is not specified for some (1) of the 1 smp cores. Will be=
 using default mask
qemu-system-aarch64: -chardev pty,id=3Dcharserial0,logfile=3D/root/qemu.log=
,logappend=3Don: char device redirected to /dev/pts/3 (label charserial0)
qemu-system-aarch64: error while loading state for instance 0x0 of device '=
cpu'
qemu-system-aarch64: load of migration failed: Operation not permitted
=3D=3D=3D END =3D=3D=3D

To note is that these two machines have different CPU revisions as shown by=
:
root@node-4:~# cat /proc/cpuinfo | grep 'CPU revision'
CPU revision : 1
root@node-5:~# cat /proc/cpuinfo | grep 'CPU revision'
CPU revision : 0


Between two nodes with the same CPU revision the live migration works as ex=
pected.

Is there any further planned support for aarch64 that may affect this issue=
?

Regards,
Cosmin

--_000_VI1PR0701MB20317767B155FE8C60D1FA12F5460VI1PR0701MB2031_
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
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p></p>
<div>Hi,</div>
<div><br>
</div>
<div>Live migration fails between two connected aarch64 machines.</div>
<div>QEMU emulator version 2.9.0 is used on both of these nodes.</div>
<div><br>
</div>
<div>How to reproduce:</div>
<div>=3D=3D=3D START =3D=3D=3D</div>
<div>Start a VM on the designated source node.</div>
<div><br>
</div>
<div>Source:&nbsp;</div>
<div>(qemu) migrate tcp:&lt;TARGETIP&gt;:49160&nbsp;</div>
<div><br>
</div>
<div>Target:&nbsp;</div>
<div>Warning: affinity is not specified for some (1) of the 1 smp cores. Wi=
ll be using default mask&nbsp;</div>
<div>qemu-system-aarch64: -chardev pty,id=3Dcharserial0,logfile=3D/root/qem=
u.log,logappend=3Don: char device redirected to /dev/pts/3 (label charseria=
l0)&nbsp;</div>
<div>qemu-system-aarch64: error while loading state for instance 0x0 of dev=
ice 'cpu'&nbsp;</div>
<div>qemu-system-aarch64: load of migration failed: Operation not permitted=
&nbsp;</div>
<div>=3D=3D=3D END =3D=3D=3D</div>
<div><br>
</div>
<div>To note is that these two machines have different CPU revisions as sho=
wn by:</div>
<div>root@node-4:~# cat /proc/cpuinfo |&nbsp;<span>grep 'CPU revision'</spa=
n></div>
<div><span style=3D"font-size: 12pt;">CPU revision : 1</span></div>
<div>root@node-5:~# cat /proc/cpuinfo | grep 'CPU revision'</div>
<div><span style=3D"font-size: 12pt;">CPU revision : 0</span><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>Between two nodes with the same CPU revision the live migration works =
as expected.</div>
<div><br>
</div>
<div>Is there any further planned support for aarch64 that may affect this =
issue?</div>
<div><br>
</div>
<div>Regards,</div>
<div>Cosmin</div>
<p></p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); background-color: rgb(255, 255, 255); font-family: Calibri, Arial, Hel=
vetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe U=
I Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android E=
moji&quot;, EmojiSymbols;">
<p></p>
</div>
</div>
</div>
</body>
</html>

--_000_VI1PR0701MB20317767B155FE8C60D1FA12F5460VI1PR0701MB2031_--
