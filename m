Received: by 10.25.15.197 with SMTP id 66csp597890lfp;
        Sat, 24 Jun 2017 05:48:35 -0700 (PDT)
X-Received: by 10.55.138.66 with SMTP id m63mr4432108qkd.26.1498308515260;
        Sat, 24 Jun 2017 05:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498308515; cv=none;
        d=google.com; s=arc-20160816;
        b=oGVoHmjjvAd1HZD4dvo2aMOBMrFCrVk+3JT423OgOmw7VL47soHp2LC42qLUzIXGrb
         e0XXi6+zSIy+QUmGGYVVsWSk+eRsi5D40NWriWOL+K5/SGX6XmFdGetb5NBeJQjl7Y8D
         pP9hJwrRfW7sjqOHWxfeeoneMYwRPxD6Yo7EntFF6RW8Af52clmbdqPUoy3PniVy1imW
         6HXFBeIhSGPs6dhK2gUXymd+n0jTuWVhb+Qn66KYpIfYcxgV1apfrbmTnAI9uEVEzJrh
         1OLxm2utNa66bri6JlBcP9wCvoaN00j5nPvQFIyVaL4g7X2TULNSPBLLyDmwv+2RqNZV
         KDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=AoGeMs8ZTJfNGE+SxYI0Q7cC27Z+JSiIyDx0tJHREa4=;
        b=GX8Qx/oaYc1QONI64Buw/JqNACzHSoNzZtcn4RA3loW2CdgsP6Mqx6uxwiuG09QTcH
         IDRUwesNSv8RbMamvMiZUZkb81kkQh5gEbCuJkhKH6/Vd6kR0EyXGMj0xiWfbZt3503x
         32ub569yg+IJsuQS1atwgUphYlOLsuN1FvzcGf8bARiUnVHwqD7uRTV3xvC0sZeyxD9g
         v5qAVrbPwYVu6CIkw0rhuZ+HSZMznRBTktdGWBgTrR5dBn+VV71x9RkqFFfUetO8gUEx
         yo1A5hv5wDtBH3P30FjN9po3hrMqutUdpW2PDbqExRXLVXq2MFmRFwUVn6pAtDy1vXOI
         gJUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GZG2kiUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si6376008qtv.343.2017.06.24.05.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Jun 2017 05:48:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GZG2kiUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dOkUK-0007Wz-D4
	for alex.bennee@linaro.org; Sat, 24 Jun 2017 08:48:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dOkU6-0007V2-D2
	for qemu-arm@nongnu.org; Sat, 24 Jun 2017 08:48:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dOkU4-0002WI-0F
	for qemu-arm@nongnu.org; Sat, 24 Jun 2017 08:48:18 -0400
Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244]:36831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dOkTw-0002J7-17; Sat, 24 Jun 2017 08:48:08 -0400
Received: by mail-yw0-x244.google.com with SMTP id s127so4105013ywg.3;
	Sat, 24 Jun 2017 05:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AoGeMs8ZTJfNGE+SxYI0Q7cC27Z+JSiIyDx0tJHREa4=;
	b=GZG2kiUi3xiVhsZ48xULh2ulSc2B+ieIC02T2EdYuzUFLOT5XPF9KzWgjO6HBxRdPd
	7aU7iD5llHZi+VINAWDObqc4Dkc86gAqQZE65jqDBPN5rCif4oJxLd61GxDK3fsx+KJQ
	enUH/SVoqUKnGP751zabc1S+drrXutDRKOKFv0MgJHGzlqRjiNfMTQToSdzAxGPBYokh
	+hK2BN1Lp36cKqfvWOdqv145zFMY83EcMbRGajc7OKDJsDXNDyNzMiPb2N5sn0WelqyE
	LoNjlEvGeVQZ7UWqE2pk9LnR+ljhZ4tSDDgb2xaY47/EspPR8otAMDyDRMpFLfkdez7F
	qS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AoGeMs8ZTJfNGE+SxYI0Q7cC27Z+JSiIyDx0tJHREa4=;
	b=nLqZpOEEt0hQf4F9iH1yW833iLk2wcyY+n7MNBoYKx88WD0Y9iiGWYG6uOT0xeE7j7
	7ViYbQ0YS0rpqUVRCxBEm8l+aiAp1SYCpvBqAK21pO8LRWvHUP/mXsFoX6CVfvMx2Nra
	LzIXmIQ6D+Qi/P4LgWGLwWi5vMhjjoL7OsSNa1qvtHoUOtdVq5f1ma+Ufg6t8veXvgWJ
	PHRoc7TzGbwHNgPhbvw1GEVLu+7OWN1YgI0iNg+MhNSZK1RHRMZpfXagbxYTd28236+F
	m6PL2V4SSKmTv6ho9tmk7iiEoDKa6ArlYj4HNox1Kn1OTW/dsGrq63dH/c0pzymwBJII
	vPrg==
