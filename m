Received: by 10.28.71.27 with SMTP id u27csp848979wma;
        Fri, 23 Feb 2018 09:25:57 -0800 (PST)
X-Google-Smtp-Source: AH8x226gtM5cecASZKpKwthucwQT2iKMPue9qTOfCf6vn1hDThncTEOfa2BJ6S8f6OuixaCI6H/V
X-Received: by 10.129.196.9 with SMTP id j9mr1629076ywi.385.1519406757290;
        Fri, 23 Feb 2018 09:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519406757; cv=none;
        d=google.com; s=arc-20160816;
        b=r5sLxomVb/0TWWk46MbwLguuM75fcXmuSYBMLD8saxzLFblh/D9dSmY/2khaplcB+q
         SJAsexApcMCtiR+p2nKL752lTM+qK4piOOOeNIknPWJsIO2hOQUkJIz+PyakxEkgO3Lx
         dgphA+84SQXtzF4rsesOnqr2QKKge/7HEoPlMuDb8XDh3dS3GCe/vXauD4GSYXuOy6RY
         tuUjtzHCbtZNGoMU3g/JH18i5bdX8xv8jfMZaLG7sCc4uZbp/ceGzy70YQwo4wmJdtm+
         cmmhqaY/cs0zd/OZhVF3WWmlpgakv3TAZ7TCBaAy7La9wm5NBTEJOGCGzSbjZUVLbQ3H
         6fHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=HWsUYEqHiJZtIt5MAsXCl7cajeoRPXENX0SEix4Ex6Q=;
        b=wq4sr6YaXltSdk7KnvpMKfvcepe0tacLZNvKEecAs6BIzK+NjM0NwQPeTEEZ9DYqye
         SqeQ1t9pmk5fbRpWIPsGPQHPh6I+jTb4NqCBzBMu2rxP71BC6nwYPLb1pE4Dd3jS8sui
         RtD0OtAqchOBEax2Frjhhb5nbmX6lYYTRATMGEBYc7Ge1dlNMg6EIuNiy24hVxU5BdZE
         GR3QTbhtbQe3NEMqPUjwuRBf1GchMd7R8QjHyAeOhqMYH+OUkAGfHG0ZnsuDDxfoRv4r
         TaQxbA1kjWOJ82WsPvE+rjUy8kJ+wK62YwEiT+qLgX29FzuheZj7tPEPHB15CJyuA6lN
         OrGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQ9Y8Lrf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14-v6si482790ybn.367.2018.02.23.09.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:25:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQ9Y8Lrf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epH6a-00009G-Ln
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:25:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epH6N-00008o-MI
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:25:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epH6M-0003bQ-Mr
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:25:43 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:44950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epH6M-0003a0-GO
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:25:42 -0500
Received: by mail-pf0-x241.google.com with SMTP id 17so3770747pfw.11
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HWsUYEqHiJZtIt5MAsXCl7cajeoRPXENX0SEix4Ex6Q=;
	b=VQ9Y8LrfMG1jRc3tLZKKK3OiGgsAvccPZjuyKoTquD11I98DTgDzzlGTOpFQ6Uqd+a
	8hh4B8xsZqSDAvLvRTBT/FO4JZffdujtECMmOs6o7QqAuC2Iz08+8IGOA2iLIMWG9f4L
	QSYhJdb9HxfjrUscKv3eaRCLZpAW7hV/NNLK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HWsUYEqHiJZtIt5MAsXCl7cajeoRPXENX0SEix4Ex6Q=;
	b=Vs491sFGBlqZYY5094YuDWpDzIO8dZV8zbEJ7gnE85kP6jJF6JJEqHfQ8MLFP4FNVg
	KASdL2piQANEJPvPv2CjmoXFA5mg1Qrv+yIof2PB6wxzwyCi1LLsk/KArs5zRjua+ovD
	c539eIXSA5JOXPEIB8TicGaipQbQHULh056acz7j7vO3qa3OhyjIdYC+wGdi/PgXWYb8
	TXBSuJ317tPo9Gxi3bsCaPw47h3mm+AyzcxZU2jJqGVAk16O5XC0M3GXbamsvk1PCq1J
	4CAyblWTEhEkgquiGzu2dzbcsNZfWF9K7w5u8gSCpsnkjQ5IGMdEmX3Mm+0HR0AeQyle
	gz7A==
X-Gm-Message-State: APf1xPDvOxff0EiUof0O39YSpJzLtgHxvlh58Mp0xCajpnYVsMGLd8yC
	YePP1UaqV4WEdkLI1KzsULDstlbIHtoXCrHzx6u9OA==
