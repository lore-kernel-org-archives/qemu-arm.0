Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp357020wrm;
        Fri, 4 Oct 2019 05:10:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy64IDHVfpjzBiFcYhNLTgI9IlQRXoyXR4W7XKQvpIo671jE6HjYqnORTe0saHRotL5ToEU
X-Received: by 2002:a50:fa9a:: with SMTP id w26mr14880555edr.227.1570191056437;
        Fri, 04 Oct 2019 05:10:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570191056; cv=pass;
        d=google.com; s=arc-20160816;
        b=poCQtsOupW74uQDXYKAttoTjUz1LlMOst98GJtqj32b2Wp00w2zMuCqSu8zF/y4jtk
         E8lf53fHhfOx1q3bKEJ6x8umHz8+z7n1ExSUXkxN4FUEWjrtJsqtwm3eT7OMnpaq7SG+
         VCQ++6E6RTJYTKN1gSogyGIueo4DlL0K8l5KBIz9ghSkcmFEiBLnBVJYG/AwG294y7rK
         fhxG5ee/0Zv025aXIz6J4iYW8w/8zFAaYMNbqfUt2KL8H4FG8m7yrXuJXghJTBfMn4Fy
         0tdX2KSjd11zvtqqWURKUtobmBu2Haia/PcNWTp5Yj5t1SvcZb5hZYskdyt9Wsb/jEEB
         qy5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=lIx1W6fqdu9AV5efFgxyyhdzBm93uCtPzMz5uL7hC9E=;
        b=FheVj7sVMIO8VdUhbRUF+1KyJH0RcqvHloqzPiM/P1DhYk+KC6Z8Zt3v2lLRed/4Z9
         /lQecQ4fHj/GrKNUYLl52Rj2cJUqpRTM6RepnG3z0pUkvr8vNLTn/qch5yyueYVrkHeB
         zIQALiWnL8aWLuidK8+chymGDR6tHdf+DWjhZHEqB6nzJ84nzBjQrosbR9nf8oS95Mnc
         A8rj4tunVFvoWi+Qp50NC91E+3WVltvUanzVZY1NGflXeVXl1WvrauokPd0KMtr9sWhx
         gR0h0BGAQJvg+1XnOAkSfEt8EK/26jTHEKwaAs/COLl0DM/zJddhR/oHYiG314wXoxbb
         6L7A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=VTzPwApF;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 91si3964196edy.188.2019.10.04.05.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 05:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=VTzPwApF;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGMQB-0003nu-AM
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 08:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <waseem19992009@outlook.com>) id 1iGMPH-0003gp-Fg
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:10:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <waseem19992009@outlook.com>) id 1iGMPF-00047h-Qt
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:09:58 -0400
Received: from mail-db5eur01olkn0802.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::802]:13134
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <waseem19992009@outlook.com>)
 id 1iGMPF-00046z-DY
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 08:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGtm+hjLcCqWEMm0uUR1U4mqBCpBfOaE4uZtrn33mzTQz9uHh+IGOkBzrw6PXe+Ulcmjgq3YIX1NjPFHC0X8cadlLYu0siWcQEW/UZCd6U8o1bqGQyOmOeaqpPxecEi90fcZYNEpCq9kvKfsjsl8aCMODUI6wNJLlCh4p+UtwJk19HfrniUu7JbRxBG+NZhOUFNg0o25wYWd++av889AI4FKnRL4YYwFPUUs5jYITGjuWFDSuKZg+yrW9U1G8wrf1va9BmvnR2u4SqjFCOMDyiStuX/+3j2y5ybvqPwewc6evjB4m+6R/iLRy0OapqJBWvC/a51tMT5RbC+gla4lIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIx1W6fqdu9AV5efFgxyyhdzBm93uCtPzMz5uL7hC9E=;
 b=hMNhXZ5T+OVT1FM9DOmaxIdJJAvBTRsxPWGgf/Je91RIKikmh43nGYVnIfd+71qv8Wszn2p3QhE0vf44+jwcc01VsaeHmnKPjCy9dCFMW0dW/tZd8wHYRWbKJPv7u5FRTlJR3bhy/lZcTTUNKKIE62GI8h19LBat6TSFy52KSaR++I3qZQI0xSAn8SknFnglK8CXsO0AYzWr1iXySclSRoKkk6r7RzOSgIQNMWXa6VKgpDY3UwHZN4Cu6JJdjtoQDJhu94KBuw1OUHc+WBlRXG566h686fHkOkN+RBkPF1N2ZKM731Am7kDwo9+ILpVdXHQUTsF5+WinJeX0Yx9Pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIx1W6fqdu9AV5efFgxyyhdzBm93uCtPzMz5uL7hC9E=;
 b=VTzPwApF0eFtRGHT251ER1Uoc+Trgf2oWzW9paa1BiBEl35leSa9F0sOB10n2WXRNIVfcSoJXKY/o0BlUJo6oNtlmepYJYcccE4T7HhY34UCJczdrN9fc4GTdRdUDzmMaVBVz/togSDGxUfJJoMjpkMe2d3OZkxrUzQdiy6R4v93dl5Ge23843QoS/QrRIzm5yohyQpyRnsiLsf6jV8Aj6eKV9GVQH1IXsj4kvv0vz6sjaPkM7f6wDBFiPDyEhFLux0OTE4DFlvVbY2PipJM3NX17cPjmbireWmU7OZG0C5FRJ83B4GsJLi7Asft73T7CURVA9Yt0gcmMh/GyCznDw==