X-Gm-Message-State: AKS2vOyFBvG14R8dNh0Vh7tKKsKBACB7ArLPNRThASy4WVf3UuwRSvA1
	SlTsAZTpF8ebjKO5316jAJgEZ6PyRg==
X-Received: by 10.13.209.194 with SMTP id t185mr8961057ywd.167.1498308487199; 
	Sat, 24 Jun 2017 05:48:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.65 with HTTP; Sat, 24 Jun 2017 05:48:06 -0700 (PDT)
In-Reply-To: <0fcc007c-c308-38bc-02c8-045ad1330dc1@amsat.org>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-3-git-send-email-sundeep.lkml@gmail.com>
	<0fcc007c-c308-38bc-02c8-045ad1330dc1@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Sat, 24 Jun 2017 18:18:06 +0530
Message-ID: <CALHRZur0p6TGQ3CG3kFFK9SXPECPhesP59sEXKDgB47AwS8MhA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a114e3f4e24e8af0552b421c6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::244
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block.
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
X-TUID: zW72ZC/UmUwI

--001a114e3f4e24e8af0552b421c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Tue, May 30, 2017 at 6:21 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Subbaraya,
>
> This patch looks good.
>
>
> On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>
>> Added Sytem register block of Smartfusion2.
>> This block has PLL registers which are accessed by guest.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  hw/misc/Makefile.objs         |   1 +
>>  hw/misc/msf2-sysreg.c         | 161 ++++++++++++++++++++++++++++++
>> ++++++++++++
>>  include/hw/misc/msf2-sysreg.h |  80 +++++++++++++++++++++
>>  3 files changed, 242 insertions(+)
>>  create mode 100644 hw/misc/msf2-sysreg.c
>>  create mode 100644 include/hw/misc/msf2-sysreg.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index c8b4893..0f52354 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) +=3D edu.o
>>  obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>>  obj-$(CONFIG_AUX) +=3D auxbus.o
>>  obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
>> +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o
>> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>> new file mode 100644
>> index 0000000..8d3118f
>> --- /dev/null
>> +++ b/hw/misc/msf2-sysreg.c
>> @@ -0,0 +1,161 @@
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
>> +#include "hw/misc/msf2-sysreg.h"
>> +
>> +#ifndef MSF2_SYSREG_ERR_DEBUG
>> +#define MSF2_SYSREG_ERR_DEBUG  0
>> +#endif
>> +
>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> +    if (MSF2_SYSREG_ERR_DEBUG >=3D lvl) { \
>> +        qemu_log("%s: " fmt, __func__, ## args); \
>> +    } \
>> +} while (0);
>> +
>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> +
>> +static void msf2_sysreg_reset(DeviceState *d)
>> +{
>> +    MSF2SysregState *s =3D MSF2_SYSREG(d);
>> +
>> +    DB_PRINT("RESET\n");
>> +
>> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] =3D 0x021A2358;
>> +    s->regs[MSSDDR_FACC1_CR] =3D 0x0B800124;
>> +    s->regs[MSSDDR_PLL_STATUS] =3D 0x3;
>>
>
> I'll have a closer look a those values.


I just used values from real hardware board.

