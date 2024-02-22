Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2301542ejb;
        Wed, 21 Feb 2024 18:44:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9klWbd9WEMt8d9zEufS0mr65ujx0amzlJf6qkNJVAIa8Iy7TC9f7mqt2U4oJ7oImZsRaW5b89YP9OK3LiUkxrpNO2fK+q
X-Google-Smtp-Source: AGHT+IFlfwUBdH/Hq1bW5Q/fFCeenfJV6dbXFs+TZjM6aCDsEfpa8UZUcdRJdORHoHZizbQiPI09
X-Received: by 2002:ac8:5d56:0:b0:42c:8b9f:572f with SMTP id g22-20020ac85d56000000b0042c8b9f572fmr24313269qtx.30.1708569891629;
        Wed, 21 Feb 2024 18:44:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708569891; cv=none;
        d=google.com; s=arc-20160816;
        b=U2QYY/UtPXNKDkUBPvtXt0EI41vXCoKk2rXKfaf+oRuWmwX2oiotib2gLrcHaTbbJp
         jMem4JkL9lFlUNu5WMLeBNXrSyNYAdpizlrc2kO2Q2I685/BYMkxkexb0z3Xnxwncf6v
         V7479/zxNgY9XrRVK5UGAXkJY9s5p2fcmWP3CdUOVQJENMY8e34LKGYgsP7qu34qfKX6
         CxT1KO8qn74omNoy/ktFTXPni1yGq17FJFl7YL11nB5xoz4DgEqfSPYFCVG1GBxS0+PJ
         EjKTz7XGKa1GQetXWv9+eXjLZ5Y63SyD2bXWtyp1LgVUGVtQktysyIMdMYfl4+qTIMo5
         NMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=NZoQ0EOYnPdr5tERvtBgkuPAwDIWbSEBokrzoNBZSRg=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=FcssGT3nEWPzbAVLU5Y+84VFnAjMgPFSoo03swfe3adI59bYvIUCTrtoQaZD1WQQXx
         wJ0LyDvXGoIGFuHY6ES42ui2BsZZZGsGwYE+rk2pER7jNGI6UqFZBPA38QiQSB3+jafX
         IqZS1dIrbS6FnvUY7qvFmPDS5SYyrPzS2Ug2dI8vr48Fhx0VNTFTydtO1Hz/rfElVpvh
         YxjZ7V3Gb0rjTvaQWmir+4TDoLOGDzB9vHRm/VibcglpJ60+IVKy/eQPRGzpd85ydorY
         /JEin4NYqTDuUapzq/LL5/DTDSk0LB7Yv+4RQwAp3BOs2DJp2A/qw44ty4WZ92bLf94W
         /oeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq42-20020a05620a612a00b0078727348af7si11319583qkn.470.2024.02.21.18.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 18:44:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcz4h-0005VE-Pu; Wed, 21 Feb 2024 21:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcz4f-0005Ub-KP; Wed, 21 Feb 2024 21:44:37 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcz4b-0001RQ-Ki; Wed, 21 Feb 2024 21:44:37 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TgHRD5l07z1FL0d;
 Thu, 22 Feb 2024 10:39:36 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 3DBF71402CD;
 Thu, 22 Feb 2024 10:44:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 10:44:28 +0800
Message-ID: <2f85fc25-e3ce-4e27-d6cf-2a02dcf7971c@huawei.com>
Date: Thu, 22 Feb 2024 10:44:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v2 06/22] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-7-ruanjinjie@huawei.com>
 <94867836-95f4-4da2-96e9-583e508a762d@linaro.org>
In-Reply-To: <94867836-95f4-4da2-96e9-583e508a762d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lWHPMCPChUz8



On 2024/2/22 4:06, Richard Henderson wrote:
> On 2/21/24 03:08, Jinjie Ruan via wrote:
>> This only implements the external delivery method via the GICv3.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   target/arm/cpu-qom.h |  3 ++-
>>   target/arm/cpu.c     | 39 ++++++++++++++++++++++++++++++++++-----
>>   target/arm/cpu.h     |  2 ++
>>   target/arm/helper.c  |  1 +
>>   4 files changed, 39 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
>> index 8e032691db..66d555a605 100644
>> --- a/target/arm/cpu-qom.h
>> +++ b/target/arm/cpu-qom.h
>> @@ -36,11 +36,12 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
>>   #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>>   #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>>   -/* Meanings of the ARMCPU object's four inbound GPIO lines */
>> +/* Meanings of the ARMCPU object's five inbound GPIO lines */
>>   #define ARM_CPU_IRQ 0
>>   #define ARM_CPU_FIQ 1
>>   #define ARM_CPU_VIRQ 2
>>   #define ARM_CPU_VFIQ 3
>> +#define ARM_CPU_NMI 4
>>     /* For M profile, some registers are banked secure vs non-secure;
>>    * these are represented as a 2-element array where the first element
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 5e5978c302..055670343e 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -128,7 +128,7 @@ static bool arm_cpu_has_work(CPUState *cs)
>>         return (cpu->power_state != PSCI_OFF)
>>           && cs->interrupt_request &
>> -        (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
>> +        (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI
>>            | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ |
>> CPU_INTERRUPT_VSERR
>>            | CPU_INTERRUPT_EXITTB);
>>   }
> 
> I think you should not include CPU_INTERRUPT_NMI when it cannot be
> delivered, e.g. FEAT_NMI not enabled.

OK! I'll fix it.
> 
> 
>> @@ -668,6 +668,7 @@ static inline bool arm_excp_unmasked(CPUState *cs,
>> unsigned int excp_idx,
>>       CPUARMState *env = cpu_env(cs);
>>       bool pstate_unmasked;
>>       bool unmasked = false;
>> +    bool nmi_unmasked = false;
>>         /*
>>        * Don't take exceptions if they target a lower EL.
>> @@ -678,13 +679,29 @@ static inline bool arm_excp_unmasked(CPUState
>> *cs, unsigned int excp_idx,
>>           return false;
>>       }
>>   +    nmi_unmasked = (!(env->allint & PSTATE_ALLINT)) &
>> +                   (!((env->cp15.sctlr_el[target_el] &
>> SCTLR_SPINTMASK) &&
>> +                   (env->pstate & PSTATE_SP) && cur_el == target_el));
> 
> I don't see SCTLR_ELx.NMI being tested anywhere, which is required to
> enable everything else.

OK! I'll fix it.

> 
>>       case EXCP_FIQ:
>> -        pstate_unmasked = !(env->daif & PSTATE_F);
>> +        if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
>> +            pstate_unmasked = (!(env->daif & PSTATE_F)) & nmi_unmasked;
>> +        } else {
>> +            pstate_unmasked = !(env->daif & PSTATE_F);
>> +        }
>>           break;
>>         case EXCP_IRQ:
>> -        pstate_unmasked = !(env->daif & PSTATE_I);
>> +        if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
>> +            pstate_unmasked = (!(env->daif & PSTATE_I)) & nmi_unmasked;
>> +        } else {
>> +            pstate_unmasked = !(env->daif & PSTATE_I);
>> +        }
>>           break;
> 
> I don't see what this is doing.  While Superpriority is IMPLEMENTATION
> DEFINED, how are you defining it for QEMU?  Is there a definition from
> real hw which makes sense under emulation?

These code add allint mask for IRQ or FIQ,since ALLINT also mask them.

The superpriority is DEFINED in  gicv3 code and it is a NMI exception
for PE.

> 
> 
> r~
