Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1888126ejf;
        Sun, 25 Feb 2024 23:00:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcwvmkMb1uAZvAwGzw/e5EEyvlh96xrJYcaC9Wx68WXeDgI4tAXArSPwqxan+VAUMTx0mddtH4LO5XnefQLXhmP8ufnx9r
X-Google-Smtp-Source: AGHT+IHWBoPAEnFe0xnrgmN+VOi8az4igfgJ9dlMi6r9ECQPP+toMsCLjG0bge6JKDRMI9dnqj7s
X-Received: by 2002:a05:622a:174d:b0:42e:620b:8d7 with SMTP id l13-20020a05622a174d00b0042e620b08d7mr5407623qtk.14.1708930824540;
        Sun, 25 Feb 2024 23:00:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708930824; cv=none;
        d=google.com; s=arc-20160816;
        b=UQPcshcKgJJse3dJIUIwnczZDWGdYStmajryBWxFimM5iPTHXMD3GomPvfdnPmve+K
         gfsw/btXFQN90jDbSB9dtxIxH+J9FAEjtjwoqgTyvQfnvCuIKNLJwRZl6iBTdmp9Poez
         V/zKXQeCtM+lm06Yd94uKbBZO4hCOy4h1CHIi0ZAHtcwCs5/4TzyWsQzwWFMVHRXoKtA
         tdy9oP68vP7jgZLhjpY9u1AqpemqLT0puVn3FqztyB7yi2l7HZPVH0+hyQUgHcELd87O
         T4I0papfijYwEU/hVf36sAAIrbQxc3JcdqidaJzYvyI7ok7ag2xCBAuOaM7FHcXkwUDt
         1sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=hEOLHaSIU/YRkymMcKyRs246xVvq4cSeQh+QtuTicKA=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=jXPaXhz223PNaHhNxf5HVo2ofZ+L9mSVSA49FYeQvda9byo9Drx+uzK/Z9BX1y6NLD
         oOhGnZMDB/d9tH6k6yHvSZzDFqcvgrpONvoob/IBUiibTZ/dnw0X2KPqT+fbxtun9Ud3
         wDL3mGlnylKEWjcytNPv9PdFnKiO2tpIe5MV1mOlQuH6xIKuLat2iHEx3tK2MfmdI1aE
         CJapUcWrZzHTJ2FHSA4mxwAnXvLv4tz0yrRcCKwezBLPPUQaDEmeWRKK8RiHQJrPmRad
         gIrZdXi+1MjSm12qq9Wsnaiy5gEanZv0wOP46Lynx0UIs5al8ww8qbbAHYIHAoKJ522g
         2oqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020ac84a12000000b0042e6fa4c9a9si4338763qtq.406.2024.02.25.23.00.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 23:00:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reUyH-0008VK-31; Mon, 26 Feb 2024 02:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1reUyF-0008V4-NR; Mon, 26 Feb 2024 02:00:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1reUyA-0002Ta-RT; Mon, 26 Feb 2024 02:00:14 -0500
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Tjs0G0VbZz1xpP1;
 Mon, 26 Feb 2024 14:58:38 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id DBF621A016B;
 Mon, 26 Feb 2024 15:00:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 15:00:05 +0800
Message-ID: <94094ae0-747e-4d78-0712-a63a18287abc@huawei.com>
Date: Mon, 26 Feb 2024 15:00:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v3 06/21] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-7-ruanjinjie@huawei.com>
 <ff7f83e0-c68d-49a0-b41b-aa6c13165333@linaro.org>
In-Reply-To: <ff7f83e0-c68d-49a0-b41b-aa6c13165333@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.331,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: DktCv8gTWSq3



