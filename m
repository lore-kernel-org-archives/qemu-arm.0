Received: by 10.223.159.82 with SMTP id f18csp653070wrg;
        Wed, 22 Nov 2017 13:07:22 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb3iONVUCk4WEKVkPO4X27C68QOFUx8MUPw5e7DoRJycnVZZS1bYUO5yfHMfo4j1I/gLrTj
X-Received: by 10.37.230.80 with SMTP id d77mr13623276ybh.315.1511384842331;
        Wed, 22 Nov 2017 13:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511384842; cv=none;
        d=google.com; s=arc-20160816;
        b=EdeuoXdGWkVy+hD5EhtuzCkpvtGuUGCoFyfkVhnTMN32qwrhIeYBaVpfTHODLqO/Fe
         rOgzC6T02U5Wv6SYKIgIKcvuX7myGC1bKp6U14gnfKxpy1jfubDP1fd5lgA85nDd9xfk
         7ttrk9e0/yKDJ1lFJUZTx+j6eCqmDnXBXfdXeLsxL/H+PmoTilykyCFuo5vSxfvitpaD
         J/MQ4bAU1gXgT7tktlTOpy2XfSHycl5tBu9o5ITzdC3Y0u8zfG8mSiVXTOQFmFt6iYzh
         MSbzsjufGUQIap1g7JfC/7twZV396Q2+7vlGyOJ9hJ7yawuu8CpnvCdzHyWu6QEEaoxk
         jecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=L11OfPkCof8FtNl1Xi9zevdpyD9idqXL5oolBVtBt+Q=;
        b=Bk4Ojd7Hpp9L+ySUzA5MJOALyELB6iR8Uo8xTyNJiJbRs1loRihwcpDEbuwX5HvKGV
         H9JWs4XGqO8+M19d8di7HRrUImYJq1hU6nRs0KPPiSmf6Q9tIsKsGXloD+Zaz4lF/ZVa
         Q2DvbCOqyc/VMWSs/rZ7hMNRCv7KF79ltW4JSKx4T5+QyYCojVoAgOLWtfR8OgeQUBCW
         IzQTOWpegNwXHa06uYRRgdKWwsli/ICa8tszWu/UfWgGZlkH6uyccuZmln/Lomr2JbGL
         oxFGaXBSqS4ktNQfS1RPcC0TgAbP0UklTxJ07QUcphPJDVIRlTOWL6/WtR8wlAX1sMyh
         D2CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mpA5iM2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s133si1299814ybb.208.2017.11.22.13.07.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 13:07:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mpA5iM2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHcEr-0006eU-ML
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 16:07:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHcEe-0006cj-Vq
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 16:07:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHcEd-0005CS-Rr
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 16:07:08 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHcEd-0005CA-Ll; Wed, 22 Nov 2017 16:07:07 -0500
Received: by mail-qk0-x242.google.com with SMTP id a142so18567523qkb.5;
	Wed, 22 Nov 2017 13:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=L11OfPkCof8FtNl1Xi9zevdpyD9idqXL5oolBVtBt+Q=;
	b=mpA5iM2NGjjFAsOF5OEWVStDYMIXwrWw0k+FWglNUbO2D8TvSylRRW9wkqoRKRTTZJ
	uYkwnxxOcRyVJSN0+ODkUWwQtIWzUM9149Qb3fi84/fYh9n4ZDP7Q3XvJvmuL2xtOse0
	sebSoLHlAwA815801xOFBqnwlBPx89dDkgd5AdRk9nKKJhTe910Vfx7De+DovATSgI4D
	funkjL4ClB3vYmQ9Vcjq6k3WH0xH5l6/kCu5REnGrltXsiYsfjee9utynnW4z6f8pMnM
	zqe4GRFCysIJ5Sm1WkVDhaTzHiGtT2OyFsGo+V4eIwTTvTrr262qHLU+2HMrUGE701lg
	OKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=L11OfPkCof8FtNl1Xi9zevdpyD9idqXL5oolBVtBt+Q=;
	b=MKWsUYYTKNaiBdQhP2tjFE3qGxTuvAaFYykJQOaYnjv0uGo7ZCHN7pq3eez4QzxzFb
	ljbYWxsYpCRS4gfjg0BYeYbdPvdsdM0vC0Fa5fiIr7oRrtBKIvy2v4u2eD3xFkhtgl8D
	o9TSB81HECZOR1yl4CZYddTkS5Ajgyqgk8bXkY0hW50wdjbO9R/fnw5HcWcpNDP8EHPS
	MQcd+ZBEeCkqBCh9c9AE+i+DiQRdKW1icYcbfSyYUnziB6XIxibGP5QTbfod7FmKpfn7
	EI+ZkLzkVFbg2xCjbkx2TjG8Qfpn32kMy8xKbdzl+f0r4fLsJ+9+Zn1HNELy9fgq11Jt
	dvnA==
X-Gm-Message-State: AJaThX4iov68YM+JvIrMXe5verL/5yb5JC7ikT40Cb9T2HMDEmBhUh6A
	pryc8uztGXfpvTIOMMAOrxJLK47H4TfC5U0aURgUKg==
X-Received: by 10.233.222.135 with SMTP id s129mr29349726qkf.32.1511384827066; 
	Wed, 22 Nov 2017 13:07:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 13:07:06 -0800 (PST)
