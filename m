Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D14CD5BA3
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 12:07:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPJE6-0003wv-KQ; Tue, 19 May 2026 08:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPJE4-0003vU-PJ
 for qemu-arm@nongnu.org; Tue, 19 May 2026 08:07:08 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPJE1-0006wG-VY
 for qemu-arm@nongnu.org; Tue, 19 May 2026 08:07:07 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-65c21049dafso2998299d50.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 05:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779192423; cv=none;
 d=google.com; s=arc-20240605;
 b=BFsuWlXHEckTS3MI9k14g9DJGeGY7L103idj6uaVJZDH61LWNNM1IU2DiTRvsHf9Ys
 kIdkiaQcgV0WJeIJ/WhHTl/dSDBDPjTfV/3wcufDB4lm65CEvRfF6AP9IvrKtvEnHXhD
 JhJBFZXmzPmcID6SVdWRFM9MjJDGkxVuYAS5GGEGk109SpINpErw1WAUU+sQxyeZi6Yn
 6ICP3+Rjx89dxzXgL41Esq+dNsMCEuBy3ShlEE94T6gupYMXUvzdJsZbZ/s0l1QuEr0S
 NLxYToMeoTyAtSysQK65ORCwPNeLmVcTKoh6R294uyV/FE1aqP+4Qqpht7Ra/QAUNqrn
 GNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VTnnbrshneYeDc/W6f8+Sko0xmYd2zmYH5vqVWNGKQg=;
 fh=T1j1kAbpK/0/3pbAYXpqw6P/wdrlLXe4128O4LLwlEc=;
 b=d7bFeAusOcE22GlyHL2lB2lx4KDRx8HTAJAs2IlNhShIU6hkJFonsl5yzJFHeMjlup
 hRy/kiBnnXdY0Rf3zPGXQ4YjjWMGR6SFyLhQqHvfC8Tu6Vsz/VwbZcUPJSricWLBEHKY
 R15UnDlV3RWx9oWiMyoJ6SCPojIMYNNOf7L5JBZGihJokYaQNbC8HgrxR4f17l+/K5fn
 fflNqBaKFusFFQa8klCSpfSHIO4OpqJXGTZjNnjdTJIUXQhfoM4I02NMafy0xpMcRaZZ
 nvLLyatMM8DLONQR0QfhE6hAaAo6SfqTPPbLczXKo73XSkcswGgSMwa9C6lnnopIvPoN
 Q+tA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779192423; x=1779797223; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VTnnbrshneYeDc/W6f8+Sko0xmYd2zmYH5vqVWNGKQg=;
 b=pXS2ItO6dNNgPKnPAmrxcchGf4DRsIUGqVENrMfecuMZWfXJY0X8KtwjGg4u2mz8lo
 jg7yeEIOFc+4qpQDdIVaLl7/lxl9wdcPl4VhIPs4gb6PxEN41OnJkN9F7+SHpsrquT7N
 q2POsRTz1SL7IiBzKCRWC6GQbbBWH8ODhgxFr6GMQKye15e10pr1cnUMWgrYeXs2JdCg
 aWDM1zz8TIOAVsZnReQFaBYB+u7sX+lXJH3QUfDsuLfaqdc3ck278NQ8Ykox+C9sx8Yx
 B77bausD2czFPFyoykRB3pZegWmUsGelQT4YnVzN/6DEruh1HUlAju6r8biFMVWhj50+
 CPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779192423; x=1779797223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTnnbrshneYeDc/W6f8+Sko0xmYd2zmYH5vqVWNGKQg=;
 b=LJi1X11578Wk3UwlE//e5F/SvqvrlcQkXvHKjiwc+ZN2ZxagUJKrUjG7ekAoCBPU/r
 BqxEXBzqoKhULrudislvcSmHeHgy9d9vrwxEpqErIhMgqMWxV0u6ZDISjpxw5n5SZ5Ft
 CDRFDwVsCUXCLdM7eqlkAQf0MOTp11IQLOTrArWV6hiObCZl5dag2jzuFASer6QYmdjK
 ZedwiS0q2NTbovaL0q8LmIvjeVtjzUnx2zFhkCO5vvG/3YgQesgY05O4Q4j7ksGMtQCg
 d7un6k5RhGc1sDtmF0zpYZJwg+hA/e/d6y83CuRx7agnVmrPVJQAh5+2gvmfqhS2zwLA
 +j5Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/YHtTHvF6gC6r+dF24h+os534ztfzv3UrFjNBFKZAkW/KDlrfAPZTPZ5ZFETgpuBn+9D0pXvbfXw==@nongnu.org
X-Gm-Message-State: AOJu0YxrlQ8IRpR+6S0XLWwPSW5HGj4xjGcdLRu0J9V9ixEXvsONV1xc
 O7QDumUbzmBH1Ie6DrSutghmY5MpCGHUTlzGO3UjuVzwI0dL9OGefyaOc0HUvMXTOBLa4HYafT+
 xeKRFsNqLbWA6QYRCKd4TGeWkSTEzEtM9ELleK+zvYg==
