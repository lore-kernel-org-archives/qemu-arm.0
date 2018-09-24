Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2529889wrd;
        Mon, 24 Sep 2018 06:28:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63o+KGMGzzhsAjtPWxXi0EzSZrWtUpy6KPhL1Uwzo6Waeu8sKI1/jCRt9+ptT8tMdvka2i2
X-Received: by 2002:a0c:aac9:: with SMTP id g9-v6mr7649732qvb.78.1537795737672;
        Mon, 24 Sep 2018 06:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537795737; cv=none;
        d=google.com; s=arc-20160816;
        b=RX8SuiPLKbyIbP3ZwjT4Ln4ghHEcw4tVaAgOOsyAHECevDkJErn+5LNTD/7oU1x/jG
         0S99T6T+55UW0kVhgVoD7qRfnVd5dGbaTjQKbdl6mPNk4pyzV3pGQONKcO0NH7uenuyq
         4FMTpMtFnc1EjBNyiv1pR46oXa/2w2VnW/j0dm38VqUpAHp8gflS1A2aHiR1oKBcDe6P
         TMVAjoipp4A7BTk+a1rIgCf+mj0swILMa6CchY5QYgt21uXwQG0NsoXneSiLw2hDUpjY
         DmGdYShuWftjS7MgFtq/79vmb8doV84YI8uVI9GjO0NToYm0HqYXCEGeqb5UGaZ0zuOD
         nhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=0LMFwgi0JkJFBLujobpI84cgayLq5tITEbS4CRtbrSA=;
        b=sR4f9OYA2v+j21m3Egz2v6nAzoT7e4Vvezkz3WQLorLEdKaPuNdP0UFrTtlJfJuYs+
         FSDmk8Z4lVUAi7Qyh+I0pV52mwLT6EA7OVJgGSm1hoyZV8CoZU78QoxftMGJX3/pbg+F
         8uQz3/4sGFVoU/c8ninEmZnDLFzYpn15pcRCj6NH7IexdILxWDH2UMYPMmQXtKPIVjha
         ePh/sbiqWPU5zrLZPfBftqMNdMFEhnc6zwXSGHKVOPB4+5S2eoCLtVHNfD4I3wzEHuI4
         uqZHfnBlADntzIEvuWSu/gXywleS6YSFWXRro8fAkI5p1ONkayOcZZPayOY+qEw36ziC
         3m2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d75-v6si4760375qkj.254.2018.09.24.06.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Sep 2018 06:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4Qv3-0006PA-1q
	for alex.bennee@linaro.org; Mon, 24 Sep 2018 09:28:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4Qur-0006O4-MI
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 09:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4Qup-0005xn-1F
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 09:28:45 -0400
Received: from 8.mo4.mail-out.ovh.net ([188.165.33.112]:43924)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g4Quo-0005uV-Ql
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 09:28:42 -0400
Received: from player688.ha.ovh.net (unknown [10.109.143.145])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 881F71B2AAE
	for <qemu-arm@nongnu.org>; Mon, 24 Sep 2018 15:28:34 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player688.ha.ovh.net (Postfix) with ESMTPSA id B7ABA200B2;
	Mon, 24 Sep 2018 15:28:22 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-5-clg@kaod.org>
	<CAFEAcA-C05P6dBwSr1QBJX9-B+QCy3LCvqKM+uZnx5NP-7BU6g@mail.gmail.com>
	<ce8fb63b-50d8-2d05-67a1-c89bb2e06e9a@kaod.org>
	<2d4a3e71-89d4-ccb0-59e1-a61503569667@kaod.org>
	<CAFEAcA_LsjvJGi8v1Wo0g9GfTFVVo8mzy_WcdkcHb=duwHQ9OA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9cac65c1-5e5f-ccf7-072f-c8a0ac5c024e@kaod.org>
Date: Mon, 24 Sep 2018 15:28:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_LsjvJGi8v1Wo0g9GfTFVVo8mzy_WcdkcHb=duwHQ9OA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 16609838376950074194
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrleekgdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.33.112
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
X-TUID: i1pVVSP5uKCc

On 09/24/2018 01:41 PM, Peter Maydell wrote:
> On 19 September 2018 at 11:19, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> These are the number of read operations done on the flash memory regio=
n :
>>
>>     922478 ~ 3.5 MBytes   OpenBMC U-Boot
>>   20569977 ~ 80  MBytes   Mainline U-Boot
>>
>>
>> So we are trashing the TBs I would say. Is there a way to increase the
>> TB size ? or some other TB parameter ? Is that directly linked to the
>> instruction cache size ?
>=20
> Well, execution direct from MMIO means we read each instruction
> as we execute it -- there's no caching of TBs. (We generate a
> temporary TB with a single insn and throw it away after executing
> from it.) This is because we can't be sure that we would get the
> same data value the next time we read from the address.

In our case, we should have the same data. So may be I can introduce=20
a read-only region with a cache to speed up the accesses. A bit like=20
this was done with the previous mmio inteface.

> So we definitely expect things to go slower -- I'm just a little
> surprised that we spend so much time executing from flash devices
> that aren't in "romd" mode.

Yes. it is very slow but some instructions are loaded more than=20
250.000 times. See below.

Thanks,

C.





count   address
    ... ...
 149113 0x28a18
 149113 0x28a1c
 149113 0x28a20
 149113 0x28a24
 149113 0x28a28
 149113 0x28a2c
 149113 0x28a30
 149113 0x28a34
 149113 0x28a38
 149113 0x28a3c
 149113 0x28a40
 253584 0x288b4
 253584 0x288bc
 253584 0x288c0
 253584 0x288c8
 253584 0x288cc
 253584 0x288d4
 253584 0x288e0
 253584 0x288e4
 253584 0x288f0
 253584 0x288f4
 253584 0x288fc
 253584 0x28904
 253584 0x28908
 253584 0x28910
 253584 0x28914
 253584 0x28920
 253584 0x28924
 253584 0x28928
 253584 0x2892c
 253584 0x28934
 253584 0x28938
 253584 0x2893c
 253584 0x28940
 253584 0x28944
 253584 0x2894c
 253584 0x28954
 253584 0x28958
 253584 0x2895c
 253584 0x28960
 253584 0x28964
 253584 0x28968
 253584 0x2896c
 253584 0x28970
 253584 0x28974
 253584 0x28978
 253584 0x2897c
 253584 0x28980
 253584 0x53364
 253585 0x288b8
 253585 0x288c4
 253585 0x288d0
 253585 0x288d8
 253585 0x288dc
 253585 0x288f8
 253585 0x28900
 253585 0x2890c
 253585 0x28918
 253585 0x2891c
 253585 0x28948
 253585 0x53344
 253586 0x28930
 253586 0x28950
 253587 0x288b0
 257497 0x53348
 277523 0x53354
