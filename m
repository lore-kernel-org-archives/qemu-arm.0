Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D74CD4851
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 21:00:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOM7o-00078w-Bm; Sat, 16 May 2026 17:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOM7h-00077i-NJ
 for qemu-arm@nongnu.org; Sat, 16 May 2026 17:00:41 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOM7f-0005A4-F1
 for qemu-arm@nongnu.org; Sat, 16 May 2026 17:00:36 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c795f441ff7so722327a12.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 14:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778965233; x=1779570033; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OiLyflX0ohR3lipSWlPPAtrHInPv/h3YkI22h49LYFg=;
 b=TE6vHZdafVEi1Twt3iOGX7MBlL1gYRjnzzuvEr8h4F+PE6Fr0SyREp3DDDg2a9M8Km
 ZqeCt1RM6PSsjowrh3BFtPUNOkdPUOq0fOeGdhDQ2qmkbSbKHb2aEBG/Par0NnM8Jk1f
 cYhvmhZfCB4N5SK+LiSa+FQnmXjOLFrQkO5XTMGlWOpULbDXONphUt+oHLU43JM3sR0X
 7yL2PSs9yS0cgT9lQA2ein1R/hGRVA4Kp4a5v5M3uyUpjPFKqnhScIzFCakCSO/o2H92
 xkG2QBpJ5TKvtHgwpfVuULWmmfv8tO5WE8i4HaZrso1HoyLuKZRTpfN+sXggsznY33Na
 LTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778965233; x=1779570033;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OiLyflX0ohR3lipSWlPPAtrHInPv/h3YkI22h49LYFg=;
 b=HrsqrJShPItA6cSN+VVS9SyUtrieO2PkjdR/bkcOwlQgDDNbzkvbxFfH4BUmzX+u0J
 pkh8HIzxBOI/aYiFXgPCu+hS/4/HAtRYm7+Vl++9VUqV/6E42ivUrjyXiU+8EnLsSuP8
 xIy5QpDOQp6/5tp5msWm5PQtWLEVbXL0aWeoyK0EFkrq1qJiawxxM7PcboPEkyLo0oFT
 yDasKN/JansNh7LNZdbwNLP1q4lL7KuYQ+Mz4xycPP+LcyNsNpdHp5ay81qxCWyhr46B
 XAX0stj80myTIxcFY7aLLXuC2VLyyOR7lcndP8hzxHDkrlij7n81Hw1FEj6Pe/uOiqG4
 9Cdw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Gq45z5h4kmljRc09of1PXig8C2XT+23FLtIwJCzD01li6qVT7NpxNAixsSfKif5l9Z/ZyEa1OVQ==@nongnu.org
X-Gm-Message-State: AOJu0YxOHS/urODTOjY4G/K2DWt/kOCl/qqq2AVF7Qhwmp9Xttr/rkw9
 OgCzi0CCM56O14qmAFJPKyYh+fC7y89AnITruSy5EcXcyHk7ls194fll7n8360NII78=
X-Gm-Gg: Acq92OFWPgorN5eQeZQddHSWC3znrmUZzm1aMOvMenp3ZLRI0M/E0D0PuUlN+7chO5v
 p6zVr0m8/fObWuzD8Rhqq77x/MC2mOWhSOccl42HT4U/6XWHyVL0N/1jvPA3revh+2i3065cxD2
 9HhW95AVrIotarMEh7dRaC30u/90jDHig0+ML6dyl4m4qPA+pi6pk50d9Sflmiv4FqhaM/lkCIa
 /mWypqX+IWC9IRs3r5jn0iJ1XrL1eyhJMWxfBAGXW8FmOgbYrbqJWRla4Y5XhHFdqXrTUWipWWD
 AeSR8zvzU0zHFFkWpyom3Jh79l8hKOjKtMbuTIfUaAM8Hkzg3IMLpal7i0G/xHn+8S5e/1Q/2fp
 N+y+nBLy4e9mbiVADjXu3G9L4QSdoq1JbjLUCwKYevuhGuvrPlKwd+i/sTcJQWQus8yWSI8TdK6
 GEowFfj4aQ5mwrsybStTeHgHR/T26ztVLQIh9t+lRpJusMsrE=
