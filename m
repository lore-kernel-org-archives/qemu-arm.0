Received: by 10.25.208.137 with SMTP id h131csp2905849lfg;
        Thu, 19 May 2016 02:48:28 -0700 (PDT)
X-Received: by 10.140.31.130 with SMTP id f2mr12449658qgf.69.1463651308113;
        Thu, 19 May 2016 02:48:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 190si11566494qhi.30.2016.05.19.02.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 02:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3KZ9-00061l-GT
	for alex.bennee@linaro.org; Thu, 19 May 2016 05:48:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3KZ5-00060e-AY
	for qemu-arm@nongnu.org; Thu, 19 May 2016 05:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3KYx-0003wF-Q9
	for qemu-arm@nongnu.org; Thu, 19 May 2016 05:48:22 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3KYx-0003w9-Cf
	for qemu-arm@nongnu.org; Thu, 19 May 2016 05:48:15 -0400
Received: by mail-vk0-x230.google.com with SMTP id y2so25050474vka.3
	for <qemu-arm@nongnu.org>; Thu, 19 May 2016 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=77pxb5KVe/Hgi5aIqfRs0LXIfe19/a3HMcyeRJEeL8Y=;
	b=X4XYMXm2gAROukPPl8RPYIiHbtuIxgEWx8in3/3NavJCuvYynzhXyBPg5a6jlbydtc
	jO5MsGYFMALHzoXRfrWgalr6W5sma+N/vwqcjkBjDHwftoS3kNEvWeolILzUv3uXCWGm
	/Pg3sLQjyXBnzm8ZujSwDtMvujd+JyJ9XyBf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=77pxb5KVe/Hgi5aIqfRs0LXIfe19/a3HMcyeRJEeL8Y=;
	b=ObGINOzahvXA7rQDGJaGxYJxmuFDpYn2pbIYOt/6x8W2CkjLG47b1EyE9qIOhyFWZ2
	Wr9omaHyY4IyA0rC13/LjfdhrT4EKN5gLlROy3wYlieQL4xUY7FLGMEOIZc9nNSiz042
	Pq8PYxBdezBzlF+8pIOsRMVVEmWa6LyfK6+FJint48tcZsTbUvzvdpiBH9x5ba/LaQ/3
	YjPkuKJ5weq11jGdT2awNsPxQp663wZclGkzc9APZFsf8suz5yOCLNK8V3sNmvNF2fgF
	2G5awRP+j2+Ld7eEbnUvCgSWz7BYviNWggXK1ZFp4FK3mSeVOVacLsce+xJ9x1mmnVG5
	ojOA==
X-Gm-Message-State: AOPr4FWzs3KsCyviO8iwH4qclxC0Bbh9ksM0FxNQoFMZX919MFuPcd1H1JXsj2ogS6W/0xWeDcj2sSOds5oSzmUm
X-Received: by 10.31.88.196 with SMTP id m187mr6858704vkb.37.1463651294818;
	Thu, 19 May 2016 02:48:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 19 May 2016 02:47:55 -0700 (PDT)
In-Reply-To: <573D8916.4080102@huawei.com>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<1462814989-24360-7-git-send-email-peter.maydell@linaro.org>
	<573D8916.4080102@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2016 10:47:55 +0100
Message-ID: <CAFEAcA_SoGN+7txDQJxr0+i=9RjLfHYSeXxbzMJeZL4GUS8Leg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/23] hw/intc/arm_gicv3: Add
 state information
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sh07yOCIm6G6

