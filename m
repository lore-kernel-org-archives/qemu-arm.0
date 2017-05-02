Received: by 10.25.0.198 with SMTP id 189csp516071lfa;
        Tue, 2 May 2017 15:24:40 -0700 (PDT)
X-Received: by 10.202.79.81 with SMTP id d78mr11166813oib.77.1493763880696;
        Tue, 02 May 2017 15:24:40 -0700 (PDT)
Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com. [2607:f8b0:4003:c06::241])
        by mx.google.com with ESMTPS id s17si1290484oie.298.2017.05.02.15.24.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2017 15:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) client-ip=2607:f8b0:4003:c06::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=alistair23@gmail.com
Received: by mail-oi0-x241.google.com with SMTP id w10so3175667oif.1;
        Tue, 02 May 2017 15:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=mh42v6jejM/RJ8x650tNUsUhP7uSWcs0/mC2u8CCEtk=;
        b=HrX9F4FCo3vPlNLtVg2v6B8IJ9YRDWopq16rzjdKo3e1IU9nNW4CzUX4FNSSJ7+wEJ
         vLw4HeIrEqtqkMF7fffLSv03GX6CPfPmVrelFPWg1UQTqbu2UK4D6N1XzEOgyDP3rruf
         90EkwWM33YnLMO+iSOSc+/HOMCTkRxI2ChnSbeIRKWCX6sKxSDyg7MvNphm7gqXBajmI
         yWk4SVg0PLJBxjpEqS9ubpPp2nLh5dsxFfHsQiiNNXvVAKF8ZJ1wYHkdnEoz/1GcwPML
         ktv/RDTRoBQEt0dW2dRKWZwku4Py+ZSq3vkKU6p5HRE8pEs3BiHdzmniov6966+c5Y/j
         NyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=mh42v6jejM/RJ8x650tNUsUhP7uSWcs0/mC2u8CCEtk=;
        b=YmcDjTyQVZHSao6VzURRdV5BR92ilkokWl/gcJq9zU/vLgz1SYVtyZE82ZVdI80qv6
         FjGyP9nGz/22CJvzsAHsOQrDG06ADWQcbeiYq8SqRPvn7pDZPlV8WPPHNMRNVya7cF0P
         svKTxc7Hw8pxevouJ+lv/JGact0XbeE/5oNqSZCkWhs7eDC6f9/i/OxwZviySDbpCCNo
         2NpMfHCHCTc6rtAtLvB/FvcpJsE7gwXJjsdcaE0o8qEkP5vGBvWhkHKwWROXlUNNfcIp
         udIJtF8FPvEn178BUTLepyAt/A2vEd8NWbALKqMRtvsMJKfzd0v79KVGbuu978JgqPzJ
         KXnA==
X-Gm-Message-State: AN3rC/59a6mm/2F1P2jeV4sN4v6Pe5N6Fs+f7g5wmIWFbuABNyFkk1sT
	eEsrNRPEUFkej1OQNsDfZYrCqsOBwA==
X-Received: by 10.202.104.36 with SMTP id d36mr3445223oic.61.1493763880021;
 Tue, 02 May 2017 15:24:40 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.72.162 with HTTP; Tue, 2 May 2017 15:24:09 -0700 (PDT)
In-Reply-To: <1493122030-32191-5-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org> <1493122030-32191-5-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 2 May 2017 15:24:09 -0700
X-Google-Sender-Auth: wAkg3Enq9e1NwGyyHiAbmer86EA
Message-ID: <CAKmqyKOC5oCGK6aenNbUXsFvw8vY7BAatyx2z_jf=yPuMGzjDg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 04/13] arm: Clean up handling of no-MPU PMSA CPUs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@xilinx.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: yeGBghgYGIkd

On Tue, Apr 25, 2017 at 5:07 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
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

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

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
> --
> 2.7.4
>
>
