Received: by 10.223.172.38 with SMTP id v35csp1015640wrc;
        Thu, 14 Sep 2017 08:35:04 -0700 (PDT)
X-Received: by 10.237.60.239 with SMTP id e44mr30814817qtf.59.1505403304624;
        Thu, 14 Sep 2017 08:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505403304; cv=none;
        d=google.com; s=arc-20160816;
        b=HdHKsHaK1aXU3LWaZggUGWQjK14NXQL0F6CW3JtndPEwpA6moUJjE8jNZaQLuBDyo5
         ZkSq+XH1qHc78oZdtSMo5+5T4MUMavo/Rkw5GqBg2zw6J2J0l5xOYf608K4WTFDjPdne
         7udMyCgcjYouWEUChvQ8OX8avvZY2+oQ3mFBADdRuplICMxrQ6jEowcqpKF8gwbrWCCB
         L9ptqauyLrWaOMcqTANyq2VU5buhHn+PO6UuyJoRMawTYHFmgeQ9tkaVzkFl+8QF/CQO
         kbiP2xFuotQa754QErvZ561GFoe9NoJ/IoK12dIyilxaB0PEX62ILd/WyC3PlMEaMhl2
         Zgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NtIZs0OQRDbRAbjJpgSOo3i5DA9fA/xgtuP5B0+UdJk=;
        b=Su9FDuDes0X3X+TjP/iFyuKadFKlUwqijv57aTsmA0JCs+66fzvNHuSSC7nfRK369i
         w/T2kcBeZUHex8AoSE32Ak9DzuLqZhTgUbWEEXqXZi/YwBVum6Gje+94nN1Ug1lDPnuz
         hZvDwOqbpunORiVAXiIGw1TWaBXpQcgr1YoYoNjH8fAikd2M7sUc2OHkmF1kSQt9TXXq
         xajag20Z7bqXHN1vWqNyYHFAWFUB5zKOwpRee4ANrtiJww67q7m0E0bctS0rWG3uVHtr
         U59lqx55ixrYirgu1DQwtj7FHqILxH52YnJm3XEH8WCFFTlf27gEFHfOTdwa7+PlNe6b
         6iQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mCJI6Sbp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p32si18270546qtj.143.2017.09.14.08.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 08:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mCJI6Sbp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsWAP-0000tz-TU
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 11:35:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dsWA9-0000qN-85
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 11:34:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dsWA3-0002D3-Vl
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 11:34:45 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:51333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dsW9y-00026l-S4; Thu, 14 Sep 2017 11:34:35 -0400
Received: by mail-vk0-x232.google.com with SMTP id g68so338189vki.8;
	Thu, 14 Sep 2017 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NtIZs0OQRDbRAbjJpgSOo3i5DA9fA/xgtuP5B0+UdJk=;
	b=mCJI6Sbp6dM1BWQj8Oz8Yaae99omHU9e5hnocdzNZoZ8LJhF8RSnUMwgIj/uTBaNqX
	Prt7twWSIySRn+lV1PJGXVOl6kuUaH4V5/LLbF3pk02YesB1YNz80wv9/1xP2NeMV2Cj
	mLC78ol1ajNDaYg4OfoRhNfKsHVlOeLSnTuFpOEP7friLDS5jAZc71sD7UTB1K2kx+5u
	ry39wAOJcBbTvfSmmHNh/4iuXD2sOOzyEJcZRixP9ewR0Opm0Lt80ONtdw5FyfuYUeRq
	aS0qef6ewQCo0AwVACWhG3skD6Pobwp2zlMUFMYfLgDElR5pzdPN5HZAqojRTguPctX1
	FmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NtIZs0OQRDbRAbjJpgSOo3i5DA9fA/xgtuP5B0+UdJk=;
	b=TS1bNnSu434uUGL8VBagJ5Ci++gT+Cy8C3f38HQk7H9eIAS4gqZZprMn1FLfMt7Sj6
	R8bU9mI6teUozhZO0Zf4Ebe1V5Zni2i6H4sxmqPS65cW8kEmhJfrpwt7gFNgr9FlcFps
	781SpxrCeGm6dvUDcSc8As+p2Be8LK5K2iCR20RVH5TJRyIiaxmydBhpohnFze68Laf6
	q1VkANnUsxARvcAFVVSevHHrafmCbZqi/pfLgjdMmTVsXmgVvNe8216+s+4yzogrt9ud
	cnuveRoibh3r1NyzkzxKRrQ1wiSfvU3VXbI7vVu25spkkn32zBOZb4uVz8OZqGGn+st3
	aj9w==
