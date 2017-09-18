Received: by 10.223.172.38 with SMTP id v35csp3247251wrc;
        Sun, 17 Sep 2017 18:02:23 -0700 (PDT)
X-Received: by 10.233.232.13 with SMTP id a13mr17963756qkg.83.1505696543662;
        Sun, 17 Sep 2017 18:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505696543; cv=none;
        d=google.com; s=arc-20160816;
        b=mUhJi5Dx2TTrkiuyJS/osXT5LpfGF19udI2BTKXhI2qvVLkgEvMMePY8KK1nHLpjL+
         7KdvVejaXGIECcUvcMKcKgoBN02nMEg+tXDUcHSN7i7q/1CIOBZW2HCiUwt2UvUeMLNC
         xC0raxcAZy946ACIxBxyBkrOaU4q6aDoWg2nT/4fFwrLwLE1pJDn9FPOAN0MzWAQMykQ
         TAi6s8wb+5/H/HLFU9ClJ/8rzAHxj2jfSPUc1UoFW3Waxopq295+LLXRLFgoCxqn/0Cg
         HWzf/wJK8d9Kqj130mhpEmURBy1JOoy7YBEPltN3te7ikNx/qQzTtCKxQ6kRZZ8QRJke
         NrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=qnGg9XWy1NuglTjz3emWU0YeXHCIx6vdVal1VWsP2b4=;
        b=giU/7trHzkrm3+5BDUWE4mNq1LTleQkgmMUBHFnTE+i3hI+ErcCTDOfDqKTVIIgcdq
         A5ZXxt5qx+6Y4D3M3ME+loTLV55MJ/5tRI3rRJR6IM/I8AFsvBxVmXXhE6q1AdHALZMV
         Z1IfFmkr3ee5YJIdi00myAYVuAFKY+OfS10Eqdung/EoiZtzmi5BU2EsgRnaqMJ9ypNc
         khmkaIVFuZbj2SpeTxkQkBxXZFy+fjy9vfr9F3/6zn+uYd7xFPDN9T3Icg0S1PTY93kO
         k1HKTYK/YUZeLS+q3N40an+ycAhmhOJy5Y/rgbxhEEoi+QSUR0RauFbJVTte05Cc+tq4
         gvAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FaAKu1Ze;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m53si6117573qta.78.2017.09.17.18.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Sep 2017 18:02:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FaAKu1Ze;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtkS5-00028r-Bh
	for alex.bennee@linaro.org; Sun, 17 Sep 2017 21:02:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkRv-000282-Bm
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 21:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkRq-0006Ev-B6
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 21:02:11 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkRq-0006Ch-60; Sun, 17 Sep 2017 21:02:06 -0400
Received: by mail-qt0-x243.google.com with SMTP id l25so4783227qtf.2;
	Sun, 17 Sep 2017 18:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qnGg9XWy1NuglTjz3emWU0YeXHCIx6vdVal1VWsP2b4=;
	b=FaAKu1ZeKmBWS+SmMlJ1aeuhpO2pBkLDkw8q1xQu+Fhj2IoHinp/lx0o+iX9Dl4yG0
	TzAg2GHArkyGldfLRGNBo5z15cA3ckKDG1O3Koki9uCMAnNkUQRNdDEpM+pjy21S1u9+
	UwHgG1y2Yo2cePJlUntYdM79XdyfSKIv8hejwxYr8SLH1DPEK8GN7ReK/rJ+8AIHiUte
	0DmmUuxZQF4qciYxo8GuXA1CLfHpWbdTFP/Oe0qY92g8UiJ9eGsNtcCiL4BqX7cJ6tdn
	5ieXv95eJQeDM1rO2srcLvjDJhmEnIQD2pKeurGmgbP/yBDMRIFbgJnZzco4aUKH0aoz
	NmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qnGg9XWy1NuglTjz3emWU0YeXHCIx6vdVal1VWsP2b4=;
	b=O0rF/r+RxuWkGaXHHkLiWkQfGsR/pys0we0EKCAGxQOmFJCKJjb48k1BvxkDk8191y
	MfN/rtW33eggQ+wIjjBjUh6JcCS5PWnuSYOBR9qTyWZAPiENWhT6EQh0T5ifKX2w9Xvs
	AkHJRPCfZmbKD8TZAJvxGVwHHWBDVl7awNlpnsteFf4kUPCPLp3N6o/ccTRjXKPk5YYI
	4C8ZQV9KgJQJrc1eWTUnenMf/GCwwXnZGymofLU8vfxavu2nsETgJAo7SkU9O65GJsL4
	xPSqC/cVvtr5NyNRq0hWgp432Cloz7+uIyunBhay6l5nks9obgp5NovyG3VR3TN+LW30
	Fe4Q==
