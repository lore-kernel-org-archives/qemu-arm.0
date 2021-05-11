Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3803716lfg;
        Tue, 11 May 2021 02:35:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGwORbcM8JspcsnDhibIMef/fkCLSvPGNBaXBnGTzDeWRiZM/yYivAG6HZUlnIBeDNSnm7
X-Received: by 2002:a67:ff08:: with SMTP id v8mr24234845vsp.10.1620725704936;
        Tue, 11 May 2021 02:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620725704; cv=none;
        d=google.com; s=arc-20160816;
        b=twPsupWAQLyNMAOxpohSKqbUKeGEnA1ku8i+8ve1Lq0BVhlA1kqsub/SRhHypP7HX6
         VUAMeiYcR4CJz7AKStfNk01Erb9xPzTmcQ3cTA3XZl1BipwfzxtFm9OqccaMpkqmiCZ2
         tpdPuc5BcgJB96MVlXrQ/RYqK89k4EYu2jBZahqClRw2xT1ALzBq9jdcgWe66alv/X4t
         2SzhUQXwb3QRva3R/NOlhszOWnsL1QtF9sh4CFIZgH8oeegEOlD0C9/0Sxkb2r8Xd+JJ
         VfSaAA8I90Q16vGDPWhZ6SqZbL5rIdvZXrC+Vqq3wLNvFVUN7rts0I2lvh9NHb7ngAae
         pq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrwO0kBPFt2SrzVRLwLy84GfK+eQ74QzZdGSn0uzGaE=;
        b=oMBOVxJ9jHCGNkhKb/mHBZLH1n04uKbtFdFtb92Ba5YlzrCdiiI0fa44PXnQwDNDE4
         rz0WD3caCdbZa8usDXAx5GH4siISpndu41iu1l7dq2MqA690WEmX2D/xoyBEgaov4xmq
         cENKtcvDZhSQsZPEZplT9V1fHhqiXcsyI0H7rmpTTEhVS0Vh5n5J1dRIfW+mvw9UwSGE
         NPSktoEHaAQOO7OCFNHXPUi7oqUAqzV6hiBH64knpyEhV+g36+YYhWgeCf1GFgY4Cv+9
         7Loocf9/9O6LonTmJhaK8K0WZ7uTG3byVsU3Ieq7GZ5FMzTr4nH/w98wvVM/uJLK7D1a
         3J/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6l6gUWx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o63si9105847vkg.30.2021.05.11.02.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 02:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6l6gUWx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgOnA-0006Zr-6e
	for alex.bennee@linaro.org; Tue, 11 May 2021 05:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgONR-0005rA-1E
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:08:29 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgONO-0005h6-V1
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:08:28 -0400
Received: by mail-ej1-x62b.google.com with SMTP id c22so550791ejd.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrwO0kBPFt2SrzVRLwLy84GfK+eQ74QzZdGSn0uzGaE=;
 b=R6l6gUWx/GVu2hexFmoy7zkXfbKBYbF1VkK6isJRMfjel4gByeIfsavJ4he9eJhnvE
 hATZl+3IphVi4DIn1ORxNyApFyWl6gPxwYau2mH3CsCuF0+6KtIpg7HnLSUzDH6aBTqD
 sGDk5fvwQDxKFkUOH1uq6pU5lZoV/Zp5w+juUS81izBjTqmrk0Xt1bYCNVfoQPXybWiL
 DOEoSAzZG2nzhMF4oY5Yvrm4/r6xvM/aXXYdd1JPiMiHtR4TlNpZKnrVS5IoQJlD15qZ
 HRDz3gyrNDMwk9dgMC2NdoQLior03LnW+R20tXtZUBt5Vx6yKM/YE9/y4tCUAKGEjqba
 AJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrwO0kBPFt2SrzVRLwLy84GfK+eQ74QzZdGSn0uzGaE=;
 b=J6lJFem8Eo8AzwtPtkx/7ggxoOULcbollZC4/hyx7vZHFJMjj7+x0A7xonQFAM/X0O
 XeksXz6t0QoOuxA2CfPsYvVAU6m4ynvEUpfgr9/pVn2eWa26TL/rRw5OC8byoKOB9vnu
 ZartJsh2/79GdnWLKeGu0+TTJfR7QVYsIO15G6MhNWq6C4DOZ+iefe3Ip5ImvHCPz/a3
 1TqyAJxWpbc6mW/G0O9uYM2c6PXd4n8EKXmDH3L4ht6MEd+ihEcm/sxYA+R1z7OUyvbG
 7/9p8U7bJPH29Ay0ZdyXt+oIAnDusdfcxeEhGnL/no9SDDTEZB4Ni9VcxDvOMEb7B73G
 nF0g==
X-Gm-Message-State: AOAM530KYO+hcLlX90eKDUYy7nJqwwdLCjXGze89bA+7ylMeFbXOjRvv
 BmqHKZ9iZnAn0wlHYELwxLG4a79vtZmBTbsg1X5Eig==
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr30782664eja.85.1620724105171; 
 Tue, 11 May 2021 02:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-10-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 10:07:12 +0100
Message-ID: <CAFEAcA_CuY7D+FEfW-g=da1yd6wSZOSyiDVEBZft4qjLw_kYXw@mail.gmail.com>
Subject: Re: [PATCH v6 09/82] target/arm: Implement SVE2 saturating
 add/subtract (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gr83WvZJb+8e

On Fri, 30 Apr 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  54 +++++++++++
>  target/arm/sve.decode      |  11 +++
>  target/arm/sve_helper.c    | 194 ++++++++++++++++++++++++++-----------
>  target/arm/translate-sve.c |   7 ++
>  4 files changed, 210 insertions(+), 56 deletions(-)
>

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 7cc559d950..12a2078edb 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -678,6 +678,135 @@ DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
>  DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
>  DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
>
> +static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max)
> +{
> +    return val >= max ? max : val <= min ? min : val;
> +}
> +
> +#define DO_SQADD_B(n, m) do_sat_bhs((int64_t)n + m, INT8_MIN, INT8_MAX)
> +#define DO_SQADD_H(n, m) do_sat_bhs((int64_t)n + m, INT16_MIN, INT16_MAX)
> +#define DO_SQADD_S(n, m) do_sat_bhs((int64_t)n + m, INT32_MIN, INT32_MAX)
> +
> +static inline int64_t do_sqadd_d(int64_t n, int64_t m)
> +{
> +    int64_t r = n + m;
> +    if (((r ^ n) & ~(n ^ m)) < 0) {
> +        /* Signed overflow.  */
> +        return r < 0 ? INT64_MAX : INT64_MIN;
> +    }
> +    return r;
> +}
> +
> +DO_ZPZZ(sve2_sqadd_zpzz_b, int8_t, H1_2, DO_SQADD_B)

H1_2...

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
