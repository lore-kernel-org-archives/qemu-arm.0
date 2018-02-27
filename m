Received: by 10.28.71.27 with SMTP id u27csp4932992wma;
        Tue, 27 Feb 2018 07:15:48 -0800 (PST)
X-Google-Smtp-Source: AG47ELv0QZ+MijQSM8RWafW3UzXVcHKUHE6bMWCnnWv1esJyisS3N+HxwUn0JdfNARkL7WZGARLi
X-Received: by 2002:a25:ae08:: with SMTP id a8-v6mr9898313ybj.87.1519744548334;
        Tue, 27 Feb 2018 07:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519744548; cv=none;
        d=google.com; s=arc-20160816;
        b=F9L26fnwG2JuPhj7bVp6ojH1hhG6Vwif/+wnVMLO28My1/Fpo3zAzzphB3Q3qEcl8P
         wX0qreToK/wRxjy65NUI2HsjygjDx3mXyCDwMxZK2kJF6ZV8z9Izur42LR6MF/OMeNAk
         fmM2uGv/rLsVyCnOM/R7Qsi5j74IM9awHfOsTGWg+oRDNdqx4R3zspSkwBXelGm05NSD
         uouFcVF8l6WZFU9OdnJ5LukaJEssoF3QgNzVcNr9KmMmSg/Ozl60LKbdZFEU6n5+QGwS
         Oc1+mjmBRBWEdYgQd9iShOb7keCayA6Z4P7jSqCpGmXMK2ugekcF7C7dD7yuXUNmn7Hx
         PhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=e5g0T5F1gn/F/yaJyVIDmw8LSu/ryLWCCXEQONGqzq4=;
        b=E4uUXNLaR4v3atsQgOJSgG2T7Nf2h32tDQbZCqqy1kFntuRsOzcaNdriW4B9Rjx8IH
         6DDxQ0uIk9Qa0XcYtaMfU4vXZA4SkwFChayKL+OdzKemDILiyBRuWPqJTJD+S40PV2Rq
         h1r1tjUzSNjiE47ZQ7iF0vMultHMrrWbw+TMgbuesc6RhuP3zKrhKRK0d6D97904RIKC
         lpKnVA97idjd7JZPSyWtyWxwf5MxnC3MqO8trlMilBK1kfEuDg1b+MReRZbLLLSKwBjH
         NQ1erabg+NfFLQZhwMpElXELFqnAWsC7VAe0rJ607NPlrV1E828kaZCrRz6Rao5xhMah
         pBNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JkoMBkGw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h81si1936640ywb.366.2018.02.27.07.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:15:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JkoMBkGw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqgyp-0001va-Lv
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:15:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgmB-0007xC-3o
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:02:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgm4-0005ZY-Ti
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:02:43 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34949)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqgm4-0005YE-NX
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:02:36 -0500
Received: by mail-oi0-x244.google.com with SMTP id x10so10518020oig.2
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 07:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e5g0T5F1gn/F/yaJyVIDmw8LSu/ryLWCCXEQONGqzq4=;
	b=JkoMBkGwtPE+ScaJDG9i7jRmF/3T+dEYPzq2cj3ibd3AgW+4YSLC0IZq6clGPXzR0H
	+3nYjJ9qqZs94KzrSsJuZ/cz+KKlcIn12eg9SlobFNQOI8dB5c1YDZF/SSpnk8RHrQ5o
	bCdcBhgXdLmuqXj5GnV3PU++AnLu50iXWVzmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e5g0T5F1gn/F/yaJyVIDmw8LSu/ryLWCCXEQONGqzq4=;
	b=KyET8r76N+plChsHcpiMdgZQ9Tut7eVAkOg2nPWUA0T8oqipAGfaPPat/HWF4BJkzb
	FLwf/zDUG1DbmDl3nLmT29cFhvMAfJAfERa0X6jKCytenWAW7FcwKctAWiuLDbkhquwb
	8Kk4z0DzR9vzJozgRVzQkv8EoOB6lZersXGFuSDc9sLq9mOJXdC4/TE6NURbKahWtUXF
	FgUGS8Tq70Al2mGya6EdO+B+nxG8S3oROnc1jhJqU/bQMQq1Q0LOCYb5GmK/7B1zbHuK
	mC68gcs797GtHiHeqI0PBzmA3IXfMLB+SAk7WXzoRVWFPLSp4eLeDuRMRi17V87Luj19
	aX5Q==
X-Gm-Message-State: APf1xPBtzK9Uo4rt+PEk6RKUV8aOd7DB4impUDSb3RgMam3eVU14LFzb
	5WfwyoqVLqvy3A0Sk9vAbbccaixMDNicMMBUZqPDUg==
X-Received: by 10.202.216.67 with SMTP id p64mr8891210oig.337.1519743755680;
	Tue, 27 Feb 2018 07:02:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:02:15 -0800 (PST)
