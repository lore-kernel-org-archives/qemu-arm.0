Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A361CA0EE4
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:18:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umuKL-0001Ir-Lq; Fri, 15 Aug 2025 09:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuKK-0001IJ-Jh
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:18:36 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umuKG-0004hS-Kp
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:18:35 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e933597bc2eso379800276.2
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755263911; x=1755868711; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A2SVl82lSKwzn5pgHmgDIU4GdUEyVyA3SjiVbW3mXOw=;
 b=fMdK/KF+0aYsabkMCExtpJCBOznAejaPCwqq5giPwUDGfQfKVCJ11UmOaa3QNXYDw4
 CASEYvFAhEq7PNqt/zc4kbbSSgIKccQiIxpvPZWm+hFEA0Z+/rBMMImIfUvPvjtx8Zsc
 YXk1yih140a82OZJOvBiKMnzHF1Gwh8/gz1t9zDN/+WO9FBY1/Ur/GyT/9HyXzjnUUdB
 BHgJf3xhPc7MqIjqO1cF2uc7dcY6SL9XXuWE7bocMH4Xl6bjyeEkmXvzAvTpDNlWcccn
 UpX2qZ8NR4x1/XluEyeuDEYkZe/36Gn81KUfMSSXi0Lsbu9APylo0XxJKSXS7DFFliJu
 U2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755263911; x=1755868711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A2SVl82lSKwzn5pgHmgDIU4GdUEyVyA3SjiVbW3mXOw=;
 b=sVXmXMNTFebyFFZmYtZbGj04SYF4QBWNw0LNHvKLoET6ziwGucdPYUktdGSnguJD0J
 seAPpHulOk81P6mFYSYqsR4PPoz+0ouOGpMYymKA3F1Z1JoSj8zh8ameGuFHRRSGi8IA
 aVuj4YAP0tZGy0TD4RptHWSEengpfZcOOC9fD4JFy5pjpWfH5kSv8r/Fe40vQGUKpfTe
 jp4Hgj9wuNE4BgFnLqe/ZPyTGw7MiT/lG5uFhVdOzyK/OeADdb0WxFLknLxXWYG1W5Zx
 Q//i0rTqiMJLRziB4sXUG9Sv1k35iX/RG3DcvV3CUpc0bzww0/6HU1CVIcpW6xhjX3pK
 d2Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM6DWRhdHicGu3O4zfaYMzyz2XBMKzBIA41xwmhWY/gTzfV6r9XkaCNCJmg74FjnoRiBfoKhFxtg==@nongnu.org
X-Gm-Message-State: AOJu0Yz7Cj5Q9byEazAxPcypoXRrgHNts9uEsT0Eyiw+N5lCrxzG5dvl
 ve9luSS914owG1wVJwfaUvb6sN8uPtSD0Sa4/ojxE32VIjiysToKc8wIZcneGN6P8cIWInPyyWi
 AhvMCKGMeKx4qRVSLHqLXDoQjm8JYrWA5rQ6nvsWAIw==
X-Gm-Gg: ASbGncsoSLec3y3+amU1RdbncRAHyR41Bj2zk+9wKOWcLdHBvECct7OjuJpbMQedg9l
 pSesLuRYK6Ct1jOALbOan/ZHQk7BKZ3w3oK59jlyo+UroEucwbk19hWuvuRXTDbvJdE60OnlEgx
 QNN0gRjqURCRRa0KFrWslHtGQ8wHsFwt8BCmaIovgL3kTYEO9EYAQWEFlFZD7jSgaRGQs3ZEYdz
 2YJcUH0
X-Google-Smtp-Source: AGHT+IHq1UIOye1aEteNk99Nf1KxaQCTc0bfeCCvtq816CSKeJ/uE6kAXpC70OFHLOmF2cH0Zh5BnXsSjEsW2PQH6fE=
X-Received: by 2002:a05:6902:300c:b0:e92:3380:3151 with SMTP id
 3f1490d57ef6-e93324dee4emr2608021276.24.1755263910858; Fri, 15 Aug 2025
 06:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250803014019.416797-1-richard.henderson@linaro.org>
 <20250803014019.416797-3-richard.henderson@linaro.org>
In-Reply-To: <20250803014019.416797-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:18:19 +0100
X-Gm-Features: Ac12FXwQcHZse5KJhgIKQE9HmeL_ac9-xF6s0m5U0_TIPlxwxA1qSo1ibLNCBx0
Message-ID: <CAFEAcA8YsRWk-dFMpnMc7ZgJNhOH5WuqHkhJ-0g2WATE6mAqdg@mail.gmail.com>
Subject: Re: [PATCH 02/11] target/arm: Implement MIN/MAX (immediate)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Sun, 3 Aug 2025 at 02:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 44 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/a64.decode      | 10 ++++++++
>  2 files changed, 54 insertions(+)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index dbf47595db..b70ae5befd 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -4552,6 +4552,50 @@ TRANS(SUB_i, gen_rri, a, 1, 1, tcg_gen_sub_i64)
>  TRANS(ADDS_i, gen_rri, a, 0, 1, a->sf ? gen_add64_CC : gen_add32_CC)
>  TRANS(SUBS_i, gen_rri, a, 0, 1, a->sf ? gen_sub64_CC : gen_sub32_CC)
>
> +/*
> + * Min/Max (immediate)
> + */
> +
> +static void gen_wrap3_i32(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, NeonGenTwoOpFn fn)
> +{
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +    TCGv_i32 t2 = tcg_temp_new_i32();
> +
> +    tcg_gen_extrl_i64_i32(t1, n);
> +    tcg_gen_extrl_i64_i32(t2, m);
> +    fn(t1, t1, t2);
> +    tcg_gen_extu_i32_i64(d, t1);
> +}
> +
> +static void gen_smax32_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
> +{
> +    gen_wrap3_i32(d, n, m, tcg_gen_smax_i32);
> +}
> +
> +static void gen_smin32_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
> +{
> +    gen_wrap3_i32(d, n, m, tcg_gen_smin_i32);
> +}
> +
> +static void gen_umax32_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
> +{
> +    gen_wrap3_i32(d, n, m, tcg_gen_umax_i32);
> +}
> +
> +static void gen_umin32_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)
> +{
> +    gen_wrap3_i32(d, n, m, tcg_gen_umin_i32);
> +}
> +
> +TRANS_FEAT(SMAX_i, aa64_cssc, gen_rri, a, 0, 0,
> +           a->sf ? tcg_gen_smax_i64 : gen_smax32_i64)
> +TRANS_FEAT(SMIN_i, aa64_cssc, gen_rri, a, 0, 0,
> +           a->sf ? tcg_gen_smin_i64 : gen_smin32_i64)
> +TRANS_FEAT(UMAX_i, aa64_cssc, gen_rri, a, 0, 0,
> +           a->sf ? tcg_gen_umax_i64 : gen_umax32_i64)
> +TRANS_FEAT(UMIN_i, aa64_cssc, gen_rri, a, 0, 0,
> +           a->sf ? tcg_gen_umin_i64 : gen_umin32_i64)

We end up doing the zero-extension twice for the 32-bit case,
once in gen_wrap3_i32(), and once in gen_rri().  Does the
extra one get optimized away ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

