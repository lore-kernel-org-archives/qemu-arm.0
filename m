Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F13C79F82
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 11:09:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3thJ-0002UU-SU; Tue, 08 Sep 2026 07:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3thI-0002U5-Cn
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:09:04 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3thG-0002uW-AL
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:09:04 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-836ce6cbe1eso33563177b3.1
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 04:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788865741; cv=none;
 d=google.com; s=arc-20260327;
 b=doK8L37vejFz+v6r5jzlxIDYRFPZLfz5ZCiLyE6YAuwB7SuEvVXTWozDlwPoQx0tez
 D5p7nXtfl97zZYm0GPogtziZ9RW31VYF2ZOj9ir+IFCgGj9zKbCUTCcvS6QC4pT/H467
 HNVUZF+yTJOkKJl4DO1q2RamHl23XzI+hzRo8e/yoIwQ62bcRxWKNeq1agEtohxHj9vy
 BKnEor8WJFEschQyBsjnSeOryR9Nt5OgYUVFuIctLhrKpFfjXtOCIsYwn76q1riQDiwR
 CYNMkZqOy0QhWCDpq9QAukhaHla2O7mE1e3+1/HAJC4egbHa4PvA1A38BiEeTRsrywc7
 E5JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6zzCrh/17UdhMQXqTF+7vnnKKNLQtdkheDiXfndDr5s=;
 fh=pxvi3fnpkZrrjd8fPrPcSDM13XEorAzGSQVgw5fxTFM=;
 b=VFqiYE/rTu3bHf8N9y74XFh6Alk5kNNbXpp2UxI1I7+ajtfuSNEEgDCMonZ9rlsbHY
 PF9OWDTFNamO6GzXkR4sSCM74aRO6wSGE1a3xQuT0aNFoxjUfOh5uvgNc61UZD+y6NZn
 22P8rN6hdqhNOvNx+tqbNVuqUE2lzQrd/IQ6TDuO00xIVadiovRjvWudmSrEDqsRU4r9
 PNdUSj2CkczamiKNIkq1FzzN3quU/NgYhajJm8ylkkZeLlaiN/8HY1a7VzZ0dVyt2E0d
 uFvADUZvCt9r59otLqTbAjcML07QjDZ4/KKMWIHopnkPX0E7foEn749bY+q5IYTDbRJd
 iHXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788865741; x=1789470541; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6zzCrh/17UdhMQXqTF+7vnnKKNLQtdkheDiXfndDr5s=;
 b=ZOPl+49+574jpvu6qX7VsZAnz3ybpqJMllg5kcfzjX0ptNlbm/hz+uwRk6iD1yyG6y
 jK7y68oAmOzhgNiN/agGLnrSH92De5tirdECzyT7l7AwWmJsqBgmt8U1XLrhb/YcaXwD
 S/hOXllcGltwxZa4oq4yeG00/Oe7rPkF1FMN1ktRVXRcq9HKLzlpVzPs1pzbW7mA0YUq
 MHu+2GTMSIbSlUzrQUE3XEmpIXkXGghm3IZ3hNMLhFd+zM31M9kYxljHjZbTzhxhoy7N
 SVoSz43rIXBYllbpdy74Yh4Y0YPr/ze+4vAt0ApJBpO8MwmuGKTHvKrgj2j0ImrGf4Ky
 3uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788865741; x=1789470541;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6zzCrh/17UdhMQXqTF+7vnnKKNLQtdkheDiXfndDr5s=;
 b=FD02XCTuenZUfkaY5BzYa4wtNyuhUbu8hZc9VustWTToLXBjB2coEoAunw0ujtGxg1
 g8PS+zQVLushF2Eu7lTkWYA4LhUAYEgE1/2xJmgOPqqlcD4n3Mw53hWAwQG2rY3OOMlH
 VMZHKrDCEV0wSJv56hVOjd1ulErtpZb/FbCMIZWESfhXjwAfkMW+DGKirJkvmEfGEr4U
 iyy4kWdhBYJsRz+KL5a079lqEiaSAoTfkNxslq/KXVToDpT26U3apF+QtLyym8w4MdY8
 LzanG+OwaGWT7E9VNIJFzHgbbvDTAf3wNMY/KadGpiXo/WCaL9/iWiDCCNbUT3dNWrT8
 b4mw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwO7RsXJ68mDKObzKk3ln1IC3SOznmdHcc/qtEUnwennyJ7/cfqXmXHLnsDyxHQvdYK6rhGmcxHvg==@nongnu.org
