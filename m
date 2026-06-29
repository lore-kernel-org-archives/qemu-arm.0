Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D72C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 15:23:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weDpM-0004wm-Bn; Mon, 29 Jun 2026 11:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weDpK-0004w7-JR
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 11:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weDpH-0007PT-M0
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 11:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782746589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KX4WcMK6qkAAJpmACg5pEQPqjB5wz6DqG9Y0zwaIVEs=;
 b=hPIsovtJE9nQjPHQAjq4DlhypD5DZHl5xsQhAxOyLvKJ0daw0mUl3/DHuNyjq1+9gX91cz
 8u7b5jRbPZbTBdH5Xv3qHcPrcMeWLgdOmp6JR7bHFJnRgcbrLidZzbQRz71lcEx7h/fRtD
 SpQr0I3Y4ySu+CqImSjfobaFK3lNC3M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-POdIQ5hoNHGx2a61Bzf_jA-1; Mon, 29 Jun 2026 11:23:07 -0400
X-MC-Unique: POdIQ5hoNHGx2a61Bzf_jA-1
X-Mimecast-MFC-AGG-ID: POdIQ5hoNHGx2a61Bzf_jA_1782746587
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-46fd6d94a8dso1087190f8f.2
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 08:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782746586; x=1783351386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KX4WcMK6qkAAJpmACg5pEQPqjB5wz6DqG9Y0zwaIVEs=;
 b=EJWpp7q16aIvKeA4acRgESEhEaurIUzCHE2z22BYtQBJpOG9tLVq0uAe3W6lNcoNZr
 WAeMZWNON5ugeFBfLdaNSKGc3B2F7IkNbtPqbHQPXtncGm+KuBglVUScmXsM4Xs9JBOI
 SAlgMQeyiyabb+/a1AWaRMUk+ApOGih+jM4oTL2Lx0jAz72kCWqqeF+QroXUhwSEMobJ
 hMYC+XveD5bfSpW/BzBLduQ7kRTJ+5j6/HIspir8yTc0Zgm4+vCGkhOEFa03uW2VMicN
 xJpuAAWqNB7ZIHNBN8TTsScsj5LqYFyYpPM3OJtI9oEfZhBwYII5V4BI0hlK52ddUBUT
 POlQ==
X-Gm-Message-State: AOJu0YzJu8xKlmozvqhu1qrF6aeR2A0B/liUzTGk+wEJ9deRj8hMiBbx
 GKaO25s1xnUB1PkPS6Pum7dI/1mKu+RSrIKyJeZxu4oR2SjXqiXgBcWlZ210CxM66oUzpmEC61q
 sLTHVmveq1brMSIeuVi3nY3DXlMCmq8Jfd1sm0sUxYSSImUs+uQYDvg==
X-Gm-Gg: AfdE7cmHvL706IBvD5oLJGNOPSlFqgOx051BtluE7nnDV8rkSWugX31vdqazMYBCWfr
 P5bfLfYAgTPvRU8KUWdq275JnRJUwK1pmwNZFV4h9LwORToigv4gznLqXKFgfz35o2KgFf+ZUZz
 PIQk3xD2y9PdFZQS+QmOvUkGwrGpT4LT5QlAAZStBAHLvDJFBYhTyNtJmqCuj/20hyBqFm3Y/BP
 Er+ppXTmhfkaAUCHg/3a9JLNvD0qP0adgoi9M90QbeKlHPs46j90c9ZqSMAUEJGklApfTUUHn/c
 tka5wGyhcXGAUIuIaqrvwHzr4O1P2uUmS9ggsqdgtTf0bcgoqAU0vUHIDmaQA89I7upzM7djBIL
 6GasiWPclcAlV341Anb4k0zf7zVzw9yZ91tn42D88ZzcJxCWPh3Uorg==
X-Received: by 2002:a05:600c:46d2:b0:490:bd66:e523 with SMTP id
 5b1f17b1804b1-493b82b1f2fmr2015215e9.20.1782746586277; 
 Mon, 29 Jun 2026 08:23:06 -0700 (PDT)
