Received: by 10.25.21.156 with SMTP id 28csp193205lfv;
        Thu, 18 Aug 2016 00:57:32 -0700 (PDT)
X-Received: by 10.55.4.22 with SMTP id 22mr825030qke.286.1471507052355;
        Thu, 18 Aug 2016 00:57:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i66si481391qkc.268.2016.08.18.00.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 00:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baICh-0006Pn-Qn
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 03:57:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1baIBR-0005ls-Mp
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 03:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1baIBQ-0005uF-Eg
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 03:56:13 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36297)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1baIBM-0005tJ-AE; Thu, 18 Aug 2016 03:56:08 -0400
Received: by mail-oi0-x243.google.com with SMTP id b22so2661440oii.3;
	Thu, 18 Aug 2016 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pTJ0XAtZxM0ux/S8Wx05VgtVw5hUluCF3nnIO12NdEY=;
	b=wo1vfbZvcLgKcv85VwKp3VvvqswSG/ORllmylNeySwz7LBPziQD7w6SKV87jK6sZOD
	WOG7hip0iaatjIljsyNpCbMmh/Ub+LfA0J21o4rkNTn0axwlyOHWDz/brzCOGwnjsKUG
	TxbVSh/NBXaYJe2WuE18HykRRwunwsYH1dkSUnTk305/25iwc/1DTTz/SN7sl2lK8+Zi
	6b+jhVgRq6OzcxnG4ugoJWGDBg+ZEZ8yBew0//EBI3U0FZsmLMWeBo6Itv3BvtB+l2Iu
	RQ/bfdkBc+URgNhlv4gNfqA2mQZ+ZKsJQ7AAPm6B4z2Uz0PW519I0ngqML9JZcLzlE/E
	D1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pTJ0XAtZxM0ux/S8Wx05VgtVw5hUluCF3nnIO12NdEY=;
	b=XnkIVDZ8zbWX4AwDs+OXdmzLT2veBnRScWqbRsCNvng+cRUXDHfBWEU6F7t0S8joaC
	2lqQL661Svq5gvd6JJ9PBU8L10EpXUmiSGpGg4mfTqMp3zsdeCXL5NhzC7el4jioXnJz
	rwM44c+X3DkjQvtfHIw6ZvK0GstLBwizgpsMv6W30SkZjuFd/NPcc2ZukCdV303CQFbX
	TuvpjWGP5vGyaz/g2L5C+FKWz5RTt2KTLi6qR1xOLeQpZok+vzE4w4phv74QuwFyTeA5
	to3pi/FdcBZ9EqFthQfNCyRRO+pjeIJP3Y79vlPkO7FtAh8adsddib4I6p8p7yl0s9wC
	EXFg==
X-Gm-Message-State: AEkooutjW3+LQjE9gaTIDuz7/GGK3H+VH4Ox8QZE9LrS8eGNdnjIpffYK3IvuAIORQrF39CIG/yHSOtIk4cJqg==
X-Received: by 10.157.7.114 with SMTP id 105mr421629ote.145.1471506967492;
	Thu, 18 Aug 2016 00:56:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.244 with HTTP; Thu, 18 Aug 2016 00:56:07 -0700 (PDT)
In-Reply-To: <151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Thu, 18 Aug 2016 13:26:07 +0530
Message-ID: <CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z7k6kmX1OMzT

