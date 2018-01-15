Received: by 10.28.173.206 with SMTP id w197csp2801990wme;
        Mon, 15 Jan 2018 06:45:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBotwfPtRrvQQtr/GHEE/W1qDmOXppV/1Y4r2xdqmpFcvWn2Q+4kSt8tN3yL7Th+ZzA8iLybH
X-Received: by 10.13.196.69 with SMTP id g66mr31443843ywd.504.1516027507231;
        Mon, 15 Jan 2018 06:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516027507; cv=none;
        d=google.com; s=arc-20160816;
        b=Yb9vJ8LeGhGzn319e98p2mJVVvaLiPAOaC4OPPgVuOtCsopeluVWqYkLvyNsYFl7Db
         AXCTeqb+zSDi8Db+DE2vG8cIC0rW1RfGkZ/f6//gI2PyoXeV9vCVOlw+wrQGGXYmn4pu
         dtfNayog+VdXoBWK+mIDbiau/ElEU4PE9s6jyZKf7FLiWHIoKw/Q2Fr4jfQRH3eWJ3s2
         mSK2g8E7P6DqrARqh+h2bTnLf2mzv9a+xRUPal0sQhLoROaIBMrq8PPoqH1fCnWYSt3k
         LNtMMtD3nBGGIprfe8TEL4/aG+glNSYU4ctj//Tsz3B0qMb5RnsJzJIVLlYDw4vRsgj1
         JszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3mxn1bVD1LgFUpR2YeyjRdkME6Tcw4PQ3OcVn8noLq8=;
        b=Eqk0b0vGbqsRYHQ4KPavkJzJL3o60EenxPmNBeYhDvSqc++Nip71Ok6v+X/v8Ie7hN
         49CQQN3y/BwhsSTQw03SdLmoWzyX3Mma93wApLKEXwiamX84NwtP7Y7YzWPjAaza/AIk
         boyAXROaYb0vojazlOsPkft4T45QehMDE85aKK4cDxTU2VN226qZqR4zB6/uwtAEfh7s
         z7nCTqfMI43uxAyCg+mHHPJPOV09R5acIW4V5aG1eU54fbZ9+rsHkoqDSMI2SnzXzZDQ
         K+rLOb6MLHDIzn9EYWhmA/DE3V1ckLmID+f3nchHefwAUoEaJ3x6EzaWuRgokcKwuwup
         lXLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CMhP+MPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q21si2128485ywg.689.2018.01.15.06.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 06:45:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CMhP+MPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb60Y-00048T-IC
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 09:45:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eb60L-00045y-RO
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 09:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eb60K-0006Yj-8Q
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 09:44:53 -0500
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:37637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eb60K-0006YT-0o
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 09:44:52 -0500
Received: by mail-it0-x244.google.com with SMTP id q8so1120212itb.2
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 06:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3mxn1bVD1LgFUpR2YeyjRdkME6Tcw4PQ3OcVn8noLq8=;
	b=CMhP+MPssZo2rjwTyU77JNZCgh418OSDJTQoXyKzrwT9ZBDltgjOns+PnOrqIbcMIQ
	YXnharwSjjxmkJhfkHTowAQ/sm5g6UL5p16pXbcZW9hycwhElrdeluIepBmxVws3wj0D
	qFsKqouQQ4K1Lfq7/2FgOYUB/SEqKUh+XGXQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3mxn1bVD1LgFUpR2YeyjRdkME6Tcw4PQ3OcVn8noLq8=;
	b=o7L+s1cPtmMHjvHuajE1145TikdAg8zxUBfjsYuDaA0Fe+7yeIMbB71wCOhLYEWrxK
	GhKzlPSO0K/AUrVEjMMAe/pMMJtZGuU1g7beVnRIGNxhQ+WIrJzDiu1pt9PFd2oXoIqp
	PXICojhGVqtTD6JKxAPCHzGVeNtIgFT/U0GJ4VSOhcFN8dzetiLUzxWXLuZOoC2tlJtH
	sz09yyFNXpnXoSrcizlXK1N7cGuvNp+pINAI1IzbvRIIsl8KdYNC1v2idHhclHDqsgv0
	F8e8/Etof8CT3/7M+TFr+IDAXQce2PoX5RbiYRqV/Ph1VLqsGGn3axPE5eu9LkaaxcRq
	8FQw==
X-Gm-Message-State: AKwxytdvtfANkMZx7Mw4zQH5jBS7OwpNsj+FcQzi3XBS1uZZsaUVfIRI
	bBchpsIpwu6jZLXQ/t4nzuxbm8jZTWBKxYeFrg1iV1ml
