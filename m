Received: by 10.80.166.35 with SMTP id d32csp1013667edc;
        Fri, 28 Oct 2016 00:00:35 -0700 (PDT)
X-Received: by 10.55.132.132 with SMTP id g126mr8543747qkd.96.1477638035782;
        Fri, 28 Oct 2016 00:00:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j123si5960310qke.255.2016.10.28.00.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Oct 2016 00:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c019X-00072E-9i
	for alex.bennee@linaro.org; Fri, 28 Oct 2016 03:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c019S-000728-Ik
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 03:00:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1c019O-0004py-G2
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 03:00:30 -0400
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:35572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1c019O-0004pV-BJ; Fri, 28 Oct 2016 03:00:26 -0400
Received: by mail-vk0-x241.google.com with SMTP id 130so2355954vkg.2;
	Fri, 28 Oct 2016 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MR7rtSdQ//GZlU8FaF64LJH2oSlD5I8N0UFuE0sfcLI=;
	b=U9GHsClSl8oz4QWIqy6xzNuav0oefCHYWLv+cysaDI27M/kPlyUv0mOQdPxAEgmGB6
	edd6P1kzN/+yzPeIEXNlKRWcSEvjvjvRRj6+KWn1TiWDt97LDCM9Xvsbbv5iXiLJ5R0G
	A1q/7k7NSBG53VSD+C3NJN6I6xDvNVG6/nHBnkt8+RvSD1o9Db2CwMPHz/hg35+F3js+
	981TxHZH+Q8wN0RY3tPDADanerjjgepzQUj3HKnIgzhFid57gu3CRzWZNLmfjiN/W+1A
	DM4clFZHbOAAZLSQBiwFCkgIN1n4MlqZ/Y1S6dhz/AU1NP8oFvOCzdhD3hlC8eS0CiPl
	VqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MR7rtSdQ//GZlU8FaF64LJH2oSlD5I8N0UFuE0sfcLI=;
	b=DemVJw1R5tw80oZGjiZkWSnk9ifu56XxHR9mMQVkAI5WIztxVv4Hxhc7yFmMKDKI3b
	4YgQ1+W2wlK45bMPkcx7BcjpLjraJ84zUrbWR9WCej1A8MtzDfuRInVUU6EIwwM2ldzr
	2ub9/v4WQg3z7b50JLmeeuX28wNzUrti/x7/+sHlnC1JZMefHtLBTk26rYjKzJYVfLJw
	ckzMCoJg3OSejYqsF3iFI5yP8t2v//m3UVlfHnQM92211Xst9fn5A8K/MKUQovRRqCFz
	/+RUSSxE8AbqeNsx1bmAQxWgG883MuP0lnUjmnZxPEpNtw7Jaw72v6cjCAc9I4JPhFaF
	UffQ==
X-Gm-Message-State: ABUngvddUOvLuu8mPVXGyzwCbocQj8V0CSwLq9ce1Pdc9qoXlnVaKA/EL6S+JSWJ/n4Od9QLf6qXlyxAhz7DOw==
X-Received: by 10.31.77.198 with SMTP id a189mr10160877vkb.64.1477638023089;
	Fri, 28 Oct 2016 00:00:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.93.135 with HTTP; Fri, 28 Oct 2016 00:00:22 -0700 (PDT)
In-Reply-To: <CAFEAcA9+wRsWSrJe893EshBvu2pgdV-LSSO1z=toxbaKiGaaZw@mail.gmail.com>
References: <1477397577-25251-1-git-send-email-vijay.kilari@gmail.com>
	<1477397577-25251-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA9+wRsWSrJe893EshBvu2pgdV-LSSO1z=toxbaKiGaaZw@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 28 Oct 2016 12:30:22 +0530
Message-ID: <CALicx6tCzQORa+crRtSMDcKwf6DRKtH6Cj856Bq9Hb_Ze7p7EA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::241
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
X-TUID: cb8i3kA5cqmy

On Thu, Oct 27, 2016 at 9:33 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 October 2016 at 13:12,  <vijay.kilari@gmail.com> wrote:
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
>>  include/qemu/aarch64-cpuid.h | 29 +++++++++++++++++++++
>>  util/Makefile.objs           |  1 +
>>  util/aarch64-cpuid.c         | 61 ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 91 insertions(+)
>>
>> diff --git a/include/qemu/aarch64-cpuid.h b/include/qemu/aarch64-cpuid.h
>> new file mode 100644
>> index 0000000..8f776e8
>> --- /dev/null
>> +++ b/include/qemu/aarch64-cpuid.h
>> @@ -0,0 +1,29 @@
>> +#ifndef QEMU_AARCH64_CPUID_H
>> +#define QEMU_AARCH64_CPUID_H
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
>> index 0000000..536ece1
>> --- /dev/null
>> +++ b/util/aarch64-cpuid.c
>> @@ -0,0 +1,61 @@
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
>
> osdep.h must always be the first #include, before anything else.
>
> What do we need math.h for anyway?
>
>> +#include "qemu-common.h"
>
> What do we need qemu-common.h for ?
>
>> +#include "qemu/cutils.h"
>> +#include "qemu/aarch64-cpuid.h"
>> +
>> +#if defined(__aarch64__)
>> +static uint64_t qemu_read_aarch64_midr_el1(void)
>> +{
>> +#ifdef CONFIG_LINUX
>
> When will CONFIG_LINUX not be defined but __aarch64__ is?
  The contents of this file is compiled only for aarch64 and hence
all the contents are under this __aarch64__.
Also the code is only for linux, have added CONFIG_LINUX.
