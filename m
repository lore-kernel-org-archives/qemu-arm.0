Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp764059wru;
        Wed, 1 Aug 2018 06:31:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpecvXSUlQw0oTPOfGtRiGKPz2SfB4F9L0X2/fdXvnG3eoOW7znhPa9Ov8Dtxcr3SvCmXMIw
X-Received: by 2002:ac8:37c2:: with SMTP id e2-v6mr25109474qtc.417.1533130287933;
        Wed, 01 Aug 2018 06:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533130287; cv=none;
        d=google.com; s=arc-20160816;
        b=GJGy3PMqRflDfwHZS9fPtCin2sp0Rc25jJwTbVr6NXDFmdbtBooMVJaOdaITM9eMp+
         3lJDJUNgmgKwtywfJ6ZsUbHYcisbSY28VtgrnuOvj+cnq+fdpsqn07u6sAYa7EOjRSHD
         Y5MdActHD56drWiU/ITce2LM24nkZSurpveJgUnIekpUBmKi/2lsE1v+UygSZYv1sMan
         rVOD14QqspoZSoq6pZaITqWWTKGFYU3y6ZLexV/mtTdPnOY/mrLccfJTYE6/ZogADHS1
         JsiIfi5JgLHc+eoEK5t5VvleD5sOirbZ7BgeuQidckeptKJSDImle9kDynexH5OB4gow
         ZJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eGWi0a8CsOS2qfiC5P5op6OflqHKOn4+karM36tGYVI=;
        b=Cpnd5P98BY6nYGTM4Lx08uemJBH19IYSmauSK1Fhpa9oshPoXy9o1Zfv1r43sNwI+5
         7FstdETjnHcgPSPOJibWVLNK3lLJ2JaD0PUeJ1th7dg27SdDHkTY9BMZ/JBofu2VCI+E
         3hn+Ybbo1mTEDoCw4l64O0eSSQxz1aT1jisFzWP/yGPKp9tVfHhi7dQ/bEMwt1DtmprV
         rdy6J0jmm3QiyaVDRFqwAg6NlLDCIiuMz1cosZNcSIg9imTtVB4gIIxz9H9VYbFVD3Gp
         LUsqeq6jTVGuQOsxjzRrk8GeCbIJVIRcNjGW8YBdJHw3yuRQ4ujtEivm/Xs4EYxR0qnv
         KiJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j8hftcJ7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h48-v6si1264396qta.340.2018.08.01.06.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 06:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j8hftcJ7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkrDr-0002oG-ER
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 09:31:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrBu-0001Ul-Cd
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 09:29:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrBt-0005wl-AS
	for qemu-devel@nongnu.org; Wed, 01 Aug 2018 09:29:26 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:44651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkrBt-0005wW-3O; Wed, 01 Aug 2018 09:29:25 -0400
Received: by mail-qt0-x244.google.com with SMTP id b15-v6so19802008qtp.11;
	Wed, 01 Aug 2018 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eGWi0a8CsOS2qfiC5P5op6OflqHKOn4+karM36tGYVI=;
	b=j8hftcJ7b/csm6OKC1rbLf/j7aOUaePh+Fn/6DDoxb667P/UGhQvjkZv9ns7Xe6Eui
	sfDL3HxzOXb1qDlihuaTo3WmIiR35zmczYwS5d+xWYj3MU7HZdSbKitc3+ul/EZA8r8C
	osjP1uJ2w0QwZRExWSwllr4CiiFRIr9TG6J3f1emoer8qHyw30bpiEgt0BY+hw9e/U7t
	teP5pg5f+mievjDycoOHMhoPR2fAoaWhd2Z1AxkEtqCQ5knwDvD0yvCQV7FEmWi5T8xq
	5fSN6qaunkn6HTzckg2GM6oaPANkzHc3kXOaUnxhxfSeYdPL1qwy/giVWXbwapSWY4NY
	bc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eGWi0a8CsOS2qfiC5P5op6OflqHKOn4+karM36tGYVI=;
	b=FZzMWt5Vyqx87VKhSU4VhGd0F4L1znklyYjrjrmi3O7gPjgkjM6NMhuv7QlCWh6DCu
	DPsK3ni/U1RgHAYxBmoGymyoNnTg/wb+/aEoaKC4L0urPbP8Rf3dadkw6G5vNk9baVG6
	8FRgGYWJGDS9+sYvOK3fDSaqM1af0UEvnF/mvb6aA8yKWrTiyk0sShvCJhYbumH9E1xA
	SPGv74GjzjHrYSMPs46r7WZKRSHTqYjbP1sMsK6Br6wLTocngSVT/BBsMR2HCuxbUcJR
	xJtsgigYthRKYIlV3+P5yaMLaNlBVYJI4rwDRTTTnqcXtoUuRIFebSQaVj8gOOzNQBgd
	Mj6Q==
X-Gm-Message-State: AOUpUlE/NqtVsEB9P8+eVnH2T3HOl0IEejliynrNCx7O36X/l2K9rTNP
	YOa5vboOm0cptGaFdrsKNYwN368xuEdpoPmc+yIIAm9gt5c=
X-Received: by 2002:ac8:6790:: with SMTP id
	b16-v6mr26115333qtp.66.1533130164374; 
	Wed, 01 Aug 2018 06:29:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 06:29:23 -0700 (PDT)
