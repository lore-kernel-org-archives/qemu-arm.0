Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E1DCD5BA4
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 13:27:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPKTe-00007o-LM; Tue, 19 May 2026 09:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPKTd-000078-OM
 for qemu-arm@nongnu.org; Tue, 19 May 2026 09:27:17 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPKTb-0007Rq-29
 for qemu-arm@nongnu.org; Tue, 19 May 2026 09:27:17 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-65c396d3b36so3574051d50.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 06:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779197233; cv=none;
 d=google.com; s=arc-20240605;
 b=Ugz5ZfX6H3fCdYNGJB4klzMDToptDhOO19k+eyqSoXvtbVS2DqGILoBw6+UBWpAS0z
 de4ISdJZaRNZHanfR1/D5GLpxgFtSZEM3UvhaXPR6XwC+R0bQxKP2Cvy9bc4MjESsmmS
 7xtPdcg1Jse+eSNkQLV+UOY1uB1egd5Tv9P3BqSyRd7V3bojHYCZQqCNV24EVbGBGWlS
 WJJOw/b4KW9F2bcUuOe+wORoB46bDWjIBFHjfQD5hg3NZiXwMoebyci/wDaU4fKA0eFF
 5ClmLrbpM/IvP6QOCg7plW9V0jwVa96CtJY19HSrAemZngky0+F+nK6yM7NLbK0ZSAtp
 fEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qSjj0IIDOrr3PY/+TtJBWcm7zY7QcB73XKXiMvE6qAc=;
 fh=vOYLPfRSDyhOJsyag2IUpckDs7/Nzlh6QSJdRFr/0wQ=;
 b=gl8EVbNYV16o9TBI/W3upsvuHRpSNZb6XDjnFZWq+90qJIcKuK9o/cGJYufptIOUTL
 jjvQD4lBWEPJdLHW3vq7X9hNtJDH1o8vUXVjE4EiF1Wu8PbsPQ7m7TBLreonV7sOvx2J
 FQ726HfMWJrwq9RqNyW/AJhrbVhkr4J5pCs5eaZjhyGTzQHStio/J3H9AqRH0cbOO/3b
 SgHnFKqJON3p8uXzKmbTVTEOZZZBuK5G0wzM8sUjZBjxTy9VkZsNU2oCGphYj0aEzHMM
 2kqjYSjCWTfN0JnCST7cCb/yJud8OC0laDdY4dB++dfAJzAgRKFGj96k540zhOsy/UIT
 NTYQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779197233; x=1779802033; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qSjj0IIDOrr3PY/+TtJBWcm7zY7QcB73XKXiMvE6qAc=;
 b=JixjJTFJ/iC7QxZiCNNCkjiT2Ig7Qi5OkqVlveLT6VtRO1mjbPkF9sFl/q1sxro6Fg
 5plYVF9sxB3GBPBI5VZ3p7nRFdcMvFcQuEDGSvdmaItaLfic+UWO0+5Ehf5v2JizcUAW
 d0P9YmPOk0EKr0N0I7vkbkE/p2hpGlwiuxujx55n2Mp30Pa8HruLlHfeAC902yzJlNx9
 kNJsBTWZ+76kae/GWBGG4F30136hKuLJHAg67nPRev9F1gSDdVcPL6z3PYn9ZIffPtmP
 xE7zn6g2r0cleU0V/CIligDZscqDOWDyRZYafQ3+jVXO+M5jGDYzC3TBML2jJwzAwQY7
 iMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779197233; x=1779802033;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSjj0IIDOrr3PY/+TtJBWcm7zY7QcB73XKXiMvE6qAc=;
 b=RSIzyOxpqA+RPCpjIBuCWtjkXolA/3J2XTPg7HbUfJyUCy4zgxfAP4V6lYaOcFNNMw
 hpsfCmuJTfhahKApjvOSkqh7HqdPrT0SES9K4GyqHPeKpZ4IWLiQYgPH4hDEcOMZZWfP
 o6bp32OnKkfiUF05tOjiEmKWsjXxhdadPPh52V8ULJi55VRL8u6KfnTnfFoiU+harjSk
 on5QzXasOOdKh5k8ctdYNrr/5dOpzlfasmESgvaSAxLQt9ogtgqMg3Nt4YxAJzWTbwpb
 ZMb24Xqu+7hQAeF67NyNDOa2bqYEOJiqF+U5/VgRdPfTbuPif8Ai+jn1m2lnl+ANFlQ8
 Z90Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+XPwEI9OXn9I/6dzLptlr2Wsmu/Oy+oiijp85Dp2nYvvvkeCYWVeteOfaIYT32+dMwMGaE2hiiiQ==@nongnu.org
