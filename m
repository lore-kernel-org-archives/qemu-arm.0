Received: by 10.25.0.6 with SMTP id 6csp823685lfa;
        Sat, 13 May 2017 15:36:00 -0700 (PDT)
X-Received: by 10.233.235.12 with SMTP id b12mr9847555qkg.75.1494714960654;
        Sat, 13 May 2017 15:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494714960; cv=none;
        d=google.com; s=arc-20160816;
        b=TXhGxRPEOAqjZ18cH1aT5AvjYdrAVZshCEZ6J0ywB4Ib+424BbmLbdSwjLRTSFO2mx
         z+hqA/3p2nnyJM3yQDgwy3YUlMY/s8T6IDcVMEJDHo6cXJhHqbOXx9+xGZCpRQqjyxRr
         TMVrvDCmKMUvVIPQjIeFmHGpn+wOrjVjMjFkNP6szTL07PCY/R6gYgfj8PfYhBKFt4XO
         7TlWPwJLw5IqYUeEtpfkwFruQzPo8mmdXGbBTHoHRgAVTtJmr0t18TsezZkIBmbzTK4W
         sMO/OAvXqBJ5CllalyUr0hi1AjOaIRSqd+R8+QsMQ2k/HwNpIkbomCzxUBIGP4UNFHBo
         De7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:sender:dkim-signature
         :arc-authentication-results;
        bh=lnOKEE1BW0uLN7rHJL7MIXK/Kq7hG++fsjREozF3Lh0=;
        b=bqq/sXRuby2WttAr0MzHRIJwzJ4iT/ONezS2FLS1AEAm2ogjLTCa9E4NeEnQEQBjCF
         UIsScCTkcCNPM8BwcZXM8kRdA7vRI0REMi8T0cdJ01B5lUOJJjgO6j167vHXkaEYcIKR
         x0DL0iDjiUbQtNNdcBiF7fNICUa08RL4QcDi2OtBNfdFG0/ci1lfnSAFzsOIbbZsHjqV
         hMo/rRPXotPv1lBsPn2NeiGbJWp7NkkjxIPVCgh8CCS2kDIe6gBotcqPBr9jbRu9vTfb
         FQKuRfjMvX8tM72RGcflEnr25fcdhGKtL2vnROAgN9ui0xlsuictqmOJIHf0xN326KGr
         7o6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id h51si6347461qth.65.2017.05.13.15.36.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 May 2017 15:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id j13so11140693qta.3;
        Sat, 13 May 2017 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=lnOKEE1BW0uLN7rHJL7MIXK/Kq7hG++fsjREozF3Lh0=;
        b=GF9WLqEJm38cJJw3NzBFmdokoIwlYpffihwpAzFnn2ecNlqH/7Bi74m7IvGmlAIuYh
         qXaDVNBT125yOpDRFi24ZyJSI8YxAt+HKTQlHEdoN3GFb/HYW20Kv4/9Jy67Vk4k2Yhb
         aAYgqa7mMIOZ7fcgT3DiPhWVtrdbsnSMee8sLEWaN+3JKfqwVxofo4t2oU140QD1A2Fv
         XkWl6MLtu6X3e3Rqxh/kWiDyDhIFdnHns8oT7AGi/Lxz6U5bxbKExB2RSvhILg/UEDrQ
         0A0paQg0Plm3tcdfJL3QEbzGPnNQP5NHCbhu7vorQCvwy36YNmaD69YJHARkkNzTdsRp
         PK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=lnOKEE1BW0uLN7rHJL7MIXK/Kq7hG++fsjREozF3Lh0=;
        b=IiPhO3tdwqEGEt4IYda7j9kxoxRE3qToBKUGSPqe7n7MxF6/QzgqUjfLtAjkFKvqsH
         P2yW/iemlaxjBEyZk+7UMe6gckH6b19o+MySjGFsPBBa+u0erTYf2BJUTGtxf60S47lE
         UCSWQagmMvthV3GWgulkGXBHNlnXA1sXQ3BaIzZSBiHCf7dj+9Xl4jvHoq74ol7IUKo+
         7Z2dAwzWY+dhxWGeDXOGGuUozYVy0I04JxW4eidIYtc+VF/qOAPT7k2rmYDnpjhgUTXN
         5QT/9dB8+kl+PbvFLfBgrkwjDRuPhLTd+71HMQu97L8x0/F7ZDfoyfyN6OXtt1yupZhV
         EACA==
