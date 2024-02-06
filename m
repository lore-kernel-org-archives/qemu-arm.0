Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1841469ejb;
        Tue, 6 Feb 2024 06:46:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4M84TuCEQ2nbnrCU8Sy6kTp9cPX013JNEfiBrYFqF2iei9PlWMivKLFxkmfTcfvRRuxLJ
X-Received: by 2002:ac8:428b:0:b0:42c:2623:f38f with SMTP id o11-20020ac8428b000000b0042c2623f38fmr2484946qtl.26.1707230797284;
        Tue, 06 Feb 2024 06:46:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707230797; cv=none;
        d=google.com; s=arc-20160816;
        b=WvcfZBM8oCTfCdv6r+0X3R2Zt6LekSP9q9Zhm0X87ZjOOOoSvqGVd76vt3epn2U9HD
         HS7UAfPsFAqypyFzFYncXl+E1si12jPX8yTvJlfNUYwKwKA3Nc7l34/pwnlbBrYDAkBr
         GeaNGUokILqmwX6s/j+Zw6PvoW8qMGzZ2SupA/S13Fbp7l9j1fgDEi7jIJD3qZg43ZU0
         isZv8JoDTzXqXcMYTsQM1/Rd1zv96H8cqqlHaUohJTi5j3QR3sh3HN2cyr9mpNt1GG0r
         rd7KIVN0FUzNLeCKOm9/dTCgG3cLbTQdTzUX/0lIPyZdKumVIquud1lIpDeR3Gi89p3M
         +8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oy2y0w18hYt/0SqQFdw8z2ZQCuNGCTXvISsnSPy1zIw=;
        fh=BuamBhdLx2+l/inDlT/J7e5q02TNnA0krsxH8agOsDM=;
        b=FwIV594x6YkwEcZ8PH/nS30jC+fV6dhab2d8a42iPuqztU39PiyOFaQhxAOmVd9JO4
         UnWiJD9yBbeBvXPskqHyO4Le9gcaT2pjfrszXvAfTVzxbuHy99wo4QSSWjOGN838CDye
         zqax+ccdXEeJYi7z4Y+nHfS3cJUuRYQ103vcaNqlEljUVC3JRLbzw/f2oGn2Z5HgG7eT
         ATRien6NoV4ZeRuV2dHSnjeIgtFrcXH6A5ORiEbpXHNZoQPI1AGN30A+CzIlFwbFc4dv
         1hOnfiMM46BzQwkwyjBxuIbw4VAV9IgXMg5wlfk5WAzUGCfvYPXvfer4MMwjKNoQpnI+
         UTdA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v7z0s/I9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCU7LHcR9qf4G0rPWuuKhXwG+QRTAse2bUYxYZfM0usT0j4oR8+Pgaugl00zjGNDk9JkxLiUCj0ovCPCP7pUZ3z9ENMeABdq
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05622a118a00b0042c3335941dsi2156725qtk.742.2024.02.06.06.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 06:46:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v7z0s/I9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXMiH-00017D-Jz; Tue, 06 Feb 2024 09:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMiH-00016x-4K
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:46:17 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMiF-0008BP-GK
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:46:16 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so8217641a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 06:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707230773; x=1707835573; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oy2y0w18hYt/0SqQFdw8z2ZQCuNGCTXvISsnSPy1zIw=;
 b=v7z0s/I9NxhSPoCzgx2KuH666HO9FL5SKqOS7cjaMUBAMt0+s+1tXfKdFm2HQ+XXbI
 lgLEvwAGiAV76A7d1XtO7Q716FjvpROsSnAcT0Q4lrs1MN1D1tRStdkvGK6+GrVENa4g
 D8w1A79YVqlvbH4hABAgxY5lRqj2XB4kpmZKyBpos8svff2pzAR+Sp2ST8cP53JWA9Pd
 mNhhINsiv9+WF5+N2ylFYA6+gWJVSQufLh+KuUZ0LBEJcbqYr7kRYeFErrbsin1cDrkw
 +ns0wUzJadTPTie+gqGoou8Cv0IIAH1U4YMiO3edQWbCfyNFyxFoq4hNX0/pvBkB+5Y/
 LzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707230773; x=1707835573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oy2y0w18hYt/0SqQFdw8z2ZQCuNGCTXvISsnSPy1zIw=;
 b=Z0TkL1CyEYEDtfbHMcAGHWS/aCl4MXVTuPB44ykRSum6TpFaKLB896D2U//VDTvfYJ
 nJHdwI6ZP1uclyxhvH89nLMcE0xBR0mXfqF9lCmlyvxq41iNIw+OjFSFezfIOiGd055i
 goQUITk3iE0KU6/WiE2Q+DP7gI1cD9ayHcI0IFi3Hz2R+mUkcorqwgBcD0LCSeBG6bHP
 aGtB4IbZL4BgLwh1iUUEf/iNha8TsIfKg7/wj3rlLyFIBcN01Y2TWj4bZViZXv/e5oTt
 y9xVa2blO/TB0aNloDKaD8T7em0+nPAM3J5jJepfiGhn2BmGh2x3E9P4ev4cmSHB5ciV
 p7BQ==
