Received: by 10.28.71.27 with SMTP id u27csp580206wma;
        Fri, 23 Feb 2018 05:17:34 -0800 (PST)
X-Google-Smtp-Source: AH8x225yvWvioUMvHUeOfGnpMxIKKZEF++mxu37e7lLJ0zVbqwn6yidlxfHJggQahHuFrouXz6YP
X-Received: by 10.129.129.194 with SMTP id r185mr937706ywf.313.1519391854591;
        Fri, 23 Feb 2018 05:17:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519391854; cv=none;
        d=google.com; s=arc-20160816;
        b=OUDLzCfYUl9lhXPVuH0V+KR30yymvAPENeabNa6MRG2mnmn1yRHO1XG55aDoikp8z0
         UL49jvMM9pu7DGBjJ0mbM8ivzsE7mHbFl93qcNHNZDxa3aQyRVmAPmEexm+GOcSqXVxh
         T3xHQCfENU8zaiCqG7YaZT2mX+PELMXEdM2WBRVjkg6XO3199xcnV6kDzYdmnI4kw4EG
         xqfNYVurvsMfwqdlSoiOBFh7+H45jg59OduVosGjWkb0oP+IEiCjndLgdMSqBk2DdoOb
         JMFSj2btypTmfBnbjgaAO0Z0rzahAynCG25MktAvB1irFD6ND6rPb/EBqHhWPYHK+thw
         ui5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rIcgM+T1D96lAp39MgjasB3a5QdQjr3Wi2u4u6xio3E=;
        b=IDcJS4pQNTM5Qw/Pa36CUjIadvK+Ov8wBUtKI1B0ptgc0Xjn5F0Vjr/U5RUYgeGIG0
         ssrWjPil0L8FqBfa5H+uG/4b3zFYhYVGYZTapE3v2W/vL2ufwLr8RoNJjq6eDSSU93TU
         b2Ro6eDHI5mLk9/oNUfz+PirwcX32pi8nVzxFdS+E0nKkHyM4SivU71qtzJfaxRr4SUT
         UvsLqVs0QEzAM1flV0wdIuwvkEZLQhPmj2BhR1R+mMKZ2eYPYt3rQ41hBdKn0IyeGk6J
         YQMLSAiEEp+8mhMYRBm17oURT9E3YRVhAz791RuklIu2yu8ehxYFhrNmkFSXvo0hMiL0
         8z1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FHnHB9D1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si395680ywi.204.2018.02.23.05.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 05:17:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FHnHB9D1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epDED-0002CX-UA
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 08:17:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDE0-0002Bp-9d
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:17:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDDz-0001Qr-6r
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:17:20 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epDDz-0001QI-0I
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:17:19 -0500
Received: by mail-pg0-x241.google.com with SMTP id g12so3348034pgs.0
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rIcgM+T1D96lAp39MgjasB3a5QdQjr3Wi2u4u6xio3E=;
	b=FHnHB9D1ilkTLr4NsRDgQJJ/7uirL3o/GhqMQPlT1V5HGCCQICsw/Kb3vTdD8G1RJk
	5mR5fUiiOx900aACWrmKdlar9xkPMtbnPoOVXPOv+rZXl1NLCe8ROJn8XKQcDM5QQfkJ
	EWm+im+5CvXERB8h/xI915HMtpUaxOAgwqlEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rIcgM+T1D96lAp39MgjasB3a5QdQjr3Wi2u4u6xio3E=;
	b=nLI1Unf6eXXtau4DoRLLBNMau1fqElbett98bfCnAYrOtMdsiQeXXssCOpJWZStmRO
	cHC/MOgzoL1YMMr7HvZpuntftjazNWGwcyJ3600RmR3DX86CvGD4KBzvTuktby5awsMl
	tebrw4e3UfyCOJYwTwWqy2UUaqVhN/Znog/n5PAc7v4XMbyDvwokEVi/w+mzEPl6m/7P
	6O/Cqgh4y703idultbOBye85rvzNaK4xCS96/H9a3T3c/AoiPLeWwJ6COaZElwDTydov
	cplXi5fG69Yhv9QjFXKMLtLNKcFULlI8Jk2ZsTmFPVA1/U2qHJpfIA81Hx15yPDDUwBE
	u+PA==