X-Gm-Gg: Acq92OGxUZu9z48MNoY94MXFC41duvhVCYWp2O1GXsPRaQE/o1ugk4SY1fiVoV6UgkG
 +jzFvF0TYBvKCPg/sUFHrMFdeJXeHYenaCHTyySKOHciTprb4glDGEJWP2gCBQwtLVJlJjX0R1X
 ZvFvlZH4rj9a6vRXqlT5ZH+J58DPm1cbORPozqfjDhwf4EPmfPJv+OSq2Of/gxs8urmUTKlzu5Y
 hpHa/otcnc1gepqbTNCjsoZ/ysuj1inJ32vvL+QD99b5TIlvX4mfCfuLVXe6L/0vdUGN/9HhVnx
 ErfLB8giDCGIf7JNA2dbxTGrLV+piOXFlimKi7t0YwuMrQ8MVs9fHdDtxPbD7Kk0SXfSdI/AqB2
 n1Q==
X-Received: by 2002:a05:690e:1583:10b0:657:c3db:5ebb with SMTP id
 956f58d0204a3-65e227513bfmr15759207d50.28.1779192423340; Tue, 19 May 2026
 05:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-28-richard.henderson@linaro.org>
In-Reply-To: <20260517003002.321430-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2026 13:06:52 +0100
X-Gm-Features: AVHnY4Iw7ZGmy30hFx-NCQCJDPgQNOJEe-Qa-X2tccfgtLpTHUW7_QD_DbQiSnE
Message-ID: <CAFEAcA_=zOrSCZF7=HU700+DCeDKwvvKK3DM-d5R7jC9ORErZQ@mail.gmail.com>
Subject: Re: [PATCH v5 27/63] target/arm: Implement F1CVTL, F1CVTL2, F2CVTL,
 F2CVTL2 for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Sun, 17 May 2026 at 01:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-fp8-defs.h |  2 ++
>  target/arm/tcg/fp8_helper.c      | 29 +++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   |  3 +++
>  target/arm/tcg/a64.decode        |  3 +++
>  4 files changed, 37 insertions(+)
>
> diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
> index 966f83d796..718463422b 100644
> --- a/target/arm/tcg/helper-fp8-defs.h
> +++ b/target/arm/tcg/helper-fp8-defs.h
> @@ -7,3 +7,5 @@ DEF_HELPER_FLAGS_4(advsimd_bfcvtl, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
>  DEF_HELPER_FLAGS_4(sve2_bfcvt, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
>  DEF_HELPER_FLAGS_4(sme2_bfcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
>  DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
> +
> +DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
> diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
> index 49e87b845b..66411bf275 100644
> --- a/target/arm/tcg/fp8_helper.c
> +++ b/target/arm/tcg/fp8_helper.c
> @@ -111,6 +111,14 @@ static bfloat16 fcvt_fp8_to_b16(uint8_t x, fp8_input_fn *f8fmt,
>      return bfloat16_round_pack_canonical(&p, s);
>  }
>
> +static float16 fcvt_fp8_to_f16(uint8_t x, fp8_input_fn *f8fmt,
> +                               int scale, float_status *s)
> +{
> +    FloatParts64 p = f8fmt(x, s);
> +    p = parts64_scalbn(&p, scale, s);
> +    return float16_round_pack_canonical(&p, s);
> +}

This doesn't quite do the right thing for an input SNaN,
which is supposed to set the Invalid Operation bit. This
I think is because the parts_canonicalize code in fpu/ isn't
handling the "only one NaN" case quite right:

        case float_expmax_e4m3:
            if (p->frac_hi == 0b111) {
                fracN(shl)(p, fmt->frac_shift);
                p->cls = (parts_is_snan_frac(p->frac_hi, status)
                          ? float_class_snan : float_class_qnan);
                return;
            }

This tries to use parts_is_snan_frac() to determine whether
the FP8 NaN is an SNaN or a QNaN. But for Arm at least in
E4M3 the NaN is always an SNaN, and parts_is_snan_frac()
gives the wrong answer because it's looking at the MSB
of the fraction and for Arm snan_bit_is_one() is false.
The upshot is that later on when processing this value we
don't recognize that it was an SNaN and don't set Invalid.

Unfortunately the OCP OFP8 specification doesn't say whether
the E4M3 NaN should be signaling or not, which is thus
leaving it up to the implementation to decide. If Arm is
the only user of the E4M3 code at the moment (looks like
maybe we are?) then we can hard-code "always SNaN":

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 89e94f202c..902f42fee5 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -246,8 +246,13 @@ static void partsN(canonicalize)(FloatPartsN *p,
float_status *status,
         case float_expmax_e4m3:
             if (p->frac_hi == 0b111) {
                 fracN(shl)(p, fmt->frac_shift);
-                p->cls = (parts_is_snan_frac(p->frac_hi, status)
-                          ? float_class_snan : float_class_qnan);
+                /*
+                 * The OCP OFP8 spec leaves this not nailed down, but
+                 * for Arm the E4M3 NaN is an SNaN.  If other targets
+                 * choose to make it a QNaN this will need to become
+                 * controllable via status.
+                 */
+                p->cls = float_class_snan;
                 return;
             }
             /* otherwise normal */

hthanks
-- PMM

