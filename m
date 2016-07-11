Received: by 10.25.21.156 with SMTP id 28csp1632lfv;
        Mon, 11 Jul 2016 11:49:27 -0700 (PDT)
X-Received: by 10.200.43.236 with SMTP id n41mr31702065qtn.52.1468262967006;
        Mon, 11 Jul 2016 11:49:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f28si2650236qte.34.2016.07.11.11.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 11:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:35557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMgGk-0002pD-Co
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 14:49:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMgFU-0001xy-5M
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bMgFQ-0001Rc-M8
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:48:08 -0400
Received: from forward4j.cmail.yandex.net ([5.255.227.22]:55047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bMgFP-0001Ph-6F; Mon, 11 Jul 2016 14:48:04 -0400
Received: from mxback1j.mail.yandex.net (mxback1j.mail.yandex.net
	[5.45.198.15])
	by forward4j.cmail.yandex.net (Yandex) with ESMTP id 6533220795;
	Mon, 11 Jul 2016 21:47:48 +0300 (MSK)
Received: from web26j.yandex.ru (web26j.yandex.ru [5.45.198.67])
	by mxback1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	h4GRXhzRjz-lm70b01G; Mon, 11 Jul 2016 21:47:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1468262868; bh=X/F2ZbVqjVaLZD2RwC1xP0iJngqrcCDqqLHDsNjLBs8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
	b=nRFqbixO25KR3M+i3p2hfJ3MeIRUh6HuooNZ01VTcC58ikxGwXTZ3ZI2tbInp3m0C
	4KDMNCZ8vBYcrN4JyiOjZ5yazkp94ouX8C6RS4wPiTGyF9b9yfDAHX/vNUFPhxqKQ2
	EfXUQDh5sL5XrhCp4DSWBF5nhqRpCzCKv11ScDXU=
Authentication-Results: mxback1j.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web26j.yandex.ru with HTTP;
	Mon, 11 Jul 2016 21:47:47 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_Lq-8s7wx4bu+t6MJxXau5aoo6B2QJPGXJ=VWtztHNjw@mail.gmail.com>
References: <1466694717-556963-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8mTv4LJh2WO5chuga+ZqAEWkzTeoTn8M4t+K5LGGnhNQ@mail.gmail.com>
	<458161468261386@web2h.yandex.ru>
	<CAFEAcA_Lq-8s7wx4bu+t6MJxXau5aoo6B2QJPGXJ=VWtztHNjw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <485821468262867@web26j.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 11 Jul 2016 21:47:47 +0300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.22
Subject: Re: [Qemu-arm] [PATCH] target-arm: Add missed AArch32 TLBI sytem
 registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qEkgyosYcL6b



11.07.2016, 21:36, "Peter Maydell" <peter.maydell@linaro.org>:
> On 11 July 2016 at 19:23, Sergey Sorokin <afarallax@yandex.ru> wrote:
>> =C2=A011.07.2016, 20:39, "Peter Maydell" <peter.maydell@linaro.org>:
>>>> =C2=A0=C2=A0+
>>>> =C2=A0=C2=A0+ CPU_FOREACH(other_cs) {
>>>> =C2=A0=C2=A0+ tlb_flush_page_by_mmuidx(other_cs, pageaddr, ARMMMUIdx=
_S1E2, -1);
>>>> =C2=A0=C2=A0+ }
>>>> =C2=A0=C2=A0+}
>>>> =C2=A0=C2=A0+
>>>> =C2=A0=C2=A0=C2=A0static const ARMCPRegInfo cp_reginfo[] =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Define the secure and n=
on-secure FCSE identifier CP registers
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* separately because=
 there is no secure bank in V8 (no _EL3). This allows
>>>> =C2=A0=C2=A0@@ -1238,6 +1343,14 @@ static const ARMCPRegInfo v7_cp_r=
eginfo[] =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D ARM_=
CP_NO_RAW, .access =3D PL1_W, .writefn =3D tlbiasid_write },
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .name =3D "TLBIMVAA", .c=
p =3D 15, .opc1 =3D 0, .crn =3D 8, .crm =3D 7, .opc2 =3D 3,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D ARM_=
CP_NO_RAW, .access =3D PL1_W, .writefn =3D tlbimvaa_write },
>>>> =C2=A0=C2=A0+ { .name =3D "TLBIALLNSNH",
>>>> =C2=A0=C2=A0+ .cp =3D 15, .opc1 =3D 4, .crn =3D 8, .crm =3D 7, .opc2=
 =3D 4,
>>>> =C2=A0=C2=A0+ .type =3D ARM_CP_NO_RAW, .access =3D PL2_W,
>>>> =C2=A0=C2=A0+ .writefn =3D tlbiall_nsnh_write },
>>>> =C2=A0=C2=A0+ { .name =3D "TLBIALLNSNHIS",
>>>> =C2=A0=C2=A0+ .cp =3D 15, .opc1 =3D 4, .crn =3D 8, .crm =3D 3, .opc2=
 =3D 4,
>>>> =C2=A0=C2=A0+ .type =3D ARM_CP_NO_RAW, .access =3D PL2_W,
>>>> =C2=A0=C2=A0+ .writefn =3D tlbiall_nsnh_is_write },
>>>
>>> =C2=A0These don't exist on v7 unless the virtualization extensions ar=
e present
>>> =C2=A0(though they do exist on v8 without EL3).
>>
>> =C2=A0So I should check arm_feature(env, ARM_FEATURE_EL2) to add these=
 registers,
>> =C2=A0e.g. by moving them to el2_cp_reginfo, right?
>
> That would make them incorrectly not exist for v8-without-EL3, I think.
> If there isn't a suitable reginfo array for this case, you might need
> to either list them in two arrays or add a new array.
>
> thanks
> -- PMM

Table G4-25 Effect of the TLB maintenance instructions says:
b. Available only in an implementation that includes EL2.

So seems they should be in el2_cp_reginfo which is exist regardless EL3 e=
nabled.
And also I need to fix tlbiall_nsnh_[is_]write functions accordingly.
