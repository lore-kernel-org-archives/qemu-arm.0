Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D246CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 10:35:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRp8E-0003t5-3z; Tue, 26 May 2026 06:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRp8C-0003sU-8O
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:35:28 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRp8A-0004mJ-Ih
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:35:27 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65eb1b25c77so5001855d50.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 03:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779791725; cv=none;
 d=google.com; s=arc-20240605;
 b=eNP861qdLtYHwsScIGlrodmv+PRp1iUlVSUQE1vfOXwOkwJxhQ7P3IWcySnKurZBRX
 QasOSHHF8ffuN/RCWuKS7zbvOZJKtAq/vA0ah1xb8x6Cvz0ekeepctf64ujZG2tb0869
 WNKDEXeBAzGuRL30cfd79e/ne8ZaTKS0oxrXzFoeEcgvU9fJKANStFAStPcRNhEyb3tz
 XTeNxylOv+XdvpVFJ11dOGrc/ikh+CE9EZnk9D6vyeyqz2ioe3L/xBNNCnZnDJ0TXQ/N
 Hfpsjqgo9RTb6UsoX3xB114+91s0RD7eAZpDs3LU1F0mrsz7+0RgL61+VDlA0EvIe1/g
 Ou4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8FBtHS86zxEDYAxC8eP7pfGIMxW6VLBRn2QKCrqcg70=;
 fh=twrFuSwJwbhnQZZAtMcxsAw3NtCIW7TLgNHuLjMSM2g=;
 b=aAw1AXkR+uYjbiXbYQwOLawPNAlLPK0zNyVrWXnPM4WDaPWQiEsLmnFbudWyOja6Pe
 08FIAoXIDK220ZscDITbnGEuHsnNojrHjsvvgLSLn+SLX8kyVDQjMGhYFgmIa3ojCHUV
 n7A6v5TDstGIoulDVOfDZ7QP3/KYePprjvqpnLNB8rUGO9UVEO2ogdODE7p1VrBBBohe
 6IWANHWGlrS+GOk0Ro7yaxrAQdKBcXDQki9H1p48tl9VEf3VWDVAfZHwtyfJBkDh95Gz
 fOuFkBXwp9zTyGFFjLXbL7Ez2EeG0SZPe+6wLPV1nh2XS6GwNwOGDIoLrJ5gU/iZ8Tnr
 /6Gg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779791725; x=1780396525; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8FBtHS86zxEDYAxC8eP7pfGIMxW6VLBRn2QKCrqcg70=;
 b=pvNOQvPYGJx7CylZz6N3v0gnzQm+DTI5ufzKmTvMrwj3wPtrYO788RXM/IIKCaVd4H
 qKsuDG3Znyh7kyBZAOgYa8zVjXjJA1p4AhplSC7BvKBJddfh2L7N3wm76Q4iJUjVmsaU
 q+6tTWNDwSEcBcSUftgVE5nzh+h/lUtXq+pYq/DZlW4QctRhGNNRe8Q5/hWuy2xJvQ/8
 F3FpsBxp82TigKWaBY0IG00GC+f8L24xEzui2pB7ubYrKRs0mHDyYqsMArGgDMq+Umk+
 6x+GwAePecirdjYmda8KU1i/6AjHNDmeEbYKf3PszVtiobBaBgcRstBFVrr/c8NVWEyW
 AQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779791725; x=1780396525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FBtHS86zxEDYAxC8eP7pfGIMxW6VLBRn2QKCrqcg70=;
 b=e06RGZVkZf3kKhSN1P8T9TnXKNy5U4tTQH7EQtw1hrBpwK+eb6VWGK07WP5FhJVxK7
 ZoPzoQTSC4j765iduTsA2TYKYIllT0B7WclG49aGB8u0Cn9uB9J3OhNhXyWZi+z7d0Mx
 3EdOfHSv5vv1rDEDm60WqC41dKLRrFcfiaFDhdwjr+liXzfgLaW0lEGo02lgKQkcbijZ
 Rkclvev4AMa0phoLyRX8i6he+iDkRZB31LE3XceR4Ijo85UN6E4yFac/oumcxPA7sFfT
 +K4CH4iC8UiPBStIi+HwOSEMN1bn3TVncStdKVLj5W3zaE5OUQWzu/X+yK4bnoKi57qi
 JaWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Jr+PiOgjdO0AkLsl8jZu62YE0Cs+61y09irvkoyGQ9IB4irIFYo3YdiMg0zTlmxdOpnlkh5SaPg==@nongnu.org
