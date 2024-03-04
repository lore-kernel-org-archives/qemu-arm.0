Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2716127eja;
        Mon, 4 Mar 2024 09:03:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUiVMPUEtveiLAG39eZVieGE+Y64mdcMrofCWmiddPEFt6RA3AqM2s0+qKdJOfLmrPaWLzg3liqRIyt+Te2kkXuebqd2PkQ
X-Google-Smtp-Source: AGHT+IGecy2R+HQTB4RBihE0cMG/Otobo5oPIWpNOcnEhVxxkZtKjHco1IYst4V/DIuD7VVlUWvU
X-Received: by 2002:a81:83c4:0:b0:608:3982:f5bf with SMTP id t187-20020a8183c4000000b006083982f5bfmr9874433ywf.34.1709571796916;
        Mon, 04 Mar 2024 09:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709571796; cv=none;
        d=google.com; s=arc-20160816;
        b=Ex+3mlEBHemf7n9corVl6p4dHKl77FqzZqDN7zDRREUzkeD74+LbdWhch5RFfvYHJ8
         M+ygXdEcHDpmJ3j1LoM317AktX1IfyLGPQQ3zAj9Cmwyly2YAEqOHcv6y/f19X891PI0
         E0uiiVTuva6TJC2/Yk8JMGbSSsA4pxKSC7DG2j+EE7XLLMYprZzbPbZedLTQGVYiYXxq
         fiAIfd5RmJwQdUs3lXATtGwcrE7ZDI+/XH473XLATxBAuNnAR8z6N5UJ+9kZduWF4fW8
         oceXIrziKVqQzSO2FIbV2Rb1i/Ql1pPlsD3f3Krd7ihTm5J82TejIi06crcF/x8NnSmF
         zyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GE6mDiJbQ2UU8njAjf9/yNHee9b/ZjET9OK0aQM71gY=;
        fh=UsGzyDa8swkBXhY3gDwm00VxZ/xNPc6CUr5/F1czq3M=;
        b=f01IylqNgMc3HlOfF5vC0Pm+P8xrAB68Z6dAjic2Jr3Acu/kMyfVLkNCOaCPjoHrcm
         cwr1AUlED6E7QfrPlUM4AfEWaD2VtarNuWKrRVcp/llLeZ/biXCoRLAfdfR5w0nwWGG+
         MzU8g3RDhqVUFUE9a9Yr60MEfqgM++pFk6cEQSwyuKE+za4S2UEzONXWZNmVgbUIlOrd
         iTw4/hL2F8OJAweeJf2GYrrAFwvGM4pHRKj4zSh0PlyfAs0OGfORL0ZHqxR1qyVkwo82
         9PRH2jKfyJiZaeA6VgF2TA9HUTtORzSzIuan9uKZQmp+MlLn+a9ZQChkWN3A52oz9/vY
         v1PQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJXhE9pd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s206-20020a819bd7000000b00607e6125932si4302040ywg.409.2024.03.04.09.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 09:03:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJXhE9pd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhBiI-0000t9-Jj; Mon, 04 Mar 2024 12:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhBiG-0000rh-Gj
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 12:02:52 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhBiD-0002Zf-Bx
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 12:02:52 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so4260801b3a.3
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 09:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571767; x=1710176567; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GE6mDiJbQ2UU8njAjf9/yNHee9b/ZjET9OK0aQM71gY=;
 b=xJXhE9pdb0gSpdp40pGIE/mCguAJ1v+ZJuq0Ls6z2sMmsYeNV4s+dMhurptO1w2AAd
 5GkipRXOYIUtEABkRB9yooDoGDdtlvEkCnwvf7irBv0XLya/D7oHoWVSE51RifjljHf3
 S3Pd/c+cyOAaoJYA/phu7haEFqbRp/VwSW+htktic6PLdmFadlGkCOAr9y+wPtI2sXID
 BnWdtuMAF6lWl98sCF7778Ts66QiV+DRWsTS0/Hx3OeaZwCl7XpJ/7emeRn3H4G3411S
 29DVYLYJLQDMbmCaQlwFx5NRCo+4K3skOJPy1jlyIXIXb62/b7OVFjOOsW3ytDjoL07K
 5zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571767; x=1710176567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GE6mDiJbQ2UU8njAjf9/yNHee9b/ZjET9OK0aQM71gY=;
 b=dl8DDmCyiPru2fucRBefaWiXL/pHrsOsHpDm3umMizvMmBbUoS6Nmd+FBhIxii5emr
 dSELpVmh5pX2i2yAiX6+4+XrrxvWRdZasJULfyVG/XqTW6bEueT5YMctr87azzBhJ3p7
 UTvdT4o5c8N5YlENA7i5EPDGZYE7zQuj1kFwLEVlD8lOFMbDFFrK1xd+vE7wCwrl8ZtY
 tD2C1nKwULlF47n5+RLFMof2sy6F03IWwvbX1j+RzNYTSmhEzAPwLLkhyAFODA15i5CF
 aVn0Ye1yaeHH3kuB5qwI2VlFxYg8yrsVkOtxulhHbB+deo3h6237DRcV/UFqf0dcsSe0
 WD/Q==
X-Gm-Message-State: AOJu0YwnFGKRGgjIQYrCT5GL5xgg9y1m+7KnWMYLdJS/+0I66zaQ5uRw
 bz5xSxOndG8htUEhD9Pl6gcsTmHryBaIDyrnRn1wMa8Ppzk6hB5naD/3KLgaai8=
