Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D070CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 18:18:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOJak-000540-9v; Sat, 16 May 2026 14:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOJai-00053f-KG
 for qemu-arm@nongnu.org; Sat, 16 May 2026 14:18:24 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOJag-0007c0-Vn
 for qemu-arm@nongnu.org; Sat, 16 May 2026 14:18:24 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-82fa8d6425bso430332b3a.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778955501; x=1779560301; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SkCRmJVbMNWIUW+47BF5u3h4ZiH2luosrvtnuMXpL8A=;
 b=LzB8NMRqvlOiACpOCbGggkmnzGV4Zvssm/XgD0pQqP7zKIWUQPRV3kIjcVxbj9x9zg
 3aYDOTEfeC+8gQ+4/nR3aALcYNUjj9UqmIu09FHWPycUubRPeQogNHKb3F4J3vIBtEsb
 AUwqnocq6cyhXmmMUEmmF+UqOua+ikfowjaVRemRTlDOaxEhYaiXM3jRcUCEQyR/dZeA
 asNOCAgWqTfGVIapdMZm8xU8V1VAMyVGnK0RF76zfMYd74T0GkLIAweK6AH/+6MP2MpF
 PK1Hbw4MuvzAO3fThYJP+ap+q59xjnpbB2B40nLf1E6UMFOYaxpIW6dEPKUjI1erhYi8
 G+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778955501; x=1779560301;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SkCRmJVbMNWIUW+47BF5u3h4ZiH2luosrvtnuMXpL8A=;
 b=IlBx7lFau3xGE60/rJZkls7YtkwY49ypNLrRnbJBeGe/FTswsl4nnTlphZl6rq8SL6
 7c+XvqC2+9q3DnBMayiVy0NvUItpyfJvCU3NpWUKrAXJPpsjIPGmL63Qg6y8x2DakMGM
 6TcqqPNRjxKN9CYXrj6bl7dWyANTs8lhQg8awEa8UDfPy7oz9pa9O8c2LwArE5Fg8wMz
 G3ObLNW1SZBHGGPb0hHExfqF79ufz+ye4mFb3QgbqtLX7HoyrDd1z3t1Af4QQtGX72KM
 8JHVOrZxiT0Uhn+NVxbBWGThwUARMHQd/E3SFmS2yadHOfQ+8yCrOooX6D0Kw+eyXpLS
 18HA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9i9rn2ysnxyq/ExexSfDfs/9MGRXtmcF573dzcV8m482nntlMtWq7CCqleSeSUHLKfXLAKCbsQXQ==@nongnu.org
X-Gm-Message-State: AOJu0YwTT1EzVa+bl10QsH4ND1vGS5u0nT3rBAwuOy2Ud+dl5Jqp2amd
 bt31Kd6EyZD5pYOuQ5HaQswCmDAx0Qd+k4bI5I2PBd88uDBtWDNAE/i89s14D+f/EZQ=
X-Gm-Gg: Acq92OFU0XErWNnTXuMuQSuzreEW4BmEEy99mWDUNF4w0S9yVS8gmAPh3tK5j1/ZkCa
 xhFd4cIvHKL4MC0uyvB/Kw2g7W7KrvMagg5IMqwpcfHAPW5lcZQmtraKDkhD8ydqqDTIFuZsMLm
 O0+L4XOQAHUcvwxY9lM6M92n4vvLjVomQJByV7QaeQ6HqPGUyAVphPv45FUwKfi+rgK2gD+639p
 DYd+kIvsUYW/mi3nrrJT3h+rw9py8D82VRKcNx8HfymfXTJjGndFYCCWxSC6T9Xr5hNlibagYEL
 KPqsqnt5FC3w4hQll/3bGa8Pf9rmVecHPhf1w+H7olaYYkKw4vkjX0PaPT3pY+CPCYmISg6wSVV
 +665oDZsLLGNzs0OjCFE6JKmfrMFo4BDANbG1D/4lFQ4rhvBkD0cF1c7HJyys8dn2yGhBedCfYe
 Q55zs4GdXqjI2NnXrGmis+mxmjhpUKROMlMsxTKcx16SaZlJU=
X-Received: by 2002:a05:6a00:3a2a:b0:837:e9cc:d46e with SMTP id
 d2e1a72fcca58-83f33cbf654mr9338120b3a.21.1778955501309; 
 Sat, 16 May 2026 11:18:21 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f196660f9sm12105464b3a.10.2026.05.16.11.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 May 2026 11:18:20 -0700 (PDT)
Message-ID: <0b520bc5-d680-4e40-92ad-1ff4b6f71466@linaro.org>
Date: Sat, 16 May 2026 11:18:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/37] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260421051346.41106-1-richard.henderson@linaro.org>
 <20260421051346.41106-3-richard.henderson@linaro.org>
 <CAFEAcA8cM2aKa=9Qh8LOVyoEZKQfw3rTBfNrDi4xd_s+tXq2Mg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA8cM2aKa=9Qh8LOVyoEZKQfw3rTBfNrDi4xd_s+tXq2Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 5/14/26 03:35, Peter Maydell wrote:
> On Tue, 21 Apr 2026 at 06:15, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu-features.h        |  5 +++++
>>   target/arm/tcg/helper-a64-defs.h |  7 +++++++
>>   target/arm/tcg/vec_internal.h    |  7 +++++++
>>   target/arm/tcg/translate-a64.c   | 14 +++++++++++++
>>   target/arm/tcg/vec_helper64.c    | 35 ++++++++++++++++++++++++++++++++
>>   target/arm/tcg/a64.decode        |  5 +++++
>>   6 files changed, 73 insertions(+)
> 
> 
> 
>> +#define DO_FAMINMAX(NAME, TYPE, FN)                             \
>> +TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status *s)             \
>> +{                                                               \
>> +    bool save_fz = get_flush_to_zero(s);                        \
>> +    bool save_fiz = get_flush_inputs_to_zero(s);                \
>> +    int new_flags, save_flags = get_float_exception_flags(s);   \
>> +                                                                \
>> +    set_flush_to_zero(0, s);                                    \
>> +    set_flush_inputs_to_zero(0, s);                             \
>> +    TYPE r = TYPE##_##FN(TYPE##_abs(a), TYPE##_abs(b), s);      \
>> +                                                                \
>> +    set_flush_to_zero(save_fz, s);                              \
>> +    set_flush_inputs_to_zero(save_fiz, s);                      \
>> +    new_flags = get_float_exception_flags(s);                   \
>> +    new_flags = (save_flags & float_flag_input_denormal_used)   \
>> +              | (new_flags & ~float_flag_input_denormal_used);  \
>> +    set_float_exception_flags(new_flags, s);                    \
>> +                                                                \
>> +    return r;                                                   \
>> +}
> 
> I don't think this has the right behaviour for NaN inputs.
> We don't special-case NaNs in this function, and we pass
> our inputs to the floatN_abs() functions, which also don't
> special-case NaNs, they just flip the sign bit. So if the
> input is a NaN with the sign bit set, the max/min function
> will propagate a sign-flipped NaN to the output, rather
> than correctly propagating the input NaN untouched.

Yep.

See FPAbsMax{N}, where the sign bits are squashed before unpacking:

     let op1 = '0'::op1_in[N-2:0];
     let op2 = '0'::op2_in[N-2:0];
     let (type1,-,value1) = FPUnpack{N}(op1, fpcr);
     let (type2,-,value2) = FPUnpack{N}(op2, fpcr);


r~

