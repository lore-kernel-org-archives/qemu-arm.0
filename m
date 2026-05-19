Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85958CD4F57
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 10:16:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPHUw-0007j6-SP; Tue, 19 May 2026 06:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPHUu-0007iR-3w
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:16:24 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPHUs-0000yG-Aa
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:16:23 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65c0bda7f15so3356088d50.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 03:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779185781; cv=none;
 d=google.com; s=arc-20240605;
 b=Cx4KPSvwAxlV0VOT/sWlT5XFyjCYQRB1vY8QMt9Qcp1Xgs63SiA4UtcrrTzGjkqIba
 vH6jX42M3rxPwcjw/uG2KWkT1G36poZSHD0FZh9eLpBLB93+VpwlIzTmr+oDTwZo02Lg
 Nk8bYqiAQRmg2F6yIDpK2I8sHCZSsmT0FUYnzlXOvEiPElqdLQI1S9rP+RjUdBBLUXeI
 F96ZdNd3x1eSfZ5LkA0pk9KLZcqHLmHtUsdR3kptLch8pIq7BnA3f1cXPc+Sn6h7Y1NO
 5gXmbuDxp8h9jGLlp9nlqRbuY2i1Vo+6TLU/KiFsyfsU72yQKqdqBidyx+XCTR6I98b2
 wK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=yTyx6icNp+PtefdG2rAba+1ZkoOV/jBRopLskuSBbkQ=;
 fh=w2cJR9Q/xLisi4l+o35FshI2uFZ+2fZ7xUGHdkIth1s=;
 b=JJLQgJPciFLATXyNaBAqGkiP74il+Ni/PvhYeTnxED+Fko4B+DHs3Kj6R/h1DTWXV0
 m1cwWOwJmh5GmWE2gHSpbSv1Q0AeMJ56RbgN0m0EEUR+iRxKqIh+iGQpjgpGJtbX7ywZ
 z9u7146IbW/vSFUlmyfpK4LghMXLVCGayD9U9XCql4HW3mB6hZ5UX61KjYsQGlo6ImxL
 x1/uHxmwEOSPrHtSZE+E770wPPFrSmOlwU8vWgo+AUdOM6KbphMy0BagoHJ5ZiQAfoTO
 RcuU94muq3XHiraqwUwBVfCVTgeVbGNxVmGPhqiYlSGgFwlw6hJKKnVbkniRA6ZwgEOL
 wTrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779185781; x=1779790581; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yTyx6icNp+PtefdG2rAba+1ZkoOV/jBRopLskuSBbkQ=;
 b=jMdsodI4Ahsfs2eLOlIjgneCHQK9/jIjQkBeghbNigNqRykE3699nOKf47w3QqaZE2
 RZsBKizcfo6m9ZdRGsD8w5nPAzaQYVfav06fPNowxGKQGktreI3IeQvrqWRhEI3d95V7
 3NxZjjwYM81ENEQpQC6MK4VGN61cyUaxD5cWjNGCfm2cuKA/WmFVM3H0yhyp0Zm4NZLc
 yqaVczBnbiunfzR+XtLEsRhDG+/mwSPcMbzNPwgqdjC84Bkzj+MpToxFef1W0FScIGiz
 LIklZkEEf1w8OsxwPpFrvZ8hQ2ekCw+HVN5iw1kdPySOaSqRUiZ+rpSmbeRr2dfVujA4
 g4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779185781; x=1779790581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTyx6icNp+PtefdG2rAba+1ZkoOV/jBRopLskuSBbkQ=;
 b=gJFray147wMWgumDUrPjZBPrMJucBuWu83XGXrZmmtFMiZxCRwzN9Z57SXSuFlK1EZ
 e8PgNoT8CdOKKo+4fEWAQgtP8rtto7vctABFmbO8ypoy2WhQog8Yt4Cw6xdKsrAhV2zR
 V6Torfn2XyjwHnlKeelflxGfy4YOSQ7yw0aY4rrWn0K+B346Uz4QUx8VJsxMN/8PaPOg
 HtjSy6WxmjuWq7EtUBOhKzhZh3Ke5NNpelQEwJ+mw+8Z4UctkWB5ILBDfWx0FCrjRVZU
 370ZOtxCpc0nHwZoFmqFdHTZD1zPDYKceoWHsWAE5KfFhABzDMBQ/u6frcI8dGPayLyJ
 xHtA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/05tsBQ/ux84Iq0rMNF2+bxkehC7zCim+aHCZbQnwmZDo9UPLrCkmOE7nmhmEX5xYxj5gDlUK/Ug==@nongnu.org
