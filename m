Received: by 10.25.21.156 with SMTP id 28csp406075lfv;
        Wed, 24 Aug 2016 08:55:40 -0700 (PDT)
X-Received: by 10.55.23.28 with SMTP id i28mr4450771qkh.232.1472054140254;
        Wed, 24 Aug 2016 08:55:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id c9si6719959qkj.234.2016.08.24.08.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 08:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@hotmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=hotmail.com
Received: from localhost ([::1]:52003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcaWh-0001RG-MY
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 11:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mahmoudmahgoub92@hotmail.com>) id 1bcBGe-0006Sb-PT
	for qemu-arm@nongnu.org; Tue, 23 Aug 2016 08:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mahmoudmahgoub92@hotmail.com>) id 1bcBGe-0007ZG-1B
	for qemu-arm@nongnu.org; Tue, 23 Aug 2016 08:57:24 -0400
Received: from bay004-omc4s23.hotmail.com ([65.54.190.225]:51918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mahmoudmahgoub92@hotmail.com>)
	id 1bcBGY-0007WU-CG; Tue, 23 Aug 2016 08:57:18 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com ([65.54.190.200])
	by BAY004-OMC4S23.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(7.5.7601.23008); Tue, 23 Aug 2016 05:57:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=ITMIsepaD83fsj/lijQxNXI8YMXNUyS7rs3iokRGxX0=;
	b=Gb+WdfdJLlT1jTTRmdwTM0WxXD3rRAesKDl1a0kSLzNjJapIuo906YTNHrH0sJE8DUJA13OyIxzq8aVmWRLB59svkW8TuCEMICNkTes+u8CKm/qqKLtJQ2+NUjCtsrfHoUooKMv9XVzviMco0Q0q7binthLE7m0qSHxWTyTEDqAgmQxIJlpkDJcSVS20CthxGmaU+Roy7OQpg5hImubmPYM6/YP1z7Fr4bTFvvcBUkrpjy4s5vOz/eds8VHbzrfrXsh1Dz5895F5v1WZQ54Wf1UD9kBsw3JjMWn3qykmFHq/dq0LP4v1A/n+TnMewVCejSkhp0lpXA+uHmvPKWvh3w==
Received: from DB5EUR01FT055.eop-EUR01.prod.protection.outlook.com
	(10.152.4.55) by DB5EUR01HT078.eop-EUR01.prod.protection.outlook.com
	(10.152.5.51) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.577.8;
	Tue, 23 Aug 2016 12:57:11 +0000
Received: from AM5PR0602MB2820.eurprd06.prod.outlook.com (10.152.4.52) by
	DB5EUR01FT055.mail.protection.outlook.com (10.152.5.250) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.577.8 via Frontend Transport; Tue, 23 Aug 2016 12:57:11 +0000
Received: from AM5PR0602MB2820.eurprd06.prod.outlook.com ([10.175.42.138]) by
	AM5PR0602MB2820.eurprd06.prod.outlook.com ([10.175.42.138]) with
	mapi id 15.01.0557.027; Tue, 23 Aug 2016 12:57:10 +0000
From: Mahmoud Abd el-hameed <mahmoudmahgoub92@hotmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>
Thread-Topic: how to understand proccessor codes in Qemu
Thread-Index: AQHR/T2oaTsK7pb0SEGHFa5prlgvfA==
Date: Tue, 23 Aug 2016 12:57:09 +0000
Message-ID: <AM5PR0602MB28205F990FED17137DD19890C8EB0@AM5PR0602MB2820.eurprd06.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=softfail (sender IP is 10.152.4.52)
	smtp.mailfrom=hotmail.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=fail action=none header.from=hotmail.com; 
received-spf: SoftFail (protection.outlook.com: domain of transitioning
	hotmail.com discourages use of 10.152.4.52 as permitted sender)
x-tmn: [TeffjA4KrENuSO0FGMFuzFzELiWc9voH]
x-eopattributedmessage: 0
x-forefront-antispam-report: CIP:10.152.4.52; IPV:NLI; CTRY:; EFV:NLI; SFV:NSPM;
	SFS:(10019020)(98900003); DIR:OUT; SFP:1102; SCL:1;
	SRVR:DB5EUR01HT078; H:AM5PR0602MB2820.eurprd06.prod.outlook.com;
	FPR:; SPF:None; LANG:en; 
