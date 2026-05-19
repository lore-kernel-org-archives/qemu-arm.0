Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB14CD4F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 16:27:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPNEL-0007YA-PO; Tue, 19 May 2026 12:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPNEG-0007Sb-A7
 for qemu-arm@nongnu.org; Tue, 19 May 2026 12:23:40 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPNEE-0000v2-KM
 for qemu-arm@nongnu.org; Tue, 19 May 2026 12:23:36 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65c6a2158d3so2733842d50.3
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 09:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779207813; cv=none;
 d=google.com; s=arc-20240605;
 b=SFSwoyBGNqjtK4xFONYiGpstxpsc9cSOV+s23lplLbipPqVIIYtf3ROaYW76s+XYFB
 0qi0Kr2atkVHPeRz0w7DtNyv5jdsVPOyPlPTLxFiO1a2/MjAoYNz/0Ek5FPrIigrcD2D
 cKP44Jsat2rFasVSrtwMAFqCcicNNjlTNAtchkQOZzuBPzjsblBuULNi8vFHtAQ94Ig+
 nquIlXxjVDH/crb19vLAGDlLMouNf3DJi0tQtTmO0Al0dIysJcSGofrs/kieQ6EJyLWy
 lpweAlhU9uQHA7sd7aoh2bpLV7rKrjaGp0uomDVZqxT5UdDWha9AlxG5vLtCfvBpzd5r
 tInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UVOTS9detdZpXjAXqbIcCRmu8qompijFIeK6Gt+RojQ=;
 fh=NH9ms2shYeHFCn2Pb+VYxwKmOrzL7nZ16OtU8sfx5cA=;
 b=UjsaCcOR9dLPvOUb96a2861L7pGzbbwqADNlX7AzgbrvSBscD+kZRqGhbjHsxFxTrP
 7wvu0XLNH0lXLDg6H1I9ts/JFxeT9NDgoVnGbb2pymjlJq9Axrse9KDcDZ9fdXSB0H49
 4EDJBf9TAuAz24dHegddemtbO4hzHccn5WZ8xis9pIhPWny2v10FxNMuLFbBQASr28WW
 NNKseWFqNOfVfcFuj/mxigKZpQlog8kt8jzTexo5Aao4+CvqamMTQYzoC2qDVjdLKtgB
 6zM1VvoGgq/+mhWeOkbBgc3QjX7d6Xpeg23FIt1MSZHyQ1i3fW7sZJlhHEbVBm+ieIjH
 xmmA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779207813; x=1779812613; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UVOTS9detdZpXjAXqbIcCRmu8qompijFIeK6Gt+RojQ=;
 b=uBAGwAJrCDA6LC2f0YfJr8zOrBTA198IIwxzgwR618RCzcf3DPG33xnlf2/79Q5kKk
 mN9GbY3+IfPAJXPtdI7Cm9E1DToWpjcm06tPwhlneXHnQAKnvD/H3jeEFSByp4xjcNGY
 YmC/8YAc7wKLmrp61q1QQwhSOwDxwXFtlMBjihEBn4d0FeZclNl8HdOhuVspEhtXEA6l
 Ap+fUfw5nu68grSvi14EUb0LhRr3r1SBqL1tVayzr3wDbrCQz3TIanGA9AlY+DbJ2Zds
 fq0XNmtK1VVcyz82Z2It3YWvGnqKIfwou3JKf0PAtaoPMej9SNc54zvubhiJjyn2aj5W
 5ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779207813; x=1779812613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVOTS9detdZpXjAXqbIcCRmu8qompijFIeK6Gt+RojQ=;
 b=fvLnqKRdfh3TR9GEQUxro0k2NS7igbAg2dmzLhNJQRqMRQh4PCxDYtYJBA3Tym7i8O
 yIlAi0bpT77p10Q61YempXFCBKvIqhkHC18vzuSEzey4hpO5ckT02DViWDsbLet6qfW0
 X5XpqVI6TjpDB02P2DXivuwrYLX9+dgrzOz5lFD64DI3La8r8G+MX1ZKzl/+QDYcLIXN
 p6CB9lKgTPuJWqG2WFpsmaQub0jYDTWJ7/vEBZDKDGEopA9FgpbD/rd7rMs+hqhrFIYI
 lH8gPzm1kLTHVfLepX0GlEkeMB2TYk+t//LYQkucttZQN1Kp/Oc2ZlnRdEVN3qLikU6Y
 6r/A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+S149z9DtQ/oEKZNUPW7mBacImtwwzhgLmGJ9kXp0wdtLAEcKTqCe8hQ+EYq1YcW6U+X7NaVCXvg==@nongnu.org
