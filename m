Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2560827wrd;
        Mon, 24 Sep 2018 07:00:04 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYMjjZQh66p+nUOygdeST5Q0F5XZzBEOPz10MTrqFDTFk55EPIneAGTYky0YG0o0cOq79xf
X-Received: by 2002:ac8:435b:: with SMTP id a27-v6mr2216686qtn.295.1537797604552;
        Mon, 24 Sep 2018 07:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537797604; cv=none;
        d=google.com; s=arc-20160816;
        b=Ltufo++9PQP+bU6RRGRkrav6BRXYDtln/3hTZqxMsu1Jde7WqG+vIaOBpJnfEZpULl
         BXWzmT9Dzz+UO2FdGtQTbz/HnqdfIPlJQux/Rx6JUj9XHpIkSj1xcn5AlXBukAA0ng4A
         7ZTmhwn4z2FFG8kuuyxeeqgd6ug+lsZ0M7ePntgUFy96bcf82ijbSaM6IyvINHP39wil
         Cq9wqS1kPM+U+e8OKue9oI/ym6A1sGihiKpepHcSezegQ8ef5KBB9FG9wyI0/PEsa7Ew
         hYpdkPx99+fPNOedl4Wau+EB9pIm0XjK2rjhL7wOKXWXsHWMUnVEd0ZwFHCLBUkuGtJD
         NT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=tlgnwJ4MTs3JBYoJdSAP7IiOTBcYkaioqo4Al1SIz58=;
        b=EJYBC+AvCc6MYG5AUUd3MVDQ2XQVHiJFnimAMYu1oTMwFR120A9a+2NelWga/RzK/T
         VcuQAkYEBxUpfEWnZPwrFhz/0V4ao/MoD9x64ed/MHUTIASCrHHt2hD3e14gofDu9zQ1
         /EbQEWP1Mikw7B8FO6fLFdSz7AY8mla+sDaWR6+QL8pUzGDvNl2uvnWF2fJ8ncyDQTPs
         aQMVcPXbmTJ5TDmu2Bp0QXPIQIJ3L+HKtLm0GqJrbl+dAR49B0lS/i3285uIluAvpPIU
         24mibTNyRDEDJuKdGfFGr0fTuzeZ4rqakroaKR1sJtkZjc3rgP51JwcoK+V3d6fmz5XT
         /DPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9-v6si5223597qtk.133.2018.09.24.07.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Sep 2018 07:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4RPA-00045G-3K
	for alex.bennee@linaro.org; Mon, 24 Sep 2018 10:00:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4ROo-00043d-1n
	for qemu-devel@nongnu.org; Mon, 24 Sep 2018 09:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4ROj-0006D0-1i
	for qemu-devel@nongnu.org; Mon, 24 Sep 2018 09:59:41 -0400
Received: from 14.mo3.mail-out.ovh.net ([188.165.43.98]:46013)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g4ROi-0006CX-RS
	for qemu-devel@nongnu.org; Mon, 24 Sep 2018 09:59:36 -0400
Received: from player786.ha.ovh.net (unknown [10.109.159.224])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id A3E471D69F2
	for <qemu-devel@nongnu.org>; Mon, 24 Sep 2018 15:59:35 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id AC79C38008E;
	Mon, 24 Sep 2018 15:59:26 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-5-clg@kaod.org>
	<CAFEAcA-C05P6dBwSr1QBJX9-B+QCy3LCvqKM+uZnx5NP-7BU6g@mail.gmail.com>
	<ce8fb63b-50d8-2d05-67a1-c89bb2e06e9a@kaod.org>
	<2d4a3e71-89d4-ccb0-59e1-a61503569667@kaod.org>
	<CAFEAcA_LsjvJGi8v1Wo0g9GfTFVVo8mzy_WcdkcHb=duwHQ9OA@mail.gmail.com>
	<9cac65c1-5e5f-ccf7-072f-c8a0ac5c024e@kaod.org>
	<CAFEAcA-0ik-TxyNpFp9-pfYGhnz7sjRH9ykY6ytQ2h16QjMEbQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <67189600-ca8a-d4c7-28fd-472639523130@kaod.org>
Date: Mon, 24 Sep 2018 15:59:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-0ik-TxyNpFp9-pfYGhnz7sjRH9ykY6ytQ2h16QjMEbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17133663311195835218
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrleekgdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.43.98
Subject: Re: [Qemu-devel] [PATCH 04/11] hw/arm/aspeed: add a 'mmio-exec'
 property to boot from the FMC flash module
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gi+7Kkf7Fxs0

On 09/24/2018 03:31 PM, Peter Maydell wrote:
> On 24 September 2018 at 14:28, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> On 09/24/2018 01:41 PM, Peter Maydell wrote:
>>> On 19 September 2018 at 11:19, C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
>>>> These are the number of read operations done on the flash memory reg=
ion :
>>>>
>>>>     922478 ~ 3.5 MBytes   OpenBMC U-Boot
>>>>   20569977 ~ 80  MBytes   Mainline U-Boot
>>>>
>>>>
>>>> So we are trashing the TBs I would say. Is there a way to increase t=
he
>>>> TB size ? or some other TB parameter ? Is that directly linked to th=
e
>>>> instruction cache size ?
>>>
>>> Well, execution direct from MMIO means we read each instruction
>>> as we execute it -- there's no caching of TBs. (We generate a
>>> temporary TB with a single insn and throw it away after executing
>>> from it.) This is because we can't be sure that we would get the
>>> same data value the next time we read from the address.
>>
>> In our case, we should have the same data. So may be I can introduce
>> a read-only region with a cache to speed up the accesses. A bit like
>> this was done with the previous mmio inteface.
>=20
> Yes, this is in theory possible, but we dropped the old
> mmio-exec interface because it had some nasty race conditions:
> the problem is being able to be sure you've properly dropped
> the cached TBs when the device contents change.
>=20
> Which flash device is this? For pflash typically the 'romd mode'
> stuff suffices to allow execution as-if-from-ram most of the time.

It's a SPI slave flash device attached to the Aspeed SMC controller.

It works very well with in a 'romd mode'. I am just stressing a bit=20
more the model with MMIO execution but it's not something we really
need. So we can just drop this patch in the v2 patchset "aspeed: misc=20
fixes and enhancements (SMC)" in which I fixed a few other things.

Thanks,

C.

