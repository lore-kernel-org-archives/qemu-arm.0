Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp107714wrx;
        Thu, 11 Apr 2019 21:37:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmKrbkr7Waj4qCjZqqgm3ziCp+gR0rtoq44A81XwV4EYJU/3OjVvODw96/G8FWszt4267I
X-Received: by 2002:adf:f30a:: with SMTP id i10mr33237474wro.111.1555043838096;
        Thu, 11 Apr 2019 21:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555043838; cv=none;
        d=google.com; s=arc-20160816;
        b=iev52lcMAsK+c+Pm7zKvQEIi1Lrun+Lp57GsmFT1P8dIpaDTqYPj82CspaSUa5/S3v
         Q9q/i437vHvkRV7ejTrk1AmMwIzoPeLeAa4PkHjCuDh/cg02+aK1is6I+2VQKXQ/ZLtJ
         4hGG8dXBPSQvTXrRqvBXAz5vSOCNjw6hNddUSSB4a4b2g0QQVA1r73P0oqd8Hd6/RFUY
         kppNkeHUBYerbCeXVg0hRyM0mzRpxePvkt+fOrhqxcqaHbemTW4QPHojz3dbqMOThilJ
         432Ii7tvUEToB19hKkSW614WkLP6ZBl71+nk+e+JC22L1QtMlxM5VTBcR+wnRwZb1Ehv
         EANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6I0iWXeMPfm16++nyYmy+Jnh4ZLGI0mmLUzTZtPXfV4=;
        b=T71SBuW63r3uN55oN1Z4/CHze8r1DU+WiP0mIVeS0oVxjn/IqcS8QSD8jH6RSYDQLC
         TZXJWw/3WugVSLFKxRQYj/+KCgtSAcxqqmYx+qpG/4QF8XrSNc3Jc9dkXH2ce+NDruzw
         rYe+lqE4ttswrMpe3AHLtGBLVFlvTmvAyMB3A8Qm1OsbYUEhDV4Owkx2GytJ0SCWTolb
         MSo00Pf6n0TPO0Ai/m4bVmlhQXBHZrQZ9N1lf+gxIA7oZW063mv+zY+XqMcVv6qf2+42
         uY9foWnAgoYSrzNdWIYTVdxaEzx8CdIkUcd6q4Gwd39dFijGAOfgqXJYsNgP9RIuddKW
         PfZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si4306422wmc.163.2019.04.11.21.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 21:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:58834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEnwD-0003Q6-7Y
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 00:37:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hEnw0-0003Pl-3x
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 00:37:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hEnvy-00075q-HF
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 00:37:03 -0400
Received: from 19.mo7.mail-out.ovh.net ([178.33.251.118]:47756)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hEnvy-00073E-70
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 00:37:02 -0400
Received: from player799.ha.ovh.net (unknown [10.109.143.225])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6B1B210E8FB
	for <qemu-arm@nongnu.org>; Fri, 12 Apr 2019 06:36:59 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-40-22.w86-201.abo.wanadoo.fr
	[86.201.133.22]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 06BBD4ADE0E4;
	Fri, 12 Apr 2019 04:36:53 +0000 (UTC)
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20190411161013.4514-1-clg@kaod.org>
	<20190411161013.4514-3-clg@kaod.org>
	<CACPK8XezRXPFFiiK7_xXLs-ipnfw9400E1dSRHN0XnF2cc4=vA@mail.gmail.com>
	<c007d615-4dbf-4525-9fb0-6e4feb28c344@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e9c90082-5312-5707-539b-3ab3c2e7d885@kaod.org>
Date: Fri, 12 Apr 2019 06:36:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c007d615-4dbf-4525-9fb0-6e4feb28c344@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1579356097962150720
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrvddtgdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.118
Subject: Re: [Qemu-arm] [PATCH 2/3] aspeed: add a per SoC mapping for the
 memory space
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZYN46bls9l0+

On 4/12/19 5:24 AM, Andrew Jeffery wrote:
>=20
>=20
> On Fri, 12 Apr 2019, at 11:48, Joel Stanley wrote:
>> On Thu, 11 Apr 2019 at 16:10, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>>>
>>> This will simplify the definition of new SoCs, like the AST2600 which
>>> should use a slightly different address space and have a different se=
t
>>> of controllers.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>
>>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>>> index 5bbd1fb87d18..9b601709e93c 100644
>>> --- a/hw/arm/aspeed_soc.c
>>> +++ b/hw/arm/aspeed_soc.c
>>
>>> +static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
>>
>>> +static const hwaddr aspeed_soc_ast2500_memmap[] =3D {
>>
>> Most of these arrays is common. And some of it will stay common in the
>> 2600. Any ideas how we could avoid duplication?
>=20
> I dunno, I feel that any attempt to create some "common" layout concept=
 is
> more distracting than having soc-specific, complete layouts described.

yes. I rather duplicate some values and see in one glance the full=20
address space.

Thanks,

C.
 =20
>=20
> There's no reason why they're common beyond coincidence (i.e. it's at
> ASPEED's whim). I think this is fine.
>=20
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>=20
>>
>> This is fine for now.
>>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>

