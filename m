Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7FBFB5173
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 22:27:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9sPA-0005Hr-A0; Mon, 06 Apr 2026 18:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9sP5-0005H4-PH
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:26:45 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9sP1-0008IH-PF
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:26:42 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b256a4c6b5so26105975ad.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 15:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775514397; x=1776119197; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bqHoBHaKejeKlHqI4iFfOrJ8sFg87igETiOohMqyxPo=;
 b=wXUgCt0O5iO65cQTYZ/uYnukARvcWUXTLlSZyHYEzO59hDBYJ3605J1ZUt/lTZh2ih
 /OsVtTgBlUCsvGQg26BNFFisdqgetLbKfR2mwQcYnaw6Fczunsqte40PFbZ3ingBMHq4
 BkMFXpi2TAZVPLY23nSr4uplFdjJNvs6RyF0MlM/mX+fDIQUxLIa8z6LLdKIjjAKLmlI
 bKCKGrfyJmtwd6j9Mnutla6IzWViRATjdVuwwawVkehuVANb7kpaq+MjVYbhD4wQEU+L
 bBkQJYi6G1TrHA3ZLsRVPO0Od6jLZLW2z9DLDs6F5o4aFsEM5GVwZ4FaGjGYmjGnKLtL
 YoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775514397; x=1776119197;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bqHoBHaKejeKlHqI4iFfOrJ8sFg87igETiOohMqyxPo=;
 b=OCDV4pDnRbElx405hfW33Ggq3J84/51JvnShLR9o9N+NorWQ3M0WVUz8cZd1UJ3UE6
 EXnon0JlCSERjp/I1LxlMuNZZS21SyJ7lGd40ZEASdcIAPS/k39Z16qaNEVlZbtLWG9a
 kpF5EqDhRkbYu2oLIIwnivo5IWNSWhq6Aphrh+s5to9dvA3rl763MQ3HY+SaYzuJraqL
 PfhZlOWSfn2lotvmRSnpJbHTCrVYFc1U21awHZcc4yb2hfEHSo5IZTMd0OyzzRnNXtgJ
 zrN+rnnO6N8bqeGHna56r4uQMD5lDWv7DGy8hmjkoq4oiOsm+ql/fuhb2/RQgDOQ4WQ2
 SbtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGjXJz8OrNM+lsPP57YbKwD+AWFIgHRnH+WrWl01XYZlS3SMa8wY+qiNGGqVhf4U+fQKUSNLhKsA==@nongnu.org
X-Gm-Message-State: AOJu0YzXFeWzoN0mYQ/UrLIgwvf3Dqs9oAYuV/YeVkR46Yiu0qGXzvNr
 RJWTZYBbHuX1khl6pmlNKtUerRWFVKZz5SmMyF6yOWGZ6ZEyPE5BmZmi4JolsR2pdDc=
X-Gm-Gg: AeBDietRN6kMxdsr8EwIqXx+Xv9/vUiBNu12usWtKUtnNYvtr6btX3rODJ+HEh2pJUw
 peeuDcK+BIZoBGmg49tQD2m/vdKgX0lzZzP7oyIOBmyoEjbUt4KJM+SoBjOoJI0c34ZMxvy57f4
 BcuIiC1t2JII1Pg73R+dYITQfMzch9CGokt56Yor42rPpIM0ggE9tqdt/CoNAQBgBuZokm+IOR8
 SqXmh2AfAMRI2xoLNfMK6CZLAdp7s3fmTjSwpLRc8DAdk//rKpbnlaCp0JdPSbMUziRun0gHW6W
 2NHp+Q2ClQOVV6aqdctn8fLOnJzftT2cEY2Ns/hJp8W6MEvOe/hjWxH1qh6jbP6EstIBTJJhTH9
 eUYNg4AiBgx7sRVs71/uVo+dDZh03nC6HCWkBKV6XIOYZld56g/bpJD28yxeWYzMGyaACrmHZ3o
 JvzQCfQBblQXK+PJaXnpLk8/eNTAnqEt9Asy98UJQQuGNBOXRXxB3GR1R2zynbfUhHvuAXGg==
X-Received: by 2002:a17:903:38c5:b0:2b0:49e6:9622 with SMTP id
 d9443c01a7336-2b2817ac962mr149750705ad.37.1775514397379; 
 Mon, 06 Apr 2026 15:26:37 -0700 (PDT)
