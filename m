Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp259150lfg;
        Thu, 8 Jul 2021 05:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbDxbBxgB8wvQ+OKCKMTQinHf3VVGfXZJ1O0kWOeAhnfEMlpyMRnjVqJK9UP2liEfTouO/
X-Received: by 2002:a17:907:3e0b:: with SMTP id hp11mr31285527ejc.523.1625746015853;
        Thu, 08 Jul 2021 05:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625746015; cv=none;
        d=google.com; s=arc-20160816;
        b=yT8NNtdllxmGP1piY3sirHRKUk78KgJbFLzW0ZgMidK7lJ+m/51mni4tFTTl1/6niE
         PB2KtrDSVlatQUFgzmXKexZv751Awrbv+nVYNqBgREZ9Hapvy3QtgTelJy3WvnAVlir9
         dmf/2TFPVHB4JzF4VO5Nq9GF8VdZ8RNVOxtCeIlUcYJ3ZYKJw4gwTBSLbAUoRf3J6g3w
         PdMv/ga8reOIIDXGRtEEe+x7cr5LTn8rZbVA7dq2QwQ9I0kRet7QcE6SwGimRFUEE7fL
         1h/7QNe4UVcVVHtIZjWQMtjHfcqnDALpYyHxxGAv8tpMwCJORogXKr4R3xCS5fnisvVO
         dHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=30GVWM/8KrSc2VI2c4MSiCczIiOAR7zEQlc3w70Ez4Y=;
        b=jauVJQQXzLO5CvzGNT/Kw0edcnhyW+ZFiDB/G9R2XaHyodNuhySZ9fZQkCKzay492q
         hULoXvzepBewWnz/3vQ9qGm7VKgE2Rd600jZJkb60JJPfb/Lg+6i/CufLt4f+y1qkDqw
         RSOXJIDe6qAArdjyda9RxEWUABycnb+0CbBxbxhbgvQp9fX41QgOBUE0+0b7OGlWxfI4
         nCvroqP3EEeh5pmYGpdw0NICGMkEzEEXzPSUCQlyA+Dx2qXRaqEuqsUmr9P6y+ycPw3X
         FrtS/AHLsKXDD/cgR7B8yYM5TkPd6iau/MXz6sGlq7l7GQr/FwXTT22OgbWoHgLsybuI
         Oiiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TGRx81Hn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21si3006648ede.506.2021.07.08.05.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 05:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TGRx81Hn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Snu-0006ne-VF
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 08:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1SnU-0006PQ-8z
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 08:06:29 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1SnQ-00051e-Ll
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 08:06:28 -0400
Received: by mail-ej1-x629.google.com with SMTP id gn32so9228590ejc.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=30GVWM/8KrSc2VI2c4MSiCczIiOAR7zEQlc3w70Ez4Y=;
 b=TGRx81HnHL+iSdrt57C1/GJY7+1eYMM+IoG6lQfPBxJSmDiu4E+M0x9eM+yoe95BF+
 /P0wgNkRRnlEQUpQ2IP//iyD54Rh8XqaJzulCEqC+ISPmdpUHrroLTfYFJwoecUAbX+W
 vOdr5e9bjnlVxU00M+EokmKpb86mZiBVdDQ/Vb6DWNG02+oENfJaJpDJ+D/sE08T0wdg
 JlDuFY+mgtiDq6LLqIqoLDbQVVpGGLzUgcXMDXBRedyRY6RG8H7TPBp1p/NHn4AgnrAf
 XfbKr966Iu8xCzm43kDCCT4r0XMyNZaRIEQAqpwhRfO/eUncFxpJvi3a9x9ymS0o2xOg
 dzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30GVWM/8KrSc2VI2c4MSiCczIiOAR7zEQlc3w70Ez4Y=;
 b=ESuMjZ47l1g5usiNACO6fLaIPlYgEpBIBnRYE9DDlyTf4dunfWeAMIvzLNSssJJd3x
 Ds0Bp3Y65c31ldRn1YbJ3JWz6Z1eDIfbUCXB5QqjfQ+C8gCeRPjE7vS8s2KwBUkVLaRJ
 y8TbHIqkOvFiRHE9pb7TPzC0etQgQQSj34S/pNj9maIvSjmU204m5gyFpSoe7/HEq7S9
 k6yzqiZ4BWrxUfC++si989wT5ktkKsjXv45tZBFceDNBvOwGOsbNK4v8lO297jrPlt7T
 FdKt/E3wFxIVpfPp1vdmu6tpfJDmBIwo992G26BYQ+30vSKjGeOwTk1DPOl7BW9usJVJ
 A3mA==
X-Gm-Message-State: AOAM531Ky/WOwwkxVH40IkyKDd4wkwZ9JJj9WcStK7esVHbJg3Zyp0jB
 FnsHrISy/pMrPrge8j8myNThR33ka2zysVjvTyReyw==
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr9313806ejb.482.1625745982824; 
 Thu, 08 Jul 2021 05:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:05:44 +0100
Message-ID: <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: zj/Q+iHL+jUh

On Wed, 30 Jun 2021 at 19:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Using gen_goto_tb directly misses the single-step check.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index a0c6cfa902..8cd31feeaa 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8582,7 +8582,7 @@ static bool trans_ISB(DisasContext *s, arg_ISB *a)
>       * self-modifying code correctly and also to take
>       * any pending interrupts immediately.
>       */
> -    gen_goto_tb(s, 0, s->base.pc_next);
> +    gen_jmp(s, s->base.pc_next);
>      return true;
>  }
>
> @@ -8596,7 +8596,7 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
>       * for TCG; MB and end the TB instead.
>       */
>      tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> -    gen_goto_tb(s, 0, s->base.pc_next);
> +    gen_jmp(s, s->base.pc_next);
>      return true;

Why isn't it enough here just to set is_jmp to DISAS_NEXT ?

thanks
-- PMM
