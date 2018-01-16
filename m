Received: by 10.28.173.206 with SMTP id w197csp4089127wme;
        Tue, 16 Jan 2018 07:36:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBos1pV390E2HxtgZCbzq/fffjqJ30UZ5vZDAh5KN5cPeYChE8LIKMxFNXHr8YlzB5yaDzCoq
X-Received: by 10.37.20.6 with SMTP id 6mr9671574ybu.449.1516117013767;
        Tue, 16 Jan 2018 07:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516117013; cv=none;
        d=google.com; s=arc-20160816;
        b=I/2vqWzv7EcbRHWmvaGQSP/aFB0wudL5fMB/SA3/gEHu8e6yJM0IxklYXaCj1jiqij
         wNByrBOToLN8Wx7jirRQfHhqYJnYn96HHF7wGQVruvgtGk2G12EeZc9KbRbY9LATppjf
         r4NHVLqtKf2d6iBwScS2bWzGC4jMsOTkT+HMfRBHAir/9TWy3kCS+2KBTvaTy8QWO6BW
         ULhnCAL5LjWZqefzr7THDWuTdvkbWE3rMXJakNY9C7aG8r7KZKjZDvA1yVtqaez0suYY
         k2mSG0i8jC6fyX25CcvrtL/VreKZDRnQEAkX2bAevPvi9cI9H09buuauiXVTG30vm+L2
         dx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=tXBejoXdZG/R2bh/PHIL0vn6AvwLDrmnOdnTy8WXngE=;
        b=dLfknm4pl6eAHghGPWS8KwQIzm6P1rRDQ0QJBKlbfLpRhfFOIDJRZGklaTb8B8Lruf
         1omp+pxEPDttF1hj7AkGFwjf3SNyTdSnPt/B8QXgvhqyKQ5tgAiRiv0WsChq1fJpmY6a
         FKf043uy/CDgiweJNb6xkIiRD3VOdvIk+PI90zVSxfX4/lKBFevWFLvf3hG4wcVvjmwk
         Z7VzISmaeFM2b7gVVxjnsYVVkUp9ra2W1e7rLD+STYz8KjJUtVKRjay0T91f8Hq7MOzX
         MrUcdOuroNH13dEXthxtIabuNz51fDicEPNaL92LzzvsNNV14VhknDkhZY4YM+hEFGlQ
         7h2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EdEYYP/z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w25si570435ybi.370.2018.01.16.07.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:36:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EdEYYP/z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTID-0006Wf-4n
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:36:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebSms-0000Ag-My
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:04:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebSmk-0005r3-I1
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:04:30 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebSmk-0005qs-DV; Tue, 16 Jan 2018 10:04:22 -0500
Received: by mail-qk0-x243.google.com with SMTP id j185so21199141qkc.5;
	Tue, 16 Jan 2018 07:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tXBejoXdZG/R2bh/PHIL0vn6AvwLDrmnOdnTy8WXngE=;
	b=EdEYYP/zQqN/HATIwwwQPe2+ES+DLeU02QWnQjLEbICzzhfug+mZSMdl2diwZEyTdT
	exR06PuF2tY7XG6k07DIplwDdacNxXkB/b+4FIhwFCfnP9xbpdDALYjPjW/GhFpPWcvi
	ZxmVBRQxJroz7yWTuDS0JlwF3jLGqKGI78hAgNRjmo/7AFXRUuIwGy68T6mS1arHaRsR
	FBZfBHT0el/S19pWW5g0Zi+pJWs1P0jp87LFc1fyydQ5SnR/cXjY58lLpbBOfOvtAZTY
	znjnBhv8I1fKsLKiKqTCOfY7ttdCWKBSvzEPrO7iIDKLKVee9Kb5xpNaIYb2qwsgqLEQ
	bneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tXBejoXdZG/R2bh/PHIL0vn6AvwLDrmnOdnTy8WXngE=;
	b=NXEk5fc0C92liHEkFPiANTTVsimHPQ7QRLHYw2HyyDhW/FjjlAuWSWriXlXUjh/+C+
	g9E09KE2hqVda/RPNCRoyPL2iBYjZFKn/UymfzT9ORy37tnYYWaBPzbvc2A4Fp8N+AyO
	yVgFoHboHCDmqZqu7eVzuK3XqXx+jJmaO++XHiDc8mHudHkQPA/Xt1QqmHOvA0NkBINN
	K5nO9YQTsZh9EDO8w3dglPwR8vf+2gygEpv4WJrwI6JkyloRf83Dhb3w8sNMsoVO94sD
	HK3XUT4owhVZ3JhWAB4cvY8QfqvFKu8jODPXdVZ5t+ySgKd1q+WCu43s4OSoYFULMGif
	4yxQ==