X-Received: by 2002:a05:6a21:9983:b0:3a0:200e:64b0 with SMTP id
 adf61e73a8af0-3b22e682b99mr10357798637.9.1778965233449; 
 Sat, 16 May 2026 14:00:33 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82c4031662sm8416841a12.16.2026.05.16.14.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 May 2026 14:00:32 -0700 (PDT)
Message-ID: <4ee83dd6-47eb-4eb8-9091-7955f2376f0c@linaro.org>
Date: Sat, 16 May 2026 14:00:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/37] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260421051346.41106-1-richard.henderson@linaro.org>
 <20260421051346.41106-3-richard.henderson@linaro.org>
 <CAFEAcA8cM2aKa=9Qh8LOVyoEZKQfw3rTBfNrDi4xd_s+tXq2Mg@mail.gmail.com>
 <0b520bc5-d680-4e40-92ad-1ff4b6f71466@linaro.org>
Content-Language: en-US
In-Reply-To: <0b520bc5-d680-4e40-92ad-1ff4b6f71466@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 5/16/26 11:18, Richard Henderson wrote:
> On 5/14/26 03:35, Peter Maydell wrote:
>> On Tue, 21 Apr 2026 at 06:15, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/arm/cpu-features.h        |  5 +++++
>>>   target/arm/tcg/helper-a64-defs.h |  7 +++++++
>>>   target/arm/tcg/vec_internal.h    |  7 +++++++
>>>   target/arm/tcg/translate-a64.c   | 14 +++++++++++++
>>>   target/arm/tcg/vec_helper64.c    | 35 ++++++++++++++++++++++++++++++++
>>>   target/arm/tcg/a64.decode        |  5 +++++
>>>   6 files changed, 73 insertions(+)
>>
>>
>>
>>> +#define DO_FAMINMAX(NAME, TYPE, FN)                             \
>>> +TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status *s)             \
>>> +{                                                               \
>>> +    bool save_fz = get_flush_to_zero(s);                        \
>>> +    bool save_fiz = get_flush_inputs_to_zero(s);                \
>>> +    int new_flags, save_flags = get_float_exception_flags(s);   \
>>> +                                                                \
>>> +    set_flush_to_zero(0, s);                                    \
>>> +    set_flush_inputs_to_zero(0, s);                             \
>>> +    TYPE r = TYPE##_##FN(TYPE##_abs(a), TYPE##_abs(b), s);      \
>>> +                                                                \
>>> +    set_flush_to_zero(save_fz, s);                              \
>>> +    set_flush_inputs_to_zero(save_fiz, s);                      \
>>> +    new_flags = get_float_exception_flags(s);                   \
>>> +    new_flags = (save_flags & float_flag_input_denormal_used)   \
>>> +              | (new_flags & ~float_flag_input_denormal_used);  \
>>> +    set_float_exception_flags(new_flags, s);                    \
>>> +                                                                \
>>> +    return r;                                                   \
>>> +}
>>
>> I don't think this has the right behaviour for NaN inputs.
>> We don't special-case NaNs in this function, and we pass
>> our inputs to the floatN_abs() functions, which also don't
>> special-case NaNs, they just flip the sign bit. So if the
>> input is a NaN with the sign bit set, the max/min function
>> will propagate a sign-flipped NaN to the output, rather
>> than correctly propagating the input NaN untouched.
> 
> Yep.
> 
> See FPAbsMax{N}, where the sign bits are squashed before unpacking:
> 
>      let op1 = '0'::op1_in[N-2:0];
>      let op2 = '0'::op2_in[N-2:0];
>      let (type1,-,value1) = FPUnpack{N}(op1, fpcr);
>      let (type2,-,value2) = FPUnpack{N}(op2, fpcr);

Ho hum.  And then FPProcessNaNs uses op[12]_in.  So, yeah, the absolute value isn't used 
if there's a NaN.


r~

