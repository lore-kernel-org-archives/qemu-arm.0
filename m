Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97E0CD98E3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:20:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVan-0004q1-J7; Tue, 16 Jun 2026 11:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZVal-0004pp-Rt
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:20:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZVak-0007bn-2y
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:20:43 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-37c5b9d42efso346369a91.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781623240; x=1782228040; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7l5nXH0Y56VLvkbCTJDwSQ/agZ8m3Ub62gCgahFuHR8=;
 b=iNLjT4mZG2wujRyVKWTr/4emzdhkz/EGUtL7NyVtF/oMli8OZ/i+Cc8MofBnCSoMBy
 OZELZjPwgM5Hz2avuSmqCLJ+sMM6a4RoAMBZiDiSBL4JCarCTDp4seKQ7qF0Plg8gg2S
 K5iP6IB06jNi5+xVtGRJfS51jbHyy8zCNsZRbm3TMryTkt5L8aO2phAb1I136qYUgIOy
 ImtKtagxcOB/3yTcfxNzNW3MkXvk4LL5u1E7Lh1FENT+1nRsLyorg2YjfoLZtqcwsS/9
 i4NKjaniB+scmK2En/Qsk9eGCSW/hFYFW9t5bRMYStcc+Yb/6xt6604X0jsHYoVqPgvQ
 ClbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781623240; x=1782228040;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7l5nXH0Y56VLvkbCTJDwSQ/agZ8m3Ub62gCgahFuHR8=;
 b=YGusIH3GikxiAZWIv20CQlFYozX6oflM3qwmMqTgIXQLphiiwQA6N8w9V4XOLfz+oe
 yUtR/fBTOJj6X+j2yMJZlnuNyGshebX+l0YjeRRE5IxG22P0Oh86mz8ih91Z7Ps/v13H
 M7b/hvTPxQODPmKoynO/nEYaoX7TPjyH/zanweIRshFEFWQ4i8gcEXa9sIevfU4pR1PC
 W5Q6vqNlD9RhRzYpmYFK5277Vpj+KJpshY9egPvt7x82N2+uprvqhyw3S3NKr49vXh/R
 lUPKKpMhzlLDk9At3ilF/L+0TxZhwvXuXHdXFerF+XtVcZmvjw9q9vyr9JtELeQCWlsc
 45hA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LLCg29rjPFDCT3XkAJwDJ1xM47bcLW6453vqI367ngm+gtFSgiGKD7wp+24mpiy9QPTrXCnenUA==@nongnu.org
X-Gm-Message-State: AOJu0Yyx7XuROi/EYQjCWwY9S14P318Z97m2SuXZ1gfENqOyJW53BjoU
 JYTZRe+ifSQJ3/sRzqcl7NJeAlE1lvHlkSW+BqZ3sz6rvORFvMaMX1cbtIJhv8cX2ow=
X-Gm-Gg: Acq92OH+YOAsJ7S8dyvZl7GC8xZ3GvRbL+H3rVofdiWNiqV9WE7ffXUt6L0TP5zsg1Y
 nU74v/uNOfcX9I8bPkj/3NfgyKacXekZwCZaLd7pHQkA0sxn40hkt9ONgmTyW6WR5KZUkI3u279
 IujowpvSdNkE57zgVJAfuJinjx4xjoAoZyL+qIjTQeu/0OeU5f0tUFtYHC+pKbsLThMtYMcMBee
 LFU55VQMzUZxdERb4qsuMdR45VogofBOH3ieU2GrNquZGSbCUxsMw2Hqs7aBO5l/ptm3mCduQUY
 UNq3ldPUKghIgT7V/wg2/gJ6AGdlCUEELpSXMWa/XNordmwNtdV1LttJxgtsIcayFB5OpQSIRKX
 AIGlVHj26iMqNog47zzmasTatgN4SQkA1tnQT4dVKIToerH1tJK2pR/wSc8w5h+Q3WzmCrmZI3x
 M/0s9iApEZpteGQYry0cQ7wBYPcqCA9gNpddPWtQ48OZRwmGvOow+CHfPezXFQh3OtnyfCwfmEw
 Kz8Llo=
X-Received: by 2002:a17:90a:ec8b:b0:369:742a:4259 with SMTP id
 98e67ed59e1d1-37c52225167mr3562422a91.0.1781623240128; 
 Tue, 16 Jun 2026 08:20:40 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8661b5ccafsm12178196a12.2.2026.06.16.08.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:20:39 -0700 (PDT)
Message-ID: <1540ab06-9e99-43f3-b2e5-cb46977d0531@linaro.org>
Date: Tue, 16 Jun 2026 08:20:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/25] target/arm: Implement EXPAND
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-20-richard.henderson@linaro.org>
 <CAFEAcA9JWsJPLx=rH2OiuDMP4f46H5PSzzOBrQaVq=URonSfRQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9JWsJPLx=rH2OiuDMP4f46H5PSzzOBrQaVq=URonSfRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 6/16/26 06:30, Peter Maydell wrote:
>> +#define DO_EXPAND(NAME, TYPE, H)                                      \
>> +void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)        \
>> +{                                                                     \
>> +    intptr_t oprsz = simd_oprsz(desc);                                \
>> +    ARMVectorReg tn = *(ARMVectorReg *)vn;                            \
>> +    intptr_t i = 0, j = 0;                                            \
>> +    do {                                                              \
>> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
>> +        do {                                                          \
>> +            TYPE nn = 0;                                              \
>> +            if (pg & 1) {                                             \
>> +                nn = *(TYPE *)((void *)&tn + H(j));                   \
>> +                j += sizeof(TYPE);                                    \
>> +            }                                                         \
>> +            *(TYPE *)(vd + H(i)) = nn;                                \
>> +            i += sizeof(TYPE);                                        \
>> +            pg >>= sizeof(TYPE);                                      \
>> +        } while (i & 15);                                             \
>> +    } while (i < oprsz);                                              \
> 
> It looks like in the other macros where we iterate like this
> (eg DO_ZPZZ, DO_ZPZ) we write the outer loop as
>     for (i = 0; i < opr_sz; ) {
>       ...
>     }
> 
> rather than as a do while(). Is there a reason I'm missing why
> we need the do-while here ?

Nothing special, no.

Some of the predicate using macros use do/while, e.g. DO_COMPACT.  I probably looked at 
that one while writing expand.


r~

