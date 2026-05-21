Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9E2CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 15:35:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ5R3-00065P-Ee; Thu, 21 May 2026 11:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5R2-00064Y-55
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:35:44 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5R0-0002Fl-DC
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:35:43 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-651d6347a69so7346999d50.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 08:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779377741; cv=none;
 d=google.com; s=arc-20240605;
 b=R5AQNYGnczu4lTe9ddb8H5UNO4PgHfi025KArbPkGh9R1aaJoVzKHQEFTkuatXYKPF
 G2sQvkP2I8pUPe3aIOeyr1Mgve0ngNW9Q7UAymNcEpxsVQCAq5h2tMtXOcYMM0rjnhhw
 eNUruZw6bjp4Z+GROwHmWum39WcaTqsYYf0PqI0G61/4qprHjKfvStGCDYz1GFN30XIw
 CXQHwpejWQsguC/jpb+UrJoa7EW48+XnMYST+KBkxP46LILeAaejOyBIKNmG1y/zNbxm
 ZPzmqTbT0YGX3Y9Ml9n0p6sgXRLvCUR3EU6OeB2xzhA73g1oPKVlwgly+WI0ytuIwbp6
 jUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5yMOeUX9LXsWWxDnUktmHP86kFYBVWfDYqfkqSHprjo=;
 fh=KSEf5UbSBQPmS6wJnEMc7jFpV/VPyFCwlOjp/0hJOLc=;
 b=X8LqxQrI8gUZNwwVadRMDIUs0abbKimvgE8xL6i55RlMFqh+2qxgatQXuEf20WusbY
 4uQiWkaIciBlU8MDBrWZNKHGg07LmlfF9mfMfuMC8ZoM2sbi+Qo7h6oR6tEoTjHlXnk7
 jSMnW8JucTu8nyjMHtlNBsLcrC/nMMBQHq9XAq5OpuT9NS5lpNwbNQ/VXUBG1zuFfKVS
 X4JrzGZiKdc32QKXwemy7qGomNPDV12F6s+sI8X81FJznKIuopAmqlkOVkcYa98mL8Hd
 KUhSxCtrKHMAx57GLdTib/nE8pbYqFDwZxbRPNc+mfGO6uOJ5A+W56RyK+ixNvsz5HaU
 XQ5w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779377741; x=1779982541; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5yMOeUX9LXsWWxDnUktmHP86kFYBVWfDYqfkqSHprjo=;
 b=LBm2LeRMI/EFdr8BexqTDRN/3jVlFfECI6J1yoOI+MHXirIs8OXSXMX8VHlcQ3FqR0
 zG/UmR8tndoo4Q1t9OCxDoDrr5tKkx0RrrBbUO1yBg+nu/CpbFCw3dli4NXKTqqklVUI
 7ip7qEsJLnEu9jg+OUBB7TmP/SUGIegIaBrvhJNgb4YgRKFw/iwHyWOnfRBWV8FLW9Ej
 ZkhjGLD1QD++gzsvwY6A/XQBwWTM2n5MzpaFeWhwwFyXBB05dBp2ndhjheJMg3dRuO9L
 qU2Bv9FitCF22I8ra9d2Y4OhzDDsDWKvZlka+VGvp5nZhBmBvQ5+ECl8D6B4mnOgTsCf
 dvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779377741; x=1779982541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yMOeUX9LXsWWxDnUktmHP86kFYBVWfDYqfkqSHprjo=;
 b=OMH6VSNiYrKKg2lg9khvV6dfXAToED6/36PUxFbu+7OZhFIPizU2gTvcb14vjYSI++
 YNBnKJqJzBy5lSL5i9WEmg6LmulZOfQ3MyJ7rzostxoe4JSOex3RzEnYIadSccJ+eOFH
 UGpi5NebVOR5Fbpj5dLma6ChWpkoPzqp36e81Ghi39dUWcSoIbt9WmBtqNFzdAcFbnLm
 EMgorzED5eh1y54f4EKdsmfQutdtivKTZQxCgFVtm+xqwRWl5f7mTokCHGVEbPpXZMGo
 z+lMXjiXYNT9q+LTksA5nL6lZNmlLK+Ds6TPyMa/h+gSWlCayvqTvA7epBfZNJLvuYSj
 r+Eg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+SzMakaJY41/ZU4YsV/xqCpp8RKcv6n5FKoHTK33Loew5qkzoJDyNDfS2Wc+36wBImdxn8zgiENg==@nongnu.org
X-Gm-Message-State: AOJu0YzvglKwiA40Czq3lDKSZ2L3UzLXtN6O9kbA3lAopJVQxFm/hAw5
 zmQLBRDvspwq0L/saWIZyz43rIJ7PBFlFpiZ5LKRHs46A5F8HCHc9y1UtgaLAUq66lCeeNlroky
 /lvP+fdh5E2paTHSdz6RGBW9+MtkuMWDRaJS4udpjSQ==
