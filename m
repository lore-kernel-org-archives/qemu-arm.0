Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09B2D44166
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Dec 2025 10:36:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vU0Va-0005o1-01; Fri, 12 Dec 2025 05:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vU0VM-0005hf-BP
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 05:36:14 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vU0VJ-0003lf-8n
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 05:36:08 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-78ac9f30833so9415297b3.0
 for <qemu-arm@nongnu.org>; Fri, 12 Dec 2025 02:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765535761; x=1766140561; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MVaEqJNoWHJldDXQYgvMqfSKVivAaMUvCAu099xaxUU=;
 b=eek7G3B4VTMWuFaJzC5I+idLr6ynVFadTR4ZK0GoCTDvBR0LiaeVXlghjP52ecFoqQ
 V/wuP7AYYwok+8yzm04ISPstmQnw6k0Rm+fgKXL1gIMWTLUX5SDbnDRfg2/AURh1qL7R
 gpzTF3EwOKXq+9o+pYPayX9MzKKsk3+vY5H9s3H+VVCJBu7J1kU+p0ne35bkxWt6C64v
 v9O8ASurQb9q880U5A+bx30OPi9pUSwReIMZ0vVlw1CU1rk8md6EOAn0uoa+CARdmihD
 xqRHXG1nMOZ7rO7RHBV2X1DiuheZk1cWmcsmDo8Db4vI9JpOp+/zZv2TI5Jt8X9cGYLD
 pVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765535762; x=1766140562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVaEqJNoWHJldDXQYgvMqfSKVivAaMUvCAu099xaxUU=;
 b=eeKZrKmME5JLtkdP+FQAgThtKsscewFfFfz3K8rPGSRQb9E+WulOJExK/0KJM4wExe
 38q8/xxKdQCp0Qkj87AEdNrNx6oBJRv4Ab7Dy4qdSNtG/ceVMkrdll3z1o3GQ2iz70bI
 gier7KCmsdc4XlSfNjE+Gta8j/Z4UFUNm9k7h3QhOBd3mjtK+WS4D6X0pMtN018Ms3Ty
 Nunhd390f60DiucTucGHcBQhGP3pVk19jlGXNK+kES6xby2/uqvpKcDzJ7ai5BmAN5ly
 lJVxWJ9erdBlylBIAVz0v8Kru5gSscfS+xKcxwy+drOGrQeIryiHv9E1tZdmOpGAelI4
 ckOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk9MtmDbxIfHjPddLgi0prgoOnE0RFkLuqyUR6g9mMc4ZvOeE8RkpPWIXbS3NVLNfvtSaD1a4LfQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw2K+M+iKJUJk227PUItr9FqtT/6gkKaf6j3vlDc1eHvRRMMlCX
 P/1u3mlIYdahBRhlknqqhTUE6psF7gjBh8zO7+v4DD9wj1eqeZl5I3I+LtG56wLuUWZWa7I/w4W
 gnRR9S3if0M2BbrypbzrdeCD6rn3vKI0bYv9avb6ruQ==
X-Gm-Gg: AY/fxX6y24G9pA+/kMTRPlIZ9E3gp9HHK/1W633p9U+rLp3DUMd9+cigd//n8aIFHV5
 hK7hJC+Ei/adL40J24UXRvVszfETkzOUUuUk6uhqJ4D4wGRGJnUP2dUSR5LyozJ3YexHd+SfFDZ
 OcNRlxnVmIcfJ8eca3kOj35cRwdml1tylmTkke3qixxDzHqNWKLVGsjvN7NIDTG6AOdn1321lAA
 uNO09AVpqcn/3mPUzK8DtK/YwgBVVaRJkFcryogqA4Uu+dEUG4+1HT3PAktzaioiugvMDXK
X-Google-Smtp-Source: AGHT+IE9uPGbAP8yStN0BATMFYew9/wc1eAKy+mHpEcyndobabsrAZPzxZKiFFQLBPbkumGYbSFGDjmbklPgGZ+BGEc=
X-Received: by 2002:a05:690e:118b:b0:644:4259:9b71 with SMTP id
 956f58d0204a3-64555664c6dmr804284d50.65.1765535761405; Fri, 12 Dec 2025
 02:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
 <20251211234426.2403792-3-pierrick.bouvier@linaro.org>
In-Reply-To: <20251211234426.2403792-3-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Dec 2025 10:35:50 +0000
X-Gm-Features: AQt7F2p9FH6d43ZMGz76b3xLcfzcGgSD-yEbBD0OnN9vSDk-HxrqSMOE0YDa7BM
Message-ID: <CAFEAcA-G0QchOw_zXNwUq3KAAKJZggnpeXkt7ePBAUa1SD1P2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm/ptw: make granule_protection_check usable
 without a cpu
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, 
 Tao Tang <tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 11 Dec 2025 at 23:44, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> By removing cpu details and use a config struct, we can use the
> same granule_protection_check with other devices, like SMMU.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

I'm not 100% sure about this approach, mainly because for SMMU
so far we have taken the route of having its page table
walk implementation be completely separate from the one in
the MMU, even though it's pretty similar: the spec for
CPU page table walk and the one for SMMU page table walk
are technically in different documents and don't necessarily
proceed 100% in sync. Still, the function is a pretty big
one and our other option would probably end up being
copy-and-paste, which isn't very attractive.

So my comments below are minor things.

