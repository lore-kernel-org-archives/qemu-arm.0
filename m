Received: by 10.28.173.206 with SMTP id w197csp3017356wme;
        Mon, 15 Jan 2018 10:12:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBouJo7/N4Yx19aWYkabCKP3PkeS+51iYf6/CVP+H1cSjWiesw0JRnutr6VJfJZXhqekdfRCr
X-Received: by 10.129.82.195 with SMTP id g186mr4982465ywb.29.1516039944504;
        Mon, 15 Jan 2018 10:12:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516039944; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1SDhehPcNVLhtNZ/Cc8PSoVWGBOIjB1X6Ge6EAsDLm1XYta4dNn9ZkVCkOYCpNkhs
         1xyp2ZiH9GkS/PEHiyH6tdUmi5HcrLigjjnmCpLROuV29MjJjep6G7y1MshwR3Q3hB7o
         4YL1aMkZ8zuU1dcigsevVkucJj577NK+qMNocG/JSGgrgiD0ur1B7l8lC1wqIwOxzM4K
         UBM3MYEOlBwIkV9+5lq+M03Ocf6QTzFh2b5FcFBfi4vFu2sdrBVivyRWGkM12OXGxsjz
         14441Z8qpsgmRvy/l7fDYJ3c8ziS+2lMdad4DUoDNKR6/v3+n9KLwddLJqk2iWvVMm6P
         2o8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=TqtyXjHx8CSTse+l0N5KUQEgmWDDoMk3BIH5HuC7x4E=;
        b=s0cplsHWlKvGL+w5Z4FKUt19K6EKLLJA/p2YJm3UzEt/QhUNHcJHmA0L1ui6eRS1Tp
         zbtiAaMpQFcZ3qK2DJoUJgHhOC3PCcI0DfdEO+Fe7n2qx2u/dRCqrhXUThNA/IeV8qql
         2ZU1tPIryVjWllsvfk2vAUF32ddoXOaradffFqVMSH6IaZys0Xe0yERqdKntmu9edVyv
         23icWaqM2LAHmFkYtYZbAbFfyZBdR+ECpSPBnP3oYxgivLCtNg0VrAc1bOMce1sTkwRT
         icH+3l43HQUFoY+zJRU0mRz7ixh3MB0++8aYA1aGhe7FKsJGczXujWuC2SXEzDIf9JbL
         Gl5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nzf/rq79;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f184si45933ybg.402.2018.01.15.10.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 10:12:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nzf/rq79;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb9F9-0000Sm-Sv
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 13:12:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9EU-0008Tj-V4
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:11:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9ET-0003QX-JR
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:11:42 -0500
Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a]:41980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb9ET-0003QE-D1
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:11:41 -0500
Received: by mail-ot0-x22a.google.com with SMTP id 44so10485347otk.8
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 10:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TqtyXjHx8CSTse+l0N5KUQEgmWDDoMk3BIH5HuC7x4E=;
	b=Nzf/rq79S83yQiTURj3EkGHKe1nc3LsxqD7Eb30TE8c6bVGqTE9Y6xFmSOjTKYz89Y
	BmKD8bErxHbuzySP+pwsdICneop540ZRaAlHj43G+X9kvCl+aPrfS+bEQinicYO8LQbB
	clVlvO7+MVWC+DUy4D3CVIquDIFlp5luVzz2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TqtyXjHx8CSTse+l0N5KUQEgmWDDoMk3BIH5HuC7x4E=;
	b=O6OLpq4MMlIv3vyXeaV86VeI8sQRWtYtcrFbjF3cPywVRXMPBdEX1SeRGIt9VJxawn
	K+WEtmXfT1TbcI7nTXDEIye++wTpL3SUgaQAZAbBsyZfXQZFh2x20tKZsvUzOwQ7qaYD
	ITHA/ZnCc1+IbjWTeHPKJDxm4TtA5X9sg8hjh5eziqPBzUda3D3pjoQDuCZEhjcs4V/Z
	Km0D9EdM80deCh6hM8Xp0SeOEGRczGbKZNlAEVVZeFkJRJPKQMz+H7msL8vgIjIGLMdE
	pYyRL6oGw7f1X6Zd6/5CnJQYl4EnAgk4cw1MCs75IfN6ClSr11GnHzNZbneM2JW5bI8q
	WgZQ==