X-Gm-Message-State: AHPjjUj9saeWziHgF0fsuXAXZqn2Al/CqhLwWF9jrvuY5QTfiARnmnNs
	PMuC34HVKrm2XQ==
X-Google-Smtp-Source: AOwi7QDFdH+Zi7RVrNkUYeEaU23PHTigeC9au3sjhc74GziIuwqhG0lfgDN/WRS/TUpDaPDIUFW7YQ==
X-Received: by 10.200.41.143 with SMTP id 15mr38897020qts.56.1505696520862;
	Sun, 17 Sep 2017 18:02:00 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	j19sm4413504qtc.41.2017.09.17.18.01.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Sep 2017 18:02:00 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
Date: Sun, 17 Sep 2017 22:01:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eTEDRky5w7wP

Hi Sundeep, Peter,

On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
> Added Sytem register block of Smartfusion2.
> This block has PLL registers which are accessed by guest.
> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>   hw/misc/Makefile.objs         |   1 +
>   hw/misc/msf2-sysreg.c         | 168 ++++++++++++++++++++++++++++++++++++++++++
>   hw/misc/trace-events          |   5 ++
>   include/hw/misc/msf2-sysreg.h |  77 +++++++++++++++++++
>   4 files changed, 251 insertions(+)
>   create mode 100644 hw/misc/msf2-sysreg.c
>   create mode 100644 include/hw/misc/msf2-sysreg.h
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 29fb922..e8f0a02 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>   obj-$(CONFIG_AUX) += auxbus.o
>   obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>   obj-y += mmio_interface.o
> +obj-$(CONFIG_MSF2) += msf2-sysreg.o
> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
> new file mode 100644
> index 0000000..dc3597b
> --- /dev/null
> +++ b/hw/misc/msf2-sysreg.c
> @@ -0,0 +1,168 @@
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
> +#include "trace.h"
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

eh?

> +    }
> +
> +    return ret;
> +}
> +
> +static void msf2_sysreg_reset(DeviceState *d)
> +{
> +    MSF2SysregState *s = MSF2_SYSREG(d);
> +
> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] = 0x021A2358;
> +    s->regs[MSSDDR_PLL_STATUS] = 0x3;
> +    s->regs[MSSDDR_FACC1_CR] = msf2_divbits(s->apb0div) << 5 |

ctz32(s->apb0div) << 5 ...

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
> +        trace_msf2_sysreg_read(offset << 2, ret);
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
> +    MSF2SysregState *s = opaque;
> +    uint32_t newval = val;
> +
> +    offset >>= 2;
> +
> +    switch (offset) {
> +    case MSSDDR_PLL_STATUS:
> +        trace_msf2_sysreg_write_pll_status();
> +        break;
> +
> +    case ESRAM_CR:
> +    case DDR_CR:
> +    case ENVM_REMAP_BASE_CR:
> +        if (newval != s->regs[offset]) {
> +            qemu_log_mask(LOG_UNIMP,
> +                       TYPE_MSF2_SYSREG": remapping not supported\n");

I'd rather exit here than continue with inconsistent cpu, Peter what do 
you recommend?

> +        }
> +        break;
> +
> +    default:
> +        if (offset < ARRAY_SIZE(s->regs)) {
> +            trace_msf2_sysreg_write(offset << 2, newval, s->regs[offset]);
> +            s->regs[offset] = newval;
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

DEFINE_PROP_UINT8() is enough for both.

Beware these divisors must be power of 2, and maximum 32.

This can be checked in msf2_sysreg_realize() ...

> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_msf2_sysreg;
> +    dc->reset = msf2_sysreg_reset;

... which would go here:

        dc->realize = msf2_sysreg_realize;

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
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 3313585..616579a 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -61,3 +61,8 @@ mps2_scc_reset(void) "MPS2 SCC: reset"
>   mps2_scc_leds(char led7, char led6, char led5, char led4, char led3, char led2, char led1, char led0) "MPS2 SCC LEDs: %c%c%c%c%c%c%c%c"
>   mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config write: function %d device %d data 0x%" PRIx32
>   mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config read: function %d device %d data 0x%" PRIx32
> +
> +# hw/misc/msf2-sysreg.c
> +msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sysreg write: addr 0x%08" HWADDR_PRIx " data 0x%" PRIx32 " prev 0x%" PRIx32
> +msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr 0x%08" HWADDR_PRIx " data 0x%08" PRIx32
> +msf2_sysreg_write_pll_status(void) "Invalid write to read only PLL status register"
> diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg.h
> new file mode 100644
> index 0000000..231f827
> --- /dev/null
> +++ b/include/hw/misc/msf2-sysreg.h
> @@ -0,0 +1,77 @@
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

uint8_t for both

> +
> +    uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
> +} MSF2SysregState;
> +
> +#endif /* HW_MSF2_SYSREG_H */
> 

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
