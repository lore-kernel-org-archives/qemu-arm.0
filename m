Received: by 10.223.188.70 with SMTP id a6csp596213wrh;
        Thu, 31 Aug 2017 23:04:00 -0700 (PDT)
X-Received: by 10.200.8.186 with SMTP id v55mr1312475qth.181.1504245840712;
        Thu, 31 Aug 2017 23:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504245840; cv=none;
        d=google.com; s=arc-20160816;
        b=VPfELZSvn3Rtl5gFMAddFlb8XD0rcJW/xIvMyptilee/lldElsTwZ5gcfYKYTq8CVO
         Kx5rY/3l0y6gKe866Tvn0C1FFMcdjR/u0CwOkFRTGSMnS+mayS3mBx7PEqgRjrvbvGdl
         CZenJ4irvjQ8jY4lz4xfjPHU7LcpdlVXtvAt0KnAg8LeLDPjucVkNDTOg/yNv76KAZ7o
         M+bBymlld1hVmham+gdjOn24dKKJNLFWoCBRccuRzD6PNd+oFjnYQ/A/J0F7aSRnT0ED
         E+61H0qNOehJJMDDXdzjm0wKWSTaJayRN2GwKjQF42eqxFYi9+O7bahm60SHFDC6K0w1
         U97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rff6hElAiLw63WL5zUW3yfzRloDLuEmPtyDD1/hLUGY=;
        b=CKmw5w8J1whovEtxYSeUieQqidre6dSMCkke2YC8BDK4tejxPOeNWqUKcdqyjFKZQz
         NtBty/+dmHfaeEI9mkkQIiAFaKmvEBccVLUsLFy2XraG7EOAQcKKWQ86jHUODUjIeg1F
         PKUAfPCOsQXpPKxuAnq78yMc1AJ8FvYuJC4hwh8UdtM0+Xk6KcLPcxXJk73iGMorcPHu
         /QsL5Z0tYDQGMl5qZItueUSytC99bYrUIC0syiTS8q/XmDo2R642xHejnKufNc5sqs9e
         Sd5eNeNIQ8ks9QQS5QKN1GhEGY5+rvSmKPxztdgYaZg4ZI4cqqi2reP4XkHCxf/vayGT
         HYxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fr7f7wTE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2si1656574qtc.356.2017.08.31.23.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 23:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fr7f7wTE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnf3e-000757-5X
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 02:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dnf3M-00070f-GH
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 02:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dnf3J-0002jC-Sp
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 02:03:40 -0400
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:35164)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dnf3E-0002fJ-2I; Fri, 01 Sep 2017 02:03:32 -0400
Received: by mail-ua0-x242.google.com with SMTP id g47so423488uad.2;
	Thu, 31 Aug 2017 23:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rff6hElAiLw63WL5zUW3yfzRloDLuEmPtyDD1/hLUGY=;
	b=Fr7f7wTE0lGWPe1sdDBCx1lP6UhEwPwClELEFT22vii5tQrSKRiKLGO20I7vJ+kdx2
	Z2PhxzhoAWafk1u+Tj507iQutdi2mhPaGA3pqciNjR04orvg8aphbREZUG4BDlmcgO2l
	CTcWjD9ouS1VeTKZrcA4LCrvJpjvW+Po5IUV/HA0dvzgjNrqCtB7jmA79p6QHfGcQYDr
	0QmJRdrDxxSoB8I2wdclqiEYBpcFHZdMbeFM/z0Azhen/Y4KmumeZMzk5NL6hE0TSp64
	618kOeJ0qlUTYkfzI9/N4FGXvRxHK8EcBBRQ214hte0S730ligyeuerlMlH7/gEXLn8w
	jjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rff6hElAiLw63WL5zUW3yfzRloDLuEmPtyDD1/hLUGY=;
	b=DkMaeLYzeF8r3YtZSW1AJCGrISvyQr66OliZnk/lkv18ZDrJ3e2heyxK5IwT8p0aWt
	a59VEhANs3YC1BPdJf6wec0YcxCVoTj3EDUoYu9N816/GrGgjIFxVNaqot+VtSElc8Yh
	VyMYctqP/TNdnyq2hVr9Y3ewaWgNirtTltpbDHQjrU/lUw1feiWx0TL7TbqWLsmWCPPf
	4igc3RlQMCD+hajOeFsHBUydeQpJlKQsM3oJMf1CMTTGtzHzN5XXjuD1zW2mNrQGGz2l
	RT7J6Ob/7kEwChzCVxGje8YWELo8PiaJvNGztSJ1lhW8mWadXyB/rof6Wa6cqsquC7pd
	LFHA==