> ---
>  target/arm/cpu.h | 14 ++++++++++++++
>  target/arm/ptw.c | 41 ++++++++++++++++++++++++-----------------
>  2 files changed, 38 insertions(+), 17 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index efbef0341da..38cc5823a93 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1216,6 +1216,20 @@ void arm_v7m_cpu_do_interrupt(CPUState *cpu);
>
>  hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>                                           MemTxAttrs *attrs);
> +
> +typedef struct ARMGranuleProtectionConfig {
> +    uint64_t gpccr;
> +    uint64_t gptbr;
> +    uint8_t parange;
> +    bool support_sel2;
> +    AddressSpace *as_secure;
> +} ARMGranuleProtectionConfig;
> +
> +bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
> +                                  uint64_t paddress,
> +                                  ARMSecuritySpace pspace,
> +                                  ARMSecuritySpace ss,
> +                                  ARMMMUFaultInfo *fi);

Could we have a doc comment for these prototypes, please?

>  #endif /* !CONFIG_USER_ONLY */
>
>  int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 2e6b149b2d1..2b620b03014 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -330,24 +330,23 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
>      return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
>  }
>
> -static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
> -                                     ARMSecuritySpace pspace,
> -                                     ARMSecuritySpace ss,
> -                                     ARMMMUFaultInfo *fi)
> +bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
> +                                  uint64_t paddress,
> +                                  ARMSecuritySpace pspace,
> +                                  ARMSecuritySpace ss,
> +                                  ARMMMUFaultInfo *fi)
>  {

A comment here noting that we share this function with the SMMU
would probably help us in avoiding inadvertently introducing
CPU-specifics in future.

>      MemTxAttrs attrs = {
>          .secure = true,
>          .space = ARMSS_Root,
>      };
> -    ARMCPU *cpu = env_archcpu(env);
> -    uint64_t gpccr = env->cp15.gpccr_el3;
> +    const uint64_t gpccr = config.gpccr;
>      unsigned pps, pgs, l0gptsz, level = 0;
>      uint64_t tableaddr, pps_mask, align, entry, index;
> -    AddressSpace *as;
>      MemTxResult result;
>      int gpi;
>
> -    if (!FIELD_EX64(gpccr, GPCCR, GPC)) {
> +    if (!FIELD_EX64(config.gpccr, GPCCR, GPC)) {

We just set up the 'gpccr' local so we don't need to change this line,
I think ?

Also, the SMMU's SMMU_ROOT_GPT_BASE_CFG does not have the GPC field
(it keeps its enable bit elsewhere).

>          return true;
>      }
>
> @@ -362,7 +361,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
>       * physical address size is invalid.
>       */
>      pps = FIELD_EX64(gpccr, GPCCR, PPS);
> -    if (pps > FIELD_EX64_IDREG(&cpu->isar, ID_AA64MMFR0, PARANGE)) {
> +    if (pps > config.parange) {
>          goto fault_walk;
>      }
>      pps = pamax_map[pps];
> @@ -432,7 +431,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
>      }
>
>      /* GPC Priority 4: the base address of GPTBR_EL3 exceeds PPS. */
> -    tableaddr = env->cp15.gptbr_el3 << 12;
> +    tableaddr = config.gptbr << 12;
>      if (tableaddr & ~pps_mask) {
>          goto fault_size;
>      }
> @@ -446,12 +445,10 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
>      align = MAKE_64BIT_MASK(0, align);
>      tableaddr &= ~align;
>
> -    as = arm_addressspace(env_cpu(env), attrs);
> -
>      /* Level 0 lookup. */
>      index = extract64(paddress, l0gptsz, pps - l0gptsz);
>      tableaddr += index * 8;
> -    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
> +    entry = address_space_ldq_le(config.as_secure, tableaddr, attrs, &result);

as_secure is an odd name for the AS here, because architecturally
GPT walks are done to the Root physical address space. (This is
why in the current code we set attrs.space to ARMSS_Root and then
get the QEMU AddressSpace corresponding to those attrs. It happens
that at the moment that's the same one we use as Secure, but in
theory we could have 4 completely separate ones for NS, S, Root
and Realm.)

>      if (result != MEMTX_OK) {
>          goto fault_eabt;
>      }
> @@ -479,7 +476,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
>      level = 1;
>      index = extract64(paddress, pgs + 4, l0gptsz - pgs - 4);
>      tableaddr += index * 8;
> -    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
> +    entry = address_space_ldq_le(config.as_secure, tableaddr, attrs, &result);
>      if (result != MEMTX_OK) {
>          goto fault_eabt;
>      }
> @@ -513,7 +510,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
>      case 0b1111: /* all access */
>          return true;
>      case 0b1000: /* secure */
> -        if (!cpu_isar_feature(aa64_sel2, cpu)) {
> +        if (!config.support_sel2) {
>              goto fault_walk;
>          }
>          /* fall through */
> @@ -3786,8 +3783,18 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
>                              memop, result, fi)) {
>          return true;
>      }
> -    if (!granule_protection_check(env, result->f.phys_addr,
> -                                  result->f.attrs.space, ptw->in_space, fi)) {
> +
> +    ARMCPU *cpu = env_archcpu(env);
> +    struct ARMGranuleProtectionConfig gpc = {
> +        .gpccr = env->cp15.gpccr_el3,
> +        .gptbr = env->cp15.gptbr_el3,
> +        .parange = FIELD_EX64_IDREG(&cpu->isar, ID_AA64MMFR0, PARANGE),
> +        .support_sel2 = cpu_isar_feature(aa64_sel2, cpu),
> +        .as_secure = cpu_get_address_space(env_cpu(env), ARMASIdx_S)

Directly coding ARMASIDx_S here is a bit awkward, as noted above.

> +    };
> +    if (!arm_granule_protection_check(gpc, result->f.phys_addr,
> +                                      result->f.attrs.space, ptw->in_space,
> +                                      fi)) {
>          fi->type = ARMFault_GPCFOnOutput;
>          return true;
>      }

thanks
-- PMM