X-Gm-Message-State: AOJu0YwcsRaV8l36O54pwkLRxD7N8ChlvqskW310MkG/RB3ZuQAn6p68
 hIEF7U0Pvov9M7++rroGXbekRzST/b0TC+7R1wymY4mYS+4T70voE+txjgm3piI2cZTqJDd0I2i
 RUOEHGyQu/viNIejmMvwbXn6w57ruXJIYgDdHd/Is4w==
X-Gm-Gg: Acq92OGJVgc4A6ktaWnS3RdXmYAc+GmD1m+yA7HBy54CRpz17sgtjuTfPxU/RaB0Nqw
 PF/TtQ7UppMJG5Z+4wer1K4wH3u/6+PZmcRkp+f2DksILpVfHh88XMqh8DuZhHFATbAxtaoLfzC
 fHVfI52qbWCJdMslDT91UlkaEZ1/9REHCjV0t5zKLmyl6V+hm0p+YlD1bIvThbxwKdpGecIOpZ6
 L/9gMxYJ/H8MZMboP6Pwsfg8IR4jGBTEYBw/n4tTV1vWlgNRMt6LBMsXCozjoHy3pFr98RlFxEJ
 rFosLfdLH9ds8veOqPBALGbluIciEATyxO/K4QWOnG3TNmfyCVt82hJNfhZRqdu9Qr4=
X-Received: by 2002:a05:690e:13cb:b0:65e:3eee:4ad3 with SMTP id
 956f58d0204a3-65e3eee588cmr12660822d50.49.1779197233283; Tue, 19 May 2026
 06:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-31-richard.henderson@linaro.org>
 <CAFEAcA-q4GdT-uawv-hw6j9ixdO=Nw60hkJ=mq61G3CxRE5t0w@mail.gmail.com>
In-Reply-To: <CAFEAcA-q4GdT-uawv-hw6j9ixdO=Nw60hkJ=mq61G3CxRE5t0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2026 14:27:00 +0100
X-Gm-Features: AVHnY4JEaUgCVBpNhRAV4TusRdL5kFvgkkpUvb-HjneZCtt78bBwt4nAvmydgUM
Message-ID: <CAFEAcA_5nrmafaL8oGr9Oax5BJ=bJUXZ9XjNt0ZL4bcxzcebTQ@mail.gmail.com>
Subject: Re: [PATCH v5 30/63] target/arm: Implement BFCVTN for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Tue, 19 May 2026 at 11:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 17 May 2026 at 01:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
>
>
> > +static uint8_t fcvt_fp8_e4m3_output(FloatParts64 *p, int scale,
> > +                                    bool saturate, float_status *s)
> > +{
> > +    *p = parts64_scalbn(p, scale, s);
> > +    /*
> > +     * Saturating Inf -> Max handled in uncanon_e4m3_overflow
> > +     * because there is no infinity encoding.
> > +     */
> > +    return float8_e4m3_round_pack_canonical(p, s, saturate);
> > +}
>
> The E4M3 conversion code doesn't seem to produce the right
> output for an input NaN. This looks like it's because the
> fpu/ code isn't special-casing "there's only one NaN value
> for this format". Here, if we input a QNaN the scalbn operation
> will ignore the specific input NaN and return the default NaN.
> There's no special-casing of E4M3 in partsN(default_nan), so
> you get a frac value that's based on the default_nan_pattern,
> which for Arm has the MSB frac bit clear. Then in partsN(uncanon)
> we just move that frac value down into the right place for E4M3,
> without enforcing that it really is the all-ones NaN.
>
> I think this should fix this, but maybe there's a better way?
>
> @@ -519,6 +519,14 @@ static void partsN(uncanon)(FloatPartsN *p,
> float_status *s,
>          case float_class_snan:
>              assert(fmt->exp_max_kind != float_expmax_normal);
>              p->exp = fmt->exp_max;
> +            if (fmt->exp_max_kind == float_expmax_e4m3) {
> +                /*
> +                 * E4M3 has exactly one NaN, with the frac field all-ones.
> +                 * Using the frac from the input NaN might result in
> +                 * a non-NaN value.
> +                 */
> +                fracN(allones)(p);
> +            }
>              fracN(shr)(p, fmt->frac_shift);
>              return;
>          default:

If we do take this approach we also need something like:

--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -288,6 +288,7 @@ static void
partsN(uncanon_e4m3_overflow)(FloatPartsN *p, float_status *s,
         p->frac_hi = E4M3_NORMAL_FRAC_MAX;
     } else {
         *p = partsN(default_nan)(s);
+        fracN(allones)(p);
     }
 }

because the NaN value from uncanon_e4m3_overflow isn't passed
through the NaN handling part of uncanon.

Though there's an argument for making default_nan() for the
format return the right thing I guess.

-- PMM

