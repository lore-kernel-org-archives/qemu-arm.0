Received: by 10.37.193.4 with SMTP id r4csp2715147ybf;
        Mon, 24 Oct 2016 04:28:29 -0700 (PDT)
X-Received: by 10.55.66.76 with SMTP id p73mr15835558qka.284.1477308509619;
        Mon, 24 Oct 2016 04:28:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n21si10668578qki.29.2016.10.24.04.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 04:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bydQa-0004D2-GH
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 07:28:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bydOu-0003LV-5f
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 07:26:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bydOt-0006Ts-3M
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 07:26:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1bydOm-0006T9-NT; Mon, 24 Oct 2016 07:26:36 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F25BD4E356;
	Mon, 24 Oct 2016 11:26:35 +0000 (UTC)
Received: from [10.36.112.47] (ovpn-112-47.ams2.redhat.com [10.36.112.47])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9OBQS0B002703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 24 Oct 2016 07:26:31 -0400
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, vijay.kilari@gmail.com
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
	<1477288523-10819-3-git-send-email-vijay.kilari@gmail.com>
	<20161024093943.GC2190@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1dd8326f-1aa2-f7f9-3f6b-b6555d377786@redhat.com>
Date: Mon, 24 Oct 2016 13:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161024093943.GC2190@work-vm>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 24 Oct 2016 11:26:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 2/3] utils: Add helper to read arm
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-devel@nongnu.org,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dbQAeYkI2Fnf



On 24/10/2016 11:39, Dr. David Alan Gilbert wrote:
> * vijay.kilari@gmail.com (vijay.kilari@gmail.com) wrote:
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
>>  util/aarch64-cpuid.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++
> 
> It feels like there should be somewhere else to put this very ARM specific thing
> that in util/ - not sure where though.

It's okay I guess, the name is pretty clear.  What's important is a
clear split of arch-specific and generic code in bufferiszero.c.

Paolo

>>  3 files changed, 97 insertions(+)
>>
>> diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
> 
>> new file mode 100644
>> index 0000000..dbcb5ff
>> --- /dev/null
>> +++ b/include/qemu/aarch64-cpuid.h
>> @@ -0,0 +1,9 @@
>> +#ifndef QEMU_AARCH64_CPUID_H
>> +#define QEMU_AARCH64_CPUID_H
>> +
>> +#if defined(__aarch64__)
>> +uint64_t get_aarch64_cpu_id(void);
>> +bool is_thunderx_pass2_cpu(void);
>> +#endif
>> +
>> +#endif
>> diff --git a/util/Makefile.objs b/util/Makefile.objs
>> index 36c7dcc..d14a455 100644
>> --- a/util/Makefile.objs
>> +++ b/util/Makefile.objs
>> @@ -37,3 +37,4 @@ util-obj-y += log.o
>>  util-obj-y += qdist.o
>>  util-obj-y += qht.o
>>  util-obj-y += range.o
>> +util-obj-y += aarch64-cpuid.o
>> diff --git a/util/aarch64-cpuid.c b/util/aarch64-cpuid.c
>> new file mode 100644
>> index 0000000..a6352ad
>> --- /dev/null
>> +++ b/util/aarch64-cpuid.c
>> @@ -0,0 +1,87 @@
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
>> +#include <math.h>
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include "qemu/cutils.h"
>> +#include "qemu/aarch64-cpuid.h"
>> +
>> +#if defined(__aarch64__)
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
> 
> Do you need to do that? Isn't g_file_get_contents doing the allocation?
> 
> Dave
> 
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
>> +static uint64_t aarch64_midr_val;
>> +uint64_t get_aarch64_cpu_id(void)
>> +{
>> +#ifdef CONFIG_LINUX
>> +    aarch64_midr_val = qemu_read_aarch64_midr_el1();
>> +    aarch64_midr_val &= CPU_MODEL_MASK;
>> +
>> +    return aarch64_midr_val;
>> +#else
>> +    return 0;
>> +#endif
>> +}
>> +
>> +bool is_thunderx_pass2_cpu(void)
>> +{
>> +    return aarch64_midr_val == MIDR_THUNDERX_PASS2;
>> +}
>> +#endif
>> -- 
>> 1.9.1
>>
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