X-Gm-Message-State: AHPjjUigw6H8EFpUkUlrGxIAc+pcVrFyvoJbJ1NzdbCHBp8Kxho9r9BE
	v9Qwg3hPVRdfjEIgbZA27U0yHzFB3HB7MI/kFK4=
X-Google-Smtp-Source: AOwi7QASeQ47Y0p5BXvSz51FbfcmgfounL5QZMabgWSxLcThsiqqIky8W3i6+36qPj9g/Bg5Bvng0+D71vvM63IhCkA=
X-Received: by 10.31.185.209 with SMTP id j200mr16570820vkf.198.1505403274182; 
	Thu, 14 Sep 2017 08:34:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Thu, 14 Sep 2017 08:34:33 -0700 (PDT)
In-Reply-To: <a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-3-git-send-email-sundeep.lkml@gmail.com>
	<a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 14 Sep 2017 21:04:33 +0530
Message-ID: <CALHRZuqSSc6bj0rpHNAncK302LxA8bk4b1EiSkLyreF20aQorw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a1143a0bc66c62a055928034b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BhWAmP5iy4S/

--001a1143a0bc66c62a055928034b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Thu, Sep 14, 2017 at 10:06 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
wrote:

> Hi Sundeep,
>
>
> On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
>
>> Added Sytem register block of Smartfusion2.
>> This block has PLL registers which are accessed by guest.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>   hw/misc/Makefile.objs         |   1 +
>>   hw/misc/msf2-sysreg.c         | 195 ++++++++++++++++++++++++++++++
>> ++++++++++++
>>   include/hw/misc/msf2-sysreg.h |  78 +++++++++++++++++
>>   3 files changed, 274 insertions(+)
>>   create mode 100644 hw/misc/msf2-sysreg.c
>>   create mode 100644 include/hw/misc/msf2-sysreg.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 29fb922..e8f0a02 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>>   obj-$(CONFIG_AUX) +=3D auxbus.o
>>   obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
>>   obj-y +=3D mmio_interface.o
>> +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o
>> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>> new file mode 100644
>> index 0000000..40d603d
>> --- /dev/null
>> +++ b/hw/misc/msf2-sysreg.c
>> @@ -0,0 +1,195 @@
>> +/*
>> + * System Register block model of Microsemi SmartFusion2.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> along
>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "hw/misc/msf2-sysreg.h"
>> +
>> +#ifndef MSF2_SYSREG_ERR_DEBUG
>> +#define MSF2_SYSREG_ERR_DEBUG  0
>> +#endif
>> +
>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> +    if (MSF2_SYSREG_ERR_DEBUG >=3D lvl) { \
>> +        qemu_log("%s: " fmt "\n", __func__, ## args); \
>> +    } \
>> +} while (0);
>> +
>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> +
>> +static inline int msf2_divbits(uint32_t div)
>>
>
> Please directly use ctz32() instead of msf2_divbits()
>
> ctz32() will not work for input 8,16,32 so need to use msf2_divbits().

>
> +{
>> +    int ret =3D 0;
>> +
>> +    switch (div) {
>> +    case 1:
>> +        ret =3D 0;
>> +        break;
>> +    case 2:
>> +        ret =3D 1;
>> +        break;
>> +    case 4:
>> +        ret =3D 2;
>> +        break;
>> +    case 8:
>> +        ret =3D 4;
>> +        break;
>> +    case 16:
>> +        ret =3D 5;
>> +        break;
>> +    case 32:
>> +        ret =3D 6;
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void msf2_sysreg_reset(DeviceState *d)
>> +{
>> +    MSF2SysregState *s =3D MSF2_SYSREG(d);
>> +
>> +    DB_PRINT("RESET");
>> +
>> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] =3D 0x021A2358;
>> +    s->regs[MSSDDR_PLL_STATUS] =3D 0x3;
>> +    s->regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s->apb0div) << 5 |
>> +                               msf2_divbits(s->apb1div) << 2;
>> +}
>> +
>> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>> +    unsigned size)
>> +{
>> +    MSF2SysregState *s =3D opaque;
>> +    uint32_t ret =3D 0;
>> +
>> +    offset >>=3D 2;
>> +    if (offset < ARRAY_SIZE(s->regs)) {
>>
>
> This comment is controversial, I'll let Peter nod.
>
> The SYSREG behaves differently regarding which bus access it (CPU, AHB).
> You are implementing CPU access to the SYSREG, the registers have
> different permissions when accessed by the CPU. (see the SmartFusion2 Use=
r
> Guide: Table 21-1 "Register Types" and Table 21-2 "Register Map").
>
> I'd think of this stub:
>
> switch(reg) {
> case register_supported1:
> case register_supported2:
> case register_supported3:
>            ret =3D s->regs[offset];
>            trace_msf2_sysreg_read(offset, ret);
>            break;
> case RO-U:
>            qemu_log_mask(LOG_GUEST_ERROR, "Illegal AHB access 0x%08"...
>            break;
> case W1P:
>            qemu_log_mask(LOG_GUEST_ERROR, "Illegal read access ...
>            break;
> case RW:
> case RW-P:
> case RO:
> case RO-P:
> default:
>            ret =3D s->regs[offset];
>            qemu_log_mask(LOG_UNIMP, "...
>            break;
> }
>
> Anyway keep this comment for further improvements, it's probably not
> useful for your use case.


Sure will remember this comment and fix it later.

>
>
> +        ret =3D s->regs[offset];
>> +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
>> +                    offset << 2, ret);
>>
>
> Can you replace DB_PRINT by traces? such:
>
>            trace_msf2_sysreg_read(...);


Ok

>
>
> +    } else {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
>> +                    offset << 2);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>> +                          uint64_t val, unsigned size)
>> +{
>> +    MSF2SysregState *s =3D opaque;
>> +    uint32_t newval =3D val;
>> +
>> +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
>> +            offset, val);
>> +
>> +    offset >>=3D 2;
>> +
>> +    switch (offset) {
>> +    case MSSDDR_PLL_STATUS:
>>
>            trace_msf2_sysreg_write_pll_status();
>
> +        break;
>> +
>> +    case ESRAM_CR:
>> +        if (newval !=3D s->regs[ESRAM_CR]) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>
>
> Since this isn't a guest error, use LOG_UNIMP instead.
>
> Ok

> +                       TYPE_MSF2_SYSREG": eSRAM remapping not
>> supported\n");
>> +        }
>> +        break;
>> +
>> +    case DDR_CR:
>> +        if (newval !=3D s->regs[DDR_CR]) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>
>
> LOG_UNIMP
>
> Ok

> +                       TYPE_MSF2_SYSREG": DDR remapping not supported\n"=
);
>> +        }
>> +        break;
>> +
>> +    case ENVM_REMAP_BASE_CR:
>> +        if (newval !=3D s->regs[ENVM_REMAP_BASE_CR]) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>
>
> LOG_UNIMP
>
> Ok

> +                       TYPE_MSF2_SYSREG": eNVM remapping not
>> supported\n");
>> +        }
>> +        break;
>> +
>>
>
> Or shorter:
>
>     case ESRAM_CR:
>     case DDR_CR:
>     case ENVM_REMAP_BASE_CR:
>          oldval =3D s->regs[offset];
>          if (oldval ^ newval) {
>              qemu_log_mask(LOG_UNIMP,
>                         TYPE_MSF2_SYSREG": remapping not supported\n");
>          }
>          break;
>
> Ok

>
> +    default:
>> +        if (offset < ARRAY_SIZE(s->regs)) {
>>
>
>            trace_msf2_sysreg_write(offset, val, s->regs[offset]);
>
> +            s->regs[offset] =3D newval;
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
>> __func__,
>> +                        offset << 2);
>> +        }
>> +        break;
>> +    }
>> +}
>>
>
> Good work, almost there, next respin should be ready for Peter to take in
> arm-next :)
>
> Thank you,
Sundeep


> Regards,
>
> Phil.
>

--001a1143a0bc66c62a055928034b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Thu, Sep 14, 2017 at 10:06 AM, Philippe Mathieu-Daud=C3=A9 <=
span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f=
4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi S=
undeep,<div><div class=3D"h5"><br>
<br>
On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Added Sytem register block of Smartfusion2.<br>
This block has PLL registers which are accessed by guest.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xilinx=
.com" target=3D"_blank">alistair.francis@xilinx.com</a>&gt;<br>
---<br>
=C2=A0 hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0 hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 195 +++++++=
+++++++++++++++++++++++<wbr>++++++++++++<br>
=C2=A0 include/hw/misc/msf2-sysreg.h |=C2=A0 78 +++++++++++++++++<br>
=C2=A0 3 files changed, 274 insertions(+)<br>
=C2=A0 create mode 100644 hw/misc/msf2-sysreg.c<br>
=C2=A0 create mode 100644 include/hw/misc/msf2-sysreg.h<br>
<br>
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br>
index 29fb922..e8f0a02 100644<br>
--- a/hw/misc/Makefile.objs<br>
+++ b/hw/misc/Makefile.objs<br>
@@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o<br>
=C2=A0 obj-$(CONFIG_AUX) +=3D auxbus.o<br>
=C2=A0 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o<br>
=C2=A0 obj-y +=3D mmio_interface.o<br>
+obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o<br>
diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c<br>
new file mode 100644<br>
index 0000000..40d603d<br>
--- /dev/null<br>
+++ b/hw/misc/msf2-sysreg.c<br>
@@ -0,0 +1,195 @@<br>
+/*<br>
+ * System Register block model of Microsemi SmartFusion2.<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or<br>
+ * modify it under the terms of the GNU General Public License<br>
+ * as published by the Free Software Foundation; either version<br>
+ * 2 of the License, or (at your option) any later version.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"http://www.gnu.org/licens=
es/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&=
gt;<wbr>.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
+<br>
+#ifndef MSF2_SYSREG_ERR_DEBUG<br>
+#define MSF2_SYSREG_ERR_DEBUG=C2=A0 0<br>
+#endif<br>
+<br>
+#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
+=C2=A0 =C2=A0 if (MSF2_SYSREG_ERR_DEBUG &gt;=3D lvl) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt &quot;\n&quot;, =
__func__, ## args); \<br>
+=C2=A0 =C2=A0 } \<br>
+} while (0);<br>
+<br>
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>
+<br>
+static inline int msf2_divbits(uint32_t div)<br>
</blockquote>
<br></div></div>
Please directly use ctz32() instead of msf2_divbits()<div><div class=3D"h5"=
><br></div></div></blockquote><div>ctz32() will not work for input 8,16,32 =
so need to use msf2_divbits().=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv><div class=3D"h5">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 int ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 switch (div) {<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 16:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 5;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 32:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 6;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void msf2_sysreg_reset(DeviceState *d)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(d);<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;RESET&quot;);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS_LOW_<wbr>CR] =3D 0x021A2358;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS] =3D 0x3;<br>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s-&gt;apb0div) =
&lt;&lt; 5 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msf2_divbits(s-&gt;apb1div) &lt;&lt; =
2;<br>
+}<br>
+<br>
+static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 offset &gt;&gt;=3D 2;<br>
+=C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
</blockquote>
<br></div></div>
This comment is controversial, I&#39;ll let Peter nod.<br>
<br>
The SYSREG behaves differently regarding which bus access it (CPU, AHB).<br=
>
You are implementing CPU access to the SYSREG, the registers have different=
 permissions when accessed by the CPU. (see the SmartFusion2 User Guide: Ta=
ble 21-1 &quot;Register Types&quot; and Table 21-2 &quot;Register Map&quot;=
).<br>
<br>
I&#39;d think of this stub:<br>
<br>
switch(reg) {<br>
case register_supported1:<br>
case register_supported2:<br>
case register_supported3:<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;regs[offset];<br></s=
pan>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_msf2_sysreg_read(<wbr>offset=
, ret);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
case RO-U:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_<wbr>ERROR=
, &quot;Illegal AHB access 0x%08&quot;...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
case W1P:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_<wbr>ERROR=
, &quot;Illegal read access ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
case RW:<br>
case RW-P:<br>
case RO:<br>
case RO-P:<br>
default:<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&gt;regs[offset];<br></s=
pan>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;...=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
}<br>
<br>
Anyway keep this comment for further improvements, it&#39;s probably not us=
eful for your use case.</blockquote><div><br></div><div>Sure will remember =
this comment and fix it later. =C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[offset];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;addr: 0x%08&quot; HWADDR_PRIx &=
quot; data: 0x%08&quot; PRIx32,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offs=
et &lt;&lt; 2, ret);<br>
</blockquote>
<br></span>
Can you replace DB_PRINT by traces? such:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_msf2_sysreg_read(...);</bloc=
kquote><div><br></div><div>Ok=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offs=
et &lt;&lt; 2);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void msf2_sysreg_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint64_t val, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t newval =3D val;<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;addr: 0x%08&quot; HWADDR_PRIx &quot; data: 0x=
%08&quot; PRIx64,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset, val);<br>
+<br>
+=C2=A0 =C2=A0 offset &gt;&gt;=3D 2;<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case MSSDDR_PLL_STATUS:<br>
</blockquote></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_msf2_sysreg_write_pll_s<wbr>=
tatus();<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case ESRAM_CR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newval !=3D s-&gt;regs[ESRAM_CR]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
</blockquote>
<br></span>
Since this isn&#39;t a guest error, use LOG_UNIMP instead.<span class=3D"">=
<br>
<br></span></blockquote><div>Ok=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: eSRAM remapping not supported\n&quot;);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case DDR_CR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newval !=3D s-&gt;regs[DDR_CR]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
</blockquote>
<br></span>
LOG_UNIMP<span class=3D""><br>
<br></span></blockquote><div>Ok=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: DDR remapping not supported\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case ENVM_REMAP_BASE_CR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newval !=3D s-&gt;regs[ENVM_REMAP_BASE_CR]=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
</blockquote>
<br></span>
LOG_UNIMP<span class=3D""><br>
<br></span></blockquote><div>Ok=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: eNVM remapping not supported\n&quot;);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
</blockquote>
<br></span>
Or shorter:<br>
<br>
=C2=A0 =C2=A0 case ESRAM_CR:<br>
=C2=A0 =C2=A0 case DDR_CR:<br>
=C2=A0 =C2=A0 case ENVM_REMAP_BASE_CR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oldval =3D s-&gt;regs[offset];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (oldval ^ newval) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 TYPE_MSF2_SYSREG&quot;: remapping not supported\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<span class=3D""><br>
<br></span></blockquote><div>Ok=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
</blockquote>
<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_msf2_sysreg_write(offse<wbr>=
t, val, s-&gt;regs[offset]);<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[offset] =3D newval;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;, __f=
unc__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 offset &lt;&lt; 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
</blockquote>
<br></span>
Good work, almost there, next respin should be ready for Peter to take in a=
rm-next :)<br>
<br></blockquote><div>Thank you,</div><div>Sundeep</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br></div></div>

--001a1143a0bc66c62a055928034b--
