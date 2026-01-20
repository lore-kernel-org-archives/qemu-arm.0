Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14501D2ED0F
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 09:50:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vi8NL-0003a3-04; Tue, 20 Jan 2026 04:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi8NJ-0003Xu-TV
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 04:50:13 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi8NI-0000FU-0U
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 04:50:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so40015075e9.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 01:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768902610; x=1769507410; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q1gezONR3OvtRzrYQngU9HZiGwQFJDgf5TjmLEr67cQ=;
 b=HPbJijnCrgzBOq92Tbir2xeBMGSojq5j7ll36Th1LI7ZR/ubVTWJVcclaeET+HDEGQ
 TuDEDUhVw6LZ0OcBVuplnDQtB0C0KCcYAeR1Au6mnqQt3w+yHESfmKwzLLBgl1L22dUv
 zY9vS8LRZPsp0Eq3/MtiYFz7EGWjmTZvSxsCVc4j8u5aIlCEJS4jnJXHkLcXgvV2/Yvw
 HaqW6JsbwxcFEXY1vIpsN21VayLewvaRA/WYl+Nmk6Fbcona+IPzrN5xK69tvAdIcN/7
 +PqA02j/OQQNHkNdmdBAnO1bMGewloctGAOLKAGBbovbSkDpUqUjUYKB0mxHwcdeELwj
 3fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768902610; x=1769507410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1gezONR3OvtRzrYQngU9HZiGwQFJDgf5TjmLEr67cQ=;
 b=oU+A8FCEQ9O3fIdejuZjUwTovsu9UbkSLL4iP/DB42oGhuCv2IO8gAjx6x7Bw0TQgc
 XWNqM0VIInsxQpelzw0LkYrW5NagMQCHAwcM37SVi2XXPIWd8sVYIxtV3Q/k/k+A9p16
 IDb+c1nwl81EZIKgsdBu6wi63CFPc+k3kthwcXFwKGmAo1e33I94R/AOCdCHI/UhqHPD
 d+kON+yIH/r4ptXco3LVkYJvy+MZQAf3qSgaar9BxP5C4xubhHLg7HLL2qwXaL2DsatV
 Zz5a5Lov8xbrXl2jX+ENH81xj++NMQZOw+dpF1fVT+6z2q4ODgBPZyLD7+TJi6aVvuOY
 OOkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5VUAFhrfiGz0h8/1vEcB29aTq8KZwA06M6XVcUgAlP7H/zx29MAQrkn6tlCC+jY1drrCQzhn84A==@nongnu.org
X-Gm-Message-State: AOJu0Yy2og1sWYFaQ8dFdArmnjpDGGcXG3YMA4DKKuCG9wfaIClgpRZz
 ydmvyB5gWWAyduOsEpL6+t7XKLtw4RvLEGXB3tVxpZdrylVRKfIr/6nz6OvFCYT8W04=
X-Gm-Gg: AY/fxX6qZ2ZprYBYlF6D8Tkvo+0VcZ/8mrWl+vAbsAfyV+l9i9Ntivqbjy0mKzrmkHe
 uNjnL9Yf3TBZQNVyekQdBLkAXPNmcnFTv9hxQmhpEgS0F4rAPj4bag7+lr5uEoMECUxtLdAmRNu
 nyDR42bcMHgbZcxxC3vmNygJhucqzpHh/TiXWK7dqLlMYmUe6YS5ayczSHl7tpyFg1LWzD447Bo
 JK2Cr5Ui30JlizhvwSpQlMF7WfpFWg9WP0FLWplyQI94BGyvw5D8q3BLm3NgUsTNv0Qfk19zzNR
 1vAmPpI+SBnkKDY4CPJCqJCoy9HO/2MGZ8eWegHVyG7u5b3QQVpCX06mOHJ1wuYsLNFEO/oGP1T
 DDrSVY/O4Svy4L1ZqCm4qPOwd4oPOIlnoMN0onLNi/IRKFr6WMCXqgdFRC2mSqG4vSTKpLNT3gy
 dz4WQ9I12CvTtpKbt4xa2Zg+G9mLyFwaOKqxBqhHmI1WM0tRK48xwyMy+zV7wB5qjG
X-Received: by 2002:a05:600c:c165:b0:477:8b77:155e with SMTP id
 5b1f17b1804b1-4803e7a3c96mr18096005e9.15.1768902610240; 
 Tue, 20 Jan 2026 01:50:10 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e9b51e4sm106696805e9.1.2026.01.20.01.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 01:50:09 -0800 (PST)
