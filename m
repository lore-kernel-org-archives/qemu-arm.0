Received: by 10.80.166.35 with SMTP id d32csp2539166edc;
        Mon, 24 Oct 2016 02:39:59 -0700 (PDT)
X-Received: by 10.55.183.6 with SMTP id h6mr13613315qkf.0.1477301999790;
        Mon, 24 Oct 2016 02:39:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p135si10435997qka.38.2016.10.24.02.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 02:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bybja-0004QY-L3
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 05:39:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bybjV-0004QC-T6
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 05:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bybjR-0001jd-VA
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 05:39:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1bybjR-0001ij-Nm; Mon, 24 Oct 2016 05:39:49 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DA96635C;
	Mon, 24 Oct 2016 09:39:48 +0000 (UTC)
Received: from work-vm ([10.33.36.3])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9O9diee009737
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 24 Oct 2016 05:39:46 -0400
Date: Mon, 24 Oct 2016 10:39:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: vijay.kilari@gmail.com
Message-ID: <20161024093943.GC2190@work-vm>
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
	<1477288523-10819-3-git-send-email-vijay.kilari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477288523-10819-3-git-send-email-vijay.kilari@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 24 Oct 2016 09:39:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] utils: Add helper to
 read arm MIDR_EL1 register
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5jYBpRxZQ42y

* vijay.kilari@gmail.com (vijay.kilari@gmail.com) wrote:
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
>  util/aarch64-cpuid.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++

It feels like there should be somewhere else to put this very ARM specific thing
that in util/ - not sure where though.

>  3 files changed, 97 insertions(+)
> 
> diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h

> new file mode 100644
> index 0000000..dbcb5ff
> --- /dev/null
> +++ b/include/qemu/aarch64-cpuid.h
> @@ -0,0 +1,9 @@
> +#ifndef QEMU_AARCH64_CPUID_H
> +#define QEMU_AARCH64_CPUID_H
> +
> +#if defined(__aarch64__)
> +uint64_t get_aarch64_cpu_id(void);
> +bool is_thunderx_pass2_cpu(void);
> +#endif
> +
> +#endif
> diff --git a/util/Makefile.objs b/util/Makefile.objs
> index 36c7dcc..d14a455 100644
> --- a/util/Makefile.objs
> +++ b/util/Makefile.objs
> @@ -37,3 +37,4 @@ util-obj-y += log.o
>  util-obj-y += qdist.o
>  util-obj-y += qht.o
>  util-obj-y += range.o
> +util-obj-y += aarch64-cpuid.o
> diff --git a/util/aarch64-cpuid.c b/util/aarch64-cpuid.c
> new file mode 100644
> index 0000000..a6352ad
> --- /dev/null
> +++ b/util/aarch64-cpuid.c
> @@ -0,0 +1,87 @@
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
> +#include <math.h>
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/cutils.h"
> +#include "qemu/aarch64-cpuid.h"
> +
> +#if defined(__aarch64__)
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

Do you need to do that? Isn't g_file_get_contents doing the allocation?

Dave

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
> +static uint64_t aarch64_midr_val;
> +uint64_t get_aarch64_cpu_id(void)
> +{
> +#ifdef CONFIG_LINUX
> +    aarch64_midr_val = qemu_read_aarch64_midr_el1();
> +    aarch64_midr_val &= CPU_MODEL_MASK;
> +
> +    return aarch64_midr_val;
> +#else
> +    return 0;
> +#endif
> +}
> +
> +bool is_thunderx_pass2_cpu(void)
> +{
> +    return aarch64_midr_val == MIDR_THUNDERX_PASS2;
> +}
> +#endif
> -- 
> 1.9.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
