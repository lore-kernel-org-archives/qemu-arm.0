Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp208888eja;
        Thu, 22 Feb 2024 04:35:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWxmAmCU4Y/9IQ/IGixtrDTOOUMs3Pgxpx3wcVgRptXWHHj+seFcrnAwHz5saCKO9Nfjne30N8xDsL1X80snsHNlMQYjwDx
X-Google-Smtp-Source: AGHT+IGHLuI+3kkVZbkXMmoJixZGvV2cU7j56wePq7t0FfkUntSSPV/QerVXDmGpSj7gZ1Yzj5BE
X-Received: by 2002:a05:6214:2687:b0:68f:3c39:c63e with SMTP id gm7-20020a056214268700b0068f3c39c63emr19627080qvb.6.1708605318476;
        Thu, 22 Feb 2024 04:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708605318; cv=none;
        d=google.com; s=arc-20160816;
        b=TMJ2LOtMK8F4TeDDF5PYJNOGqaPYQNLdmV3RLUXa8WyMF014bInz4cMqOi1Gj23LY5
         WNqZ/uwoxb2tpTyB9LJjdY99hKIshFPqsCdRICcuVTg2PjuaXuB+mMVaAAA1ryYo105F
         CUkTWt8KOKY+GbnuwRJZuFtV/eEChgsr/40dBbUdT4iJg/JCm8C3PVulndYnO2ky6S7v
         cozSnv9gYoMGG2YDEyt/rkqdsV5HExgD9YRHXL7UdjBwl3IxN81IgrLfiQL3/RaI9aDE
         DSFwyKZ5p/rf7NpYCfkjXyiUC/AQBZTrxM/OwWBETR1Do8FE3karDy/OEjFYTLu53eJ1
         HHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=tZP8jKiTjXvFKjxjWd0ggnisCMNMnfHnhUE17dinC20=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=togy562r6Zmm8vjcseOQVgeopL8ldd4RbGsDdUYi9ibiLpqyKtIScBj1JRoGXBdHx7
         1O/cmMdLdM6XZqVsoQb0K7/6zJ4htAZ+Xz+kS/ZdtOVRVAAstmEUBBKTUIwWWTGDUQoA
         9ZwyqR5rjZzeGNN/lzuBPmvaR5MGMcZ6EfV14S/829lUW2q+bOOglMock2V/NnByqDUN
         mdfgQlLxt3SkScU+VJvOrNvuLwtgF2KVqHkl7LUO/WnYNk/mOWsEPvxF5PrCREHJDLMn
         W0rIG/iZEJaatSSlLi/sbpmwxCBJipIYsTHrrz7XpCsz7jwlNebJI0tPZdtPwsuFmdwL
         gdvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn8-20020ad45d68000000b0068cd5455df1si12784947qvb.136.2024.02.22.04.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd8I0-0002lQ-Aj; Thu, 22 Feb 2024 07:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rd8Hy-0002l6-VE; Thu, 22 Feb 2024 07:34:58 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rd8Hw-0001cj-17; Thu, 22 Feb 2024 07:34:58 -0500
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TgXbW2rz3z1X2pv;
 Thu, 22 Feb 2024 20:32:39 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 87B8A1A016B;
 Thu, 22 Feb 2024 20:34:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 20:34:48 +0800
Message-ID: <1fada83b-a862-c705-5997-1d8d269d8de2@huawei.com>
Date: Thu, 22 Feb 2024 20:34:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v2 08/22] target/arm: Handle IS/FS in ISR_EL1 for NMI
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-9-ruanjinjie@huawei.com>
 <edbe3faa-d83e-4410-811a-d15fe244817a@linaro.org>
In-Reply-To: <edbe3faa-d83e-4410-811a-d15fe244817a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.172,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kAml2WlNY4uI



On 2024/2/22 5:36, Richard Henderson wrote:
> On 2/21/24 03:08, Jinjie Ruan via wrote:
>> Add IS and FS bit in ISR_EL1 and handle the read according to whether the
>> NMI is IRQ or FIQ.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   target/arm/cpu.h    | 2 ++
>>   target/arm/helper.c | 9 +++++++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 051e589e19..e2d07e3312 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1476,6 +1476,8 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
>>   #define CPSR_N (1U << 31)
>>   #define CPSR_NZCV (CPSR_N | CPSR_Z | CPSR_C | CPSR_V)
>>   #define CPSR_AIF (CPSR_A | CPSR_I | CPSR_F)
>> +#define ISR_FS (1U << 9)
>> +#define ISR_IS (1U << 10)
>>     #define CPSR_IT (CPSR_IT_0_1 | CPSR_IT_2_7)
>>   #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT |
>> CPSR_Q \
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 0bd7a87e51..62c8e5d611 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -2022,6 +2022,10 @@ static uint64_t isr_read(CPUARMState *env,
>> const ARMCPRegInfo *ri)
>>           if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
>>               ret |= CPSR_I;
>>           }
>> +
>> +        if ((cs->interrupt_request & CPU_INTERRUPT_NMI) &&
>> env->nmi_is_irq) {
>> +            ret |= ISR_IS;
>> +        }
>>       }
>>         if (hcr_el2 & HCR_FMO) {
>> @@ -2032,6 +2036,11 @@ static uint64_t isr_read(CPUARMState *env,
>> const ARMCPRegInfo *ri)
>>           if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
>>               ret |= CPSR_F;
>>           }
>> +
>> +        if ((cs->interrupt_request & CPU_INTERRUPT_NMI) &&
>> +            (!env->nmi_is_irq)) {
>> +            ret |= ISR_FS;
>> +        }
>>       }
> 
> The external CPU_INTERRUPT_NMI will never signal FIQ.
> 
> With CPU_INTERRUPT_NMI, both CPSR_I and ISR_IS must be set.

Right! The IRQ and NMI signal are both set when it is a NMI.
> 
> Missing is the handling of HCRX_EL2.{VFNMI,VINMI} to signal vFIQ and
> vIRQ with superpriority.  Unless I missed it, I don't see HCRX_EL2
> adjusted for FEAT_NMI at all.

Sorry! The vNMI has not yet been implemented.

The HCRX_EL2.TALLINT has yet been handled.

> 
> 
> r~
> 
