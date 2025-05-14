Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1333304njb;
        Wed, 14 May 2025 10:00:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXa2l12tAawl188AlSzfYy+OtDCIJMHR+I47/wsAFvV7oGoqdv44AmpyA51qHN1uTeHtz9YJo4IvFah1w==@linaro.org
X-Google-Smtp-Source: AGHT+IFCR7+ysxq/XX57hToxvm4VjT+slSTINtTeCJ2nBmz4TCHo4zGbvlf+7uTGjXPI5t2ur5RF
X-Received: by 2002:a05:6214:2b08:b0:6e8:8e10:424d with SMTP id 6a1803df08f44-6f896ec2fa8mr57889196d6.41.1747242022854;
        Wed, 14 May 2025 10:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242022; cv=none;
        d=google.com; s=arc-20240605;
        b=XKfXWxp/iCvbE4QF85w4I/U7Yc9ekAr08xYKU/VTeouBVxw8rK1zjD+avn/Az7zbEN
         61qK2C0nntZaBUx9A4f0VaXIzjXmHfiwN3HQgW6kdADmC4x5gYgg26yasAkRWSs05Zkm
         oXYY2mFFth+uK1PaUZkwDKP3Zq13QoKHi+snf3/Gb9PXAj34A/yaBLqUzLe8l9kevdiM
         uMJHdtcSw6G4nVRUMahiM2BrUdw4CdZFuzrNdJCgcXjSPJg1yOE4rlSNcXI2hlx9WHf7
         ayvsgbTQ8GPsfvJx/IGGEimOTR/1zoI1GIpZVvRaCw9dD03BanaxQ9hcEXVhvHr+R52c
         op6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=g3S4QE6pPmLrLEvlLvbVcXELDi040PZqynpaUxvCe/o=;
        fh=HwaYrsfZ8LcCazn84E0DeOJgxipYsKCL5K7RLF73qIQ=;
        b=S9kB6k8j//a3QWcaqhoezE6W/lBGO01GoaFlTc65zZz57R4iuvc5U+l3JxZuVWicXC
         ciGKImA06mmUfTrAmGiCuco19IFAzt8oZys6earBFl3lal4QfatKnhwicepdpsJBi724
         GxQ6qAkoeJhsnA5w1jZm0edmvaERSTM2DgPpGd8tEubv2+g0vf/wOrmM0uuplTQEnrD8
         spoPGgdjIMSJ4FG19lMApFH0xkxiCaOXJV37Tb6MomRjNq6DYu38qTt0VYN3EO/jja/w
         FIMfdFI+qkXPSWa5sSB0AglA4GGacdS1XrqlbdGBkuNRRssTqWmylCRyXaOlWfT5Q4mu
         7l6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S8CpU/LE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a64706si136721796d6.493.2025.05.14.10.00.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:00:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S8CpU/LE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFSo-0000I2-IE; Wed, 14 May 2025 13:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFFSX-0007vM-JZ
 for qemu-arm@nongnu.org; Wed, 14 May 2025 12:59:58 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uFFSV-0006eW-SE
 for qemu-arm@nongnu.org; Wed, 14 May 2025 12:59:57 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b268e4bfd0dso4834699a12.2
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747241994; x=1747846794; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g3S4QE6pPmLrLEvlLvbVcXELDi040PZqynpaUxvCe/o=;
 b=S8CpU/LEgwDu3CmD6OZlOImrDFWuX5Mr2XnV1TAmk79rP9ow9Q0nhmBBOBbvnJshyg
 9JkuXHcN4O8xaGh3FA407W8qSZDMmBiYjXaW6TpsNCE47giPZbKNspe4LYdFEQVO1rrA
 CUgO/c7M4AlAMgWCK1B1nfnmzIZRobrvk9sQozd/g/bMeIne8ciTnQ6itvxFHJPengng
 //Qpud+DzOfwLfF5XEvKqxTsZJ4j49d/2GQRKB3cXC6DnPTL69yo/gt6RHXjIV0ND8at
 dsUUe4g13OrYC0m30gNW4feqeC1kl2NMdlSNiJgX4hgFfl6fslDdTyOcYJY5CDSt7IMK
 w2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241994; x=1747846794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g3S4QE6pPmLrLEvlLvbVcXELDi040PZqynpaUxvCe/o=;
 b=Bt6/sLgnXX3fB9rjFSnHILVB0UuT8g0JH6YvL0ZAG62Ud06NyUPHOrQWFFJ2qG290w
 /q4UZlx5OVvc8SAAzyH/ehu68Y//mPrNzV0F1B9A4/SGbcIpIAztFz+qLfHHLNOW85gr
 PTYs8KH+Sm6ImRJ3WKvYjyJqVvHQIg61zr8WZRjFyFVlHwRXt4IH8arFEsT2xFuFQl0z
 oSouSnEkJKc8L38iu9D9/veyvYkCoHi4t7AO3dL1+OO2IV2/pLIvpIW2atJOd6RjB1YG
 ew6lDX3vi97qpPLvnx/QTR0v9zj1Tpza/Q4n8Q1MmwvaW76rFTIJNTO2vhtTbxZAlWGk
 j7Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDvR6rjxAQgNqdPlH6MovkJNmRIjoi8+yezq29FVNBGquN7isYvjAboiWEkGQaG04GcQ/zhfuDKg==@nongnu.org
