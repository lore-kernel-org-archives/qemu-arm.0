Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9D4C44508
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 14:57:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjeZD-0006XC-QE; Tue, 14 Jul 2026 10:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjeYF-0006Bn-8R
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 10:56:05 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjeYB-0000TE-Gg
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 10:56:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-8487088510aso4295317b3a.0
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784040958; x=1784645758; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ThIpk0R/Ci9elKZrr6NOqcvpp/B+UnxtqFIuAhRTtSg=;
 b=lgCOfwr/djAZrWZ6wZ/7A+XYusRNcRLV6WsnvH5lnVmvUNYD5O+YbelexgzKfUpoib
 FHHaXdV1zA7Gt+l8i7kisUO7+RlF/fnX58w11BYwrzlqjMwU3H66JtmKRQ5nHQzyXFtx
 hU2VbAfTo/6LuGXCN0D7t/MGt/ZLCoXmpJzEzhmmrxSeVz/TYNn67rleq7gY4IJ+Rxrp
 ynndYKMJMCcUnxBkcCIXzNnzTH7n9CbCwgdKoqsLM4S5GPrpMdULQn2TbkDJT8HB7lIg
 UK3DFs0rAVvGtd35Xyxh30YiuxIBIZQYJ0e76JI0Mmv31If2IvolqWFUuYrFLJwCdYp9
 MQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784040958; x=1784645758;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ThIpk0R/Ci9elKZrr6NOqcvpp/B+UnxtqFIuAhRTtSg=;
 b=TTXllnxILOzoIDzkze05a2vrs0Bxmp+GHr1vEPfOmdSbzYhN4kGLZBSoF5VoWA3TaM
 lKXEUZxqR5rNWvd4CKwNzjf8lZzd6SujuqTA4B9/pVAzK7yRCRmq4fZGIiieNE7u0dYu
 HcEMCFWxZbwmzL+I49MgdsHQ/F/PgKrNur/r4/M0Mjtt4+q/W4BcDNfQTW/GzxuXi811
 7myVA9e/F3YxhYx0OQ8UcP3I7/fCAmmanD23K0l6I0SLfX2yC0jWGuRMht7tg7P1dyzA
 cWNaFUF66YQhp+Rq9Xr/Zn5ocnjVP8bXIcvz3Cssjki/WcM6njWw0ZPAV+jPKpkV0YzX
 m4vQ==
X-Gm-Message-State: AOJu0YzZZ6SYnYzm8ZV0j7wjHPv/2/dj2P9cTt/Z/2+QVc+yXq2rObg2
 w5m26b4vVl3by2Ml1eTgHFsYEMSeI7Y2mjpGlr89EH5UqNsSi4ct6kajJg0Ew2MG4c8=
X-Gm-Gg: AfdE7cnmH8F19fHWshBJasj/5pwG+KcS5Tq4Zc3585A8YpHPiwybRPCBU+W90dr2WsQ
 kgr/XEzwJCLzw8ElFjh+gazDUWbJ0r9cTwkNsEHTCUiRmvKkfFGdKiVrDHk4UY25kGpTtU1UYEA
 1L/NSQ+322Ki/TXFOR3qfp61TXI7l+Z2D3mGLAhRuee+eKXYuEuia98TKx9s2fTfQiWrNFQ5SRd
 G2MXp1l7VwzC9DPPBrQgR++7x68hQTa+ZtxJ2Kx39Xh4ZajD00HlBUI/PU1V8B5wagJYXNQF56L
 YWaWYF/IVLiwtUDsaEst+hD/ABxOXrixgRWhT7qhWuf8oJnLV++kKwUaNGojiM+nU5urkqWtoAd
 SvsN7147ITFg/0atlOK3GbcrW5vi+Pv2jW+FA8Vqhgmq0hdiBSlrcifziRKRIILbI68jqDgwVze
 eCk32zkgURWe/pA/ut6vBiUX64WT57DEQJ6gfCCdgI+KXOIsk=
