Received: by 10.223.188.70 with SMTP id a6csp221086wrh;
        Thu, 31 Aug 2017 15:59:08 -0700 (PDT)
X-Received: by 10.55.78.140 with SMTP id c134mr40045qkb.185.1504220348632;
        Thu, 31 Aug 2017 15:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504220348; cv=none;
        d=google.com; s=arc-20160816;
        b=ktynV0wdWoYQ08LrKzM4pvvMGhoQh92NYJefMcFUphLbOKU5nVw1fXYP+wZtt/QTCV
         v2fMTlFi3Ny2xrSgm5Ar1d4AmRJFCIOO3aZTyivlsnRLNxGo+VDRkFkJ2apvG3nVkSjU
         CxYH3041DBDxiH2HI7cSH6J58oYdghy1GohkJ19CBQXckqOc0k3UjTDMiPgCPK6NnibF
         dUbrsrQR0VEYk84k9c0mtEWxR5IF1uyoPLKlTAmm3w0LCVwU8os1yQqmMXKRcWgVJADD
         5xhpmkj2r3ziUFzw8m4eYOO8mZHxVys/AthPvJJnCQstcV3Gy8A9d2KK8brrFr2UcZu7
         H8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8WgloJuf6jRJSmw79sI39Xe1A8WyCVAz1lal+wEUHqk=;
        b=SicNpIqFjSl67UFqE845INC4WjhFVDho9635EijQ5Uz0+jJfzQdvsIlOsIdyx2TPff
         2dcDL4ebYToUf4fYUhzFBXu8eGRZXRRg+XjTeD6tYeXJBfLWWcxTRCdvuarmSUDkl/NC
         y2Rj3mlH5MC1Zlu2QZunq9ztfYh9/lcOhPppyXPMMh8Junmz/dzr3r47RfIpes5hMBDI
         4pr7HUxNcrE4Yplcad3xMkZAKuvv5m2wIdeUXA21NIkKOQAj+MveEjWT015ogDQckC67
         aJvveEy+L5wWfzEnQbYDGP68gnJnK1w17TsIF4XcKD1gYZtH89ZTYMwbE4coD+RyBz62
         tWGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qIXsZV8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b97si2593581qkh.147.2017.08.31.15.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 15:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qIXsZV8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59688 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnYQU-000887-Dk
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 18:59:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnYQL-00085h-VM
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 18:58:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnYQK-0004vV-FJ
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 18:58:58 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:35924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dnYQG-0004ty-Qb; Thu, 31 Aug 2017 18:58:53 -0400
Received: by mail-wr0-x244.google.com with SMTP id 40so482516wrv.3;
	Thu, 31 Aug 2017 15:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8WgloJuf6jRJSmw79sI39Xe1A8WyCVAz1lal+wEUHqk=;
	b=qIXsZV8rzlIil8iROfrgTM0QIPyzt/KWUii8VHz8ZvjUsF1yNFfPyXYsLoB6P0kYQt
	5M5qMyNKtEXNROE6HXvYjZRiHluZkpyfK4IKQcvgh1tT2uEMm0MJ9Kev14bABDJfne1i
	UNHqKv+65Ug+lPvwcmtKxATEZ+oMdYF0aaOeBSPTgvBDR8OJ0qsxctV7z2kHYrc8ULKd
	WnBv/7QuxOTY4fw+L/6p6ukZuz3RNhtQ8O76saucYcxhHt1HN+MONR53I3GA+bY/+VU+
	yZhOvnWcSzqDbkwmhC2IBxYGJiY1FFt4ZfZ7MnuJQ5ut4b38ATSofSlhhg4MsSr8QAvj
	psxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8WgloJuf6jRJSmw79sI39Xe1A8WyCVAz1lal+wEUHqk=;
	b=rCJ31T29VLAYaenLZYBseh+Ord4H21S6MYjMsvRhmR/QiPc1wCE9sWptz3JfxYka+u
	G6LqUVRyKF+xGcYrQPn0QHHq0u5HhBg70H9QcVxxwJGDDAiYZk5q0OY11+2XqJASvnGk
	K+leymVDNEDot3Qdt0U8/IAeKnWdUFko2OJfSC0/olbZjEbpKASVaf1Iqz6hZD0Cri+K
	HQ5XRk92ATiKw7Fa6FbMblKx3DNu/8HI+bOYcq0WyBmWfLQScbtPNkTh58FbfukPc4ci
	v0OgjB+IBdCHcWz3+0tO/KkrKAu5K+OVpzOuZQnBB1iVXU8SKEQStVcSQLjs8T+m6O7o
	nn7w==
