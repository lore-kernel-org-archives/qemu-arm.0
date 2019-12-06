Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp904460lff;
        Fri, 6 Dec 2019 07:37:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3GYFAVlE7+vZujvQ2/OOcLGjm6G8g6tZwTAk8jdPuy39xavXRhsB+P4O94y1MlOO7NUYb
X-Received: by 2002:a05:620a:9cc:: with SMTP id y12mr4434746qky.336.1575646669877;
        Fri, 06 Dec 2019 07:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575646669; cv=none;
        d=google.com; s=arc-20160816;
        b=tpQzJpfRB34xscs/STM5u61cCPQIwWx+6mRdv8Sc8hspl2aazKQjcfT6a9QEnSWHD+
         FG0dRFPmRWLaL6RAWmELt+MDoCs0EOj6T5CfgQZUiz+EDb9e3MpN25hvt+RX67gZ7/jM
         Eken731lsHurDcFnnO5AMXoqsgkrSjbrlq9RiboIJCzNGhLzRFrNYnljufRJuIXMswCq
         I7Moj9IRicZ9hmX2HkCouF8GVdBeMLpky7MXi6TPI9blSfbdHpuaGle2aTbc76n8xN3E
         uRdg7nJk4VoUS+2Ey1EZqS8xUSSHKyFGI6XkPBEpmtEXHV6Qx0UirA7Qdi81eh9yhcpB
         8Czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uhSPlg+i9CiAubF7ClC0ww2vNy2qAmWgFnaNVgQgOxE=;
        b=fXHilTvFxm7h4HLYi0CGI95DSzaZA37Ksa0wS0EFCNEFUajc4+2n9yUajBjlx0rJGJ
         l8dezSGVF2TIAaykClz/WMTcRW/XImPrwC2PtHW1P4KzJlnCR7Cuv11OcOmE9LSGaxAb
         StzWqsPBOHUX4uoaU+Jro7aIDvnNZ7azeP6TW3TBI363Bn/VGFlvKY8TXA9Ol5eGehh7
         CZjGt7WmioxHRHvDRl0lKNTd7beaZwNI8eoG91VjNnknoSsTYIXE1r4/vnFgKNox3tt7
         r6Ni9um/DulX43JvurE/js6yJnNCcqRv0Q0DgvN61yOtsFU7S3H6N4xcppLLKppSFuHi
         uT8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zzsj35yd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si7954640qth.16.2019.12.06.07.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 07:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zzsj35yd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idFfw-00073j-VB
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 10:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idErz-0007tT-2d
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:46:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idErx-0002Yv-Bp
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:46:10 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idErx-0002XO-4U
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:46:09 -0500
Received: by mail-oi1-x244.google.com with SMTP id c16so6378174oic.3
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uhSPlg+i9CiAubF7ClC0ww2vNy2qAmWgFnaNVgQgOxE=;
 b=zzsj35yd960LbiaSBcl/usD7GRpWOsvW98l1RP+jhOWQfLebIUn2wV2+T9mfupbxch
 e93nHD4TZJlfhk5O0kSjTqVQ9kAmqFigsdzw6vbxNcKNbYHGBBJR4WtLJnOtCYmfeiWN
 Oc+Mal+rpJUHvmiVerGR7FkUHafsoCh0ZCI/9hWqOsB9KukvjFnW74gfHF3KczHaYLWp
 90mLdshDyOYx7g1tE/o7HSHRWfK5XlNlhEZz7D2BrQGNv608xXmdvKJr0jGdZnhSOT91
 Ecuk55bLRIX9g6M3EnNxsdA5sxTN0qkNTXzWj7muhFqvRD2MpCWlWU466cSZdN2ZMZ9+
 5LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uhSPlg+i9CiAubF7ClC0ww2vNy2qAmWgFnaNVgQgOxE=;
 b=pD+49TxdV3h0pGA4m0BIjQ8lnVoAs3S5N2Rs75BYIt7oYNjdDy+LCx0NnPFzSM3IfA
 bfQuz0RT1D1pDfdzTA6T/IgcRCWBgmzNwb22mitHmfnwySl6HcdjN5aDobBun9RUBkzG
 e1EECUxtJR7Xgj07ba/9O/4kyWoiA6LkHxSVfCvFmhIedatUu94UJIBfxEXvha4K19cY
 O//V3fwDkW4/7mgrJLvXKvrXimaeTzHMZJX23RUhRt+/htwAhHn4jrhuUoHvb3+Eya0q
 2uj9RYIeyHfpyVZQP2Nx2dorjuP6MBP0GijoO57UqxhSIE8l+nUSZhVUeRad85dYWV7H
 yXgg==
X-Gm-Message-State: APjAAAXzR/fVNT09vOkrMIfwZkD9FNe+Nb49e00rHn580fM6yaPJwil8
 opGPLcAd3UJsX5GPIrhG19UmtoX3Itvc0Pf64w7gnvfl
X-Received: by 2002:aca:edd5:: with SMTP id l204mr12121697oih.98.1575632772773; 
 Fri, 06 Dec 2019 03:46:12 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-22-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 11:46:02 +0000