Received: from [192.168.1.168] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274779b48sm205335855ad.25.2026.04.06.15.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 15:26:36 -0700 (PDT)
Message-ID: <92cd883b-8eed-4570-9fd7-bf92e1110b76@linaro.org>
Date: Mon, 6 Apr 2026 15:26:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/20] target/arm/tcg/arm_ldst.h: merge in translate.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-17-pierrick.bouvier@linaro.org>
 <e57ff765-d7b7-467f-b218-05509d6ce70b@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <e57ff765-d7b7-467f-b218-05509d6ce70b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/6/26 2:48 PM, Richard Henderson wrote:
> On 4/7/26 04:26, Pierrick Bouvier wrote:
>> Only translate.c uses those functions, thus move them back to this file.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/tcg/arm_ldst.h  | 47 --------------------------------------
>>    target/arm/tcg/translate.c | 22 +++++++++++++++++-
>>    2 files changed, 21 insertions(+), 48 deletions(-)
> 
> You could drop the inline markers with the move.
>

Will do.

> Anyway,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 
>>
>> diff --git a/target/arm/tcg/arm_ldst.h b/target/arm/tcg/arm_ldst.h
>> index cee0548a1c7..e69de29bb2d 100644
>> --- a/target/arm/tcg/arm_ldst.h
>> +++ b/target/arm/tcg/arm_ldst.h
>> @@ -1,47 +0,0 @@
>> -/*
>> - * ARM load/store instructions for code (armeb-user support)
>> - *
>> - *  Copyright (c) 2012 CodeSourcery, LLC
>> - *
>> - * This library is free software; you can redistribute it and/or
>> - * modify it under the terms of the GNU Lesser General Public
>> - * License as published by the Free Software Foundation; either
>> - * version 2.1 of the License, or (at your option) any later version.
>> - *
>> - * This library is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> - * Lesser General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU Lesser General Public
>> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>> - */
>> -
>> -#ifndef ARM_LDST_H
>> -#define ARM_LDST_H
>> -
>> -#include "exec/translator.h"
>> -#include "qemu/bswap.h"
>> -
>> -/* Load an instruction and return it in the standard little-endian order */
>> -static inline uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
>> -                                    target_ulong addr, bool sctlr_b)
>> -{
>> -    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
>> -}
>> -
>> -/* Ditto, for a halfword (Thumb) instruction */
>> -static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
>> -                                     target_ulong addr, bool sctlr_b)
>> -{
>> -#ifndef CONFIG_USER_ONLY
>> -    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
>> -       within each word.  Undo that now.  */
>> -    if (sctlr_b) {
>> -        addr ^= 2;
>> -    }
>> -#endif
>> -    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
>> -}
>> -
>> -#endif
>> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
>> index 6ea48efbac2..7fcf0656630 100644
>> --- a/target/arm/tcg/translate.c
>> +++ b/target/arm/tcg/translate.c
>> @@ -25,7 +25,6 @@
>>    #define TCG_ADDRESS_BITS 32
>>    #include "tcg/tcg-op-mem.h"
>>    #include "qemu/log.h"
>> -#include "arm_ldst.h"
>>    #include "semihosting/semihost.h"
>>    #include "cpregs.h"
>>    #include "exec/target_page.h"
>> @@ -6280,6 +6279,20 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>>        }
>>    }
>>    
>> +/* Ditto, for a halfword (Thumb) instruction */
>> +static inline uint16_t arm_lduw_code(CPUARMState *env, DisasContextBase* s,
>> +                                     target_ulong addr, bool sctlr_b)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
>> +       within each word.  Undo that now.  */
>> +    if (sctlr_b) {
>> +        addr ^= 2;
>> +    }
>> +#endif
>> +    return translator_lduw_swap(env, s, addr, bswap_code(sctlr_b));
>> +}
>> +
>>    static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
>>    {
>>        /* Return true if the insn at dc->base.pc_next might cross a page boundary.
>> @@ -6514,6 +6527,13 @@ static void arm_post_translate_insn(DisasContext *dc)
>>        }
>>    }
>>    
>> +/* Load an instruction and return it in the standard little-endian order */
>> +static inline uint32_t arm_ldl_code(CPUARMState *env, DisasContextBase *s,
>> +                                    target_ulong addr, bool sctlr_b)
>> +{
>> +    return translator_ldl_swap(env, s, addr, bswap_code(sctlr_b));
>> +}
>> +
>>    static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>>    {
>>        DisasContext *dc = container_of(dcbase, DisasContext, base);
> 


