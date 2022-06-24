Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp305936lft;
        Fri, 24 Jun 2022 06:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJSpkySly8LAVI6f7aq7qrx9JPR3bziI298merXFGz1Lv14pzPDubsCTWJh2wiMGFYTOWH
X-Received: by 2002:ac8:59c6:0:b0:305:2f9c:a53e with SMTP id f6-20020ac859c6000000b003052f9ca53emr12413689qtf.59.1656076005518;
        Fri, 24 Jun 2022 06:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656076005; cv=none;
        d=google.com; s=arc-20160816;
        b=00Hj5ajLdsoiChrZq0kSH1Rzgxl50+ymtr6QihCpKRdUAoRPeZNXiDK/W/2pVH4v1g
         pw7u2J0zmmdPuzssMqDwbhvhBb066fm/+tQsnMa834u6XpB3fqjkUQCD0LEgRemEFRsc
         9qnEpLgnvpAWqKE3PUEUlHVa+hTZYMUj7uf+9vi373BRVqWbxY1npHvqjj2yRfNbhDjL
         P8Amawtbgb9HmCnQxoWI5Zq9waAA8E2fWyg1rHIHmz/o/j/RrnGV761MSe+Gr/3QWR+q
         DDr2ZcXfPVepo5MI6FZTBN1SJbB9eO3enJ1TF3NQ1HF67fPlRKOZO2XiaTs7Y9+/CThr
         RN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ix1UC5yGBZ+lcGTWEo6b/kpVJBuWfo/S0sK2MNbcPBA=;
        b=Ghu8rfkkqiMSVo1ojyMrJOQ3i+CqScNYxF/gGlXm0m2Zf5dEGJPloPMpkjKzee2ptJ
         jQAH91YE+PiPrXISmSDWuWwR5lNCsYjgzw9RBVo+H2OQ2WOOsorx9xaWM4noRnmeYswQ
         NNVHMbxLgbDRVBAYOdtQJ77JEmHNPm+KP8SDwvtZEY8cwKS5KZi7NscXahiLROVQ7mWN
         rdKiqN9hrPt++7Nc1K12k1IU2mTG8uyfIsii4LElpPvw3mYT6L0T2kDvCPN6+0TmRBE/
         muKW3xxtUnxv2cZ7asieDSYh10bsRqRjfov7LOMLor5T28cx/f8M8A6P4J01ngXXjRFW
         Hnlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IhmAHfe5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v123-20020a37dc81000000b006aee8a60898si1680306qki.553.2022.06.24.06.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IhmAHfe5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4j1J-000474-18
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iy2-0001gG-LU
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:03:23 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ixz-0006k2-ND
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:03:21 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-317741c86fdso24233647b3.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 06:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ix1UC5yGBZ+lcGTWEo6b/kpVJBuWfo/S0sK2MNbcPBA=;
 b=IhmAHfe5BuA7dU1EiKLmEg5nFPJhqhiQMkjvpULr0w8hrT++U0kiFnwiLsHBRM0/tt
 UGGTtW0PVsnbfXgtDo8w3jTcr4vUKqB/BRteTpDHm44Sp9Md9UYGzdce0Md+miQ6ogHR
 k3Rh0csgTwAgNHqBBU+q+omAVF7g+pJY6kSTfkufSe5lqUnwxCWRi3BfiFJHyPHIdsfJ
 ClTYgCcXp7c9miLWv7XwmKr0dRrDIyI+4rXkI8bdvrVeMIP3ZYqkPDYxOpqdR+CjeegU
 ohfSngBz5MrFwa/Vf5bCn8YVajP5O9qq94PTu5uDAECTGnoIzDMmX6DaXIFmkVh3ReWB
 gSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ix1UC5yGBZ+lcGTWEo6b/kpVJBuWfo/S0sK2MNbcPBA=;
 b=x13SNPT+u6byYTBZLwzDIad0xB31StYf24B6vc4ZtsNuIGYylHGglmygOIdbS9TF3i
 r+8CJjf4UsIbcZy7zC9dK8sqFKIFLCK7uPCnzCv8yvQ7ZDR1RwHeOLB/6DhbU52uCEYa
 daoO6i72d+RBZZ0JhpMsDfm0JK3oclgcQpPxDXKIs0dMPFM3ijc5FqJtyDtO4dkmdxB/
 yDIMKeZvG+iPHygd/IPiQZKOVHY5WilPzlLWi1UEszx7n968snPUVSj7bDWktRXCMrgm
 oOkFCHkQp+OTNO/Bl6gLAK7y1Vys3nkCvxpVitosHP3jAK1S6BWf6eBo+VKcThe1mWKe
 JJJA==
X-Gm-Message-State: AJIora+gS5xvDDEcfZWDx/TmEEqRqldj778MPv3z6UBO83FLUPgf7ZtN
 kdrhjf7rH1+N1mXi01Ip8ClYsGKlA3tCSQ99nbISvg==
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr17388364ywd.347.1656075798402; Fri, 24
 Jun 2022 06:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-38-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 14:02:41 +0100
Message-ID: <CAFEAcA9RUTqQUycmV55BUByDtchwD8jtNQO2=jKv=H6u3NwZMg@mail.gmail.com>
Subject: Re: [PATCH v3 37/51] target/arm: Reset streaming sve state on
 exception boundaries
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XIgORspWT7Gk

On Mon, 20 Jun 2022 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can handle both exception entry and exception return by
> hooking into aarch64_sve_change_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 26f4a4bc26..9c5b1a10eb 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11754,6 +11754,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
>          return;
>      }
>
> +    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
> +    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
> +
> +    /*
> +     * Both AArch64.TakeException and AArch64.ExceptionReturn
> +     * invoke ResetSVEState when taking an exception from, or
> +     * returning to, AArch32 state when PSTATE.SM is enabled.
> +     */
> +    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
> +        arm_reset_sve_state(env);
> +        return;
> +    }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
