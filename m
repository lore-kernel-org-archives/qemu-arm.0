Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D67FCD4F3C
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 16:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPjrt-0004mT-Qg; Wed, 20 May 2026 12:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPjrj-0004hX-9d
 for qemu-arm@nongnu.org; Wed, 20 May 2026 12:33:51 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPjrf-0004E7-5k
 for qemu-arm@nongnu.org; Wed, 20 May 2026 12:33:49 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-65c396d3b36so5167642d50.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 09:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779294826; cv=none;
 d=google.com; s=arc-20240605;
 b=NqK83FVRE4jIqkAvTcLeXWViC49ceswKWy4zJTmtcYfj4JLNt4wunX89sAAkwtRnAE
 0K/zp52iYXENtC+U7BIkdVNE91PJrVIQlLIqTQCnlQM9suyLiaRP5+XZeLJCLDqv8+pU
 rezmNwQr0QUhqI/+YDmA0u7e03D9w2qZFXE25zv7pz5WHH23CuXORKY6oyBNp6ileN4o
 iH4ipg6Vs5J5f89Y8RBWAmUL7DUIuqDxECP5Kj3EvfdiQt0F/w4nb3PMuaMNMUMhtZ/3
 OFuulH3xFNCGS+jL1AMLLlYYYfuvLlQtlKHlzG1teAtas9q3OEZNuzZfnUX29qYBkcc7
 z2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ilXmKd4vt5E2uTWQGrfTbvCC8r36p1523wjeuX6smhY=;
 fh=Y6quO8+aeM8NpPpyT7uo7svSkzQaCI+NdHmJoXD9k8k=;
 b=dFh27sH7wvWn2/UnppsId4rSt7UVWd5WqFvAlIFB2eSL53maDNmKVpj9nyLxm8sCMi
 E4a7BWG+IhevQR1fzk/mlly/VUDP9SzjbrDr8HFUwymaCtpEqM24UwaNnepjyDXXFg/S
 iC0NYUXNZhKg9NB14F5T/9pGENb1e26od75jDF+au0lHNCebLyfpzRR5f5MlJzXM4LD4
 kYQp70s6w/Xb3GDXS7yN0FNgMXLQjQ7z92bWFYyl6DfvvXQIEE5uWCDXDXWQjXg72t8v
 Tmh7dM7YowN4PERBZakWJ8udfSDJF88VQJmHvHUwxECN09vQ7qbBvNNTE5Fc+SomTGl9
 CW4g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779294826; x=1779899626; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ilXmKd4vt5E2uTWQGrfTbvCC8r36p1523wjeuX6smhY=;
 b=PRBmTucUCapk5yHcD2O4zhRLxZhi0YpmUv743azBZprqXEo3DmdNHr/xyMc6m+eMCV
 hUg6K5qkYHmJKmVPnF27Fl1548IgL9EHiDbArhK0O4HIIO1gyJ1um5tsRP61HWEAIfRh
 L9KBb8I0B4vRT2sXN3jq+5Usx0dWjj5yCXBne867ZDUNaUEwa2FW25d1xg0JTV/d1STO
 R6uuh5ey0+xdLq7wI6jDa45Usp04Kmklzu11RCAHaJP/ipNP4V6VCCufJ3iLQJ3XVTaR
 fFgJc9HR9nnzX8Ib3hIQPiVCo1xu2PtVNhtQw/fkizV2XHHKOFa9C47xV7s0+mOnkcAI
 QUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779294826; x=1779899626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilXmKd4vt5E2uTWQGrfTbvCC8r36p1523wjeuX6smhY=;
 b=J8QC/lXXE3cG5i69BJSd3X8mw8tvhy5p9XOZXmyM5EN65YfYkkBTsj+GGp54/6/XKJ
 y6/Y2yGetX+HD4H6IG5gS/50SMkX5rBorY/9s+9dGsml36768p4LtsQEmTzE4wIIy6yV
 yIsw9/Lm1x4l1LzHkNeoSvoJUZ1wAVX5cyIFlV9k2G87k1F0DoKOZS/5WSmD3nor5fIA
 tv+BEdFGsCeRoptnjsDlJPniWNvCfZLct53rDMn9OnJqch3P7tnaZz5I7MIfYHIeq+h9
 OHCIlKeuAVIMNcvbX+Ylw3YG0WgLQSeGLrni2M7HAdZ8R3qtSnjK7hruzRvfURWWS2K5
 bt/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/f65ugYtHg664msD6BzVuYVEVyjvJBe0rjz5pm70NgUzLqCLlGJd1wbwd4ijLPKUYWkByCSysOXw==@nongnu.org
