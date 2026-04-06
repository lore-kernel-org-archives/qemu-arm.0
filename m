Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C245FB5173
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 22:27:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9sPz-0005rs-KY; Mon, 06 Apr 2026 18:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9sPu-0005rF-7q
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:27:34 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9sPs-0008Nk-Nj
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 18:27:33 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b2429f98d0so28148765ad.2
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 15:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775514451; x=1776119251; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LK898eouhheJ74TBsxN6u4H37b76RghgnGRsrp+BiMA=;
 b=v3DOdfuGIYxWfG63C2UX+talEOPJrVmEZ3yf6NOfiGesKGAMn2NRtgj3o/olOXCil6
 B68tpZye4qZJ3ihsV2RhVYfqMbAnCxentHMbPeN/GowSTLpPQbOtlDZxRRH81CBfa/dg
 uL6oke5Wdxl13IMTY6SlbifYifBfdqHNdc4fScUlBfRlnxm8d7uzK/b6zgNuzSe04jVY
 nB6FxGGfvZs2aftAmFBgqKdlR6D3Sw4YuXstoW8YKX6AYTGsY1nO/Q6dlkesw/b+LpPd
 HP+7r3qV2Y6kff3zUGMyO6q6doMLRqn+55I6V5J/D6oWyVvdTs5DXtlQRmh1xo3DScK1
 jZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775514451; x=1776119251;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LK898eouhheJ74TBsxN6u4H37b76RghgnGRsrp+BiMA=;
 b=f2tD5UEHUq9w74Ve7zdaTfE6XdqJqUVc4KUpRiJ7C8aGZ2/YySObXVplU4QWFoXtPs
 2DtXlywe4DrL5cuRLW2Q9EiXs5DhpBGnHf5OhboC+Kd4BqwLkydv2u3eh65z8ooPhPOA
 c60aUTpjtnyPUfqWPtLMO6B6raz+zkcgyH3fiJG++99ZSFHXeahWX4wrT20l7QbQQqqR
 FQ0YJ5gv44Kroyb0Ogt24BKkxQ1Dd2jjiraXfSsuxifFJhDRdc4gZa+RpL+Um90GzD8z
 vDPSWnmPVYKcOlXoDhKvay6WVebdRVc6aJSTUXYZPASLMJXGEE16hNpTytfaGfdktoH7
 oaYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSXoQczZwnVvDwbsBPRVMwoB9H6GrFPFzEa+LvPmKPvaK8845uvNE1fkFJB/Ju9pBJ4TTBaj0Acw==@nongnu.org
X-Gm-Message-State: AOJu0Yzc5mKLtZcaf3/OuYCrL69PS6B1t2I+WsDoq6lT6jVYu0zguOqL
 Mz/hxWYUY3Tn+qQebtU3x1S/rz8CdCq0k8xptI04fCI19n349Ino8oOhXBpAGxg5vH4=
X-Gm-Gg: AeBDiet27kRiXurQsPu4By7HMIGuKALm6JdcNDspIL77cWxyDcLewM8JYgiSRcyyswz
 mOxA1eqITkEUNkqUU4woBrz5SlIUNWzGVM6Bt/rjePTeJGs9EXm+QCpOEw0tbpGZP+/UcSK0HGu
 demsfgJg2jQAH5oKvgmxAprYjvsNWP9HaQGXe8vSPsBvCiEV17k/BB2WIGY6/XX0AlXGYahw5eH
 MjltSbt+UmEfWElKJa1XEgQyRWLjQu+Lpf1/OXH+SSQyh97yIQFuREusbV231LeKai1lYcOOAKx
 TEwBtG2mR4uQXvOvmsr6pqPkZtsPaYtuq2Ly4ZI0VH3u7dPnHnwCcT8HrzE4ZYYdOt+XaI1dsFb
 iT3ANk62XH1/4yMapaECofrH7/DpVGzgz4pMbLdjpk0ggzFqtvimFwmx3AcoxABP/Y1aTZoz7Ye
 2eEUPzy9x/a6oJjOkQNfelf3n7oY2EOljADbPDdK4NPMKzPza96kmPScyD3OexhLE4d18bvr3/6
 ybquTxx
X-Received: by 2002:a17:903:4b43:b0:2b0:775f:febf with SMTP id
 d9443c01a7336-2b2817b89e0mr190273865ad.40.1775514451219; 
 Mon, 06 Apr 2026 15:27:31 -0700 (PDT)
Received: from [192.168.1.168] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2ae05991bsm3962985ad.70.2026.04.06.15.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 15:27:30 -0700 (PDT)
Message-ID: <626fdf02-7114-47ad-997a-a7c64a83f9de@linaro.org>
Date: Mon, 6 Apr 2026 15:27:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/20] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-18-pierrick.bouvier@linaro.org>
 <c73bee03-82f8-4529-9db1-7857a049f59d@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <c73bee03-82f8-4529-9db1-7857a049f59d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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

On 4/6/26 3:24 PM, Richard Henderson wrote:
> On 4/7/26 04:26, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/tcg/translate.c | 11 +++++++++--
>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
>> index 7fcf0656630..68f050746d4 100644
>> --- a/target/arm/tcg/translate.c
>> +++ b/target/arm/tcg/translate.c
>> @@ -6279,6 +6279,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>>        }
>>    }
>>    
>> +static MemOp arm_memop_endian_swap(bool sctlr_b)
>> +{
>> +    MemOp t = target_big_endian() ? MO_BE : MO_LE;
>> +    bool do_swap = bswap_code(sctlr_b);
>> +    return t ^ (do_swap * MO_BSWAP);
>> +}
> 
> This and bswap_code can be vastly simplified.
> 
> The complications date to when code access could only be done matching TARGET_BIG_ENDIAN.
> Now, of course, we can directly specify the endianness, so we should.
> 
> This should be as simple as "sctlr_b ? MO_BE : MO_LE".
> 
> I think there should be no need for CONFIG_USER_ONLY tests.  I'm not sure what's still
> different between user and system modes there.  Unfortunately, testing of BE32 might be
> impossible at this point due to armv4be dropping off support lists.
>

I noticed you added a similar comment on v0, but I was not able to 
understand what you were expecting.
Could you please send a snippet of which change you would prefer instead 
of current patch?

> 
> r~


