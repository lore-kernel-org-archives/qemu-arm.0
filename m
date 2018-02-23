Received: by 10.28.71.27 with SMTP id u27csp480251wma;
        Fri, 23 Feb 2018 03:36:00 -0800 (PST)
X-Google-Smtp-Source: AG47ELt0hgLPhQ4F/QFY4vuE+WqI1V4//52hwwmTGUatwClAnDAP2Dcxu7l2iKVvm50JFxCDZr1K
X-Received: by 2002:a25:2981:: with SMTP id p123-v6mr756580ybp.336.1519385760089;
        Fri, 23 Feb 2018 03:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519385760; cv=none;
        d=google.com; s=arc-20160816;
        b=W07vDoi9XuzUHbw3kTB7BEvHL+s1gJF3ihRkT/mQDS93JZLYtgsrUFs06tZFiuRhIl
         3GfFpVD5EbAPMYNNn1fBQTrRtpt2Til6XoL2asBU8jlf/QIkhTvT+p7cWK+cL8igYrvj
         DUDM6WGHNbp3QOKeZ5I4Tw7NDVFd9cAjxHlFR0rwhUvOQ/KISzXGJr4PrXAfUf3J/f8g
         BSFZuQHl4CCmSYw7tp58eD9Isgw9CO/Z9pT5rAHQejXK9oDVzGztIilrgT87/oV/t3a7
         y/IBHM1U0mN8/gTbn47hZNarLkda3z5iFJzTR/tx/oXpIraMevq+2gXjwsMHp4FrmkYI
         Ha1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6YaMjzS099PGfewmy3xxi889DgtDtiPvnra0pYL4cBk=;
        b=h/h9iikOuPSwX3XgkrvVoSs3GMK3L4bLCXDbi7E5f9q7NwcH+QvCwAAK+5aVFNTPak
         3gSe0zpTG8GL5AxHERDpatmhhmbKfTtKPq6xIWtKwu9+msGAQEyr0ZFuzvOw5vobY0M5
         K+/weBuiyI0gKuw63gR0ii6DyrLXT4n2e+SpP73vlK6dBf3Gzqre2P1qbivQsqkp1Isw
         ffIt+NOpiw4vvxEZaD2aLZWaGDpg0mOZwtjpt16DuEBmqxzOTaYmWnsyEE/EaCtUaqXu
         zZmAdBMBuvgHKseexHlrMba+KgovEOU3dF2Cz0Km8n1EKGTjnuRbSUMa1GrQJoKXpaGH
         HgjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=akXiJHtL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17-v6si366585ybj.636.2018.02.23.03.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 03:36:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=akXiJHtL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epBdv-0004kp-Hy
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 06:35:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBdn-0004kf-FE
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBdl-0000iF-9F
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:35:51 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:37365)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epBdl-0000ge-1M
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:35:49 -0500
Received: by mail-pl0-x241.google.com with SMTP id ay8so4738212plb.4
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 03:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6YaMjzS099PGfewmy3xxi889DgtDtiPvnra0pYL4cBk=;
	b=akXiJHtLEfy7zbc0lByRC3NaixD21TPFTZ7QweEd9n6vQ4eIKDEEWlOiWE1/fsdeny
	copdB+pW5G/53D6AesQPoUVOBIFcCUMIAb93xazYNmFJD518ZNgsUHyj5byA6n21p0Da
	nI+05J72L/Gnb8KYOvuLUf+H/P695LkQyN2A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6YaMjzS099PGfewmy3xxi889DgtDtiPvnra0pYL4cBk=;
	b=GcWt1IDT9U/nv7hBaxTh4aYLcPYfHQns8MySQycQ0u8jSLiHfSbLnEWXZ3mtNAAoUn
	Kn4ePZdmPDzUaUdxNpi5AMhWh0EjWSLWWnmhgZmQN+wJvCEC0XeOWsOgR+8dWGoEaR1r
	HLNMHcJWvTPqGymVRqv9ggIxO57jvyPH8vugryakPo+1orQuunmCJLEMh9yvvpZmBGB2
	MOThD55KTKMty/7T9NuqAmYOPHq8YZZZ0JMrAwc4gVAu2eXfHzJAOXc2UfoMih8rgbD7
	2a1Fpg7+DJqKnlXmExSjjxEHJzZ1AafxOOoMgTtjHumwUDJ6QZ/MiLgW6Sq28SYOeQgN
	M/Qw==
X-Gm-Message-State: APf1xPABrGkjAfdh13YUP9gRfokJmG3QYI+aSFVXC97BB6NNZwIkvf03
	NSXjLtCU3XcRpPxDlvmbXHNi8QZNczBcts6KcjpE6Q==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr1469444plz.436.1519385747953; 
	Fri, 23 Feb 2018 03:35:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 03:35:27 -0800 (PST)
In-Reply-To: <20180217182323.25885-10-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 11:35:27 +0000
Message-ID: <CAFEAcA-jg_+4vockJi=iP9VxekLH_FBPwUDJcyDrY-J+OYwm9w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 09/67] target/arm: Implement
 SVE Integer Binary Arithmetic - Predicated Group
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
X-TUID: gUABfcn2xkPK

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 145 +++++++++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 196 ++++++++++++++++++++++++++++++++++++++++++++-
>  target/arm/translate-sve.c |  65 +++++++++++++++
>  target/arm/sve.decode      |  42 ++++++++++
>  4 files changed, 447 insertions(+), 1 deletion(-)
>

> @@ -105,7 +121,7 @@ LOGICAL_PPPP(sve_orn_pppp, DO_ORN)
>  LOGICAL_PPPP(sve_nor_pppp, DO_NOR)
>  LOGICAL_PPPP(sve_nand_pppp, DO_NAND)
>
> -#undef DO_ADD
> +#undef DO_AND

Should this be in a previous patch?

>  #undef DO_BIC
>  #undef DO_EOR
>  #undef DO_ORR

> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index a9b6ae046d..116002792a 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -211,6 +211,71 @@ static void trans_BIC_zzz(DisasContext *s, arg_BIC_zzz *a, uint32_t insn)
>      do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
>  }
>
> +/*
> + *** SVE Integer Arithmetic - Binary Predicated Group
> + */
> +
> +static void do_zpzz_ool(DisasContext *s, arg_rprr_esz *a, gen_helper_gvec_4 *fn)
> +{
> +    unsigned vsz = vec_full_reg_size(s);
> +    if (fn == NULL) {
> +        unallocated_encoding(s);
> +        return;
> +    }

I think you do not want to be catching unallocated encodings
this late in the decode process. We have to identify all
the unallocated encodings before we do the "are SVE and
FP instructions supposed to trap" tests, because those don't
apply to unallocated encodings.

> +    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
> +                       vec_full_reg_offset(s, a->rn),
> +                       vec_full_reg_offset(s, a->rm),
> +                       pred_full_reg_offset(s, a->pg),
> +                       vsz, vsz, 0, fn);
> +}

Rest of patch looks OK.

thanks
-- PMM