X-Gm-Message-State: AOJu0Yw99dUSXZH/1RFXA6Gx0YVC2ql1oN9LehYSHD98MrzTsO86G1dR
 Fi7OxiBPFOn81CYdrr7BvZ5h1uUIhvPKD1FFHkyNGYMxXZPlvn8PNv1elZ4qs491wFU6/f7HArY
 PIZ0=
X-Gm-Gg: ASbGncuTgtrj/+Z+HYivQtODR491tc49TJMUjrW6aowSw9uP5RVkY9tqJVkGgGvYEh6
 cDcy9vb7VUygKPAD6ana/Bjxsgcx662QjmfSv2QFzcyfzIXSiyGEMBjAhtXIrOR5gH1t/xzvczo
 mQ+S8aW/1ABtRW+lUvI2hSO0R4kmfmid5ubdoAm0FZ+zBtjmNjsbd4hBz+d3Ij5EC3lv0g5yy46
 kqnarEZjStFJyPsPuB+Y7QXYtkuyqFxqTNmHPPLnMWgc3TO9bCpsct1I5xGC9HSWckE4si8b/5C
 mMgYrfNJ53R2+FxXpt1pkLm2AnzqCW4i4d6MOVYyHXKKeRxtkq6PrCbOU836SYEt
X-Received: by 2002:a17:90a:e704:b0:2ff:58e1:2bb1 with SMTP id
 98e67ed59e1d1-30e2e62fd2bmr5984474a91.32.1747241994192; 
 Wed, 14 May 2025 09:59:54 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e334254f5sm1822292a91.13.2025.05.14.09.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 09:59:53 -0700 (PDT)
Message-ID: <59b1ccbe-9ddb-43f0-98c4-8000a08d27b0@linaro.org>
Date: Wed, 14 May 2025 09:59:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] target/arm: Add arm_cpu_has_feature() helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-17-philmd@linaro.org>
 <b6c81748-091b-4d61-8d34-beaa0442aab3@linaro.org>
 <f7bcd8b2-2c0c-4907-8a0e-af172c235d56@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f7bcd8b2-2c0c-4907-8a0e-af172c235d56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x536.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5RoeCciSH5kV

On 5/14/25 9:53 AM, Philippe Mathieu-Daudé wrote:
> On 14/5/25 10:24, Richard Henderson wrote:
>> On 5/13/25 18:39, Philippe Mathieu-Daudé wrote:
>>> arm_cpu_has_feature() is equivalent of arm_feature(), however
>>> while the latter uses CPUARMState so is target-specific, the
>>> former doesn't and can be called by target-agnostic code in hw/.
>>
>> CPUARMState is no more target-specific than ARMCPU.
> 
> ARMCPU is forward-declared as opaque pointer in target/arm/cpu-qom.h,
> so we can expose prototypes using it to non-ARM units.
> CPUARMState is only declared in "cpu.h", itself only accessible by
> ARM-related units.
> 

Maybe we can simply postpone introduction of arm_cpu_has_feature() when 
it will be really needed.

Patches 17 and 18 are not strictly needed, as cpu.h (which resolves to 
target/arm/cpu.h implicitely) is perfectly accessible to code in hw/arm 
without any problem.

I asked in the past if there was a real need for this function, but 
didn't have a clear answer on where it's mandatory. In this series, it's 
an optional change.

That said, I don't want block any work arguing over this, so if you feel 
it's better to have it, so be it, and let's pull this.

>>
>> Did you really mean to use CPUState?
>> Or is it merely that arm_cpu_has_feature is out-of-line?
>>
>>
>> r~
>>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/cpu_has_feature.h | 2 ++
>>>    target/arm/cpu.c             | 7 +++++++
>>>    2 files changed, 9 insertions(+)
>>>
>>> diff --git a/target/arm/cpu_has_feature.h b/target/arm/cpu_has_feature.h
>>> index 2adfccd9208..352f9d75bed 100644
>>> --- a/target/arm/cpu_has_feature.h
>>> +++ b/target/arm/cpu_has_feature.h
>>> @@ -62,4 +62,6 @@ typedef enum arm_features {
>>>        ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
>>>    } ArmCpuFeature;
>>> +bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature);
>>> +
>>>    #endif
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 8c9d161f2ef..759636a3b0e 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -54,6 +54,13 @@
>>>    #include "target/arm/gtimer.h"
>>>    #include "target/arm/multiprocessing.h"
>>> +bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature)
>>> +{
>>> +    CPUARMState *env = &cpu->env;
>>> +
>>> +    return arm_feature(env, feature);
>>> +}
>>> +
>>>    static void arm_cpu_set_pc(CPUState *cs, vaddr value)
>>>    {
>>>        ARMCPU *cpu = ARM_CPU(cs);
>>
> 

