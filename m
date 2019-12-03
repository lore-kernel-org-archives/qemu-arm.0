Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1341865lfc;
        Tue, 3 Dec 2019 03:02:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxS6yxRBdkfwYMvfQQXcEQV2HIoxJSxqY1ctYlU7CXtR2gMEZaJC6ECClndSPIYC0g9tJwq
X-Received: by 2002:a05:6402:1777:: with SMTP id da23mr2494763edb.292.1575370934749;
        Tue, 03 Dec 2019 03:02:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575370934; cv=none;
        d=google.com; s=arc-20160816;
        b=NP9Dhs10KsQMqqF9gg2zsvdK4JNrDA5eWa5ytj2IEqWdl5M82v28WzA2pehHoVw3yN
         g840vOrHq7RGexaMt0T58mgujwhKBB2mXX0qnVqscS8OhP9ds+oWh6FikGC26quhguc0
         8ofnGJlyXFu9HJd7yHcaU8paBwpVb/ABgGGlNFPtKSxY2Hctx+tQFrpVVuf3CW7E+bPr
         alTaoadM6CSNqJGngO2K6TaDRetD0Hohc5sxqqRmHls/tt02wVIHkY1XXN3h+PZfFo6Y
         BregligAc6xbVc8ovscHkGRjxMUDZ79dDI6S890RTBi/erMZfzjBvMLuosu38Vk0pe/f
         bfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rab/J5gH/QbKQ/NgfodcNxsJh57te6atcpnHBg9t3eU=;
        b=O00oZyGuP0qBxN1+VYhfTnU19HsnNgZXx/B3wvWKnEZm8mgL9JDoYycuGpCcLfO7xY
         Y9o8LJMhSQhSWTV51oPQatJE0Ffqq6LEhZ7njwovTZNsaMc57pXiG/kwaNicgDBq0xzK
         rUuc4VZH3LAgOz779N64hzA0dAUKlEk8CWCD1GmGwLp2xDJXat4NfrUCZaDyqV1s0K2b
         NhGrujujRHKxf8howABIXrQuYI8dcuzDzedI23Xpm/2sD5YNvSIC1LNTNGjaJ8F/ZHaV
         nw4+qqznoAYoXeQAs98+snrxAyu/zsenOeWEQ69dpN50zIHasLVHICTNncZsLfxYWmks
         9vmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PAy2SmgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si1886859eja.384.2019.12.03.03.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 03:02:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PAy2SmgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic5wZ-0005j7-KL
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 06:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ic5vr-0005gF-C4
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ic5vm-0005hZ-9A
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:01:23 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ic5vl-0005O5-2I
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:01:22 -0500
Received: by mail-oi1-x242.google.com with SMTP id 6so2860109oix.7
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2019 03:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rab/J5gH/QbKQ/NgfodcNxsJh57te6atcpnHBg9t3eU=;
 b=PAy2SmgTsS5JcIbgUmCWPLVJatVpMmYZxaQNPwB1EG22CiHXRxnj6VVFL7HVo0zTnm
 M/to28nX2Fz8VmLtAu7bU3dq5jMa42mW5DMsZyc1G1u9qEDZJx89zAPqCkEO/xnPV2OW
 D4xb+iTlQqXzrL/CFVqsNFXXMX/A+OcMaybP/leS4YwC5L3GqP169UlCcEgN5jFe/9gB
 CP4f3ohkRDA8UR1PJnFsBVjoWP0Fy3OZ0TrquET543REMgCB0Ry1NbPnfNh9GVLHT4Oc
 lwnjslKUAA3CHr9BNz1vnJWNYQjlz3QptrlmS42Orw4YX2KwWZLnXIazhLxbHwlsKEwj
 V6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rab/J5gH/QbKQ/NgfodcNxsJh57te6atcpnHBg9t3eU=;
 b=CWFhj8ZLW7rCKhpDKHs4s3+3ADfgDjijVjyP1LwWq1q3+5h0vfqpzwGxQv0QwGeHNo
 i5Ek3hRL4N63wCVCqqYXSaFglOsDODm0z0Bd0SxeJI3UayvQxijeKCd7ZV02ULsEgFXp
 BQCpMlHN8Tiz0RT2le4VbbbDWuvTMaMnSgExEaqxFEJEkZDJd5Ze7qO+y0RI6icSSdAl
 Tm+8ooHqDl076CEeXEEuzTeqCM/ArLDrtATucWUzbuiSU+F3DRadK3sSrauvoAJH/33x
 mabnP+q5eWIfwgUByOdky+VCxOBePG6ACHlR1NIVmUh+sHvFY4Qb2BlQyjbbm+uVlMuB
 XrQg==
