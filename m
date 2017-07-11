Received: by 10.25.44.15 with SMTP id s15csp4804052lfs;
        Tue, 11 Jul 2017 06:02:12 -0700 (PDT)
X-Received: by 10.31.81.2 with SMTP id f2mr6033667vkb.43.1499778132344;
        Tue, 11 Jul 2017 06:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499778132; cv=none;
        d=google.com; s=arc-20160816;
        b=pAkM0IU/fIfENjdnXuZUJeHfEK5sTJ/5wtalj+t80Ph81RiZMHC8FI1cItJnOJdQov
         68TIxccxNP7dKReKkbR4dT1JTPnV0IjKfMRteoF/hIQAUAv6o10QfaFgVKYbLFI1Tu1c
         xWYj7Z1LfAWWhv4XQFKyLNpWL4aepPlojVHpGOiayklgNv4ZdcxPgzICW7RV9ZzqyyVp
         zSYpVXFwjcXWpP963AUGtubBvHNzjE5kHBS+OY8PDlvOC6hUx1pm85ojnHSB9MLWOPWl
         O6PIzHdE6IVFlyArXbzgul8X0FSeEbnhBBteGDYIW31BIFuERrHvmdDigcd6mMzeCryp
         zfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=NdFNDR0HuLFhCqmJeN1iZjanHMUqGYMDJkN34N915QM=;
        b=bndnyDoqd8mhuL4sHNIEywLmnrQZVslKNBx+Z2pA+MNYsYjbaTyXCvmgobSryrLxp2
         RSS4S0zFgZWqqxLhYZA975PtDIMWpxGOvLCwrYcRYZqplmjRhX6tACODUWqTvdh6CLe4
         wOOBA3OVaLQA6aSEVY8WB+1ne3luFbrI+I3cVpC7gnizRLJ+MLwlvs83ACMvo1yAwEqT
         LAZqu175GYENa/EFY67HcZ5tjdgPgh/WMmH8pEE7iaDxi/fkN+cgIOCxCjO/AMigYiNm
         bYWA7ahtVy6iDaCcWflTZMC/5Mx035Bs0ELnYApvGWchhF2gc7pmdCnSSp8OQjCf/J1l
         RwPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Eh4fnsqb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s26si7518696uaf.291.2017.07.11.06.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 06:02:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Eh4fnsqb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUuno-0003Wi-QT
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 09:02:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUuh4-0006br-Dt
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 08:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUuh2-0001Ge-D4
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 08:55:10 -0400
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35979)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUugw-0001By-Gn; Tue, 11 Jul 2017 08:55:02 -0400
Received: by mail-qk0-f195.google.com with SMTP id v143so17311363qkb.3;
	Tue, 11 Jul 2017 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NdFNDR0HuLFhCqmJeN1iZjanHMUqGYMDJkN34N915QM=;
	b=Eh4fnsqb3zg22l9ecp092HU882Y/Rt0UyVQafk98eNTem10sYJVjhg+LAf8ddoSFC3
	XZBFVT8zutbo+BmhOubKoAs8hPA+ZV2qcaYIqWxaW8KGFAmfcoUdNkXb6FzIntJBcLsg
	uBpFrSfmNvwKMmPzjSnIpnETrEFxgitrZ1wUaCd675pRhby5PU/fzlNKBQSeuZgbMVzD
	5ZBXJlP7TVSSXS0o0vOFF+IjmMq3aGHYPFv/hkAw+SJrdrbRD7i7QC2EGTAa0GYXkghd
	NyUv8h70BgPsx09yawhr7Vj3/xki0m+pR55lmsvjvQ/+l/BKNvxelZGNcW313tgDp8ae
	pinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NdFNDR0HuLFhCqmJeN1iZjanHMUqGYMDJkN34N915QM=;
	b=B367EjJc+BV8V0dxhd4wKMak0+Rh5DMADxsyGDVmD8eQ23P/4hlVgi0H/NAp+a2gSt
	mQD6woQe0w8SS8TuVFIoWyeyDFu9ak6GXCQn0lCGRQyXKEJtPMj7gyr+/HzDDbgsJrJm
	B1ZReGT70QYSC+JfKGXOjKiF+B0M1mtA9s91ohjeUWwV2w6iP31ZIfgDplF2Sr9r/Dt5
	081nP/5yAXs94m0KP4J4pO8dgNdjdnuZDUbB702276ZN965jDCbMy7CKFao2FuZ2ejZR
	5frPo5UjC19gcSh1Ror8dB6+4/j6k+X5FkduOv3FlztxEt51WNH9mUaEJ7wYLNBuaKxC
	PeGw==
