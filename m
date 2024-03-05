Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp137317ejb;
        Tue, 5 Mar 2024 13:52:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSEptpZ5j6iJjqyOxEYRyT9f8gsBojEyoD7xBH+bdV3QoUG3/EBPCxkoie1oNo58u6G4rKjR+CGKSVjU1PdPKed3gtKERO
X-Google-Smtp-Source: AGHT+IGIBCw3W988FT/USu5P5n2dKuggeusIxPIkCldALOYeeiVtrV8LIcyvsXYFVKTmII+7pJJX
X-Received: by 2002:a0c:e441:0:b0:690:897f:a615 with SMTP id d1-20020a0ce441000000b00690897fa615mr2523022qvm.9.1709675531404;
        Tue, 05 Mar 2024 13:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709675531; cv=none;
        d=google.com; s=arc-20160816;
        b=JCZjrrBIfCxv3i1xOD0U+JMryeUfXWZa3tS1mIm4cQQMMTccNjH3BlyOw8D52fzW0q
         yoCyMO7ujLaDsvJK8tVSPbGXt+5grEWiX8a6u8HTAE/qx9mq8qHVJr/vvahhn0McCH0Z
         +xrdMmQl4C8ymv53BDW+rff5WWlow5n8GEsdzkJE0666plAYCvnXnbuTgAnU/Gft8n9P
         rMJQcd07w/HDBOEhhiBY04VYjzHeb0kJqjkk6mIPQZMoE8oULJwwAIaR4vtYOWcDf2Yw
         kyOjMQkjDgM8UpSIWySlDlh9suDkYb+/juKNevA7bN9OifwZb0mSe1cMjunEeDs1zLRs
         4OQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=MmTCoQFF22gWf3auJi/F0Kgj95auySVB2PEJ0aGGck4=;
        fh=EriyJmP515SXfSupJiZxFQDwFYvnXoG2s1LajpVZo1U=;
        b=IM9kokf0kF3PN1doT5ZI309hFH14W1NkE4QCJNP4XqzsfbE+njTyP6vyLgGg09IOp4
         IsByT1I9q5KVbzlMeK3CYg9tRHH90S8l8s5FX+NO9KL4VgSVN8BYgIyswbHG6O0M6jUp
         NIe9YGR40yWKZPGYr2CjVcySKohWLV4E+AntwT8K/z4mr/0ko5mL9d3b+zOcHxkwGzbh
         tt9DD/oz1mWk92YdC7DhWKbHbXAKBucZ/5hLcB3bAe2Eop6THKHmj+0vjlQPN6YcHh8Z
         swkqpHKF92A1sd3sUL5HJkx8/jQPAN+x47TULrEYAbmCbWB4RCQVNzfvreyz/PnUUAJY
         KC8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNJ2+Izz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn14-20020ad45d6e000000b006817d997962si13144354qvb.130.2024.03.05.13.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:52:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNJ2+Izz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhchl-00023K-Iy; Tue, 05 Mar 2024 16:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhchk-00021H-09
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:52:08 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhchS-0005zC-R8
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:52:06 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1dc96f64c10so56896665ad.1
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 13:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709675509; x=1710280309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MmTCoQFF22gWf3auJi/F0Kgj95auySVB2PEJ0aGGck4=;
 b=UNJ2+Izzubb4ZmbcuxJDsi8O/KrBuMQfWFjebRfiwIOVzXSuILH+laFK67tbIruEUU
 I8hHrYh5DW15JOzLUQvoVXjp7OFP8Yazf6AMXBY5Ah9/4VAlm5R82VgFRQ5rK1K134CR
 OWBnKHPwmsoHRyh1kCBWq/BNisgKP97sX2eDm6KuR5Ek1mf7LkPXVOJb1yvnthO9vear
 7Vs8v7hDv6+YqIwIQGCzh9cH+zaKGBMlka9fPt8Jv9iM7hCuar1aZQhZ3Ya+O2cbxEsq
 8eC/8a9xIKNT8k/C4RVQrdWzk6w9fcwa/A8fMYV4HKy3LI4JHxEtqLEeDf/EVeP4/TIB
 dAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709675509; x=1710280309;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MmTCoQFF22gWf3auJi/F0Kgj95auySVB2PEJ0aGGck4=;
 b=gn4lBIPED2vfEXJ+ZnkPnUCIZaBuBpgVLCA4ueNtCzgnAR4QiYpwQn4GA55k8y/bM6
 T4GnNhXiCRzlj3pNCcjDy3FVx2v2/dtalUkghMjQyVszhDO9+S11UJ38PJsden1qLABH
 A+T5SUMQKilE8l9kcJGadquuMe3x/IV02voGclVzEv8QQ2662BI7+FgBUEEcun+MqfGN
 p4lJiwjz5Az5WW9CwEech1d84bZewUHUuKedG1kpolkAxF8p02MWCTY4slV/7Fx0DzdO
 5J5vdijtE5JnKXcmSMV/wzazl4u1P4vKuZtC6r2p77tqxQONOZxcZjkJOD9/XTZrwb89
 82Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOqsDs4egpcOG88wjje5y/xLCWn9hiuVuQdZtCA8Cn+HVxMgyW3nHm5wGTz5l31TshwBt0zEzdCEG2M13zpl+WxT1f