X-Gm-Message-State: APjAAAV6PaKMCLKZQpiDDRnGuRlFPVBTdSTBQZcO15K5WfWzcg0RuBu3
 tppPW5cYJzHLzTIW5OUTkimYYian/Va95dAsoVsUeNtjFEY=
X-Received: by 2002:aca:1a0a:: with SMTP id a10mr2915763oia.146.1575370876886; 
 Tue, 03 Dec 2019 03:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-3-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2019 11:01:05 +0000
Message-ID: <CAFEAcA_Ob3_fGNo3n9hgB6oa-y9abSbtN7Y1u3jpY9uaXNwbSQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/22] target/arm: Add regime_has_2_ranges
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q8Mb9QX0o7hA

On Fri, 11 Oct 2019 at 14:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A translation with 2 ranges has both positive and negative addresses.
> This is true for the EL1&0 and the as-yet unimplemented EL2&0 regimes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h     | 14 ++++++++++++++
>  target/arm/helper.c        | 22 +++++-----------------
>  target/arm/translate-a64.c |  3 +--
>  3 files changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index dcc5d6cca3..9486680b87 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -804,6 +804,20 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
>      }
>  }
>
> +/* Return true if this address translation regime has two ranges.  */
> +static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
> +{
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_S12NSE0:
> +    case ARMMMUIdx_S12NSE1:
> +    case ARMMMUIdx_S1NSE0:
> +    case ARMMMUIdx_S1NSE1:
> +        return true;

Don't S1SE0 and S1SE1 also need to be here?

> +    default:
> +        return false;
> +    }
> +}
> +
>  /* Return true if this address translation regime is secure */
>  static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
>  {
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b690eda136..f9dee51ede 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8774,15 +8774,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
>      }
>
>      if (is_aa64) {
> -        switch (regime_el(env, mmu_idx)) {
> -        case 1:
> -            if (!is_user) {
> -                xn = pxn || (user_rw & PAGE_WRITE);
> -            }
> -            break;
> -        case 2:
> -        case 3:
> -            break;
> +        if (regime_has_2_ranges(mmu_idx) && !is_user) {
> +            xn = pxn || (user_rw & PAGE_WRITE);
>          }

(I was sceptical that 'regime_has_2_ranges()' was the right condition
here, but the Arm ARM really does define it as "valid only when stage
1 of the translation regime can support two VA ranges".)

>      } else if (arm_feature(env, ARM_FEATURE_V7)) {
>          switch (regime_el(env, mmu_idx)) {
> @@ -9316,7 +9309,6 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
>                                          ARMMMUIdx mmu_idx)
>  {
>      uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
> -    uint32_t el = regime_el(env, mmu_idx);
>      bool tbi, tbid, epd, hpd, tcma, using16k, using64k;
>      int select, tsz;
>
> @@ -9326,7 +9318,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
>       */
>      select = extract64(va, 55, 1);
>
> -    if (el > 1) {
> +    if (!regime_has_2_ranges(mmu_idx)) {
>          tsz = extract32(tcr, 0, 6);
>          using64k = extract32(tcr, 14, 1);
>          using16k = extract32(tcr, 15, 1);
> @@ -9486,10 +9478,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>          param = aa64_va_parameters(env, address, mmu_idx,
>                                     access_type != MMU_INST_FETCH);
>          level = 0;
> -        /* If we are in 64-bit EL2 or EL3 then there is no TTBR1, so mark it
> -         * invalid.
> -         */
> -        ttbr1_valid = (el < 2);
> +        ttbr1_valid = regime_has_2_ranges(mmu_idx);
>          addrsize = 64 - 8 * param.tbi;
>          inputsize = 64 - param.tsz;
>      } else {
> @@ -11095,8 +11084,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>              ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
>              int tbii;
>
> -            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
> -            if (regime_el(env, stage1) < 2) {
> +            if (regime_has_2_ranges(mmu_idx)) {

Now that the rebuild_hflags patchset has landed this is in
rebuild_hflags_a64().

>                  ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
>                  tbid = (p1.tbi << 1) | p0.tbi;
>                  tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 51f3af9cd9..c85db69db4 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -175,8 +175,7 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
>      if (tbi == 0) {
>          /* Load unmodified address */
>          tcg_gen_mov_i64(dst, src);
> -    } else if (s->current_el >= 2) {
> -        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
> +    } else if (!regime_has_2_ranges(s->mmu_idx)) {
>          /* Force tag byte to all zero */
>          tcg_gen_extract_i64(dst, src, 0, 56);
>      } else {

The comment above this function also needs updating to no longer
refer to "EL2 and EL3" vs "EL0 and EL1". (You might also remove
the use of the imperial 'We' in the last sentence in it ;-))

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
