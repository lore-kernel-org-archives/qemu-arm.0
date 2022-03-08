Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2279004lfo;
        Tue, 8 Mar 2022 03:57:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3zy1x9xegyQC+JByZbn/j6DrlsbvIGiikAo6+8/LuovRTKugh7AgX103606KFGY3kSc17
X-Received: by 2002:a25:f308:0:b0:628:865a:e11e with SMTP id c8-20020a25f308000000b00628865ae11emr11665391ybs.507.1646740645645;
        Tue, 08 Mar 2022 03:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646740645; cv=none;
        d=google.com; s=arc-20160816;
        b=W7vrixjYcWGaPmrJE+y5R+lU3oW/sDrknDdTovEf5SbIbJdpWBT4Tl2Wk3YHc6hzRV
         5Kp+H9Hpca4KUFadg9y+LeTVATzIFLAM9bQzcDJ48UInuVT8NbN7I8/NimtJAyARHEFe
         KIsdXiJVnZeUoOFYuWsE3AZuztdhBCY56ON15n2CiCrnXSN8qhx/4V00QLpZk5bwW5/s
         plg0p0YUTou+TKF7bBG2P0fsFMEQKGqu3D7fGow6HZoWtW4dby6SO+ouyKSD1UZT4MvR
         liUD7roDu6dH9V9cDuXSpCJ7C0AXH/L+sTqPLPtqqEbZHBaXkcUXpsxL15pTITlfOR0O
         L6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DRHj3p80KM0p/VvDKpWrUMTIntu3unlRYlfPqyRyXoU=;
        b=KEUIpgDEG0PGkaVFGzZQ1+q7CCxm1oylF5xHzZgpSdXPoZ94DneiEcgctiVfGLhCuW
         mChhS71XcxaaJUsIVUkKOvsY2OPvxZPZfEQ0n0IRL1jBqLkTERyMSbtKOQl0DalwpeWc
         7SmDgfdTBIw7u0Uv/6ZXMTOOuvdZKRIjfFUcSap+UxAG5kyI6VUZv47xhKafHdCtRfuP
         8JaJQvRLrgxnQ6HkZx8XN5mtOPhjlxEhPfCD6bCQhJaUMFhBu9E28bmhchbYHECZSvBS
         Yg6jVm/6pqj44xhH2XR561CzU1KblPiZA8GvmmHfl8MJzGd7/DHgBNsTBg8O+ZCyT4eU
         U4hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bo0tw+kH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u188-20020a8147c5000000b002dc773077c0si6444265ywa.516.2022.03.08.03.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 03:57:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bo0tw+kH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYSz-0008NO-2o
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 06:57:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRYSn-0008DA-VD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:57:13 -0500
Received: from [2607:f8b0:4864:20::1129] (port=44396
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRYSm-00011n-1a
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:57:13 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so198231627b3.11
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DRHj3p80KM0p/VvDKpWrUMTIntu3unlRYlfPqyRyXoU=;
 b=bo0tw+kHDhpYBCyzqq98GpKSnmQaHggg4uOSx+5E0hdrYBcn9AYwmEk4setrMhA593
 CI4ObklltjS37MuieNSqSc0idGVtqVpK5ZvFoa8rXv6vQ1b96a734aZAYs4uzuzBLyd0
 l8NU98axgMriRFotdIZPcZ0yf5QM+aA9mnpmV3qXSLlxPKhaPuJ0C/+Z9YV6OPN0SRrS
 BQ1LVhBHFIv6V7TDLut9HM1syvA7pYWaOZs2YWTkPX36cE5lsTi8u8vhFj+x+XBZUO4Z
 0geprPMuApEIHWIPwNemNF7klIfJrnz8OAwPHPjv0lbGzWL3JR4p4p1LE7tsYauWZOL5
 PPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DRHj3p80KM0p/VvDKpWrUMTIntu3unlRYlfPqyRyXoU=;
 b=vIQkeRTl7K+O06/JUE3i9CFaA/IjBk52JDEiQLhVZQQJohe4ltAkLrrGW08hhXin7c
 euHLxB2zQhzZ4MjUGUDGn4qh6uuLFIu5aERGMbcRdi2AlYA0srZTaU43u/wQi2nXh6YJ
 46o9zWsiTE7CeEZxXk+8wIbN+OsmUhJ2vm11lv0nUFyJzglKlZoXmUC9ZW2DQYR1ykU2
 /9NZtd/2cQ/shU1UPMCCdffTJH2ap4RIxc7cWao3YsP2LY2vWaPzUS0xcnSZRRY4C06G
 lBpkKlt57WLM0dTJktz/Nz+2tjaBhJg5ByUesn2pbTFay9Eh8gBoQ1UHVi8EDeoEsqir
 6Xuw==
X-Gm-Message-State: AOAM530ZiKEcHUyChJxb/YcsQFBjjwPMzyna6595Nm7MOAH87xEuV7QN
 EL97dcIW5t+5x1QPPXBcVSVsuqHEHQFqRAY3l+pLWg==
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr12126513yww.64.1646740630925; Tue, 08
 Mar 2022 03:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20220308031655.240710-1-richard.henderson@linaro.org>
In-Reply-To: <20220308031655.240710-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 11:56:59 +0000
Message-ID: <CAFEAcA8fKkf4T0AhyhrFZS2=vGKBJ7ZtBBtZwEfpzWqztZ0xeA@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Fix sve2 ldnt1 and stnt1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CSEVMSVF3Ua+

On Tue, 8 Mar 2022 at 03:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For both ldnt1 and stnt1, the meaning of the Rn and Rm are different
> from ld1 and st1: the vector and integer registers are reversed, and
> the integer register 31 refers to XZR instead of SP.
>
> Secondly, the 64-bit version of ldnt1 was being interpreted as
> 32-bit unpacked unscaled offset instead of 64-bit unscaled offset,
> which discarded the upper 32 bits of the address coming from
> the vector argument.
>
> Thirdly, validate that the memory element size is in range for the
> vector element size for ldnt1.  For ld1, we do this via independent
> decode patterns, but for ldnt1 we need to do it manually.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/826
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode             |  5 ++-
>  target/arm/translate-sve.c        | 51 +++++++++++++++++++++++++++++--
>  tests/tcg/aarch64/test-826.c      | 50 ++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  4 +++
>  tests/tcg/configure.sh            |  4 +++
>  5 files changed, 109 insertions(+), 5 deletions(-)
>  create mode 100644 tests/tcg/aarch64/test-826.c
>
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index c60b9f0fec..0388cce3bd 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -1575,10 +1575,9 @@ USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
>
>  ### SVE2 Memory Gather Load Group
>
> -# SVE2 64-bit gather non-temporal load
> -#   (scalar plus unpacked 32-bit unscaled offsets)
> +# SVE2 64-bit gather non-temporal load (scalar plus 64-bit unscaled offsets)
>  LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
> -                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
> +                &rprr_gather_load xs=2 esz=3 scale=0 ff=0

We correct the xs= value here...

>
>  # SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
>  LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 33ca1bcfac..2c23459e76 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -6487,10 +6487,33 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
>
>  static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
>  {
> +    gen_helper_gvec_mem_scatter *fn = NULL;
> +    bool be = s->be_data == MO_BE;
> +    bool mte = s->mte_active[0];
> +
> +    if (a->esz < a->msz + !a->u) {
> +        return false;
> +    }
>      if (!dc_isar_feature(aa64_sve2, s)) {
>          return false;
>      }
> -    return trans_LD1_zprz(s, a);
> +    if (!sve_access_check(s)) {
> +        return true;
> +    }
> +
> +    switch (a->esz) {
> +    case MO_32:
> +        fn = gather_load_fn32[mte][be][0][0][a->u][a->msz];
> +        break;
> +    case MO_64:
> +        fn = gather_load_fn64[mte][be][0][2][a->u][a->msz];
> +        break;
> +    }

...but then instead of using it we hard code use of 0 or 2 here,
which makes the change above a bit moot.

> +    assert(fn != NULL);
> +
> +    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
> +               cpu_reg(s, a->rm), a->msz, false, fn);
> +    return true;
>  }

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