On 2024/2/24 3:55, Richard Henderson wrote:
> On 2/23/24 00:32, Jinjie Ruan via wrote:
>> This only implements the external delivery method via the GICv3.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v3:
>> - Not include CPU_INTERRUPT_NMI when FEAT_NMI not enabled
>> - Add ARM_CPU_VNMI.
>> - Refator nmi mask in arm_excp_unmasked().
>> - Test SCTLR_ELx.NMI for ALLINT mask for NMI.
>> ---
>>   target/arm/cpu-qom.h |  4 +++-
>>   target/arm/cpu.c     | 54 ++++++++++++++++++++++++++++++++++++--------
>>   target/arm/cpu.h     |  4 ++++
>>   target/arm/helper.c  |  2 ++
>>   4 files changed, 54 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
>> index 8e032691db..e0c9e18036 100644
>> --- a/target/arm/cpu-qom.h
>> +++ b/target/arm/cpu-qom.h
>> @@ -36,11 +36,13 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
>>   #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>>   #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>>   -/* Meanings of the ARMCPU object's four inbound GPIO lines */
>> +/* Meanings of the ARMCPU object's six inbound GPIO lines */
>>   #define ARM_CPU_IRQ 0
>>   #define ARM_CPU_FIQ 1
>>   #define ARM_CPU_VIRQ 2
>>   #define ARM_CPU_VFIQ 3
>> +#define ARM_CPU_NMI 4
>> +#define ARM_CPU_VNMI 5
>>     /* For M profile, some registers are banked secure vs non-secure;
>>    * these are represented as a 2-element array where the first element
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 5fa86bc8d5..d40ada9c75 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -126,11 +126,20 @@ static bool arm_cpu_has_work(CPUState *cs)
>>   {
>>       ARMCPU *cpu = ARM_CPU(cs);
>>   -    return (cpu->power_state != PSCI_OFF)
>> -        && cs->interrupt_request &
>> -        (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
>> -         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
>> -         | CPU_INTERRUPT_EXITTB);
>> +    if (cpu_isar_feature(aa64_nmi, cpu)) {
>> +        return (cpu->power_state != PSCI_OFF)
>> +            && cs->interrupt_request &
>> +            (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
>> +             | CPU_INTERRUPT_NMI | CPU_INTERRUPT_VNMI
>> +             | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ |
>> CPU_INTERRUPT_VSERR
>> +             | CPU_INTERRUPT_EXITTB);
>> +    } else {
>> +        return (cpu->power_state != PSCI_OFF)
>> +            && cs->interrupt_request &
>> +            (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
>> +             | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ |
>> CPU_INTERRUPT_VSERR
>> +             | CPU_INTERRUPT_EXITTB);
>> +    }
> 
> This can be factored better, to avoid repeating everything.
> 
> However, I am reconsidering my previous advice to ignore NMI if FEAT_NMI
> is not present.
> 
> Consider R_MHWBP, where IRQ with Superpriority, with SCTLR_ELx.NMI == 0,
> is masked identically with IRQ without Superpriority.  Moreover, if the
> GIC is configured so that FEAT_GICv3_NMI is only set if FEAT_NMI is set,
> then we won't ever see CPU_INTERRUPT_*NMI anyway.
> 
> So we might as well accept NMI here unconditionally.  But document this
> choice here with a comment.
> 
> 
>> @@ -678,13 +688,26 @@ static inline bool arm_excp_unmasked(CPUState
>> *cs, unsigned int excp_idx,
>>           return false;
>>       }
>>   +    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
>> +        nmi_unmasked = (cur_el == target_el) &&
>> +                       (((env->cp15.sctlr_el[target_el] & SCTLR_NMI) &&
>> +                        (env->allint & PSTATE_ALLINT)) ||
>> +                        ((env->cp15.sctlr_el[target_el] &
>> SCTLR_SPINTMASK) &&
>> +                        (env->pstate & PSTATE_SP)));
> 
> In the manual, this is "allintmask".  It is easier to follow the logic
> if you use this...

The mannual also require that it must be same EL.

An interrupt is controlled by PSTATE.ALLINT when all of the following apply:
• SCTLR_ELx.NMI is 1.
• The interrupt is targeted at ELx.
• Execution is at ELx.

An interrupt is controlled by PSTATE.SP when all of the following apply:
• SCTLR_ELx.NMI is 1.
• SCTLR_ELx.SPINTMASK is 1.
• The interrupt is targeted at ELx.
• Execution is at ELx.

> 
>> +        nmi_unmasked = !nmi_unmasked;
> 
> ... and not the inverse.
> 
>>       case EXCP_FIQ:
>> -        pstate_unmasked = !(env->daif & PSTATE_F);
>> +        pstate_unmasked = (!(env->daif & PSTATE_F)) & nmi_unmasked;
> 
> Clearer with "&&".
> 
>> +    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
>> +        if (interrupt_request & CPU_INTERRUPT_NMI) {
>> +            excp_idx = EXCP_NMI;
>> +            target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el,
>> secure);
>> +            if (arm_excp_unmasked(cs, excp_idx, target_el,
>> +                                  cur_el, secure, hcr_el2)) {
>> +                goto found;
>> +            }
>> +        }
>> +    }
> 
> Handling for vNMI?
> 
>> @@ -957,6 +992,7 @@ static void arm_cpu_set_irq(void *opaque, int irq,
>> int level)
>>           break;
>>       case ARM_CPU_IRQ:
>>       case ARM_CPU_FIQ:
>> +    case ARM_CPU_NMI:
>>           if (level) {
>>               cpu_interrupt(cs, mask[irq]);
>>           } else {
> 
> Likewise.
> 
> 
> r~
