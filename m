Received: by 10.28.91.67 with SMTP id p64csp1846436wmb;
        Thu, 1 Mar 2018 05:44:48 -0800 (PST)
X-Google-Smtp-Source: AG47ELsWKADc8Jf2ViyzQ3lS9YqmVv9DKjrL/rlDgAwhIi7EmmCWJsTFISiLdTmMrwmg5m1aiRMr
X-Received: by 2002:a25:e686:: with SMTP id d128-v6mr1081391ybh.82.1519911888858;
        Thu, 01 Mar 2018 05:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519911888; cv=none;
        d=google.com; s=arc-20160816;
        b=IfN1MMj/N4tWxQF/eTlUJ1lvBVMinkHgq7z58sc+ql2/Kh6nnJStcRsy+7Idty68S4
         jBz6fuhd7ekFk3ibL3Y6g0JpvN56b6aDeeUxJ0JYkl7xcp6F6JutifGbwEkgyoB+QW8R
         1iMd/zcxiZeRLebqgMMbkeuDUbk7aMoo5uLf18tO2xdDSKC4cHWPW5snQiv1C30wygKA
         iFhg3Z0q3yojEZ9hlY3scMf5HhkbIpSnQmVL33HHX+otTJawKGrW+KsOP3r0wjSMPqqP
         7VNAY2VstUpYy3CHpwlHxC/aTw2SOQ9OklnGwsrzeT/Nz4mKjak4XBHcBebAxk31aMSf
         n7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mSA2FOpCwvSl2nvAcNhFOEy9NpLKj74QvnxIHlyfKXg=;
        b=YW0rD9EGk7SvFopSRBFUlm7Pc7YvjHnbNtJrzI272pSkHWoKru2SP10kGxjCo3BtGD
         L4hUyCR6TUyh87ypxPbx7W9apKF/rEDXJSrpQHy29vidK95tTjqsf3Eq6DtPIq2Opl3G
         BX8BQ/RZwRG+tHnt9kswkjnTGy92DAYCPHkrtwBESHIjENL+L2kGwA25szfXOI7bV1ms
         bCBxogJwVShnqUTvPsvfMNI40fTN8/HvYD7x872cn+CKYK8KFO32GoU0wcPEuWItuQbm
         h/C6Z1NGbTk6jNxxIV/ClCRRzWAuOd0Ws46cphEGAWBRx+5/9+T6U9BkqtrjqKw5ICmV
         en9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h6peqG6o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n10si637066ywl.737.2018.03.01.05.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 05:44:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h6peqG6o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOVs-0000u6-9F
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 08:44:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOLY-000825-4J
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:34:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOLW-0000TS-Tc
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:34:08 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:33355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erOLW-0000TH-OX
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:34:06 -0500
Received: by mail-ot0-x242.google.com with SMTP id y11so5575423otg.0
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 05:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mSA2FOpCwvSl2nvAcNhFOEy9NpLKj74QvnxIHlyfKXg=;
	b=h6peqG6orcQe3AsOmlXOxRDX61gyeE0pAjt0U69eiTFYMLomWei0ouYtcgpVdn3kxg
	euXZkgN5BYh8ytayvrX0MOFlU5L9BW5dq3UhY0Srlcl9NO6KfrSYJmrl128qhE56z/zi
	4Tq89ElWe/hvPTULtY6yj12VaLs47KTL2bkrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mSA2FOpCwvSl2nvAcNhFOEy9NpLKj74QvnxIHlyfKXg=;
	b=lBhMLmdrnRIuD09MmU12xwWXmic2TYAgRssc27l0/5e7wHzNCjAwRg9ZpGMs7SSyhC
	cgRGz2gHo/wDRzl+eGAh1iFB/NuXQE65FWQRB2x22VxRNOmUa0WEoSiY9dpLjsyO9HWX
	udTmp1Kh3NDKVQ8ZKByOVp0wf8BROWjrob7ooXxip9lp27p+Ytsh4PpMEQU3A7xeg1No
	+YBAZeJT/VoSMZfMl+PV3o0z8nstY0cl4DGHu4VHb+rT/wLF3ezVDDdTIGs4Q1VXtUWy
	jYG01PWmdQ8ybVLomKs8AUqsbL9rKK3b5z8pHtVKcm4Np/F+5uGJN9E3fXQdw2fB9r13
	sbqg==