X-Received: by 2002:a05:6a00:3405:b0:847:8f8a:a05d with SMTP id
 d2e1a72fcca58-84a5146b46cmr3409035b3a.29.1784040957421; 
 Tue, 14 Jul 2026 07:55:57 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.146.49])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4f818ec4sm1670325b3a.57.2026.07.14.07.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 07:55:57 -0700 (PDT)
Message-ID: <01b9590c-2243-46f8-8f5a-de3ba0709ad8@linaro.org>
Date: Tue, 14 Jul 2026 07:55:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/51] cpu: Use interval-tree for CPUWatchpoint
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-19-richard.henderson@linaro.org>
 <9aed7950-405a-4414-a951-9d044a8c9d53@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <9aed7950-405a-4414-a951-9d044a8c9d53@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/14/26 06:02, Ilya Leoshkevich wrote:
> 
> 
> On 7/10/26 22:53, Richard Henderson wrote:
>> Use a balanced binary tree rather than a simple list for watchpoints.
>> Using an interval tree makes it easy to probe for any overlapping address.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/breakpoint.h |   7 +-
>>   include/hw/core/cpu.h     |   3 +-
>>   accel/tcg/cpu-exec.c      |   8 +-
>>   accel/tcg/watchpoint.c    | 155 +++++++++++++++++++++-----------------
>>   hw/core/cpu-common.c      |   1 -
>>   system/watchpoint.c       |  43 ++++++-----
>>   target/arm/hyp_gdbstub.c  |   3 +-
>>   7 files changed, 119 insertions(+), 101 deletions(-)
>>
>> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
>> index bb7cbc626d..e0826a1a2d 100644
>> --- a/include/exec/breakpoint.h
>> +++ b/include/exec/breakpoint.h
>> @@ -9,7 +9,6 @@
>>   #define EXEC_BREAKPOINT_H
>>   #include "qemu/interval-tree.h"
>> -#include "qemu/queue.h"
>>   #include "exec/vaddr.h"
>>   #include "exec/memattrs.h"
>> @@ -36,13 +35,11 @@ struct CPUBreakpoint {
>>   };
>>   struct CPUWatchpoint {
>> -    vaddr vaddr;
>> -    vaddr len;
>> +    IntervalTreeNode itree;
>>       vaddr hitaddr;
>>       MemTxAttrs hitattrs;
>> -    int flags; /* BP_* */
>> +    BreakpointFlags flags;
> 
> Should this go into 1/51?
> 
>>       unsigned id;
>> -    QTAILQ_ENTRY(CPUWatchpoint) entry;
>>   };
>>   int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index b8a1419860..7e19ea418d 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -525,8 +525,7 @@ struct CPUState {
>>       /* ice debug support */
>>       IntervalTreeRoot breakpoints;
>> -
>> -    QTAILQ_HEAD(, CPUWatchpoint) watchpoints;
>> +    IntervalTreeRoot watchpoints;
>>       CPUWatchpoint *watchpoint_hit;
>>       void *opaque;
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 2762cf6705..ab299387e3 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -682,10 +682,12 @@ static inline bool cpu_handle_halt(CPUState *cpu)
>>   static inline void cpu_handle_debug_exception(CPUState *cpu)
>>   {
>>       const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
>> -    CPUWatchpoint *wp;
>> +    IntervalTreeNode *n;
>> -    if (!cpu->watchpoint_hit) {
> 
> Isn't it reasonable to continue checking for this, or can it never be
> NULL if we come here?

Intermediate steps.

Before this patch we walk the entire watchpoint list performing this same clearing in 
cpu_check_watchpoint.  With this patch, we no longer walk every element in 
cpu_check_watchpoint, but have not yet eliminated some manual checks for BP_WATCHPOINT_HIT 
in the target code.  By the end of the patch series, this loop is gone completely.

Helpful if I add a /* Will be cleaned up */ comment at this point in the series?


r~