X-Gm-Message-State: AIVw113eyWuz9trFZxx+7KmCQ291knz3zZ59HNuKxTlbwEIOQ1LYMdiE
	5HpUSLSmpa1R6w==
X-Received: by 10.200.34.248 with SMTP id g53mr10886659qta.65.1499777641416;
	Tue, 11 Jul 2017 05:54:01 -0700 (PDT)
Received: from [192.168.1.124] ([190.48.66.60])
	by smtp.gmail.com with ESMTPSA id
	p13sm6820652qkl.58.2017.07.11.05.53.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 05:54:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-7-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b3cd94f2-8a32-9b09-54b1-0cfa6eff0c36@amsat.org>
Date: Tue, 11 Jul 2017 09:53:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499771839-32518-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.195
Subject: Re: [Qemu-arm] [PATCH 6/7] hw/misc/mps2_scc: Implement MPS2 Serial
 Communication Controller
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gSv7ckhh6iQZ

I Peter,

On 07/11/2017 08:17 AM, Peter Maydell wrote:
> Implement a model of the Serial Communication Controller (SCC) found
> in MPS2 FPGA images.
> 
> The primary purpose of this device is to communicate with the
> Motherboard Configuration Controller (MCC) which is located on
> the MPS board itself, outside the FPGA image. This is used
> for programming the MPS clock generators. The SCC also has
> some basic ID registers and an output for the board LEDs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/Makefile.objs           |   1 +
>   include/hw/misc/mps2-scc.h      |  43 ++++++
>   hw/misc/mps2-scc.c              | 310 ++++++++++++++++++++++++++++++++++++++++

Hmm I understand hw/ssi is for Synchronous Serial Interface, this 
interface doesn't belong there?