X-Gm-Message-State: AODbwcBXc5gk7/ttVvDV+p/WqsKoRw8QpZHA2DrOtk2TYhiOXm7FTw/M
	mkA9SlpNh77rvA==
X-Received: by 10.200.35.177 with SMTP id q46mr10931693qtq.158.1494714959958;
        Sat, 13 May 2017 15:35:59 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id q30sm5442616qkh.39.2017.05.13.15.35.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 May 2017 15:35:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 04/13] arm: Clean up handling of no-MPU PMSA
 CPUs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
 <1493122030-32191-5-git-send-email-peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ad8e931-12e0-2f7d-2141-402c20ccb463@amsat.org>
Date: Sat, 13 May 2017 19:35:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493122030-32191-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: XVoBsFMqF50p

Hi Peter,

On 04/25/2017 09:07 AM, Peter Maydell wrote:
> ARM CPUs come in two flavours:
>  * proper MMU ("VMSA")
>  * only an MPU ("PMSA")
> For PMSA, the MPU may be implemented, or not (in which case there
> is default "always acts the same" behaviour, but it isn't guest
> programmable).
>
> QEMU is a bit confused about how we indicate this: we have an
> ARM_FEATURE_MPU, but it's not clear whether this indicates
> "PMSA, not VMSA" or "PMSA and MPU present" , and sometimes we
> use it for one purpose and sometimes the other.
>
> Currently trying to implement a PMSA-without-MPU core won't
> work correctly because we turn off the ARM_FEATURE_MPU bit
> and then a lot of things which should still exist get
> turned off too.
>
> As the first step in cleaning this up, rename the feature
> bit to ARM_FEATURE_PMSA, which indicates a PMSA CPU (with
> or without MPU).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h     |  2 +-
>  target/arm/cpu.c     | 12 ++++++------
>  target/arm/helper.c  | 12 ++++++------
>  target/arm/machine.c |  2 +-
>  4 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 253565b..0718955 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1179,7 +1179,7 @@ enum arm_features {
>      ARM_FEATURE_V6K,
>      ARM_FEATURE_V7,
>      ARM_FEATURE_THUMB2,
> -    ARM_FEATURE_MPU,    /* Only has Memory Protection Unit, not full MMU.  */
> +    ARM_FEATURE_PMSA,   /* no MMU; may have Memory Protection Unit */
>      ARM_FEATURE_VFP3,
>      ARM_FEATURE_VFP_FP16,
>      ARM_FEATURE_NEON,
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b357aee..f17e279 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -586,7 +586,7 @@ static void arm_cpu_post_init(Object *obj)
>                                   &error_abort);
>      }
>
> -    if (arm_feature(&cpu->env, ARM_FEATURE_MPU)) {
> +    if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
>                                   &error_abort);
>          if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
> @@ -682,7 +682,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>
>      if (arm_feature(env, ARM_FEATURE_V7) &&
>          !arm_feature(env, ARM_FEATURE_M) &&
> -        !arm_feature(env, ARM_FEATURE_MPU)) {
> +        !arm_feature(env, ARM_FEATURE_PMSA)) {
>          /* v7VMSA drops support for the old ARMv5 tiny pages, so we
>           * can use 4K pages.
>           */
> @@ -758,10 +758,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      }
>
>      if (!cpu->has_mpu) {
> -        unset_feature(env, ARM_FEATURE_MPU);
> +        unset_feature(ARM_FEATURE_PMSA);

With the missing 'env' argument:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      }
>
> -    if (arm_feature(env, ARM_FEATURE_MPU) &&
> +    if (arm_feature(env, ARM_FEATURE_PMSA) &&
>          arm_feature(env, ARM_FEATURE_V7)) {
>          uint32_t nr = cpu->pmsav7_dregion;
>
> @@ -861,7 +861,7 @@ static void arm946_initfn(Object *obj)
>
>      cpu->dtb_compatible = "arm,arm946";
>      set_feature(&cpu->env, ARM_FEATURE_V5);
> -    set_feature(&cpu->env, ARM_FEATURE_MPU);
> +    set_feature(&cpu->env, ARM_FEATURE_PMSA);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>      cpu->midr = 0x41059461;
>      cpu->ctr = 0x0f004006;
> @@ -1073,7 +1073,7 @@ static void cortex_r5_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_THUMB_DIV);
>      set_feature(&cpu->env, ARM_FEATURE_ARM_DIV);
>      set_feature(&cpu->env, ARM_FEATURE_V7MP);
> -    set_feature(&cpu->env, ARM_FEATURE_MPU);
> +    set_feature(&cpu->env, ARM_FEATURE_PMSA);
>      cpu->midr = 0x411fc153; /* r1p3 */
>      cpu->id_pfr0 = 0x0131;
>      cpu->id_pfr1 = 0x001;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 791332c..404bfdb 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -485,7 +485,7 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
>
> -    if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_MPU)
> +    if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_PMSA)
>          && !extended_addresses_enabled(env)) {
>          /* For VMSA (when not using the LPAE long descriptor page table
>           * format) this register includes the ASID, so do a TLB flush.
> @@ -4615,7 +4615,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, v6k_cp_reginfo);
>      }
>      if (arm_feature(env, ARM_FEATURE_V7MP) &&
> -        !arm_feature(env, ARM_FEATURE_MPU)) {
> +        !arm_feature(env, ARM_FEATURE_PMSA)) {
>          define_arm_cp_regs(cpu, v7mp_cp_reginfo);
>      }
>      if (arm_feature(env, ARM_FEATURE_V7)) {
> @@ -4969,7 +4969,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          }
>      }
>
> -    if (arm_feature(env, ARM_FEATURE_MPU)) {
> +    if (arm_feature(env, ARM_FEATURE_PMSA)) {
>          if (arm_feature(env, ARM_FEATURE_V6)) {
>              /* PMSAv6 not implemented */
>              assert(arm_feature(env, ARM_FEATURE_V7));
> @@ -5131,7 +5131,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              define_arm_cp_regs(cpu, id_pre_v8_midr_cp_reginfo);
>          }
>          define_arm_cp_regs(cpu, id_cp_reginfo);
> -        if (!arm_feature(env, ARM_FEATURE_MPU)) {
> +        if (!arm_feature(env, ARM_FEATURE_PMSA)) {
>              define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
>          } else if (arm_feature(env, ARM_FEATURE_V7)) {
>              define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
> @@ -8442,7 +8442,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>      /* pmsav7 has special handling for when MPU is disabled so call it before
>       * the common MMU/MPU disabled check below.
>       */
> -    if (arm_feature(env, ARM_FEATURE_MPU) &&
> +    if (arm_feature(env, ARM_FEATURE_PMSA) &&
>          arm_feature(env, ARM_FEATURE_V7)) {
>          *page_size = TARGET_PAGE_SIZE;
>          return get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
> @@ -8457,7 +8457,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
>          return 0;
>      }
>
> -    if (arm_feature(env, ARM_FEATURE_MPU)) {
> +    if (arm_feature(env, ARM_FEATURE_PMSA)) {
>          /* Pre-v7 MPU */
>          *page_size = TARGET_PAGE_SIZE;
>          return get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index d8094a8..ac6b758 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -142,7 +142,7 @@ static bool pmsav7_needed(void *opaque)
>      ARMCPU *cpu = opaque;
>      CPUARMState *env = &cpu->env;
>
> -    return arm_feature(env, ARM_FEATURE_MPU) &&
> +    return arm_feature(env, ARM_FEATURE_PMSA) &&
>             arm_feature(env, ARM_FEATURE_V7);
>  }
>
>
