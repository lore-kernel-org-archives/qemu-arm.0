Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2157121ejb;
        Wed, 21 Feb 2024 12:41:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcZ1g2pTk2ihZ9PYUxrfKiJuv4JH8aa6+Y69AmbxqjCMrgXhUuC5ALQD9kTjfkgjuTKc7M6oAOKXBfP6RZWGv43VIjQHj+
X-Google-Smtp-Source: AGHT+IGSnF254kY2jDnkAndFDIlNqdaQzU4kQqL+WkE/22020wrEjCBmH2l5v3Gyy8UhwNEAumn4
X-Received: by 2002:ac8:58cc:0:b0:42e:259a:66c with SMTP id u12-20020ac858cc000000b0042e259a066cmr6876153qta.32.1708548095611;
        Wed, 21 Feb 2024 12:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708548095; cv=none;
        d=google.com; s=arc-20160816;
        b=HBN5tsntuwgO1eEbGi0uqHTj240GJ/2P6uk7cjGNTtUG9ds9spN0Ea0YCunbSW12JD
         WIekvLEtpTP007wHHbKMrjOxu1HMzA/AfjXJLNsJdAvr0KrpSW7GyJmY7snY6NW9AsIB
         mKABkhalO4ViZzE2REmcwx1/cx8RlZnddZBF47iYXS411XFxWaDddkAuuQq+I2C/tMQ2
         31h4bnX3O5rvZcDnR1FnDpn8gLm9O/RDEfxalwKqACqpVGVZNdiPoJtDySDbOdZswJSu
         jkPn/aDGur4bkhEqY8Bb8PLw4ptA38kYRDdcDYqatZpwxu9Zx3oUsCG+8dTbUjqoZQRT
         AqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6etce8ly7+iymUslPRIk+x3FEVGpMx3DvXWMJ8MNuWI=;
        fh=423nsSoAgUHAwicLa0KymVB8ALQq+6CGYWjTC9MObGc=;
        b=f3PFNGvSgWXUkL47fHac2ctfVk+LeL1SrUb+0RDr5S6gqaP+j8hMa5Gg9mQ+EM4LYI
         fyG33iNdmOd6cta4E/O6NFTgZ1/OAIyvLOOpZQpHphXAq/d0dqalNgiggYTVx7iVE2VK
         mmCLsXo2KoVQrGS1YDRocTi3zCX/GSwosHpTbDTvadf8ovQbwVKQkKUUyrZ++R3mJunu
         OoGirjYsWUvv25/O4nqi2yInB6bTXQT/yRCfa3wp41uYDHko02e3EVi4VPVWnN0YY5TL
         v2tYKfBaMym2BY4G6qTV7aUTYn7ybNdSB6X5g2E2qTI17CLppwugCy8wQv7cAYS+1faX
         YSGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ydzcF/eN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05622a178d00b0042c3d9cdd65si12648935qtk.299.2024.02.21.12.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 12:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ydzcF/eN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctP3-00024N-43; Wed, 21 Feb 2024 15:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rctP1-000244-KW
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:41:15 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rctOz-0002Zz-UT
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:41:15 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1dbf1fe91fcso32747865ad.3
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 12:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708548072; x=1709152872; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6etce8ly7+iymUslPRIk+x3FEVGpMx3DvXWMJ8MNuWI=;
 b=ydzcF/eNyEM/MRWxCfF+m9CKHAsM1WVLDc3pl1M16OWJazFxOouIRqhsRUgDkRDiaH
 qrXsOvC9IFZsIlYXaL20WKHxYg+lYWIV+CIw/6Hw6axGX2Kc/ZBeIg/zFDBhrzAhh1gr
 I/nDaKYNHVKDDkyL8dB5ZQxj6Ho/gVL5jjARaOL4gBnrEdyoPqlPmx+Ch2bdeKAlGM8r
 /Z2WphdUU6RSNhNPMEHjc6TPy+3eMd1Wd0/PBWULqbSl4DLMxtdXdcD3oC96jcutv+H1
 ZFRq1vrGCQ6GVDxOEZv+92R1WznjysqWp9GHSH0mJIaru5hWkmjfpi5Opih5rce6o0ux
 C8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708548072; x=1709152872;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6etce8ly7+iymUslPRIk+x3FEVGpMx3DvXWMJ8MNuWI=;
 b=u0GLirh+DlnG6ahot9hNMbKNoiIShzGyaQgyzmr+KDLmuDIkQDDUMiOTcMjzgEGn3C
 NUHn5dEA2Up7e2Y+Of1RLGKvLhtLAyi7Yfa2jMDevtg3JEk8jYIoiLq+8FfFAhYb2/Pc
 IBrPevOmdrbTPVp+vMdM7HJSPRyFHTJZK0idLSF3mB2QSZHa7d7XULZ5h07K2FyTQWnz
 5/GgcwwZvLU3rWo5yog/tVVPbR1xxuJwq7X2lDildBvte1n85gMEfCaCkumXT41GTftk
 8yo9Xo4uFXw4YWUP1fq0tV7C8mb96CQS2QTJLMd7oDNS13ENCvDzpbo5l0bXg4HqU4SM
 jemw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXowy9Vsw3S+t5k2C9eFmE5m6jacKJoEec1Ch1D0yl/KlhhfxavyAt1hX6gMOm3raPuEgeqWWB+UbWBJRViMEVK2+rR