In-Reply-To: <20180801123111.3595-4-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
	<20180801123111.3595-4-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 1 Aug 2018 15:29:23 +0200
Message-ID: <CABoDooO9a=sMVznWx2BEhs3uhcPTqGG1SA8aQ1h0OMMYD7DeCA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH 3/4] target/arm: Reorganize SVE WHILE
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hTkTNUy9JE6R

On Wed, Aug 1, 2018 at 2:31 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The pseudocode for this operation is an increment + compare loop,
> so comparing <= the maximum integer produces an all-true predicate.
>
> Rather than bound in both the inline code and the helper, pass the
> helper the number of predicate bits to set instead of the number
> of predicate elements to set.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>


Laurent

> ---
>  target/arm/sve_helper.c    |  5 ----
>  target/arm/translate-sve.c | 49 +++++++++++++++++++++++++-------------
>  2 files changed, 32 insertions(+), 22 deletions(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 9bd0694d55..87594a8adb 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2846,11 +2846,6 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
>          return flags;
>      }
>
> -    /* Scale from predicate element count to bits.  */
> -    count <<= esz;
> -    /* Bound to the bits in the predicate.  */
> -    count = MIN(count, oprsz * 8);
> -
>      /* Set all of the requested bits.  */
>      for (i = 0; i < count / 64; ++i) {
>          d->p[i] = esz_mask;
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 9dd4c38bab..89efc80ee7 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -3173,19 +3173,19 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a, uint32_t insn)
>
>  static bool trans_WHILE(DisasContext *s, arg_WHILE *a, uint32_t insn)
>  {
> -    if (!sve_access_check(s)) {
> -        return true;
> -    }
> -
> -    TCGv_i64 op0 = read_cpu_reg(s, a->rn, 1);
> -    TCGv_i64 op1 = read_cpu_reg(s, a->rm, 1);
> -    TCGv_i64 t0 = tcg_temp_new_i64();
> -    TCGv_i64 t1 = tcg_temp_new_i64();
> +    TCGv_i64 op0, op1, t0, t1, tmax;
>      TCGv_i32 t2, t3;
>      TCGv_ptr ptr;
>      unsigned desc, vsz = vec_full_reg_size(s);
>      TCGCond cond;
>
> +    if (!sve_access_check(s)) {
> +        return true;
> +    }
> +
> +    op0 = read_cpu_reg(s, a->rn, 1);
> +    op1 = read_cpu_reg(s, a->rm, 1);
> +
>      if (!a->sf) {
>          if (a->u) {
>              tcg_gen_ext32u_i64(op0, op0);
> @@ -3198,32 +3198,47 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a, uint32_t insn)
>
>      /* For the helper, compress the different conditions into a computation
>       * of how many iterations for which the condition is true.
> -     *
> -     * This is slightly complicated by 0 <= UINT64_MAX, which is nominally
> -     * 2**64 iterations, overflowing to 0.  Of course, predicate registers
> -     * aren't that large, so any value >= predicate size is sufficient.
>       */
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
>      tcg_gen_sub_i64(t0, op1, op0);
>
> -    /* t0 = MIN(op1 - op0, vsz).  */
> -    tcg_gen_movi_i64(t1, vsz);
> -    tcg_gen_umin_i64(t0, t0, t1);
> +    tmax = tcg_const_i64(vsz >> a->esz);
>      if (a->eq) {
>          /* Equality means one more iteration.  */
>          tcg_gen_addi_i64(t0, t0, 1);
> +
> +        /* If op1 is max (un)signed integer (and the only time the addition
> +         * above could overflow), then we produce an all-true predicate by
> +         * setting the count to the vector length.  This is because the
> +         * pseudocode is described as an increment + compare loop, and the
> +         * max integer would always compare true.
> +         */
> +        tcg_gen_movi_i64(t1, (a->sf
> +                              ? (a->u ? UINT64_MAX : INT64_MAX)
> +                              : (a->u ? UINT32_MAX : INT32_MAX)));
> +        tcg_gen_movcond_i64(TCG_COND_EQ, t0, op1, t1, tmax, t0);
>      }
>
> -    /* t0 = (condition true ? t0 : 0).  */
> +    /* Bound to the maximum.  */
> +    tcg_gen_umin_i64(t0, t0, tmax);
> +    tcg_temp_free_i64(tmax);
> +
> +    /* Set the count to zero if the condition is false.  */
>      cond = (a->u
>              ? (a->eq ? TCG_COND_LEU : TCG_COND_LTU)
>              : (a->eq ? TCG_COND_LE : TCG_COND_LT));
>      tcg_gen_movi_i64(t1, 0);
>      tcg_gen_movcond_i64(cond, t0, op0, op1, t0, t1);
> +    tcg_temp_free_i64(t1);
>
> +    /* Since we're bounded, pass as a 32-bit type.  */
>      t2 = tcg_temp_new_i32();
>      tcg_gen_extrl_i64_i32(t2, t0);
>      tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> +
> +    /* Scale elements to bits.  */
> +    tcg_gen_shli_i32(t2, t2, a->esz);
>
>      desc = (vsz / 8) - 2;
>      desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
> --
> 2.17.1
>