X-Gm-Message-State: AOJu0YxdSSmZJGTJTmsFcx0Lsmo3vrBVQB3xdbceOFoL4hlmjn92/Lhc
 kTY3dOsXJAedw6XEYl5d7XXrDc28HyQErHIaM32N/NW+I1QgS8494jy9tE6h+WXVKOmSDf0P7uD
 8dW0DupbMmMdoV1zgpZMR0acszC2jouLZ7mzCSJm7/w==
X-Gm-Gg: Acq92OEoyd1Kaz3/GxBU/FNLAZUIwFB++5Z1D6fvfR9aajCpJJHJgp+QpCKfsuRS3n5
 b6ewHfE5ZzUEuTo+mdEQZjwpLhabcIUi2rvZql5ueKXOSsLXVinoCrC4PZb2xP26K21XDBlHW/j
 40zf7pK6koJ0GJ90vFzGsEmDOIGdLImrm+sjW+o+HGJ3TYAqw/801haDFiW5trPLZB5Ib27BLjo
 5JP5UdjzY7HwFd+ijUoqhgOQ82AsEzzhSKamrIedTWYCSTSlYqNNIz1I799bm72Hrz9cqcEt0G2
 fqrC0qhWiJTNRcaCs0BMOn/rNbBGwxmxy5spcXM0eU5obgZErGr758GKh+POp/vqjGM=
X-Received: by 2002:a05:690e:419b:b0:650:7841:6dd with SMTP id
 956f58d0204a3-65e2284edfemr21837183d50.31.1779294825598; Wed, 20 May 2026
 09:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-46-richard.henderson@linaro.org>
In-Reply-To: <20260517003002.321430-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 May 2026 17:33:33 +0100
X-Gm-Features: AVHnY4K2AklTn3F9OotRAPjhpJILGgV9OVczu7Hx9StKnIOJRaPt27OijCdhr58
Message-ID: <CAFEAcA_Qr+D+qrTd7q0s8Ka0YF5NVM01dDMHm3irQDxiZW0n6g@mail.gmail.com>
Subject: Re: [PATCH v5 45/63] target/arm: Implement FMLALB, FMLALT for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Sun, 17 May 2026 at 01:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



> +static FP8MulContext fp8_mul_start(CPUARMState *env, int scale_mask)
> +{
> +    uint64_t fpmr = env->vfp.fpmr;
> +
> +    FP8MulContext ret = {
> +        .stat = env->vfp.fp_status[FPST_A64],
> +        .fmt1 = fp8_input_fmt[FIELD_EX64(fpmr, FPMR, F8S1)],
> +        .fmt2 = fp8_input_fmt[FIELD_EX64(fpmr, FPMR, F8S2)],
> +        .scale = -(FIELD_EX64(fpmr, FPMR, LSCALE) & scale_mask),
> +    };
> +
> +    set_flush_to_zero(0, &ret.stat);
> +    set_flush_inputs_to_zero(0, &ret.stat);
> +    set_default_nan_mode(true, &ret.stat);
> +    set_float_rounding_mode(FIELD_EX64(fpmr, FPMR, OSM)
> +                            ? float_round_nearest_even_max
> +                            : float_round_nearest_even, &ret.stat);
> +
> +    return ret;
> +}

This use of float_round_nearest_even_max prompted me to look at
the uses of it in fpu/, and it looks like the implementation is
incomplete. Most importantly, although commit 72330260cdb420 added
it to the first "switch (s->float_rounding_mode)" in uncanon_normal,
it missed adding it to the one later in the same function, which
I think means we will generate wrongly-rounded answers for
denormals. A fix is probably:

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index efd130bf16..6cc9429ebe 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -450,6 +450,7 @@ static void partsN(uncanon_normal)(FloatPartsN *p,
float_status *s,
             /* Need to recompute round-to-even/round-to-odd. */
             switch (s->float_rounding_mode) {
             case float_round_nearest_even:
+            case float_round_nearest_even_max:
                 if (N > 64 && frac_lsb == 0) {
                     inc = ((p->frac_hi & 1) ||
                            (p->frac_lo & round_mask) != frac_lsbm1

There are also other places within fpu/ which switch on the
rounding mode and have no support for the new even_nearest_max
enum value. Those ones have a default case that asserts or
aborts, so at least you'll know it if you run into them.
They are round_to_int_normal, and roundAndPackFloatx80.
Is it worth extending the support for this rounding mode to
either of those?

-- PMM