X-Gm-Message-State: AFuF++kKsKu5JQNkEZI0O5ETfun9mHy+V3huvvYhxKFKt2rGPAYvBnRh
 mFG4DJ3Cx9+eZg5LV4C45Q7B+RJUDEyk55ZnbdJKBHc5V8TGrNsKL7Qq45KWmn/OsSEfoRJCq6Y
 3bnut+w/QFaxy8+09LHxw0Cjymz7TfrgYoZuXIta5IA==
X-Gm-Gg: AYBFou12BTV8aDZfnd/M5d0K1SizhupoQRRbFNJ1RUJx3ImTr3SkdeMa+bq2e35iB7r
 5Aqj24DjjqhtSIS/juG1my29UqrgGfytol53wuxSl8+4KTXSUJtufk8B1KwnIiGMgj9ijK4foSN
 5DRSpy2tCNoWy2EsN+VTUaRZ0wxBLOwfD5P5g2B9OnzAP9hmbwm3MWXV75MZMunCXgyQ7rMWF/Z
 mq9US2oxhp9dKUDTNIG+V9ALIQNe2UrUhbfVoBamaoi4nmHYHqveeLJSnxFK6vzAt3owIjAJIdX
 80MbVb9Z0HWraFztpBYFkYhRGb4L4/e+ARHdYx5EI0YkB3wC4Z0GffYClVr1yfOTtDCkCjHtm7G
 NO1EywI4cyl8fBx4uVREjg+1zvDGR
X-Received: by 2002:a05:690c:399:b0:81f:4247:de16 with SMTP id
 00721157ae682-87129c559e4mr107216377b3.24.1788865740807; Tue, 08 Sep 2026
 04:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-12-richard.henderson@linaro.org>
In-Reply-To: <20260828222639.1432046-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 12:08:48 +0100
X-Gm-Features: AcwNN1WdHHOKYVXi-9jlIdFsbzcihkz2yn1WGA090iQPLDFL5Nwo7ZMSzO2VLXU
Message-ID: <CAFEAcA-9BWhLf2AagEcnacxMYKPYGKC=iKKoGRvPg4BW0PtbaA@mail.gmail.com>
Subject: Re: [PATCH 11/13] target/arm: Add PSTATE.UINJ to tbflags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 28 Aug 2026 at 23:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
> index 296ec8101ab..174f4aa746f 100644
> --- a/target/arm/tcg/hflags.c
> +++ b/target/arm/tcg/hflags.c
> @@ -292,6 +292,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>      if (env->uncached_cpsr & CPSR_IL) {
>          DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
>      }
> +    if (env->pstate & PSTATE_UINJ) {
> +        DP_TBFLAG_ANY(flags, PSTATE__UINJ, 1);
> +    }
>
>      /*
>       * The SME exception we are testing for is raised via
> @@ -513,6 +516,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>      if (env->pstate & PSTATE_IL) {
>          DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
>      }
> +    if (env->pstate & PSTATE_UINJ) {
> +        DP_TBFLAG_ANY(flags, PSTATE__UINJ, 1);
> +    }
>
>      if (arm_fgt_active(env, el)) {
>          DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);

Could we do this just once in rebuild_hflags_common() rather than
duplicating it in _a32 and _a64 ?


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