X-Gm-Message-State: AKwxytfg+8zbe5EnqFmejXntaWehVHy3ZZJ2UwH0fxIYfYZoRCvnlLHP
	b6wLQE7/JOD3W7NNVQu23LbY3tcPK1PzlF0RoBgjgQ==
X-Received: by 10.157.51.76 with SMTP id u12mr11537969otd.197.1516039900601;
	Mon, 15 Jan 2018 10:11:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 10:11:19 -0800 (PST)
In-Reply-To: <20171218172425.18200-9-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 18:11:19 +0000
Message-ID: <CAFEAcA_WuV7dJxZ7PB0Lazq4vzAUfRJqX7KVFDJBRF76VnkzXg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22a
Subject: Re: [Qemu-arm] [PATCH v2 08/11] target/arm: Decode aa64 armv8.3
 fcadd
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
X-TUID: G3d93xSM1gpT

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h         |  7 ++++
>  target/arm/advsimd_helper.c | 93 +++++++++++++++++++++++++++++++++++++++=
++++++
>  target/arm/translate-a64.c  | 36 +++++++++++++++++-
>  3 files changed, 135 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 06ca458614..0f0fc942b0 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -567,6 +567,13 @@ DEF_HELPER_FLAGS_5(gvec_qrdmlah_s32, TCG_CALL_NO_RWG=
,
>  DEF_HELPER_FLAGS_5(gvec_qrdmlsh_s32, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, i32)
>
> +DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_fcaddd, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)
> +
>  #ifdef TARGET_AARCH64
>  #include "helper-a64.h"
>  #endif
> diff --git a/target/arm/advsimd_helper.c b/target/arm/advsimd_helper.c
> index d5185165a5..afc2bb1142 100644
> --- a/target/arm/advsimd_helper.c
> +++ b/target/arm/advsimd_helper.c
> @@ -24,6 +24,18 @@
>  #include "tcg/tcg-gvec-desc.h"
>
>
> +/* Note that vector data is stored in host-endian 64-bit chunks,
> +   so addressing units smaller than that needs a host-endian fixup.  */
> +#ifdef HOST_WORDS_BIGENDIAN
> +#define H1(x)  ((x) ^ 7)
> +#define H2(x)  ((x) ^ 3)
> +#define H4(x)  ((x) ^ 1)
> +#else
> +#define H1(x)  (x)
> +#define H2(x)  (x)
> +#define H4(x)  (x)
> +#endif
> +
>  #define SET_QC() env->vfp.xregs[ARM_VFP_FPSCR] |=3D CPSR_Q
>
>  static void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
> @@ -181,3 +193,84 @@ void HELPER(gvec_qrdmlsh_s32)(void *vd, void *vn, vo=
id *vm,
>      }
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }
> +
> +void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
> +                         void *vfpst, uint32_t desc)
> +{
> +    uintptr_t opr_sz =3D simd_oprsz(desc);
> +    float16 *d =3D vd;
> +    float16 *n =3D vn;
> +    float16 *m =3D vm;
> +    float_status *fpst =3D vfpst;
> +    uint32_t neg_real =3D extract32(desc, SIMD_DATA_SHIFT, 1);
> +    uint32_t neg_imag =3D neg_real ^ 1;
> +    uintptr_t i;
> +
> +    neg_real <<=3D 15;
> +    neg_imag <<=3D 15;

This took me a little while to figure out, given that it's
somewhat different from the pseudocode. (I think I was also
thrown by the <<=3D 15 being done on its own line rather than
in the assignment.) A comment might help?

> +
> +    for (i =3D 0; i < opr_sz / 2; i +=3D 2) {
> +        float16 e0 =3D n[H2(i)];
> +        float16 e1 =3D m[H2(i + 1)] ^ neg_imag;
> +        float16 e2 =3D n[H2(i + 1)];
> +        float16 e3 =3D m[H2(i)] ^ neg_real;
> +
> +        d[H2(i)] =3D float16_add(e0, e1, fpst);
> +        d[H2(i + 1)] =3D float16_add(e2, e3, fpst);
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fcadds)(void *vd, void *vn, void *vm,
> +                         void *vfpst, uint32_t desc)
> +{
> +    uintptr_t opr_sz =3D simd_oprsz(desc);
> +    float32 *d =3D vd;
> +    float32 *n =3D vn;
> +    float32 *m =3D vm;
> +    float_status *fpst =3D vfpst;
> +    uint32_t neg_real =3D extract32(desc, SIMD_DATA_SHIFT, 1);
> +    uint32_t neg_imag =3D neg_real ^ 1;
> +    uintptr_t i;
> +
> +    neg_real <<=3D 31;
> +    neg_imag <<=3D 31;
> +
> +    for (i =3D 0; i < opr_sz / 4; i +=3D 2) {
> +        float32 e0 =3D n[H4(i)];
> +        float32 e1 =3D m[H4(i + 1)] ^ neg_imag;
> +        float32 e2 =3D n[H4(i + 1)];
> +        float32 e3 =3D m[H4(i)] ^ neg_real;
> +
> +        d[H4(i)] =3D float32_add(e0, e1, fpst);
> +        d[H4(i + 1)] =3D float32_add(e2, e3, fpst);
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_fcaddd)(void *vd, void *vn, void *vm,
> +                         void *vfpst, uint32_t desc)
> +{
> +    uintptr_t opr_sz =3D simd_oprsz(desc);
> +    float64 *d =3D vd;
> +    float64 *n =3D vn;
> +    float64 *m =3D vm;
> +    float_status *fpst =3D vfpst;
> +    uint64_t neg_real =3D extract64(desc, SIMD_DATA_SHIFT, 1);
> +    uint64_t neg_imag =3D neg_real ^ 1;
> +    uintptr_t i;
> +
> +    neg_real <<=3D 63;
> +    neg_imag <<=3D 63;
> +
> +    for (i =3D 0; i < opr_sz / 8; i +=3D 2) {
> +        float64 e0 =3D n[i];
> +        float64 e1 =3D m[i + 1] ^ neg_imag;
> +        float64 e2 =3D n[i + 1];
> +        float64 e3 =3D m[i] ^ neg_real;
> +
> +        d[i] =3D float64_add(e0, e1, fpst);
> +        d[i + 1] =3D float64_add(e2, e3, fpst);
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 85fc7af491..89a0616894 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -10696,7 +10696,8 @@ static void disas_simd_three_reg_same_extra(Disas=
Context *s, uint32_t insn)
>      int size =3D extract32(insn, 22, 2);
>      bool u =3D extract32(insn, 29, 1);
>      bool is_q =3D extract32(insn, 30, 1);
> -    int feature;
> +    int feature, data;
> +    TCGv_ptr fpst;
>
>      if (!u) {
>          unallocated_encoding(s);
> @@ -10712,6 +10713,14 @@ static void disas_simd_three_reg_same_extra(Disa=
sContext *s, uint32_t insn)
>          }
>          feature =3D ARM_FEATURE_V8_1_SIMD;
>          break;
> +    case 0xc: /* FCADD, #90 */
> +    case 0xe: /* FCADD, #270 */
> +        if (size =3D=3D 0 || (size =3D=3D 3 && !is_q)) {
> +            unallocated_encoding(s);
> +            return;
> +        }

The pseudocode says you need to also check whether the
FP16 extension is supported, or else UNDEF on size =3D=3D 1.

> +        feature =3D ARM_FEATURE_V8_FCMA;
> +        break;
>      default:
>          unallocated_encoding(s);
>          return;
> @@ -10758,6 +10767,31 @@ static void disas_simd_three_reg_same_extra(Disa=
sContext *s, uint32_t insn)
>                             0, fn_gvec_ptr);
>          break;
>
> +    case 0xc: /* FCADD, #90 */
> +    case 0xe: /* FCADD, #270 */
> +        switch (size) {
> +        case 1:
> +            fn_gvec_ptr =3D gen_helper_gvec_fcaddh;
> +            break;
> +        case 2:
> +            fn_gvec_ptr =3D gen_helper_gvec_fcadds;
> +            break;
> +        case 3:
> +            fn_gvec_ptr =3D gen_helper_gvec_fcaddd;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +        data =3D extract32(opcode, 1, 1);

The pseudocode calls this field "rot", which is a bit more
descriptive than "data".

> +        fpst =3D get_fpstatus_ptr(size =3D=3D 1);
> +        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
> +                           vec_full_reg_offset(s, rn),
> +                           vec_full_reg_offset(s, rm), fpst,
> +                           is_q ? 16 : 8, vec_full_reg_size(s),
> +                           data, fn_gvec_ptr);
> +        tcg_temp_free_ptr(fpst);
> +        break;
> +
>      default:
>          g_assert_not_reached();
>      }
> --
> 2.14.3

Otherwise I think this looks OK.

thanks
-- PMM