X-Gm-Message-State: AElRT7EkOWTetYee8n7Posw7JMcAY5ZdhXWp6SrA8OLbeCuOSB9ZHPbb
	JlLpinDOxI/uQRqQmUJuONsxrCVeKe5yy76E1FEJ0A==
X-Received: by 10.157.28.156 with SMTP id l28mr933897ota.316.1519911245747;
	Thu, 01 Mar 2018 05:34:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 05:33:45 -0800 (PST)
In-Reply-To: <20180228193125.20577-13-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 13:33:45 +0000
Message-ID: <CAFEAcA-pUMgUnR0cWd9j7n0EyTeXkMTzhPQU_fqhyaXy1hMfxw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 12/16] target/arm: Decode
 aa64 armv8.3 fcmla
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3tAiiIn7MVK

On 28 February 2018 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  11 ++++
>  target/arm/translate-a64.c |  94 +++++++++++++++++++++++++---
>  target/arm/vec_helper.c    | 149 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 246 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 1e2d7025de..0d2094f2be 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -585,6 +585,17 @@ DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
>  DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, i32)
>
> +DEF_HELPER_FLAGS_5(gvec_fcmlah, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fcmlah_idx, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fcmlas, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fcmlad, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +
>  #ifdef TARGET_AARCH64
>  #include "helper-a64.h"
>  #endif
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index efed4fd9d2..31ff0479e6 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -10842,6 +10842,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>          }
>          feature = ARM_FEATURE_V8_RDM;
>          break;
> +    case 0x8: /* FCMLA, #0 */
> +    case 0x9: /* FCMLA, #90 */
> +    case 0xa: /* FCMLA, #180 */
> +    case 0xb: /* FCMLA, #270 */
>      case 0xc: /* FCADD, #90 */
>      case 0xe: /* FCADD, #270 */
>          if (size == 0
> @@ -10891,6 +10895,29 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>          }
>          return;
>
> +    case 0x8: /* FCMLA, #0 */
> +    case 0x9: /* FCMLA, #90 */
> +    case 0xa: /* FCMLA, #180 */
> +    case 0xb: /* FCMLA, #270 */
> +        rot = extract32(opcode, 0, 2);
> +        switch (size) {
> +        case 1:
> +            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, true, rot,
> +                              gen_helper_gvec_fcmlah);
> +            break;
> +        case 2:
> +            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false, rot,
> +                              gen_helper_gvec_fcmlas);
> +            break;
> +        case 3:
> +            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, false, rot,
> +                              gen_helper_gvec_fcmlad);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +        return;
> +
>      case 0xc: /* FCADD, #90 */
>      case 0xe: /* FCADD, #270 */
>          rot = extract32(opcode, 1, 1);

Shouldn't there be a feature check on ARM_FEATURE_V8_FCMA somewhere
in the three_reg_same_extra code path?


> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index a868ca6aac..d81eb7730d 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -278,3 +278,152 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
>      }
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }
> +
> +void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
> +                         void *vfpst, uint32_t desc)
> +{
> +    uintptr_t opr_sz = simd_oprsz(desc);
> +    float16 *d = vd;
> +    float16 *n = vn;
> +    float16 *m = vm;
> +    float_status *fpst = vfpst;
> +    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
> +    uint32_t neg_real = flip ^ neg_imag;
> +    uintptr_t i;
> +
> +    /* Shift boolean to the sign bit so we can xor to negate.  */
> +    neg_real <<= 15;
> +    neg_imag <<= 15;
> +
> +    for (i = 0; i < opr_sz / 2; i += 2) {
> +        float16 e1 = n[H2(i + flip)];
> +        float16 e2 = m[H2(i + flip)] ^ neg_real;
> +        float16 e3 = e1;
> +        float16 e4 = m[H2(i + 1 - flip)] ^ neg_imag;

These don't match up with the element1 ... element4 in the
Arm ARM pseudocode. It's e2 and e4 that are always the same,
not e1 and e3. Ditto in the other functions.

thanks
-- PMM
