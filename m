Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1773155ejb;
        Sat, 3 Jun 2023 05:51:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7IMZr5Suj75O4b+Tf81VDnvp1vt1hHw+TM59rOwXl7GcWkybWsnsVroLxNc1nIZx9blVAZ
X-Received: by 2002:a05:620a:628e:b0:75b:23a0:d9d0 with SMTP id ov14-20020a05620a628e00b0075b23a0d9d0mr15705409qkn.38.1685796704474;
        Sat, 03 Jun 2023 05:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685796704; cv=none;
        d=google.com; s=arc-20160816;
        b=xq3IiMYZj6ISC9e7m9so8WRyypyDJrB6m72SKI6vIu69AcioVPUXULJ23SL3aohb8z
         2KbCdiw1qrXu67LzCFqR1fdccQDqVbCiMy2hqDyiMLvgPE/B9vSFuaekE+lTdW5ncAnG
         VTL5RIVyo8BGFCUwVUPs2n32/IhicL9O1Rt0f6ZIYmf9fMfRTy4cECkvFa6ofJmzhz9w
         jJlGtFJeEB8Bnanv/zd74o9887TF/4CwB6DG3TULQAC3ZqMwgew+v23YXUvEIFBjMTAF
         WaMDLTyXQ5vlCKPHm2VBKjUSejG8lY5O4lQUTG7V/leUVVUvVL2OIBc/5Rb2kc4JPEPy
         51Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0BWNRta43Li56orIxV5TypQjiem3i6EZqRnDd2Trssg=;
        b=J56uD8Rv8YnTqdLp8yczEHLSPMGmfmpZCxHPUgLAhbdM4gTnGt1D86mCcpnP3mGEEA
         hj2vYP13MPCvuMeXJ0Cja0iwhxJQAmabmSDKrLN2e5XKhQwSU0ceuRZ2ifxHLnt1/1aZ
         S5jh0k2SRsBAyGoszOpOwXbsHNEoibbgFsCAxrYIy0HuZzPkkGT2G0XdvOIGC8JsGO58
         mclpBFsNRxhmJEFsCaEkBoD3qmWGEU7YgPQUm9ShhZu1STeYIQoP5xOvp+6JHcwK8Q9K
         NrnE+/o6n1i0ESTPVegDw8zr2G8HGHwEjKmiXyq9MBEGBLgf/2zwilGbxXEszw8BYXxZ
         CF4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TxymzFLd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a20c100b0075afaac62e8si2115515qka.131.2023.06.03.05.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 05:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TxymzFLd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5Qit-0007nB-TF; Sat, 03 Jun 2023 08:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5Qis-0007mq-7m; Sat, 03 Jun 2023 08:51:10 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5Qiq-0005ZV-7j; Sat, 03 Jun 2023 08:51:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEBBC61219;
 Sat,  3 Jun 2023 12:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F0AC4339C;
 Sat,  3 Jun 2023 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685796665;
 bh=GSzEzDMmuKLzXqH9BVq8DnkG1I1tmgD1F05rPfJcObc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TxymzFLdsnsHyU3Jp/n6dXIuY57w1Evkc1NMM/U4t3NFArHIjNV4w9pnA28eIgMaD
 /FTEXHwsKBPcUDFKvVolvGeqlgL5Ku00yjUG5br9AizHTbX0McP+r0hT1QkpsAzs6/
 qYhTkFeZR1X+Rwbnowfz5wSAmOM5CZSpJAcSqlBzGafC6pFJ5jFA7KqRcvNeMJ13UW
 NnQ/J4bG5cjd9aAlyxMCTpY+DHUOb7sGHCcg7DEl6BZ6RvR30rapAJyuU8pLVIgDQC
 asAbntoCs71asi4jDWHt/llWBF2s3oNDTpPppgss4/ZpLwcOSjCgjfzrnjy4FmJptl
 h+drinxImbsRQ==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2b1a86cdec6so30599321fa.3; 
 Sat, 03 Jun 2023 05:51:04 -0700 (PDT)
X-Gm-Message-State: AC+VfDyVWdEp4KpregzOiip5YAfq0PRGcCM2LTfdZCWSF4UiGXVN2CML
 W5xSYdCkdY33OvfFO0Xgavnf923j6Wvv6ZWRor8=
