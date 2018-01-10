Received: by 10.28.173.206 with SMTP id w197csp4697695wme;
        Wed, 10 Jan 2018 01:41:39 -0800 (PST)
X-Google-Smtp-Source: ACJfBouMvuc1vz0ff6Yn7YH6DKdS4M9LQ7X0wzUakNsAr5RLzJ7J7KEg9DbAidUL+M++5wP5looO
X-Received: by 10.37.244.14 with SMTP id q14mr16245932ybd.264.1515577298982;
        Wed, 10 Jan 2018 01:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515577298; cv=none;
        d=google.com; s=arc-20160816;
        b=LxN+ggQtaAGvnl9CuZdMdFKTN17P8QBwLYZLaBiTNw7FEHvnjGMtviIyLTUk0mDSFi
         Vr/8c0r45M9xqNWY4+dYnU95ECVfmqr8TVlxjWbnFEk3EbuHT7wVa6HrZsGrNe8Gll2R
         tSaBVvwzxS6HQfub566U3GT2IWKIjLmT2hAm7ehVWuwahJAq3ud6stWgeKOZsoRVb/JJ
         3QpulA3kxfxInM2zUpm2rVYXmfJaHFQ+4Mnd6n3Q//1oo4TjszKdvVA/v/2DGZMt7tbF
         VteJQysfaDaq8DTxEMDP2t+VKonrXMeNOExib/eaHkEuWsFNHoVbKK/5wuBSw7zb2cgZ
         NDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:message-id:references
         :in-reply-to:to:from:date:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1muS9Onwc6dDmrEIYmLjP73SoxfBqhFRvo2GaJhSEp0=;
        b=VBTWON9XeNKnK4pDfKiMHHOssa1XGtU4Mf6Y3FmUuWH7ZW/jqutRfyUKCxsoLaNw1o
         CBqewnog7o1ORKb35apUBgre7/RDFMDTekNdXnW/uHamGJK2WmDhhHPgENLGfA0jNkId
         cLAIglHVMM2EBkpq2ir3y2y0VIvACERiGpS8I+7dTeqnS5M7nitdnLt1kgj8G/cMd3Dy
         nOqDmbvKej9yewa2yW/DLO2Z7PKPtpyGmC+NzBnmpYExRT8q0pWvy4D/L/jPm+jKrF80
         Oj43WhOfZTt5rjUuVsXEnGeo4Q0Un/faecbTeck4v+JfZfTlXgfI58j8MTUS4SpfyyTV
         3yMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@walle.cc header.s=mail2016061301 header.b=mGA4oS7+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b1si521735ybk.556.2018.01.10.01.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Jan 2018 01:41:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@walle.cc header.s=mail2016061301 header.b=mGA4oS7+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZCt8-0001fV-GB
	for alex.bennee@linaro.org; Wed, 10 Jan 2018 04:41:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1eZCt1-0001f4-77
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 04:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1eZCsw-0007XQ-T5
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 04:41:31 -0500
Received: from ssl.serverraum.org ([213.133.101.245]:47793)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@walle.cc>)
	id 1eZCsw-0007WE-If; Wed, 10 Jan 2018 04:41:26 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher DHE-RSA-CAMELLIA256-SHA256 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 9627622238;
	Wed, 10 Jan 2018 10:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1515577284;
	bh=hIEF34T/ONPDi88ZDffNLbGF5pp7Uw421OQGlaZ257A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mGA4oS7+9T6tBoQGomScBgDy/Fc7tG+WHxhUZuCQd09jkdm8m3gywFhOyNqmlDw6f
	JWMb2gQ8eNyIA9ebE+0rwZIonKYiizKlNWy0da5cEmw5zqeKBp0FOyCbDT2cL/Iz1r
	GpmpYReWrL1IdcD/vcmkNFdlShdiEXfiSKm17Fmw=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Wed, 10 Jan 2018 10:41:24 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
In-Reply-To: <CAAdtpL7bno=1yrRYK6zt4pgDsa8N-8d291pzX0rhNBVqgkKi4g@mail.gmail.com>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-3-f4bug@amsat.org>
	<60c89dbec86c14e2f0883d121872d0f6@walle.cc>
	<CAAdtpL7bno=1yrRYK6zt4pgDsa8N-8d291pzX0rhNBVqgkKi4g@mail.gmail.com>
Message-ID: <a06fcf38a03e63ffda2baa50f01e0769@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.2.3
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-arm] [PATCH 2/6] hw/sd/milkymist-memcard: split realize()
 out of SysBusDevice init()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Xiaoqiang Zhao <zxq_yx_007@163.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, philippe.mathieu.daude@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RzHhgJ36lUrc

Hi Philippe,

Am 2018-01-09 19:16, schrieb Philippe Mathieu-Daud=C3=A9:
> Hi Michael,
>=20
>> Am 2018-01-03 17:23, schrieb Philippe Mathieu-Daud=C3=A9:
>>>=20
>>> Create the SDCard in the realize() function.
>>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  hw/sd/milkymist-memcard.c | 24 +++++++++++++++---------
>>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>>=20
>>> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
>>> index 5de3e00e2f..5df3a0f815 100644
>>> --- a/hw/sd/milkymist-memcard.c
>>> +++ b/hw/sd/milkymist-memcard.c
>>> @@ -255,24 +255,29 @@ static void milkymist_memcard_reset(DeviceState=
=20
>>> *d)
>>>  static int milkymist_memcard_init(SysBusDevice *dev)
>>>  {
>>>      MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
>>> -    DriveInfo *dinfo;
>>> +
>>> +    memory_region_init_io(&s->regs_region, OBJECT(s),=20
>>> &memcard_mmio_ops,
>>> s,
>>> +            "milkymist-memcard", R_MAX * 4);
>>> +    sysbus_init_mmio(dev, &s->regs_region);
>>> +
>>> +    return 0;
>>> +}
>>=20
>>=20
>> Creating the device (milkymist_memcard_create()) fails with an=20
>> assertion:
>>   sysbus_mmio_map_common: Assertion `n >=3D 0 && n < dev->num_mmio'=20
>> failed.
>=20
> Thanks for trying this.
>=20
> Odd 'make check-qtest-lm32' didn't catch this...
>=20
>> because dev->num_mmio is still 0. Seems that sysbus_init_mmio() hasn't=
=20
>> been
>> called yet. Do we have to move the milkymist_memcard_init() to
>> .instance_init?
>=20
> Your patch seems correct :)
>=20
> Do you have some milky one prebuilt image that I can use for testing?

You can use this one:
   http://milkymist.walle.cc/updates/2012-03-01/flickernoise

http://milkymist.walle.cc/README.qemu

-michael