On Wed, Aug 17, 2016 at 7:09 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 16/08/2016 14:02, vijay.kilari@gmail.com wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> Add helper API to read MIDR_EL1 registers to fetch
>> cpu identification information. This helps in
>> adding errata's and architecture specific features.
>>
>> This is implemented only for arm architecture.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> ---
>>  include/qemu/aarch64-cpuid.h |  9 +++++
>>  util/Makefile.objs           |  1 +
>>  util/aarch64-cpuid.c         | 94 ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 104 insertions(+)
>>
>> diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
>> new file mode 100644
>> index 0000000..3c11057
>> --- /dev/null
>> +++ b/include/qemu/aarch64-cpuid.h
>> @@ -0,0 +1,9 @@
>> +#ifndef QEMU_AARCH64_CPUID_H
>> +#define QEMU_AARCH64_CPUID_H
>> +
>> +#if defined (__aarch64__)
>> +uint64_t get_aarch64_cpu_id(void);
>> +bool is_thunderx_pass2_cpu(void);
>> +#endif
>> +
>> +#endif
>> diff --git a/util/Makefile.objs b/util/Makefile.objs
>> index 96cb1e0..aa07bc3 100644
>> --- a/util/Makefile.objs
>> +++ b/util/Makefile.objs
>> @@ -35,3 +35,4 @@ util-obj-y += log.o
>>  util-obj-y += qdist.o
>>  util-obj-y += qht.o
>>  util-obj-y += range.o
>> +util-obj-y += aarch64-cpuid.o
>> diff --git a/util/aarch64-cpuid.c b/util/aarch64-cpuid.c
>> new file mode 100644
>> index 0000000..42af704
>> --- /dev/null
>> +++ b/util/aarch64-cpuid.c
>> @@ -0,0 +1,94 @@
>> +/*
>> + * Dealing with arm cpu identification information.
>> + *
>> + * Copyright (C) 2016 Cavium, Inc.
>> + *
>> + * Authors:
>> + *  Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> + *
>> + * This work is licensed under the terms of the GNU LGPL, version 2.1
>> + * or later.  See the COPYING.LIB file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include "qemu/cutils.h"
>> +#include "qemu/aarch64-cpuid.h"
>> +
>> +#if defined (__aarch64__)
>> +#define MIDR_IMPLEMENTER_SHIFT  24
>> +#define MIDR_IMPLEMENTER_MASK   (0xffULL << MIDR_IMPLEMENTER_SHIFT)
>> +#define MIDR_ARCHITECTURE_SHIFT 16
>> +#define MIDR_ARCHITECTURE_MASK  (0xf << MIDR_ARCHITECTURE_SHIFT)
>> +#define MIDR_PARTNUM_SHIFT      4
>> +#define MIDR_PARTNUM_MASK       (0xfff << MIDR_PARTNUM_SHIFT)
>> +
>> +#define MIDR_CPU_PART(imp, partnum) \
>> +        (((imp)                 << MIDR_IMPLEMENTER_SHIFT)  | \
>> +        (0xf                    << MIDR_ARCHITECTURE_SHIFT) | \
>> +        ((partnum)              << MIDR_PARTNUM_SHIFT))
>> +
>> +#define ARM_CPU_IMP_CAVIUM        0x43
>> +#define CAVIUM_CPU_PART_THUNDERX  0x0A1
>> +
>> +#define MIDR_THUNDERX_PASS2  \
>> +               MIDR_CPU_PART(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
>> +#define CPU_MODEL_MASK  (MIDR_IMPLEMENTER_MASK | MIDR_ARCHITECTURE_MASK | \
>> +                         MIDR_PARTNUM_MASK)
>> +
>> +static uint64_t qemu_read_aarch64_midr_el1(void)
>> +{
>> +#ifdef CONFIG_LINUX
>> +    const char *file = "/sys/devices/system/cpu/cpu0/regs/identification/midr_el1";
>> +    char *buf;
>> +    uint64_t midr = 0;
>> +
>> +#define BUF_SIZE 32
>> +    buf = g_malloc0(BUF_SIZE);
>> +    if (!buf) {
>> +        return 0;
>> +    }
>> +
>> +    if (!g_file_get_contents(file, &buf, 0, NULL)) {
>> +        goto out;
>> +    }
>> +
>> +    if (qemu_strtoull(buf, NULL, 0, &midr) < 0) {
>> +        goto out;
>> +    }
>> +
>> +out:
>> +    g_free(buf);
>> +
>> +    return midr;
>> +#else
>> +    return 0;
>> +#endif
>> +}
>> +
>> +static bool is_thunderx_cpu;
>> +static uint64_t aarch64_midr_val;
>> +uint64_t get_aarch64_cpu_id(void)
>> +{
>> +#ifdef CONFIG_LINUX
>> +    static bool cpu_info_read;
>> +
>> +    if (unlikely(!cpu_info_read)) {
>> +        aarch64_midr_val = qemu_read_aarch64_midr_el1();
>> +        aarch64_midr_val &= CPU_MODEL_MASK;
>> +        cpu_info_read = 1;
>> +        if (aarch64_midr_val == MIDR_THUNDERX_PASS2) {
>> +            is_thunderx_cpu = 1;
>> +        }
>> +    }
>> +    return aarch64_midr_val;
>> +#else
>> +    return 0;
>> +#endif
>> +}
>> +
>> +bool is_thunderx_pass2_cpu(void)
>> +{
>> +   return is_thunderx_cpu;
>
> This can be:
>
>    return get_aarch64_cpu_id() == MIDR_THUNDERX_PASS2;
>
> without the is_thunderx_cpu variable.

The get_aarch_cpu_id() has check " if (unlikely(!cpu_info_read)) ".
If we call get_aarch_cpu_id() from is_thunderx_pass2_cpu() which is
called from inside the loop, we will be adding one additional check.

What I observed is having extra check inside the loop is adding 100 to
200ms overhead
on live migration time. So I added this variable extra is_thunderx_cpu
static variable
to make it simple single check.

>
> Paolo
>
>> +}
>> +#endif
>>
