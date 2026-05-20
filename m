Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4298CD4F3C
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 16:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPjuT-0005zA-CA; Wed, 20 May 2026 12:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPjuS-0005yQ-2C
 for qemu-arm@nongnu.org; Wed, 20 May 2026 12:36:40 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPjuQ-00058A-Bp
 for qemu-arm@nongnu.org; Wed, 20 May 2026 12:36:39 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-65c5361142fso5066517d50.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 09:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779294997; cv=none;
 d=google.com; s=arc-20240605;
 b=RDbX6tSdJa/MfgUGIv3DfgwLhU8xzR7y1YA3dJ0A86L2knfySAwB5uVK1d2QI2JiMD
 /VCfp5q1WPWU5KARTAohJK2i7e0fPrQP81bthfkHECTtpNnDrsrMIFA4kqrz0kNnUTvl
 uH89Zk9Q+QkDgTdgsBvt0gAsbZzxvLo4fO5lUVubfqc3m+ut3PfvwHE1h9yshxDQsu1W
 OiEZnTQ7PXr+rmkS8OKQLoOmR7HU2ZIV37lFiplDfhtvsBErPKd1rGihwVYahY4WJ2Mi
 ZNykvBgrfcTDTL2MMDSSdKK9dSBGEHBcJkWC5FO+UTfpvNAiwu+CQ69xK2DtXz2hqv17
 FsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Da1TtY+MCb2y6fKCYJH5+UfmZOEaNa/rUnc2JG0Qetc=;
 fh=Sd+f37vUJao5n0yQPjAv5D9A0d6o+al1s2dOKcO4lcw=;
 b=RWjfZFwRLnPEUjcl3+MA8CbbX4dd7fitSjPPGPDJ2yOU9Y5dadXDjddJ9Gw8nuuOcw
 1kqnNdIHWkEDI4uKWGaZsS27IM+pYLciN443mN6RGTbx9HtwATLoYcteB2TiqRr94ElI
 iI/gxVL0le3W3NN42S8NOoQlAnaCq0hDyqD7pHUm+dGmDj+ENtzY+msyaDTBfP/LOtaw
 v0vRt4R1OIe18DqfFP65hmTonpk4NY94WSu3/dklWDXWBT3ctWZy3MZoJ/UeKDJ2bVq9
 +N5/If3O+g/cgGt40vuzkozRv2I/mrzETwk2ea+7icKPjz+Xdqa3MY/ERJGq6GXMpAwR
 JQLQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779294997; x=1779899797; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Da1TtY+MCb2y6fKCYJH5+UfmZOEaNa/rUnc2JG0Qetc=;
 b=X7WQNwGRNVo/3FviGb8uO/7gXCho50xn7qZ6yoZ6IqSWDWlEHxm25+YajcL3Kr1Ai9
 W8cNh9Bn5DGRmI+AfD5wthT/Z89NTj/dQ9KBHizvZx6KJACymeVozrzeNqoCmAbKmqte
 MIRtntCmgNcJgYGlwRGG3Fj4hKTavcEWhVpcRD8Tlc1PTKPqNTh9AUkeLaSmGNIVzW+a
 UatAhQgbOVo0ESBpa8g9s0GkAJU04iVyhbhP6wiC8WZWuWHF4tD9eWucCBltViGorEFo
 Dn2nzSRAvbq16BDd2c+mFzk56mjVvrpYvfBbrouoGxkCbsnQGOkrjlxuWyImasp+OZN+
 1WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779294997; x=1779899797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Da1TtY+MCb2y6fKCYJH5+UfmZOEaNa/rUnc2JG0Qetc=;
 b=tOIGW+yOsLkeX6miA6fOwcm34rN7pgvrRbFGsiiLmubUgkuWd5CatNrtuTFTA2HrcE
 9EQjNUY4cA5JYh3R4ryaoeqRUNaRfmbJT2AjzDt7x08X4Zgf2G6S5mL2/zDZQZcQYs+o
 obICORYvp9KKf6XdvncTzJIuDqi9Vi+htKP8TI1nbNZIkPVMgdHYZ/QRrR1ZWf8Bhmd/
 AG+M2gQIuexgHjJtSCyRXRuoO85adwhUp13FNIVn9X2lQXtShF6m2MPhuXzE1zneNVvU
 n748FBQ1IyiU8blPJae3ehiDgSQ6/y90RTW6l9gpfyZCH+94q3/2Pib2VEfqLbzN3eaM
 pPkA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MJFpydN0e5Sl2e9z881jgUdM28Y+Nn7K5iJZXF9ZlIWojEq2uz6C+6JhG4AuBIyQqdpxt6s3WYg==@nongnu.org
X-Gm-Message-State: AOJu0Yykkwyi2fHoZGu7jAA1oXV3+FKMrxR+AwwF/nbz+T24IQfjlaDc
 437VnPovusYTKkjD+x1C+3WSt3r54sKjmfdyDHix6bRvNOKUDHLznXh2s0nlqmD01x1EdzAWRCQ
 SE5im8e8TAps4OlfjbSTkRkltiHBwHnIqefCauYnjMg==
