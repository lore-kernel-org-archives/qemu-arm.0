Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1482349lfb;
        Mon, 6 Jun 2022 09:12:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKJZoXL3wMeTi9hR+LLGJqfy2DT5MY4sRfCqSHQ6meBTRjABzU00wu35GZwMg8inZYs0pK
X-Received: by 2002:ac8:5cd2:0:b0:304:e740:d444 with SMTP id s18-20020ac85cd2000000b00304e740d444mr8418820qta.341.1654531934139;
        Mon, 06 Jun 2022 09:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654531934; cv=none;
        d=google.com; s=arc-20160816;
        b=MVeCjEbvRwszeitnN7SvG34p3NuTW6fkpRmetYNglA/bkbEs665pjHiYmt3EntPyqB
         MfIgkBGYkZUSIrfz2Wr3lGaXByq+REsGGhhiyUAEsNFHvp28ZclqnAFCkGWraVEQ3cH2
         y3KPzWKzF5LsM+zO6qeur9Uprv1tnHYtj+QtUx6FTjRXj2odP23EG0Ob1B9y/uI79CU6
         10rF6p7MEEoufDEpzIV1HNM+1INygz7jLZckxpDD0Uw5mgZIc1vh0ze2oCOPPZRNfo0J
         xhczIn3wZ0hBJfRzlPawwZQ4FirP2+zsf5ptMN7iajMXxUXZycxSl/fglbPNPZ/te82s
         ngvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eKRfOqP25EiRc9vL44tKEywJYxx78TNx5KgYXH5Keeo=;
        b=XGayLFO8C6+XQ9LXYyQi6GQFE0PpBzbh1VaIr8CVZfOXZH8qBfv/3CgvtcISplCepn
         H0iEtxt4T/z5/soLPaL8S4LbnShDyGaRQp3QKgNULnEbz5879ylOaK8S1FIKON5ATnh/
         KI+YG/YSj2gpiCN9eRyuEVzVNyyp3HYFUO7O567+hczw149bnLtpbtNu2tQV1LdwqI3L
         KNDnfgfAJFki1crPKQYgayDxMVs5KR5mveqgiBEDi9XBKPoDIf/sIIGwqhcsYuovxivf
         TbjKj+2tpBhgHxlZxIWewIMQQHG+c1zTLR7sjqXrNm+I+LB7S0R5PEyFMr7Ehei75GK5
         8wAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VAg2MPjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05622a171100b002f3c5e0f3e8si8035592qtk.663.2022.06.06.09.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 09:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VAg2MPjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyFKv-0004WQ-ML
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 12:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyF7d-00084O-Tl
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 11:58:30 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyF7c-00063o-6G
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 11:58:29 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-30c1c9b9b6cso147314067b3.13
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKRfOqP25EiRc9vL44tKEywJYxx78TNx5KgYXH5Keeo=;
 b=VAg2MPjkVE97yViRFVGeMvOD/3FnRQsM1mEqZklU3V9+bDlukFK8G2wIkHYXShhj28
 wBsOaNRjNzPSS8t9IGZqvglzVCxAWLYAn0DnOd911+45bggpSeYoOj4QOc9sK/SEXnhq
 z+3Wx1es/6YO4wbs3rWuMYhxgw9pppticKiJJxj9HqNCajLvcTi+ioNqvO9zF2uDsOsi
 8U7xhVnWj9RCv6XpE53joCWpBZbQ7l8l+zi2+BR2zjKEAja1/9lhsCNYW0+ZhqruBzBH
 XlU0D/Tecpt80j/mkK2V1WtIsfFpakX8bqtqiMQOVMLlpflbmuc+bShvm8EPa0kf738F
 NmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKRfOqP25EiRc9vL44tKEywJYxx78TNx5KgYXH5Keeo=;
 b=P0jsrMX6rubPPQAasI6PUqX0sc6azFzTNZxzKYGhBIgtN296F9elg3ZbYZ7QH+NOC+
 oLWrRk876VSLSBEJT69ISUVK16xsm4XSvvn/HeT/iR1SQM6e9sSbV/aXHgJ+w7hYL1Vw
 qP338eTap+canCIIf4vAih2HickydbwjGA10Ubvefrm9h7z2N/esajgwn+tSvcG2So7j
 PlIiwWkrLQXMw/88dkwQaCCemzhNmNGHWwoBPVEVz2NqMT3UYdB86Vq736hhU79Z290b
 xadP4LO8YhnDhlbRXtiYzC7ra4/UO9t3E7/xhP/yzAEAKPX84ria1tVYy7jhNnmH8JZE
 A6kQ==
X-Gm-Message-State: AOAM530Qf+hrOPmZJdWXwmvkXwgCmjuHTZqJqbyxK8O4cV9oJdpa6YbT
 aI93Hn9WX4Q6xQq8mF5idiICP2910e+eZ49TO63Gog==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr26278980ywc.329.1654531106587; Mon, 06
 Jun 2022 08:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-29-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 16:58:16 +0100
Message-ID: <CAFEAcA_+-xbJkN8uBCL0UyJUmu+wrU1i5EMnwSu6pjC++gjg5Q@mail.gmail.com>
Subject: Re: [PATCH 28/71] target/arm: Add PSTATE.{SM,ZA} to TB flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IqXAnckikF8h

On Thu, 2 Jun 2022 at 23:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are required to determine if various insns
> are allowed to issue.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 2 ++
>  target/arm/translate.h     | 4 ++++
>  target/arm/helper.c        | 4 ++++
>  target/arm/translate-a64.c | 2 ++
>  4 files changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1ae1b7122b..9bd8058afe 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3284,6 +3284,8 @@ FIELD(TBFLAG_A64, TCMA, 16, 2)
>  FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
>  FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
>  FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
> +FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
> +FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
>
>  /*
>   * Helpers for using the above.
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index a492e4217b..fbd6713572 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -101,6 +101,10 @@ typedef struct DisasContext {
>      bool align_mem;
>      /* True if PSTATE.IL is set */
>      bool pstate_il;
> +    /* True if PSTATE.SM is set. */
> +    bool pstate_sm;
> +    /* True if PSTATE.ZA is set. */
> +    bool pstate_za;
>      /* True if MVE insns are definitely not predicated by VPR or LTPSIZE */
>      bool mve_no_pred;
>      /*
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f852fd7644..3edecb56b6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -13857,6 +13857,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>      }
>      if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
>          DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
> +        if (FIELD_EX64(env->svcr, SVCR, SM)) {
> +            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
> +        }
> +        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));

Why did you write these two differently? Don't they do the same
thing (set the tb flag to the value of the bit in env->svcr) ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