X-Gm-Message-State: AKwxytdNCyvuOyR0W8VggFvjnTfjAS5tPm68nepuHb/VSp3i4upYywPK
	6MnnxUBODEeuI4TL3EiMC4XCejEsGIog/JQOrhQ=
X-Received: by 10.55.215.20 with SMTP id m20mr54085088qki.60.1516115061570;
	Tue, 16 Jan 2018 07:04:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.39 with HTTP; Tue, 16 Jan 2018 07:04:20 -0800 (PST)
In-Reply-To: <b085a18b-84f4-6695-f664-c146ece47eee@amsat.org>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-12-andrew.smirnov@gmail.com>
	<b085a18b-84f4-6695-f664-c146ece47eee@amsat.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 16 Jan 2018 07:04:20 -0800
Message-ID: <CAHQ1cqGtN+dvSP_q2QXRJ7wAwBZNGzVkpG3Zd9KS87OHkL7n5g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v4 11/14] ARM: Add basic code to emulate
 A7MPCore DAP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M7f0q9oyA1nZ

On Mon, Jan 15, 2018 at 8:32 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Hi Andrey,
>
> On 01/15/2018 10:37 PM, Andrey Smirnov wrote:
>> Add minimal code to emulate A7MPCore DAP block needed to boot Linux
>> guest.
>
> I was not aware the DAP is accessed by upstream Linux...
>
> You sure this isn't rather part of some bootloader built-in self-test?
>

Yes, I am positive:

a) I don't run any bootloader and boot directly into Linux, so it's
just physically impossible
b) Here's the code:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/hwtracing/coresight?h=3Dv4.15-rc8


>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/arm/Makefile.objs       |   2 +-
>>  hw/arm/coresight.c         | 120 ++++++++++++++++++++++++++++++++++++++=
+++++++
>>  include/hw/arm/coresight.h |  24 +++++++++
>>  3 files changed, 145 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/coresight.c
>>  create mode 100644 include/hw/arm/coresight.h
>>
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 2794e086d6..692216e0cf 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -1,4 +1,4 @@
>> -obj-y +=3D boot.o collie.o exynos4_boards.o gumstix.o highbank.o
>> +obj-y +=3D boot.o collie.o exynos4_boards.o gumstix.o highbank.o coresi=
ght.o
>>  obj-$(CONFIG_DIGIC) +=3D digic_boards.o
>>  obj-y +=3D integratorcp.o mainstone.o musicpal.o nseries.o
>>  obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris.o
>> diff --git a/hw/arm/coresight.c b/hw/arm/coresight.c
>> new file mode 100644
>> index 0000000000..d0a8c1b005
>> --- /dev/null
>> +++ b/hw/arm/coresight.c
>> @@ -0,0 +1,120 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * CoreSight block emulation code
>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/arm/coresight.h"
>> +#include "qemu/log.h"
>> +
>> +static uint64_t coresight_read(void *opaque, hwaddr offset,
>> +                               unsigned size)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void coresight_write(void *opaque, hwaddr offset,
>> +                            uint64_t value, unsigned size)
>> +{
>> +}
>
> I assume you had to add this to bypass the memory_transaction_failures
> check.
>
>> +
>> +static const struct MemoryRegionOps coresight_ops =3D {
>> +    .read =3D coresight_read,
>> +    .write =3D coresight_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +    .impl =3D {
>> +        /*
>> +         * Our device would not work correctly if the guest was doing
>> +         * unaligned access. This might not be a limitation on the real
>> +         * device but in practice there is no reason for a guest to acc=
ess
>> +         * this device unaligned.
>> +         */
>> +        .min_access_size =3D 4,
>> +        .max_access_size =3D 4,
>> +        .unaligned =3D false,
>> +    },
>> +};
>> +
>> +static void a7mpcore_dap_init(Object *obj)
>> +{
>> +    SysBusDevice *sd =3D SYS_BUS_DEVICE(obj);
>> +    A7MPCoreDAPState *s =3D A7MPCORE_DAP(obj);
>> +
>> +    memory_region_init(&s->container, obj, "a7mpcore-dap-container", 0x=
100000);
>
> You can just use add this in fsl_imx7_realize():
>
>   create_unimplemented_device("a7mpcore-dap-container",
>                               FSL_IMX7_A7MPCORE_DAP_ADDR,
>                               0x100000);
>
> to register a background region for the DAP (see "hw/misc/unimp.h")
>
> as a bonus, running with "-d unimp" you can trace the DAP access.
>
> So this model and those files are not necessary.
>

I am aware of create_unimplemented_device(), my reasoning for keeping
this code as a standalone class was to make it reusable for other
systems while providing more granular mapping (not just covering the
whole 0x100000 bytes of memory). I'll convert the code to use
create_unimplemented_device() since we now have two votes in favor of
it.

Thanks,
Andrey Smirnov
