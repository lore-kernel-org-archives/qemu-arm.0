Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp319705wrd;
        Wed, 19 Sep 2018 00:10:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdacXp2wtQnLldLicxL/zBjOgVNrNhzII6XrDP63pprvTLa19UwNhQk2SXEu722rfS/2Yi/G
X-Received: by 2002:a37:ae03:: with SMTP id x3-v6mr23052339qke.170.1537341048860;
        Wed, 19 Sep 2018 00:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537341048; cv=none;
        d=google.com; s=arc-20160816;
        b=lEVEWHVJRUshFdzr6EKIaw1IHTSMqI5+O10RDlq3YOeKZ+ykahBn0iUwtqfse6FBco
         l+Uxk5Ap2p0HXrgAJ4yTksTxAdiCHdqOoEzaaZXK9VGujtoXgLvskejycgzxaTCoOAca
         VT0oPSCotS9ZFkez/wyCPK0Ov12zH7BLDrrx55mo6yY+VU8J6UsdDIxYbZaaIwW6D0fn
         1VZpZG4r6WsO4QpvGBe4R169GEhUtVAOdys8j0uh0vaYiiYHK6chEKda20upim3ZG3he
         4orTZsHUnXPG40fCEfjYmea/MB6g5Fa3xbMn4r9NZf8aeXPA+IEBPpISaJCS75jo0hHC
         ZyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=bzndPKm+rCvTSPzHOrqhEgr/nqqugSiIzyIqpMEZetw=;
        b=MeK63mIHrm+QS0MVHDbBmUKV+8YiQjvyc1e5/SGyR+tzBa6RjgHbLlBrs228C/30su
         BDdzSmjyadmxIdQzROh3/j54bLMZZc923j0mXJH6X7NeC3VsHHaZ6N5KpHJXjTdLLEiN
         lXng/PyyY9lzgu+jhXQ/3kO4rfUUJUoLbiUU/I0GgwvvDr8Om9MewtVDDIxrSv7lCP1I
         a5L594feUTwUMTQoaTOp175W9S59s+Le8aqleIai4kPbAU/b0DWrnhTKEi7R8EkIlcLQ
         4WiAlIoA0tl0t2lua8KkZBTCcC1WJvkhJrcv1IxLJsJiqTlLQOGM9ssKV005/B9aEjkz
         tcuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4-v6si3088813qvm.154.2018.09.19.00.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 00:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2WdM-0005ZU-9I
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 03:10:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2Wd5-0005VR-2g
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 03:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2Wct-0005Ou-Lb
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 03:10:27 -0400
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:57688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g2Wct-0005Mm-C6
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 03:10:19 -0400
Received: from player750.ha.ovh.net (unknown [10.109.160.226])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id D499ADCD7C
	for <qemu-arm@nongnu.org>; Wed, 19 Sep 2018 09:10:17 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 41BD7180087;
	Wed, 19 Sep 2018 09:10:08 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-9-clg@kaod.org>
	<CAFEAcA_MNEHUYOpA9juZPuUqrGf6awYc8wVWyqkfnz2Xyw=7GA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <678c7664-01ed-0b4b-8161-8cd2103b08c0@kaod.org>
Date: Wed, 19 Sep 2018 09:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MNEHUYOpA9juZPuUqrGf6awYc8wVWyqkfnz2Xyw=7GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17751219408511470418
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrkeejgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.72.216
Subject: Re: [Qemu-arm] [PATCH 08/11] aspeed/smc: add support for DMAs
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
X-TUID: wG+X7afRORj8

On 09/18/2018 08:53 PM, Peter Maydell wrote:
> On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> The FMC controller on the Aspeed SoCs support DMA to access the flash
>> modules. It can operate in a normal mode, to copy to or from the flash
>> module mapping window, or in a checksum calculation mode, to evaluate
>> the best clock settings for reads.
>>
>> Our primary need is to support the checksum calculation mode and the
>> model only implements synchronous DMA accesses. Something to improve
>> in the future.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>>
>> +/*
>> + * Accumulate the result of the reads to provide a checksum that will
>> + * be used to validate the read timing settings.
>> + */
>> +static void aspeed_smc_dma_checksum(AspeedSMCState *s)
>> +{
>> +    uint32_t data;
>> +
>> +    if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: invalid direction for DMA checksum\n",  __=
func__);
>> +        return;
>> +    }
>> +
>> +    while (s->regs[R_DMA_LEN]) {
>> +        cpu_physical_memory_read(s->regs[R_DMA_FLASH_ADDR], &data, 4)=
;
>=20
> Ideally DMAing devices should not use cpu_physical_memory_*().
> It's better to have the device take a MemoryRegion which it uses to
> create an AddressSpace that it can use address_space_ld*. This (a)
> allows you to correctly model that the DMAing device can't necessarily
> see the same set of devices/memory that the CPU does and (b) detect
> and handle read/write failures.
>=20
> Commit 112a829f8f0ad is an example of converting a DMA controller from
> old style cpu_physical_memory_*  to taking a MemoryRegion and using it.
> (It doesn't do checking for read/write failure, but you should, by
> passing a non-null MemTxResult* final argument.)

OK. I will rework that part.

Thanks,

C.
