Received: by 10.28.71.27 with SMTP id u27csp825045wma;
        Fri, 23 Feb 2018 09:03:51 -0800 (PST)
X-Google-Smtp-Source: AG47ELvwkn9TMOf/JzUnvc/ChOP3G2FOHykVlcLM1YnSaRvCYyaJG3J/obvcifHZCAi5+THHyLM1
X-Received: by 2002:a25:ca50:: with SMTP id a77-v6mr1549110ybg.98.1519405431107;
        Fri, 23 Feb 2018 09:03:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519405431; cv=none;
        d=google.com; s=arc-20160816;
        b=aXb0Hfu9drHJ/vJkmg4wwpfTZW4iMeR4kCbvJ6TuWoDDRz4NEksDKLou+prssazZDU
         cR20W5CQSnSeGTo6N56sv0fb5DkoLe4l97FzWGT6IXOwMKGc9u3dGHXdSyKjhbN2b6Fl
         QQ1SPSOr7DwBfCDRHCmvLeaMX+HMlPs4NGoeUV/WbmIUqH60AX2Ht7K5IARJ+Gn+NEY7
         xsnt6fF5d2kVTKWATtnhJiiTgwhsuk4XUiNHEMWzzGeooApINa17UqkMjErW9kxLdH65
         +O+PN4anKgK5I4zTrbz03PS0L6+09jggAzTzO0pjibOkCrDiLiO7ciTT17GwMzPeTDjY
         vUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pdZr8rRiavQbyq4iTd+4kjjyld2Kydivb4ycEQXuNS0=;
        b=HjDpPhLCS+TY5CmFcMfbBtoTzAcs/vao9M8eu1RhMe/mkKe6mEPgAJplei4vuR982c
         NXnh9Msl2HfQ0uu5YN/n8bRysptsWC2okvUshkRM8TCA1Hv2p1IEQWtsZ3J4pZNMTHY2
         ylupjjqgHhdru4KYsV44/5jL/c3TrF6JwZNXp+76wYzunf2xPfhvfA0gcWqNdUa0xYg8
         oKkzvKddqNaDMYhfkITeVttFcOfaHxvh08+RmmIbk08m3weD7salNWUeL4HnlY+LRTFN
         qIFq9GD58W5AmmQ9+gpxsLu2dzxlHQIm1Brld2ys0xczPsh1eDvh5XB9fldmLGuUUtx+
         +SwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fi2ti5mj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 186-v6si475523ybf.661.2018.02.23.09.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:03:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fi2ti5mj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGlC-0004nZ-Ew
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:03:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGiS-00036v-Ia
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 12:01:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGiR-0004vB-IJ
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 12:01:00 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:42135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epGiR-0004tY-9K
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 12:00:59 -0500
Received: by mail-pl0-x241.google.com with SMTP id 31so5205605ple.9
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 09:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pdZr8rRiavQbyq4iTd+4kjjyld2Kydivb4ycEQXuNS0=;
	b=fi2ti5mjJAL/pKkhhK4OHB+qE/RBMD4ajiOjhnPdw7AQvecLcpGFRAp6Tgw3velh58
	RNshFSlzxACeHzqBwX/yZgCgRAUhJ/c5KvjGrZsOyJ40IDzb2ZyvH16/RAYI1sKHlZnc
	H1KOCx/8VByaalXup+E8xdEFGlDVKpDG8P9PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pdZr8rRiavQbyq4iTd+4kjjyld2Kydivb4ycEQXuNS0=;
	b=Xq6/FLFXpL7CKrGZ2Z/01RrxV6RH0CzXt/1yX8GTCEok2jq6r+amWg18aaQ0HBdwmR
	qCFxPqGWOcyhMzCeYpSMM71zZTBaDNXoMiWhq+8KonzueqnhR9XanjzwiaTbDwLCmZKh
	lIlKx1Hppp3cP1DhmLpkkvuem0KT0o6phHL34pza6l//UlLNp+AOZguPG9YSu082Civd
	+DoS/3mc2hLzrRSxI1e8gHLQihFrcnyXsUdqh/0Qe7Dl5wgX7ThimJQgiSU97BcUP9Ph
	dPkNCa2b82wnD1rSayd/ICfmQi4a/LTGw8PjVwZTHdrAvMwCOe3HY8xKQkUKYoBev/ly
	7Zew==
X-Gm-Message-State: APf1xPBkOsEIFreAhzNaUY/rVlaVipwiNgmmu5O2sWad31xFXXgXq59x
	Vi+uwOOwaPOUmJ4h/XCJvJ9pQtwo6QuL1plINl6+KQ==
X-Received: by 2002:a17:902:8b85:: with SMTP id
	ay5-v6mr2345908plb.329.1519405257917; 
	Fri, 23 Feb 2018 09:00:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 09:00:37 -0800 (PST)
