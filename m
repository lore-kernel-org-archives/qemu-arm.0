Received: by 10.223.172.38 with SMTP id v35csp3891006wrc;
        Mon, 18 Sep 2017 08:35:44 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAK/6Jqh+lYPNW+xVEPBv64uu9GJA7lxzqkeadT1Bfy6Y2RTuBhRGlb1oSNA7vYFVuzJDhk
X-Received: by 10.200.49.88 with SMTP id h24mr52265327qtb.335.1505748943977;
        Mon, 18 Sep 2017 08:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505748943; cv=none;
        d=google.com; s=arc-20160816;
        b=wBuR1qaYHJdSC3+QXXrNUE8aD/W1/ylWKGI+bsAbaEUYDoYsFzLL2hrVUr3mHZ522O
         7dDF7hl/lMAib2a2+kW9x+OE9yU4jxBfXhIL98dX9ZmCgcUFE0wkWkvuamQolEiZgLMI
         AUy+TjoQAdNFVJEBYnf2BMrffcW5dKwhbFr+oYP3bJfF6DjG45sFQ71lsSEgCePWUsxg
         AI1JaZJU4ODdA43BEKfpTf0drzsHbGtEIeVF8moEk72ntr2n8wjaLSwmMDcpVax7F7Bz
         kTE+DISHitBqVPSd3we+pGFC+LHnsjKthgLA7FXE2byMT6axHYwCGFA1qVqRiLn7vRDV
         pldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature
         :arc-authentication-results;
        bh=TwSq+Vx8W4PK0gjeVGcn0tOVH9xWlIW1ToErgsYoBcI=;
        b=Fy/1Jtdz95pviOT3mWygNkZbGMTV0Npa1m7isWw8EyHHcAZgbuR4mB35YNph7Btz5g
         dzKq/O0tJRGocI6Tev/WQWqNxlU78qqG6Yty6AwoKDS3RWKGWSy1DkUvsND2Jn5iB/mE
         KhaVM7gzjJJ9bzd9PjF1dP5v2b+xnNv7Z8btpj+W2SSoOqDCSrYlXhTwIptCmOhEyzn+
         X/f9WkIEsaBd0m418whb0NYQRHxdPYgtzf0E7kzlFxaQW1/G4bzCnhl35SJvXhy0qME2
         bF47QyALwbxOtGjQRiirFS84hHSxrRANgLu8TKSQDUvKQKEHeOBt/xT2NzIMv/NNVQE3
         aMjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@hotmail.com header.s=selector1 header.b=IfDOcPRw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=hotmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n44si7387073qta.141.2017.09.18.08.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 08:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@hotmail.com header.s=selector1 header.b=IfDOcPRw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=hotmail.com
Received: from localhost ([::1]:37297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dty5F-0000s0-FG
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 11:35:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <theuserbl@hotmail.com>) id 1dtqLz-0001hQ-Be
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 03:20:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <theuserbl@hotmail.com>) id 1dtqLw-00017c-69
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 03:20:27 -0400
Received: from mail-oln040092065083.outbound.protection.outlook.com
	([40.92.65.83]:13440
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <theuserbl@hotmail.com>)
	id 1dtqLv-00016P-Nt
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 03:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=TwSq+Vx8W4PK0gjeVGcn0tOVH9xWlIW1ToErgsYoBcI=;
	b=IfDOcPRwpS0u4IqnjZSGH9pWAgEdeWhw0mSjzsXOHvOzo8YZEOteDUg0DIR2JDaYElTps87vkswrWaM6jUq+MDSKmdz4DwsG9lT3VwzIuNVXp6JpAtdyDxCGr9w+E4LjUywhhxQe/B2xXbZn31YPaemi1l+rUpnQI2Ocbl7x7vbLayZ2AU+3fu/OFx0qLZUcOdprtxpOyYKtDDKukNG9aCv3oYANfnkIs6hEK1ybFDD6IO42gIEDET0Fh8qMAqx5eMJYhmnXlkRlwwh5Q6TniNrF+sSdDYtOjKR98Yyb4WwRF+zeQxeKRczrl7DR98XxhQwzC6t8pe01qVcgTzGHkw==
Received: from HE1EUR01FT016.eop-EUR01.prod.protection.outlook.com
	(10.152.0.55) by HE1EUR01HT129.eop-EUR01.prod.protection.outlook.com
	(10.152.1.82) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.20.35.14;
	Mon, 18 Sep 2017 07:20:21 +0000
Received: from HE1P18901MB0028.EURP189.PROD.OUTLOOK.COM (10.152.0.52) by
	HE1EUR01FT016.mail.protection.outlook.com (10.152.0.169) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.35.14 via Frontend Transport; Mon, 18 Sep 2017 07:20:20 +0000
Received: from HE1P18901MB0028.EURP189.PROD.OUTLOOK.COM
	([fe80::6073:d3:6b9d:498]) by HE1P18901MB0028.EURP189.PROD.OUTLOOK.COM
	([fe80::6073:d3:6b9d:498%13]) with mapi id 15.20.0056.016;
	Mon, 18 Sep 2017 07:20:21 +0000