X-Gm-Message-State: APf1xPBSyg7APu8XVuZyr23jrGBDkUk9dYrjHsJ7PISg0eyyj1nnxYiF
	MsLAh7Fet/IZ0xK3lSuAbJpc2nzDQdpOW3AfpN9eng==
X-Received: by 10.98.18.70 with SMTP id a67mr1751681pfj.213.1519391837872;
	Fri, 23 Feb 2018 05:17:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 05:16:57 -0800 (PST)
In-Reply-To: <20180217182323.25885-17-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 13:16:57 +0000
Message-ID: <CAFEAcA-QyoAU8Y2DYmc2LtAD0R6ynJ_Guw44oqcMG1QxzioJTw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [PATCH v2 16/67] target/arm: Implement SVE Integer
 Arithmetic - Unpredicated Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cKJYdQvXFlti

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 41 ++++++++++++++++++++++++++++++++++++++---
>  target/arm/sve.decode      | 13 +++++++++++++
>  2 files changed, 51 insertions(+), 3 deletions(-)

> @@ -254,7 +288,8 @@ static void do_zpzz_ool(DisasContext *s, arg_rprr_esz *a, gen_helper_gvec_4 *fn)
>  }
>
>  #define DO_ZPZZ(NAME, name) \
> -void trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn) \
> +static void trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a,         \
> +                                uint32_t insn)                            \
>  {                                                                         \
>      static gen_helper_gvec_4 * const fns[4] = {                           \
>          gen_helper_sve_##name##_zpzz_b, gen_helper_sve_##name##_zpzz_h,   \
> @@ -286,7 +321,7 @@ DO_ZPZZ(ASR, asr)
>  DO_ZPZZ(LSR, lsr)
>  DO_ZPZZ(LSL, lsl)
>
> -void trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
> +static void trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
>  {
>      static gen_helper_gvec_4 * const fns[4] = {
>          NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
> @@ -294,7 +329,7 @@ void trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
>      do_zpzz_ool(s, a, fns[a->esz]);
>  }
>
> -void trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
> +static void trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
>  {
>      static gen_helper_gvec_4 * const fns[4] = {
>          NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d

Should these changes to 'static' have been in a different patch, or was
that to avoid compiler warnings when the functions were introduced but not
used til this patch?

> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 68a1823b72..b40d7dc9a2 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -68,6 +68,9 @@
>  # Three prediate operand, with governing predicate, flag setting
>  @pd_pg_pn_pm_s ........ . s:1 .. rm:4 .. pg:4 . rn:4 . rd:4    &rprr_s
>
> +# Three operand, vector element size
> +@rd_rn_rm      ........ esz:2 . rm:5  ... ...  rn:5 rd:5       &rrr_esz
> +
>  # Two register operand, with governing predicate, vector element size
>  @rdn_pg_rm     ........ esz:2 ... ... ... pg:3 rm:5 rd:5 \
>                 &rprr_esz rn=%reg_movprfx
> @@ -205,6 +208,16 @@ MLS                00000100 .. 0 ..... 011 ... ..... .....   @rda_pg_rn_rm
>  MLA            00000100 .. 0 ..... 110 ... ..... .....   @rdn_pg_ra_rm # MAD
>  MLS            00000100 .. 0 ..... 111 ... ..... .....   @rdn_pg_ra_rm # MSB
>
> +### SVE Integer Arithmetic - Unpredicated Group
> +
> +# SVE integer add/subtract vectors (unpredicated)
> +ADD_zzz                00000100 .. 1 ..... 000 000 ..... .....         @rd_rn_rm
> +SUB_zzz                00000100 .. 1 ..... 000 001 ..... .....         @rd_rn_rm
> +SQADD_zzz      00000100 .. 1 ..... 000 100 ..... .....         @rd_rn_rm
> +UQADD_zzz      00000100 .. 1 ..... 000 101 ..... .....         @rd_rn_rm
> +SQSUB_zzz      00000100 .. 1 ..... 000 110 ..... .....         @rd_rn_rm
> +UQSUB_zzz      00000100 .. 1 ..... 000 111 ..... .....         @rd_rn_rm

Misaligned lines for ADD and SUB.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