X-Received: by 2002:a05:600c:46d2:b0:490:bd66:e523 with SMTP id
 5b1f17b1804b1-493b82b1f2fmr2014545e9.20.1782746585687; 
 Mon, 29 Jun 2026 08:23:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b76e03b9sm13383455e9.3.2026.06.29.08.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 08:23:05 -0700 (PDT)
Message-ID: <aa1f8006-4665-4fcd-b8ee-5b90cd53e953@redhat.com>
Date: Mon, 29 Jun 2026 17:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm: handle CCSIDR_EL1 as a demuxed register
To: Sebastian Ott <sebott@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260622135627.40573-1-sebott@redhat.com>
 <20260622135627.40573-3-sebott@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260622135627.40573-3-sebott@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LCsaO-X_uUeRIvMaaL22eS5seh-eGPVXQitZNTBhDLE_1782746587
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Sebastian,

On 6/22/26 3:56 PM, Sebastian Ott wrote:
> From: Cornelia Huck <cohuck@redhat.com>
> 
> Move handling of CCSIDR_EL1 over to the new *_IDREG_DEMUX
> infrastructure.
> 
> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>  hw/arm/virt.c                 | 23 ++++++------
>  hw/intc/armv7m_nvic.c         |  2 +-
>  target/arm/cpu-max.c          |  6 ++--
>  target/arm/cpu-sysregs.h.inc  |  1 +
>  target/arm/cpu.h              |  6 ----
>  target/arm/cpu64.c            |  6 ++--
>  target/arm/helper.c           |  2 +-
>  target/arm/tcg/cpu32-system.c | 26 +++++++-------
>  target/arm/tcg/cpu64.c        | 68 +++++++++++++++++------------------
>  9 files changed, 68 insertions(+), 72 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d8d27f2ef6..ab2b566e69 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -307,21 +307,22 @@ void set_cpu_cache(CPUCoreCaches *cpu_cache, enum CacheType cache_type,
>  
I think you would gain in readibility to use a local variable
ccsdir = GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index);
>      if (ccidx) {
>          *cpu_cache = (CPUCoreCaches){
> -            .linesize = 1 << (FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
> -                                         CCIDX_LINESIZE) + 4),
> -            .associativity = FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
> -                                        CCIDX_ASSOCIATIVITY) + 1,
> -            .sets = FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
> -                               CCIDX_NUMSETS) + 1,
> +            .linesize = 1 << (FIELD_EX64(GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index),
> +                                         CCSIDR_EL1, CCIDX_LINESIZE) + 4),
> +            .associativity = FIELD_EX64(GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index),
> +                                        CCSIDR_EL1, CCIDX_ASSOCIATIVITY) + 1,
> +            .sets = FIELD_EX64(GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index),
> +                               CCSIDR_EL1, CCIDX_NUMSETS) + 1,
>          };
>      } else {
>          *cpu_cache = (CPUCoreCaches){
> -            .linesize = 1 << (FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
> -                                         LINESIZE) + 4),
> -            .associativity = FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1,
> -                                        ASSOCIATIVITY) + 1,
> +            .linesize = 1 << (FIELD_EX64(GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index),
> +                                         CCSIDR_EL1, LINESIZE) + 4),
> +            .associativity = FIELD_EX64(GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index),
> +                                        CCSIDR_EL1, ASSOCIATIVITY) + 1,
>              .sets =
> -                FIELD_EX64(armcpu->ccsidr[bank_index], CCSIDR_EL1, NUMSETS) + 1,
> +                FIELD_EX64(GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index),
> +                           CCSIDR_EL1, NUMSETS) + 1,
>          };
>      }
>      cpu_cache->type = cache_type;
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index a7651f831e..5dd867242b 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1360,7 +1360,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
>      case 0xd80: /* CSSIDR */
>      {
>          int idx = cpu->env.v7m.csselr[attrs.secure] & R_V7M_CSSELR_INDEX_MASK;
> -        return cpu->ccsidr[idx];
> +        return GET_IDREG_DEMUX(&cpu->isar, CCSIDR_EL1, idx);
>      }
>      case 0xd84: /* CSSELR */
>          return cpu->env.v7m.csselr[attrs.secure];
> diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
> index d38bdfcf81..d2f69b6bcf 100644
> --- a/target/arm/cpu-max.c
> +++ b/target/arm/cpu-max.c
> @@ -72,11 +72,11 @@ void aarch64_aa32_a57_init(Object *obj, bool aa32_only)
>      cpu->isar.reset_pmcr_el0 = 0x41013000;
>      SET_IDREG(isar, CLIDR, 0x0a200023);
>      /* 32KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
>      /* 48KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2));
>      /* 2048KB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7));
>      if (aarch64_enabled) {
>          set_dczid_bs(cpu, 4); /* 64 bytes */
>          cpu->gic_num_lrs = 4;
> diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
> index 6e8b335b8f..d9e058a57e 100644
> --- a/target/arm/cpu-sysregs.h.inc
> +++ b/target/arm/cpu-sysregs.h.inc
> @@ -39,6 +39,7 @@ DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
>  DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
>  DEF(ID_DFR1_EL1, 3, 0, 0, 3, 5)
>  DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
> +DEF_MUX(CCSIDR_EL1, 3, 1, 0, 0, 0, 16)
As I mentionned earlier, if this file were to be generated at some
point, I don't see how I can infer the size of the muxed register from
the AARCHMRS.

