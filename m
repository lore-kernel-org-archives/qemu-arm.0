Received: by 10.37.193.4 with SMTP id r4csp742362ybf;
        Thu, 27 Oct 2016 09:41:32 -0700 (PDT)
X-Received: by 10.31.21.3 with SMTP id 3mr6819208vkv.48.1477586492511;
        Thu, 27 Oct 2016 09:41:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h71si3710048vkc.202.2016.10.27.09.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 09:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bznkC-0004WK-03
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 12:41:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzn9p-0006Zp-1t
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 12:04:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzn9k-0007qM-PJ
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 12:03:57 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:33843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzn9k-0007pH-Io
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 12:03:52 -0400
Received: by mail-ua0-x22e.google.com with SMTP id 51so14770115uai.1
	for <qemu-arm@nongnu.org>; Thu, 27 Oct 2016 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4IW5x1xkYgJ0h+hrCrFDRrLC0szOuZvbvqF56rs4HpY=;
	b=bdahUgexDAF7wSZ8c9uOybKsRrydCUScD9beFl5QMqi542X+WUc5HBOSzSY4G9UcB7
	IEf6SkyJ8EFQYYbIM4YyTgdKExVlPyu5Ss0swXLl1YrbMlY6pzfgtLoB1McFrZ3ezg6k
	skpoIMgTaIc0HIPWxm6koPkTe51j3AwhHHQkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4IW5x1xkYgJ0h+hrCrFDRrLC0szOuZvbvqF56rs4HpY=;
	b=QWoKr9PJw99s3TUIl06rgJUO0+k5QmZ6QfAltadEZoanrfgU19a6rYOcj/O+aLDwY4
	e+wqxV0QRHJBtcc8ssPCNmIHro//OGBxWQK1TRwNENWfIUuB6AtCgAc7gJ2qoFGZal+s
	qiu+Zfy6KYgVKdRB91utKGLtXlBYNzSvcsGuLbvzrmdqpxTgDmZotlKEmZavUgd+7/N+
	9kitO3wltABSWuWvHNyJuY8U/BlWwyZ4CBuOUyzx9jkR1vXiZyJr1gZTuwNmPerVyAGY
	qqGu8I5LKHMy3vY97FDKRHhYzgGykj0FGVowDu3ZsWs2umtPW7emTfVGBwPNzoT91CO8
	u4Fw==
X-Gm-Message-State: ABUngvc4RAGJx33MVhSUjQlvVlZfZ0nCcjagH9wOqQ3eX10k8UsO2jFp7thzwkbskTZDgvJdgj2yTMMy5VZE7dR3
X-Received: by 10.176.83.12 with SMTP id x12mr7020490uax.131.1477584231704;
	Thu, 27 Oct 2016 09:03:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 27 Oct 2016 09:03:31 -0700 (PDT)
In-Reply-To: <1477397577-25251-3-git-send-email-vijay.kilari@gmail.com>
References: <1477397577-25251-1-git-send-email-vijay.kilari@gmail.com>
	<1477397577-25251-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2016 17:03:31 +0100
Message-ID: <CAFEAcA9+wRsWSrJe893EshBvu2pgdV-LSSO1z=toxbaKiGaaZw@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-arm] [PATCH v4 2/3] utils: Add helper to read arm
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 58iSGLCFRO2+

On 25 October 2016 at 13:12,  <vijay.kilari@gmail.com> wrote:
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
>  include/qemu/aarch64-cpuid.h | 29 +++++++++++++++++++++
>  util/Makefile.objs           |  1 +
>  util/aarch64-cpuid.c         | 61 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 91 insertions(+)
>
> diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
> new file mode 100644
> index 0000000..8f776e8
> --- /dev/null
> +++ b/include/qemu/aarch64-cpuid.h
> @@ -0,0 +1,29 @@
> +#ifndef QEMU_AARCH64_CPUID_H
> +#define QEMU_AARCH64_CPUID_H
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
> index 0000000..536ece1
> --- /dev/null
> +++ b/util/aarch64-cpuid.c
> @@ -0,0 +1,61 @@
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

osdep.h must always be the first #include, before anything else.

What do we need math.h for anyway?

> +#include "qemu-common.h"

What do we need qemu-common.h for ?

> +#include "qemu/cutils.h"
> +#include "qemu/aarch64-cpuid.h"
> +
> +#if defined(__aarch64__)
> +static uint64_t qemu_read_aarch64_midr_el1(void)
> +{
> +#ifdef CONFIG_LINUX

When will CONFIG_LINUX not be defined but __aarch64__ is?

> +    const char *file = "/sys/devices/system/cpu/cpu0/regs/identification/midr_el1";
> +    char *buf;
> +    uint64_t midr = 0;
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

Why do we do a goto to the immediately following statement?

You have an inconsistency in that for one error condition
(if g_file_get_contents() fails) this function will
return 0, but for another error condition (qemu_strtoull()
fails) you'll return -1.

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

thanks
-- PMM