X-Gm-Message-State: AOJu0YzZcwvpeLwjDK3LfIMzIYfyTePAUKQHX510FJZjUAJEi/u4wEKZ
 AldXIRF7Th2cDB+a7ig4iy3oPOqMCdxDu87arkJCo9JbY6x3ZXB0YX3jVfhpY+eCHCS2PIBJlCE
 03J9wHFssCi4zhhEnOFrmwRMHiNJfE1qFvlvgGsWc3g==
X-Gm-Gg: Acq92OHACD3SdWk0Rbs4hfnND2nfAqhPCbuxO1X4qvummfUNM5OfpeKy6PubvZJ4kLe
 k7I5qCDXgTINu5vOrBfo87mZHEJFc0CtbBEnLPh1OJ4kJqo/s1YHlSZMncSfvtnoTtdt96OXcbR
 rPHuFjG81yit9+vZCW/APzCefuhS9KCgerj5MbNcGTKARAiRFQ93YAHc91iLHrMpeblfNOSFLY1
 zUJlWPKN2BDiIx2BVa714am2He+zhX2r31pSsedSgAIzUX8J1brmwIvv89J51Ezm8eA4SBQEz7K
 T9DestAvX2q8mb3jH/8cesn8VLsCeSBNy0UeUfOegWSKgaF9lOVs3B5DNZEvZX0PeTc=
X-Received: by 2002:a05:690e:1501:b0:649:ed08:1a01 with SMTP id
 956f58d0204a3-65e2284594dmr16999700d50.35.1779185780962; Tue, 19 May 2026
 03:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-31-richard.henderson@linaro.org>
In-Reply-To: <20260517003002.321430-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2026 11:16:07 +0100
X-Gm-Features: AVHnY4JDvOXrMutrNiQb5KflYANEe1wst8LCHWwryIQ8TQfuHyaLf78j3ooscGs
Message-ID: <CAFEAcA-q4GdT-uawv-hw6j9ixdO=Nw60hkJ=mq61G3CxRE5t0w@mail.gmail.com>
Subject: Re: [PATCH v5 30/63] target/arm: Implement BFCVTN for SVE
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

On Sun, 17 May 2026 at 01:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +static uint8_t fcvt_fp8_e4m3_output(FloatParts64 *p, int scale,
> +                                    bool saturate, float_status *s)
> +{
> +    *p = parts64_scalbn(p, scale, s);
> +    /*
> +     * Saturating Inf -> Max handled in uncanon_e4m3_overflow
> +     * because there is no infinity encoding.
> +     */
> +    return float8_e4m3_round_pack_canonical(p, s, saturate);
> +}

The E4M3 conversion code doesn't seem to produce the right
output for an input NaN. This looks like it's because the
fpu/ code isn't special-casing "there's only one NaN value
for this format". Here, if we input a QNaN the scalbn operation
will ignore the specific input NaN and return the default NaN.
There's no special-casing of E4M3 in partsN(default_nan), so
you get a frac value that's based on the default_nan_pattern,
which for Arm has the MSB frac bit clear. Then in partsN(uncanon)
we just move that frac value down into the right place for E4M3,
without enforcing that it really is the all-ones NaN.

I think this should fix this, but maybe there's a better way?

@@ -519,6 +519,14 @@ static void partsN(uncanon)(FloatPartsN *p,
float_status *s,
         case float_class_snan:
             assert(fmt->exp_max_kind != float_expmax_normal);
             p->exp = fmt->exp_max;
+            if (fmt->exp_max_kind == float_expmax_e4m3) {
+                /*
+                 * E4M3 has exactly one NaN, with the frac field all-ones.
+                 * Using the frac from the input NaN might result in
+                 * a non-NaN value.
+                 */
+                fracN(allones)(p);
+            }
             fracN(shr)(p, fmt->frac_shift);
             return;
         default:

-- PMM