In-Reply-To: <20180217182323.25885-57-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-57-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:02:15 +0000
Message-ID: <CAFEAcA9LTvTqPoSG80oxdXsm2Dch6erhzxxBNOh=LaNBMXEcyw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2 56/67] target/arm: Implement SVE scatter
 store vector immediate
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
X-TUID: 58MYwpIT0hF1

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 79 +++++++++++++++++++++++++++++++---------------
>  target/arm/sve.decode      | 11 +++++++
>  2 files changed, 65 insertions(+), 25 deletions(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 6484ecd257..0241e8e707 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -4011,31 +4011,33 @@ static void trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a, uint32_t insn)
>      tcg_temp_free_i64(imm);
>  }
>
> +/* Indexed by [xs][msz].  */
> +static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][3] = {
> +    { gen_helper_sve_stbs_zsu,
> +      gen_helper_sve_sths_zsu,
> +      gen_helper_sve_stss_zsu, },
> +    { gen_helper_sve_stbs_zss,
> +      gen_helper_sve_sths_zss,
> +      gen_helper_sve_stss_zss, },
> +};
> +
> +static gen_helper_gvec_mem_scatter * const scatter_store_fn64[3][4] = {
> +    { gen_helper_sve_stbd_zsu,
> +      gen_helper_sve_sthd_zsu,
> +      gen_helper_sve_stsd_zsu,
> +      gen_helper_sve_stdd_zsu, },
> +    { gen_helper_sve_stbd_zss,
> +      gen_helper_sve_sthd_zss,
> +      gen_helper_sve_stsd_zss,
> +      gen_helper_sve_stdd_zss, },
> +    { gen_helper_sve_stbd_zd,
> +      gen_helper_sve_sthd_zd,
> +      gen_helper_sve_stsd_zd,
> +      gen_helper_sve_stdd_zd, },
> +};
> +
>  static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
>  {
> -    /* Indexed by [xs][msz].  */
> -    static gen_helper_gvec_mem_scatter * const fn32[2][3] = {
> -        { gen_helper_sve_stbs_zsu,
> -          gen_helper_sve_sths_zsu,
> -          gen_helper_sve_stss_zsu, },
> -        { gen_helper_sve_stbs_zss,
> -          gen_helper_sve_sths_zss,
> -          gen_helper_sve_stss_zss, },
> -    };
> -    static gen_helper_gvec_mem_scatter * const fn64[3][4] = {
> -        { gen_helper_sve_stbd_zsu,
> -          gen_helper_sve_sthd_zsu,
> -          gen_helper_sve_stsd_zsu,
> -          gen_helper_sve_stdd_zsu, },
> -        { gen_helper_sve_stbd_zss,
> -          gen_helper_sve_sthd_zss,
> -          gen_helper_sve_stsd_zss,
> -          gen_helper_sve_stdd_zss, },
> -        { gen_helper_sve_stbd_zd,
> -          gen_helper_sve_sthd_zd,
> -          gen_helper_sve_stsd_zd,
> -          gen_helper_sve_stdd_zd, },
> -    };
>      gen_helper_gvec_mem_scatter *fn;
>
>      if (a->esz < a->msz || (a->msz == 0 && a->scale)) {
> @@ -4044,10 +4046,10 @@ static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
>      }
>      switch (a->esz) {
>      case MO_32:
> -        fn = fn32[a->xs][a->msz];
> +        fn = scatter_store_fn32[a->xs][a->msz];
>          break;
>      case MO_64:
> -        fn = fn64[a->xs][a->msz];
> +        fn = scatter_store_fn64[a->xs][a->msz];
>          break;
>      default:
>          g_assert_not_reached();

These bits would be better folded into the previous patches I think.

> @@ -4056,6 +4058,33 @@ static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
>                 cpu_reg_sp(s, a->rn), fn);
>  }
>
> +static void trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a, uint32_t insn)
> +{
> +    gen_helper_gvec_mem_scatter *fn = NULL;
> +    TCGv_i64 imm;
> +
> +    if (a->esz < a->msz) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    switch (a->esz) {
> +    case MO_32:
> +        fn = scatter_store_fn32[0][a->msz];
> +        break;
> +    case MO_64:
> +        fn = scatter_store_fn64[2][a->msz];
> +        break;
> +    }
> +    assert(fn != NULL);
> +
> +    /* Treat ST1_zpiz (zn[x] + imm) the same way as ST1_zprz (rn + zm[x])
> +       by loading the immediate into the scalar parameter.  */
> +    imm = tcg_const_i64(a->imm << a->msz);
> +    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, fn);
> +    tcg_temp_free_i64(imm);
> +}
> +
>  /*
>   * Prefetches
>   */
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index f85d82e009..6ccb4289fc 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -84,6 +84,7 @@
>  &rprr_gather_load      rd pg rn rm esz msz u ff xs scale
>  &rpri_gather_load      rd pg rn imm esz msz u ff
>  &rprr_scatter_store    rd pg rn rm esz msz xs scale
> +&rpri_scatter_store    rd pg rn imm esz msz
>
>  ###########################################################################
>  # Named instruction formats.  These are generally used to
> @@ -216,6 +217,8 @@
>                     &rprr_store nreg=0
>  @rprr_scatter_store ....... msz:2 ..     rm:5 ... pg:3 rn:5 rd:5 \
>                     &rprr_scatter_store
> +@rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
> +                   &rpri_scatter_store
>
>  ###########################################################################
>  # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
> @@ -935,6 +938,14 @@ ST1_zprz   1110010 .. 01 ..... 101 ... ..... ..... \
>  ST1_zprz       1110010 .. 00 ..... 101 ... ..... ..... \
>                 @rprr_scatter_store xs=2 esz=3 scale=0
>
> +# SVE 64-bit scatter store (vector plus immediate)
> +ST1_zpiz       1110010 .. 10 ..... 101 ... ..... ..... \
> +               @rpri_scatter_store esz=3
> +
> +# SVE 32-bit scatter store (vector plus immediate)
> +ST1_zpiz       1110010 .. 11 ..... 101 ... ..... ..... \
> +               @rpri_scatter_store esz=2
> +
>  # SVE 64-bit scatter store (scalar plus unpacked 32-bit scaled offset)
>  # Require msz > 0
>  ST1_zprz       1110010 .. 01 ..... 100 ... ..... ..... \
> --
> 2.14.3

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
