Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C52CCD98E3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:25:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVfi-00063D-UT; Tue, 16 Jun 2026 11:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZVfh-00062v-JO
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:25:49 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZVff-0001sv-Uz
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:25:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-36ba706ab46so3081859a91.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781623546; x=1782228346; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Paz6w9KHJRAC2epf/+EpUnskrCLkWvVxbOEvjRWFcVU=;
 b=HBWmdH7miO/fO9RgzEyYQSOlnyl3JSmRKQGsiTe8Ccx5/1tm4C2rC8ZMBddh39jGDD
 r04gZ2KsP2NL8eZSEN94dExHSYvqz6dQeLHC3/6KS/GFnbujd0LAzy1TSNL7iiYF/XYR
 AyOS4c8WG+eIpnc2K0k5owmp+91FQhB8vnMAYGQ//My0dxXu3wmY9/rwLjBgD6/rnj6/
 NW2dyDRKLF7X83VYr5kO3vL8FTffG930qKDmxg5Tb8C59hNJM7kVerkIKzNvucj4XncP
 hPQpm6huhJ/Ry/1W2l8JtPzbbJ5e9caTOjusCAgEMeQBRLx91LOCk+tsvvoiezVskBy0
 Q2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781623546; x=1782228346;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Paz6w9KHJRAC2epf/+EpUnskrCLkWvVxbOEvjRWFcVU=;
 b=NLGzjlwLzgSuX80P6EspMW4IsuLMPufokTNNuGc++f0vt0Cvm+iy27LJSzYv78DGzr
 DE2oxu6hMfawtuC176qDZ+6IMBdfi4y2nK621fbwqxFJM+7mFR1F1Yusg6GfeEIWwM72
 GqqfIls3deXT+Csj+q8//AQhT/sUpbTTT1nrJiLmkHVBhVLhVgPVnRIIGTvLphXPy7ZL
 6X72695zst6X5DVBhQPN5vg5TQZeN9mUyvZbn2+5xGulV0PKXdgMhvzYMXuSrAVnPqjp
 fpaxU6eu+jFQjrZXkJc51jBKw3AAveXq2GWJnmtLRETpVQyiXPz5rpCuOZu4/17popDb
 sVRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9jR7BIsz3yijDzztx89nTyjZZjo4ir+ho6jS/mc1tU1wfWiTUs28sMSvoSajt7gyUGZPOdDMv0ag==@nongnu.org
X-Gm-Message-State: AOJu0YyJUvHsPlsPYGsQUp770RNAALuoLxy+95ltgzqFh6pg9xgK+1fZ
 aANTKNnol2hj03OSNrSIdoWwjq3tGtW421VeQDvJV3m7C4w5GdC3MGrf6NsCYCdPkrE=
X-Gm-Gg: Acq92OGaoVyTkOeC15JzWpJyFZ82Qd2fOWxUyKeYZjuqrmehOnWL6gujHGXSv5ZyV+0
 L05pNaoBLZVSWuMmF2aOOgPZ8lSSPMPY1vQMAtb0ah1MZAtG0DWhlzVbJOO9ECg+eOTbY4BZ5gs
 AxchzD8f1djqIcW8XwgmCPJMttFOCursWu5s7a8qad4IaLmtmQHPN3yj25OxzO+jqmEc/2jkAz9
 MawkIQZEF/Xk2jL7eP9CGES/+qa+C6dQeDLvQsSAVWLmHWv4LkKMfSierjK5I5sS6Y7v+H7Hmbo
 kli1iA1vRGdPX19L7WKdm4U82urKgO1z/k8D+YROlKNYw01azz8fOQ1rNwWp565Glrnv+3ruSwe
 bLG2uUNqDiM9ahemCaESAuyJR/hP9bjOzAcykW8FXdqSa+zDV9TuKULymegOoXnuVgQFkHuuyRA
 HCwqb5TBrGoTC+p1arfVbi0pq8+G/54Vkt8ccllR95R4zpw12kaT3e7DviHOdCkdhVWi2J
X-Received: by 2002:a17:90b:3a85:b0:36b:944b:fd81 with SMTP id
 98e67ed59e1d1-37c5280307cmr4634880a91.4.1781623545829; 
 Tue, 16 Jun 2026 08:25:45 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-379e7e217c0sm10723414a91.2.2026.06.16.08.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:25:45 -0700 (PDT)
Message-ID: <dbfdc77f-8435-4e9e-90d4-f93a5b8cfa78@linaro.org>
Date: Tue, 16 Jun 2026 08:25:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/25] target/arm: Generalize sve_compact_[sd]
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-21-richard.henderson@linaro.org>
 <CAFEAcA8Vnncc0dfz8D8DRe0npH9FSRPsNWg+_-PDFdiqyWHSdA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA8Vnncc0dfz8D8DRe0npH9FSRPsNWg+_-PDFdiqyWHSdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 6/16/26 06:35, Peter Maydell wrote:
> On Fri, 5 Jun 2026 at 00:52, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Implement with a DO_COMPACT macro and general purpose
>> predicate handling.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/sve_helper.c | 51 +++++++++++++++----------------------
>>   1 file changed, 21 insertions(+), 30 deletions(-)
>>
>> diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
>> index a13ccf4b85..40cf567b0d 100644
>> --- a/target/arm/tcg/sve_helper.c
>> +++ b/target/arm/tcg/sve_helper.c
>> @@ -3637,39 +3637,30 @@ DO_TRN(sve2_trn_q, Int128, )
>>   #undef DO_UZP
>>   #undef DO_TRN
>>
>> -void HELPER(sve_compact_s)(void *vd, void *vn, void *vg, uint32_t desc)
>> -{
>> -    intptr_t i, j, opr_sz = simd_oprsz(desc) / 4;
>> -    uint32_t *d = vd, *n = vn;
>> -    uint8_t *pg = vg;
>> -
>> -    for (i = j = 0; i < opr_sz; i++) {
>> -        if (pg[H1(i / 2)] & (i & 1 ? 0x10 : 0x01)) {
>> -            d[H4(j)] = n[H4(i)];
>> -            j++;
>> -        }
>> -    }
>> -    for (; j < opr_sz; j++) {
>> -        d[H4(j)] = 0;
>> -    }
>> +#define DO_COMPACT(NAME, TYPE, H)                                     \
>> +void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)        \
>> +{                                                                     \
>> +    intptr_t i = 0, j = 0, oprsz = simd_oprsz(desc);                  \
>> +    do {                                                              \
>> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
>> +        do {                                                          \
>> +            if (pg & 1) {                                             \
>> +                *(TYPE *)(vd + H(j)) = *(TYPE *)(vn + H(i));          \
>> +                j += sizeof(TYPE);                                    \
>> +            }                                                         \
>> +            i += sizeof(TYPE);                                        \
>> +            pg >>= sizeof(TYPE);                                      \
>> +        } while (i & 15);                                             \
>> +    } while (i < oprsz);                                              \
>> +    for (; j < oprsz; j += sizeof(TYPE)) {                            \
>> +        *(TYPE *)(vd + H(j)) = 0;                                     \
>> +    }                                                                 \
>>   }
> 
> Why do we have special versions of the predicated loop for 64-bit operands
> elsewhere (eg DO_ZPZ vs DO_ZPZ_D, DO_ZPZZ vs DO_ZPZZ_D, etc) but we don't
> need to do that for compact ?

Efficiency vs laziness.  64-bit elements are special in that we can write things such that 
we don't need a double-loop, by examining just the lsb each byte of the predicate.  But 
such specialization is not required.  Here the inner loop will iterate twice for 64-bit 
elements.


r~