X-Received: by 10.36.224.141 with SMTP id c135mr14412564ith.34.1516027490775; 
	Mon, 15 Jan 2018 06:44:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.37.197 with HTTP; Mon, 15 Jan 2018 06:44:50 -0800 (PST)
In-Reply-To: <20180115124546.7253-2-ard.biesheuvel@linaro.org>
References: <20180115124546.7253-1-ard.biesheuvel@linaro.org>
	<20180115124546.7253-2-ard.biesheuvel@linaro.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 15 Jan 2018 14:44:50 +0000
Message-ID: <CAKv+Gu9YddzyYjDWCU1F8rzfGV3ETkuZNtMNvS_YCrQjtekwRw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-arm] [PATCH v2 1/3] target/arm: implement SHA-512
 instructions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IPrxkUVCcfLQ

On 15 January 2018 at 12:45, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> This implements emulation of the new SHA-512 instructions that have
> been added as an optional extensions to the ARMv8 Crypto Extensions
> in ARM v8.2.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  target/arm/cpu.h           |   1 +
>  target/arm/crypto_helper.c | 136 +++++++++++++++++++-
>  target/arm/helper.h        |   5 +
>  target/arm/translate-a64.c |  99 ++++++++++++++
>  4 files changed, 240 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 96316700dd6f..295529366c0a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1340,6 +1340,7 @@ enum arm_features {
>      ARM_FEATURE_VBAR, /* has cp15 VBAR */
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
> +    ARM_FEATURE_V8_SHA512, /* implements SHA512 part of v8 Crypto Extensions */
>  };
>
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/crypto_helper.c b/target/arm/crypto_helper.c
> index 3b6df3f41a42..a89464f5acdc 100644
> --- a/target/arm/crypto_helper.c
> +++ b/target/arm/crypto_helper.c
> @@ -1,7 +1,7 @@
>  /*
>   * crypto_helper.c - emulate v8 Crypto Extensions instructions
>   *
> - * Copyright (C) 2013 - 2014 Linaro Ltd <ard.biesheuvel@linaro.org>
> + * Copyright (C) 2013 - 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
>   *
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
> @@ -25,9 +25,11 @@ union CRYPTO_STATE {
>  #ifdef HOST_WORDS_BIGENDIAN
>  #define CR_ST_BYTE(state, i)   (state.bytes[(15 - (i)) ^ 8])
>  #define CR_ST_WORD(state, i)   (state.words[(3 - (i)) ^ 2])
> +#define CR_ST_QUAD(state, i)   (state.l[(i) ^ 1])
>  #else
>  #define CR_ST_BYTE(state, i)   (state.bytes[i])
>  #define CR_ST_WORD(state, i)   (state.words[i])
> +#define CR_ST_QUAD(state, i)   (state.l[i])

Ugh. This CR_ST_QUAD() is bogus - the 64 bit words always appear in
the same order.

Please disregard, I will respin.


>  #endif
>
>  void HELPER(crypto_aese)(CPUARMState *env, uint32_t rd, uint32_t rm,
> @@ -463,3 +465,135 @@ void HELPER(crypto_sha256su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
>      env->vfp.regs[rd] = make_float64(d.l[0]);
>      env->vfp.regs[rd + 1] = make_float64(d.l[1]);
>  }
> +
> +/*
> + * The SHA-512 logical functions (same as above but using 64-bit operands)
> + */
> +
> +static uint64_t cho512(uint64_t x, uint64_t y, uint64_t z)
> +{
> +    return (x & (y ^ z)) ^ z;
> +}
> +
> +static uint64_t maj512(uint64_t x, uint64_t y, uint64_t z)
> +{
> +    return (x & y) | ((x | y) & z);
> +}
> +
> +static uint64_t S0_512(uint64_t x)
> +{
> +    return ror64(x, 28) ^ ror64(x, 34) ^ ror64(x, 39);
> +}
> +
> +static uint64_t S1_512(uint64_t x)
> +{
> +    return ror64(x, 14) ^ ror64(x, 18) ^ ror64(x, 41);
> +}
> +
> +static uint64_t s0_512(uint64_t x)
> +{
> +    return ror64(x, 1) ^ ror64(x, 8) ^ (x >> 7);
> +}
> +
> +static uint64_t s1_512(uint64_t x)
> +{
> +    return ror64(x, 19) ^ ror64(x, 61) ^ (x >> 6);
> +}
> +
> +void HELPER(crypto_sha512h)(CPUARMState *env, uint32_t rd, uint32_t rn,
> +                            uint32_t rm)
> +{
> +    union CRYPTO_STATE d = { .l = {
> +        float64_val(env->vfp.regs[rd]),
> +        float64_val(env->vfp.regs[rd + 1])
> +    } };
> +    union CRYPTO_STATE n = { .l = {
> +        float64_val(env->vfp.regs[rn]),
> +        float64_val(env->vfp.regs[rn + 1])
> +    } };
> +    union CRYPTO_STATE m = { .l = {
> +        float64_val(env->vfp.regs[rm]),
> +        float64_val(env->vfp.regs[rm + 1])
> +    } };
> +    uint64_t t;
> +
> +    t = CR_ST_QUAD(m, 1);
> +    CR_ST_QUAD(d, 1) += S1_512(t) + cho512(t, CR_ST_QUAD(n, 0),
> +                                           CR_ST_QUAD(n, 1));
> +
> +    t = CR_ST_QUAD(d, 1) + CR_ST_QUAD(m, 0);
> +    CR_ST_QUAD(d, 0) += S1_512(t) + cho512(t, CR_ST_QUAD(m, 1),
> +                                           CR_ST_QUAD(n, 0));
> +
> +    env->vfp.regs[rd] = make_float64(d.l[0]);
> +    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
> +}
> +
> +void HELPER(crypto_sha512h2)(CPUARMState *env, uint32_t rd, uint32_t rn,
> +                             uint32_t rm)
> +{
> +    union CRYPTO_STATE d = { .l = {
> +        float64_val(env->vfp.regs[rd]),
> +        float64_val(env->vfp.regs[rd + 1])
> +    } };
> +    union CRYPTO_STATE n = { .l = {
> +        float64_val(env->vfp.regs[rn]),
> +        float64_val(env->vfp.regs[rn + 1])
> +    } };
> +    union CRYPTO_STATE m = { .l = {
> +        float64_val(env->vfp.regs[rm]),
> +        float64_val(env->vfp.regs[rm + 1])
> +    } };
> +
> +    CR_ST_QUAD(d, 1) += S0_512(CR_ST_QUAD(m, 0)) + maj512(CR_ST_QUAD(n, 0),
> +                                                          CR_ST_QUAD(m, 1),
> +                                                          CR_ST_QUAD(m, 0));
> +
> +    CR_ST_QUAD(d, 0) += S0_512(CR_ST_QUAD(d, 1)) + maj512(CR_ST_QUAD(d, 1),
> +                                                          CR_ST_QUAD(m, 0),
> +                                                          CR_ST_QUAD(m, 1));
> +
> +    env->vfp.regs[rd] = make_float64(d.l[0]);
> +    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
> +}
> +
> +void HELPER(crypto_sha512su0)(CPUARMState *env, uint32_t rd, uint32_t rn)
> +{
> +    union CRYPTO_STATE d = { .l = {
> +        float64_val(env->vfp.regs[rd]),
> +        float64_val(env->vfp.regs[rd + 1])
> +    } };
> +    union CRYPTO_STATE n = { .l = {
> +        float64_val(env->vfp.regs[rn]),
> +        float64_val(env->vfp.regs[rn + 1])
> +    } };
> +
> +    CR_ST_QUAD(d, 0) += s0_512(CR_ST_QUAD(d, 1));
> +    CR_ST_QUAD(d, 1) += s0_512(CR_ST_QUAD(n, 0));
> +
> +    env->vfp.regs[rd] = make_float64(d.l[0]);
> +    env->vfp.regs[rd + 1] = make_float64(d.l[1]);
> +}
> +
> +void HELPER(crypto_sha512su1)(CPUARMState *env, uint32_t rd, uint32_t rn,
> +                              uint32_t rm)
> +{
> +    uint64_t d[2] = {
> +        float64_val(env->vfp.regs[rd]),
> +        float64_val(env->vfp.regs[rd + 1])
> +    };
> +    uint64_t n[2] = {
> +        float64_val(env->vfp.regs[rn]),
> +        float64_val(env->vfp.regs[rn + 1])
> +    };
> +    uint64_t m[2] = {
> +        float64_val(env->vfp.regs[rm]),
> +        float64_val(env->vfp.regs[rm + 1])
> +    };
> +
> +    d[0] += s1_512(n[0]) + m[0];
> +    d[1] += s1_512(n[1]) + m[1];
> +
> +    env->vfp.regs[rd] = make_float64(d[0]);
> +    env->vfp.regs[rd + 1] = make_float64(d[1]);
> +}
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 066729e8ad8e..efa75440ce81 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -534,6 +534,11 @@ DEF_HELPER_4(crypto_sha256h2, void, env, i32, i32, i32)
>  DEF_HELPER_3(crypto_sha256su0, void, env, i32, i32)
>  DEF_HELPER_4(crypto_sha256su1, void, env, i32, i32, i32)
>
> +DEF_HELPER_4(crypto_sha512h, void, env, i32, i32, i32)
> +DEF_HELPER_4(crypto_sha512h2, void, env, i32, i32, i32)
> +DEF_HELPER_3(crypto_sha512su0, void, env, i32, i32)
> +DEF_HELPER_4(crypto_sha512su1, void, env, i32, i32, i32)
> +
>  DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
>  DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
>  DEF_HELPER_2(dc_zva, void, env, i64)
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index ba94f7d0456a..ec17391f4ff4 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11111,6 +11111,103 @@ static void disas_crypto_two_reg_sha(DisasContext *s, uint32_t insn)
>      tcg_temp_free_i32(tcg_rn_regno);
>  }
>
> +/* Crypto three-reg SHA512
> + *  31                   21 20  16 15  14  13 12  11  10  9    5 4    0
> + * +-----------------------+------+---+---+-----+--------+------+------+
> + * | 1 1 0 0 1 1 1 0 0 1 1 |  Rm  | 1 | O | 0 0 | opcode |  Rn  |  Rd  |
> + * +-----------------------+------+---+---+-----+--------+------+------+
> + */
> +static void disas_crypto_three_reg_sha512(DisasContext *s, uint32_t insn)
> +{
> +    int opcode = extract32(insn, 10, 2);
> +    int o =  extract32(insn, 14, 1);
> +    int rm = extract32(insn, 16, 5);
> +    int rn = extract32(insn, 5, 5);
> +    int rd = extract32(insn, 0, 5);
> +    TCGv_i32 tcg_rd_regno, tcg_rn_regno, tcg_rm_regno;
> +    CryptoThreeOpEnvFn *genfn;
> +
> +    if (o != 0) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    switch (opcode) {
> +    case 0: /* SHA512H */
> +        genfn = gen_helper_crypto_sha512h;
> +        break;
> +    case 1: /* SHA512H2 */
> +        genfn = gen_helper_crypto_sha512h2;
> +        break;
> +    case 2: /* SHA512SU1 */
> +        genfn = gen_helper_crypto_sha512su1;
> +        break;
> +    default:
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA512)) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    if (!fp_access_check(s)) {
> +        return;
> +    }
> +
> +    tcg_rd_regno = tcg_const_i32(rd << 1);
> +    tcg_rn_regno = tcg_const_i32(rn << 1);
> +    tcg_rm_regno = tcg_const_i32(rm << 1);
> +
> +    genfn(cpu_env, tcg_rd_regno, tcg_rn_regno, tcg_rm_regno);
> +
> +    tcg_temp_free_i32(tcg_rd_regno);
> +    tcg_temp_free_i32(tcg_rn_regno);
> +    tcg_temp_free_i32(tcg_rm_regno);
> +}
> +
> +/* Crypto two-reg SHA512
> + *  31                                     12  11  10  9    5 4    0
> + * +-----------------------------------------+--------+------+------+
> + * | 1 1 0 0 1 1 1 0 1 1 0 0 0 0 0 0 1 0 0 0 | opcode |  Rn  |  Rd  |
> + * +-----------------------------------------+--------+------+------+
> + */
> +static void disas_crypto_two_reg_sha512(DisasContext *s, uint32_t insn)
> +{
> +    int opcode = extract32(insn, 10, 2);
> +    int rn = extract32(insn, 5, 5);
> +    int rd = extract32(insn, 0, 5);
> +    TCGv_i32 tcg_rd_regno, tcg_rn_regno;
> +    CryptoTwoOpEnvFn *genfn;
> +
> +    switch (opcode) {
> +    case 0: /* SHA512SU0 */
> +        genfn = gen_helper_crypto_sha512su0;
> +        break;
> +    default:
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8_SHA512)) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    if (!fp_access_check(s)) {
> +        return;
> +    }
> +
> +    tcg_rd_regno = tcg_const_i32(rd << 1);
> +    tcg_rn_regno = tcg_const_i32(rn << 1);
> +
> +    genfn(cpu_env, tcg_rd_regno, tcg_rn_regno);
> +
> +    tcg_temp_free_i32(tcg_rd_regno);
> +    tcg_temp_free_i32(tcg_rn_regno);
> +}
> +
>  /* C3.6 Data processing - SIMD, inc Crypto
>   *
>   * As the decode gets a little complex we are using a table based
> @@ -11140,6 +11237,8 @@ static const AArch64DecodeTable data_proc_simd[] = {
>      { 0x4e280800, 0xff3e0c00, disas_crypto_aes },
>      { 0x5e000000, 0xff208c00, disas_crypto_three_reg_sha },
>      { 0x5e280800, 0xff3e0c00, disas_crypto_two_reg_sha },
> +    { 0xce608000, 0xffe0b000, disas_crypto_three_reg_sha512 },
> +    { 0xcec08000, 0xfffff000, disas_crypto_two_reg_sha512 },
>      { 0x00000000, 0x00000000, NULL }
>  };
>
> --
> 2.11.0
>
