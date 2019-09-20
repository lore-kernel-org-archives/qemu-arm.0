Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2539262wrp;
        Fri, 20 Sep 2019 08:15:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkFOB8UkduAoEe7DDag52pFB3hTWOjPmnvrEyS4tCuMTvmtMYilYJAX8ReuLzPFen7XFUk
X-Received: by 2002:a0c:9352:: with SMTP id e18mr13193683qve.33.1568992556753;
        Fri, 20 Sep 2019 08:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568992556; cv=none;
        d=google.com; s=arc-20160816;
        b=ByL7UZ/WPy9bd0H+S5TgEjUNdh7zafFtcwNn1PBoJ6shGIrcPj74HWTzbAmE4COfRN
         Vs6gEQtnjl7oFdV2gRsOwtcLRhOWG5VMlLwFSpvm3ThzTK1RH/qtM23L95Nyu0x/KGo4
         SRaKnYqISd5HkbIgjuRMCugFjEOdVQyFVl6LKxYJkFVfMd5b5PstOWoRCoKT0dJnZ4Mk
         A+6jiHBNC+h5tf7sMEBiK4TjaS+Nnhg5BIrcGaKh7mSDKs9ynKykdEy17RNWVQpA0QGG
         lVSMcHquBKooK7fdYt66lBz+E80cPkM5vwWupDmS34acRYP/IHWDEWBtYq7l/RT3PWUU
         iHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=9k9g0vLusd/60SLWwPdP83OdD1hE2CaqK8GlB7q7Xms=;
        b=yaAKyZumPWUyOSdEB6B+gynmB950dH8bRJqSz3Ku3l8bIjY3Er12U2wMB/ke08NkZs
         cGRRnzGtllThHDJm0wVShFk9NEaR34jJqG7Yp6/9cykh4rplV/UHti+aVJQP5Wse8BLa
         x/GN/xUIGZT5cK0c2GpuZx9SocesrOqOFDOvYG23Bd1d7zk3ex1Wcj0wLHR4qqKC+gHv
         NtElzW+M2qDB1s0/UbQeaTQW/CUl0gYkj2gwMpfUfyKXMuAUV/YgPqI4rxsNHQuLo8Z8
         /9c5rrPW5wz1jN73y/ZDrLET3oGBTnkeN1u+m8mlpnwTovYNwT2tkJbUwybhGVIxN0dq
         qyaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z197si2275033qka.373.2019.09.20.08.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 08:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBKdY-0008ID-4n
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 11:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iBKdL-0008HS-DL
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:15:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iBKdJ-0008Pp-8s
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:15:43 -0400
Received: from 11.mo4.mail-out.ovh.net ([46.105.34.195]:48962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iBKdH-0008Nr-Dw
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:15:41 -0400
Received: from player158.ha.ovh.net (unknown [10.108.54.67])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 5FC99205329
 for <qemu-arm@nongnu.org>; Fri, 20 Sep 2019 17:15:36 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id 483EC9F38821;
 Fri, 20 Sep 2019 15:15:31 +0000 (UTC)
Subject: Re: [PATCH 03/21] hw: aspeed_scu: Add AST2600 support
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-4-clg@kaod.org>
 <139c3f7e-465e-4efb-b6c7-213dcd2ec6b7@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2a267d68-2463-ae0d-00d0-d9a33ba845b2@kaod.org>
Date: Fri, 20 Sep 2019 17:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <139c3f7e-465e-4efb-b6c7-213dcd2ec6b7@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17084123714722892755
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddvgdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.34.195
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BKQ8rsGjbDoJ

On 20/09/2019 06:10, Andrew Jeffery wrote:
>=20
>=20
> On Thu, 19 Sep 2019, at 15:19, C=C3=A9dric Le Goater wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> The SCU controller on the AST2600 SoC has extra registers. Increase
>> the number of regs of the model and introduce a new field in the class
>> to customize the MemoryRegion operations depending on the SoC model.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [clg: - improved commit log
>>       - changed vmstate version
>>       - reworked model integration into new objet class ]
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/misc/aspeed_scu.h |   7 +-
>>  hw/misc/aspeed_scu.c         | 190 +++++++++++++++++++++++++++++++++-=
-
>>  2 files changed, 189 insertions(+), 8 deletions(-)
>=20
> ...
>=20
>> +static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset,=20
>> uint64_t data,
>> +                                     unsigned size)
>> +{
>> +    AspeedSCUState *s =3D ASPEED_SCU(opaque);
>> +    int reg =3D TO_REG(offset);
>> +
>> +    if (reg >=3D ASPEED_AST2600_SCU_NR_REGS) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: Out-of-bounds write at offset 0x%"=20
>> HWADDR_PRIx "\n",
>> +                      __func__, offset);
>> +        return;
>> +    }
>> +
>> +    if (reg > PROT_KEY && !s->regs[PROT_KEY]) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n",=20
>> __func__);
>> +    }
>> +
>> +    trace_aspeed_scu_write(offset, size, data);
>> +
>> +    switch (reg) {
>> +    case AST2600_PROT_KEY:
>> +        s->regs[reg] =3D (data =3D=3D ASPEED_SCU_PROT_KEY) ? 1 : 0;
>> +        return;
>> +    case AST2600_HW_STRAP1:
>> +    case AST2600_HW_STRAP2:
>> +        if (s->regs[reg + 2]) {
>> +            return;
>> +        }
>> +        /* fall through */
>> +    case AST2600_SYS_RST_CTRL:
>> +    case AST2600_SYS_RST_CTRL2:
>> +        /* W1S (Write 1 to set) registers */
>> +        s->regs[reg] |=3D data;
>> +        return;
>> +    case AST2600_SYS_RST_CTRL_CLR:
>> +    case AST2600_SYS_RST_CTRL2_CLR:
>> +    case AST2600_HW_STRAP1_CLR:
>> +    case AST2600_HW_STRAP2_CLR:
>> +        /* W1C (Write 1 to clear) registers */
>> +        s->regs[reg] &=3D ~data;
>=20
> This clear should respect the protection register for each strap case.

Joel,

You are the expert ! :)=20

Thanks,

C.