In-Reply-To: <CAFEAcA8gxXmEL3yeu0J12C8D0AkKFqBKC1Sud2HLbT1EdUO41Q@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-15-andrew.smirnov@gmail.com>
	<CAFEAcA8gxXmEL3yeu0J12C8D0AkKFqBKC1Sud2HLbT1EdUO41Q@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 13:07:06 -0800
Message-ID: <CAHQ1cqHDRz=pGJoF8DN_80m1sHigSRhZNodDsH0pKSvHEqhE-A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH v3 14/30] i.MX: Add code to emulate i.MX2
 watchdog IP block
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G3SV/FGnplat

On Tue, Nov 21, 2017 at 10:10 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>> Add enough code to emulate i.MX2 watchdog IP block so it would be
>> possible to reboot the machine running Linux Guest.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/misc/Makefile.objs      |  1 +
>>  hw/misc/imx2_wdt.c         | 88 +++++++++++++++++++++++++++++++++++++++=
+++++++
>>  include/hw/misc/imx2_wdt.h | 34 ++++++++++++++++++
>>  3 files changed, 123 insertions(+)
>>  create mode 100644 hw/misc/imx2_wdt.c
>>  create mode 100644 include/hw/misc/imx2_wdt.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index ac1be05a03..c393a93456 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -35,6 +35,7 @@ obj-$(CONFIG_IMX) +=3D imx25_ccm.o
>>  obj-$(CONFIG_IMX) +=3D imx6_ccm.o
>>  obj-$(CONFIG_IMX) +=3D imx6_src.o
>>  obj-$(CONFIG_IMX) +=3D imx7_ccm.o
>> +obj-$(CONFIG_IMX) +=3D imx2_wdt.o
>>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
>>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
>>  obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
>> diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
>> new file mode 100644
>> index 0000000000..3a1c33aa51
>> --- /dev/null
>> +++ b/hw/misc/imx2_wdt.c
>> @@ -0,0 +1,88 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * i.MX2 Watchdog IP block
>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "sysemu/watchdog.h"
>> +
>> +#include "hw/misc/imx2_wdt.h"
>> +
>> +#define IMX2_WDT_WCR_WDA    BIT(5)      /* -> External Reset WDOG_B */
>> +#define IMX2_WDT_WCR_SRS    BIT(4)      /* -> Software Reset Signal */
>> +
>> +static uint64_t imx2_wdt_read(void *opaque, hwaddr addr,
>> +                              unsigned int size)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void imx2_wdt_write(void *opaque, hwaddr addr,
>> +                           uint64_t value, unsigned int size)
>> +{
>> +    if (addr =3D=3D IMX2_WDT_WCR &&
>> +        (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
>> +        watchdog_perform_action();
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps imx2_wdt_ops =3D {
>> +    .read  =3D imx2_wdt_read,
>> +    .write =3D imx2_wdt_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +    .impl =3D {
>> +        /*
>> +         * Our device would not work correctly if the guest was doing
>> +         * unaligned access. This might not be a limitation on the
>> +         * real device but in practice there is no reason for a guest
>> +         * to access this device unaligned.
>> +         */
>> +        .min_access_size =3D 4,
>> +        .max_access_size =3D 4,
>> +        .unaligned =3D false,
>> +    },
>> +};
>> +
>> +static void imx2_wdt_realize(DeviceState *dev, Error **errp)
>> +{
>> +    IMX2WdtState *s =3D IMX2_WDT(dev);
>> +
>> +    memory_region_init_io(&s->mmio, OBJECT(dev),
>> +                          &imx2_wdt_ops, s,
>> +                          TYPE_IMX2_WDT".mmio",
>> +                          IMX2_WDT_REG_NUM * sizeof(uint16_t));
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>> +}
>> +
>> +static void imx2_wdt_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->realize =3D imx2_wdt_realize;
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +}
>> +
>> +static const TypeInfo imx2_wdt_info =3D {
>> +    .name          =3D TYPE_IMX2_WDT,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(IMX2WdtState),
>> +    .class_init    =3D imx2_wdt_class_init,
>> +};
>> +
>> +static WatchdogTimerModel model =3D {
>> +    .wdt_name =3D "imx2-watchdog",
>> +    .wdt_description =3D "i.MX2 Watchdog",
>> +};
>> +
>> +static void imx2_wdt_register_type(void)
>> +{
>> +    watchdog_add_model(&model);
>> +    type_register_static(&imx2_wdt_info);
>> +}
>> +type_init(imx2_wdt_register_type)
>> diff --git a/include/hw/misc/imx2_wdt.h b/include/hw/misc/imx2_wdt.h
>> new file mode 100644
>> index 0000000000..e67ac6939d
>> --- /dev/null
>> +++ b/include/hw/misc/imx2_wdt.h
>> @@ -0,0 +1,34 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * i.MX2 Watchdog IP block
>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef IMX2_WDT_H
>> +#define IMX2_WDT_H
>> +
>> +#include "qemu/bitops.h"
>> +#include "hw/sysbus.h"
>
> The bitops.h include should be in the .c file, not here.
>

Will fix in v4.

Thanks,
Andrey Smirnov
