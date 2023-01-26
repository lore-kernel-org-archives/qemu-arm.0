Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp154784ejc;
        Wed, 25 Jan 2023 20:11:50 -0800 (PST)
X-Received: by 2002:aa7:8006:0:b0:58b:cacd:2d12 with SMTP id j6-20020aa78006000000b0058bcacd2d12mr31689699pfi.28.1674706310599;
        Wed, 25 Jan 2023 20:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674706310; cv=none;
        d=google.com; s=arc-20160816;
        b=eOx1JcvNjQEXgRTOyQmoMvvtmQDSamvLciOoUxNlbfw7xJT/zpxgoYMLZmCoHGn134
         Y2eM8maJeKPEcEKhCH2awmYIq2wpjHpeUVvuWZfT3LUFR80B2bpz0C3vcNqu1EcptK6S
         4tCqxw5NuF6Pfdpln5YnwqJ1zTUdGFJ0n6R4j0tUxmfIjrdInLvsbKxR7HKM6T11ROW/
         wfIcp7wRnaVehXdy5TSB+Db0cxxVrfupo5/0mVtLVhSyxt764oWUVQQj6PEuXEqH/SHo
         DAN1ZFSvE1/We6zDMwdgEcJNUyV3KhXTzxyO9ykGoiY5Kaq6xd/XkULBPGk9MWHTpUXK
         bcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FLEBIE/+V25SWwFPA8O3frxf4+wUmuN3EsyPZs82ZZY=;
        b=pxSUDq2YKWthIWA8o2wbdtt+vbshre46hLGVV3ixii/dHRh31BqgO+HVVIDLhmUiNu
         ZBpkHucXGTIqKJS8CwXaq8zxKpwDup05zYVx+QN4ydRJEz/GWzfZREsroUwbYcxUX8F8
         uSAr8vgfzzTMf+SDWuJOVnEjPv0ab123csaIVJm36lVF5azatug2/CIktHyR9R7p8TKr
         dbJdfXWa7Ye+3+jn2HjEHmFUNNA0LrS1ia7k05/CnydTp6hXpRHj40Mn69fau3EEILey
         jIwbealMCf6VmrRm/0Cxj9JrB3oS5xNNfwrr8TXGTfnygA4YNdtwXIOZJc+6SGcLWbJD
         EHYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksUrTphA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w64-20020a623043000000b00582d770ffe4sor16707pfw.3.2023.01.25.20.11.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jan 2023 20:11:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksUrTphA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLEBIE/+V25SWwFPA8O3frxf4+wUmuN3EsyPZs82ZZY=;
        b=ksUrTphAwKvz89gu/OONeu26n7Jyd+SBIr5YkpBDK4teyEx2o/ef1QnFK/6cgHzIZY
         6gvrpfZ/uHNFGRi7gI3KR/fh00ZqLvRyEAcV8kRZfLMgbXBQowuwmwI7shhY3dqBfI1X
         xT6rhPLJ/pFTZlF0qqiCDFSiJzX9Xp1G3nyo1lyYk5l4H6bs74q0Z2aL8OjyGz6xdY0S
         L4vVPFmTbozHKfMh0hiWA+jx5eTH8AHFO2M6nij/z0sr6mrSfD4+QxWR2g71J2ubsIYf
         4/lVlUzBDVCMPguuSeCJmgiJ3+Wc0OHZCmp87pISur0qkJk5oD0SIlgLVrpslWiLuFFA
         QpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLEBIE/+V25SWwFPA8O3frxf4+wUmuN3EsyPZs82ZZY=;
        b=6FFmFnGtt/jaiP7OomkfXNWg1yjU9Tl0UWvejsrPyCWMAZyGBFN9Qiof4TodjuEwAN
         NbhdjxfFOKDKZN5fjFaNhJXgg3GyfLomDbThnipSKppI7yS7w3v33Z4YfQpFdBYeOh7c
         xSd1YO6CoecDJANJ1ttZUVIzsaxvzFvaUZfVt7BegbVjJBHcKFRXWS44jmm0UuAFqvXA
         Ko6EO6cogDr6+CCMpevtfKGk4Bt3vXnZxJbLC9fgBDZtQPAQZ6OpkQCDs5TFb1cnFNNI
         C5872z9srQpqwfLGEbYP3rxI6+aXQExC/rajbLWX6dsykAWEftNPAfuZWCShNlwPr2rp
         +AfQ==
X-Gm-Message-State: AO0yUKWA17KCd9CQClSkJ+cOXTcgwCvdFTtxqJsovEhn118Os6K1bLFG
	9QIuu1ftSe8HTckwJcBnnj7oUqfgfxvI6V27Vpw=
X-Google-Smtp-Source: AK7set8lvhQNTfjr9YPs4UWna+Y7gduxPLxAmBiYx+btnNAfc59ioUkXqsLfujtvsuJ1pvZF2zl31g==
X-Received: by 2002:aa7:93c6:0:b0:592:4502:fb0 with SMTP id y6-20020aa793c6000000b0059245020fb0mr104461pff.0.1674706310097;
        Wed, 25 Jan 2023 20:11:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id 15-20020a62190f000000b0058dc1d54db1sm4378899pfz.206.2023.01.25.20.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 20:11:49 -0800 (PST)
Message-ID: <74fe37d9-331c-7e00-e642-365f1a04ff80@linaro.org>
Date: Wed, 25 Jan 2023 18:11:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 06/36] tcg: Introduce tcg_target_call_oarg_reg
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-7-richard.henderson@linaro.org>
 <877cxaqpxi.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <877cxaqpxi.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WxSVIedd47j5

On 1/25/23 11:09, Alex Bennée wrote:
>> -static const int tcg_target_call_oarg_regs[2] = {
>> -    TCG_REG_R0, TCG_REG_R1
>> -};
>> +
>> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
>> +{
>> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
>> +    tcg_debug_assert(slot >= 0 && slot <= 3);
>> +    return TCG_REG_R0 + slot;
>> +}
> 
> So this is now returning allocations of TCG_REG_R0 to TCG_REG_R3?

Yes, should have mentioned in the patch description.  Done.


> Do we
> have to take care to get things right if slot is ever bigger w.r.t.
> tcg_target_reg_alloc_order?

No, reg_alloc_order is optimization for call-saved vs call-clobbered vs call arguments. 
It should not affect correctness at all.  Nor will it ever affect call return -- those 
registers die immediately before the call, and become live with these values immediately 
after the call.


r~