X-Gm-Gg: Acq92OH1E1zZNGIwmd1BiF7++sd4ZiC8eDidcw3FPZDhMbJWwlPZv8Xzl3Hv8C0K5aZ
 Lm9cFqP2KBNiXtp001bgl5zFEw3cKjvzrXLvx9gljoAfSXXRp4J0gLuCBKsD0HJRQZVDZZ83As4
 vVqyVPbSUfl0PuGsksRB8iqRNo5CzE1eSroIMbCvU469vVHyJ9eh4dkN70m6TL5+q3Z+CEHEJQ7
 3hbijReuxfcPEomITRVRYZbWk6wlFLancAOigujx6Fl3CrSXPfo/WErwKdG4mUUuo4w9kQSNV5E
 r1c/EJHG1Q951pXt2U4a2CFXxHoqb6lnVko0nNsnaw2S3Zip6jvvDf/iONrPqncqYBLPgWVXR6a
 Y6g==
X-Received: by 2002:a05:690e:4409:10b0:650:18fc:f557 with SMTP id
 956f58d0204a3-65e2285bec6mr21425948d50.56.1779294996907; Wed, 20 May 2026
 09:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-60-richard.henderson@linaro.org>
In-Reply-To: <20260517003002.321430-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 May 2026 17:36:24 +0100
X-Gm-Features: AVHnY4IXCK4RSvN9X5XqOy5otafM2VpYY22wT_2nQrobFH-jWEoOv2HjD3g8WKw
Message-ID: <CAFEAcA971nFuXNkQbswiDzRXQ7WsrW9GTVzH5A2rPGym20yMKg@mail.gmail.com>
Subject: Re: [PATCH v5 59/63] target/arm: Implement FMMLA (FP8 to FP16) for
 AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Sun, 17 May 2026 at 01:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 +++++
>  target/arm/tcg/helper-fp8-defs.h |  1 +
>  target/arm/tcg/fp8_helper.c      | 26 ++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   |  1 +
>  target/arm/tcg/a64.decode        |  1 +
>  5 files changed, 34 insertions(+)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 8f6cc2974f..fce38dfbb0 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1625,6 +1625,11 @@ static inline bool isar_feature_aa64_f8mm8(const ARMISARegisters *id)
>      return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM8);
>  }
>
> +static inline bool isar_feature_aa64_f8mm4(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM4);
> +}
> +
>  /*
>   * Combinations of feature tests, for ease of use with TRANS_FEAT.
>   */
> diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
> index 3c74f02022..e942308af4 100644
> --- a/target/arm/tcg/helper-fp8-defs.h
> +++ b/target/arm/tcg/helper-fp8-defs.h
> @@ -37,3 +37,4 @@ DEF_HELPER_FLAGS_5(gvec_fdot_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_FLAGS_5(gvec_fdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
>
>  DEF_HELPER_FLAGS_5(gvec_fmmla_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_FLAGS_5(gvec_fmmla_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
> index bb1d48c3e0..d5d1fe71c5 100644
> --- a/target/arm/tcg/fp8_helper.c
> +++ b/target/arm/tcg/fp8_helper.c
> @@ -849,3 +849,29 @@ void HELPER(gvec_fmmla_sb)(void *vd, void *vn, void *vm,
>      fp8_mul_finish(env, &ctx);
>      clear_tail(vd, oprsz, simd_maxsz(desc));
>  }
> +
> +void HELPER(gvec_fmmla_hb)(void *vd, void *vn, void *vm,
> +                           CPUARMState *env, uint32_t desc)
> +{
> +    FP8MulContext ctx = fp8_mul_start(env, -1);

The scale_mask here should be 0xf as this is a halfprec
output, right?

> +    size_t oprsz = simd_oprsz(desc);
> +    size_t nseg = oprsz / 16;
> +    uint32_t *n = vn;
> +    uint32_t *m = vm;
> +    float16 *d = vd;
> +
> +    for (size_t seg = 0; seg < nseg; seg++, d += 4, n += 2, m += 2) {
> +        float16 d0 = f8dotadd_h(n[0], m[0], 4, d[H4(0)], &ctx);
> +        float16 d1 = f8dotadd_h(n[0], m[1], 4, d[H4(1)], &ctx);
> +        float16 d2 = f8dotadd_h(n[1], m[0], 4, d[H4(2)], &ctx);
> +        float16 d3 = f8dotadd_h(n[1], m[1], 4, d[H4(3)], &ctx);
> +
> +        d[H4(0)] = d0;
> +        d[H4(1)] = d1;
> +        d[H4(2)] = d2;
> +        d[H4(3)] = d3;
> +    }
> +
> +    fp8_mul_finish(env, &ctx);
> +    clear_tail(vd, oprsz, simd_maxsz(desc));
> +}

thanks
-- PMM

