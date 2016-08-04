Received: by 10.25.21.156 with SMTP id 28csp1157722lfv;
        Thu, 4 Aug 2016 02:16:45 -0700 (PDT)
X-Received: by 10.55.164.205 with SMTP id n196mr5179985qke.0.1470302205864;
        Thu, 04 Aug 2016 02:16:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si3575512qke.296.2016.08.04.02.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Aug 2016 02:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVElg-000335-Py
	for alex.bennee@linaro.org; Thu, 04 Aug 2016 05:16:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bVEld-00031W-FM
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 05:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bVElb-0007aO-9J
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 05:16:40 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:32825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bVElb-0007aI-2t; Thu, 04 Aug 2016 05:16:39 -0400
Received: by mail-oi0-x241.google.com with SMTP id l9so23681731oih.0;
	Thu, 04 Aug 2016 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mOb7K09xz4lXGq0amkndURIOWOw3GyAT5OdRLEipzoE=;
	b=wvobjnyVdGlq8FRwlRT/0O6YbPZvK5KHGFWicQpcqxxwdMhMAbLfFTT6Hn8TqATboi
	rob2s8GvGJqmgT96+uw4jxWfdoSzL0s/OQeJw3iTY2/PpZ6m0F0RLhaupYffDJQTRf5o
	XGd7Pmz728mr1YHRbz19VoBpe96wCrIyzU7m5o9d12yTmQY2lQkSMXcRGtN32Zf0ji0f
	dfao6LbeDamT/aHbZAMeh9ArLAT990i0CBBITH0GnBXGIC9XGSMANKGJWjZeBXzS79OD
	0rZebz9nKYNrEoX13zEnSasN/yzjRSAsMQHW+ukjaDpOGTTu1HHnHFD4yNgbQ7PEavMv
	HQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mOb7K09xz4lXGq0amkndURIOWOw3GyAT5OdRLEipzoE=;
	b=P3ks15SZj7pPUzPmJaQOLDemvaSOrYETXlPVlohVaM871epLqgYhouvm4qHAGO/ebp
	+a4iGwFYfBKrxnZTlSOiedqFaCTa+RB+uJmc6uLC1dPDSB9MXTHNvYMRBr2SW8RW1Mru
	NnkQnOFlu+7QGSbdiqYRa8OGiFBKEAJtC0YgYUvYta1yboq0Ha/qoAfYwkar4QQuNEfa
	h2+twqPU6v68NeP1fGfDQcBhQehz50vDRwfa1b+7qRDMpt92vi7oQCVRrN2nQUWewkgg
	uKt4+gLs90qD63Dp1m4+dmlf5e8UblBg9TxXgwim5HsSTLEo7o4YxiEfUQqRQ8CdiBEI
	vDjA==
X-Gm-Message-State: AEkoouturphFHVVg4fvwNGxK+8V20hsY2nj8TqUL5IlmreVctAgKOeGL0zzZA+0jPMeirm7UybQqLGyI/WPxkg==
X-Received: by 10.202.214.201 with SMTP id n192mr39605119oig.155.1470302198320;
	Thu, 04 Aug 2016 02:16:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.2.10 with HTTP; Thu, 4 Aug 2016 02:16:37 -0700 (PDT)
In-Reply-To: <107219873.13018814.1470134892902.JavaMail.zimbra@redhat.com>
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
	<1470133216-6758-2-git-send-email-vijay.kilari@gmail.com>
	<107219873.13018814.1470134892902.JavaMail.zimbra@redhat.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Thu, 4 Aug 2016 14:46:37 +0530
Message-ID: <CALicx6uuXv=Vnt_H6P2=5EKVAC80Tp7EQVKvE0Fcy0eoUBVNag@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
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
Cc: peter maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/FEnmAI1l4C

Hi Paolo,

On Tue, Aug 2, 2016 at 4:18 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> ----- Original Message -----
>> From: "vijay kilari" <vijay.kilari@gmail.com>
>> To: qemu-arm@nongnu.org, "peter maydell" <peter.maydell@linaro.org>, pbonzini@redhat.com
>> Cc: qemu-devel@nongnu.org, "Prasun Kapoor" <Prasun.Kapoor@cavium.com>, "vijay kilari" <vijay.kilari@gmail.com>,
>> "Vijaya Kumar K" <Vijaya.Kumar@cavium.com>
>> Sent: Tuesday, August 2, 2016 12:20:15 PM
>> Subject: [RFC PATCH v1 1/2] utils: Add helper to read arm MIDR_EL1 register
>>
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
>>  include/qemu-common.h |    1 +
>>  util/Makefile.objs    |    1 +
>>  util/cpuinfo.c        |   52
>>  +++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 54 insertions(+)
>>
>> diff --git a/include/qemu-common.h b/include/qemu-common.h
>> index 1f2cb94..62ad674 100644
>> --- a/include/qemu-common.h
>> +++ b/include/qemu-common.h
>> @@ -134,4 +134,5 @@ void page_size_init(void);
>>   * returned. */
>>  bool dump_in_progress(void);
>>
>> +long int qemu_read_cpuid_info(void);
>
> First, please avoid adding to include/qemu-common.h (it really should
> go away).
>
> Second, this is too generic a name.  Please call it something like
> qemu_read_aarch64_midr_el1.

OK
>
> Third, it's probably a bad idea to call this function from generic code, so
> make it static and add the detection function from patch 2/2 already here.
> By making it static, it's also possible to define it only if CONFIG_LINUX
> is defined; the ThunderX detection will then return false if !CONFIG_LINUX.
>

  You mean to say, move contents of this patch to util/cutils.c and make it
static and define under __aarch64__ and CONFIG_LINUX?.

> Thanks,
>
> Paolo
>
>>  #endif
>> diff --git a/util/Makefile.objs b/util/Makefile.objs
>> index 96cb1e0..9d25a72 100644
>> --- a/util/Makefile.objs
>> +++ b/util/Makefile.objs
>> @@ -35,3 +35,4 @@ util-obj-y += log.o
>>  util-obj-y += qdist.o
>>  util-obj-y += qht.o
>>  util-obj-y += range.o
>> +util-obj-y += cpuinfo.o
>> diff --git a/util/cpuinfo.c b/util/cpuinfo.c
>> new file mode 100644
>> index 0000000..3ba7194
>> --- /dev/null
>> +++ b/util/cpuinfo.c
>> @@ -0,0 +1,52 @@
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
>> +
>> +#if defined(__aarch64__)
>> +
>> +long int qemu_read_cpuid_info(void)
>> +{
>> +    FILE *fp;
>> +    char *buf;
>> +    long int midr = 0;
>> +#define BUF_SIZE 32
>> +
>> +    fp = fopen("/sys/devices/system/cpu/cpu0/regs/identification/midr_el1",
>> +               "r");
>> +    if (!fp) {
>> +        return 0;
>> +    }
>> +
>> +    buf = g_malloc0(BUF_SIZE);
>> +    if (!buf) {
>> +        fclose(fp);
>> +        return 0;
>> +    }
>> +
>> +    if (buf != fgets(buf, BUF_SIZE - 1, fp)) {
>> +        goto out;
>> +    }
>> +
>> +    if (qemu_strtol(buf, NULL, 0, &midr) < 0) {
>> +        goto out;
>> +    }
>> +
>> +out:
>> +    g_free(buf);
>> +    fclose(fp);
>> +
>> +    return midr;
>> +}
>> +#endif
>> --
>> 1.7.9.5
>>
>>
