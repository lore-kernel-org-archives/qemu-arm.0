Received: by 10.28.173.206 with SMTP id w197csp3989852wme;
        Tue, 9 Jan 2018 10:17:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBoswBBvYdodeRzb4P7oUTBFJ1nqXb8mp6DM+WP5Z0mdpEFRl64euh9povVxxkTY+uvEX4qmT
X-Received: by 10.37.40.5 with SMTP id o5mr14420992ybo.433.1515521838541;
        Tue, 09 Jan 2018 10:17:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515521838; cv=none;
        d=google.com; s=arc-20160816;
        b=iXdPq1WDDCHzlt88KXXVm6MVd5FcPQcSKOwMtUXyhTyzq88fh5S+bmBq7JtZZpGlLX
         1Jg+gmSlsJol3WYvpFgFbpT845xTX0XOASsope2GEmpg37/4SCSmc+2sa4AsBSRtJlpK
         Npvw7ewiAy2NueQnBxpKWrZTWYaHn+45WVLbYcdP3pv8Mq0lySLjcu7v3F4qbZPoSPZQ
         xk2no9U123SQAVDL6lqOpMOj7+ks+bbmnxlvELmxq+gKOL5pk23Fxr/A8xWkWz4ow/Qb
         vLjDNOmw8SRjb1XyEs+MPnJZMMA0CnMRaGJD2cKP/mOHWr9rD9TbJOgo04JLHhfnzRZO
         cVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=XH6rbSAyRE1nMdUTHHgVodjhczwuVTKjhX8St6rIXXg=;
        b=QNC7R9OibI4dO/jM/iP0TRyy4nu9byIbc29YZ3DdZ/YjtKiuFC4HvIB+vl+bCR/NLM
         xmix233zbWTIWF0VOlstvAFVhDvdmt5rDUMaDJ/ruX3GNiT+sGCijot4HoAU3NvuNllO
         SnV7j9oRdpLVKkvS09LMOGQaLSEx7TFeYKg+4SF/XAoCPzljeL9Guf+oylQYM12aFh7Z
         DJ+Wyd+qrAIdP+p02TkfhXw2podAjwyBU941vrxrt3KZcHQZWByU0hDpHBji1W5PnQZ5
         OfZjL9/x+AbihgvVJ3HNrQ5pw8XYroUqSOecT/B/M1Shn+lfD/OZILe243b4GMRyerRJ
         kMjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FQGeMbuY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si590425ybp.789.2018.01.09.10.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 10:17:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FQGeMbuY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYySb-0006JN-UP
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 13:17:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYySO-0006G2-86
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 13:17:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYySN-0004eD-8K
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 13:17:04 -0500
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:41876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYySK-0004Xv-9n; Tue, 09 Jan 2018 13:17:00 -0500
Received: by mail-io0-x243.google.com with SMTP id f6so19523940ioh.8;
	Tue, 09 Jan 2018 10:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=XH6rbSAyRE1nMdUTHHgVodjhczwuVTKjhX8St6rIXXg=;
	b=FQGeMbuYSiRUwV/rQDCANgLaFkwfhHCTk9rIppw8U7A4HKBFavr7R1lKwPR82nUgRz
	UAYPfObaED6GHyoz1KweKVfltIhZWBtmIku7H/BnRbY/5hmrd71xY04cLnxgaDkouev2
	s5A6KAR4iXw3tCMoGK4RfJCQbV4j41o7O8ilw139yh26cNGrM7YNa+9hp2DerbWPUsS3
	FYrDldU4WIGphzCIMfAMO+VvIAYKT2MW7CNEZoC2zhZw4sUh2aMt8AMgrwnnCOAAOvHy
	Gi+kaftUsqU6dsbd4O5CeX4tzkkXPCailcBmcd1Vp5ezE0IKO5vC2xM2dOUWIMdDzTPw
	49uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=XH6rbSAyRE1nMdUTHHgVodjhczwuVTKjhX8St6rIXXg=;
	b=szIIbEhVYe2Oy2pkGA49XOOFezcnm960SY9MprRu5emLz+E0U0BXGFrpLSW/pXcUkA
	EDhFo6bGy7y1NU7XVa8syfwcPgPwYIt1qBZrTzfQXBmaAA+7DduyGuETL7WERX1AYMNV
	si4wFbFlCRPGXYk13KBZZT4EMDBjP/GodmORx36C0c0O94EW4toATygATkKSsRZBMri2
	ZADxBb3MDuL69JHU59GI6LauQ6Y4kMHMEaP5QYulKjPGEACN4G1kA3NVZPU8ykv39Rmu
	ShWNdHPoq1fRFJFvkrqYCq+TKsFebSfsexsxXQpPR8j4AXBx3g0z10zO3cGTkDWBDbDA
	57yA==
X-Gm-Message-State: AKGB3mIeNBTnPOdPJ071SIbawlH1y9PjT6UuZictRscMYonMlLrWRPgv
	Uo9xF5F25+P18RtXAWZvi4MDiIGcHKIpn9Gtno4=