Received: from DB5EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (10.152.4.56) by DB5EUR01HT149.eop-EUR01.prod.protection.outlook.com
 (10.152.5.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.20; Fri, 4 Oct
 2019 12:09:55 +0000
Received: from AM0PR01MB5795.eurprd01.prod.exchangelabs.com (10.152.4.60) by
 DB5EUR01FT021.mail.protection.outlook.com (10.152.4.245) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 4 Oct 2019 12:09:55 +0000
Received: from AM0PR01MB5795.eurprd01.prod.exchangelabs.com
 ([fe80::294b:1b1:d8c9:8b43]) by AM0PR01MB5795.eurprd01.prod.exchangelabs.com
 ([fe80::294b:1b1:d8c9:8b43%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 12:09:55 +0000
From: Waseem ALKurdi <waseem19992009@outlook.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: [re-sent to correct mailing list] QEMU not booting U-Boot on almost
 all i.MX ARM boards
Thread-Topic: [re-sent to correct mailing list] QEMU not booting U-Boot on
 almost all i.MX ARM boards
Thread-Index: AQHVeqyB+mvVp5KkDE6ScBH/iSKMiA==
Date: Fri, 4 Oct 2019 12:09:55 +0000
Message-ID: <AM0PR01MB57951DFAEC15A7E418F6F3C1D79E0@AM0PR01MB5795.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D9E83049E6D3C1FD7AA98EB5A7CDF9EF7DAF2F87C1918D364ABD28048CE11AD0;
 UpperCasedChecksum:0AA763280A8408EEA6829233BBD93E2F2551D13D8E023CD73B907B6BA9C3119E;
 SizeAsReceived:6801; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [JDBjXd/Pp7p/wZ2VVw6aqe2hRaIRjyN3]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: DB5EUR01HT149:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Izw1NjB2P1E5mjwqUxjxSDN8cc7EWMNdjp4eCCmY0ut+w3KxYxHTc88CybhJ0Yg3vobhrqj2ejmRr5kZpiE4JD1O3pMY1VMDevMdt6I0jtVKZs4otThdySgF9FIylLCIadPZ7UioeDZquTlcmEXvdCSJY4BSndL8luG7aT6DkNBl5Dde/urD6k8m0mwsg90M
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM0PR01MB57951DFAEC15A7E418F6F3C1D79E0AM0PR01MB5795eurp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6defdc-588f-4b75-ef73-08d748c3c4b7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 12:09:55.1536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT149
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe02::802
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
X-TUID: jiiZORYrwkNg

--_000_AM0PR01MB57951DFAEC15A7E418F6F3C1D79E0AM0PR01MB5795eurp_
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


--_000_AM0PR01MB57951DFAEC15A7E418F6F3C1D79E0AM0PR01MB5795eurp_
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
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px; background-color: rgb(255, 255, 255)">Dear all,=
<br>
</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Helvetica=
, sans-serif; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px; background-color: rgb(255, 255, 255); display: =
inline !important"></span>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">I'm trying=
 to get mainline U-Boot to boot on mainline QEMU 4.1.0 for the 'sabrelite' =
board, using the configuration 'mx6qsabrelite_defconfig'.<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">It's not b=
ooting at all. Actually, not a single U-Boot build for an i.MX board would =
boot, with the exception of 'imx25-pdk'.<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">I'm compil=
ing U-Boot by un-tarring the source tarball and running the following comma=
nds:<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">$ time CRO=
SS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gnueabi- mak=
e ARCH=3Darm clean<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">$ time CRO=
SS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gnueabi- mak=
e ARCH=3Darm mrproper<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">$ time CRO=
SS_COMPILE=3D/path/to/toolchain/arm-2014.05/bin/arm-none-linux-gnueabi- mak=
e ARCH=3Darm mx6qsabrelite_defconfig<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">then after=
 the build finishes:<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">$ qemu-sys=
tem-arm -M sabrelite -m 512M -kernel ~/Downloads/u-boot-2019.10-rc3/u-boot.=
imx -monitor stdio<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">And other =
variations on this command as well.<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">No amount =
of kernel commandline options or anything would make it boot.<span style=3D=
"margin: 0px">&nbsp;</span><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">I have ask=
ed the same question on the U-Boot developers' mailing list, but they direc=
ted me here, as it seems to be an issue with QEMU's implementation of the '=
sabrelite' board.<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">What shoul=
d I do?<span style=3D"margin: 0px">&nbsp;</span><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)">Best regar=
ds,<br>
</div>
<div style=3D"margin: 0px; background-color: rgb(255, 255, 255)"><br>
</div>
<span style=3D"margin: 0px; background-color: rgb(255, 255, 255)">Waseem</s=
pan></div>
<br>
</div>
</body>
</html>

--_000_AM0PR01MB57951DFAEC15A7E418F6F3C1D79E0AM0PR01MB5795eurp_--