X-Gm-Message-State: AOJu0YxOxRJ/tjM4WGJ8CfyVRwrfYA3vxz656DdxS45Rk2ImGuebE5Wp
 LWfS8cRPzBep+iAXkmRmo7lk5JgW2PkepMXYxCT0Rzi5p/TjdRTvK6QfnoF5WMI=
X-Received: by 2002:a17:902:d4cb:b0:1dc:fccb:e043 with SMTP id
 o11-20020a170902d4cb00b001dcfccbe043mr3074182plg.4.1709675509329; 
 Tue, 05 Mar 2024 13:51:49 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 h12-20020a170902f2cc00b001dba356b96esm11131789plc.306.2024.03.05.13.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 13:51:48 -0800 (PST)
Message-ID: <675d3c62-9b6c-4a19-aace-3c1f57b6ebd5@linaro.org>
Date: Tue, 5 Mar 2024 11:51:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 17/23] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
 <20240305070331.2151131-18-ruanjinjie@huawei.com>
 <1dd86523-572d-45be-baa4-6095981c5923@linaro.org>
In-Reply-To: <1dd86523-572d-45be-baa4-6095981c5923@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: JgDybw0Ltiwv

On 3/5/24 11:50, Richard Henderson wrote:
> On 3/4/24 21:03, Jinjie Ruan via wrote:
>> Add the NMIAR CPU interface registers which deal with acknowledging NMI.
>>
>> When introduce NMI interrupt, there are some updates to the semantics for the
>> register ICC_IAR1_EL1 and ICC_HPPIR1_EL1. For ICC_IAR1_EL1 register, it
>> should return 1022 if the intid has super priority. And for ICC_NMIAR1_EL1
>> register, it should return 1023 if the intid do not have super priority.
>> Howerever, these are not necessary for ICC_HPPIR1_EL1 register.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v4:
>> - Define ICC_NMIAR1_EL1 only if FEAT_GICv3_NMI is implemented.
>> - Check sctrl_elx.SCTLR_NMI to return 1022 for icc_iar1_read().
>> - Add gicv3_icc_nmiar1_read() trace event.
>> - Do not check icc_hppi_can_preempt() for icc_nmiar1_read().
>> - Add icv_nmiar1_read() and call it when EL2Enabled() and HCR_EL2.IMO == '1'
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   hw/intc/arm_gicv3_cpuif.c | 59 +++++++++++++++++++++++++++++++++++++--
>>   hw/intc/gicv3_internal.h  |  1 +
>>   hw/intc/trace-events      |  1 +
>>   3 files changed, 58 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
>> index e1a60d8c15..df82a413c6 100644
>> --- a/hw/intc/arm_gicv3_cpuif.c
>> +++ b/hw/intc/arm_gicv3_cpuif.c
>> @@ -795,6 +795,13 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
>>       return intid;
>>   }
>> +static uint64_t icv_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
>> +{
>> +    /* todo */
>> +    uint64_t intid = INTID_SPURIOUS;
>> +    return intid;
>> +}
> 
> Needs to be implemented, similar to icv_iar_read.

Duh, see next patch.  :-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