Message-ID: <2c3bb870-0321-4799-b7ca-65b2772ddf2c@linaro.org>
Date: Tue, 20 Jan 2026 10:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hvf/arm: expose FEAT_SME2 to guest if available
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org>
 <20260115-sme2-hvf-v2-2-2eca481bd7ee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260115-sme2-hvf-v2-2-2eca481bd7ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 15/1/26 12:20, Manos Pitsidianakis wrote:
> Starting from M4 cores and MacOS 15.2 SDK, HVF can virtualise FEAT_SME2.
> 
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   target/arm/cpu.c     |  4 +++-
>   target/arm/cpu64.c   | 13 ++++++++++++-
>   target/arm/hvf/hvf.c | 25 +++++++++++++------------
>   3 files changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index caf7980b1fc5244c5c2f130e79ba869456c20c88..7f4ebfdf61217db6075495119c1b642bc2abf295 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1577,7 +1577,9 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>            * assumes it, so if the user asked for sve=off then turn off SME also.
>            * (KVM doesn't currently support SME at all.)
>            */
> -        if (cpu_isar_feature(aa64_sme, cpu) && !cpu_isar_feature(aa64_sve, cpu)) {
> +        if (!hvf_enabled()

In my experience "if(!accel)" is bug prone, maybe change to explicit "if 
(tcg_enabled() || kvm_enabled()"?

> +            && cpu_isar_feature(aa64_sme, cpu)
> +            && !cpu_isar_feature(aa64_sve, cpu)) {
>               object_property_set_bool(OBJECT(cpu), "sme", false, &error_abort);
>           }
>   
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index bf303813701972648fa6751ffe352ba074ca6442..8dd9eb46c783a799a53891a6ddad40b930e95eb4 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -329,9 +329,20 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>   {
>       uint32_t vq_map = cpu->sme_vq.map;
>       uint32_t vq_init = cpu->sme_vq.init;
> -    uint32_t vq_supported = cpu->sme_vq.supported;
> +    uint32_t vq_supported;
>       uint32_t vq;
>   
> +    if (hvf_enabled()) {
> +        if (hvf_arm_sme2_supported()) {
> +            vq_supported = hvf_arm_sme2_get_svl();
> +        } else {
> +            assert(!cpu_isar_feature(aa64_sme, cpu));
> +            vq_supported = 0;
> +        }
> +    } else {
> +        vq_supported = cpu->sme_vq.supported;
> +    }
> +
>       if (vq_map == 0) {
>           if (!cpu_isar_feature(aa64_sme, cpu)) {
>               SET_IDREG(&cpu->isar, ID_AA64SMFR0, 0);
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 6c5061742862635ae394f764188114f939259703..01bbb90b962156885021da75a0d62ae3c39ff5b0 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1043,18 +1043,18 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>   
>       clamp_id_aa64mmfr0_parange_to_ipa_size(&host_isar);
>   
> -    /*
> -     * Disable SME, which is not properly handled by QEMU hvf yet.
> -     * To allow this through we would need to:
> -     * - make sure that the SME state is correctly handled in the
> -     *   get_registers/put_registers functions
> -     * - get the SME-specific CPU properties to work with accelerators
> -     *   other than TCG
> -     * - fix any assumptions we made that SME implies SVE (since
> -     *   on the M4 there is SME but not SVE)
> -     */
> -    SET_IDREG(&host_isar, ID_AA64PFR1,
> -              GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SME_MASK);
> +    if (hvf_arm_sme2_supported()) {
> +        t = GET_IDREG(&host_isar, ID_AA64PFR1);
> +        t = FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 */
> +        SET_IDREG(&host_isar, ID_AA64PFR1, t);
> +
> +        t = GET_IDREG(&host_isar, ID_AA64SMFR0);
> +        t = FIELD_DP64(t, ID_AA64SMFR0, SMEVER, 1);   /* FEAT_SME2 */
> +        SET_IDREG(&host_isar, ID_AA64SMFR0, t);
> +    } else {
> +        SET_IDREG(&host_isar, ID_AA64PFR1,
> +                GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SME_MASK);
> +    }
>   
>       ahcf->isar = host_isar;
>   
> @@ -1252,6 +1252,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>                                 arm_cpu->isar.idregs[ID_AA64MMFR0_EL1_IDX]);
>       assert_hvf_ok(ret);
>   
> +    aarch64_add_sme_properties(OBJECT(cpu));

Out of scope, those aarch64_add_FEAT_properties() should really take a
ARMCPU *cpu argument IMHO.

>       return 0;
>   }
>   
> 