X-Gm-Message-State: AOJu0Yw6qWddLPoQXiHTH4rRw82vOZCceYqFHQn4+zV/cWIbFlsh6kkG
 nyEb4aN8LB5K+qB66KL/uinqjiEgPsTcsjb/896lAx8FBcsiNTdsk5JK1tUAKKkfGQ0Q8O4T4vW
 aQTOaptpNI5g0z7HDXD8rFKUsycHOu9iTve2x6Q==
X-Received: by 2002:a05:6402:1485:b0:55f:9bb6:b205 with SMTP id
 e5-20020a056402148500b0055f9bb6b205mr1983775edv.34.1707230773233; Tue, 06 Feb
 2024 06:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <20240206030527.169147-3-richard.henderson@linaro.org>
In-Reply-To: <20240206030527.169147-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 14:46:01 +0000
Message-ID: <CAFEAcA-ZNwm=OJ6u+e57kyRFnjyR+Br=ZCbOodbQwBZzrjVnhA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] target/arm: Fix nregs computation in do_ld_zpa
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: h2ANc5E/C6WE

On Tue, 6 Feb 2024 at 03:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The field is encoded as [0-3], which is convenient for
> indexing our array of function pointers, but the true
> value is [1-4].  Adjust before calling do_mem_zpa.
>
> Add an assert, and move the comment re passing ZT to
> the helper back next to the relevant code.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 206adacfb8d ("target/arm: Add mte helpers for sve scalar + int loads")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
> index 296e7d1ce2..f50a426c98 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -4445,11 +4445,7 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
>      TCGv_ptr t_pg;
>      int desc = 0;
>
> -    /*
> -     * For e.g. LD4, there are not enough arguments to pass all 4
> -     * registers as pointers, so encode the regno into the data field.
> -     * For consistency, do this even for LD1.
> -     */
> +    assert(mte_n >= 1 && mte_n <= 4);
>      if (s->mte_active[0]) {
>          int msz = dtype_msz(dtype);
>
> @@ -4463,6 +4459,11 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
>          addr = clean_data_tbi(s, addr);
>      }
>
> +    /*
> +     * For e.g. LD4, there are not enough arguments to pass all 4
> +     * registers as pointers, so encode the regno into the data field.
> +     * For consistency, do this even for LD1.
> +     */
>      desc = simd_desc(vsz, vsz, zt | desc);
>      t_pg = tcg_temp_new_ptr();
>
> @@ -4600,7 +4601,7 @@ static void do_ld_zpa(DisasContext *s, int zt, int pg,
>       * accessible via the instruction encoding.
>       */
>      assert(fn != NULL);
> -    do_mem_zpa(s, zt, pg, addr, dtype, nreg, false, fn);
> +    do_mem_zpa(s, zt, pg, addr, dtype, nreg + 1, false, fn);
>  }
>
>  static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)

What about do_st_zpa() ? It's not obvious what the 'nreg'
encoding is in the a->nreg field in arg_rprr_store, but
it's definitely confusing that do_st_zpa() calls
do_mem_zpa() passing "nreg" whereas do_ld_zpa() now
passes it "nreg + 1". Can we make it so the handling
in these two functions lines up?

thanks
-- PMM