Message-ID: <CAFEAcA8aJZRMFEpKaUN_W4U5LXoWvvzYUe0FQYwTd=RiFHeFEQ@mail.gmail.com>
Subject: Re: [PATCH v5 21/22] target/arm: Add mmu indexes for tag memory
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uoP0SIGbwgJH

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The process by which one goes from an address space plus physical
> address to a host pointer is complex.  It is easiest to reuse the
> mechanism already present within cputlb, and letting that cache
> the results.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h |  2 +-
>  target/arm/cpu.h       | 12 +++++++++---
>  target/arm/internals.h |  2 ++
>  target/arm/helper.c    | 25 +++++++++++++++++++++++--
>  4 files changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 6e6948e960..18ac562346 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -29,6 +29,6 @@
>  # define TARGET_PAGE_BITS_MIN  10
>  #endif
>
> -#define NB_MMU_MODES 8
> +#define NB_MMU_MODES 9
>
>  #endif
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index faca43ea78..c3609ef9d5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2854,8 +2854,8 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>  #define ARM_MMU_IDX_M_NEGPRI 0x2
>  #define ARM_MMU_IDX_M_S 0x4
>
> -#define ARM_MMU_IDX_TYPE_MASK (~0x7)
> -#define ARM_MMU_IDX_COREIDX_MASK 0x7
> +#define ARM_MMU_IDX_TYPE_MASK (~0xf)
> +#define ARM_MMU_IDX_COREIDX_MASK 0xf
>
>  typedef enum ARMMMUIdx {
>      ARMMMUIdx_S12NSE0 = 0 | ARM_MMU_IDX_A,
> @@ -2865,6 +2865,9 @@ typedef enum ARMMMUIdx {
>      ARMMMUIdx_S1SE0 = 4 | ARM_MMU_IDX_A,
>      ARMMMUIdx_S1SE1 = 5 | ARM_MMU_IDX_A,
>      ARMMMUIdx_S2NS = 6 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_TagNS = 7 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_TagS = 8 | ARM_MMU_IDX_A,
> +
>      ARMMMUIdx_MUser = 0 | ARM_MMU_IDX_M,
>      ARMMMUIdx_MPriv = 1 | ARM_MMU_IDX_M,
>      ARMMMUIdx_MUserNegPri = 2 | ARM_MMU_IDX_M,
> @@ -2891,6 +2894,8 @@ typedef enum ARMMMUIdxBit {
>      ARMMMUIdxBit_S1SE0 = 1 << 4,
>      ARMMMUIdxBit_S1SE1 = 1 << 5,
>      ARMMMUIdxBit_S2NS = 1 << 6,
> +    ARMMMUIdxBit_TagNS = 1 << 7,
> +    ARMMMUIdxBit_TagS = 1 << 8,
>      ARMMMUIdxBit_MUser = 1 << 0,
>      ARMMMUIdxBit_MPriv = 1 << 1,
>      ARMMMUIdxBit_MUserNegPri = 1 << 2,
> @@ -3254,7 +3259,8 @@ enum {
>  /* Return the address space index to use for a memory access */
>  static inline int arm_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
>  {
> -    return attrs.secure ? ARMASIdx_S : ARMASIdx_NS;
> +    return ((attrs.target_tlb_bit2 ? ARMASIdx_TagNS : ARMASIdx_NS)
> +            + attrs.secure);

If you want to do the "just add attrs.secure" can we have
a build-time assert that ARMASIdx_S is ARMASIdx_NS + 1, and
ditto for TagNS/TagS, please? It seems like the kind of thing
that will catch us out later on.

>  }

>      if (env->cp15.hcr_el2 & HCR_TGE) {
> @@ -10662,7 +10671,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>                     target_ulong *page_size,
>                     ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
>  {
> -    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_S12NSE0:
> +    case ARMMMUIdx_S12NSE1:
>          /* Call ourselves recursively to do the stage 1 and then stage 2
>           * translations.
>           */
> @@ -10713,6 +10724,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>               */
>              mmu_idx = stage_1_mmu_idx(mmu_idx);
>          }
> +        break;
> +
> +    case ARMMMUIdx_TagS:
> +    case ARMMMUIdx_TagNS:
> +        /* Indicate tag memory to arm_asidx_from_attrs.  */
> +        attrs->target_tlb_bit2 = true;
> +        break;

So here we fall through to the "handle a stage 1 lookup" code, which:
 * sets attrs->secure
 * sets attrs->user (always false, so we could have left it alone)
 * skips the FCSE handling (as we're v8)
 * skips the PMSA handling
 * hits the regime_translation_disabled() check, which fills in
   *phys_ptr, *prot and *page_size and returns

Maybe it would be clearer if this case here just did all of that:

    case ARMMMUIdx_TagS:
        attrs->secure = true;
        /* fall through */
    case ARMMMUIdx_TagNS:
        /* Indicate tag memory to arm_asidx_from_attrs.  */
        attrs->target_tlb_bit2 = true;
        *phys_ptr = address;
        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
        *page_size = TARGET_PAGE_SIZE;
        return 0;

Did I miss anything out?
Or are we going to want more things which are common between
the stage 1 codepath and the "just a tag ram access" case
in future?

thanks
-- PMM