X-Received: by 10.107.112.13 with SMTP id l13mr16363830ioc.23.1515521819600;
	Tue, 09 Jan 2018 10:16:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.183.8 with HTTP; Tue, 9 Jan 2018 10:16:58 -0800 (PST)
In-Reply-To: <60c89dbec86c14e2f0883d121872d0f6@walle.cc>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-3-f4bug@amsat.org>
	<60c89dbec86c14e2f0883d121872d0f6@walle.cc>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 9 Jan 2018 15:16:58 -0300
X-Google-Sender-Auth: PHj-LM2H2RPIUN1JTMP-qI6BoYw
Message-ID: <CAAdtpL7bno=1yrRYK6zt4pgDsa8N-8d291pzX0rhNBVqgkKi4g@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::243
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
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 94tP7f+UWWnR

Hi Michael,

> Am 2018-01-03 17:23, schrieb Philippe Mathieu-Daud=C3=A9:
>>
>> Create the SDCard in the realize() function.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  hw/sd/milkymist-memcard.c | 24 +++++++++++++++---------
>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
>> index 5de3e00e2f..5df3a0f815 100644
>> --- a/hw/sd/milkymist-memcard.c
>> +++ b/hw/sd/milkymist-memcard.c
>> @@ -255,24 +255,29 @@ static void milkymist_memcard_reset(DeviceState *d=
)
>>  static int milkymist_memcard_init(SysBusDevice *dev)
>>  {
>>      MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
>> -    DriveInfo *dinfo;
>> +
>> +    memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops=
,
>> s,
>> +            "milkymist-memcard", R_MAX * 4);
>> +    sysbus_init_mmio(dev, &s->regs_region);
>> +
>> +    return 0;
>> +}
>
>
> Creating the device (milkymist_memcard_create()) fails with an assertion:
>   sysbus_mmio_map_common: Assertion `n >=3D 0 && n < dev->num_mmio' faile=
d.

Thanks for trying this.

Odd 'make check-qtest-lm32' didn't catch this...

> because dev->num_mmio is still 0. Seems that sysbus_init_mmio() hasn't be=
en
> called yet. Do we have to move the milkymist_memcard_init() to
> .instance_init?

Your patch seems correct :)

Do you have some milky one prebuilt image that I can use for testing?

Regards,

Phil.

>
> Eg.
>
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index 5df3a0f815..21c0e91926 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -252,15 +252,14 @@ static void milkymist_memcard_reset(DeviceState *d)
>      }
>  }
>
> -static int milkymist_memcard_init(SysBusDevice *dev)
> +static void milkymist_memcard_init(Object *obj)
>  {
> -    MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
> +    MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(obj);
> +    SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
>
>      memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops,=
 s,
>              "milkymist-memcard", R_MAX * 4);
>      sysbus_init_mmio(dev, &s->regs_region);
> -
> -    return 0;
>  }
>
>  static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
> @@ -300,9 +299,7 @@ static const VMStateDescription
> vmstate_milkymist_memcard =3D {
>  static void milkymist_memcard_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
>
> -    k->init =3D milkymist_memcard_init;
>      dc->realize =3D milkymist_memcard_realize;
>      dc->reset =3D milkymist_memcard_reset;
>      dc->vmsd =3D &vmstate_milkymist_memcard;
> @@ -314,6 +311,7 @@ static const TypeInfo milkymist_memcard_info =3D {
>      .name          =3D TYPE_MILKYMIST_MEMCARD,
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(MilkymistMemcardState),
> +    .instance_init =3D milkymist_memcard_init,
>      .class_init    =3D milkymist_memcard_class_init,
>  };
>
> -michael
>
>
>> +
>> +static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
>> +{
>> +    MilkymistMemcardState *s =3D MILKYMIST_MEMCARD(dev);
>>      BlockBackend *blk;
>> +    DriveInfo *dinfo;
>>
>>      /* FIXME use a qdev drive property instead of drive_get_next() */
>>      dinfo =3D drive_get_next(IF_SD);
>>      blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
>>      s->card =3D sd_init(blk, false);
>>      if (s->card =3D=3D NULL) {
>> -        return -1;
>> +        error_setg(errp, "failed to init SD card");
>> +        return;
>>      }
>> -
>>      s->enabled =3D blk && blk_is_inserted(blk);
>> -
>> -    memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops=
,
>> s,
>> -            "milkymist-memcard", R_MAX * 4);
>> -    sysbus_init_mmio(dev, &s->regs_region);
>> -
>> -    return 0;
>>  }
>>
>>  static const VMStateDescription vmstate_milkymist_memcard =3D {
>> @@ -298,6 +303,7 @@ static void
>> milkymist_memcard_class_init(ObjectClass *klass, void *data)
>>      SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
>>
>>      k->init =3D milkymist_memcard_init;
>> +    dc->realize =3D milkymist_memcard_realize;
>>      dc->reset =3D milkymist_memcard_reset;
>>      dc->vmsd =3D &vmstate_milkymist_memcard;
>>      /* Reason: init() method uses drive_get_next() */
