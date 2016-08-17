Received: by 10.25.21.156 with SMTP id 28csp2524257lfv;
        Wed, 17 Aug 2016 06:39:26 -0700 (PDT)
X-Received: by 10.55.47.199 with SMTP id v190mr46111192qkh.45.1471441166240;
        Wed, 17 Aug 2016 06:39:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o129si19695183qka.188.2016.08.17.06.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 06:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba141-0000GG-KN
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 09:39:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ba13w-0000Ff-TV
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 09:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ba13r-0003zl-VO
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 09:39:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ba13r-0003zh-N6; Wed, 17 Aug 2016 09:39:15 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF4E1830;
	Wed, 17 Aug 2016 13:39:14 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7HDdA1n024507
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Aug 2016 09:39:12 -0400
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	rth@twiddle.net
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
Date: Wed, 17 Aug 2016 15:39:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 17 Aug 2016 13:39:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZZch3Eglklx



On 16/08/2016 14:02, vijay.kilari@gmail.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> 
> Add helper API to read MIDR_EL1 registers to fetch
> cpu identification information. This helps in
> adding errata's and architecture specific features.
> 
> This is implemented only for arm architecture.
> 
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---
>  include/qemu/aarch64-cpuid.h |  9 +++++
>  util/Makefile.objs           |  1 +
>  util/aarch64-cpuid.c         | 94 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+)
> 
> diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
> new file mode 100644
> index 0000000..3c11057
> --- /dev/null
> +++ b/include/qemu/aarch64-cpuid.h
> @@ -0,0 +1,9 @@
> +#ifndef QEMU_AARCH64_CPUID_H
> +#define QEMU_AARCH64_CPUID_H
> +
> +#if defined (__aarch64__)
> +uint64_t get_aarch64_cpu_id(void);
> +bool is_thunderx_pass2_cpu(void);
> +#endif
> +
> +#endif
> diff --git a/util/Makefile.objs b/util/Makefile.objs
> index 96cb1e0..aa07bc3 100644
> --- a/util/Makefile.objs
> +++ b/util/Makefile.objs
> @@ -35,3 +35,4 @@ util-obj-y += log.o
>  util-obj-y += qdist.o
>  util-obj-y += qht.o
>  util-obj-y += range.o
> +util-obj-y += aarch64-cpuid.o
> diff --git a/util/aarch64-cpuid.c b/util/aarch64-cpuid.c
> new file mode 100644
> index 0000000..42af704
> --- /dev/null
> +++ b/util/aarch64-cpuid.c
> @@ -0,0 +1,94 @@
> +/*
> + * Dealing with arm cpu identification information.
> + *
> + * Copyright (C) 2016 Cavium, Inc.
> + *
> + * Authors:
> + *  Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1
> + * or later.  See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/cutils.h"
> +#include "qemu/aarch64-cpuid.h"
> +
> +#if defined (__aarch64__)
> +#define MIDR_IMPLEMENTER_SHIFT  24
> +#define MIDR_IMPLEMENTER_MASK   (0xffULL << MIDR_IMPLEMENTER_SHIFT)
> +#define MIDR_ARCHITECTURE_SHIFT 16
> +#define MIDR_ARCHITECTURE_MASK  (0xf << MIDR_ARCHITECTURE_SHIFT)
> +#define MIDR_PARTNUM_SHIFT      4
> +#define MIDR_PARTNUM_MASK       (0xfff << MIDR_PARTNUM_SHIFT)
> +
> +#define MIDR_CPU_PART(imp, partnum) \
> +        (((imp)                 << MIDR_IMPLEMENTER_SHIFT)  | \
> +        (0xf                    << MIDR_ARCHITECTURE_SHIFT) | \
> +        ((partnum)              << MIDR_PARTNUM_SHIFT))
> +
> +#define ARM_CPU_IMP_CAVIUM        0x43
> +#define CAVIUM_CPU_PART_THUNDERX  0x0A1
> +
> +#define MIDR_THUNDERX_PASS2  \
> +               MIDR_CPU_PART(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
> +#define CPU_MODEL_MASK  (MIDR_IMPLEMENTER_MASK | MIDR_ARCHITECTURE_MASK | \
> +                         MIDR_PARTNUM_MASK)
> +
> +static uint64_t qemu_read_aarch64_midr_el1(void)
> +{
> +#ifdef CONFIG_LINUX
> +    const char *file = "/sys/devices/system/cpu/cpu0/regs/identification/midr_el1";
> +    char *buf;
> +    uint64_t midr = 0;
> +
> +#define BUF_SIZE 32
> +    buf = g_malloc0(BUF_SIZE);
> +    if (!buf) {
> +        return 0;
> +    }
> +
> +    if (!g_file_get_contents(file, &buf, 0, NULL)) {
> +        goto out;
> +    }
> +
> +    if (qemu_strtoull(buf, NULL, 0, &midr) < 0) {
> +        goto out;
> +    }
> +
> +out:
> +    g_free(buf);
> +
> +    return midr;
> +#else
> +    return 0;
> +#endif
> +}
> +
> +static bool is_thunderx_cpu;
> +static uint64_t aarch64_midr_val;
> +uint64_t get_aarch64_cpu_id(void)
> +{
> +#ifdef CONFIG_LINUX
> +    static bool cpu_info_read;
> +
> +    if (unlikely(!cpu_info_read)) {
> +        aarch64_midr_val = qemu_read_aarch64_midr_el1();
> +        aarch64_midr_val &= CPU_MODEL_MASK;
> +        cpu_info_read = 1;
> +        if (aarch64_midr_val == MIDR_THUNDERX_PASS2) {
> +            is_thunderx_cpu = 1;
> +        }
> +    }
> +    return aarch64_midr_val;
> +#else
> +    return 0;
> +#endif
> +}
> +
> +bool is_thunderx_pass2_cpu(void)
> +{
> +   return is_thunderx_cpu;

This can be:

   return get_aarch64_cpu_id() == MIDR_THUNDERX_PASS2;

without the is_thunderx_cpu variable.

Paolo

> +}
> +#endif
> 
