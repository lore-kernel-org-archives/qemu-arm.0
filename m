Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp753817wrp;
        Thu, 14 Feb 2019 01:29:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY3mtG2No+s/PTio/D0x9+2sjpXS5/rTfpJo2tEOPTqkWTGJDE9I5RS2lJgCmoqWLlu0INU
X-Received: by 2002:a25:6d05:: with SMTP id i5mr2089128ybc.489.1550136583518;
        Thu, 14 Feb 2019 01:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550136583; cv=none;
        d=google.com; s=arc-20160816;
        b=IqAMA+BApk5jC5pPxKxJWc0vi0yUYkYkKh7BSUirn9pL0zc3xplRPKT0s2nI8/Eqn/
         yMyqoUaxpjCOOdJcsIkDxOn7vrLSUdJxXZrHHK1LizDgPH/CknfgBQkADRzenvRsc/hF
         QqQbbHzgZmeaFvwPNJSnL6jqaWiOryoAsuCpZBbrJP+9VPBX393O1dU8YDXsQFA9qdKo
         X3KhXo+A0kP45G+B15p8wHn0wkQst5nw3EUNBgYqj4AQjfyIb7MSGBur5pd78ZSMrE6S
         6oyY26geivOvCbfXkG4P81c3BF4rFT4vjvtOGcpDehWJfyfgh5MywmbmX7UMeBM2+Zwo
         qvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7B0eOaIL1j1Flh1GWkPAhe+p3u9vEKK2sRPw59hpVOA=;
        b=xFbqPy9ga9SpgOLTap4q9x1I3mx7V6Z4SgKLm8wF5wDKGtfECzI91GTWwZg8+q5b7m
         3ZfCPm60D8ND8mdkPFFMIk74g4MQmMcriot9iVVMbkLMNK8IaVbQaHfmmwHNEkMMsPnw
         Fn3og+GMrZCwTJ4W8ZFuPrzm2+eCIjaYrJXRy2ZmvTydu7EsQxMc4g3pPqci9BnZEgeY
         jR0zfznVjsn2Aj8RqarZ/DjlsbWV7w+xQMj60BessSL4v1+RY78pld/Lm7FbPVecOIGb
         AmOKE1DCuTTUXO0IKUwc6W9vUaPhLeCQ2vhmFumD0DRt68aCckI4JD0QfqqQUZapsjZ6
         8B/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N2MQRM++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si1101177ybh.414.2019.02.14.01.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 01:29:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N2MQRM++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:44310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guDKw-0002JH-Tj
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 04:29:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1guDKO-0001oI-Tc
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 04:29:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1guD8K-000263-Q8
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 04:16:42 -0500
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142]:35783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1guD8C-0001yM-Ot; Thu, 14 Feb 2019 04:16:33 -0500
Received: by mail-it1-x142.google.com with SMTP id v72so12802517itc.0;
	Thu, 14 Feb 2019 01:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7B0eOaIL1j1Flh1GWkPAhe+p3u9vEKK2sRPw59hpVOA=;
	b=N2MQRM++t/Rw7+tZuaI3TiWtwK6YutZPJdszGeOB9IF9fVs0YWHpx4t6R7KzwFuVSJ
	WeAjSe68Cwe2aZb1jUHoygA0mfk6TJ0CXZBXJ2ra2i8uJmLb8Rcwy4UfgN0jxX01HeHY
	NxNmCrgGhcE2/2tCk+WCyEjCILqjXn9S1SeNxTjdPybAA3B3Wk7UNEI+Iz1NbFNuI3jy
	W8TAYNyWgft7OOwUEkq/69DaLXS+87mAAPS8V/eJd5pWHbIpYVSgjVTQDMRuu1BFjV0O
	rGS5Km3pC6X2oxruk2vfL3T5VYNAm704VwJfIb6AP8Q44FkO8jwWN1OO/PySN8RyIjNz
	Ouog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7B0eOaIL1j1Flh1GWkPAhe+p3u9vEKK2sRPw59hpVOA=;
	b=sepak7XmQqrbyrSLcV88nv/TXCTtOtwv4aoAz8xoZ9NzSy5fUXke2IWqdofda+TcvS
	rjP7qZIrEKEFnrAIthOJd40PrCpp4GzFLylNlvD8u1bJhUkgNkQopQAE1qtpURVjdJWx
	3vzTlZlLbgGHlJzNkBhyeD7rBjnmk5wJYaxmC5qPi3Qmsk/DoXKplq2RKrsTI7iB03pk
	BAnbx/dInKWw4xC2w04PbmzZLPTrQIPzWBrCB8ikgDv3k1txd+qEULmmWD4pkTKt+yd6
	IucNRgGWDhM+CicXvnSYTJ1ZUz9bBa7f0Px3CPee3wMtNSU3D3dNhv9is+ffj/aSn0dZ
	glxA==
