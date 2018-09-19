Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp484040wrd;
        Wed, 19 Sep 2018 03:19:42 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYri+w8+tfnr5HJPlXUYFs1ZvGPE1ttNKU57dcnDP2w3Rn72t3NC0JwpnSCT9E2J13M662d
X-Received: by 2002:a37:5ac2:: with SMTP id o185-v6mr23616890qkb.115.1537352382286;
        Wed, 19 Sep 2018 03:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537352382; cv=none;
        d=google.com; s=arc-20160816;
        b=t+fdrcR2Kh4+HO8NAw3Uyky1P4K9q2n5maYn+LwutqGSCywPzTLEfGncJpIS7D0gYC
         e7THC60BRh3m0Iody24kbQA+/pLDd5JjkgwnMvHCzaLpfJBdUpxoR+DiTcMmco/WV9ds
         jVV/GrjaXjtshRKCL9mvM3jR8fgB2Ncd14JW8gIto3yadZpPy7+m+figtTLzQcDc/prM
         XGP0FhnK+pOFC08MCvivUG4XOLuKbCCm/bdnRvxkQY2/D29h9+YzRAU0bX1giDhWHIR+
         FYdP/O56LvQ5iFPU/lJyaG/W2iGNch0nrQT7JzyH6kk++vyVp6gU7OVQYVV9Sd/pAVAQ
         +aTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=M7xTkofrWfibI4Qo7+ArdEa5IRlcbTl6zseTOOV0REE=;
        b=qmQK46jKGZ42je/L9w6RPgIMJO9wKn0hHFJwkb2Mrpjqb6Kk9ImdlUE3CBL62lkBtK
         WhiYce3bNA7OL+2ke/WIdTHBcr7+fNPHKytSYTHdMaZcSuESIctt9CGjsfVJx+7iknak
         7mwsTNon4a6Qhv4/+KjritmimIQieEZvvXRxaH3Mj7c7N2ytkntHDmkRXBl6aE4qFqPw
         06d2Uu9yMcdO8heTR38Ec3jXQKNrIWZ1p3pe2mNBoHFGh6AMt1cGuBKRRXQQXwMjwzDI
         3CQvgcz2OCfrxM/R7uC9Ac6UrviBM+AKjpOrsJOJX3Femz/DOkH2ABO9KPx/ZuE/ykLN
         VXQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189-v6si5162040qkc.266.2018.09.19.03.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 03:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2Za9-0003rc-RA
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 06:19:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2Za0-0003qr-I8
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 06:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2ZZw-0001NG-A6
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 06:19:32 -0400
Received: from 2.mo68.mail-out.ovh.net ([46.105.52.162]:55660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g2ZZw-0000Vd-12
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 06:19:28 -0400
Received: from player756.ha.ovh.net (unknown [10.109.146.240])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 6CDEDF80E2
	for <qemu-arm@nongnu.org>; Wed, 19 Sep 2018 12:19:19 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player756.ha.ovh.net (Postfix) with ESMTPSA id 554D712009E;
	Wed, 19 Sep 2018 12:19:10 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-5-clg@kaod.org>
	<CAFEAcA-C05P6dBwSr1QBJX9-B+QCy3LCvqKM+uZnx5NP-7BU6g@mail.gmail.com>
	<ce8fb63b-50d8-2d05-67a1-c89bb2e06e9a@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2d4a3e71-89d4-ccb0-59e1-a61503569667@kaod.org>
Date: Wed, 19 Sep 2018 12:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ce8fb63b-50d8-2d05-67a1-c89bb2e06e9a@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2496964522048654162
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrkeekgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.52.162
Subject: Re: [Qemu-arm] [PATCH 04/11] hw/arm/aspeed: add a 'mmio-exec'
 property to boot from the FMC flash module
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rdCjfZP7Z2u0

On 09/19/2018 08:51 AM, C=C3=A9dric Le Goater wrote:
> On 09/18/2018 08:44 PM, Peter Maydell wrote:
>> On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>>> Now that MMIO execution is supported, introduce a 'mmio-exec' propert=
y
>>> to boot directly from CE0 of the FMC controller using a memory region
>>> alias.
>>
>> The name of this property seems to be a reference to QEMU's
>> internals: is there some other name that would make more sense
>> to a user who cares more about the guest and the emulated hardware?
>=20
> It is true that the user does not care about internals.=20
>=20
> "execute-from-flash" as you proposed below ?=20
>=20
>>> The overhead for the current firmware images using a custom U-Boot is
>>> around 2 seconds, which is fine, but with a U-Boot from mainline, it
>>> takes an extra 50 seconds or so to reach Linux. This might be related
>>> to the fact that a device tree is used.
>>
>> Is this overhead just because we do a lot of execution from the
>> mmio region and that's slower than execution from RAM ?
>=20
> That is what it seems but I haven't dug further the problem. The mainli=
ne=20
> U-Boot also has a rewritten DRAM calibration.
>=20
> Using the logs is too painful so I would need to add some statistics on=
=20
> what is being done. May be number of read/write ops on the flash model=20
> that we could dump from the monitor, or some more low-level figures of=20
> QEMU internals.=20

These are the number of read operations done on the flash memory region :
=20
    922478 ~ 3.5 MBytes   OpenBMC U-Boot
  20569977 ~ 80  MBytes   Mainline U-Boot=20


So we are trashing the TBs I would say. Is there a way to increase the=20
TB size ? or some other TB parameter ? Is that directly linked to the=20
instruction cache size ?=20

I am no expert of that area of QEMU but willing to experiment.

Thanks,

C.=20

>>> MMIO execution is not activated by default because until boot time is
>>> improved.
>>
>> Can the guest tell the difference? I'm wondering how much we
>> might need to care about backward compatibility if in future
>> we fix the performance problem, or if we can just switch the
>> default to execute-from-flash without breaking guests.
>=20
> Yes that is a good a point. When performance is fixed, we should remove=
=20
> the ROM region and the machine option. What I am proposing is a more of=
=20
> a work around to analyze a problem than something we would keep in the=20
> future.
>=20
> Thanks,
>=20
> C.
>=20