>   default-configs/arm-softmmu.mak |   2 +
>   hw/misc/trace-events            |   8 ++
>   5 files changed, 364 insertions(+)
>   create mode 100644 include/hw/misc/mps2-scc.h
>   create mode 100644 hw/misc/mps2-scc.c
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 44e0e79..9399715 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -52,6 +52,7 @@ obj-$(CONFIG_STM32F2XX_SYSCFG) += stm32f2xx_syscfg.o
>   obj-$(CONFIG_MIPS_CPS) += mips_cmgcr.o
>   obj-$(CONFIG_MIPS_CPS) += mips_cpc.o
>   obj-$(CONFIG_MIPS_ITU) += mips_itu.o
> +obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
>   
>   obj-$(CONFIG_PVPANIC) += pvpanic.o
>   obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
> diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
> new file mode 100644
> index 0000000..6a60f0d
> --- /dev/null
> +++ b/include/hw/misc/mps2-scc.h
> @@ -0,0 +1,43 @@
> +/*
> + * ARM CMSDK APB timer emulation

ARM MPS2 SCC emulation

> + *
> + * Copyright (c) 2017 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#ifndef MPS2_SCC_H
> +#define MPS2_SCC_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_MPS2_SCC "mps2-scc"
> +#define MPS2_SCC(obj) OBJECT_CHECK(MPS2SCC, (obj), TYPE_MPS2_SCC)
> +
> +#define NUM_OSCCLK 3
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +
> +    uint32_t cfg0;
> +    uint32_t cfg1;
> +    uint32_t cfg4;
> +    uint32_t cfgdata_rtn;
> +    uint32_t cfgdata_out;
> +    uint32_t cfgctrl;
> +    uint32_t cfgstat;
> +    uint32_t dll;
> +    uint32_t aid;
> +    uint32_t id;
> +    uint32_t oscclk[NUM_OSCCLK];
> +    uint32_t oscclk_reset[NUM_OSCCLK];
> +} MPS2SCC;
> +
> +#endif
> diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
> new file mode 100644
> index 0000000..cc58d26
> --- /dev/null
> +++ b/hw/misc/mps2-scc.c
> @@ -0,0 +1,310 @@
> +/*
> + * ARM MPS2 SCC emulation
> + *
> + * Copyright (c) 2017 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/* This is a model of the SCC (Serial Communication Controller)
> + * found in the FPGA images of MPS2 development boards.
> + *
> + * Documentation of it can be found in the MPS2 TRM:
> + * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.100112_0100_03_en/index.html
> + * and also in the Application Notes documenting individual FPGA images.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "hw/misc/mps2-scc.h"
> +
> +REG32(CFG0, 0)
> +REG32(CFG1, 4)
> +REG32(CFG3, 0xc)
> +REG32(CFG4, 0x10)
> +REG32(CFGDATA_RTN, 0xa0)
> +REG32(CFGDATA_OUT, 0xa4)
> +REG32(CFGCTRL, 0xa8)
> +    FIELD(CFGCTRL, DEVICE, 0, 12)
> +    FIELD(CFGCTRL, RES1, 12, 8)
> +    FIELD(CFGCTRL, FUNCTION, 20, 6)
> +    FIELD(CFGCTRL, RES2, 26, 4)
> +    FIELD(CFGCTRL, WRITE, 30, 1)
> +    FIELD(CFGCTRL, START, 31, 1)
> +REG32(CFGSTAT, 0xac)
> +    FIELD(CFGSTAT, DONE, 0, 1)
> +    FIELD(CFGSTAT, ERROR, 1, 1)
> +REG32(DLL, 0x100)
> +REG32(AID, 0xFF8)
> +REG32(ID, 0xFFC)
> +
> +/* Handle a write via the SYS_CFG channel to the specified function/device.
> + * Return false on error (reported to guest via SYS_CFGCTRL ERROR bit).
> + */
> +static bool scc_cfg_write(MPS2SCC *s, unsigned function,
> +                          unsigned device, uint32_t value)
> +{
> +    trace_mps2_scc_cfg_write(function, device, value);
> +
> +    if (function != 1 || device >= NUM_OSCCLK) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "MPS2 SCC config write: bad function %d device %d\n",
> +                      function, device);
> +        return false;
> +    }
> +
> +    s->oscclk[device] = value;
> +    return true;
> +}
> +
> +/* Handle a read via the SYS_CFG channel to the specified function/device.
> + * Return false on error (reported to guest via SYS_CFGCTRL ERROR bit),
> + * or set *value on success.
> + */
> +static bool scc_cfg_read(MPS2SCC *s, unsigned function,
> +                         unsigned device, uint32_t *value)
> +{
> +    if (function != 1 || device >= NUM_OSCCLK) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "MPS2 SCC config read: bad function %d device %d\n",
> +                      function, device);
> +        return false;
> +    }
> +
> +    *value = s->oscclk[device];
> +
> +    trace_mps2_scc_cfg_read(function, device, *value);
> +    return true;
> +}
> +
> +static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    MPS2SCC *s = MPS2_SCC(opaque);
> +    uint64_t r;
> +
> +    switch (offset) {
> +    case A_CFG0:
> +        r = s->cfg0;
> +        break;
> +    case A_CFG1:
> +        r = s->cfg1;
> +        break;
> +    case A_CFG3:
> +        /* These are user-settable DIP switches on the board. We don't
> +         * model that, so just return zeroes.
> +         */

Shouldn't be hard to have a property (thinking about having multiple 
boards and using those switches to have some board unique ID, not 
switches one might toggle at runtime).