X-Gm-Message-State: AHQUAuYxeWGEOvm+K+yW2DzbL7D4lChaCpUjelt4NHVkdgHRWGnsSLGl
	AUUYpjwD1sqWVGlrtckfTbay8sSAj7n7dY53Brk=
X-Received: by 2002:a24:7f17:: with SMTP id r23mr1387653itc.1.1550135785869;
	Thu, 14 Feb 2019 01:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20190214034345.24722-1-richard.henderson@linaro.org>
	<20190214034345.24722-2-richard.henderson@linaro.org>
In-Reply-To: <20190214034345.24722-2-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 14 Feb 2019 10:16:14 +0100
Message-ID: <CABoDooPZMc8OD7h59B_9Q+Jv+B7cXbJFEqmZPawZJ7b1_Bdp5A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::142
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] target/arm: Add helpers for
 FMLAL and FMLSL
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 58OLH9xGF9Uz

Hello,

On Thu, Feb 14, 2019 at 5:00 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that float16_to_float32 rightly squashes SNaN to QNaN.
> But of course pickNaNMulAdd, for ARM, selects SNaNs first.
> So we have to preserve SNaN long enough for the correct NaN
> to be selected.  Thus float16_to_float32_by_bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h     |   9 +++
>  target/arm/vec_helper.c | 154 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 163 insertions(+)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 53a38188c6..0302e13604 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -653,6 +653,15 @@ DEF_HELPER_FLAGS_6(gvec_fmla_idx_s, TCG_CALL_NO_RWG,
>  DEF_HELPER_FLAGS_6(gvec_fmla_idx_d, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, ptr, i32)
>
> +DEF_HELPER_FLAGS_5(gvec_fmlal_h, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fmlsl_h, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fmlal_idx_h, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fmlsl_idx_h, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +
>  #ifdef TARGET_AARCH64
>  #include "helper-a64.h"
>  #include "helper-sve.h"
> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index 37f338732e..0c3b3de961 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -766,3 +766,157 @@ DO_FMLA_IDX(gvec_fmla_idx_s, float32, H4)
>  DO_FMLA_IDX(gvec_fmla_idx_d, float64, )
>
>  #undef DO_FMLA_IDX
> +
> +/*
> + * Convert float16 to float32, raising no exceptions and
> + * preserving exceptional values, including SNaN.
> + * This is effectively an unpack+repack operation.
> + */
> +static float32 float16_to_float32_by_bits(uint32_t f16)
> +{
> +    const int f16_bias = 15;
> +    const int f32_bias = 127;
> +    uint32_t sign = extract32(f16, 15, 1);
> +    uint32_t exp = extract32(f16, 10, 5);
> +    uint32_t frac = extract32(f16, 0, 10);
> +
> +    if (exp == 0x1f) {
> +        /* Inf or NaN */
> +        exp = 0xff;
> +    } else if (exp == 0) {
> +        /* Zero or denormal.  */
> +        if (frac != 0) {
> +            /*
> +             * Denormal; these are all normal float32.
> +             * Shift the fraction so that the msb is at bit 11,
> +             * then remove bit 11 as the implicit bit of the
> +             * normalized float32.  Note that we still go through
> +             * the shift for normal numbers below, to put the
> +             * float32 fraction at the right place.
> +             */
> +            int shift = clz32(frac) - 21;
> +            frac = (frac << shift) & 0x3ff;
> +            exp = f32_bias - f16_bias - shift + 1;

If FZ16 is set, this should flush to zero.

This means you will have to use both fp_status (for the muladd) and
fp_status_f16 (for this function) and so you should pass cpu_env to
the helpers rather than the fp_status.

Thanks,

Laurent

> +        }
> +    } else {
> +        /* Normal number; adjust the bias.  */
> +        exp += f32_bias - f16_bias;
> +    }
> +    sign <<= 31;
> +    exp <<= 23;
> +    frac <<= 23 - 10;
> +
> +    return sign | exp | frac;
> +}
> +
> +static float32 fmlal(float32 a, float16 n16, float16 m16, float_status *fpst)
> +{
> +    float32 n = float16_to_float32_by_bits(n16);
> +    float32 m = float16_to_float32_by_bits(m16);
> +    return float32_muladd(n, m, a, 0, fpst);
> +}
> +
> +static float32 fmlsl(float32 a, float16 n16, float16 m16, float_status *fpst)
> +{
> +    float32 n = float16_to_float32_by_bits(n16);
> +    float32 m = float16_to_float32_by_bits(m16);
> +    return float32_muladd(float32_chs(n), m, a, 0, fpst);
> +}
> +
> +static inline uint64_t load4_f16(uint64_t *ptr, int is_q, int is_2)
> +{
> +    /*
> +     * Branchless load of u32[0], u64[0], u32[1], or u64[1].
> +     * Load the 2nd qword iff is_q & is_2.
> +     * Shift to the 2nd dword iff !is_q & is_2.
> +     * For !is_q & !is_2, the upper bits of the result are garbage.
> +     */
> +    return ptr[is_q & is_2] >> ((is_2 & ~is_q) << 5);
> +}
> +
> +/*
> + * Note that FMLAL and FMLSL require oprsz == 8 or oprsz == 16,
> + * as there is not yet SVE versions that might use blocking.
> + */
> +
> +void HELPER(gvec_fmlal_h)(void *vd, void *vn, void *vm,
> +                          void *fpst, uint32_t desc)
> +{
> +    intptr_t i, oprsz = simd_oprsz(desc);
> +    int is_2 = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    int is_q = oprsz == 16;
> +    float32 *d = vd;
> +    uint64_t n_4, m_4;
> +
> +    /* Pre-load all of the f16 data, avoiding overlap issues.  */
> +    n_4 = load4_f16(vn, is_q, is_2);
> +    m_4 = load4_f16(vm, is_q, is_2);
> +
> +    for (i = 0; i < oprsz / 4; i++) {
> +        d[H4(i)] = fmlal(d[H4(i)], extract64(n_4, i*16, 16),
> +                         extract64(m_4, i*16, 16), fpst);
> +    }
> +    clear_tail(d, oprsz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fmlsl_h)(void *vd, void *vn, void *vm,
> +                          void *fpst, uint32_t desc)
> +{
> +    intptr_t i, oprsz = simd_oprsz(desc);
> +    int is_2 = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    int is_q = oprsz == 16;
> +    float32 *d = vd;
> +    uint64_t n_4, m_4;
> +
> +    /* Pre-load all of the f16 data, avoiding overlap issues.  */
> +    n_4 = load4_f16(vn, is_q, is_2);
> +    m_4 = load4_f16(vm, is_q, is_2);
> +
> +    for (i = 0; i < oprsz / 4; i++) {
> +        d[H4(i)] = fmlsl(d[H4(i)], extract64(n_4, i*16, 16),
> +                         extract64(m_4, i*16, 16), fpst);
> +    }
> +    clear_tail(d, oprsz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fmlal_idx_h)(void *vd, void *vn, void *vm,
> +                              void *fpst, uint32_t desc)
> +{
> +    intptr_t i, oprsz = simd_oprsz(desc);
> +    int is_2 = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    int index = extract32(desc, SIMD_DATA_SHIFT + 1, 3);
> +    int is_q = oprsz == 16;
> +    float32 *d = vd;
> +    uint64_t n_4;
> +    float16 m_1;
> +
> +    /* Pre-load all of the f16 data, avoiding overlap issues.  */
> +    n_4 = load4_f16(vn, is_q, is_2);
> +    m_1 = ((float16 *)vm)[H2(index)];
> +
> +    for (i = 0; i < oprsz / 4; i++) {
> +        d[H4(i)] = fmlal(d[H4(i)], extract64(n_4, i * 16, 16), m_1, fpst);
> +    }
> +    clear_tail(d, oprsz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fmlsl_idx_h)(void *vd, void *vn, void *vm,
> +                              void *fpst, uint32_t desc)
> +{
> +    intptr_t i, oprsz = simd_oprsz(desc);
> +    int is_2 = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    int index = extract32(desc, SIMD_DATA_SHIFT + 1, 3);
> +    int is_q = oprsz == 16;
> +    float32 *d = vd;
> +    uint64_t n_4;
> +    float16 m_1;
> +
> +    /* Pre-load all of the f16 data, avoiding overlap issues.  */
> +    n_4 = load4_f16(vn, is_q, is_2);
> +    m_1 = ((float16 *)vm)[H2(index)];
> +
> +    for (i = 0; i < oprsz / 4; i++) {
> +        d[H4(i)] = fmlsl(d[H4(i)], extract64(n_4, i*16, 16), m_1, fpst);
> +    }
> +    clear_tail(d, oprsz, simd_maxsz(desc));
> +}
> --
> 2.17.2
>
>
