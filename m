Received: by 10.25.85.209 with SMTP id j200csp1104633lfb;
        Mon, 13 Jun 2016 02:39:48 -0700 (PDT)
X-Received: by 10.55.10.147 with SMTP id 141mr13810717qkk.91.1465810788710;
        Mon, 13 Jun 2016 02:39:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u28si14668426qta.95.2016.06.13.02.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCOLU-0003oY-3w
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:39:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOIb-0000t6-Ge
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOIa-00014m-AY
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:36:49 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOIa-00014h-6P
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:36:48 -0400
Received: by mail-vk0-x22c.google.com with SMTP id d127so171078974vkh.2
	for <qemu-arm@nongnu.org>; Mon, 13 Jun 2016 02:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rGHGGyrHIoFwgNvdzlnXsD+p161raedscpbV35FduVw=;
	b=SubuifdSOfzOe5QnCD2Ih0pc29fz0cOJVebI9F9bszPl415yFl5K9puXBhZXYFOhhd
	QPevdVRwl7TkJs2v3o4FjP02SsKLzPkbZ2aoGatEJlbx18UVqaCuLmyqKzmona/BAJJ0
	sqgI0lq29VIflENkp1XpJhIXKjsOHKhmb8XU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rGHGGyrHIoFwgNvdzlnXsD+p161raedscpbV35FduVw=;
	b=ChguYDVUzLrspLUKgfbeB0okKuTMECTdie+BmLUdTSDajm6rTUzxaz1XwFA9MfSFq+
	P6CD6VCvV0XTRYrNWGMQqQzfXh1idgu/2BSBLmGwW8wZ3/ozG+UYrZioNtRN5k70fdu8
	Hl7tmQk3PgN+KE51+zNcqoyu7KajWN+HfxYPQpJecqkpKqC0k6aIPo1CEdGdhF3yPcOX
	W9EUMmOyijA9BZrmMWl5ciVgCldey1Hc/deEf/GUZpHhXBXXRRGigO00hksCL2HyGc8q
	5ZrB/5vDMkGyoXNanrbl+WlJ3TFTdt7v/JI1XeGf1Ros+meTh4xr3YJ3cNKUlI40Fq07
	ye7Q==
X-Gm-Message-State: ALyK8tL+zhwL1vPihOM8LWaIcCW8eK9Qt1YyRhh0JKunrKbejrEiR8Hc1fjD9DR/1QlO+Ij8wn5J7uUfSpVDr91V
X-Received: by 10.159.35.230 with SMTP id 93mr2959409uao.26.1465810607764;
	Mon, 13 Jun 2016 02:36:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Mon, 13 Jun 2016 02:36:28 -0700 (PDT)
In-Reply-To: <16ef20d6-8c02-8617-0b6a-16fab76d3333@redhat.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-4-git-send-email-vijayak@caviumnetworks.com>
	<16ef20d6-8c02-8617-0b6a-16fab76d3333@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 10:36:28 +0100
Message-ID: <CAFEAcA_0HXxBO7c0UjxuWbYgQv+nmP6JO7pHKKK8O53CWdG_fg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [RFC PATCH v1 3/4] translate-all.c: Compute L1 page
 table properties at runtime
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijaya Kumar K <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F51G+Wg/fxm6

On 13 June 2016 at 10:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 13/06/2016 11:08, vijayak@caviumnetworks.com wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>>
>> Remove L1 page mapping table properties computing
>> statically using macros which is dependent on
>> TARGET_PAGE_BITS. Drop macros V_L1_SIZE, V_L1_SHIFT,
>> V_L1_BITS macros and replace with variables which are
>> computed at early stage of VM boot.
>>
>> Removing dependency can help to make TARGET_PAGE_BITS
>> dynamic.
>>
>> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
>> ---
>>  include/qemu-common.h |    1 +
>>  translate-all.c       |   57 ++++++++++++++++++++++++++++++-------------------
>>  vl.c                  |    3 +++
>>  3 files changed, 39 insertions(+), 22 deletions(-)
>>
>> diff --git a/include/qemu-common.h b/include/qemu-common.h
>> index 1f2cb94..d5f0450 100644
>> --- a/include/qemu-common.h
>> +++ b/include/qemu-common.h
>> @@ -129,6 +129,7 @@ int parse_debug_env(const char *name, int max, int initial);
>>
>>  const char *qemu_ether_ntoa(const MACAddr *mac);
>>  void page_size_init(void);
>> +void init_l1_page_table_param(void);
>>
>>  /* returns non-zero if dump is in progress, otherwise zero is
>>   * returned. */
>> diff --git a/translate-all.c b/translate-all.c
>> index 118e7d3..a580ca9 100644
>> --- a/translate-all.c
>> +++ b/translate-all.c
>> @@ -57,6 +57,7 @@
>>  #include "qemu/bitmap.h"
>>  #include "qemu/timer.h"
>>  #include "exec/log.h"
>> +#include "qemu/error-report.h"
>>
>>  //#define DEBUG_TB_INVALIDATE
>>  //#define DEBUG_FLUSH
>> @@ -99,25 +100,18 @@ typedef struct PageDesc {
>>  #define V_L2_BITS 10
>>  #define V_L2_SIZE (1 << V_L2_BITS)
>>
>> -/* The bits remaining after N lower levels of page tables.  */
>> -#define V_L1_BITS_REM \
>> -    ((L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS)
>> -
>> -#if V_L1_BITS_REM < 4
>> -#define V_L1_BITS  (V_L1_BITS_REM + V_L2_BITS)
>> -#else
>> -#define V_L1_BITS  V_L1_BITS_REM
>> -#endif
>> -
>> -#define V_L1_SIZE  ((target_ulong)1 << V_L1_BITS)
>> -
>> -#define V_L1_SHIFT (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - V_L1_BITS)
>> -
>>  uintptr_t qemu_host_page_size;
>>  intptr_t qemu_host_page_mask;
>>
>> +/*
>> + * L1 Mapping properties
>> + */
>> +static unsigned long v_l1_bits;
>> +static unsigned long v_l1_size;
>> +static unsigned long v_l1_shift;
>
> Please make these uint8_t.
>
>>  /* The bottom level has pointers to PageDesc */
>> -static void *l1_map[V_L1_SIZE];
>> +static void *l1_map;
>
> You can make this array have a static V_L2_SIZE * 16 size too.  Peter,
> what do you think?

I don't know this code well enough to have an informed view,
but we only allocate this once at startup, right? I'm not sure
why making it a static array would be better?

thanks
-- PMM
