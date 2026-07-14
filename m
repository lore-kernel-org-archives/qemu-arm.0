Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1A0C44508
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 14:46:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjeOw-0002ff-Cb; Tue, 14 Jul 2026 10:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjeOp-0002ea-KG
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 10:46:19 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjeOk-0007cG-Tg
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 10:46:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2ceb096e675so33364135ad.0
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784040373; x=1784645173; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pEuwMejFowMdCWNPLFyEu643LtN1cXWGJNAAG/USFAQ=;
 b=IqSsibt16KVed41yGtVKxAGb1XYhHGDCXe7nKaHierpqLoRcOWMN1Gsdok7Axa6BXH
 FKTALV9W1K6iT6HQU5QyMiNzlsIjtOKLL/nyCu2DY6z/giR1dc1v8TPZ5Zjsy8kjybKx
 c3SA6tiU3SakhHxjC7MIUw+V6Zg+pHZ6nAPuWLYh22JQv/UkLjIz7nE9IO4+Me+LlsTT
 PfBBC+3pkT/m275bjQ/incxjgyR9jJLykoAWTzgjaqMukrvpREZRa6yc0xFZ2zKMwR7l
 QYmvLGl6lzckHH148D7QqNJFzjg7KvBIXDbyFk/B/sVFkee2Rd4AlDwjg2i87iOR/i6X
 qxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784040373; x=1784645173;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pEuwMejFowMdCWNPLFyEu643LtN1cXWGJNAAG/USFAQ=;
 b=hwwzRyZi+lTsOKtOA3ROXTyKDkh/8DVsjBxNJPaaM2LQq63X1yGX8rSJnXzyTQNDUN
 a9qFq4qbhtf9HKdAxp0dSYaus3kpAVG3Spl0vuf8kGtgxmlERtMNLDCWpi82ix0xt1X6
 5U56HyxAZ+ySKFm50HX8Vk/c1jZKdlR+ssFOoVsa5iMld8CdOhW09btArUa3awRKbo+y
 BF3y3USopbFBVCoH74NVFVPu726XOPTB9yBd9E9ijXH11hZWloFKtgrR6z8DWkQxrjq4
 EEP4sEf7WK0zcp5HEWRPBQ9yHPIPxCuX4AIOTkfP6B728IwKWE+Zck3AUTlb7HD2sX9R
 4chw==
X-Gm-Message-State: AOJu0YxSDM1WBogKuqZbrnXbGezQp3f98dHqfRGZnjRMF/Cg31WKRJ9x
 qwl8M64UEGlysdUCbwTjJlD/qKpwBbdl5GTVlZjCyfgsXgHMZ452LevxNN73BIpECNE=
X-Gm-Gg: AfdE7ckWd4SOwzR3S3hLMQbMOfeJe+t5oO3WmJP/STHv0S0tWk5RE8gjXzzF2n/LvG0
 +Jx3jrThDjx7nyu0grOOnd1nkoiOs9obb0pFBfTRrVlRmkS8NbfnWs7o9UrCdFnWb6A03lpAxx5
 vK9ou1ePBiSRpgDvUYjg8oaSbWqpIvmq4nJ1qJAMHrRgaoaISBooStX5r4trM5eVdL0BhO0abqq
 s0ziZSEX4vQUEscnywbOKVKu+uGHByVT9Buk2CunuopeZwt1v0B1149rbN32dZ4WRP2lURUIGxB
 p/2XAVm1D6XLp1wthFrseghz5jU8up4e9BKcOKJxZt5qL3X54IdHZQP0QyAoFI/9cG0p0N1F4lN
 JkbRronFs0H3tKqEbwpkzBoCEGPUB3XGBd+9nQeAhoabOCYZWrhgWNZyVu5R5dG5iIYAzAltiph
 tyzAWCgNEHYtRxjHOflRCwqFh8Mg==
X-Received: by 2002:a17:902:f68b:b0:2cc:7c36:2c23 with SMTP id
 d9443c01a7336-2ce9f178346mr124367455ad.43.1784040372874; 
 Tue, 14 Jul 2026 07:46:12 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.146.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d1edb0sm116971485ad.53.2026.07.14.07.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 07:46:12 -0700 (PDT)
