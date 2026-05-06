Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AC3CD343B
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 14:58:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKdi3-0000ZB-Si; Wed, 06 May 2026 10:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKdi2-0000Yn-HR
 for qemu-arm@nongnu.org; Wed, 06 May 2026 10:58:46 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKdi0-0007Tb-Ii
 for qemu-arm@nongnu.org; Wed, 06 May 2026 10:58:46 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-6966d16b978so2399046eaf.3
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778079523; x=1778684323; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g0rg90ZocJHBJKvIpaOqgBFKQLqTHRAsXu1ufA5FD2A=;
 b=sPwkl4I6oltDn742j6SkBJ2PrVKWheAGyA7JuS6ZMXNj/iPvt797aQAGMFbj+FwrrB
 8YaQ5i2w8z+Pu+O+2OmvRJe0/VTyRVeAndx4KSUH+LAx6Byiy+U83dsEWozzqEQn2acA
 PAMZHjyjQAezGVjRrKlKuU2XqrR3sDMmJ6yxrl+l2rxUHh475KctO5EVbBxGu3JgQ84U
 kIfKKQQqm5TMYzmDWnglZqHnpzr7VbrINdDuozvGyCqwSAN0s7FJqY0Six536LOrLUOX
 q4eF1kV/3/4xlFFPWxfTuG4sdoBu6m+0nd9hnGuhisHNdCv/9dczocURGTefis7rDAU7
 vBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778079523; x=1778684323;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g0rg90ZocJHBJKvIpaOqgBFKQLqTHRAsXu1ufA5FD2A=;
 b=omKmP5/8QiXZ4LoRCUQMRVN7MwtApu5mI0Y3j7HpsBZJWTqeSSgJtwdse8IPG2Y/4J
 o3Vm5SX8UKr46zVhQz99y+rmztpwm4QAaaywCX6kYcDWb+WCbs/QRJkbvnRqcu3SAslc
 O+oc3xHHnR6pKskeJwRxZYNoviJdeeryUsa0EmwzjPaMIvRnrXOYgbO25ny374XcjBnZ
 L4U6q248VZt1HsLwEa5ZOvVbNU12dOAPMUGLfnldNreIa7ZTMRQAyFI6DldfC7ET8two
 QDepHGoRGpEvMPqwbpu4xHdIoUWaNU0+M89AneojqGnk/Loo/wacYu6uaqRmPW+cwD7N
 M62w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jmU2h6/T5jh+t6og0b2IDt7fujuWf1HF+tTqHlR3nSYjtKAep3DQie4Z/igK6ja19wmQjOkYqkw==@nongnu.org
X-Gm-Message-State: AOJu0Yyb4Fc7m4ympN9zmqHudHqRibFY4PuMuA36mk2kgXN/oCmqRfye
 +z+oIUwzfT0Biknk8+5VUrKS+LzaregpuN1WDTu/hxwgTy9T/lY5hcgAM7K/ibz066g=
X-Gm-Gg: AeBDieuNlLaT9wYtCCLDODm2RB8d8F+yhtwVoEJFtxMW3v5iDsI3kFR90vxfN/4oLlL
 S0R7yso+2s5MmCsHsYf/MYFwLhI9ZbrHpNL3KJmq+N+N+PJQbUv0SXDdJj1rUgn4kvy9gWy9zZ9
 ziw+Kl3hGNjgsf+7lkYEV39kCMNPiTqtFtnRk7wkhRK8ZZ1JN9xYq56dCaA7msj258ot0wNLolQ
 S/hMVlBaGMmOGhvWqV1bMTs2Kb6RFgfTqtqdzA4FyGyUBcS0phQiW7+Jqfl/Hj/MBjhnOWwTCTK
 Krg0bvGpPhEM25WZXhLwkif9pHT30n+lYEi9dcxjuqI4MUd24HPQsdqqoMwX87ej9MWEDbEpQU3
 kBICjw8w5qYEZNTM1C5yGAqtMP38UmgRYAW/u2NLWGS8S3Xj3tgjyTYt4zNs2tT0DUo8w07MmzS
 7qGJ2kxCs8vfA6KTTrUFC6u421eVbLprfUIPFJmdoFS6bnSOblOIRqoa2/0GW2+c+JKlE/dUyWa
 Q3k82VIXCQVBpSMrMMi
X-Received: by 2002:a05:6820:4dc4:b0:696:64ab:cd83 with SMTP id
 006d021491bc7-69998d5dc0fmr1796434eaf.55.1778079522968; 
 Wed, 06 May 2026 07:58:42 -0700 (PDT)
Received: from ?IPV6:2600:381:c938:6375:5307:cd92:1ec8:e891?
 ([2600:381:c938:6375:5307:cd92:1ec8:e891])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4347294b5afsm14516620fac.8.2026.05.06.07.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 07:58:42 -0700 (PDT)
Message-ID: <c5f8f8cb-8eb5-44fd-99bc-e192b5c16d4f@linaro.org>
Date: Wed, 6 May 2026 09:58:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/15] target/arm: skip tag bit bounds check if MTX is
 on
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
 <20260504-feat-mte4-v5-11-232a648e63c6@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260504-feat-mte4-v5-11-232a648e63c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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