X-Gm-Gg: Acq92OGf6U5yR/RNbhUiKzqBT/vc35i3oMRAVqEcFherWDxpRh9EZDxMJPw2iHcp99E
 5b9SuqTd+/5fbEA/i3MvA5kldOoYgOOgDdcJTztKwx/fvO7J0Z3Br3LNTmab3AFWzxZX1UK0XHZ
 akjhgV7OM6w0jpgNuBGUs5Vn7XgHrKhL5w13qH1tpcGHdk6yJhHHwIaOlEjjKacK+l5lGSS9JCR
 YP7/39YNbrsd+v/JQpUP7sAl08v9QXyhFJ579ATKRQkzEYg1XzeuTF37hIrW24nlTc63vPwaWUC
 HOYeoCNrcTezg+VCflfI33OQd0b3YSlDEZ3MvhQm5HEs5BI3f/LvOuCjvEvwnWEoJHeR44B/JqX
 1MA==
X-Received: by 2002:a05:690e:4093:b0:654:fd9:2e8c with SMTP id
 956f58d0204a3-65ead51abc1mr2663609d50.15.1779377740816; Thu, 21 May 2026
 08:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-20-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 16:35:28 +0100
X-Gm-Features: AVHnY4LlUYcG28qT8B5Dyf2dOP1Ygpq9c7q0rmLEdUtEErpmcXDRbmiIdLx0BRs
Message-ID: <CAFEAcA-4yuOQgbP7AcV0_eOXNkh9ZtFjaLOxGZk=re8UvWGtXw@mail.gmail.com>
Subject: Re: [PATCH v6 19/64] target/arm: Implement FSCALE for AdvSIMD
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

On Wed, 20 May 2026 at 19:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-a64-defs.h |  4 ++++
>  target/arm/tcg/vec_internal.h    |  4 ++++
>  target/arm/tcg/translate-a64.c   |  7 +++++++
>  target/arm/tcg/vec_helper64.c    | 16 ++++++++++++++++
>  target/arm/tcg/a64.decode        |  3 +++
>  5 files changed, 34 insertions(+)
>
> diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
> index 215df1201b..b7880f773e 100644
> --- a/target/arm/tcg/helper-a64-defs.h
> +++ b/target/arm/tcg/helper-a64-defs.h
> @@ -152,6 +152,10 @@ DEF_HELPER_FLAGS_5(gvec_famin_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32
>  DEF_HELPER_FLAGS_5(gvec_famax_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
>  DEF_HELPER_FLAGS_5(gvec_famin_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
>
> +DEF_HELPER_FLAGS_5(gvec_fscale_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
> +DEF_HELPER_FLAGS_5(gvec_fscale_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
> +DEF_HELPER_FLAGS_5(gvec_fscale_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
> +
>  #ifndef CONFIG_USER_ONLY
>  DEF_HELPER_2(exception_return, void, env, i64)
>  #endif
> diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
> index 5c3f51eed3..b647399b18 100644
> --- a/target/arm/tcg/vec_internal.h
> +++ b/target/arm/tcg/vec_internal.h
> @@ -349,6 +349,10 @@ float32 float32_famin(float32, float32, float_status *);
>  float64 float64_famax(float64, float64, float_status *);
>  float64 float64_famin(float64, float64, float_status *);
>
> +#define float16_fscale  float16_scalbn
> +#define float32_fscale  float32_scalbn
> +float64 float64_fscale(float64, int64_t, float_status *);
> +
>  /*
>   * Decode helper functions for predicate as counter.
>   */
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index d2a4b0fadc..ac18ceeeab 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -6496,6 +6496,13 @@ static gen_helper_gvec_3_ptr * const f_vector_famin[3] = {
>  };
>  TRANS_FEAT(FAMIN, aa64_faminmax, do_fp3_vector, a, 0, f_vector_famin)
>
> +static gen_helper_gvec_3_ptr * const f_vector_fscale[3] = {
> +    gen_helper_gvec_fscale_h,
> +    gen_helper_gvec_fscale_s,
> +    gen_helper_gvec_fscale_d,
> +};
> +TRANS_FEAT(FSCALE, aa64_f8cvt, do_fp3_vector, a, 0, f_vector_fscale)
> +
>  static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
>  {
>      if (fp_access_check(s)) {
> diff --git a/target/arm/tcg/vec_helper64.c b/target/arm/tcg/vec_helper64.c
> index dce5e0505e..7d403adfba 100644
> --- a/target/arm/tcg/vec_helper64.c
> +++ b/target/arm/tcg/vec_helper64.c
> @@ -177,3 +177,19 @@ DO_3OP(gvec_famax_s, float32_famax, float32)
>  DO_3OP(gvec_famin_s, float32_famin, float32)
>  DO_3OP(gvec_famax_d, float64_famax, float64)
>  DO_3OP(gvec_famin_d, float64_famin, float64)
> +
> +float64 float64_fscale(float64 n, int64_t m, float_status *s)
> +{
> +    /*
> +     * Given the 'int' parameter of float64_scalbn, we have to saturate
> +     * the 'int64_t' parameter of the operation to some value.  Since
> +     * float64 has an 11-bit exponent, saturating to 12 bits is sufficient
> +     * to ensure that DBL_TRUE_MIN can be made to overflow.
> +     */
> +    int sat_m = MIN(MAX(m, -0xfff), 0xfff);
> +    return float64_scalbn(n, sat_m, s);
> +}
> +

I just noticed that this seems to be reinventing the
existing scalbn_d() in sve_helper.c. Could we share the code?

-- PMM