> +        r = 0;
> +        break;
> +    case A_CFG4:
> +        r = s->cfg4;
> +        break;
> +    case A_CFGDATA_RTN:
> +        r = s->cfgdata_rtn;
> +        break;
> +    case A_CFGDATA_OUT:
> +        r = s->cfgdata_out;
> +        break;
> +    case A_CFGCTRL:
> +        r = s->cfgctrl;
> +        break;
> +    case A_CFGSTAT:
> +        r = s->cfgstat;
> +        break;
> +    case A_DLL:
> +        r = s->dll;
> +        break;
> +    case A_AID:
> +        r = s->aid;
> +        break;
> +    case A_ID:
> +        r = s->id;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "MPS2 SCC read: bad offset %x\n", (int) offset);
> +        r = 0;
> +        break;
> +    }
> +
> +    trace_mps2_scc_read(offset, r, size);
> +    return r;
> +}
> +
> +static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
> +                           unsigned size)
> +{
> +    MPS2SCC *s = MPS2_SCC(opaque);
> +
> +    trace_mps2_scc_write(offset, value, size);
> +
> +    switch (offset) {
> +    case A_CFG0:
> +        /* TODO on some boards bit 0 controls RAM remapping */
> +        s->cfg0 = value;
> +        break;
> +    case A_CFG1:
> +        /* CFG1 bits [7:0] control the board LEDs. We don't currently have
> +         * a mechanism for displaying this graphically, so use a trace event.
> +         */

Well MIPS Jazz uses hw/display/jazz_led.c which is kinda nice :)

Now than there is interest in simulating IoT boards and so, we might 
think about a generic LED display.

> +        trace_mps2_scc_leds(value & 0x80 ? '*' : '.',
> +                            value & 0x40 ? '*' : '.',
> +                            value & 0x20 ? '*' : '.',
> +                            value & 0x10 ? '*' : '.',
> +                            value & 0x08 ? '*' : '.',
> +                            value & 0x04 ? '*' : '.',
> +                            value & 0x02 ? '*' : '.',
> +                            value & 0x01 ? '*' : '.');
> +        s->cfg1 = value;
> +        break;
> +    case A_CFGDATA_OUT:
> +        s->cfgdata_out = value;
> +        break;
> +    case A_CFGCTRL:
> +        /* Writing to CFGCTRL clears SYS_CFGSTAT */
> +        s->cfgstat = 0;
> +        s->cfgctrl = value & ~(R_CFGCTRL_RES1_MASK |
> +                               R_CFGCTRL_RES2_MASK |
> +                               R_CFGCTRL_START_MASK);
> +
> +        if (value & R_CFGCTRL_START_MASK) {
> +            /* Start bit set -- do a read or write (instantaneously) */
> +            int device = extract32(s->cfgctrl, R_CFGCTRL_DEVICE_SHIFT,
> +                                   R_CFGCTRL_DEVICE_LENGTH);
> +            int function = extract32(s->cfgctrl, R_CFGCTRL_FUNCTION_SHIFT,
> +                                     R_CFGCTRL_FUNCTION_LENGTH);
> +
> +            s->cfgstat = R_CFGSTAT_DONE_MASK;
> +            if (s->cfgctrl & R_CFGCTRL_WRITE_MASK) {
> +                if (!scc_cfg_write(s, function, device, s->cfgdata_out)) {
> +                    s->cfgstat |= R_CFGSTAT_ERROR_MASK;
> +                }
> +            } else {
> +                uint32_t result;
> +                if (!scc_cfg_read(s, function, device, &result)) {
> +                    s->cfgstat |= R_CFGSTAT_ERROR_MASK;
> +                } else {
> +                    s->cfgdata_rtn = result;
> +                }
> +            }
> +        }
> +        break;
> +    case A_DLL:
> +        /* DLL stands for Digital Locked Loop.
> +         * Bits [31:24] (DLL_LOCK_MASK) are writable, and indicate a
> +         * mask of which of the DLL_LOCKED bits [16:23] should be ORed
> +         * together to determine the ALL_UNMASKED_DLLS_LOCKED bit [0].
> +         * For QEMU, our DLLs are always locked, so we can leave bit 0
> +         * as 1 always and don't need to recalculate it.
> +         */
> +        s->dll = deposit32(s->dll, 24, 8, extract32(value, 24, 8));
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "MPS2 SCC write: bad offset 0x%x\n", (int) offset);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps mps2_scc_ops = {
> +    .read = mps2_scc_read,
> +    .write = mps2_scc_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void mps2_scc_reset(DeviceState *dev)
> +{
> +    MPS2SCC *s = MPS2_SCC(dev);
> +    int i;
> +
> +    trace_mps2_scc_reset();
> +    s->cfg0 = 0;
> +    s->cfg1 = 0;
> +    s->cfgdata_rtn = 0;
> +    s->cfgdata_out = 0;
> +    s->cfgctrl = 0x100000;
> +    s->cfgstat = 0;
> +    s->dll = 0xffff0001;
> +    for (i = 0; i < NUM_OSCCLK; i++) {
> +        s->oscclk[i] = s->oscclk_reset[i];
> +    }
> +}
> +
> +static void mps2_scc_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    MPS2SCC *s = MPS2_SCC(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &mps2_scc_ops, s, "mps2-scc", 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void mps2_scc_realize(DeviceState *dev, Error **errp)
> +{
> +}
> +
> +static const VMStateDescription mps2_scc_vmstate = {
> +    .name = "mps2-scc",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(cfg0, MPS2SCC),
> +        VMSTATE_UINT32(cfg1, MPS2SCC),
> +        VMSTATE_UINT32(cfgdata_rtn, MPS2SCC),
> +        VMSTATE_UINT32(cfgdata_out, MPS2SCC),
> +        VMSTATE_UINT32(cfgctrl, MPS2SCC),
> +        VMSTATE_UINT32(cfgstat, MPS2SCC),
> +        VMSTATE_UINT32(dll, MPS2SCC),
> +        VMSTATE_UINT32_ARRAY(oscclk, MPS2SCC, NUM_OSCCLK),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property mps2_scc_properties[] = {
> +    /* Values for various read-only ID registers (which are specific
> +     * to the board model or FPGA image)
> +     */
> +    DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, aid, 0),
> +    DEFINE_PROP_UINT32("scc-aid", MPS2SCC, aid, 0),
> +    DEFINE_PROP_UINT32("scc-id", MPS2SCC, aid, 0),
> +    /* These are the initial settings for the source clocks on the board.
> +     * In hardware they can be configured via a config file read by the
> +     * motherboard configuration controller to suit the FPGA image.
> +     * These default values are used by most of the standard FPGA images.
> +     */
> +    DEFINE_PROP_UINT32("oscclk0", MPS2SCC, oscclk_reset[0], 50000000),
> +    DEFINE_PROP_UINT32("oscclk1", MPS2SCC, oscclk_reset[1], 24576000),
> +    DEFINE_PROP_UINT32("oscclk2", MPS2SCC, oscclk_reset[2], 25000000),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void mps2_scc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = mps2_scc_realize;
> +    dc->vmsd = &mps2_scc_vmstate;
> +    dc->reset = mps2_scc_reset;
> +    dc->props = mps2_scc_properties;
> +}
> +
> +static const TypeInfo mps2_scc_info = {
> +    .name = TYPE_MPS2_SCC,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(MPS2SCC),
> +    .instance_init = mps2_scc_init,
> +    .class_init = mps2_scc_class_init,
> +};
> +
> +static void mps2_scc_register_types(void)
> +{
> +    type_register_static(&mps2_scc_info);
> +}
> +
> +type_init(mps2_scc_register_types);
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index c75f52c..bbdd3c1 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -99,6 +99,8 @@ CONFIG_STM32F205_SOC=y
>   CONFIG_CMSDK_APB_TIMER=y
>   CONFIG_CMSDK_APB_UART=y
>   
> +CONFIG_MPS2_SCC=y
> +
>   CONFIG_VERSATILE_PCI=y
>   CONFIG_VERSATILE_I2C=y
>   
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 0cc556c..28b8cd1 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -53,3 +53,11 @@ milkymist_pfpu_pulse_irq(void) "Pulse IRQ"
>   
>   # hw/misc/aspeed_scu.c
>   aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
> +
> +# hw/misc/mps2_scc.c
> +mps2_scc_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +mps2_scc_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +mps2_scc_reset(void) "MPS2 SCC: reset"
> +mps2_scc_leds(char led7, char led6, char led5, char led4, char led3, char led2, char led1, char led0) "MPS2 SCC LEDs: %c%c%c%c%c%c%c%c"
> +mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config write: function %d device %d data 0x%" PRIx32
> +mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config read: function %d device %d data 0x%" PRIx32
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
