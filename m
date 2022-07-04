Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3168172lft;
        Mon, 4 Jul 2022 05:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ssc+kLaa4ETfEJCxj8MDm8eisEUetZfYqXqObsjvPBHoFMt0cUvoIwRBcceVl6j99QpIVQ
X-Received: by 2002:a81:1b4b:0:b0:317:a2dd:31fa with SMTP id b72-20020a811b4b000000b00317a2dd31famr32709337ywb.476.1656936005755;
        Mon, 04 Jul 2022 05:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656936005; cv=none;
        d=google.com; s=arc-20160816;
        b=urgG9NsU6uEwT4Dw+pMfFPuICzn5cPgMVJss3OAY1T2trt7w4+ExRH/m/wSnp757qQ
         QVqMMrQQmj5BVXO9W50opwznCGgudedzqMAy8+u8Ox8esqFvwvTP3foIAB4xdRd499bj
         mQxJJBckv2g++6MTGAjOLuOS1/BHF85NZaxfo7usc5wpe758v43mVlIC1tZnTir+5m5j
         lDcwVefg6utTg3NFukjQ3CyCSHITfUc+BQ7CKOHzUR9TcnsgPjy6DZLEQ0qh9VasX0K0
         SU+yN7bjJGFJ2u+ZuZh+F9ik6ZzcJ1njmzLf8GBe/V8cSFJI1OFIPj1Ae+Ma42OHg8JA
         g4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DP+j6hNG2z3p060HcNY+Y41WJ02dxQeqy5uNBYrfE/s=;
        b=jkhs72Yi/zWy21JvjjUcgIYujpJPY3SdqqPy1oUtpnuimAU7Ta3Oo251mZedfnuvfj
         7rpsx8i4pUQP5hIGEEuQHLgGwyTULIZtMJrEMraH8SWFdQg7msULNi9/wLFNneryUl6r
         Y3bgMwZejFfIPhGLQfpETKpskOINHpjwca8lflk/8BMpYMKE7Tbo0ahR9LOfQCiNiH3U
         LzdhU8eTnRlq2k/hZZSAd5PRmCo3tpZdl6GqqgwgDSh9ivBHuvZSbnidjA05/ju/Gsgc
         aWYEoYAmtEVj83IAHKSNCEcwsTYK/OO2fJwXR7rdOUgPcSBTEL+DnGVKNiNV14WD/2dT
         CI4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vkk3yls1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d138-20020a813690000000b00317cadaa1efsi37140036ywa.545.2022.07.04.05.00.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 05:00:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vkk3yls1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8KkH-0000Pm-2H
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 08:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KbW-0002Rs-7S
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:51:02 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KbT-00033x-Dd
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:51:00 -0400
Received: by mail-yb1-xb34.google.com with SMTP id c143so7908946ybf.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DP+j6hNG2z3p060HcNY+Y41WJ02dxQeqy5uNBYrfE/s=;
 b=vkk3yls1YpQGkK1CKY11VLhwrgbz0oAvu57roYTYKKV5l+fT0it8UntdP9QY6tUyNY
 mC2g0BBqgx0UxLulo5rRP23GwBCzJKlncHwDWoyoJZQ1DYlKg2WaMKTopfUMd28Byfhs
 xnvS8mOiFsooNiWdfKtwgZ61BbovvOOmn0zwl+5ZKnkFaqIaJ4x+B4PGe0Y9mI4/EPtC
 PUhJfFA2y12OQ159LuEarbRxfMQuF1zLwymaTuODMafaTb/wnoKMP6ZrZcbqvD1JcB5Y
 W/URP6mmPKRqbVIWwRNFFVJE8PpbPOPkPaB9USdXNCteIpATrWsTEe39A5FpsDmjTXos
 O/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DP+j6hNG2z3p060HcNY+Y41WJ02dxQeqy5uNBYrfE/s=;
 b=U2bIb3LW9eQ92gBljPCRoso0LVdIzQq/9uZC2cHfHmbgUJwuyM3Hy8bvfBotPYPPuD
 ZUU+ejboi4/sgPrPPAhD+KeGWMmndo+QcvOAX5m6HlPqf/HFyKz2at6yVDcO77qU1/Fh
 f20pPYLcAa9PhGPWLXAkEWDyy1lFHaYE+lKA11gh0ic+/HS32/gwqik6HbF4fXbkEmNe
 epTl8cNK1K45iyyjnP7Vkktn3c/AQ9txgYaB/U+xNrEhzs97fdML8bnPhZBzFrLaFF5n
 iHTVDcEhsDPI14rhgL6jKIOOWAIxvsHYlAZFwqfw1kwRSjJ5DPUDV1qma43kuiZdSa7u
 HK9Q==
X-Gm-Message-State: AJIora9hoBiFBRrEUjSEqSlnlPvFQI9LKrKcOqBwOUDNuZiVgUGaptJ6
 7TsLJA4H/09xFQvdGXfHdwA/wbyGeA9KPlezWen1XA==
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr5555489ybg.140.1656935458380; Mon, 04
 Jul 2022 04:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-35-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 12:50:47 +0100
Message-ID: <CAFEAcA_PiwuU7fB0GiMJw25Df5cNnvS+DNdWQR3=255ANb-Y1g@mail.gmail.com>
Subject: Re: [PATCH v4 34/45] linux-user/aarch64: Reset PSTATE.SM on syscalls
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dlmcOir2wQ6U

On Tue, 28 Jun 2022 at 06:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 3b273f6299..4af6996d57 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -89,6 +89,15 @@ void cpu_loop(CPUARMState *env)
>
>          switch (trapnr) {
>          case EXCP_SWI:
> +            /*
> +             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
> +             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
> +             */
> +            if (FIELD_EX64(env->svcr, SVCR, SM)) {
> +                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
> +                arm_rebuild_hflags(env);
> +                arm_reset_sve_state(env);
> +            }
>              ret = do_syscall(env,
>                               env->xregs[8],
>                               env->xregs[0],
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
