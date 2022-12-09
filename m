Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1324206ejb;
        Fri, 9 Dec 2022 08:06:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4TDgg7kVrWX57fMAXD+vB6MLxHB9zzxWepkHSV73Su/mKcx4J7h/7cG0iR0auL2ao0rcWF
X-Received: by 2002:a05:622a:590c:b0:3a6:91f2:62bf with SMTP id ga12-20020a05622a590c00b003a691f262bfmr8801695qtb.37.1670601996550;
        Fri, 09 Dec 2022 08:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670601996; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8tVVIh8fyhH5B84qUiO9vb2vusjYr+Zeo90T4YQVrUsKxLP2cn7MI7ceJk9dJsnX0
         aqQuiDHRRbGoRiHNwhcHjgChxWj1X7tIpfA3206TZfYif7+rAJ9lcddJwEcfVUy5Ee4S
         knOQXbNj3iH/dgqOgdoPLRgr+TA7S7X92fKzSSXKT8q7scU7LOh4kj99XkmDpcjXKzKA
         c+bRNQHKj/y+FVxgMn7ZuTKq2pgwXg40CclZnSHtPedwTIz5t9zo2bW9kx7PhEgB6Iqr
         kbZdDb9s5PXY9NBxQaK03g4GYVZzpPBUXXeh04n0A/v0iaik+toAn/edclwL+7lrz6fX
         nq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=64DlQqu1aJlALuYGEdu8KZlq4Z8PzM+oiLhCX60kh7I=;
        b=NJtwfcllTF+CdTo12Sulbi7dldow5WuIV7y08UfejRQGPE8L9hPAQHOmVtx7kPawZ1
         ZsaWp4o8engBEtH4mSPh8tEpwnF9h9FX9B0kL2dPP4sFBODXmytywmDjeOk23TaL520l
         HB41AdiTOC4ygqp/8soPICC0CARsIHw2rfUOD/x3B9IQ/vyA2tuRGXFpXHY5qIiRdSHw
         2I0bXndSFQmbnjr51qb7ZiVxjjdbbyR/SpEOjqpPC0Vchl0G1g/TvDudDbmG36WNndjw
         4x8XzqRU4Z7AlcC4v8y7kYiLow/lIW4cC2cyAtgmSpVE+PLdKAbt8VEEKresgPRYSf4k
         UjhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cR39Yqr3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020ac85402000000b0039cd5aed4afsi955006qtq.217.2022.12.09.08.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Dec 2022 08:06:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cR39Yqr3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p3fsx-0004z7-T5; Fri, 09 Dec 2022 11:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fsu-0004yP-NK
 for qemu-arm@nongnu.org; Fri, 09 Dec 2022 11:06:00 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fss-0000vj-FV
 for qemu-arm@nongnu.org; Fri, 09 Dec 2022 11:06:00 -0500
Received: by mail-wr1-x42a.google.com with SMTP id y16so5672433wrm.2
 for <qemu-arm@nongnu.org>; Fri, 09 Dec 2022 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=64DlQqu1aJlALuYGEdu8KZlq4Z8PzM+oiLhCX60kh7I=;
 b=cR39Yqr3QWzRnRf9He6wn5cAsrN6vODhlCuy7bUDfp46eHVYHvPhqASK87UIUkcgIJ
 cPKzmtR6kOA+Y6UGiZ+gr/zq7oqbZUg+UClc4ETX2VVF9LBqaPEwQot8LWAKR0bq1STB
 xhoY+Znln3LFv4XqxW5KkntovQHmyzVM8Kiyd+W8JCpVN+u2PhlGSQUnz5YVl4+3ijn+
 e+azPwxQOjUBEEp1yo4w+xyOWmEw6mMyK1yZHsnzY9yUgJWD4FjxaMnvyTDu5JeFa+s3
 wJDv5UbLn00IrjS1qsuTubE42V+8JDt1mXVi8vXHZ1G7c9lIOkQiCN6dYrB7roq5pNiI
 lQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=64DlQqu1aJlALuYGEdu8KZlq4Z8PzM+oiLhCX60kh7I=;
 b=d340Idzfv92DlCS4Nb2NwUstl8O0y7QT88dudzZvPukNLm2D0dayRmDG3jr2kdjA/Q
 fULxjLUEn9Z5zRla6OZtY5kaacZ5n5zy3l3zH3RZD47L2I3KOm3WDKyD8Nlf/N9EJPbT
 0Ex27EobTl+ccK/M/YH3FY6xjZ5fnpI7wMJ5dgZ0E94kGl69/jHm1OSLzgaoSIi3qbXo
 qr5PU/M0uQT/gWXP3KE9mQNQNQqSHnTWUGV/agOMxcn+3HIc/t7s+/vJfNHG0gGUFGKX
 clv19S9LyUosoA8fZxl7uUKuyLl9NOo83PP7AnRdD6zVSJPuC0ZUg6z1GXKOPzAIQI9B
 hFCw==
X-Gm-Message-State: ANoB5pmsbNMCqjUDxKlCm3ooUs1Z4u+s4hLMzMwmQrEffgjR35UYomjI
 p49TOAzLIDun8hhyGVmFcWKyHg==
X-Received: by 2002:adf:ec4d:0:b0:242:52b6:9054 with SMTP id
 w13-20020adfec4d000000b0024252b69054mr4355340wrn.58.1670601956726; 
 Fri, 09 Dec 2022 08:05:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o19-20020a5d58d3000000b002421a8f4fa6sm1648872wrf.92.2022.12.09.08.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:05:56 -0800 (PST)
Message-ID: <a11c515a-49a0-c4a5-a0a5-e559170cf7f6@linaro.org>
Date: Fri, 9 Dec 2022 17:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0] target/arm: Keep "internals.h" internal to
 target/arm/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20221209111736.59796-1-philmd@linaro.org>
 <5f838c11-765b-72a3-0d40-5dd46994fd8e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5f838c11-765b-72a3-0d40-5dd46994fd8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lhC8/F99aABn

On 9/12/22 16:19, Richard Henderson wrote:
> On 12/9/22 05:17, Philippe Mathieu-Daudé wrote:
>> +++ b/target/arm/machine.c
>> @@ -6,6 +6,45 @@
>>   #include "internals.h"
>>   #include "migration/cpu.h"
>> +/* This mapping is common between ID_AA64MMFR0.PARANGE and 
>> TCR_ELx.{I}PS. */
>> +static const uint8_t pamax_map[] = {
>> +    [0] = 32,
>> +    [1] = 36,
>> +    [2] = 40,
>> +    [3] = 42,
>> +    [4] = 44,
>> +    [5] = 48,
>> +    [6] = 52,
>> +};
> ...
>> +++ b/target/arm/ptw.c
>> @@ -42,45 +42,6 @@ static bool get_phys_addr_with_struct(CPUARMState 
>> *env, S1Translate *ptw,
>>                                         ARMMMUFaultInfo *fi)
>>       __attribute__((nonnull));
>> -/* This mapping is common between ID_AA64MMFR0.PARANGE and 
>> TCR_ELx.{I}PS. */
>> -static const uint8_t pamax_map[] = {
>> -    [0] = 32,
>> -    [1] = 36,
>> -    [2] = 40,
>> -    [3] = 42,
>> -    [4] = 44,
>> -    [5] = 48,
>> -    [6] = 52,
>> -};
> 
> How does this even compile with the remaining usage of pamax_map in 
> get_phys_addr_lpae?

It does not :( I rebased 62 patches then tried to extract/post unrelated
patches like this one, but didn't build at each step and failed to
realize the broken rebase, *sigh*. Sorry.
