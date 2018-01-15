Received: by 10.28.173.206 with SMTP id w197csp3025238wme;
        Mon, 15 Jan 2018 10:20:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBosXyIgZAi9o1mJZr+2OHfM6xpUlVJHX3+mrpW/ghjw5p3Dm9vdeBVrbMc6dqUYRSV+ai8Qd
X-Received: by 10.37.244.67 with SMTP id p3mr14250527ybe.222.1516040447757;
        Mon, 15 Jan 2018 10:20:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516040447; cv=none;
        d=google.com; s=arc-20160816;
        b=Ldsn39Lp56mxFa+4Hz8h8jR4U7Xc9dY+5gQRl0l4e2rmmhEK2pr2IRg4X8OZIymiBd
         cKuMCjwzn/AuvwmH6HyyNiImDvUyhejxzR/umepeEKo3BbyNWMovGUSpp2oQJLeAmWsC
         2cR9Kbb5HZqX0f6hj0VmOUpbr0NDuYbZ15h8Fn3KCRrBHVVesZo6lMEobakogFhUy+wA
         ZM/8QN5Aq7kWzLcwz7DlMbG5tQHx65mWp1RCXwEOUQ8E6WPzHJcPGr6x5pg7CXzoyxZk
         jrSnWQjcVfSItLifv+JBwHXkLBTxBYe/WQwRP+SB2F/kHdsIKdP+LaAAO7QuFOJCxYvM
         eoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aRPPv6pC6ANqDgjAKpzlh0bfjEMSvAZPeI7n8WQk9qI=;
        b=wyCeTzywybOC908LGfuN+cGzhuY9i7PISZ4jc2apvEiZfJMqYZEYGXZ51FwfTEaRJ9
         ntaqsYT0gLiJCnLrshXqiIZzALJS0zLZ/LuWsBQmtneDFY1U+gxTnFOiYtgE2wYxLih7
         mvi64XGI1KFEvVu/BtadQKq/zHW2VN/SB0wTPHrbgjcEK8RDRgk2IWNqflgFfIsVbVkw
         Fw/H7F//DI6NgYTU3Sk1+wuDkBQys/EuI5WtgnZwNMo2a4czsl/Khi/lqyvo9jWYKxYs
         HibaFek779Hup+2bZCv3YjBVZ4SFBA2ARPqleHXQ5hTPsgPRgJU+Sv4chudGVXmDVOIw
         mFOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hxQHJfQJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68si51099ybc.230.2018.01.15.10.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 10:20:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hxQHJfQJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb9NH-0005wL-5f
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 13:20:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9Lg-00057j-3Z
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 13:19:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9Le-00009n-HS
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 13:19:08 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:42325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb9Le-00009M-Bi
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 13:19:06 -0500
Received: by mail-ot0-x241.google.com with SMTP id s3so11382581otc.9
	for <qemu-devel@nongnu.org>; Mon, 15 Jan 2018 10:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aRPPv6pC6ANqDgjAKpzlh0bfjEMSvAZPeI7n8WQk9qI=;
	b=hxQHJfQJerdwYQe1G5MEDsfU63lU8B6KRky/mgEFUiHjXxefU/UrNIpn6TkhcIqPkc
	r76y9azaCDY9P+6PVwVSyQmXF9eoZb8T04mJ3HTS6pVJ0983d0bYxV/WveNhwBLZh4yI
	F2bhgPuxp/0wmA8GKfDG7bMypTXV29f5SlDmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aRPPv6pC6ANqDgjAKpzlh0bfjEMSvAZPeI7n8WQk9qI=;
	b=H7M+TPr3PNXC2aeVhQsiKUQSQQYicX3f4tjQWORrh2o+7VyOjb046MgopnQ0yLgJCj
	UclkdvQe6vHDmrudGJxiaJG95yk7jayoekBuu8goTB9l1K0TiWq8B4p3liEP0lAHrYrh
	1gNe5AI3iO3O+oTT9EV9gAyKed25Ex3JXXS2DlL53pf7JhPa7tIAsyNCj/GmuKfp0CXI
	jpPrgddvRgbLQjK4GJ3ybDdYVaDrOHD/mj4Vn0qdzs7/FqOi21su40ZoKMNSidTWpLtk
	89lvvY5F4nzN8L6ECKTl9THHbwJAtzdruVNCJ0KOyWAh0qAdk5Y7tAIpKZG/V45WfkGq
	pmIA==