X-Received: by 2002:a2e:a170:0:b0:2ad:af50:6ecb with SMTP id
 u16-20020a2ea170000000b002adaf506ecbmr1656786ljl.14.1685796663042; Sat, 03
 Jun 2023 05:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <20230603023426.1064431-32-richard.henderson@linaro.org>
In-Reply-To: <20230603023426.1064431-32-richard.henderson@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 Jun 2023 14:50:52 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE5SKJS9YRuV6H3z84JvSMHDBkFWVuue8yMyYVK7TVkSw@mail.gmail.com>
Message-ID: <CAMj1kXE5SKJS9YRuV6H3z84JvSMHDBkFWVuue8yMyYVK7TVkSw@mail.gmail.com>
Subject: Re: [PATCH 31/35] host/include/aarch64: Implement aes-round.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.157,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: MARHV57DQ5B9

On Sat, 3 Jun 2023 at 04:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Detect AES in cpuinfo; implement the accel hooks.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  host/include/aarch64/host/aes-round.h | 204 ++++++++++++++++++++++++++
>  host/include/aarch64/host/cpuinfo.h   |   1 +
>  util/cpuinfo-aarch64.c                |   2 +
>  3 files changed, 207 insertions(+)
>  create mode 100644 host/include/aarch64/host/aes-round.h
>
> diff --git a/host/include/aarch64/host/aes-round.h b/host/include/aarch64/host/aes-round.h
> new file mode 100644
> index 0000000000..27ca823db6
> --- /dev/null
> +++ b/host/include/aarch64/host/aes-round.h
> @@ -0,0 +1,204 @@
> +/*
> + * AArch64 specific aes acceleration.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HOST_AES_ROUND_H
> +#define HOST_AES_ROUND_H
> +
> +#include "host/cpuinfo.h"
> +#include <arm_neon.h>
> +
> +#ifdef __ARM_FEATURE_AES
> +# define HAVE_AES_ACCEL  true
> +# define ATTR_AES_ACCEL
> +#else
> +# define HAVE_AES_ACCEL  likely(cpuinfo & CPUINFO_AES)
> +# define ATTR_AES_ACCEL  __attribute__((target("+crypto")))
> +#endif
> +
> +static inline uint8x16_t aes_accel_bswap(uint8x16_t x)
> +{
> +    /* No arm_neon.h primitive, and the compilers don't share builtins. */

vqtbl1q_u8() perhaps?

> +#ifdef __clang__
> +    return __builtin_shufflevector(x, x, 15, 14, 13, 12, 11, 10, 9, 8,
> +                                   7, 6, 5, 4, 3, 2, 1, 0);
> +#else
> +    return __builtin_shuffle(x, (uint8x16_t)
> +                             { 15, 14, 13, 12, 11, 10, 9, 8,
> +                               7,  6,  5,  4,  3,   2, 1, 0, });
> +#endif
> +}
> +
> +/*
> + * Through clang 15, the aes inlines are only defined if __ARM_FEATURE_AES;
> + * one cannot use __attribute__((target)) to make them appear after the fact.
> + * Therefore we must fallback to inline asm.
> + */
> +#ifdef __ARM_FEATURE_AES
> +# define aes_accel_aesd   vaesdq_u8
> +# define aes_accel_aese   vaeseq_u8
> +# define aes_accel_aesmc  vaesmcq_u8
> +# define aes_accel_aesimc vaesimcq_u8
> +#else
> +static inline uint8x16_t aes_accel_aesd(uint8x16_t d, uint8x16_t k)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aesd %0.16b, %1.16b" : "+w"(d) : "w"(k));
> +    return d;
> +}
> +
> +static inline uint8x16_t aes_accel_aese(uint8x16_t d, uint8x16_t k)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aese %0.16b, %1.16b" : "+w"(d) : "w"(k));
> +    return d;
> +}
> +
> +static inline uint8x16_t aes_accel_aesmc(uint8x16_t d)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aesmc %0.16b, %1.16b" : "=w"(d) : "w"(d));


Most ARM cores fuse aese/aesmc into a single uop (with the associated
performance boost) if the pattern is

aese x, y
aesmc x,x

aesd x, y
aesimc x,x

So it might make sense to use +w here at least, and use only a single
register (which the compiler will likely do in any case, but still)