>
>
> +}
>> +
>> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>> +    unsigned size)
>> +{
>> +    MSF2SysregState *s =3D opaque;
>> +    offset /=3D 4;
>> +    uint32_t ret =3D 0;
>> +
>> +    if (offset < ARRAY_SIZE(s->regs)) {
>> +        ret =3D s->regs[offset];
>> +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32 "\n",
>> +                    offset * 4, ret);
>> +    } else {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
>> +                    offset * 4);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>> +                          uint64_t val, unsigned size)
>> +{
>> +    MSF2SysregState *s =3D (MSF2SysregState *)opaque;
>> +    uint32_t newval =3D val;
>> +    uint32_t oldval;
>> +
>> +    offset /=3D 4;
>> +
>> +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64 "\n",
>> +            offset * 4, val);
>> +
>> +    switch (offset) {
>> +    case MSSDDR_PLL_STATUS:
>> +        break;
>> +
>> +    case ESRAM_CR:
>> +        oldval =3D s->regs[ESRAM_CR];
>> +        if (oldval ^ newval) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                       TYPE_MSF2_SYSREG": eSRAM remapping not
>> supported\n");
>> +            abort();
>> +        }
>> +        break;
>> +
>> +    case DDR_CR:
>> +        oldval =3D s->regs[DDR_CR];
>> +        if (oldval ^ newval) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                       TYPE_MSF2_SYSREG": DDR remapping not
>> supported\n");
>> +            abort();
>> +        }
>> +        break;
>> +
>> +    case ENVM_REMAP_BASE_CR:
>> +        oldval =3D s->regs[ENVM_REMAP_BASE_CR];
>> +        if (oldval ^ newval) {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                       TYPE_MSF2_SYSREG": eNVM remapping not
>> supported\n");
>> +            abort();
>> +        }
>> +        break;
>>
>
> Thanks for adding the remap checks :)
>
> :)