X-Gm-Message-State: AOJu0YwjAPMK30qs35HdfaKLsELg7iWn1jLGIFjkolbtQO8y7TcSanY8
 vRdRwh30UnfOkkjgkEnjCI5jML5gdIDmh7AxecbaQFC8YulwGlM3zUS2lcROL32dLiVT/eJPL/L
 e7mSMUcwuHoJ2Q6vx5dF/BlhvuTWuuA5pVVAeW/AlPw==
X-Gm-Gg: Acq92OF1h6l+IddNnnxni765oAEcmCbqbNKtho8RSqXtb322L/eURp7xQfJ/c/VDGhU
 c0QLSUkUqJUvISA0jMl9gKI30qPIERz3Z9Kb4NIHoPWuLJ4ZSs4TXceqLo/QngjM1wh9GCpDPI3
 RB+O62GlrhKLq/dlt2k5aIsX97a7ie8AKosup58wQJ6CfTQfQCykVSyKj0rthdCohXxfKxOU2B7
 BiYYJGOjn1nOfJWdTaA8tpeWBTCljeGD+fLB8BJb/rxxyaj2YCFvMdnMA0teZny9c4zjt2dxaT3
 h8slZZyzmC95QUh9PxGTyVpuVG7s4/JThByjhyWdrrtzV889bpJXRKKbnwxmqF2hHZQ=
X-Received: by 2002:a05:690e:4813:b0:650:dbb:e79c with SMTP id
 956f58d0204a3-65ec98aa45bmr13146437d50.40.1779791724868; Tue, 26 May 2026
 03:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260522220306.235200-1-richard.henderson@linaro.org>
 <20260522220306.235200-25-richard.henderson@linaro.org>
In-Reply-To: <20260522220306.235200-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 11:35:12 +0100
X-Gm-Features: AVHnY4ImPTfzd7WilH9XSk5hs67h4n2rUMOGiIMO7YrSYpcWejmOZ5RCgPJiJFw
Message-ID: <CAFEAcA9xvc6BUY2LqAS1akZHpyouRchcmZAs6DVbQhkdoFsq8g@mail.gmail.com>
Subject: Re: [PATCH v7 24/64] target/arm: Introduce arm_init_fp_status
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 22 May 2026 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Initialize all of a float_status settings in one place.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 45 +++++++++++++++++++++++++++------------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a13e6dae2a..4ea076fe4b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -304,6 +304,22 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
>      assert(oldvalue == newvalue);
>  }
>
> +static void arm_init_fp_status(float_status *s, bool ah, bool fz, bool dn)
> +{
> +    memset(s, 0, sizeof(*s));
> +
> +    if (ah) {
> +        arm_set_ah_fp_behaviours(s);
> +    } else {
> +        arm_set_default_fp_behaviours(s);
> +    }
> +    set_flush_to_zero(fz, s);
> +    set_flush_inputs_to_zero(fz, s);
> +    set_default_nan_mode(dn, s);
> +
> +    /* We want 0 for all other settings. */
> +}
> +
>  static void arm_cpu_reset_hold(Object *obj, ResetType type)
>  {
>      CPUState *cs = CPU(obj);
> @@ -626,24 +642,17 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
>          env->sau.ctrl = 0;
>      }
>
> -    set_flush_to_zero(1, &env->vfp.fp_status[FPST_STD]);
> -    set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_STD]);
> -    set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD]);
> -    set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD_F16]);
> -    set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA]);
> -    set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA_F16]);
> -    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32]);
> -    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
> -    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA]);
> -    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD]);
> -    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32_F16]);
> -    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
> -    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA_F16]);
> -    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD_F16]);
> -    arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH]);
> -    set_flush_to_zero(1, &env->vfp.fp_status[FPST_AH]);
> -    set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_AH]);
> -    arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH_F16]);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_A32], false, false, false);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_A32_F16], false, false, false);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_STD], false, true, true);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_STD_F16], false, false, true);
> +
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_A64], false, false, false);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_A64_F16], false, false, false);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_ZA], false, false, true);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_ZA_F16], false, false, true);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_AH], true, true, false);
> +    arm_init_fp_status(&env->vfp.fp_status[FPST_AH_F16], true, false, false);

I think the use of these boolean arguments leaves this looking
less readable than what we had here before, unfortunately
(now you have to go look at the function prototype to figure
out what "false, false, true" means, whereas direct calls
to "set_default_nan_mode()" or "set_flush_to_zero()" are
immediately clear about what they're setting.)

I think it would be clearer to have an arm_init_fp_status()
which doesn't take any arguments and which we use on every
fp_status[] element, before then calling the functions that
override the necessary settings from that default.

thanks
-- PMM