X-Received: by 10.98.18.70 with SMTP id a67mr2458956pfj.213.1519406741635;
	Fri, 23 Feb 2018 09:25:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 09:25:21 -0800 (PST)
In-Reply-To: <20180217182323.25885-44-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 17:25:21 +0000
Message-ID: <CAFEAcA_VMcqarGdf1nN9=yXn-ybsvHYMzYS6EF0UUDdECJ02_g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 43/67] target/arm: Implement
 SVE Floating Point Arithmetic - Unpredicated Group
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
X-TUID: Jfz/CM0b1LHb

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 14 +++++++
>  target/arm/helper.h        | 19 ++++++++++
>  target/arm/translate-sve.c | 41 ++++++++++++++++++++
>  target/arm/vec_helper.c    | 94 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/Makefile.objs   |  2 +-
>  target/arm/sve.decode      | 10 +++++
>  6 files changed, 179 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/vec_helper.c
>

> +/* Floating-point trigonometric starting value.
> + * See the ARM ARM pseudocode function FPTrigSMul.
> + */
> +static float16 float16_ftsmul(float16 op1, uint16_t op2, float_status *stat)
> +{
> +    float16 result = float16_mul(op1, op1, stat);
> +    if (!float16_is_any_nan(result)) {
> +        result = float16_set_sign(result, op2 & 1);
> +    }
> +    return result;
> +}
> +
> +static float32 float32_ftsmul(float32 op1, uint32_t op2, float_status *stat)
> +{
> +    float32 result = float32_mul(op1, op1, stat);
> +    if (!float32_is_any_nan(result)) {
> +        result = float32_set_sign(result, op2 & 1);
> +    }
> +    return result;
> +}
> +
> +static float64 float64_ftsmul(float64 op1, uint64_t op2, float_status *stat)
> +{
> +    float64 result = float64_mul(op1, op1, stat);
> +    if (!float64_is_any_nan(result)) {
> +        result = float64_set_sign(result, op2 & 1);
> +    }
> +    return result;
> +}
> +
> +#define DO_3OP(NAME, FUNC, TYPE) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
> +{                                                                          \
> +    intptr_t i, oprsz = simd_oprsz(desc);                                  \
> +    TYPE *d = vd, *n = vn, *m = vm;                                        \
> +    for (i = 0; i < oprsz / sizeof(TYPE); i++) {                           \
> +        d[i] = FUNC(n[i], m[i], stat);                                     \
> +    }                                                                      \
> +}
> +
> +DO_3OP(gvec_fadd_h, float16_add, float16)
> +DO_3OP(gvec_fadd_s, float32_add, float32)
> +DO_3OP(gvec_fadd_d, float64_add, float64)
> +
> +DO_3OP(gvec_fsub_h, float16_sub, float16)
> +DO_3OP(gvec_fsub_s, float32_sub, float32)
> +DO_3OP(gvec_fsub_d, float64_sub, float64)
> +
> +DO_3OP(gvec_fmul_h, float16_mul, float16)
> +DO_3OP(gvec_fmul_s, float32_mul, float32)
> +DO_3OP(gvec_fmul_d, float64_mul, float64)
> +
> +DO_3OP(gvec_ftsmul_h, float16_ftsmul, float16)
> +DO_3OP(gvec_ftsmul_s, float32_ftsmul, float32)
> +DO_3OP(gvec_ftsmul_d, float64_ftsmul, float64)
> +
> +#ifdef TARGET_AARCH64

This seems a bit odd given SVE is AArch64-only anyway...

> +
> +DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
> +DO_3OP(gvec_recps_s, helper_recpsf_f32, float32)
> +DO_3OP(gvec_recps_d, helper_recpsf_f64, float64)
> +
> +DO_3OP(gvec_rsqrts_h, helper_rsqrtsf_f16, float16)
> +DO_3OP(gvec_rsqrts_s, helper_rsqrtsf_f32, float32)
> +DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
> +
> +#endif
> +#undef DO_3OP

> +### SVE Floating Point Arithmetic - Unpredicated Group
> +
> +# SVE floating-point arithmetic (unpredicated)
> +FADD_zzz       01100101 .. 0 ..... 000 000 ..... .....         @rd_rn_rm
> +FSUB_zzz       01100101 .. 0 ..... 000 001 ..... .....         @rd_rn_rm
> +FMUL_zzz       01100101 .. 0 ..... 000 010 ..... .....         @rd_rn_rm
> +FTSMUL         01100101 .. 0 ..... 000 011 ..... .....         @rd_rn_rm
> +FRECPS         01100101 .. 0 ..... 000 110 ..... .....         @rd_rn_rm
> +FRSQRTS                01100101 .. 0 ..... 000 111 ..... .....         @rd_rn_rm

Another misaligned line.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