>
> +
>> +    default:
>> +        if (offset < ARRAY_SIZE(s->regs)) {
>> +            s->regs[offset] =3D val;
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
>> __func__,
>> +                        offset * 4);
>> +        }
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps sysreg_ops =3D {
>> +    .read =3D msf2_sysreg_read,
>> +    .write =3D msf2_sysreg_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static void msf2_sysreg_init(Object *obj)
>> +{
>> +    MSF2SysregState *s =3D MSF2_SYSREG(obj);
>> +
>> +    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s,
>> TYPE_MSF2_SYSREG,
>> +                          MSF2_SYSREG_MMIO_SIZE);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
>> +}
>> +
>> +static const VMStateDescription vmstate_msf2_sysreg =3D {
>> +    .name =3D TYPE_MSF2_SYSREG,
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState,
>> MSF2_SYSREG_NUM_REGS),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->vmsd =3D &vmstate_msf2_sysreg;
>> +    dc->reset =3D msf2_sysreg_reset;
>> +}
>> +
>> +static const TypeInfo msf2_sysreg_info =3D {
>> +    .name  =3D TYPE_MSF2_SYSREG,
>> +    .parent =3D TYPE_SYS_BUS_DEVICE,
>> +    .class_init =3D msf2_sysreg_class_init,
>> +    .instance_size  =3D sizeof(MSF2SysregState),
>> +    .instance_init =3D msf2_sysreg_init,
>> +};
>> +
>> +static void msf2_sysreg_register_types(void)
>> +{
>> +    type_register_static(&msf2_sysreg_info);
>> +}
>> +
>> +type_init(msf2_sysreg_register_types)
>> diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg=
.
>> h
>> new file mode 100644
>> index 0000000..a485ed6
>> --- /dev/null
>> +++ b/include/hw/misc/msf2-sysreg.h
>> @@ -0,0 +1,80 @@
>> +/*
>> + * Microsemi SmartFusion2 SYSREG
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef HW_MSF2_SYSREG_H
>> +#define HW_MSF2_SYSREG_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/hw.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qemu/log.h"
>> +
>> +enum {
>> +    ESRAM_CR        =3D 0x00 / 4,
>> +    ESRAM_MAX_LAT,
>> +    DDR_CR,
>> +    ENVM_CR,
>> +    ENVM_REMAP_BASE_CR,
>> +    ENVM_REMAP_FAB_CR,
>> +    CC_CR,
>> +    CC_REGION_CR,
>> +    CC_LOCK_BASE_ADDR_CR,
>> +    CC_FLUSH_INDX_CR,
>> +    DDRB_BUF_TIMER_CR,
>> +    DDRB_NB_ADDR_CR,
>> +    DDRB_NB_SIZE_CR,
>> +    DDRB_CR,
>> +
>> +    SOFT_RESET_CR  =3D 0x48 / 4,
>> +    M3_CR,
>> +
>> +    GPIO_SYSRESET_SEL_CR =3D 0x58 / 4,
>> +
>> +    MDDR_CR =3D 0x60 / 4,
>> +
>> +    MSSDDR_PLL_STATUS_LOW_CR =3D 0x90 / 4,
>> +    MSSDDR_PLL_STATUS_HIGH_CR,
>> +    MSSDDR_FACC1_CR,
>> +    MSSDDR_FACC2_CR,
>> +
>> +    MSSDDR_PLL_STATUS =3D 0x150 / 4,
>> +
>> +};
>> +
>> +#define MSF2_SYSREG_MMIO_SIZE     0x300
>> +#define MSF2_SYSREG_NUM_REGS      (MSF2_SYSREG_MMIO_SIZE / 4)
>>
>
> I don't think this define is very useful.
>

It is used in VMSTATE_UINT32_ARRAY(regs, MSF2SysregState,
MSF2_SYSREG_NUM_REGS).
Ok I will use MSF2_SYSREG_MMIO_SIZE / 4 directly instead.

>
> +
>> +#define TYPE_MSF2_SYSREG          "msf2-sysreg"
>> +#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj),
>> TYPE_MSF2_SYSREG)
>> +
>> +typedef struct MSF2SysregState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +
>> +    uint32_t regs[MSF2_SYSREG_NUM_REGS];
>> +} MSF2SysregState;
>> +
>> +#endif /* HW_MSF2_SYSREG_H */
>>
>>
> Thanks,
Sundeep


> Regards,
>
> Phil.
>

