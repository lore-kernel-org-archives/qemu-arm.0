Received: by 10.223.172.38 with SMTP id v35csp431547wrc;
        Wed, 13 Sep 2017 21:38:25 -0700 (PDT)
X-Received: by 10.200.47.173 with SMTP id l42mr30530938qta.298.1505363905823;
        Wed, 13 Sep 2017 21:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505363905; cv=none;
        d=google.com; s=arc-20160816;
        b=z0v72iSiCCsuKESjUPWJvhoctOlfSFjITe2tyuMKypI/Txac9BXCX6AqwA+3xfSi8H
         1u3lrxDDSWFVkREzdL+n0eqRQRUvdEAHnCD1cvJVgK+CQwJU5VcFJkpcrJ+veoTpjdqC
         xvX1MN82Pv67Xr69rqABvm2O3j0WCFPq1Ixxegqf7dPyybZIiUtRVMl/ZW7jl5ntLLGH
         RlTNlLxNkjzhp80fZRG6X5LRsl9YTAGDkcjWBds6hXssp1QgU5bSx9Rqexm9scpybeg/
         e9m/VV011mR2mjEvYJ5VECp1TfmQaZ/+YbQehAQJN0SrKFk+twF+PVBzWmsOw1Wc7ch/
         XiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature
         :arc-authentication-results;
        bh=qvNL9svjg5AS0ARV4bzfEgBC44WlBGgigdO7g+BEaTc=;
        b=fEnGuNYIN3vRnZL181uuPyKugu1Ojm5jzKFPTWP+Pp2+pWcTPZqYNcUNCE5rL35QXO
         BaQAHyctkXH2J9MhoYw+tqHvqsREetzJWrUfeoa2fcBn/DkoGKZABYKZVCCqoZAwOqL6
         krRHuEbadYYBe5F7u7AqCyEQlswWdbgv/435QlUgpP72NZU4d3LFvQQ64aVXv6gpgfGr
         9Hhb4jVZSMLRPIdhGaUOhAihjsfvom/zsnsb3pRMgXn6fvrGateUtUzXyB2E0HcY7irE
         oSpBpchiEC0wU8tFKX0Oz9DKX4T6wV6IZCKvUDQotRpgGOdKyC7c5d0xu51YkLqby8jK
         WXHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jO/dqOnc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17si1439310qkc.490.2017.09.13.21.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 21:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jO/dqOnc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsLux-00022D-JW
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 00:38:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsLtL-0000eZ-Ax
	for qemu-devel@nongnu.org; Thu, 14 Sep 2017 00:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsLtJ-0001vF-30
	for qemu-devel@nongnu.org; Thu, 14 Sep 2017 00:36:42 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:44516)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsLtE-0001qj-3S; Thu, 14 Sep 2017 00:36:36 -0400
Received: by mail-qk0-x22b.google.com with SMTP id b23so5047520qkg.1;
	Wed, 13 Sep 2017 21:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qvNL9svjg5AS0ARV4bzfEgBC44WlBGgigdO7g+BEaTc=;
	b=jO/dqOncgnkPK0lCQV33Vq2tf83Zqzyq3Uws+govwt+VpKa680xsQZFzXrMR7rPKmW
	Bz5g/0w7ZmkGcfS+UsriBpQ1UmOmO9bK0XHSo3dXqerkons2rOCVFN2x9Y+Y1q5i/TR2
	UK92rs4eDuWQY2MRYCD64G2vG6uu8kG0OMKOOVGJuhDM600Ps1AScJsvlwaIW4bhPBKy
	ERVhR4wYaO/1TbOqJAbwExFLPkdHuE/vrc1oUnKTqjmBkGDhSiofGyT6yVrJJQwmxxkN
	F7cNSnNb5F8iPFPsi/ll2RcCcnJwLQ1kFkOggdG3MLhAaF2kZKL0t+pod73hCGO8PSu8
	IaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:cc:references:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qvNL9svjg5AS0ARV4bzfEgBC44WlBGgigdO7g+BEaTc=;
	b=K6J2SBWo7vyzfFMiUUwpwU29Cb7zMLTo6+43gRwggQDXKswsaa0ZYsOLKkDD6i0rU2
	GPuQyUJ2hySZBiaSUamVxsq05LUFRQAvjF0/sxnV8lhmUwC886TL4HfsrWD79z55Adh0
	07g5wZvKT7X8WZAf5HHOn2DDd1kzpFV9Gr6YoCqRv0wJnIH7PbfxYO36AhROF8WtGlIR
	yQ6jMd63/vehF96pyNjINkGhpixymRnNqOz+8BYfeyvl3d8CeTuhWiY6B4UzmClgEw19
	c7T0ktPYWym3dzGP3RH8olpulOy7n3AskYKviXmgg2YvdJjbTJ0o+byFRa1u5NWGFXIQ
	2hTA==