Nevertheless I can move this definition somewhere else later and I think
this shall not be a blocker for this series

Also I wonder if 16 is enough (although it is the current size in
ArchCPU). In the future might end up = 8 levels x Ind 2 value x 2 value
TnD = 32

May be Tnd is not featured yet because it is relevant if FEAT_MTE2 is
supported.

>  DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
>  DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
>  DEF(CTR_EL0, 3, 3, 0, 0, 1)
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fe0046b02e..437e72d475 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1121,10 +1121,6 @@ struct ArchCPU {
>      uint64_t pmceid0;
>      uint64_t pmceid1;
>      uint64_t mp_affinity; /* MP ID without feature bits */
> -    /* The elements of this array are the CCSIDR values for each cache,
> -     * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
> -     */
> -    uint64_t ccsidr[16];
>      uint64_t reset_cbar;
>      uint32_t reset_auxcr;
>      bool reset_hivecs;
> @@ -2132,8 +2128,6 @@ FIELD(MFAR, FPA, 12, 40)
>  FIELD(MFAR, NSE, 62, 1)
>  FIELD(MFAR, NS, 63, 1)
>  
> -QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
> -
>  /* If adding a feature bit which corresponds to a Linux ELF
>   * HWCAP bit, remember to update the feature-bit-to-hwcap
>   * mapping in linux-user/elfload.c:get_elf_hwcap().
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 48a0421674..9bcef81dce 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -748,11 +748,11 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->isar.reset_pmcr_el0 = 0x41033000;
>      SET_IDREG(isar, CLIDR, 0x0a200023);
>      /* 32KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
>      /* 32KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 1, 64, 32 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 1, 64, 32 * KiB, 2));
>      /* 1024KB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7));
>      set_dczid_bs(cpu, 4); /* 64 bytes */
>      cpu->gic_num_lrs = 4;
>      cpu->gic_vpribits = 5;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a234aa031c..4bc616fff5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -873,7 +873,7 @@ static uint64_t ccsidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      uint32_t index = A32_BANKED_REG_GET(env, csselr,
>                                          ri->secure & ARM_CP_SECSTATE_S);
>  
> -    return cpu->ccsidr[index];
> +    return GET_IDREG_DEMUX(&cpu->isar, CCSIDR_EL1, index);
>  }
>  
>  static void csselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> diff --git a/target/arm/tcg/cpu32-system.c b/target/arm/tcg/cpu32-system.c
> index 6e98390089..f00c996db3 100644
> --- a/target/arm/tcg/cpu32-system.c
> +++ b/target/arm/tcg/cpu32-system.c
> @@ -270,9 +270,9 @@ static void cortex_a8_initfn(Object *obj)
>      SET_IDREG(isar, ID_ISAR4, 0x00111142);
>      cpu->isar.dbgdidr = 0x15141000;
>      SET_IDREG(isar, CLIDR, (1 << 27) | (2 << 24) | 3);
> -    cpu->ccsidr[0] = 0xe007e01a; /* 16k L1 dcache. */
> -    cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
> -    cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0xe007e01a); /* 16k L1 dcache. */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x2007e01a); /* 16k L1 icache. */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, 0xf0000000); /* No L2 icache. */
>      cpu->reset_auxcr = 2;
>      cpu->isar.reset_pmcr_el0 = 0x41002000;
>      define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
> @@ -346,8 +346,8 @@ static void cortex_a9_initfn(Object *obj)
>      SET_IDREG(isar, ID_ISAR4, 0x00111142);
>      cpu->isar.dbgdidr = 0x35141000;
>      SET_IDREG(isar, CLIDR, (1 << 27) | (1 << 24) | 3);
> -    cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
> -    cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0xe00fe019); /* 16k L1 dcache. */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x200fe019); /* 16k L1 icache. */
>      cpu->isar.reset_pmcr_el0 = 0x41093000;
>      define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
>  }
> @@ -418,9 +418,9 @@ static void cortex_a7_initfn(Object *obj)
>      cpu->isar.dbgdevid = 0x01110f13;
>      cpu->isar.dbgdevid1 = 0x1;
>      SET_IDREG(isar, CLIDR, 0x0a200023);
> -    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
> -    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
> -    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0x701fe00a); /* 32K L1 dcache */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x201fe00a); /* 32K L1 icache */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, 0x711fe07a); /* 4096K L2 unified cache */
>      cpu->isar.reset_pmcr_el0 = 0x41072000;
>      define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
>  }
> @@ -466,9 +466,9 @@ static void cortex_a15_initfn(Object *obj)
>      cpu->isar.dbgdevid = 0x01110f13;
>      cpu->isar.dbgdevid1 = 0x0;
>      SET_IDREG(isar, CLIDR, 0x0a200023);
> -    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
> -    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
> -    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0x701fe00a); /* 32K L1 dcache */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x201fe00a); /* 32K L1 icache */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, 0x711fe07a); /* 4096K L2 unified cache */
>      cpu->isar.reset_pmcr_el0 = 0x410F3000;
>      define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
>  }
> @@ -657,8 +657,8 @@ static void cortex_r52_initfn(Object *obj)
>      SET_IDREG(isar, ID_ISAR5, 0x00010001);
>      cpu->isar.dbgdidr = 0x77168000;
>      SET_IDREG(isar, CLIDR, (1 << 27) | (1 << 24) | 0x3);
> -    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
> -    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, 0x700fe01a); /* 32KB L1 dcache */
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, 0x201fe00a); /* 32KB L1 icache */
>  
>      cpu->pmsav7_dregion = 16;
>      cpu->pmsav8r_hdregion = 16;
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index f7a920a202..1d6e0362b1 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -82,11 +82,11 @@ static void aarch64_a35_initfn(Object *obj)
>  
>      /* From B2.29 Cache ID registers */
>      /* 32KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
>      /* 32KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2));
>      /* 512KB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7));
>  
>      /* From B3.5 VGIC Type register */
>      cpu->gic_num_lrs = 4;
> @@ -250,11 +250,11 @@ static void aarch64_a55_initfn(Object *obj)
>  
>      /* From B2.23 CCSIDR_EL1 */
>      /* 32KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
>      /* 32KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 2));
>      /* 512KB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 512 * KiB, 7));
>  
>      /* From B2.96 SCTLR_EL3 */
>      cpu->reset_sctlr = 0x30c50838;
> @@ -320,11 +320,11 @@ static void aarch64_a72_initfn(Object *obj)
>      cpu->isar.reset_pmcr_el0 = 0x41023000;
>      SET_IDREG(isar, CLIDR, 0x0a200023);
>      /* 32KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7));
>      /* 48KB L1 dcache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2));
>      /* 1MB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 1 * MiB, 7));
>      set_dczid_bs(cpu, 4); /* 64 bytes */
>      cpu->gic_num_lrs = 4;
>      cpu->gic_vpribits = 5;
> @@ -383,11 +383,11 @@ static void aarch64_a76_initfn(Object *obj)
>  
>      /* From B2.18 CCSIDR_EL1 */
>      /* 64KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7));
>      /* 64KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2));
>      /* 512KB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7));
>  
>      /* From B2.93 SCTLR_EL3 */
>      cpu->reset_sctlr = 0x30c50838;
> @@ -455,11 +455,11 @@ static void aarch64_a78ae_initfn(Object *obj)
>  
>      /* From 3.2.33 CCSIDR_EL1 */
>      /* 64KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7));
>      /* 64KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2));
>      /* 512KB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 512 * KiB, 7));
>  
>      /* From 3.2.118 SCTLR_EL3 */
>      cpu->reset_sctlr = 0x30c50838;
> @@ -512,11 +512,11 @@ static void aarch64_a64fx_initfn(Object *obj)
>      SET_IDREG(isar, ID_AA64ZFR0, 0x0000000000000000);
>      SET_IDREG(isar, CLIDR, 0x0000000080000023);
>      /* 64KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 7));
>      /* 64KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 2));
>      /* 8MB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 256, 8 * MiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 256, 8 * MiB, 7));
>      set_dczid_bs(cpu, 6); /* 256 bytes */
>      cpu->gic_num_lrs = 4;
>      cpu->gic_vpribits = 5;
> @@ -704,11 +704,11 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>  
>      /* From B2.23 CCSIDR_EL1 */
>      /* 64KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7));
>      /* 64KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2));
>      /* 1MB L2 dcache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7));
>  
>      /* From B2.98 SCTLR_EL3 */
>      cpu->reset_sctlr = 0x30c50838;
> @@ -792,11 +792,11 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>       * L3: No L3 (this matches the CLIDR_EL1 value).
>       */
>      /* 64KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
>      /* 64KB L1 icache */
> -    cpu->ccsidr[1] = cpu->ccsidr[0];
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
>      /* 1MB L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 1 * MiB, 0);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 1 * MiB, 0));
>  
>      /* From 3.2.115 SCTLR_EL3 */
>      cpu->reset_sctlr = 0x30c50838;
> @@ -1034,11 +1034,11 @@ static void aarch64_a710_initfn(Object *obj)
>       * L2: 8-way set associative 64 byte line size, total either 256K or 512K.
>       */
>      /* L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
>      /* L1 icache */
> -    cpu->ccsidr[1] = cpu->ccsidr[0];
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
>      /* L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0));
>  
>      /* FIXME: Not documented -- copied from neoverse-v1 */
>      cpu->reset_sctlr = 0x30c50838;
> @@ -1136,11 +1136,11 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>       * L2: 8-way set associative 64 byte line size, total either 512K or 1024K.
>       */
>      /* L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
>      /* L1 icache */
> -    cpu->ccsidr[1] = cpu->ccsidr[0];
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_CCIDX, 4, 64, 64 * KiB, 0));
>      /* L2 cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_CCIDX, 8, 64, 512 * KiB, 0));
>      /* FIXME: Not documented -- copied from neoverse-v1 */
>      cpu->reset_sctlr = 0x30c50838;
>  
> @@ -1169,13 +1169,13 @@ void aarch64_max_tcg_initfn(Object *obj)
>  
>      SET_IDREG(isar, CLIDR, 0x8200123);
>      /* 64KB L1 dcache */
> -    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 0, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7));
>      /* 64KB L1 icache */
> -    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 1, make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2));
>      /* 1MB L2 unified cache */
> -    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 2, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7));
>      /* 2MB L3 unified cache */
> -    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
> +    SET_IDREG_DEMUX(isar, CCSIDR_EL1, 4, make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7));
>  
>      /*
>       * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default

Thanks

Eric


