Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp903420lfg;
        Mon, 25 Jul 2022 07:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1swl24FN18OPc2ecHFoeYZsWjeYr+d3e0gHUkfPmGgl+AQl9jB4o3JKPJulQ8mLwk0f1giv
X-Received: by 2002:a05:622a:1387:b0:31f:25ba:224c with SMTP id o7-20020a05622a138700b0031f25ba224cmr10657353qtk.338.1658760428478;
        Mon, 25 Jul 2022 07:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658760428; cv=none;
        d=google.com; s=arc-20160816;
        b=vj+pvNfvCDDEnsUwC0G+r1zKO5/STXSnAgtimBfQ1OK3Serde0LntNE678cO1MpndF
         4ZhhIpXvylUGZWVAP/dvJn48qjG6K6PueYRHBE6YNzZdYIetyJLH8/B+YKkP5fmx9YFA
         vDFuAdf27VFtUurE0lYraEpxPmf8PBYvhhY0X9XPTBP3Eqd1sx+4lQtMT+lvUH4NWvyz
         26ZxA9+pUw4TMgYJK/kym9cZWI90pcwJtkRlZcfpcWlh1lVLeeT0u6Y6rV18h71op19p
         zrj9ja3HV6EVYaFt/PrTEzWvCKurvWpcSe6rD60xvvYFIjscJTl7gBCcvwqatO+AjTqi
         +nhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TR8fQnvf2UdaZzfh1X4YhDMo/Yee0UcQMWrsCMSUBFg=;
        b=SZC7IZLNa2DOdPab4lP+KNwqs8Lgnzxa3tH4aLDm8MzokrjeBb1ErZI+mUB9lgKmOT
         +Uo1lFIrGKRWIApxMD4mpvhdIqkx8+Uc+uhIkW+sXmbr3UFzbv2aEd2etHyvuDZARxPb
         PgEYOlrfzgJfMXHfOMzqGXwKvMzo6zPYhIxH5KVAmhSVPAQi4XBWjjUQ1MSaPJoA0drG
         NUeGaYBFXauI3UvXdJDid+HYsWUPsUiJVNRfCs/qWcZd7tiNEJE58/8MIKFCuBAP5kJT
         qM9SZaakMSvHjiGPadUrBQWFpHxkTkxKDZsc1dadRD/8SW/qfaelyMKzcQDaix7YjjcQ
         OcPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yj3O2XlL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs30-20020a05620a471e00b006b617132b29si8559963qkb.449.2022.07.25.07.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 07:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yj3O2XlL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oFzME-0007Ql-0t
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 10:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFzLT-0007NB-35
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 10:46:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFzLR-0006jk-Gi
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 10:46:06 -0400
Received: by mail-pl1-x629.google.com with SMTP id y24so10592851plh.7
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TR8fQnvf2UdaZzfh1X4YhDMo/Yee0UcQMWrsCMSUBFg=;
 b=Yj3O2XlLpED6TcDrDRe3UWR8e5QVNHMUCsyaisZIV7BTxotmmL7vvwBqZNmqYoJlv2
 BZkEb/XBbJsbxqArR140b+y0gzC4rLhFXzoFn/eTRGZkunIxzhP8OPvZtkywoglpVBJs
 FiD1fZzO+u6qZGnTU3W42jefNIyiDygRo4vyWGgYCodKAMapDChlWFXb+619bRm8+luC
 xp6j+znqQYOcC1ggkaGmlo43kOYRZaJjgyiM0jhHzN5z17Fx9zIohgQE+7wNTRQdTS4T
 HWRykSsl1+Q3Mj2mu5Owj7C3HtAWrZBvsE4qMYEDCeXi6WGQXh4k7Ly9k0s4p6bFAC2u
 y74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TR8fQnvf2UdaZzfh1X4YhDMo/Yee0UcQMWrsCMSUBFg=;
 b=cEcNfqDmzpHS7p1XAMEgzedPvSAesixzu2UcLUU0kCZHRBaYtPRZxAiir7HaKTCWw/
 8YTXf3nt4fDeTrYt2JSItJLdvFiHjAMb2giLcpmh+u8zshY67vLuoEfSJqTZKfSX7MBg
 ZxNl0gLV8YdyheezSRYLPKmRe//n29ASMfcn1Akm1SbblffGcnewNeHdNtrBojx+qwo0
 QXM5bedr6W0t9DhEtRc80w64CJHHLaLdnWnPB6TENSMoeZJb1+HXtePi+ChP+L5746Hi
 Ltl/N84/H6IJIffgoqVFbid7aqoDVF7NiH/BCIx8boMyVRktUzDUbGCwSgUU9rQiCDiS
 TCZg==
X-Gm-Message-State: AJIora+JgZRTb93C66CVsm7fnOkXH/QYZ849GO2UAHRE3ebpjn85quuf
 mp6Xwe1IwDK+WZ/HbZhTLR4taw==
X-Received: by 2002:a17:90a:4402:b0:1f2:3507:5f96 with SMTP id
 s2-20020a17090a440200b001f235075f96mr14508130pjg.22.1658760363892; 
 Mon, 25 Jul 2022 07:46:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:30c1:2484:a853:233d?
 ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a170902ce0c00b0016c46ff9741sm9309332plg.67.2022.07.25.07.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 07:46:03 -0700 (PDT)
Message-ID: <2d957926-ef9c-eae5-d78f-3acc04d047cb@linaro.org>
Date: Mon, 25 Jul 2022 07:46:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 01/92] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, andrew.jones@linux.dev
References: <20210525010358.152808-1-richard.henderson@linaro.org>
 <20210525010358.152808-2-richard.henderson@linaro.org>
 <8e2ac59a-af4d-0f2c-455b-b9ed07b1e56a@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8e2ac59a-af4d-0f2c-455b-b9ed07b1e56a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2fdztCqwD0yh

On 7/25/22 00:05, Zenghui Yu wrote:
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index dff85f6db9..37ceadd9a9 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -647,17 +647,26 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>
>>      sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
>>
>> -    kvm_arm_destroy_scratch_host_vcpu(fdarray);
>> -
>> -    if (err < 0) {
>> -        return false;
>> -    }
>> -
>>      /* Add feature bits that can't appear until after VCPU init. */
>>      if (sve_supported) {
>>          t = ahcf->isar.id_aa64pfr0;
>>          t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>>          ahcf->isar.id_aa64pfr0 = t;
>> +
>> +        /*
>> +         * Before v5.1, KVM did not support SVE and did not expose
>> +         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
>> +         * not expose the register to "user" requests like this
>> +         * unless the host supports SVE.
>> +         */
>> +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
>> +                              ARM64_SYS_REG(3, 0, 0, 4, 4));
> 
> If I read it correctly, we haven't yet enabled SVE for the scratch vcpu
> (using the KVM_ARM_VCPU_INIT ioctl with KVM_ARM_VCPU_SVE). KVM will
> therefore expose ID_AA64ZFR0_EL1 to userspace as RAZ at this point and
> isar.id_aa64zfr0 is reset to 0. I wonder if it was intentional?

You are correct, this is a bug.  It appears this is hidden because nothing else actually 
depends on the value within the context of --accel=kvm, e.g. migration.


r~
