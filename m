Received: by 10.25.21.156 with SMTP id 28csp115818lfv;
        Tue, 2 Aug 2016 03:48:49 -0700 (PDT)
X-Received: by 10.200.56.35 with SMTP id q32mr97603115qtb.32.1470134928723;
        Tue, 02 Aug 2016 03:48:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p195si1197427qke.290.2016.08.02.03.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 03:48:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUXFg-0007KS-4p
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 06:48:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bUXFV-0007Ep-Vt
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 06:48:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bUXFP-0001D5-Qn
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 06:48:36 -0400
Received: from mx6-phx2.redhat.com ([209.132.183.39]:51206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bUXFC-00019l-VD; Tue, 02 Aug 2016 06:48:19 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx6-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u72AmDRN051747;
	Tue, 2 Aug 2016 06:48:13 -0400
Date: Tue, 2 Aug 2016 06:48:12 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: vijay kilari <vijay.kilari@gmail.com>
Message-ID: <107219873.13018814.1470134892902.JavaMail.zimbra@redhat.com>
In-Reply-To: <1470133216-6758-2-git-send-email-vijay.kilari@gmail.com>
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
	<1470133216-6758-2-git-send-email-vijay.kilari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.100.50]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: utils: Add helper to read arm MIDR_EL1 register
Thread-Index: MThgYh6JeKa95Q+ezGk6J+NKmVUj8A==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.39
Subject: Re: [Qemu-arm] [RFC PATCH v1 1/2] utils: Add helper to read arm
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
Cc: peter maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-devel@nongnu.org,
	Prasun Kapoor <Prasun.Kapoor@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YsJXkjh9Is4K

----- Original Message -----
> From: "vijay kilari" <vijay.kilari@gmail.com>
> To: qemu-arm@nongnu.org, "peter maydell" <peter.maydell@linaro.org>, pbonzini@redhat.com
> Cc: qemu-devel@nongnu.org, "Prasun Kapoor" <Prasun.Kapoor@cavium.com>, "vijay kilari" <vijay.kilari@gmail.com>,
> "Vijaya Kumar K" <Vijaya.Kumar@cavium.com>
> Sent: Tuesday, August 2, 2016 12:20:15 PM
> Subject: [RFC PATCH v1 1/2] utils: Add helper to read arm MIDR_EL1 register
> 
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
>  include/qemu-common.h |    1 +
>  util/Makefile.objs    |    1 +
>  util/cpuinfo.c        |   52
>  +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 1f2cb94..62ad674 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -134,4 +134,5 @@ void page_size_init(void);
>   * returned. */
>  bool dump_in_progress(void);
>  
> +long int qemu_read_cpuid_info(void);

First, please avoid adding to include/qemu-common.h (it really should
go away).

Second, this is too generic a name.  Please call it something like
qemu_read_aarch64_midr_el1.

Third, it's probably a bad idea to call this function from generic code, so
make it static and add the detection function from patch 2/2 already here.
By making it static, it's also possible to define it only if CONFIG_LINUX
is defined; the ThunderX detection will then return false if !CONFIG_LINUX.

Thanks,

Paolo

>  #endif
> diff --git a/util/Makefile.objs b/util/Makefile.objs
> index 96cb1e0..9d25a72 100644
> --- a/util/Makefile.objs
> +++ b/util/Makefile.objs
> @@ -35,3 +35,4 @@ util-obj-y += log.o
>  util-obj-y += qdist.o
>  util-obj-y += qht.o
>  util-obj-y += range.o
> +util-obj-y += cpuinfo.o
> diff --git a/util/cpuinfo.c b/util/cpuinfo.c
> new file mode 100644
> index 0000000..3ba7194
> --- /dev/null
> +++ b/util/cpuinfo.c
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
> +#include "qemu-common.h"
> +#include "qemu/cutils.h"
> +
> +#if defined(__aarch64__)
> +
> +long int qemu_read_cpuid_info(void)
> +{
> +    FILE *fp;
> +    char *buf;
> +    long int midr = 0;
> +#define BUF_SIZE 32
> +
> +    fp = fopen("/sys/devices/system/cpu/cpu0/regs/identification/midr_el1",
> +               "r");
> +    if (!fp) {
> +        return 0;
> +    }
> +
> +    buf = g_malloc0(BUF_SIZE);
> +    if (!buf) {
> +        fclose(fp);
> +        return 0;
> +    }
> +
> +    if (buf != fgets(buf, BUF_SIZE - 1, fp)) {
> +        goto out;
> +    }
> +
> +    if (qemu_strtol(buf, NULL, 0, &midr) < 0) {
> +        goto out;
> +    }
> +
> +out:
> +    g_free(buf);
> +    fclose(fp);
> +
> +    return midr;
> +}
> +#endif
> --
> 1.7.9.5
> 
> 