X-Gm-Message-State: AHPjjUhyVLYQi8zU+ZMK+iH3AzPWR3ySW9BbekxLL9dOd4MWz5VZZIl2
	/Ev4ZA2p7RTJiU83bshIa7zBXeJVTQ==
X-Google-Smtp-Source: ADKCNb5SpOHGe8HSbe9DUE0nN3ODgMGgds1qDft+o/KvwUc1IDfOUd4Hj7i2Zx5nBrhhY7bt8DEZKTBJ73C+P2hgREI=
X-Received: by 10.176.68.102 with SMTP id m93mr435861uam.133.1504245810087;
	Thu, 31 Aug 2017 23:03:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.75.196 with HTTP; Thu, 31 Aug 2017 23:03:29 -0700 (PDT)
In-Reply-To: <CAKmqyKOva-ojPqFh6bqhRbJAwi3z2FB0YTB8icv5gLzdUNm7Zw@mail.gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-3-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKOva-ojPqFh6bqhRbJAwi3z2FB0YTB8icv5gLzdUNm7Zw@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 1 Sep 2017 11:33:29 +0530
Message-ID: <CALHRZuqj+tp5rGfJJj+2iV1Z6H4FZJZm8w_DeePccxFAL5dGCA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="001a114ccd322a4f9e05581a8580"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: Re: [Qemu-arm] [Qemu devel v7 PATCH 2/5] msf2: Microsemi
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BO6SMdVDU/3u