On 5/4/26 10:50, Gabriel Brookman wrote:
> Virtual address canonicity checks should ignore mismatch in tag bits
> during translation step if MTX is set. This mismatch is checked during
> the tag check instead, in that case.
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   target/arm/helper.c    |  6 +++++-
>   target/arm/internals.h |  1 +
>   target/arm/ptw.c       | 29 ++++++++++++++++++++++++++---
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 18352bd186..0e70822d34 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9693,7 +9693,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>   {
>       uint64_t tcr = regime_tcr(env, mmu_idx);
>       bool epd, hpd, tsz_oob, ds, ha, hd, pie = false;
> -    bool aie = false;
> +    bool mtx, aie = false;
>       int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
>       ARMGranuleSize gran;
>       ARMCPU *cpu = env_archcpu(env);
> @@ -9730,6 +9730,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>           ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
>           hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
>           ds = extract64(tcr, 32, 1);
> +        mtx = extract64(tcr, 33, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
>       } else {
>           bool e0pd;
>   
> @@ -9745,6 +9746,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>               sh = extract32(tcr, 12, 2);
>               hpd = extract64(tcr, 41, 1);
>               e0pd = extract64(tcr, 55, 1);
> +            mtx = extract64(tcr, 60, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
>           } else {
>               tsz = extract32(tcr, 16, 6);
>               gran = tg1_to_gran_size(extract32(tcr, 30, 2));
> @@ -9752,6 +9754,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>               sh = extract32(tcr, 28, 2);
>               hpd = extract64(tcr, 42, 1);
>               e0pd = extract64(tcr, 56, 1);
> +            mtx = extract64(tcr, 61, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
>           }
>           ps = extract64(tcr, 32, 3);
>           ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
> @@ -9851,6 +9854,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>           .gran = gran,
>           .pie = pie,
>           .aie = aie,
> +        .mtx = mtx,
>       };
>   }
>   
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 779eafabc8..d313d36603 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1407,6 +1407,7 @@ typedef struct ARMVAParameters {
>       ARMGranuleSize gran : 2;
>       bool pie        : 1;
>       bool aie        : 1;
> +    bool mtx        : 1;
>   } ARMVAParameters;
>   
>   /**
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 4fdb27697d..4fa50d0320 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1931,7 +1931,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>        * validation to do here.
>        */
>       if (inputsize < addrsize) {
> -        uint64_t top_bits = sextract64(address, inputsize,
> +        /*
> +         * If MTX is enabled, bits 56-59 aren't checked for canonicity
> +         * during translation, since they will later be checked during
> +         * the tag check step.
> +         */
> +        uint64_t top_bits;
> +        uint64_t masked_address = address;
> +        if (param.mtx) {
> +            masked_address = deposit64(address, 56, 4, param.select * 0xf);
> +        }
> +        top_bits = sextract64(masked_address, inputsize,
>                                              addrsize - inputsize);
>           if (-top_bits != param.select) {

Hmm.  I know AArch64_VAIsOutOfRange inserts bits just like this, but it isn't the most 
efficient way to ignore bits for comparison.

Perhaps

	uint64_t cmp_mask = MAKE_64BIT_MASK(inputsize, addrsize - inputsize);

         if (param.mtx) {
             cmp_mask &= ~MAKE_64BIT_MASK(56, 4);
         }
         if ((address ^ -param.select) & cmp_mask) {

is clearer?


>               /* The gap between the two regions is a Translation fault */
> @@ -3492,15 +3502,28 @@ static bool get_phys_addr_disabled(CPUARMState *env,
>           if (arm_el_is_aa64(env, r_el)) {
>               int pamax = arm_pamax(env_archcpu(env));
>               uint64_t tcr = env->cp15.tcr_el[r_el];
> -            int addrtop, tbi;
> +            int addrtop, tbi, mtx;
> +            bool bit55;
>   
>               tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
> +            mtx = aa64_va_parameter_mtx(tcr, mmu_idx);
>               if (access_type == MMU_INST_FETCH) {
>                   tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
>               }
> -            tbi = (tbi >> extract64(address, 55, 1)) & 1;
> +            bit55 = extract64(address, 55, 1);
> +            tbi = (tbi >> bit55) & 1;
> +            mtx = (mtx >> bit55) & 1;
>               addrtop = (tbi ? 55 : 63);
>   
> +            /*
> +             * With MTX enabled, bits 56-59 are not checked according to
> +             * AArch64.S1DisabledOutput.
> +             */
> +            if (cpu_isar_feature(aa64_mte_mtx, env_archcpu(env)) && mtx &&
> +                access_type != MMU_INST_FETCH) {
> +                address = deposit64(address, 56, 4, bit55 * 0xF);
> +            }

Likewise.  And reorder things to avoid computing mtx unless required:

     uint64_t cmp_mask = MAKE_64BIT_MASK(pamax, addrtop - pamax + 1);

     if (access_type != MMU_INST_FETCH
         && cpu_isar_feature(aa64_mte_mtx, env_archcpu(env))) {
         int mtx = aa64_va_parameter_mtx(tcr, mmu_idx);
         if (mtx & (1 << bit55)) {
             cmp_mask &= ~MAKE_64BIT_MASK(56, 4);
         }
     }

     if (address & cmp_mask) {


r~