I would assume that the compiler cannot issue these separately based
on the sequences below, but if it might, it may be worth it to emit
the aese/aesmc together in a single asm() block

> +    return d;
> +}
> +
> +static inline uint8x16_t aes_accel_aesimc(uint8x16_t d)
> +{
> +    asm(".arch_extension aes\n\t"
> +        "aesimc %0.16b, %1.16b" : "=w"(d) : "w"(d));
> +    return d;
> +}
> +#endif /* __ARM_FEATURE_AES */
> +
> +static inline void ATTR_AES_ACCEL
> +aesenc_MC_accel(AESState *ret, const AESState *st, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aesmc(t);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesmc(t);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesenc_SB_SR_accel(AESState *ret, const AESState *st, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aese(t, z);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aese(t, z);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesenc_SB_SR_MC_AK_accel(AESState *ret, const AESState *st,
> +                         const AESState *rk, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t k = (uint8x16_t)rk->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        k = aes_accel_bswap(k);
> +        t = aes_accel_aese(t, z);
> +        t = aes_accel_aesmc(t);
> +        t = veorq_u8(t, k);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aese(t, z);
> +        t = aes_accel_aesmc(t);
> +        t = veorq_u8(t, k);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesdec_IMC_accel(AESState *ret, const AESState *st, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aesimc(t);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesimc(t);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesdec_ISB_ISR_accel(AESState *ret, const AESState *st, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        t = aes_accel_aesd(t, z);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesd(t, z);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesdec_ISB_ISR_AK_IMC_accel(AESState *ret, const AESState *st,
> +                            const AESState *rk, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t k = (uint8x16_t)rk->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        k = aes_accel_bswap(k);
> +        t = aes_accel_aesd(t, z);
> +        t = veorq_u8(t, k);
> +        t = aes_accel_aesimc(t);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesd(t, z);
> +        t = veorq_u8(t, k);
> +        t = aes_accel_aesimc(t);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +static inline void ATTR_AES_ACCEL
> +aesdec_ISB_ISR_IMC_AK_accel(AESState *ret, const AESState *st,
> +                            const AESState *rk, bool be)
> +{
> +    uint8x16_t t = (uint8x16_t)st->v;
> +    uint8x16_t k = (uint8x16_t)rk->v;
> +    uint8x16_t z = { };
> +
> +    if (be) {
> +        t = aes_accel_bswap(t);
> +        k = aes_accel_bswap(k);
> +        t = aes_accel_aesd(t, z);
> +        t = aes_accel_aesimc(t);
> +        t = veorq_u8(t, k);
> +        t = aes_accel_bswap(t);
> +    } else {
> +        t = aes_accel_aesd(t, z);
> +        t = aes_accel_aesimc(t);
> +        t = veorq_u8(t, k);
> +    }
> +    ret->v = (AESStateVec)t;
> +}
> +
> +#endif
> diff --git a/host/include/aarch64/host/cpuinfo.h b/host/include/aarch64/host/cpuinfo.h
> index 82227890b4..05feeb4f43 100644
> --- a/host/include/aarch64/host/cpuinfo.h
> +++ b/host/include/aarch64/host/cpuinfo.h
> @@ -9,6 +9,7 @@
>  #define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
>  #define CPUINFO_LSE             (1u << 1)
>  #define CPUINFO_LSE2            (1u << 2)
> +#define CPUINFO_AES             (1u << 3)
>
>  /* Initialized with a constructor. */
>  extern unsigned cpuinfo;
> diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
> index f99acb7884..ababc39550 100644
> --- a/util/cpuinfo-aarch64.c
> +++ b/util/cpuinfo-aarch64.c
> @@ -56,10 +56,12 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
>      unsigned long hwcap = qemu_getauxval(AT_HWCAP);
>      info |= (hwcap & HWCAP_ATOMICS ? CPUINFO_LSE : 0);
>      info |= (hwcap & HWCAP_USCAT ? CPUINFO_LSE2 : 0);
> +    info |= (hwcap & HWCAP_AES ? CPUINFO_AES: 0);
>  #endif
>  #ifdef CONFIG_DARWIN
>      info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;
>      info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE2") * CPUINFO_LSE2;
> +    info |= sysctl_for_bool("hw.optional.arm.FEAT_AES") * CPUINFO_AES;
>  #endif
>
>      cpuinfo = info;
> --
> 2.34.1
>