In-Reply-To: <20180217182323.25885-41-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 17:00:37 +0000
Message-ID: <CAFEAcA8vFOjA8OST2237SybD-187Bhke3DmBPLUy7ZLCcXSEhw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-devel] [PATCH v2 40/67] target/arm: Implement SVE Integer
 Compare - Scalars Group
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /+NHcSvUoZ0r

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  2 +
>  target/arm/sve_helper.c    | 31 ++++++++++++++++
>  target/arm/translate-sve.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  8 ++++
>  4 files changed, 133 insertions(+)
>
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> index dd4f8f754d..1863106d0f 100644
> --- a/target/arm/helper-sve.h
> +++ b/target/arm/helper-sve.h
> @@ -678,3 +678,5 @@ DEF_HELPER_FLAGS_4(sve_brkn, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
>
>  DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
> +
> +DEF_HELPER_FLAGS_3(sve_while, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index dd884bdd1c..80b78da834 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2716,3 +2716,34 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
>      }
>      return sum;
>  }
> +
> +uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)

This could really use a comment about what part of the overall
instruction it's doing.

> +{
> +    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
> +    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
> +    uint64_t esz_mask = pred_esz_masks[esz];
> +    ARMPredicateReg *d = vd;
> +    uint32_t flags;
> +    intptr_t i;
> +
> +    /* Begin with a zero predicate register.  */
> +    flags = do_zero(d, oprsz);
> +    if (count == 0) {
> +        return flags;
> +    }
> +
> +    /* Scale from predicate element count to bits.  */
> +    count <<= esz;
> +    /* Bound to the bits in the predicate.  */
> +    count = MIN(count, oprsz * 8);
> +
> +    /* Set all of the requested bits.  */
> +    for (i = 0; i < count / 64; ++i) {
> +        d->p[i] = esz_mask;
> +    }
> +    if (count & 63) {
> +        d->p[i] = ~(-1ull << (count & 63)) & esz_mask;
> +    }
> +
> +    return predtest_ones(d, oprsz, esz_mask);
> +}
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 038800cc86..4b92a55c21 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -2847,6 +2847,98 @@ static void trans_SINCDECP_z(DisasContext *s, arg_incdec2_pred *a,
>      do_sat_addsub_vec(s, a->esz, a->rd, a->rn, val, a->u, a->d);
>  }
>
> +static void trans_WHILE(DisasContext *s, arg_WHILE *a, uint32_t insn)
> +{
> +    TCGv_i64 op0 = read_cpu_reg(s, a->rn, 1);
> +    TCGv_i64 op1 = read_cpu_reg(s, a->rm, 1);
> +    TCGv_i64 t0 = tcg_temp_new_i64();
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +    TCGv_i32 t2, t3;
> +    TCGv_ptr ptr;
> +    unsigned desc, vsz = vec_full_reg_size(s);
> +    TCGCond cond;
> +
> +    if (!a->sf) {
> +        if (a->u) {
> +            tcg_gen_ext32u_i64(op0, op0);
> +            tcg_gen_ext32u_i64(op1, op1);
> +        } else {
> +            tcg_gen_ext32s_i64(op0, op0);
> +            tcg_gen_ext32s_i64(op1, op1);
> +        }
> +    }
> +
> +    /* For the helper, compress the different conditions into a computation
> +     * of how many iterations for which the condition is true.
> +     *
> +     * This is slightly complicated by 0 <= UINT64_MAX, which is nominally
> +     * 2**64 iterations, overflowing to 0.  Of course, predicate registers
> +     * aren't that large, so any value >= predicate size is sufficient.
> +     */
> +    tcg_gen_sub_i64(t0, op1, op0);
> +
> +    /* t0 = MIN(op1 - op0, vsz).  */
> +    if (a->eq) {
> +        /* Equality means one more iteration.  */
> +        tcg_gen_movi_i64(t1, vsz - 1);
> +        tcg_gen_movcond_i64(TCG_COND_LTU, t0, t0, t1, t0, t1);
> +        tcg_gen_addi_i64(t0, t0, 1);
> +    } else {
> +        tcg_gen_movi_i64(t1, vsz);
> +        tcg_gen_movcond_i64(TCG_COND_LTU, t0, t0, t1, t0, t1);
> +    }
> +
> +    /* t0 = (condition true ? t0 : 0).  */
> +    cond = (a->u
> +            ? (a->eq ? TCG_COND_LEU : TCG_COND_LTU)
> +            : (a->eq ? TCG_COND_LE : TCG_COND_LT));
> +    tcg_gen_movi_i64(t1, 0);
> +    tcg_gen_movcond_i64(cond, t0, op0, op1, t0, t1);
> +
> +    t2 = tcg_temp_new_i32();
> +    tcg_gen_extrl_i64_i32(t2, t0);
> +    tcg_temp_free_i64(t0);
> +    tcg_temp_free_i64(t1);
> +
> +    desc = (vsz / 8) - 2;
> +    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
> +    t3 = tcg_const_i32(desc);
> +
> +    ptr = tcg_temp_new_ptr();
> +    tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
> +
> +    gen_helper_sve_while(t2, ptr, t2, t3);
> +    do_pred_flags(t2);
> +
> +    tcg_temp_free_ptr(ptr);
> +    tcg_temp_free_i32(t2);
> +    tcg_temp_free_i32(t3);
> +}

I got confused by this -- it is too far different from what the
pseudocode is doing. Could we have more explanatory comments, please?

thanks
-- PMM
