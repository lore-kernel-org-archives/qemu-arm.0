Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E54CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:20:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlWw-0005uq-9K; Wed, 20 May 2026 14:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPlWt-0005qf-8W
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:20:28 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPlWr-0008Ty-DR
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:20:26 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-65c7a459105so5565365d50.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779301224; cv=none;
 d=google.com; s=arc-20240605;
 b=VimaYfFcR1IejVVEV1fJLL+kXHQwA5cyeyo34kbxAY5O7r5ZeCyUBRuZ54DGahISVX
 NmVZ0aO/q4U6Q9piPhJVsnWzbVio6IaDqPwsPz9u69Q8h4+UzxU+ujaYq57ic56NT9/h
 lZe3qemTWYwsLy6A8mV3rXFKpxGqo1tyIHtrX7yCZzcW8dG7zQGAQbKuNdFZJAAZAxvb
 l+35wOW/MTnHx1tEfkpySTBtiCQfLNs6fd5H1pztC7OV7NZBtO+uMgVo1UFa3ksRypNq
 atyCP5AoPpQERCsc5qF1stVo08ZS6ynkR2GOwfKGJwyJ8/f9GfsyOHoDTY9/oz30YQZl
 pIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=M6TCNz7Z02UK3RyghCSIVPYnEiC/l/Hc+ekVBWL18UU=;
 fh=3N9N1oAjiuEPYIM2VHX5J20eQoGtlUJn6G+70fi9XV4=;
 b=TflrML+Sc5dMqsS7OoSs6EdbaVzrwHxWba6WbdCZLgqA9To45vVpnapV3SEhY8qQsB
 rkDK8bBmk5udAmzEA0x2K887cKxvWs7yud7mAqZQw0ynzh0W6+n1j0Lu4FHK+JxfqepD
 WLXlGLZ0zfB/LwfBx5Py+w6qoSu4byiE7IaHe0TGUPHly7Ak/ecxbdrXZdCMpz0M0oh1
 31qbU3nAITG5hsHSRGrcC1O7980ju98OJJmRlNtz4n7ikvlcfJ36cqEQPwYpVmxhDn9d
 //cma/QApJ3G8Cj7hT17UM3WDHPJkp9fp0wINl4TlqbdKq683SZ/C8Jk3QIqI44nub3T
 zypw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301224; x=1779906024; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M6TCNz7Z02UK3RyghCSIVPYnEiC/l/Hc+ekVBWL18UU=;
 b=ZSMwu3ZlSDobnDAMwYFKvqS7EXZxbKw4t+JiQ+IZKT7xq+MoCd/73Fx7De4vPYx66e
 eDBZo7VhsxMhRWYM0vv8+aw0RqCIkCXF3py4vG4D5lNI8Xjaa1GAxOgtTCKOw3ALw6kx
 /Pb9nJArtH1RWVKmjh+3MwUycqoGNbvXB1h6O+JsEjU8ToZDUenb+AHxt2YiY+9b6Orw
 gfb0a2w6qsdpWRM3hwoMmJKrORgJTnNRju9ktmRnWC8PLtzZuoJdrRoVAldKMZ38nRck
 L4MJOZwE0ezIggckpeCAZpbX7irXIN5k7WFYU7001SDqJWaFqDq+Gn1WM+AGaOjllxwH
 bCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301224; x=1779906024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6TCNz7Z02UK3RyghCSIVPYnEiC/l/Hc+ekVBWL18UU=;
 b=P4LDGFfStduWEFTU21tl72299iHlrxR8bVcEM6Qj4HhWSsl+6ffQwqSbsW2lSXGp0B
 rqRf660ZJQpI67kNo2PWCjKMXFSQheitnRXZ6S5+meNDDBR2S1oQCWpxSPNq+4N1lSk2
 IMdpitHqV9BqST3I/K9moheNqi5giV5/uk3G1H67xUw1sWqVOh2+Hm/hJgiE0fy21fGP
 Oz4rCIbr7NNf2PswpP1Fp9VQYGuGsbu8hFwUsAjQSo5+ieuQ4mO7psqJVoydELdOs3M/
 eWiabZSnUJuvf5ezX3zdaxuiuGOtpgXu4NOE1k9w2CevvYeeJEM3WbiR7vFTAq3XPrHl
 eXAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ84u6Ja7QyYxSIZou8Vzb9qoOkudRCc+uTNmu1ea6fvEWPorvM4IutXL2/s9BDZ5WSPZUUVNB+Ofg==@nongnu.org
X-Gm-Message-State: AOJu0YyEM3qweXW4Nvgi2LEapo5Ww5EP+PT1P/Dyb59J5ogScONf8MjN
 NFWv6hQzWHwzvXpnWaAm+tr3hz5mGfu9zJ8EfO/KRhFe49CzCZRkw8ECehjUhAwICDWDuqrutEV
 Gf6Ehee6YFY/J7XjubBMl3w1ea2AFjZkvsoorWn0Gnjk5Aa41Tymh