X-Gm-Message-State: AOJu0YzSUT7N5+7B1B5cVsUWXWBaTj4CBbA7CSHCkWd6w4GnReMGn8Xc
 7zj0R9TzTeqJX8kp+t7QJgeWhoQ8+/nzmsba5PX00LSeEi1HQecinVvMrbxlUDk=
X-Received: by 2002:a17:902:bb81:b0:1d8:ee44:629d with SMTP id
 m1-20020a170902bb8100b001d8ee44629dmr17770636pls.30.1708548071779; 
 Wed, 21 Feb 2024 12:41:11 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 x2-20020a170902fe8200b001d947e65ad8sm8507278plm.251.2024.02.21.12.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 12:41:11 -0800 (PST)
Message-ID: <0911d6a4-7fd6-4d0f-83a8-ec4ba8420297@linaro.org>
Date: Wed, 21 Feb 2024 10:41:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/22] target/arm: Implement ALLINT MSR (immediate)
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-5-ruanjinjie@huawei.com>
 <9fb9c74e-e4d3-4a8b-b736-c8603414245c@linaro.org>
In-Reply-To: <9fb9c74e-e4d3-4a8b-b736-c8603414245c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q0spoh6CEOQs

On 2/21/24 09:09, Richard Henderson wrote:
> On 2/21/24 03:08, Jinjie Ruan via wrote:
>> Add ALLINT MSR (immediate) to decodetree. And the EL0 check is necessary
>> to ALLINT. Avoid the unconditional write to pc and use raise_exception_ra
>> to unwind.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   target/arm/tcg/a64.decode      |  1 +
>>   target/arm/tcg/helper-a64.c    | 24 ++++++++++++++++++++++++
>>   target/arm/tcg/helper-a64.h    |  1 +
>>   target/arm/tcg/translate-a64.c | 10 ++++++++++
>>   4 files changed, 36 insertions(+)
>>
>> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
>> index 8a20dce3c8..3588080024 100644
>> --- a/target/arm/tcg/a64.decode
>> +++ b/target/arm/tcg/a64.decode
>> @@ -207,6 +207,7 @@ MSR_i_DIT       1101 0101 0000 0 011 0100 .... 010 11111 @msr_i
>>   MSR_i_TCO       1101 0101 0000 0 011 0100 .... 100 11111 @msr_i
>>   MSR_i_DAIFSET   1101 0101 0000 0 011 0100 .... 110 11111 @msr_i
>>   MSR_i_DAIFCLEAR 1101 0101 0000 0 011 0100 .... 111 11111 @msr_i
>> +MSR_i_ALLINT    1101 0101 0000 0 001 0100 .... 000 11111 @msr_i
>>   MSR_i_SVCR      1101 0101 0000 0 011 0100 0 mask:2 imm:1 011 11111
>>   # MRS, MSR (register), SYS, SYSL. These are all essentially the
>> diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
>> index ebaa7f00df..3686926ada 100644
>> --- a/target/arm/tcg/helper-a64.c
>> +++ b/target/arm/tcg/helper-a64.c
>> @@ -66,6 +66,30 @@ void HELPER(msr_i_spsel)(CPUARMState *env, uint32_t imm)
>>       update_spsel(env, imm);
>>   }
>> +static void allint_check(CPUARMState *env, uint32_t op,
>> +                       uint32_t imm, uintptr_t ra)
>> +{
>> +    /* ALLINT update to PSTATE. */
>> +    if (arm_current_el(env) == 0) {
>> +        raise_exception_ra(env, EXCP_UDEF,
>> +                           syn_aa64_sysregtrap(0, extract32(op, 0, 3),
>> +                                               extract32(op, 3, 3), 4,
>> +                                               imm, 0x1f, 0),
>> +                           exception_target_el(env), ra);
>> +    }
>> +}
> 
> A runtime check for EL0 is not necessary; you've already handled that in 
> trans_MSR_i_ALLINT().  However, what *is* missing here is the test against TALLINT for EL1.
> 
>> +
>> +void HELPER(msr_i_allint)(CPUARMState *env, uint32_t imm)
>> +{
>> +    allint_check(env, 0x8, imm, GETPC());
>> +    if (imm == 1) {
>> +        env->allint |= PSTATE_ALLINT;
>> +    } else {
>> +        env->allint &= ~PSTATE_ALLINT;
>> +    }
> 
> I think you should not write an immediate-specific helper, but one which can also handle 
> the variable "MSR allint, <xt>".  This is no more difficult than
> 
> void HELPER(msr_allint)(CPUARMState *env, target_ulong val)
> {
>      ... check ...
>      env->pstate = (env->pstate & ~PSTATE_ALLINT) | (val & PSTATE_ALLINT);
> }

Ho hum..  I just noticed that TALLINT only traps immediate write of 1, not also immediate 
write of 0.  So one helper for both MSR Xt and MSR imm is not practical.


r~