X-Gm-Message-State: AHPjjUiRZNd/1jH0/WWao4hP7RAn+1Ye7pAFUlQVbX9+kJ7frWQ85QM8
	+FRXJS2XeghZrVImN0v+yEKFKFc2oQ==
X-Google-Smtp-Source: ADKCNb4upm/37eL03uTofAialeP0KMdu871ufgBe/xEdQt3IsdFFlm7gLLB9Zj1LOTq3OKhgzZs5a1j2aeiRFALTHvI=
X-Received: by 10.223.163.87 with SMTP id d23mr16601wrb.84.1504220331502; Thu,
	31 Aug 2017 15:58:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 31 Aug 2017 15:58:20 -0700 (PDT)
In-Reply-To: <1503938283-12404-3-git-send-email-sundeep.lkml@gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-3-git-send-email-sundeep.lkml@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Aug 2017 15:58:20 -0700
Message-ID: <CAKmqyKOva-ojPqFh6bqhRbJAwi3z2FB0YTB8icv5gLzdUNm7Zw@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
X-TUID: dyIQhf2TzZt+

On Mon, Aug 28, 2017 at 9:38 AM, Subbaraya Sundeep
<sundeep.lkml@gmail.com> wrote:
> Added Sytem register block of Smartfusion2.
> This block has PLL registers which are accessed by guest.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/misc/Makefile.objs         |   1 +
>  hw/misc/msf2-sysreg.c         | 199 ++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/msf2-sysreg.h |  78 +++++++++++++++++
>  3 files changed, 278 insertions(+)
>  create mode 100644 hw/misc/msf2-sysreg.c
>  create mode 100644 include/hw/misc/msf2-sysreg.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 29fb922..e8f0a02 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>  obj-$(CONFIG_AUX) += auxbus.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>  obj-y += mmio_interface.o
> +obj-$(CONFIG_MSF2) += msf2-sysreg.o
> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
> new file mode 100644
> index 0000000..2aeb555
> --- /dev/null
> +++ b/hw/misc/msf2-sysreg.c
> @@ -0,0 +1,199 @@
> +/*
> + * System Register block model of Microsemi SmartFusion2.
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/misc/msf2-sysreg.h"
> +
> +#ifndef MSF2_SYSREG_ERR_DEBUG
> +#define MSF2_SYSREG_ERR_DEBUG  0
> +#endif
> +
> +#define DB_PRINT_L(lvl, fmt, args...) do { \
> +    if (MSF2_SYSREG_ERR_DEBUG >= lvl) { \
> +        qemu_log("%s: " fmt "\n", __func__, ## args); \
> +    } \
> +} while (0);
> +
> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> +
> +static inline int msf2_divbits(uint32_t div)
> +{
> +    int ret = 0;
> +
> +    switch (div) {
> +    case 1:
> +        ret = 0;
> +        break;
> +    case 2:
> +        ret = 1;
> +        break;
> +    case 4:
> +        ret = 2;
> +        break;
> +    case 8:
> +        ret = 4;
> +        break;
> +    case 16:
> +        ret = 5;
> +        break;
> +    case 32:
> +        ret = 6;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void msf2_sysreg_reset(DeviceState *d)
> +{
> +    MSF2SysregState *s = MSF2_SYSREG(d);
> +
> +    DB_PRINT("RESET");
> +
> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x021A2358;
> +    s->regs[MSSDDR_PLL_STATUS] = 0x3;
> +    s->regs[MSSDDR_FACC1_CR] = msf2_divbits(s->apb0div) << 5 |
> +                               msf2_divbits(s->apb1div) << 2;
> +}
> +
> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
> +    unsigned size)
> +{
> +    MSF2SysregState *s = opaque;
> +    uint32_t ret = 0;
> +
> +    offset >>= 2;
> +    if (offset < ARRAY_SIZE(s->regs)) {
> +        ret = s->regs[offset];
> +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
> +                    offset << 2, ret);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
> +                    offset << 2);
> +    }
> +
> +    return ret;
> +}
> +
> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
> +                          uint64_t val, unsigned size)
> +{
> +    MSF2SysregState *s = (MSF2SysregState *)opaque;

Drop this cast

> +    uint32_t newval = val;
> +    uint32_t oldval;
> +
> +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
> +            offset, val);
> +
> +    offset >>= 2;
> +
> +    switch (offset) {
> +    case MSSDDR_PLL_STATUS:
> +        break;
> +
> +    case ESRAM_CR:
> +        oldval = s->regs[ESRAM_CR];
> +        if (oldval ^ newval) {

Isn't this just:
if (newval != s->regs[ESRAM_CR])

I think putting it all in the if makes it clearer.

> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                       TYPE_MSF2_SYSREG": eSRAM remapping not supported\n");
> +        }
> +        break;
> +
> +    case DDR_CR:
> +        oldval = s->regs[DDR_CR];
> +        if (oldval ^ newval) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                       TYPE_MSF2_SYSREG": DDR remapping not supported\n");
> +        }
> +        break;
> +
> +    case ENVM_REMAP_BASE_CR:
> +        oldval = s->regs[ENVM_REMAP_BASE_CR];
> +        if (oldval ^ newval) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                       TYPE_MSF2_SYSREG": eNVM remapping not supported\n");
> +        }
> +        break;
> +
> +    default:
> +        if (offset < ARRAY_SIZE(s->regs)) {
> +            s->regs[offset] = val;

Use newval instead.

With those all fixed up you can include this in the next version:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair


> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
> +                        offset << 2);
> +        }
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps sysreg_ops = {
> +    .read = msf2_sysreg_read,
> +    .write = msf2_sysreg_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static void msf2_sysreg_init(Object *obj)
> +{
> +    MSF2SysregState *s = MSF2_SYSREG(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s, TYPE_MSF2_SYSREG,
> +                          MSF2_SYSREG_MMIO_SIZE);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> +}
> +
> +static const VMStateDescription vmstate_msf2_sysreg = {
> +    .name = TYPE_MSF2_SYSREG,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState, MSF2_SYSREG_MMIO_SIZE / 4),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property msf2_sysreg_properties[] = {
> +    /* default divisors in Libero GUI */
> +    DEFINE_PROP_UINT32("apb0divisor", MSF2SysregState, apb0div, 2),
> +    DEFINE_PROP_UINT32("apb1divisor", MSF2SysregState, apb1div, 2),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_msf2_sysreg;
> +    dc->reset = msf2_sysreg_reset;
> +    dc->props = msf2_sysreg_properties;
> +}
> +
> +static const TypeInfo msf2_sysreg_info = {
> +    .name  = TYPE_MSF2_SYSREG,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .class_init = msf2_sysreg_class_init,
> +    .instance_size  = sizeof(MSF2SysregState),
> +    .instance_init = msf2_sysreg_init,
> +};
> +
> +static void msf2_sysreg_register_types(void)
> +{
> +    type_register_static(&msf2_sysreg_info);
> +}
> +
> +type_init(msf2_sysreg_register_types)
> diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg.h
> new file mode 100644
> index 0000000..f39cc41
> --- /dev/null
> +++ b/include/hw/misc/msf2-sysreg.h
> @@ -0,0 +1,78 @@
> +/*
> + * Microsemi SmartFusion2 SYSREG
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_MSF2_SYSREG_H
> +#define HW_MSF2_SYSREG_H
> +
> +#include "hw/sysbus.h"
> +
> +enum {
> +    ESRAM_CR        = 0x00 / 4,
> +    ESRAM_MAX_LAT,
> +    DDR_CR,
> +    ENVM_CR,
> +    ENVM_REMAP_BASE_CR,
> +    ENVM_REMAP_FAB_CR,
> +    CC_CR,
> +    CC_REGION_CR,
> +    CC_LOCK_BASE_ADDR_CR,
> +    CC_FLUSH_INDX_CR,
> +    DDRB_BUF_TIMER_CR,
> +    DDRB_NB_ADDR_CR,
> +    DDRB_NB_SIZE_CR,
> +    DDRB_CR,
> +
> +    SOFT_RESET_CR  = 0x48 / 4,
> +    M3_CR,
> +
> +    GPIO_SYSRESET_SEL_CR = 0x58 / 4,
> +
> +    MDDR_CR = 0x60 / 4,
> +
> +    MSSDDR_PLL_STATUS_LOW_CR = 0x90 / 4,
> +    MSSDDR_PLL_STATUS_HIGH_CR,
> +    MSSDDR_FACC1_CR,
> +    MSSDDR_FACC2_CR,
> +
> +    MSSDDR_PLL_STATUS = 0x150 / 4,
> +
> +};
> +
> +#define MSF2_SYSREG_MMIO_SIZE     0x300
> +
> +#define TYPE_MSF2_SYSREG          "msf2-sysreg"
> +#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj), TYPE_MSF2_SYSREG)
> +
> +typedef struct MSF2SysregState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    uint32_t apb0div;
> +    uint32_t apb1div;
> +
> +    uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
> +} MSF2SysregState;
> +
> +#endif /* HW_MSF2_SYSREG_H */
> --
> 2.5.0
>