--001a114e3f4e24e8af0552b421c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, May 30, 2017 at 6:21 PM, Philippe Mathieu-Daud=C3=
=A9 <span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_bla=
nk">f4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Subbaraya,<br>
<br>
This patch looks good.<div><div class=3D"gmail-h5"><br>
<br>
On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Added Sytem register block of Smartfusion2.<br>
This block has PLL registers which are accessed by guest.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
=C2=A0hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 161 ++++++++=
++++++++++++++++++++++<wbr>++++++++++++<br>
=C2=A0include/hw/misc/msf2-sysreg.h |=C2=A0 80 +++++++++++++++++++++<br>
=C2=A03 files changed, 242 insertions(+)<br>
=C2=A0create mode 100644 hw/misc/msf2-sysreg.c<br>
=C2=A0create mode 100644 include/hw/misc/msf2-sysreg.h<br>
<br>
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br>
index c8b4893..0f52354 100644<br>
--- a/hw/misc/Makefile.objs<br>
+++ b/hw/misc/Makefile.objs<br>
@@ -56,3 +56,4 @@ obj-$(CONFIG_EDU) +=3D edu.o<br>
=C2=A0obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o<br>
=C2=A0obj-$(CONFIG_AUX) +=3D auxbus.o<br>
=C2=A0obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o<br>
+obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o<br>
diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c<br>
new file mode 100644<br>
index 0000000..8d3118f<br>
--- /dev/null<br>
+++ b/hw/misc/msf2-sysreg.c<br>
@@ -0,0 +1,161 @@<br>
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
+#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
+<br>
+#ifndef MSF2_SYSREG_ERR_DEBUG<br>
+#define MSF2_SYSREG_ERR_DEBUG=C2=A0 0<br>
+#endif<br>
+<br>
+#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
+=C2=A0 =C2=A0 if (MSF2_SYSREG_ERR_DEBUG &gt;=3D lvl) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt, __func__, ## ar=
gs); \<br>
+=C2=A0 =C2=A0 } \<br>
+} while (0);<br>
+<br>
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>
+<br>
+static void msf2_sysreg_reset(DeviceState *d)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(d);<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;RESET\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS_LOW_<wbr>CR] =3D 0x021A2358;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_FACC1_CR] =3D 0x0B800124;<br>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS] =3D 0x3;<br>
</blockquote>
<br></div></div>
I&#39;ll have a closer look a those values.</blockquote><div><br></div><div=
>I just used values from real hardware board. <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D opaque;<br>
+=C2=A0 =C2=A0 offset /=3D 4;<br>
+=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[offset];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;addr: 0x%08&quot; HWADDR_PRIx &=
quot; data: 0x%08&quot; PRIx32 &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offs=
et * 4, ret);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offs=
et * 4);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void msf2_sysreg_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint64_t val, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D (MSF2SysregState *)opaque;<br>
+=C2=A0 =C2=A0 uint32_t newval =3D val;<br>
+=C2=A0 =C2=A0 uint32_t oldval;<br>
+<br>
+=C2=A0 =C2=A0 offset /=3D 4;<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;addr: 0x%08&quot; HWADDR_PRIx &quot; data: 0x=
%08&quot; PRIx64 &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset * 4, val);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case MSSDDR_PLL_STATUS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case ESRAM_CR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldval =3D s-&gt;regs[ESRAM_CR];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldval ^ newval) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: eSRAM remapping not supported\n&quot;);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case DDR_CR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldval =3D s-&gt;regs[DDR_CR];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldval ^ newval) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: DDR remapping not supported\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case ENVM_REMAP_BASE_CR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldval =3D s-&gt;regs[ENVM_REMAP_BASE_CR];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldval ^ newval) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: eNVM remapping not supported\n&quot;);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
</blockquote>
<br></div></div>
Thanks for adding the remap checks :)<div><div class=3D"gmail-h5"><br></div=
></div></blockquote><div>:) <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div><div class=3D"gmail-h5">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[offset] =3D val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;, __f=
unc__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 offset * 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps sysreg_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D msf2_sysreg_read,<br>
+=C2=A0 =C2=A0 .write =3D msf2_sysreg_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+};<br>
+<br>
+static void msf2_sysreg_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(obj);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iome<wbr>m, obj, &amp;sysre=
g_ops, s, TYPE_MSF2_SYSREG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MSF2_SYSREG_MMIO_SIZE);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVIC<wbr>E(obj), &amp;s-&gt;iomem)=
;<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_msf2_sysreg =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_MSF2_SYSREG,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, MSF2SysregState, MS=
F2_SYSREG_NUM_REGS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void msf2_sysreg_class_init(ObjectC<wbr>lass *klass, void *data)<br=
>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_msf2_sysreg;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D msf2_sysreg_reset;<br>
+}<br>
+<br>
+static const TypeInfo msf2_sysreg_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =3D TYPE_MSF2_SYSREG,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_SYS_BUS_DEVICE,<br>
+=C2=A0 =C2=A0 .class_init =3D msf2_sysreg_class_init,<br>
+=C2=A0 =C2=A0 .instance_size=C2=A0 =3D sizeof(MSF2SysregState),<br>
+=C2=A0 =C2=A0 .instance_init =3D msf2_sysreg_init,<br>
+};<br>
+<br>
+static void msf2_sysreg_register_types(voi<wbr>d)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;msf2_sys<wbr>reg_info);<br>
+}<br>
+<br>
+type_init(msf2_sysreg_registe<wbr>r_types)<br>
diff --git a/include/hw/misc/msf2-sysreg.<wbr>h b/include/hw/misc/msf2-sysr=
eg.<wbr>h<br>
new file mode 100644<br>
index 0000000..a485ed6<br>
--- /dev/null<br>
+++ b/include/hw/misc/msf2-sysreg.<wbr>h<br>
@@ -0,0 +1,80 @@<br>
+/*<br>
+ * Microsemi SmartFusion2 SYSREG<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#ifndef HW_MSF2_SYSREG_H<br>
+#define HW_MSF2_SYSREG_H<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/hw.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+<br>
+enum {<br>
+=C2=A0 =C2=A0 ESRAM_CR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00 / 4,<br>
+=C2=A0 =C2=A0 ESRAM_MAX_LAT,<br>
+=C2=A0 =C2=A0 DDR_CR,<br>
+=C2=A0 =C2=A0 ENVM_CR,<br>
+=C2=A0 =C2=A0 ENVM_REMAP_BASE_CR,<br>
+=C2=A0 =C2=A0 ENVM_REMAP_FAB_CR,<br>
+=C2=A0 =C2=A0 CC_CR,<br>
+=C2=A0 =C2=A0 CC_REGION_CR,<br>
+=C2=A0 =C2=A0 CC_LOCK_BASE_ADDR_CR,<br>
+=C2=A0 =C2=A0 CC_FLUSH_INDX_CR,<br>
+=C2=A0 =C2=A0 DDRB_BUF_TIMER_CR,<br>
+=C2=A0 =C2=A0 DDRB_NB_ADDR_CR,<br>
+=C2=A0 =C2=A0 DDRB_NB_SIZE_CR,<br>
+=C2=A0 =C2=A0 DDRB_CR,<br>
+<br>
+=C2=A0 =C2=A0 SOFT_RESET_CR=C2=A0 =3D 0x48 / 4,<br>
+=C2=A0 =C2=A0 M3_CR,<br>
+<br>
+=C2=A0 =C2=A0 GPIO_SYSRESET_SEL_CR =3D 0x58 / 4,<br>
+<br>
+=C2=A0 =C2=A0 MDDR_CR =3D 0x60 / 4,<br>
+<br>
+=C2=A0 =C2=A0 MSSDDR_PLL_STATUS_LOW_CR =3D 0x90 / 4,<br>
+=C2=A0 =C2=A0 MSSDDR_PLL_STATUS_HIGH_CR,<br>
+=C2=A0 =C2=A0 MSSDDR_FACC1_CR,<br>
+=C2=A0 =C2=A0 MSSDDR_FACC2_CR,<br>
+<br>
+=C2=A0 =C2=A0 MSSDDR_PLL_STATUS =3D 0x150 / 4,<br>
+<br>
+};<br>
+<br>
+#define MSF2_SYSREG_MMIO_SIZE=C2=A0 =C2=A0 =C2=A00x300<br>
+#define MSF2_SYSREG_NUM_REGS=C2=A0 =C2=A0 =C2=A0 (MSF2_SYSREG_MMIO_SIZE / =
4)<br>
</blockquote>
<br></div></div>
I don&#39;t think this define is very useful.<span class=3D"gmail-"><br></s=
pan></blockquote><div><br></div><div>It is used in VMSTATE_UINT32_ARRAY(reg=
s, MSF2SysregState, MSF2_SYSREG_NUM_REGS).<br></div><div>Ok I will use MSF2=
_SYSREG_MMIO_SIZE / 4 directly instead. </div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><span class=3D"gmail-">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+#define TYPE_MSF2_SYSREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;msf2-sysr=
eg&quot;<br>
+#define MSF2_SYSREG(obj)=C2=A0 OBJECT_CHECK(MSF2SysregState, (obj), TYPE_M=
SF2_SYSREG)<br>
+<br>
+typedef struct MSF2SysregState {<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t regs[MSF2_SYSREG_NUM_REGS];<br>
+} MSF2SysregState;<br>
+<br>
+#endif /* HW_MSF2_SYSREG_H */<br>
<br>
</blockquote>
<br></span></blockquote><div>Thanks,<br></div><div>Sundeep<br>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-"=
></span>
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br></div></div>

--001a114e3f4e24e8af0552b421c6--