X-Gm-Gg: Acq92OHIi1SH0lCoxVrsH5VS7ZfTRTXsy2DxgmLgNBtbTgAFmbUxel8GUpXc+rDYDdr
 Zreo+5rYEz0xkneaI+oR2aDFROI+2DZtr36kp3g7+J9wNtlsJTw3rI5+8NIso7R/wxecM+Nk0zo
 Pl7O0RHTq42gvTtGfRiP0PbWrPZvWOsPLPjhpJNgmzCghfBJt/Px7AgMuX8RcvkmENxE3dYaYrz
 A4wGUZeeUOHC0O+khkToVshXJpoPXRgeab4JC10X3y/2pcWbtGBWr7acimAA3HwtfsI4hOTA+eY
 Ny0qQ7FsjuuZ68215Pb+UrAFsArDnot4wMIags9d8OtvkP34E6Zp/lmpWikf5GO+tns=
X-Received: by 2002:a05:690e:1282:b0:651:8abe:ce47 with SMTP id
 956f58d0204a3-65ea81b1aa9mr597991d50.5.1779301223455; Wed, 20 May 2026
 11:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-30-richard.henderson@linaro.org>
In-Reply-To: <20260520171820.848839-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 May 2026 19:20:11 +0100
X-Gm-Features: AVHnY4KkmMHmMhF2QBFUMhBxrOZFF4OlN2dsOs9_ESopZVRG2Ng80RJN6MkJ3Vc
Message-ID: <CAFEAcA9tXNossXoMC=LSa7Aw0CZzsmtkppKqEGqcdSgy-X_GOw@mail.gmail.com>
Subject: Re: [PATCH v5 29/30] fpu: Fix NaN encoding for E4M3 in parts64_uncanon
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Wed, 20 May 2026 at 18:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is only one NaN fractional encoding for E4M3.  Retain the
> incoming sign, but force the outgoing fraction to the unique value.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c           |  2 ++
>  fpu/softfloat-parts.c.inc | 29 ++++++++++++++++++++++++-----
>  2 files changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index be6b02d866..2c3bf01213 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -499,6 +499,8 @@ const FloatFmt float8_e4m3_params = {
>
>  /* 110 << frac_shift, with the implicit bit set */
>  #define E4M3_NORMAL_FRAC_MAX  0xe000000000000000ull
> +/* 111 << frac_shift, no implicit bit */
> +#define E4M3_NAN_FRAC         0x7000000000000000ull
>
>  const FloatFmt float8_e5m2_params = {
>      FLOAT_PARAMS(5, 2)
> diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
> index 559e40d196..d6687df982 100644
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -278,11 +278,16 @@ static void partsN(uncanon_e4m3_overflow)(FloatPartsN *p, float_status *s,
>                                            const FloatFmt *fmt, bool saturate)
>  {
>      assert(N == 64);
> +    p->exp = fmt->exp_max;
>      if (saturate) {
> -        p->exp = fmt->exp_max;
>          p->frac_hi = E4M3_NORMAL_FRAC_MAX;
>      } else {
> -        *p = partsN(default_nan)(s);
> +        /*
> +         * The class isn't actually used after this point in uncanon,
> +         * but for clarity while debugging, don't leave it set to normal.
> +         */
> +        p->cls = float_class_qnan;
> +        p->frac_hi = E4M3_NAN_FRAC;
>      }
>  }
>
> @@ -507,10 +512,24 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
>              return;
>          case float_class_qnan:
>          case float_class_snan:
> -            assert(fmt->exp_max_kind != float_expmax_normal);
>              p->exp = fmt->exp_max;
> -            fracN(shr)(p, fmt->frac_shift);
> -            return;
> +            switch (fmt->exp_max_kind) {
> +            case float_expmax_e4m3:
> +                /*
> +                 * There is only one NaN encoding for E4M3, and with a
> +                 * conversion from another format, the input NaN fraction
> +                 * may not apply.
> +                 */
> +                assert(N == 64);
> +                p->frac_hi = E4M3_NAN_FRAC;
> +                /* fall through */
> +            case float_expmax_ieee:
> +                fracN(shr)(p, fmt->frac_shift);
> +                return;
> +            case float_expmax_normal:

We used to assert() that exp_max_kind wasn't "expmax_normal",
but now we don't. What does it mean to have a FloatPartsN that
says it's a NaN when the format says there isn't a NaN
representation ? Either way, the "break" here means we
won't treat it like we do NaNs and we won't treat it
like we do normals either...

> +                break;
> +            }
> +            g_assert_not_reached();
>          default:
>              break;
>          }

thanks
-- PMM

