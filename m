Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp177905wrm;
        Fri, 4 Oct 2019 02:03:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywwK8EAhStQ+XRBA9dFiFeu9kyEi0NGi6e1rycV72rlSqrUSA4ACeYMjYqstDyo0mGdO/S
X-Received: by 2002:a17:906:4541:: with SMTP id s1mr11521773ejq.210.1570179802622;
        Fri, 04 Oct 2019 02:03:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570179802; cv=pass;
        d=google.com; s=arc-20160816;
        b=yS6x2CFkeuZCKIwPmDHfkoY5oBHcp1jew61X02h0yrAcqK0S3IrIx5NMJS6o2C8qW8
         6LunnCNrY2G6qyl6iS8w9JH8XJge9xnQcsOR4iPGQz2cib1jtpvdbnAr1hgbXdO77zB6
         pw483WSHjndi6vyLKGjgwnN/6GlgYCxRYhLFmNnwLCvccHbKU2F1YtNc/w1fEMy7FPiM
         UgNkHk16KFyeQpyAI64TWt8O4iCnD3B6FouIFYMi/4GPEm/hPNFjVRqHGnkrUD6u6CD4
         R61YligpM4tCu03lT8RGV/wnPEEHlpOs17N1nSGGKjOsVU5Bfpc1YWAGeWeYjcLkV3Lb
         jbXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=2tknnR97mFJxmSTLXj66VC99fcJR5plEXTgUSMAaOy8=;
        b=bwHl89N42eHI3ZZa84dq3T2dwq0B7DwOWz3hPCpnTME7RY7u/K5I56kbqrG97i0toe
         6zdID4Wt1r1FLdcVFcx2Z/2Xn65ZSSXKvacqInhf4c7AWXUjQ538SU+EofkyQL4npu+R
         PMTdyKlfUIKrtaY5H1soPn3rn159/vYEaxssT8AfMXNsl1oVHKK67Ab76iFYYgLrZ/FQ
         9hDTSZP7zfwUeBftypVB1Qc2uFsIb3M6yd6ehwkdD/XQj+vpWow2ljlcmMh35yYkrCK7
         Rqhmet3t7ttRWkzNuPilu0Qojx5sT5uopA0Uot9w25iejctzMhHEux97W3gHjVmxO0nZ
         zSlA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=AyuC64Y6;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si3095984edf.398.2019.10.04.02.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 02:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=AyuC64Y6;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGJUf-0006xL-DT
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 05:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <waseem19992009@outlook.com>) id 1iGJUT-0006uO-29
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 05:03:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <waseem19992009@outlook.com>) id 1iGJUR-0006Fd-6N
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 05:03:08 -0400
Received: from mail-oln040092066036.outbound.protection.outlook.com
 ([40.92.66.36]:8416 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <waseem19992009@outlook.com>)
 id 1iGJUQ-0006As-Em
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 05:03:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDiJ24xbx1bi/3Eg2FjozwtFMoR6CijpOmdorouDfbWkrI0u0IRLTZjSc+6XlP4dxX/c8EhC8i2rud+l+YuCUPrwvR85gE8XtkEiS6ig3iFZHwhThvQXLqTlhP5h0KSRaRVJgLmEn6BKi+YgUt5afKfDSymw0zUFsB88lQik4Mhw/k6Azf0LbUjuzkc7xweZ7ZWwa9cBCP7fo702bW7s+blTrPIx4dA+RqWVJq8kKcMzEjDOEOFHuVXG8JtygS2F8BcfFmW3zcmlvZDBEiAu6W1d2IcBxcjXpsdXvHvnlAIwnHmSED2k87TxcdO2bfP+LbhJvJu/SyGW53g+nZ6j2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tknnR97mFJxmSTLXj66VC99fcJR5plEXTgUSMAaOy8=;
 b=PdUBgTTkSaYB+VTqwMMM972S8JY8cr+Z7XDDMJGrlZzCjekGnF9ECjz3eZ6+eMaMBFD/W0vMEwp7Hz9E4H4cA/od+JFlEq/wk7nXuikWtUFsY+Ifj/v0qFFmIfUTY+7l4J46e2tSiY7thOEaGrYPOqeUL+MBpwMDOZUwoy2M8yzYv9IYrNG+TjX5d7/ehADPFT56izkIeoWc9/f4a02bqDb65FO+UtCiLRO10F5btO4UzgmCdSSNvgAgF052cPBWhW5+vOKz8YkMDYee9QB9jqkxC1B4ZtPn9trN0ZUFW5Js2cs6DW3Tb7JLXySsIR1m+mnWyMG5dO1a3wHVTWOVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tknnR97mFJxmSTLXj66VC99fcJR5plEXTgUSMAaOy8=;
 b=AyuC64Y6SlILMzQOn7uEaqYS/jVy6n58TwCxZXLIL/XjhJNkgJ6gVjBHTgvcLpRTpLK0kwEmO1f/kpQx303O/WT9G/zQrQos8jEyVtYP2Fkhc2yK3XzaQ9YLHDj5fqEwWp5m4cJQpZyY5XKH9sEF8IY2/FRH/kuljt8PMVubEJO+gPaoUsGeqRP4G2Y9YpMXv2G7/thiDRFGTSBVHfCeUp1RwGh1cA7tWLCDtWG5bMYXb7j/JFYLFjTPSbh8W9Wo039B6aeymRuEIdb6B5/YW/QlVhxvLAazfZ4/Tpn4Blsw3Blv1nvhO8LhjTgjwAD19Fk+jGTm0KphH6xqBKvBGA==