--001a114ccd322a4f9e05581a8580
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Fri, Sep 1, 2017 at 4:28 AM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Aug 28, 2017 at 9:38 AM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
> > Added Sytem register block of Smartfusion2.
> > This block has PLL registers which are accessed by guest.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > ---
> >  hw/misc/Makefile.objs         |   1 +
> >  hw/misc/msf2-sysreg.c         | 199 ++++++++++++++++++++++++++++++
> ++++++++++++
> >  include/hw/misc/msf2-sysreg.h |  78 +++++++++++++++++
> >  3 files changed, 278 insertions(+)
> >  create mode 100644 hw/misc/msf2-sysreg.c
> >  create mode 100644 include/hw/misc/msf2-sysreg.h
> >
> > diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> > index 29fb922..e8f0a02 100644
> > --- a/hw/misc/Makefile.objs
> > +++ b/hw/misc/Makefile.objs
> > @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
> >  obj-$(CONFIG_AUX) += auxbus.o
> >  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
> >  obj-y += mmio_interface.o
> > +obj-$(CONFIG_MSF2) += msf2-sysreg.o
> > diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
> > new file mode 100644
> > index 0000000..2aeb555
> > --- /dev/null
> > +++ b/hw/misc/msf2-sysreg.c
> > @@ -0,0 +1,199 @@
> > +/*
> > + * System Register block model of Microsemi SmartFusion2.
> > + *
> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + *
> > + * You should have received a copy of the GNU General Public License
> along
> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "hw/misc/msf2-sysreg.h"
> > +
> > +#ifndef MSF2_SYSREG_ERR_DEBUG
> > +#define MSF2_SYSREG_ERR_DEBUG  0
> > +#endif
> > +
> > +#define DB_PRINT_L(lvl, fmt, args...) do { \
> > +    if (MSF2_SYSREG_ERR_DEBUG >= lvl) { \
> > +        qemu_log("%s: " fmt "\n", __func__, ## args); \
> > +    } \
> > +} while (0);
> > +
> > +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> > +
> > +static inline int msf2_divbits(uint32_t div)
> > +{
> > +    int ret = 0;
> > +
> > +    switch (div) {
> > +    case 1:
> > +        ret = 0;
> > +        break;
> > +    case 2:
> > +        ret = 1;
> > +        break;
> > +    case 4:
> > +        ret = 2;
> > +        break;
> > +    case 8:
> > +        ret = 4;
> > +        break;
> > +    case 16:
> > +        ret = 5;
> > +        break;
> > +    case 32:
> > +        ret = 6;
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static void msf2_sysreg_reset(DeviceState *d)
> > +{
> > +    MSF2SysregState *s = MSF2_SYSREG(d);
> > +
> > +    DB_PRINT("RESET");
> > +
> > +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x021A2358;
> > +    s->regs[MSSDDR_PLL_STATUS] = 0x3;
> > +    s->regs[MSSDDR_FACC1_CR] = msf2_divbits(s->apb0div) << 5 |
> > +                               msf2_divbits(s->apb1div) << 2;
> > +}
> > +
> > +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
> > +    unsigned size)
> > +{
> > +    MSF2SysregState *s = opaque;
> > +    uint32_t ret = 0;
> > +
> > +    offset >>= 2;
> > +    if (offset < ARRAY_SIZE(s->regs)) {
> > +        ret = s->regs[offset];
> > +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
> > +                    offset << 2, ret);
> > +    } else {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
> > +                    offset << 2);
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static void msf2_sysreg_write(void *opaque, hwaddr offset,
> > +                          uint64_t val, unsigned size)
> > +{
> > +    MSF2SysregState *s = (MSF2SysregState *)opaque;
>
> Drop this cast
>

Yeah ok.

>
> > +    uint32_t newval = val;
> > +    uint32_t oldval;
> > +
> > +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
> > +            offset, val);
> > +
> > +    offset >>= 2;
> > +
> > +    switch (offset) {
> > +    case MSSDDR_PLL_STATUS:
> > +        break;
> > +
> > +    case ESRAM_CR:
> > +        oldval = s->regs[ESRAM_CR];
> > +        if (oldval ^ newval) {
>
> Isn't this just:
> if (newval != s->regs[ESRAM_CR])
>
> I think putting it all in the if makes it clearer.
>

Ok will change.

>
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                       TYPE_MSF2_SYSREG": eSRAM remapping not
> supported\n");
> > +        }
> > +        break;
> > +
> > +    case DDR_CR:
> > +        oldval = s->regs[DDR_CR];
> > +        if (oldval ^ newval) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                       TYPE_MSF2_SYSREG": DDR remapping not
> supported\n");
> > +        }
> > +        break;
> > +
> > +    case ENVM_REMAP_BASE_CR:
> > +        oldval = s->regs[ENVM_REMAP_BASE_CR];
> > +        if (oldval ^ newval) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                       TYPE_MSF2_SYSREG": eNVM remapping not
> supported\n");
> > +        }
> > +        break;
> > +
> > +    default:
> > +        if (offset < ARRAY_SIZE(s->regs)) {
> > +            s->regs[offset] = val;
>
> Use newval instead.
>

Ok

>
> With those all fixed up you can include this in the next version:
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Thanks,
> Alistair
>

Thank you,
Sundeep

>
>
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
> __func__,
> > +                        offset << 2);
> > +        }
> > +        break;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps sysreg_ops = {
> > +    .read = msf2_sysreg_read,
> > +    .write = msf2_sysreg_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +};
> > +
> > +static void msf2_sysreg_init(Object *obj)
> > +{
> > +    MSF2SysregState *s = MSF2_SYSREG(obj);
> > +
> > +    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s,
> TYPE_MSF2_SYSREG,
> > +                          MSF2_SYSREG_MMIO_SIZE);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> > +}
> > +
> > +static const VMStateDescription vmstate_msf2_sysreg = {
> > +    .name = TYPE_MSF2_SYSREG,
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState,
> MSF2_SYSREG_MMIO_SIZE / 4),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static Property msf2_sysreg_properties[] = {
> > +    /* default divisors in Libero GUI */
> > +    DEFINE_PROP_UINT32("apb0divisor", MSF2SysregState, apb0div, 2),
> > +    DEFINE_PROP_UINT32("apb1divisor", MSF2SysregState, apb1div, 2),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->vmsd = &vmstate_msf2_sysreg;
> > +    dc->reset = msf2_sysreg_reset;
> > +    dc->props = msf2_sysreg_properties;
> > +}
> > +
> > +static const TypeInfo msf2_sysreg_info = {
> > +    .name  = TYPE_MSF2_SYSREG,
> > +    .parent = TYPE_SYS_BUS_DEVICE,
> > +    .class_init = msf2_sysreg_class_init,
> > +    .instance_size  = sizeof(MSF2SysregState),
> > +    .instance_init = msf2_sysreg_init,
> > +};
> > +
> > +static void msf2_sysreg_register_types(void)
> > +{
> > +    type_register_static(&msf2_sysreg_info);
> > +}
> > +
> > +type_init(msf2_sysreg_register_types)
> > diff --git a/include/hw/misc/msf2-sysreg.h
> b/include/hw/misc/msf2-sysreg.h
> > new file mode 100644
> > index 0000000..f39cc41
> > --- /dev/null
> > +++ b/include/hw/misc/msf2-sysreg.h
> > @@ -0,0 +1,78 @@
> > +/*
> > + * Microsemi SmartFusion2 SYSREG
> > + *
> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#ifndef HW_MSF2_SYSREG_H
> > +#define HW_MSF2_SYSREG_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +enum {
> > +    ESRAM_CR        = 0x00 / 4,
> > +    ESRAM_MAX_LAT,
> > +    DDR_CR,
> > +    ENVM_CR,
> > +    ENVM_REMAP_BASE_CR,
> > +    ENVM_REMAP_FAB_CR,
> > +    CC_CR,
> > +    CC_REGION_CR,
> > +    CC_LOCK_BASE_ADDR_CR,
> > +    CC_FLUSH_INDX_CR,
> > +    DDRB_BUF_TIMER_CR,
> > +    DDRB_NB_ADDR_CR,
> > +    DDRB_NB_SIZE_CR,
> > +    DDRB_CR,
> > +
> > +    SOFT_RESET_CR  = 0x48 / 4,
> > +    M3_CR,
> > +
> > +    GPIO_SYSRESET_SEL_CR = 0x58 / 4,
> > +
> > +    MDDR_CR = 0x60 / 4,
> > +
> > +    MSSDDR_PLL_STATUS_LOW_CR = 0x90 / 4,
> > +    MSSDDR_PLL_STATUS_HIGH_CR,
> > +    MSSDDR_FACC1_CR,
> > +    MSSDDR_FACC2_CR,
> > +
> > +    MSSDDR_PLL_STATUS = 0x150 / 4,
> > +
> > +};
> > +
> > +#define MSF2_SYSREG_MMIO_SIZE     0x300
> > +
> > +#define TYPE_MSF2_SYSREG          "msf2-sysreg"
> > +#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj),
> TYPE_MSF2_SYSREG)
> > +
> > +typedef struct MSF2SysregState {
> > +    SysBusDevice parent_obj;
> > +
> > +    MemoryRegion iomem;
> > +
> > +    uint32_t apb0div;
> > +    uint32_t apb1div;
> > +
> > +    uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
> > +} MSF2SysregState;
> > +
> > +#endif /* HW_MSF2_SYSREG_H */
> > --
> > 2.5.0
> >
>

