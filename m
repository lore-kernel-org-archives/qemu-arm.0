Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2801587ejt;
        Mon, 19 Jun 2023 06:10:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Dndyit+RSd6RgfSGB4gIwTyXlcIQXlai+9S6cHXFEOf4upLzF39WBaxC1oSt1YdPsBoiP
X-Received: by 2002:a05:620a:6191:b0:75d:4dab:c414 with SMTP id or17-20020a05620a619100b0075d4dabc414mr9602545qkn.41.1687180224574;
        Mon, 19 Jun 2023 06:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687180224; cv=none;
        d=google.com; s=arc-20160816;
        b=rHd/Nwj4R3JsQUpnol3uUCNQmE8yUdm2IthevsZw+LhxP3mcPRLah4w/nx0Fk6k5RQ
         SU6UxY+ukR6qwyiUUICbSfKK4zifWkfrX1JAtOZOopjWCvRTQLfmFCsw8UGQ2HIDDtez
         qLmVrII5+ICUW42a5mIByYbONcXzHyCURlDtuLCL264Q4GWJjtqwccuZxGg81GDF+0gV
         tMqPKDSyANWtCYiJiUYD4rrCyBVaV41fb3yhOCQcim0YzcTT0rk3zp58nduni780ignX
         mvYwAbPr+GCO6dNkvKdly5yj90898gMfDB9AFlu58yIaives29I7v5PjwEqIgXNd4JZD
         zieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=u5yq5ww30I+aLl6emE0ak+gxzxg7IyccO1kMdQqd3Fw=;
        b=G+RQ17N3OnYNXTWroO6/AddwEMNvenYd/esvZuQ0zmSrWHcG25UczozI8KlIhm28EJ
         F4d9Uh1270LbBG7XeC8qi3CJF0llJCTmrkN8Yw5xa5rY8QLJRtiOL/9GkQZM+u3JkWU5
         GzWFemJ9e9PaWLnCogcDmWnG6eHTF5SveAJfuSuwoF84A74R0PEL0oDBhJEZNxqAIHfb
         egFvmPeWvmdeF63y2cZiugdCS+V0jX01K3QCHM8JCXmvSplEBmRVl10ze/GO99VdeT0G
         nn+x1GPtfuieFxAFBIqFf0XkrnBYLCHQ43u8QyY9/vBPGnJ4Ij1bQyp5Ksy6AB2Z+BD3
         25iA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23-20020a05620a079700b007639c692579si478739qka.468.2023.06.19.06.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:10:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEdm-0002xG-2m; Mon, 19 Jun 2023 09:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TN9Z=CH=kaod.org=clg@ozlabs.org>)
 id 1qBEdh-0002wu-8L; Mon, 19 Jun 2023 09:09:49 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TN9Z=CH=kaod.org=clg@ozlabs.org>)
 id 1qBEde-00038Y-4M; Mon, 19 Jun 2023 09:09:48 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Ql98c3PvYz4wjD;
 Mon, 19 Jun 2023 23:09:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ql98Z1CcMz4wgk;
 Mon, 19 Jun 2023 23:09:33 +1000 (AEST)
Message-ID: <c027687b-da81-3e3f-9305-43a6eadc17fe@kaod.org>
Date: Mon, 19 Jun 2023 15:09:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 12/12] target/arm: Allow users to set the number of VFP
 registers
Content-Language: en-US
To: Mads Ynddal <mads@ynddal.dk>
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-13-clg@kaod.org>
 <955C217E-FE0F-41E2-8E97-9AFD8C4A0DBE@ynddal.dk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <955C217E-FE0F-41E2-8E97-9AFD8C4A0DBE@ynddal.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=TN9Z=CH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: n0ShJmZLRsIs

On 6/19/23 14:47, Mads Ynddal wrote:
> Sorry, if this has already been acknowledged, but I couldn't find it on the
> mailinglist.
> 
> This commit seems to break compatibility with macOS accelerator hvf when
> virtualizing ARM CPUs.
> 
> It breaks the VM on boot-up with the message "ARM CPUs must have both VFP-D32
> and Neon or neither". I haven't looked into what VFP-D32 and Neon are, but the
> same VM worked on earlier versions of QEMU.
> 
> It can be reproduced with the following:
> 
> qemu-system-aarch64 \
>    -nodefaults \
>    -display "none" \
>    -machine "virt" \
>    -accel "hvf" \
>    -cpu "host" \
>    -serial "mon:stdio"
> qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither

ARM's "Vector Floating Point" unit has many implementation with different
features: VFPv3-D16/D32, *FP16, VFPv4-D16/D32, Neon, etc. The test might
be too strict and could possibly be removed.

Could you send us the result of 'cat /proc/cpuinfo' on the host ?

Thanks,

C.

> If you fix/work on this issue in a separate thread/patch, you can add
> reported-by, so I'll automatically follow and help test it:
> 
> Reported-by: Mads Ynddal <mads@ynddal.dk>
> 
> —
> Mads Ynddal
> 
>> On 7 Jun 2023, at 06.39, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
>> have 16 64-bit FPU registers and not 32 registers. Let users set the
>> number of VFP registers with a CPU property.
>>
>> The primary use case of this property is for the Cortex A7 of the
>> Aspeed AST2600 SoC.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> target/arm/cpu.h        |  2 ++
>> hw/arm/aspeed_ast2600.c |  2 ++
>> target/arm/cpu.c        | 32 ++++++++++++++++++++++++++++++++
>> 3 files changed, 36 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index d469a2637b32..79f1a96ddf39 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -916,6 +916,8 @@ struct ArchCPU {
>>      bool has_pmu;
>>      /* CPU has VFP */
>>      bool has_vfp;
>> +    /* CPU has 32 VFP registers */
>> +    bool has_vfp_d32;
>>      /* CPU has Neon */
>>      bool has_neon;
>>      /* CPU has M-profile DSP extension */
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index 1bf12461481c..a8b3a8065a11 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -316,6 +316,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>                                  &error_abort);
>>          object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
>>                                  &error_abort);
>> +        object_property_set_bool(OBJECT(&s->cpu[i]), "vfp-d32", false,
>> +                                &error_abort);
>>          object_property_set_link(OBJECT(&s->cpu[i]), "memory",
>>                                   OBJECT(s->memory), &error_abort);
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 5182ed0c9113..74fe6ae78192 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1275,6 +1275,9 @@ static Property arm_cpu_cfgend_property =
>> static Property arm_cpu_has_vfp_property =
>>              DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
>>
>> +static Property arm_cpu_has_vfp_d32_property =
>> +            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
>> +
>> static Property arm_cpu_has_neon_property =
>>              DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
>>
>> @@ -1406,6 +1409,22 @@ void arm_cpu_post_init(Object *obj)
>>          }
>>      }
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
>>      if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
>>          cpu->has_neon = true;
>>          if (!kvm_enabled()) {
>> @@ -1672,6 +1691,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          return;
>>      }
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
>>      if (!cpu->has_vfp) {
>>          uint64_t t;
>>          uint32_t u;
>> -- 
>> 2.40.1
>>
>>
>>
> 

