Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp330104wrp;
        Thu, 3 Oct 2019 21:33:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyE2kCXlXBE8mLaYKGECUAUQguZ4H0SVk/lbbsVNz/jp3pA5vbV4WCTTvK5xUAWjJ85cNkS
X-Received: by 2002:a50:d2d4:: with SMTP id q20mr13388026edg.172.1570163623154;
        Thu, 03 Oct 2019 21:33:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570163623; cv=pass;
        d=google.com; s=arc-20160816;
        b=MkxkSuk3ofnbupnaf8a2IAQwrPrzlWNfL7oiMc7x7jAHL1MhZ5nr7HdDb+j5XCzOla
         dzweo7o6v9WYl3c0Zwn+c84IaJY72dj9ieCMXSv+xyDffDk3qxns91BiKUo110ckwvxJ
         g/xvnJJWzDBSD2qPDmawRKaypE3XyT4tbvq5g8DAl7d4n0+p9feHEnw3yfGJ6hsPGXcE
         wGo4HC8hKTUVePZYUuAoeCuAM0YiFeTnfBns/i2YJsWpNhtJQWt94fUbdS6BPBR75g0w
         J2DXLJyqavpElmkIjNuL8Gycog7mHY0o2NS2UNno474SxoRxqS11jsQuZdrahj5+/QKB
         oa8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=tZwDAT1qb+NWaH+sQarXnM71xgmSFDQXomqAKt+LsPA=;
        b=I5qRyVO4Jw7Yl3LMQi6MyNcYbLQwyEln0eXi3eKlMUN9gkkBYaDWOjYy1rSdffccET
         TMtuiWYq54zkAbRazDyiXzddlpJPUzIv3JGNf3xvgRb8mJAVXPLsI5orNMXrHtwmELIC
         cGTTzMjuzVTL8HORNiP3m6QG0Et53eB9OJWAQSmG16KYAZX8dyMO9zIYLR2+QlUpXgYO
         G9BJUSkiwDLQU+0XW/o7g42vDdCLQ7luMvQqH4A5G+gXzmlBOyuFuf3eorIvHz/dUAkE
         W9zJRos+lQnAiHDBBp/KOD/SvCQsLQGuSxCDH8G/C5Lrd11/yAugguDJDTi9AKkJT1/H
         DVmg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=V+L8HJgF;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id be24si2852959edb.120.2019.10.03.21.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 21:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=V+L8HJgF;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGFHi-0002fM-1I
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 00:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <waseem19992009@outlook.com>) id 1iG8VJ-0004nT-LQ
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 17:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <waseem19992009@outlook.com>) id 1iG8VD-0000qn-Fk
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 17:19:14 -0400
Received: from mail-oln040092071014.outbound.protection.outlook.com
 ([40.92.71.14]:16470 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <waseem19992009@outlook.com>)
 id 1iG8VC-0000lS-Jr
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 17:19:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDEJrDdHT6CBb28CN2oQTMF5xEdDtH21/RC+718avqGV+naEb2jmImbBJFQT6LJCb+4hQ9qeLjBNlD1lc9L7isCwhya+SkZ65Xbd/uW0LdCL9MllW29LIZDCLQjPNakS2yemh9a85Qrcota48hXFJSQKhV+dEEh0CBL80akh/YkezG3my3eIxkCtDkoARe9rKdrAkLLE1clFiHYsBF5u7JnbvHkaVp5DK6VD7BtKhTgi9Vmt5gCSthVr3VmYcfl2qDWQ369dHF6lUVcw9LwNnGILHmVZ6URVltjsLiv1ySU0slovh+7Ac7kFIOFX70QieckyVeddb2dPbbUz67s0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZwDAT1qb+NWaH+sQarXnM71xgmSFDQXomqAKt+LsPA=;
 b=MdXvBBWtvtf7k/efNiZJiYs7r7NFeskoQq9jYHh6dnPJapLmFM70cY4PagmoLZVME+0EYHwaqK95QHOkPPnpTEKbPxtneyjTgT2RNrXNEX6Swfbh2NVd9BV2C0LwqYQv9rVicqf7I3qx3jjddYOnluNFGtJDv0ieyu00lEnQsSOmAj2/LlW+R34wKzQ5FgYtt8jsIujUA8zbX7/oyPbLMGvlX9Rr/6dGAWixYuwqhS1zpURDEDfLV+jtWxDiOLanmid29lX7JccDf5y7BrG9oeodov9eKlQub0Z5Nld7eUebLil5BqNw2Zpz0oEBVdcoPN/ZMj2BmRuiH90S55pi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZwDAT1qb+NWaH+sQarXnM71xgmSFDQXomqAKt+LsPA=;
 b=V+L8HJgFapQO7a0jzcLEdkwIx+YqbvhAs6g/u9iAkks6+3g2wFGNF4Y3IVyRMl0aKHk3bx+2rKrfCOhyGbIrqQHQI/C5nHbotsBNpRcLb7WL8lCpwZGl6Y5lswJ81JDa3XrMF9rMdLNXUoY7yIebA+zgWGOvvv6HrEPLtJqvTaMUqNsEGIxHjN4ppptOE8qKrpSGI1TBENWPkcU+6CMhu6/4JTWCa8gsitoAJwInEAnyHtUi7aVgJh79ygv9zKbahdorW5dvPHZFBbypiVY7/Lhh/UIGO/K3a5JDDzyAmgAKh7ui50r8q3NqauQLLm6dcXvoqG9YHSiwDyaatsDwMw==
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (10.152.20.59) by DB5EUR03HT029.eop-EUR03.prod.protection.outlook.com
 (10.152.20.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15; Thu, 3 Oct
 2019 21:19:08 +0000
Received: from AM0PR01MB5795.eurprd01.prod.exchangelabs.com (10.152.20.51) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 3 Oct 2019 21:19:08 +0000
Received: from AM0PR01MB5795.eurprd01.prod.exchangelabs.com
 ([fe80::294b:1b1:d8c9:8b43]) by AM0PR01MB5795.eurprd01.prod.exchangelabs.com
 ([fe80::294b:1b1:d8c9:8b43%7]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 21:19:08 +0000
From: Waseem ALKurdi <waseem19992009@outlook.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: QEMU not booting U-Boot on almost all i.MX ARM boards
Thread-Topic: QEMU not booting U-Boot on almost all i.MX ARM boards
Thread-Index: AQHVejAvQH2551LaSk2VVxm8/CaXmA==
Date: Thu, 3 Oct 2019 21:19:08 +0000
Message-ID: <AM0PR01MB579581C9949DF83AD50F6FE0D79F0@AM0PR01MB5795.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:B18E69A9DE397DF158D0639470376CDE8A73C4F82B54FA6D58625FBD2E706FCE;
 UpperCasedChecksum:BF65A5F82E62255609184BB3137032F566569EF3D5A0CDAD919EF9FF12C4C224;
 SizeAsReceived:6723; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [AfMJD1q43aQ7mLY1B+jUPo//kCsanw/6]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: DB5EUR03HT029:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQqMiEP8alukcww4qJ7uqW3F8fKWSi7i3Q8hDUrayA7YEbab8/u1tE3LxvDJqH5BgdeWZpuko+7/zn9HjoNHHwg1D3alKVJXhnnSIKk9h1b7u35DhKXjvBKFUgNVAcl3Vy4usT3ahaS3MMSRjiE7A6TojZEao37zi0bwj4HhvEojcTJwmiCtyuclSRnTqqnF
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM0PR01MB579581C9949DF83AD50F6FE0D79F0AM0PR01MB5795eurp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 36864d7a-3298-4fe1-2477-08d7484753c7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 21:19:08.1252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT029
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.92.71.14
X-Mailman-Approved-At: Fri, 04 Oct 2019 00:33:34 -0400
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
X-TUID: GPQdy8J7tTei

--_000_AM0PR01MB579581C9949DF83AD50F6FE0D79F0AM0PR01MB5795eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear all,

I'm trying to get mainline U-Boot to boot on mainline QEMU 4.1.0 for the 's=
abrelite' board, using the configuration 'mx6qsabrelite_defconfig'.

It's not booting at all. Actually, not a single U-Boot build for an i.MX bo=
ard would boot, with the exception of 'imx25-pdk'.

I'm compiling U-Boot by un-tarring the source tarball and running the follo=
wing commands:

$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gn=
ueabi- make ARCH=3Darm clean
$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gn=
ueabi- make ARCH=3Darm mrproper
$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gn=
ueabi- make ARCH=3Darm mx6qsabrelite_defconfig

then after the build finishes:

$ qemu-system-arm -M sabrelite -m 512M -kernel ~/Downloads/u-boot-2019.10-r=
c3/u-boot.imx -monitor stdio

And other variations on this command as well.
No amount of kernel commandline options or anything would make it boot.

I have asked the same question on the U-Boot developers' mailing list, but =
they directed me here, as it seems to be an issue with QEMU's implementatio=
n of the 'sabrelite' board.

What should I do?

Best regards,

Waseem

--_000_AM0PR01MB579581C9949DF83AD50F6FE0D79F0AM0PR01MB5795eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span>Dear all,<br>
</span>
<div><br>
</div>
<div>I'm trying to get mainline U-Boot to boot on mainline QEMU 4.1.0 for t=
he 'sabrelite' board, using the configuration 'mx6qsabrelite_defconfig'.<br=
>
</div>
<div><br>
</div>
<div>It's not booting at all. Actually, not a single U-Boot build for an i.=
MX board would boot, with the exception of 'imx25-pdk'.<br>
</div>
<div><br>
</div>
<div>I'm compiling U-Boot by un-tarring the source tarball and running the =
following commands:<br>
</div>
<div><br>
</div>
<div>$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-lin=
ux-gnueabi- make ARCH=3Darm clean<br>
</div>
<div>$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-lin=
ux-gnueabi- make ARCH=3Darm mrproper<br>
</div>
<div>$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-lin=
ux-gnueabi- make ARCH=3Darm mx6qsabrelite_defconfig<br>
</div>
<div><br>
</div>
<div>then after the build finishes:<br>
</div>
<div><br>
</div>
<div>$ qemu-system-arm -M sabrelite -m 512M -kernel ~/Downloads/u-boot-2019=
.10-rc3/u-boot.imx -monitor stdio<br>
</div>
<div><br>
</div>
<div>And other variations on this command as well.<br>
</div>
<div>No amount of kernel commandline options or anything would make it boot=
. <br>
</div>
<div><br>
</div>
<div>I have asked the same question on the U-Boot developers' mailing list,=
 but they directed me here, as it seems to be an issue with QEMU's implemen=
tation of the 'sabrelite' board.<br>
</div>
<div><br>
</div>
<div>What should I do? <br>
</div>
<div><br>
</div>
<div>Best regards,<br>
</div>
<div><br>
</div>
<span>Waseem</span><br>
</div>
</body>
</html>

--_000_AM0PR01MB579581C9949DF83AD50F6FE0D79F0AM0PR01MB5795eurp_--