--001a114ccd322a4f9e05581a8580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Fri, Sep 1, 2017 at 4:28 AM, Alistair Francis <span dir=3D"l=
tr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair2=
3@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cl=
ass=3D"HOEnZb"><div class=3D"h5">On Mon, Aug 28, 2017 at 9:38 AM, Subbaraya=
 Sundeep<br>
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt=
; wrote:<br>
&gt; Added Sytem register block of Smartfusion2.<br>
&gt; This block has PLL registers which are accessed by guest.<br>
&gt;<br>
&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gm=
ail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
&gt;=C2=A0 hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 199 +++=
+++++++++++++++++++++++++++<wbr>++++++++++++<br>
&gt;=C2=A0 include/hw/misc/msf2-sysreg.h |=C2=A0 78 +++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 278 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/misc/msf2-sysreg.c<br>
&gt;=C2=A0 create mode 100644 include/hw/misc/msf2-sysreg.h<br>
&gt;<br>
&gt; diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br>
&gt; index 29fb922..e8f0a02 100644<br>
&gt; --- a/hw/misc/Makefile.objs<br>
&gt; +++ b/hw/misc/Makefile.objs<br>
&gt; @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o<b=
r>
&gt;=C2=A0 obj-$(CONFIG_AUX) +=3D auxbus.o<br>
&gt;=C2=A0 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o<br>
&gt;=C2=A0 obj-y +=3D mmio_interface.o<br>
&gt; +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o<br>
&gt; diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..2aeb555<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/misc/msf2-sysreg.c<br>
&gt; @@ -0,0 +1,199 @@<br>
&gt; +/*<br>
&gt; + * System Register block model of Microsemi SmartFusion2.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU General Public License<br>
&gt; + * as published by the Free Software Foundation; either version<br>
&gt; + * 2 of the License, or (at your option) any later version.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along<br>
&gt; + * with this program; if not, see &lt;<a href=3D"http://www.gnu.org/l=
icenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/=
</a>&gt;<wbr>.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
&gt; +<br>
&gt; +#ifndef MSF2_SYSREG_ERR_DEBUG<br>
&gt; +#define MSF2_SYSREG_ERR_DEBUG=C2=A0 0<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
&gt; +=C2=A0 =C2=A0 if (MSF2_SYSREG_ERR_DEBUG &gt;=3D lvl) { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt &quot;\n&qu=
ot;, __func__, ## args); \<br>
&gt; +=C2=A0 =C2=A0 } \<br>
&gt; +} while (0);<br>
&gt; +<br>
&gt; +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>
&gt; +<br>
&gt; +static inline int msf2_divbits(uint32_t div)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (div) {<br>
&gt; +=C2=A0 =C2=A0 case 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 5;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 6;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void msf2_sysreg_reset(DeviceState *d)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(d);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;RESET&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS_LOW_<wbr>CR] =3D 0x021A235=
8;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS] =3D 0x3;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s-&gt;apb0=
div) &lt;&lt; 5 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msf2_divbits(s-&gt;apb1div) &lt;&=
lt; 2;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,<br>
&gt; +=C2=A0 =C2=A0 unsigned size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 offset &gt;&gt;=3D 2;<br>
&gt; +=C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[offset];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;addr: 0x%08&quot; HWADDR_P=
RIx &quot; data: 0x%08&quot; PRIx32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 offset &lt;&lt; 2, ret);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 offset &lt;&lt; 2);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void msf2_sysreg_write(void *opaque, hwaddr offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 uint64_t val, unsigned size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D (MSF2SysregState *)opaque;<br>
<br>
</div></div>Drop this cast<br></blockquote><div><br></div><div>Yeah ok.</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 uint32_t newval =3D val;<br>
&gt; +=C2=A0 =C2=A0 uint32_t oldval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;addr: 0x%08&quot; HWADDR_PRIx &quot; dat=
a: 0x%08&quot; PRIx64,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 offset &gt;&gt;=3D 2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt; +=C2=A0 =C2=A0 case MSSDDR_PLL_STATUS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case ESRAM_CR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldval =3D s-&gt;regs[ESRAM_CR];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldval ^ newval) {<br>
<br>
</span>Isn&#39;t this just:<br>
if (newval !=3D s-&gt;regs[ESRAM_CR])<br>
<br>
I think putting it all in the if makes it clearer.<br></blockquote><div><br=
></div><div>Ok will change.=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: eSRAM remapping not supported\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case DDR_CR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldval =3D s-&gt;regs[DDR_CR];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldval ^ newval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: DDR remapping not supported\n&quot;);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case ENVM_REMAP_BASE_CR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldval =3D s-&gt;regs[ENVM_REMAP_BASE_CR]=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldval ^ newval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: eNVM remapping not supported\n&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[offset] =3D val;=
<br>
<br>
</span>Use newval instead.<br></blockquote><div><br></div><div>Ok=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
With those all fixed up you can include this in the next version:<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xilinx=
.com">alistair.francis@xilinx.com</a>&gt;<br>
<br>
Thanks,<br>
Alistair<br></blockquote><div><br></div><div>Thank you,</div><div>Sundeep=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;,=
 __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 offset &lt;&lt; 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const MemoryRegionOps sysreg_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D msf2_sysreg_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D msf2_sysreg_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void msf2_sysreg_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;<wbr>iomem, obj, &amp;=
sysreg_ops, s, TYPE_MSF2_SYSREG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 MSF2_SYSREG_MMIO_SIZE);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_<wbr>DEVICE(obj), &amp;s-&gt;i=
omem);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const VMStateDescription vmstate_msf2_sysreg =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_MSF2_SYSREG,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, MSF2SysregStat=
e, MSF2_SYSREG_MMIO_SIZE / 4),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static Property msf2_sysreg_properties[] =3D {<br>
&gt; +=C2=A0 =C2=A0 /* default divisors in Libero GUI */<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;<wbr>apb0divisor&quot;, MSF2Sy=
sregState, apb0div, 2),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;<wbr>apb1divisor&quot;, MSF2Sy=
sregState, apb1div, 2),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void msf2_sysreg_class_init(<wbr>ObjectClass *klass, void *dat=
a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_msf2_sysreg;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;reset =3D msf2_sysreg_reset;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;props =3D msf2_sysreg_properties;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo msf2_sysreg_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name=C2=A0 =3D TYPE_MSF2_SYSREG,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_SYS_BUS_DEVICE,<br>
&gt; +=C2=A0 =C2=A0 .class_init =3D msf2_sysreg_class_init,<br>
&gt; +=C2=A0 =C2=A0 .instance_size=C2=A0 =3D sizeof(MSF2SysregState),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D msf2_sysreg_init,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void msf2_sysreg_register_types(<wbr>void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;msf2_<wbr>sysreg_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(msf2_sysreg_<wbr>register_types)<br>
&gt; diff --git a/include/hw/misc/msf2-sysreg.<wbr>h b/include/hw/misc/msf2=
-sysreg.<wbr>h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f39cc41<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/misc/msf2-sysreg.<wbr>h<br>
&gt; @@ -0,0 +1,78 @@<br>
&gt; +/*<br>
&gt; + * Microsemi SmartFusion2 SYSREG<br>
&gt; + *<br>
&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef HW_MSF2_SYSREG_H<br>
&gt; +#define HW_MSF2_SYSREG_H<br>
&gt; +<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 ESRAM_CR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00 / 4,<br>
&gt; +=C2=A0 =C2=A0 ESRAM_MAX_LAT,<br>
&gt; +=C2=A0 =C2=A0 DDR_CR,<br>
&gt; +=C2=A0 =C2=A0 ENVM_CR,<br>
&gt; +=C2=A0 =C2=A0 ENVM_REMAP_BASE_CR,<br>
&gt; +=C2=A0 =C2=A0 ENVM_REMAP_FAB_CR,<br>
&gt; +=C2=A0 =C2=A0 CC_CR,<br>
&gt; +=C2=A0 =C2=A0 CC_REGION_CR,<br>
&gt; +=C2=A0 =C2=A0 CC_LOCK_BASE_ADDR_CR,<br>
&gt; +=C2=A0 =C2=A0 CC_FLUSH_INDX_CR,<br>
&gt; +=C2=A0 =C2=A0 DDRB_BUF_TIMER_CR,<br>
&gt; +=C2=A0 =C2=A0 DDRB_NB_ADDR_CR,<br>
&gt; +=C2=A0 =C2=A0 DDRB_NB_SIZE_CR,<br>
&gt; +=C2=A0 =C2=A0 DDRB_CR,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 SOFT_RESET_CR=C2=A0 =3D 0x48 / 4,<br>
&gt; +=C2=A0 =C2=A0 M3_CR,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 GPIO_SYSRESET_SEL_CR =3D 0x58 / 4,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MDDR_CR =3D 0x60 / 4,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MSSDDR_PLL_STATUS_LOW_CR =3D 0x90 / 4,<br>
&gt; +=C2=A0 =C2=A0 MSSDDR_PLL_STATUS_HIGH_CR,<br>
&gt; +=C2=A0 =C2=A0 MSSDDR_FACC1_CR,<br>
&gt; +=C2=A0 =C2=A0 MSSDDR_FACC2_CR,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MSSDDR_PLL_STATUS =3D 0x150 / 4,<br>
&gt; +<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define MSF2_SYSREG_MMIO_SIZE=C2=A0 =C2=A0 =C2=A00x300<br>
&gt; +<br>
&gt; +#define TYPE_MSF2_SYSREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;msf2=
-sysreg&quot;<br>
&gt; +#define MSF2_SYSREG(obj)=C2=A0 OBJECT_CHECK(MSF2SysregState, (obj), T=
YPE_MSF2_SYSREG)<br>
&gt; +<br>
&gt; +typedef struct MSF2SysregState {<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion iomem;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t apb0div;<br>
&gt; +=C2=A0 =C2=A0 uint32_t apb1div;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];<br>
&gt; +} MSF2SysregState;<br>
&gt; +<br>
&gt; +#endif /* HW_MSF2_SYSREG_H */<br>
&gt; --<br>
&gt; 2.5.0<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114ccd322a4f9e05581a8580--