From: theUser BL <theuserbl@hotmail.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Will the Google Fuchsia modifications of arm qemu be added?
Thread-Index: AQHTMExp5yq2ZJNwSE+IvqBEeiJLcA==
Date: Mon, 18 Sep 2017 07:20:21 +0000
Message-ID: <HE1P18901MB00282662006060701CFB5A71A9630@HE1P18901MB0028.EURP189.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=hotmail.com; 
x-incomingtopheadermarker: OriginalChecksum:D0AC7D3B5BD3287846027695DC57FAC8A8350E5205B264A9497033CF1B422113;
	UpperCasedChecksum:23A957C90F582A4AEA032F3F0DE1C36E90A583042B9FDE632171430588586B19;
	SizeAsReceived:6919; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [SXJwUcRD1kq066OJLVCZcGd+KrEGlHpO]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1EUR01HT129;
	6:A4zuK4RzXh+ZbGskQUfDwKrv5ZLEuqiyF+6zLU93JSrDe0OmShO8NcKnCZ+IM/E9Ow10Ug4Xb+bMeBuSRx8ep2sy7N297VrLIApQSWN0ThoTrnvgoccr9eoPJG34a5gH0JZeJFHV6VWvWIPABMLGSvCyYBOpDk9twBT/pDm+ZBdNyETEvznEQnjZqDtS9IkzZ886UZKTH4fvbW6RWgxg1NdbU/IOodDNw+S5Atnj0tnRv3qn1YwoLwtcvnPbVHdC5y7eucO/dOfcbOf+C1C768WgkkvHsahMKLONKAUPjhGALW8eRyYG43J6EnzjJIPX6xw3T+DIoqHe2vKyScbHWQ==;
	5:BK27+y+q9QxaSUxUQio7JNjpFhPZTQ3wIo0L2O3CgFWV9a5fiV1SXQPvgQuiveBZvSySNEswRCTpR+FLoSI765j4h7yDaUowgSBWdM62HILRaadgU2lg04IWZBB7j9NZX2l+7rbXRS4U/SfI3bXnFQ==;
	24:kYMMZ8uHLNS0iJYpvWGRfxCfrM/K1UBHcX8YbxLCGpnZe9QTnJNwXzC7MUzZ/cw6Brt2xM8jGkTCdyhIGOB9UbSdWjn4C9Iq9JB2rUsqBRw=;
	7:JeVEv2OmtYNvwC7z9G6VuU10HfYo4JEIDjX62tVlrAT9zlowyFV1YMoOrNJKDhPHJaBdsBEsAAiTq5/mgZ0dBEA0S8xpBBFBzYq8S6ESpubEhDiocxXnfwUdvbx6BGjR7IZdBTyWMuW5vhVSDLyaYcs/n1x+iHB2/jAhE8jTTIHSYbt5HuejeqNX02ZKx7jJ1XCB9qU9iDJJtQIjixxeiBYzgIH13pDttoiB5GV6X68=
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 3fccd41e-6da8-478e-3f17-08d4fe65b8e8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101448)(1601125374)(1701031045)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1EUR01HT129; 
x-ms-traffictypediagnostic: HE1EUR01HT129:
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:HE1EUR01HT129; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1EUR01HT129; 
x-forefront-prvs: 04347F8039
x-forefront-antispam-report: SFV:NSPM; SFS:(7070007)(98901004); DIR:OUT;
	SFP:1901; SCL:1; SRVR:HE1EUR01HT129;
	H:HE1P18901MB0028.EURP189.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2017 07:20:21.2525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT129
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.92.65.83
X-Mailman-Approved-At: Mon, 18 Sep 2017 11:34:44 -0400
Subject: [Qemu-arm] Will the Google Fuchsia modifications of arm qemu be
 added?
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
X-TUID: heyR/2A1KVtg

Google writes a new operating system with a new kernel for it.
The complete operating system is called=A0 "Fuchsia" and the kernel was cal=
led "Magenta" and later renamed to "Zircon".
Here an litte overview of it:
https://fuchsia.miraheze.org/wiki/Main_Page

The Magenta/Zircon part includes not only the kernel, it have additional pa=
rts (like the GNU-tools of GNU/Linux).

To build Magenta/Zircon this page describes it:
https://fuchsia.googlesource.com/magenta/+/HEAD/docs/getting_started.md
The easiest way to run Magenta/Zircon in an virtual machine, is to installi=
ng the toolchain, which includes qemu
https://fuchsia.googlesource.com/magenta/+/HEAD/docs/qemu.md

Magenta/Zircon existing as x86_64 and arm64 versions.
Two qemus are in the toolchain: qemu-system-x86_64 and qemu-system-aarch64.
The first one is also an modified version of qemu, but I don't see any diff=
erence to the original qemu.
But the last one (aarch64) is really needed, to run the arm-version. The or=
iginal qemu can't run the ARM64 Magenta/Zircon.

So, do you know, what changes they have done? And will they later be added =
to the original qemu?

Here is the source of the modified qemu:
https://fuchsia.googlesource.com/third_party/qemu/+/master
https://github.com/fuchsia-mirror/third_party-qemu

Greetings
theuserbl=