X-Gm-Message-State: AHPjjUgbPEy2SpBAeMXA5cDfOd2D/3X0jRbIFvt0i5sT7yT/zZLYs3Ui
	2/CHAIi/v0P5Kr/omBk=
X-Google-Smtp-Source: AOwi7QBgXdV6v6RRw9y4ZnvRUjAkE9quzHFcu4WixEgrj89Z4fhZhclZGeQteSGTSwgP/2rj6wk7pA==
X-Received: by 10.55.174.65 with SMTP id x62mr1039453qke.200.1505363795387;
	Wed, 13 Sep 2017 21:36:35 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	e39sm10875229qtb.67.2017.09.13.21.36.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 21:36:34 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-3-git-send-email-sundeep.lkml@gmail.com>
Message-ID: <a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
Date: Thu, 14 Sep 2017 01:36:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504812251-23438-3-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: Re: [Qemu-devel] [Qemu devel v8 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VI9XwXX0CyAu

Hi Sundeep,

On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
> Added Sytem register block of Smartfusion2.
> This block has PLL registers which are accessed by guest.
> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>   hw/misc/Makefile.objs         |   1 +
>   hw/misc/msf2-sysreg.c         | 195 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/misc/msf2-sysreg.h |  78 +++++++++++++++++
>   3 files changed, 274 insertions(+)
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
> index 0000000..40d603d
> --- /dev/null
> +++ b/hw/misc/msf2-sysreg.c
> @@ -0,0 +1,195 @@
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

Please directly use ctz32() instead of msf2_divbits()

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

This comment is controversial, I'll let Peter nod.

The SYSREG behaves differently regarding which bus access it (CPU, AHB).
You are implementing CPU access to the SYSREG, the registers have 
different permissions when accessed by the CPU. (see the SmartFusion2 
User Guide: Table 21-1 "Register Types" and Table 21-2 "Register Map").

I'd think of this stub:

switch(reg) {
case register_supported1:
case register_supported2:
case register_supported3:
            ret = s->regs[offset];
      	   trace_msf2_sysreg_read(offset, ret);
            break;
case RO-U:
            qemu_log_mask(LOG_GUEST_ERROR, "Illegal AHB access 0x%08"...
            break;
case W1P:
            qemu_log_mask(LOG_GUEST_ERROR, "Illegal read access ...
            break;
case RW:
case RW-P:
case RO:
case RO-P:
default:
            ret = s->regs[offset];
            qemu_log_mask(LOG_UNIMP, "...
            break;
}

Anyway keep this comment for further improvements, it's probably not 
useful for your use case.

> +        ret = s->regs[offset];
> +        DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx32,
> +                    offset << 2, ret);

Can you replace DB_PRINT by traces? such:

	   trace_msf2_sysreg_read(...);

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
> +    DB_PRINT("addr: 0x%08" HWADDR_PRIx " data: 0x%08" PRIx64,
> +            offset, val);
> +
> +    offset >>= 2;
> +
> +    switch (offset) {
> +    case MSSDDR_PLL_STATUS:
	   trace_msf2_sysreg_write_pll_status();

> +        break;
> +
> +    case ESRAM_CR:
> +        if (newval != s->regs[ESRAM_CR]) {
> +            qemu_log_mask(LOG_GUEST_ERROR,

Since this isn't a guest error, use LOG_UNIMP instead.

> +                       TYPE_MSF2_SYSREG": eSRAM remapping not supported\n");
> +        }
> +        break;
> +
> +    case DDR_CR:
> +        if (newval != s->regs[DDR_CR]) {
> +            qemu_log_mask(LOG_GUEST_ERROR,

LOG_UNIMP

> +                       TYPE_MSF2_SYSREG": DDR remapping not supported\n");
> +        }
> +        break;
> +
> +    case ENVM_REMAP_BASE_CR:
> +        if (newval != s->regs[ENVM_REMAP_BASE_CR]) {
> +            qemu_log_mask(LOG_GUEST_ERROR,

LOG_UNIMP

> +                       TYPE_MSF2_SYSREG": eNVM remapping not supported\n");
> +        }
> +        break;
> +

Or shorter:

     case ESRAM_CR:
     case DDR_CR:
     case ENVM_REMAP_BASE_CR:
          oldval = s->regs[offset];
          if (oldval ^ newval) {
              qemu_log_mask(LOG_UNIMP,
                         TYPE_MSF2_SYSREG": remapping not supported\n");
          }
          break;


> +    default:
> +        if (offset < ARRAY_SIZE(s->regs)) {

	   trace_msf2_sysreg_write(offset, val, s->regs[offset]);

> +            s->regs[offset] = newval;
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
> +                        offset << 2);
> +        }
> +        break;
> +    }
> +}

Good work, almost there, next respin should be ready for Peter to take 
in arm-next :)

Regards,

Phil.