X-Gm-Message-State: AKwxytdl1DW1mNthFk5bd058BuBfEuEJ2eeNJy/ILGbfxjsza0vPAvnD
	x+NJ4cbQ9wUHYMN3zlrnXEsZtl/e+r8tppQzwGTeCw==
X-Received: by 10.157.2.175 with SMTP id 44mr18977967otl.335.1516040345485;
	Mon, 15 Jan 2018 10:19:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 10:18:45 -0800 (PST)
In-Reply-To: <20171218172425.18200-10-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 18:18:45 +0000
Message-ID: <CAFEAcA9Dmdh+u7AZHhjEkS3zc6i4yf+Eo1-NuksgVdo1cqmKFQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-devel] [PATCH v2 09/11] target/arm: Decode aa64 armv8.3
 fcmla
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Wuu24CsedO+

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h         |  11 ++++
>  target/arm/advsimd_helper.c | 144 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c  | 149 ++++++++++++++++++++++++++++++++------------
>  3 files changed, 265 insertions(+), 39 deletions(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 0f0fc942b0..5b6333347d 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -574,6 +574,17 @@ DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
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
> diff --git a/target/arm/advsimd_helper.c b/target/arm/advsimd_helper.c
> index afc2bb1142..6a2a53e111 100644
> --- a/target/arm/advsimd_helper.c
> +++ b/target/arm/advsimd_helper.c
> @@ -274,3 +274,147 @@ void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
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
> +    neg_real <<= 15;
> +    neg_imag <<= 15;
> +
> +    for (i = 0; i < opr_sz / 2; i += 2) {
> +        float16 e0 = n[H2(i + flip)];
> +        float16 e1 = m[H2(i + flip)] ^ neg_real;
> +        float16 e2 = e0;
> +        float16 e3 = m[H2(i + 1 - flip)] ^ neg_imag;

This is again rather confusing to compare against the pseudocode.
What order are your e0/e1/e2/e3 compared to the pseudocode's
element1/element2/element3/element4 ?

> +
> +        d[H2(i)] = float16_muladd(e0, e1, d[H2(i)], 0, fpst);
> +        d[H2(i + 1)] = float16_muladd(e2, e3, d[H2(i + 1)], 0, fpst);
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
> +                             void *vfpst, uint32_t desc)
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
> +    float16 e1 = m[H2(flip)];
> +    float16 e3 = m[H2(1 - flip)];
> +
> +    neg_real <<= 15;
> +    neg_imag <<= 15;
> +    e1 ^= neg_real;
> +    e3 ^= neg_imag;
> +
> +    for (i = 0; i < opr_sz / 2; i += 2) {
> +        float16 e0 = n[H2(i + flip)];
> +        float16 e2 = e0;
> +
> +        d[H2(i)] = float16_muladd(e0, e1, d[H2(i)], 0, fpst);
> +        d[H2(i + 1)] = float16_muladd(e2, e3, d[H2(i + 1)], 0, fpst);
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fcmlas)(void *vd, void *vn, void *vm,
> +                         void *vfpst, uint32_t desc)
> +{
> +    uintptr_t opr_sz = simd_oprsz(desc);
> +    float32 *d = vd;
> +    float32 *n = vn;
> +    float32 *m = vm;
> +    float_status *fpst = vfpst;
> +    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
> +    uint32_t neg_real = flip ^ neg_imag;
> +    uintptr_t i;
> +
> +    neg_real <<= 31;
> +    neg_imag <<= 31;
> +
> +    for (i = 0; i < opr_sz / 4; i += 2) {
> +        float32 e0 = n[H4(i + flip)];
> +        float32 e1 = m[H4(i + flip)] ^ neg_real;
> +        float32 e2 = e0;
> +        float32 e3 = m[H4(i + 1 - flip)] ^ neg_imag;
> +
> +        d[H4(i)] = float32_muladd(e0, e1, d[H4(i)], 0, fpst);
> +        d[H4(i + 1)] = float32_muladd(e2, e3, d[H4(i + 1)], 0, fpst);
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
> +                             void *vfpst, uint32_t desc)
> +{
> +    uintptr_t opr_sz = simd_oprsz(desc);
> +    float32 *d = vd;
> +    float32 *n = vn;
> +    float32 *m = vm;
> +    float_status *fpst = vfpst;
> +    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
> +    uint32_t neg_real = flip ^ neg_imag;
> +    uintptr_t i;
> +    float32 e1 = m[H4(flip)];
> +    float32 e3 = m[H4(1 - flip)];
> +
> +    neg_real <<= 31;
> +    neg_imag <<= 31;
> +    e1 ^= neg_real;
> +    e3 ^= neg_imag;
> +
> +    for (i = 0; i < opr_sz / 4; i += 2) {
> +        float32 e0 = n[H4(i + flip)];
> +        float32 e2 = e0;
> +
> +        d[H4(i)] = float32_muladd(e0, e1, d[H4(i)], 0, fpst);
> +        d[H4(i + 1)] = float32_muladd(e2, e3, d[H4(i + 1)], 0, fpst);
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
> +                         void *vfpst, uint32_t desc)
> +{
> +    uintptr_t opr_sz = simd_oprsz(desc);
> +    float64 *d = vd;
> +    float64 *n = vn;
> +    float64 *m = vm;
> +    float_status *fpst = vfpst;
> +    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    uint64_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
> +    uint64_t neg_real = flip ^ neg_imag;
> +    uintptr_t i;
> +
> +    neg_real <<= 63;
> +    neg_imag <<= 63;
> +
> +    for (i = 0; i < opr_sz / 8; i += 2) {
> +        float64 e0 = n[i + flip];
> +        float64 e1 = m[i + flip] ^ neg_real;
> +        float64 e2 = e0;
> +        float64 e3 = m[i + 1 - flip] ^ neg_imag;
> +
> +        d[i] = float64_muladd(e0, e1, d[i], 0, fpst);
> +        d[i + 1] = float64_muladd(e2, e3, d[i + 1], 0, fpst);
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 89a0616894..79fede35c1 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -10713,6 +10713,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>          }
>          feature = ARM_FEATURE_V8_1_SIMD;
>          break;
> +    case 0x8: /* FCMLA, #0 */
> +    case 0x9: /* FCMLA, #90 */
> +    case 0xa: /* FCMLA, #180 */
> +    case 0xb: /* FCMLA, #270 */
>      case 0xc: /* FCADD, #90 */
>      case 0xe: /* FCADD, #270 */
>          if (size == 0 || (size == 3 && !is_q)) {
> @@ -10767,6 +10771,26 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>                             0, fn_gvec_ptr);
>          break;
>
> +    case 0x8: /* FCMLA, #0 */
> +    case 0x9: /* FCMLA, #90 */
> +    case 0xa: /* FCMLA, #180 */
> +    case 0xb: /* FCMLA, #270 */
> +        switch (size) {
> +        case 1:
> +            fn_gvec_ptr = gen_helper_gvec_fcmlah;
> +            break;
> +        case 2:
> +            fn_gvec_ptr = gen_helper_gvec_fcmlas;
> +            break;
> +        case 3:
> +            fn_gvec_ptr = gen_helper_gvec_fcmlad;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +        data = extract32(opcode, 0, 2);
> +        goto do_fpst;

These need the "size 0b01 is UNDEF unless FP16 extn present" check too.

> +
>      case 0xc: /* FCADD, #90 */
>      case 0xe: /* FCADD, #270 */
>          switch (size) {
> @@ -10783,6 +10807,7 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>              g_assert_not_reached();
>          }
>          data = extract32(opcode, 1, 1);
> +    do_fpst:
>          fpst = get_fpstatus_ptr(size == 1);
>          tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
>                             vec_full_reg_offset(s, rn),
> @@ -11864,80 +11889,80 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>      int rn = extract32(insn, 5, 5);
>      int rd = extract32(insn, 0, 5);
>      bool is_long = false;
> -    bool is_fp = false;
> +    int is_fp = 0;
> +    bool is_fp16 = false;
>      int index;
>      TCGv_ptr fpst;
>
> -    switch (opcode) {
> -    case 0x0: /* MLA */
> -    case 0x4: /* MLS */
> -        if (!u || is_scalar) {
> +    switch (16 * u + opcode) {
> +    case 0x00: /* MLA */
> +    case 0x04: /* MLS */
> +    case 0x08: /* MUL */
> +        if (is_scalar) {
>              unallocated_encoding(s);
>              return;
>          }

This would all be easier to read if "refactor to switch on u:opcode"
was a separate patch from adding the new insns.


thanks
-- PMM
