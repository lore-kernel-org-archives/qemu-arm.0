Received: by 10.25.21.156 with SMTP id 28csp1599695lfv;
        Mon, 11 Jul 2016 11:24:59 -0700 (PDT)
X-Received: by 10.200.37.252 with SMTP id f57mr6171601qtf.68.1468261498942;
        Mon, 11 Jul 2016 11:24:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f124si2806780qkd.239.2016.07.11.11.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 11:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:35451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMft4-0000jj-Ch
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 14:24:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMfrj-00007w-EZ
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 14:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMfrg-0005Ft-Cl
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 14:23:33 -0400
Received: from forward4h.cmail.yandex.net ([87.250.230.19]:49570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bMfrW-0005Ed-D0; Mon, 11 Jul 2016 14:23:23 -0400
Received: from mxback5h.mail.yandex.net (mxback5h.mail.yandex.net
	[84.201.187.142])
	by forward4h.cmail.yandex.net (Yandex) with ESMTP id C1A0D20C1B;
	Mon, 11 Jul 2016 21:23:06 +0300 (MSK)
Received: from web2h.yandex.ru (web2h.yandex.ru [84.201.186.31])
	by mxback5h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	JYnrEweYMl-N6fGmeiD; Mon, 11 Jul 2016 21:23:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1468261386; bh=cobxCwCgZjhZa0XpS/Bn9h4tujEC5ypfXXwhD/87UaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
	b=WWenVryvDlwmV19Z+Y8fz4A13+7XFwkHj7GgGm1rfCPEszhQwARXdxDj8gpKtIlS0
	lS+scSNHn0E/9K3y4priJv+Dsq14QnHUUa3GFN5x1m9QSuAb67Jy9UHtgEn15EYstS
	1u+O4J0GMPNdu8NJKRJ4Kmep90vgRj5Bgsd6C2rs=
Authentication-Results: mxback5h.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web2h.yandex.ru with HTTP;
	Mon, 11 Jul 2016 21:23:06 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8mTv4LJh2WO5chuga+ZqAEWkzTeoTn8M4t+K5LGGnhNQ@mail.gmail.com>
References: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8mTv4LJh2WO5chuga+ZqAEWkzTeoTn8M4t+K5LGGnhNQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <458161468261386@web2h.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 11 Jul 2016 21:23:06 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.19
Subject: Re: [Qemu-devel] [PATCH] target-arm: Add missed AArch32 TLBI sytem
 registers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hnwjks0+BVy8

11.07.2016, 20:39, "Peter Maydell" <peter.maydell@linaro.org>:
>> =C2=A0+
>> =C2=A0+ CPU_FOREACH(other_cs) {
>> =C2=A0+ tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx_S1E2, -=
1);
>> =C2=A0+ }
>> =C2=A0+}
>> =C2=A0+
>> =C2=A0=C2=A0static const ARMCPRegInfo cp_reginfo[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Define the secure and non-secur=
e FCSE identifier CP registers
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* separately because there i=
s no secure bank in V8 (no _EL3). This allows
>> =C2=A0@@ -1238,6 +1343,14 @@ static const ARMCPRegInfo v7_cp_reginfo[]=
 =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D ARM_CP_NO_RA=
W, .access =3D PL1_W, .writefn =3D tlbiasid_write },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .name =3D "TLBIMVAA", .cp =3D 15=
, .opc1 =3D 0, .crn =3D 8, .crm =3D 7, .opc2 =3D 3,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D ARM_CP_NO_RA=
W, .access =3D PL1_W, .writefn =3D tlbimvaa_write },
>> =C2=A0+ { .name =3D "TLBIALLNSNH",
>> =C2=A0+ .cp =3D 15, .opc1 =3D 4, .crn =3D 8, .crm =3D 7, .opc2 =3D 4,
>> =C2=A0+ .type =3D ARM_CP_NO_RAW, .access =3D PL2_W,
>> =C2=A0+ .writefn =3D tlbiall_nsnh_write },
>> =C2=A0+ { .name =3D "TLBIALLNSNHIS",
>> =C2=A0+ .cp =3D 15, .opc1 =3D 4, .crn =3D 8, .crm =3D 3, .opc2 =3D 4,
>> =C2=A0+ .type =3D ARM_CP_NO_RAW, .access =3D PL2_W,
>> =C2=A0+ .writefn =3D tlbiall_nsnh_is_write },
>
> These don't exist on v7 unless the virtualization extensions are presen=
t
> (though they do exist on v8 without EL3).

So I should check arm_feature(env, ARM_FEATURE_EL2) to add these register=
s,
e.g. by moving them to el2_cp_reginfo, right?