Received: from DB5EUR01FT040.eop-EUR01.prod.protection.outlook.com
 (10.152.4.51) by DB5EUR01HT042.eop-EUR01.prod.protection.outlook.com
 (10.152.5.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.20; Fri, 4 Oct
 2019 09:03:03 +0000
Received: from AM0PR01MB5795.eurprd01.prod.exchangelabs.com (10.152.4.51) by
 DB5EUR01FT040.mail.protection.outlook.com (10.152.5.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 4 Oct 2019 09:03:03 +0000
Received: from AM0PR01MB5795.eurprd01.prod.exchangelabs.com
 ([fe80::294b:1b1:d8c9:8b43]) by AM0PR01MB5795.eurprd01.prod.exchangelabs.com
 ([fe80::294b:1b1:d8c9:8b43%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 09:03:03 +0000
From: Waseem ALKurdi <waseem19992009@outlook.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: [re-sent to correct mailing list] QEMU not booting U-Boot on almost
 all i.MX ARM boards
Thread-Topic: [re-sent to correct mailing list] QEMU not booting U-Boot on
 almost all i.MX ARM boards
Thread-Index: AQHVepKHCsqOCCUHoUKl/XWDJH06qw==
Date: Fri, 4 Oct 2019 09:03:03 +0000
Message-ID: <AM0PR01MB57952364B6EA6B81133E84BBD79E0@AM0PR01MB5795.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:ABC2B27C5201F60360248749A3A73080FCECDC659B489C1BC040EF85E2A65D71;
 UpperCasedChecksum:F07B0DB91D15527975D1040FCACF8A2FA35E0CA4881F70ADA1481EEB864DFD0B;
 SizeAsReceived:6801; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [CpLNbjTmACxWmBenmd0ixIGFEMqWKZyP]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: DB5EUR01HT042:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P8nOpzShRT+FSIdK+iZ9qSMjr/KFUxKMHu5MOvWDjXfC2W4lQfnVzvLnVCTQducR2i154cDMAmmAKls6XlrQPitfb/1rlOmKDDQOyWQjTdAQngv1V9CAj5+3B3e8bBAd01sqBIZmja6ZWmnDoCu96resgeKHGelen5aKklq3PK5PWs62fHMv1fwsc3aYBCXt
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM0PR01MB57952364B6EA6B81133E84BBD79E0AM0PR01MB5795eurp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 136ae360-026b-4362-9a2b-08d748a9aa36
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 09:03:03.7992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT042
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.92.66.36
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
X-TUID: Qw5jaOvEVzB9

--_000_AM0PR01MB57952364B6EA6B81133E84BBD79E0AM0PR01MB5795eurp_
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

--_000_AM0PR01MB57952364B6EA6B81133E84BBD79E0AM0PR01MB5795eurp_
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
<span style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; ba=
ckground-color: rgb(255, 255, 255)">Dear all,<br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Helvetica, sans-serif; background-colo=
r: rgb(255, 255, 255); display: inline !important"></span>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
I'm trying to get mainline U-Boot to boot on mainline QEMU 4.1.0 for the 's=
abrelite' board, using the configuration 'mx6qsabrelite_defconfig'.<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
It's not booting at all. Actually, not a single U-Boot build for an i.MX bo=
ard would boot, with the exception of 'imx25-pdk'.<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
I'm compiling U-Boot by un-tarring the source tarball and running the follo=
wing commands:<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gn=
ueabi- make ARCH=3Darm clean<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gn=
ueabi- make ARCH=3Darm mrproper<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
$ time CROSS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gn=
ueabi- make ARCH=3Darm mx6qsabrelite_defconfig<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
then after the build finishes:<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
$ qemu-system-arm -M sabrelite -m 512M -kernel ~/Downloads/u-boot-2019.10-r=
c3/u-boot.imx -monitor stdio<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
And other variations on this command as well.<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
No amount of kernel commandline options or anything would make it boot.<spa=
n>&nbsp;</span><br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
I have asked the same question on the U-Boot developers' mailing list, but =
they directed me here, as it seems to be an issue with QEMU's implementatio=
n of the 'sabrelite' board.<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
What should I do?<span>&nbsp;</span><br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
Best regards,<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; bac=
kground-color: rgb(255, 255, 255)">
<br>
</div>
<span style=3D"margin: 0px; font-family: Calibri, Helvetica, sans-serif; ba=
ckground-color: rgb(255, 255, 255)">Waseem</span><br>
</div>
</body>
</html>

--_000_AM0PR01MB57952364B6EA6B81133E84BBD79E0AM0PR01MB5795eurp_--