On 19 May 2016 at 10:36, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/5/10 1:29, Peter Maydell wrote:
>> From: Pavel Fedin <p.fedin@samsung.com>
>>
>> Add state information to GICv3 object structure and implement
>> arm_gicv3_common_reset().
>>
>> This commit includes accessor functions for the fields which are
>> stored as bitmaps in uint32_t arrays.
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> [PMM: significantly overhauled:
>>  * Add missing qom/cpu.h include
>>  * Remove legacy-only state fields (we can add them later if/when we add
>>    legacy emulation)
>>  * Use arrays of uint32_t to store the various distributor bitmaps,
>>    and provide accessor functions for the various set/test/etc operations
>>  * Add various missing register offset #defines
>>  * Accessor macros which combine distributor and redistributor behaviour
>>    removed
>>  * Fields in state structures renamed to match architectural register names
>>  * Corrected the reset value for GICR_IENABLER0 since we don't support
>>    legacy mode
>>  * Added ARM_LINUX_BOOT_IF interface for "we are directly booting a kernel in
>>    non-secure" so that we can fake up the firmware-mandated reconfiguration
>>    only when we need it
>> ]
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/intc/arm_gicv3_common.c         | 140 ++++++++++++++++++++++++++-
>>  hw/intc/gicv3_internal.h           | 172 +++++++++++++++++++++++++++++++++
>>  include/hw/intc/arm_gicv3_common.h | 189 ++++++++++++++++++++++++++++++++++++-
>>  3 files changed, 496 insertions(+), 5 deletions(-)
>>  create mode 100644 hw/intc/gicv3_internal.h
>>
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index b9d3824..9ee4412 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -3,8 +3,9 @@
>>   *
>>   * Copyright (c) 2012 Linaro Limited
>>   * Copyright (c) 2015 Huawei.
>> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
>>   * Written by Peter Maydell
>> - * Extended to 64 cores by Shlomo Pongratz
>> + * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin
>>   *
>>   * This program is free software; you can redistribute it and/or modify
>>   * it under the terms of the GNU General Public License as published by
>> @@ -22,7 +23,10 @@
>>
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>> +#include "qom/cpu.h"
>>  #include "hw/intc/arm_gicv3_common.h"
>> +#include "gicv3_internal.h"
>> +#include "hw/arm/linux-boot-if.h"
>>
>>  static void gicv3_pre_save(void *opaque)
>>  {
>> @@ -90,6 +94,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>>  static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>>  {
>>      GICv3State *s = ARM_GICV3_COMMON(dev);
>> +    int i;
>>
>>      /* revision property is actually reserved and currently used only in order
>>       * to keep the interface compatible with GICv2 code, avoiding extra
>> @@ -100,11 +105,136 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>>          error_setg(errp, "unsupported GIC revision %d", s->revision);
>>          return;
>>      }
>> +
>> +    if (s->num_irq > GICV3_MAXIRQ) {
>> +        error_setg(errp,
>> +                   "requested %u interrupt lines exceeds GIC maximum %d",
>> +                   s->num_irq, GICV3_MAXIRQ);
>> +        return;
>> +    }
>> +
> Does it need to check if s->num_irq is less than 32?
>
>> +    s->cpu = g_new0(GICv3CPUState, s->num_cpu);
>> +
> And check if s->num_cpu is greater than 0?

Yes, we should probably use the same set of checks as the gicv2
common realize code does.


>> +    /* For our implementation affinity routing is always enabled */
>> +    if (s->security_extn) {
>> +        s->gicd_ctlr = GICD_CTLR_ARE_S | GICD_CTLR_ARE_NS;
>> +    } else {
>> +        s->gicd_ctlr = GICD_CTLR_DS | GICD_CTLR_ARE;
>> +    }
>> +
> I'm a little confused with the no security support case, and in that
> case, this GICv3 implementation supports only a single Security state,
> right? If so, the SPEC says the DS bit is "Disable Security. This field
> is RAO/WI." So why do you set the DS bit here?

We set the bit here exactly because it is RAO/WI: the bit
is set to 1 here, and we forbid changing it via register writes,
so it always reads as 1. Then all the rest of the GIC code[*] checks
(s->gicd_ctlr & GICD_CTLR_DS), which works whether this is a
no-security GIC or a with-security GIC that the guest has
configured to disable security.

[*] there are one or two config register values that architecturally
need to care about s->security_extn rather than the CTLR_DS bit.

>> +#define GICD_IROUTER         0x6000

> This should be 0x6100 or gicd_irouter[GICV3_MAXSPI] should use
> GIC_MAXIRQ in struct GICv3State. Otherwise gicd_read_irouter() will be
> wrong because s->gicd_irouter[irq] will be off normal upper if irq is
> e.g. GIC_MAXIRQ - 1.

I think we should leave this offset as 0x6000, and have
gicd_read_irouter() and other places that use the array subtract
GIC_INTERNAL from the irq number. This would then be in line
with how we handle gicd_ipriority[] (and with the bitmap regs).

>> +#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
>> +#define GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL << 12)
>> +#define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
>> +#define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
>> +#define GICR_PROPBASER_IDBITS_MASK             (0x1f)
> Use (0x1f << 0) to keep consistent?

Sure.

thanks
-- PMM