X-Gm-Message-State: AOJu0YwAUTdiRNr/XYp+/HVR0y4GFJb6ZpSPE5vV72fsTj/7GMBRGBfs
 hIvlX1BqSv/83kYud7+d6GITBwSSueZpLODpjVlZakm1sjgHUA/1pd2jF1OmAavg6qmNlDy2X2J
 tQjkxVn9SUBXIpHRfpWH0NUmJbadT/TAYR1lra1GF5w==
X-Gm-Gg: Acq92OHhM0KvfN/SeuIOK8F5yGmTxmO5kfSRGl+LDovyU1N0V+tEmgeuOgR4zL2m+G1
 kQ1Wh7EwEwGQ+jsvzsCJCIMMplqbkTBRCuzKYglhzWSXisGTs6SmPIy+2EAv1OLPOU9dZVe7xUz
 64ow0yUT+54VGowB0hGNxZ4HmgEv2oFK43T4IYCzDGXF/GpoE7vKgdLjzgxdqw2OxFGN+aNv8+O
 jW9cV5W6sO2szP1/iuMf/hg0KVDzsSlfLZk77Odx8kHOw/sSpRAXhLra+XnjfHwQs36Y+g/7nlJ
 MFD8wQkajQv/7f7TKfGYAEXwGW9b03zNJHlSEoCHzAYQLlaQBEOpECaPDF72OYPiphbiy+vP+3V
 ioA==
X-Received: by 2002:a05:690e:dcb:b0:65e:37bc:b72c with SMTP id
 956f58d0204a3-65e37eaf20bmr14121570d50.58.1779207813188; Tue, 19 May 2026
 09:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-4-richard.henderson@linaro.org>
In-Reply-To: <20260517003002.321430-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2026 17:23:20 +0100
X-Gm-Features: AVHnY4JHay9qXKrKrztV8BRhyaQVC6xxJz2qMOluzbP_aQnhQ_SnIrpN291je7o
Message-ID: <CAFEAcA9SG47Nn=dijm8AHMFQzq7EG+=LyLkRL7UtYJsNBjfZKg@mail.gmail.com>
Subject: Re: [PATCH v5 03/63] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
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

On Sun, 17 May 2026 at 01:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/*
> + * Use float_minmax_ismag to get the absolute value min/max.
> + * Avoid float_minmax_is{num,number} so that we get normal NaN processing.
> + * If the result is not a nan, take the absolute value.
> + */
> +#define DO_FAMINMAX(NAME, TYPE, MIN)                                    \
> +TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status *s)                     \
> +{                                                                       \
> +    float_status local = *s;                                            \
> +    set_flush_to_zero(0, &local);                                       \
> +    set_flush_inputs_to_zero(0, &local);                                \
> +    TYPE r = TYPE##_minmax(a, b, &local, MIN | float_minmax_ismag);     \
> +    if (!TYPE##_is_any_nan(r)) {                                        \
> +        r = TYPE##_abs(r);                                              \
> +    }                                                                   \
> +    float_raise(get_float_exception_flags(&local)                       \
> +                & ~float_flag_input_denormal_used, s);                  \
> +    return r;                                                           \
> +}

Because we use either FPST_A64 or FPST_A64_F16 here, this doesn't
handle the FPCR.AH = 1 case right. The pseudocode FPAbsMax squashes
AH to 0, so it always has the behaviour of the "normal Arm" operations
for things like what the default NaN value is and which NaN to
propagate when both arguments are NaNs. FPST_A64 and FPST_A64_F16
for QEMU both change behaviour when FPCR.AH is set.

I can't see an existing fp_status word that we have that has the
desired "ignore AH even when AH is set" handling; a simple fix is:

diff --git a/target/arm/tcg/vec_helper64.c b/target/arm/tcg/vec_helper64.c
index 2f481ac489..fc2566bddd 100644
--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -8,6 +8,7 @@

 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internals.h"
 #include "helper.h"
 #include "helper-a64.h"
 #include "helper-sme.h"
@@ -152,6 +153,7 @@ TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status
*s)                     \
     float_status local = *s;                                            \
     set_flush_to_zero(0, &local);                                       \
     set_flush_inputs_to_zero(0, &local);                                \
+    arm_set_default_fp_behaviours(&local);                              \
     TYPE r = TYPE##_minmax(a, b, &local, MIN | float_minmax_ismag);     \
     if (!TYPE##_is_any_nan(r)) {                                        \
         r = TYPE##_abs(r);                                              \

thanks
-- PMM