x-microsoft-exchange-diagnostics: 1; DB5EUR01HT078;
	6:kyaUCySTL3qLH7/SGM3suFOElUsujJ7ukIGPwetgz/hqrnejy+9C6HDRXW+tLodsdkoNQzUgtISjCmlyezFDvgiNo4i97LGeXPT3P+0ADVzdyijIk9LWuajuZRpij9CfuWj20wlUNvQDD47D8ZOpIhR3vNtSnPQ78znUS295rnC8txBG5/FD3GxD0k/Ii5bI9h2F0eNJACrO0sA2XWeYhwsgBDrh3zerPDeR6Y1VMB80qi6JdrxcYZVq2WnFlV5TXxfojqHjZJiBZWt6Tth0HY4Cr6/vbFhqIHBWNCBwkkL3+kbZ11tpDxRaZ055eW9y;
	5:WgtHQiS9vRgVjFXSusX7wk624dPXd5l/aE7DA2B9ouA1PCwvKaPbiADtXUPjhAKrNRgp01g9C/AmLreqDcOZ2wLKs0HnC53fWw2j9psVbLSNN7AKdtCUVpNi393sphOEalF+Yh1vm4LVxb1iS0yyUA==;
	24:JBdztgE8NIWBPJ4KzrMFiVK5SBB3QIt7aXlep+BwfsrxmllofthKyM53Yw6Qn37z2OEPxgpGW7vtnp4ZghuNAgXGeyjscoVl54JBO2vpfPk=;
	7:q6V5JMGd+jkCnEr6SQZ3zwawsERxaq7HTQAUamN6MmZ0/Y3CJKHMfEAW1sPLvkG2JyTAzpX0i6hobvtrgBXw9ZFMBbWLXA+UoXa0vYayhDiAraa2P+04ygMJlQZZJoMD7MgvOtDX7QuTp20/+hl924sXnl1BjfyyBE3dSw8LA83Ll7EwX65x+aAOQIO0pxPN5iYuQJiLnP6/MepTf1gsEoi/GulA8kQklF7bT7FWkgSy39zAzAehyDbShLGifdYy
x-ms-office365-filtering-correlation-id: a91afa42-b2fb-4cc7-4ca0-08d3cb54febc
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:(1601124038)(1601125047);
	SRVR:DB5EUR01HT078; 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(432015012)(82015046);
	SRVR:DB5EUR01HT078; BCL:0; PCL:0; RULEID:; SRVR:DB5EUR01HT078; 
x-forefront-prvs: 004395A01C
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0602MB28205F990FED17137DD19890C8EB0AM5PR0602MB2820_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2016 12:57:09.8864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT078
X-OriginalArrivalTime: 23 Aug 2016 12:57:17.0193 (UTC)
	FILETIME=[E0826790:01D1FD3D]
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.54.190.225
X-Mailman-Approved-At: Wed, 24 Aug 2016 11:55:07 -0400
Subject: [Qemu-arm] how to understand proccessor codes in Qemu
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
X-TUID: 29ANTCQ0oq6p

--_000_AM5PR0602MB28205F990FED17137DD19890C8EB0AM5PR0602MB2820_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am a new developer at Qemu and i want to understand how the processors co=
de works. I am get lost through google and didn't know where i can begin to=
 understand the code.

my aim is to understand how can we model the proccessors using qemu?



Thanks,

Mahmoud

--_000_AM5PR0602MB28205F990FED17137DD19890C8EB0AM5PR0602MB2820_
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
<p>Hi all,</p>
<p>I am a new developer at Qemu and i want to understand how the processors=
&nbsp;code works. I am get lost through google and didn't know where i can =
begin to understand the code.</p>
<p>my aim is to understand how can we model the proccessors using qemu?</p>
<p><br>
</p>
<p><br>
</p>
<p>Thanks,</p>
<p>Mahmoud</p>
</div>
</body>
</html>

--_000_AM5PR0602MB28205F990FED17137DD19890C8EB0AM5PR0602MB2820_--
