Received: by 10.25.205.13 with SMTP id d13csp704086lfg;
        Fri, 16 Dec 2016 06:05:05 -0800 (PST)
X-Received: by 10.200.50.35 with SMTP id x32mr3063453qta.78.1481897105360;
        Fri, 16 Dec 2016 06:05:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20si3220347qtd.301.2016.12.16.06.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 06:05:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHt8A-00052L-Tp
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 09:05:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHt85-0004jY-GL
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:04:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHt80-00058Q-JB
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:04:57 -0500
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:33066)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHt80-000589-CD
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 09:04:52 -0500
Received: by mail-ua0-x22b.google.com with SMTP id b35so11138034uaa.0
	for <qemu-arm@nongnu.org>; Fri, 16 Dec 2016 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oAytSisM9yM/Gg4/I6y/HoWGqKr2Y72A1fKO3912c+U=;
	b=VMYhWgDkl8M7sirOVbDS87L7JbHT/3L/Xap9Io6VtrFnYTkUMeylNWvZdqjnSfPKTa
	HhWXP46UAiCd+f/z7rFtK9ZN0YSCXcqFdTYjwNVe0HEt/El0mFpPEelvTtxdfnmzrcFi
	oiM5tfvQ75uJlu39ofGnV3XHV9AorDJQZp6dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oAytSisM9yM/Gg4/I6y/HoWGqKr2Y72A1fKO3912c+U=;
	b=TOBSQ7CjmEZnxY+WhL7Dv59ApW+FjKnqiuw7HGgBYGAcnlo6jZwq5EkGLfb3qY91Fh
	ZHyhHPs3xdWEMnq/tvJlSbQCt6BMfuRrGBHvhitlMsOuuBCidw50BVeVf7dUUboenPb5
	RuE/X38e+dRJ82OkbXV75D0L7QM1CmMOudY+5Qz/4scJPBVGCq6kq7FzMz6bMmhDEQcq
	yny++FWxzQXkeMgc0uD0UQVoID+D9ne/mqkZ0lTPVo3kP22h8vl8hqFaMJm364NFvE+s
	wduiKe2LjLlFG7CcDI8I9hn270yYtse3X4CpkSx+n7CIGZkI6rU6vhAHX1Vp3Rtd4JTr
	yksA==
X-Gm-Message-State: AIkVDXIJ/b+dgL8gPLF9HpvJsQBHjs4bmRiib1Ki3KchI/9fFXZSHRSmkbdyr8UtwJKZS60CCvwyS0aJzQdTeMDk
X-Received: by 10.176.2.110 with SMTP id 101mr2832015uas.8.1481897091604; Fri,
	16 Dec 2016 06:04:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 16 Dec 2016 06:04:31 -0800 (PST)
In-Reply-To: <1481130374-5147-3-git-send-email-vijay.kilari@gmail.com>
References: <1481130374-5147-1-git-send-email-vijay.kilari@gmail.com>
	<1481130374-5147-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2016 14:04:31 +0000
Message-ID: <CAFEAcA_hfxvW9do3xTP4KoEKMWk4NOUKJZFMiTVbJV3hY48HGA@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-arm] [PATCH v5 2/3] utils: Add helper to read arm
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xw4sCnpFKcj3

On 7 December 2016 at 17:06,  <vijay.kilari@gmail.com> wrote:
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
>  include/qemu/aarch64-cpuid.h | 38 ++++++++++++++++++++++++++++++++
>  util/Makefile.objs           |  1 +
>  util/aarch64-cpuid.c         | 52 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 91 insertions(+)
>
> diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
> new file mode 100644
> index 0000000..fb88ed8
> --- /dev/null
> +++ b/include/qemu/aarch64-cpuid.h
> @@ -0,0 +1,38 @@
> +#ifndef QEMU_AARCH64_CPUID_H
> +#define QEMU_AARCH64_CPUID_H
> +
> +#if defined(__aarch64__) && defined(CONFIG_LINUX)
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
> +#else
> +static inline uint64_t get_aarch64_cpu_id(void)
> +{
> +    return 0;
> +}
> +
> +static inline bool is_thunderx_pass2_cpu(void)
> +{
> +    return false;
> +}
> +#endif
> +#endif
> diff --git a/util/Makefile.objs b/util/Makefile.objs
> index ad0f9c7..a9585c9 100644
> --- a/util/Makefile.objs
> +++ b/util/Makefile.objs
> @@ -36,3 +36,4 @@ util-obj-y += log.o
>  util-obj-y += qdist.o
>  util-obj-y += qht.o
>  util-obj-y += range.o
> +util-obj-$(CONFIG_LINUX) += aarch64-cpuid.o
> diff --git a/util/aarch64-cpuid.c b/util/aarch64-cpuid.c
> new file mode 100644
> index 0000000..575f52e
> --- /dev/null
> +++ b/util/aarch64-cpuid.c
> @@ -0,0 +1,52 @@
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
> +#include "qemu/cutils.h"
> +#include "qemu/aarch64-cpuid.h"
> +
> +#if defined(__aarch64__)
> +static uint64_t qemu_read_aarch64_midr_el1(void)
> +{
> +    const char *file = "/sys/devices/system/cpu/cpu0/regs/identification/midr_el1";

If CPU0 happens to be offline (eg hot-unplugged) then this file
won't exist, and we'll fail to identify any MIDR value.

The API as designed here also doesn't seem to consider
the idea of big.LITTLE systems -- if there are multiple
CPUs with different MIDRs, which one should we return here?

> +    char *buf;
> +    uint64_t midr = 0;
> +
> +    if (!g_file_get_contents(file, &buf, 0, NULL)) {
> +        goto out;
> +    }
> +
> +    if (qemu_strtoull(buf, NULL, 0, &midr) < 0) {
> +        midr = 0;
> +        goto out;
> +    }
> +
> +out:
> +    g_free(buf);
> +
> +    return midr;

thanks
-- PMM
