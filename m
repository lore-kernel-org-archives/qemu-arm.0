Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp292514ejb;
        Wed, 7 Jun 2023 07:19:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7P0oqvXpXpoMpeBVuuJZEjEsIC5qlxLWSBOzjwkOE8ojs14wXTvwxlOEHLY55uGXJ2tVez
X-Received: by 2002:ad4:5f46:0:b0:626:2683:3bb1 with SMTP id p6-20020ad45f46000000b0062626833bb1mr3673600qvg.3.1686147589339;
        Wed, 07 Jun 2023 07:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686147589; cv=none;
        d=google.com; s=arc-20160816;
        b=S7EiBc4k3pOmillzASMXpKSdo/tNkoPWpbk/EGby8JTXUoaeqToYhTe9NwOn1jvdn0
         9uZ3uk14+vSEW2/OAGTH9zAOspFoq2WeUyJfiRK4s7BtSiKbeyGvMq4pGN3AMpKO5/dj
         ghZRZU1qSddV0u9LmjRtTor7bAeiEJu/Xmwym5R297PjA0FZyyEhs6KVFLgx9WhUC685
         RXAiBcLBg6teSGQgvD57gjWGhWVlQarenu4ZRhDx0EpRtpNOJPpiPw8oeDlIN+RpqW7c
         20OYP7WgC3eyt12BPlLAz1aVb4+lUacrYcdvHVnu84VVO3NhVHTAdRuos/s+dNE/4tBs
         Xkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=YLj/nunnbyuFtw0jX0vnWCUwDH3VhNha7yaT9VcGBT0=;
        b=tuArzgNAE6u52NTMrqT1X3M+IOBFqF/sYv5WOvi7m2hRf7eMCCRY0LwH3ykoEwIwDn
         DRJzQQHo4v9yiT6pr284Z5dCYwN+ctx6F6TXqO43jtRev0Oq346ZtwQM3pXKq7t3unTq
         Uirq5M+e2F3mDzCDDn3ham8xx1VHXCrff4wWH3v2aBe4V7vj+ckynNJB8ND1y0Thtf5B
         4nfXu1Fuw/l9cEpxa8IfcD6Hyy9cSW2Es0CF16kSlhIh6mcrXt1/+8t5J+WZ9zDTataP
         5ZyXaCbvMJI29NXFqzEWqomRpfEaOv1HXAEELB+UsjJtXvjQLoUk1sKSDppZ7kFv7Y8N
         MNOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020a05620a118600b0075cf5c73f73si7849584qkk.178.2023.06.07.07.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 07:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6u0i-0002ox-9t; Wed, 07 Jun 2023 10:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6u0g-0002oD-Jd; Wed, 07 Jun 2023 10:19:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6u0e-0003PR-IY; Wed, 07 Jun 2023 10:19:38 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbqGt1mRRz4x4H;
 Thu,  8 Jun 2023 00:19:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbqGq5XTsz4x41;
 Thu,  8 Jun 2023 00:19:31 +1000 (AEST)
Message-ID: <4b3a30cf-9f28-14cd-5cff-a25d2b510ca8@kaod.org>
Date: Wed, 7 Jun 2023 16:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 12/12] target/arm: Allow users to set the number of VFP
 registers
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-13-clg@kaod.org>
 <CACPK8Xce052zza6XvQYijhPEL7NDqS3cKW0x3r0DGiJENYXDGw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xce052zza6XvQYijhPEL7NDqS3cKW0x3r0DGiJENYXDGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.091, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: u36GWasqUsFT

On 6/7/23 13:06, Joel Stanley wrote:
> On Wed, 7 Jun 2023 at 04:40, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
>> have 16 64-bit FPU registers and not 32 registers. Let users set the
>> number of VFP registers with a CPU property.
>>
>> The primary use case of this property is for the Cortex A7 of the
>> Aspeed AST2600 SoC.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> You saw a crash with a buildroot image without this change, as I recall?

yes, when compiled with VFPv4d32 support, user space crashes on real HW.

Thanks,

C.

> 
> The logic is a bit hard to follow but it is good to see a fix.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>   target/arm/cpu.h        |  2 ++
>>   hw/arm/aspeed_ast2600.c |  2 ++
>>   target/arm/cpu.c        | 32 ++++++++++++++++++++++++++++++++
>>   3 files changed, 36 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index d469a2637b32..79f1a96ddf39 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -916,6 +916,8 @@ struct ArchCPU {
>>       bool has_pmu;
>>       /* CPU has VFP */
>>       bool has_vfp;
>> +    /* CPU has 32 VFP registers */
>> +    bool has_vfp_d32;
>>       /* CPU has Neon */
>>       bool has_neon;
>>       /* CPU has M-profile DSP extension */
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index 1bf12461481c..a8b3a8065a11 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -316,6 +316,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>                                   &error_abort);
>>           object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
>>                                   &error_abort);
>> +        object_property_set_bool(OBJECT(&s->cpu[i]), "vfp-d32", false,
>> +                                &error_abort);
>>           object_property_set_link(OBJECT(&s->cpu[i]), "memory",
>>                                    OBJECT(s->memory), &error_abort);
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 5182ed0c9113..74fe6ae78192 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1275,6 +1275,9 @@ static Property arm_cpu_cfgend_property =
>>   static Property arm_cpu_has_vfp_property =
>>               DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
>>
>> +static Property arm_cpu_has_vfp_d32_property =
>> +            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
>> +
>>   static Property arm_cpu_has_neon_property =
>>               DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
>>
>> @@ -1406,6 +1409,22 @@ void arm_cpu_post_init(Object *obj)
>>           }
>>       }
>>
>> +    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
>> +        cpu->has_vfp_d32 = true;
>> +        if (!kvm_enabled()) {
>> +            /*
>> +             * The permitted values of the SIMDReg bits [3:0] on
>> +             * Armv8-A are either 0b0000 and 0b0010. On such CPUs,
>> +             * make sure that has_vfp_d32 can not be set to false.
>> +             */
>> +            if (!(arm_feature(&cpu->env, ARM_FEATURE_V8) &&
>> +                  !arm_feature(&cpu->env, ARM_FEATURE_M))) {
>> +                qdev_property_add_static(DEVICE(obj),
>> +                                         &arm_cpu_has_vfp_d32_property);
>> +            }
>> +        }
>> +    }
>> +
>>       if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
>>           cpu->has_neon = true;
>>           if (!kvm_enabled()) {
>> @@ -1672,6 +1691,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>           return;
>>       }
>>
>> +    if (cpu->has_vfp_d32 != cpu->has_neon) {
>> +        error_setg(errp, "ARM CPUs must have both VFP-D32 and Neon or neither");
>> +        return;
>> +    }
>> +
>> +   if (!cpu->has_vfp_d32) {
>> +        uint32_t u;
>> +
>> +        u = cpu->isar.mvfr0;
>> +        u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
>> +        cpu->isar.mvfr0 = u;
>> +    }
>> +
>>       if (!cpu->has_vfp) {
>>           uint64_t t;
>>           uint32_t u;
>> --
>> 2.40.1
>>

