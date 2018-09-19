Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp284728wrd;
        Tue, 18 Sep 2018 23:27:52 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY7ExMOqSorQz7W+vP2WRTogPwWKkICBzYZLXOW4bKqt1wLFkixJYroN4FRlUQGBT8vjd7a
X-Received: by 2002:ac8:5191:: with SMTP id c17-v6mr23626781qtn.35.1537338472395;
        Tue, 18 Sep 2018 23:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537338472; cv=none;
        d=google.com; s=arc-20160816;
        b=lU7LHvXnmoiMQ2FAfaUgZTHXoKssXByXgH4leiyLMANbbhUdyDsZXhy3qNyuEWAA5e
         FG+kTu3yEu3gGDUGV1NE6qm6nK0hVBpZaVtEmQqlJz+0fPIcyVDDKRZrrYo9WvLUvav1
         jp8qCnmp+/+kEFmtS463cjPRsD+UAyS9FxD2Gzx4jK+6phQDMxg6DRgMGV+iSVTMtoU5
         Ri2EgV1DVvuOGowZu9fhpkP1MS63eKE8ZydufFvBCSdkSsw7Uf/GPb/+KzSxVXwpK5pJ
         pht5zJsxPZy3toT9sRDFkTpkxjiKNYmSA6JmpFttaow8JWf/rRUazOdMki+o8/M0bT/r
         TYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Fpv1soa/pTE7XanQOqZGtBvDTK33gqg3pcxnwnuKpu4=;
        b=FkimXxFLyLF+APyIRnz6gEy1oXQzRnzxnz2mwAEm0SKPbTFzdqdsXF4CQQO3YaT7L8
         H4kmiaESygqEXSkxJ+O184Zs8Nq3FHYDhvSaELoPRRKcshgx6lkA7Ffnn1UO0WIBKneg
         ALiK9oCYkXQrRBewXCAMvC4vH0JyfLymRaovV7NxYIaRTWPHAUmT2xKUoq7GGaLTaAv8
         QOkIlIWhoRZgWuDYWIHPC/y3z8jQbGkfydXiAJG5XVPHEf9Lld2fzV9BGbXmJ1NRWkJ5
         mgsj8wRPO6nhtCQiUHJxs/EtOQEi0uXZJ1XFWWwQafBe4JwRat134OpDtT/oPcXfzcbu
         /hfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si1248338qka.105.2018.09.18.23.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Sep 2018 23:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2Vxn-0005f9-Jg
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 02:27:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2VxZ-0005ey-JX
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 02:27:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2VxU-0008Tw-HC
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 02:27:37 -0400
Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]:42014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g2VxU-0008Lm-AT
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 02:27:32 -0400
Received: from player697.ha.ovh.net (unknown [10.109.159.222])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 9A5FF1553D8
	for <qemu-arm@nongnu.org>; Wed, 19 Sep 2018 08:27:22 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id EABCA480099;
	Wed, 19 Sep 2018 08:27:10 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-8-clg@kaod.org>
	<CAFEAcA-_p2uCFXfJCQFLBjvUuh_HWvuLFRGMTQvP5=g3XZu3Mw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2e811541-a249-538e-df9e-ac8b1bf2c247@kaod.org>
Date: Wed, 19 Sep 2018 08:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_p2uCFXfJCQFLBjvUuh_HWvuLFRGMTQvP5=g3XZu3Mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17026421344010341202
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrkeejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.165.38
Subject: Re: [Qemu-arm] [PATCH 07/11] aspeed/smc: add a 'sdram_base' and
 'max-ram-size' properties
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
X-TUID: 7zvOX/Gel//2

On 09/18/2018 08:47 PM, Peter Maydell wrote:
> On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> The setting of the DRAM address of the DMA transaction depends on the
>> DRAM base address and the maximun DRAM size of the SoC. Let's add a
>> couple of properties to give this information to the SMC controller
>> model.
>=20
> In hardware, does the SMC controller really know the base address
> of DRAM,
Here is the definition of the DMA DRAM Side Address register

On the AST2500 :=20
=09
	31:30    reserved 0x2
	29:2     DRAM side start address. Only 4 bytes boundary.
		 The valid range is 0x80000000-0xBFFFFFFF
	1:0      reserved

On the AST2400 :

	31:29    reserved 0x2
	28:2     DRAM side start address. Only 4 bytes boundary.=20
	         The valid range is 0x40000000-0x5FFFFFFF
	1:0      reserved

The DRAM address ranges are hardwired to fit the DRAM base address=20
of the SoC and its maximum size, depending on the revision. Same=20
for the flash address. The value just wraps around when the maximum=20
is reached.=20

> or is it actually emitting transactions that the bus fabric in=20
> the SoC sends to the right place?=20

The address is limited by the register definition before sending the=20
transaction AFAICT.=20

> That is, would
> it be more accurate to model it by passing the SMC controller a
> MemoryRegion to use for emitting DMA transactions which was an
> alias into the right part of the address space ?

I think you already proposed that a while ago. That would mean adding=20
an address space and a memory region acting as a translating proxy.=20

OK. I will look into it.

Thanks,

C.=20