Message-ID: <b709599a-c1f4-4e24-853b-f7da06981f6b@linaro.org>
Date: Tue, 14 Jul 2026 07:46:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/51] cpu: Use interval-tree for CPUBreakpoint
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-16-richard.henderson@linaro.org>
 <f64a5bc8-870e-492f-9a89-cbbb4c2e204f@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <f64a5bc8-870e-492f-9a89-cbbb4c2e204f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 7/14/26 05:39, Ilya Leoshkevich wrote:
> 
> 
> On 7/10/26 22:53, Richard Henderson wrote:
>> Use a balanced binary tree rather than a simple list for breakpoints.
>> Using an interval tree makes it easy to probe for all breakpoints on
>> a virtual page.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/breakpoint.h   |  4 +--
>>   include/hw/core/cpu.h       |  3 +-
>>   accel/tcg/cpu-exec.c        | 58 +++++++++++++++++++++----------------
>>   accel/whpx/whpx-common.c    |  9 +++---
>>   cpu-common.c                | 46 +++++++++++++++--------------
>>   hw/core/cpu-common.c        |  1 -
>>   linux-user/main.c           | 14 ++++++---
>>   target/i386/whpx/whpx-all.c | 15 +++++-----
>>   8 files changed, 84 insertions(+), 66 deletions(-)
> 
> [...]
> 
>> @@ -312,33 +312,34 @@ static bool check_for_breakpoints_slow(CPUState *cpu, vaddr pc,
>>           return false;
>>       }
>> -    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>> -        /*
>> -         * If we have an exact pc match, trigger the breakpoint.
>> -         * Otherwise, note matches within the page.
>> -         */
>> -        if (pc == bp->pc) {
>> -            bool match_bp = false;
>> -
>> -            if (bp->flags & BP_GDB) {
>> -                match_bp = true;
>> -            } else if (bp->flags & BP_CPU) {
>> +    n = interval_tree_iter_first(&cpu->breakpoints, pc, pc);
>> +    if (n) {
>>   #ifdef CONFIG_USER_ONLY
>> -                g_assert_not_reached();
>> +        bp = container_of(n, CPUBreakpoint, itree);
>> +        assert(bp->flags & BP_GDB);
>> +        goto found;
>>   #else
>> -                const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
>> -                assert(tcg_ops->debug_check_breakpoint);
>> -                match_bp = tcg_ops->debug_check_breakpoint(cpu, bp);
>> -#endif
>> +        /* Prefer GDB breakpoint over architectural breakpoint. */
>> +        do {
>> +            bp = container_of(n, CPUBreakpoint, itree);
>> +            if (bp->flags & BP_GDB) {
>> +                goto found;
>>               }
>> +            n = interval_tree_iter_next(n, pc, pc);
>> +        } while (n);
>> -            if (match_bp) {
>> -                cpu->exception_index = EXCP_DEBUG;
>> -                return true;
>> +        const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
>> +        assert(tcg_ops->debug_check_breakpoint);
>> +
>> +        for (n = interval_tree_iter_first(&cpu->breakpoints, pc, pc); n;
>> +             n = interval_tree_iter_next(n, pc, pc)) {
>> +            bp = container_of(n, CPUBreakpoint, itree);
>> +            if ((bp->flags & BP_CPU) &&
>> +                tcg_ops->debug_check_breakpoint(cpu, bp)) {
>> +                goto found;
>>               }
> 
> 
> Walking the tree twice feels slightly inefficient, but the only
> alternative I can think of entails calling
> tcg_ops->debug_check_breakpoint() for each node, which may be even
> worse.

That's what I thought -- if we ever called debug_check_breakpoint when a gdb breakpoint 
exists, then we're doing something wrong.  The only alternative is to separate the two 
types of breakpoints into two different interval trees.


r~

> 
> Reviewed-by: Ilya Leoskevich <iii@linux.ibm.com>