X-Received: by 2002:a05:6a20:6aa1:b0:1a0:e19c:c0dc with SMTP id
 bi33-20020a056a206aa100b001a0e19cc0dcmr9920907pzb.62.1709571767014; 
 Mon, 04 Mar 2024 09:02:47 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 t15-20020a63460f000000b005dccf9e3b74sm7575534pga.92.2024.03.04.09.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 09:02:46 -0800 (PST)
Message-ID: <eb882d18-cbfe-4d46-8bef-2798a707a486@linaro.org>
Date: Mon, 4 Mar 2024 07:02:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] target/arm: use FIELD macro for CNTHCTL bit
 definitions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-4-peter.maydell@linaro.org>
 <f0dd2308-6a94-46b5-821f-12ab907d29ea@linaro.org>
 <CAFEAcA_JFq9hFoCJDD9BNx-SOumZBtLs64B=yj-jWRrg_WMzfA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_JFq9hFoCJDD9BNx-SOumZBtLs64B=yj-jWRrg_WMzfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 7MqjxEZHwfo+

On 3/4/24 03:21, Peter Maydell wrote:
> On Fri, 1 Mar 2024 at 21:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/1/24 08:32, Peter Maydell wrote:
>>> We prefer the FIELD macro over ad-hoc #defines for register bits;
>>> switch CNTHCTL to that style before we add any more bits.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    target/arm/internals.h | 19 +++++++++++++++++--
>>>    target/arm/helper.c    |  9 ++++-----
>>>    2 files changed, 21 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>>> index c93acb270cc..6553e414934 100644
>>> --- a/target/arm/internals.h
>>> +++ b/target/arm/internals.h
>>> @@ -224,8 +224,23 @@ FIELD(VTCR, SL2, 33, 1)
>>>    #define HSTR_TTEE (1 << 16)
>>>    #define HSTR_TJDBX (1 << 17)
>>>
>>> -#define CNTHCTL_CNTVMASK      (1 << 18)
>>> -#define CNTHCTL_CNTPMASK      (1 << 19)
>>> +FIELD(CNTHCTL, EL0PCTEN, 0, 1)
>>> +FIELD(CNTHCTL, EL0VCTEN, 1, 1)
>>> +FIELD(CNTHCTL, EVNTEN, 2, 1)
>>> +FIELD(CNTHCTL, EVNTDIR, 3, 1)
>> ...
>>> +FIELD(CNTHCTL, EL0VTEN, 8, 1)
>>> +FIELD(CNTHCTL, EL0PTEN, 9, 1)
>>> +FIELD(CNTHCTL, EL1PCTEN, 10, 1)
>>> +FIELD(CNTHCTL, EL1PTEN, 11, 1)
>>
>> These bits change definition based on HCR_E2H, which I remembered when I got to patch 5,
>> which adds code nearby the existing tests of these bits.
>>
>> It might be confusing to only provide the E2H versions, without some extra suffix?
> 
> Yeah, bits 8..11 are RES0 if E2H is 0; bits 3 and 2 are the same;
> bits 0 and 1 change (to EL1PCTEN and EL1PCEN, so bit 0 when E2H is 0
> has the same name as bit 10 when E2H is 1).
> 
> I don't see the need to suffix the bits that are only relevant in
> one context and RES0 in the other, only the ones where the bit has
> the same name but a different location, or where the same bit
> number has two names. So:
> 
> +/*
> + * Depending on the value of HCR_EL2.E2H, bits 0 and 1
> + * have different bit definitions, and EL1PCTEN might be
> + * bit 0 or bit 10. We use _E2H1 and _E2H0 suffixes to
> + * disambiguate if necessary.
> + */
> +FIELD(CNTHCTL, EL0PCTEN_E2H1, 0, 1)
> +FIELD(CNTHCTL, EL0VCTEN_E2H1, 1, 1)
> +FIELD(CNTHCTL, EL1PCTEN_E2H0, 0, 1)
> +FIELD(CNTHCTL, EL1PCEN_E2H0, 1, 1)
> +FIELD(CNTHCTL, EVNTEN, 2, 1)
> +FIELD(CNTHCTL, EVNTDIR, 3, 1)
> +FIELD(CNTHCTL, EVNTI, 4, 4)
> +FIELD(CNTHCTL, EL0VTEN, 8, 1)
> +FIELD(CNTHCTL, EL0PTEN, 9, 1)
> +FIELD(CNTHCTL, EL1PCTEN_E2H1, 10, 1)
> +FIELD(CNTHCTL, EL1PTEN, 11, 1)
> +FIELD(CNTHCTL, ECV, 12, 1)
> +FIELD(CNTHCTL, EL1TVT, 13, 1)
> +FIELD(CNTHCTL, EL1TVCT, 14, 1)
> +FIELD(CNTHCTL, EL1NVPCT, 15, 1)
> +FIELD(CNTHCTL, EL1NVVCT, 16, 1)
> +FIELD(CNTHCTL, EVNTIS, 17, 1)
> +FIELD(CNTHCTL, CNTVMASK, 18, 1)
> +FIELD(CNTHCTL, CNTPMASK, 19, 1)
> 
> (and updating the uses in following patches as needed) ?

Looks good, thanks.


r~
