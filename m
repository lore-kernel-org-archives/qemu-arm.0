Received: by 10.28.71.27 with SMTP id u27csp2271679wma;
        Thu, 22 Feb 2018 10:22:25 -0800 (PST)
X-Google-Smtp-Source: AH8x2249sGNtLcuS1aHFoaF0zRBOWoT3ObMSny2eZKdDAGtB+o5pOgK789uvpJ/OtRddN5davfkf
X-Received: by 2002:a25:1d03:: with SMTP id d3-v6mr5447663ybd.414.1519323745545;
        Thu, 22 Feb 2018 10:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519323745; cv=none;
        d=google.com; s=arc-20160816;
        b=LyX9z/FHxgIHyGFjKdCpi5GNBlXsCP6egGefnE106ZgQk2RPrw7h43IVDjg8PNHc8Y
         CRW91dI66VYWIIycSiiquXuzubp6o2VOl8SyuUZ9L4VGjw3YcV/z0jw9y5AYiLcv2P+f
         wggbNlJbZ5BYxd7WBBWS6VMJk2S5sZpjtfrE4EpG3cnTJy8NcpIWPo7xs3NwQO6/NCOf
         WfEMEQTJjSF5m8kqYZmM6qbWcdIbOlM0Z2qKP1RxNARh68PgMONKF4HqMpFcrKNFCedq
         Vj2dwR+prKRFL+ox3smxwmTUdGcGCLSnB98V1c/29EMEdalGgGHFp5J40ppgYxHY9hVJ
         5QAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zQG0unBe2ziETePWp4N65Nezsb+k07RqmLO+/FLFxmM=;
        b=wJjs9ZXGqCDtYeir2Z47piCarse1zWdBlmw77Zt9aU7B3kbG8u0Sph0vmgfPb+z5Z5
         k3R1+qFti1mSEgLpRf3jPDj9zY3YqTzyBXf5WsYkrchm+lPoQPQb/eVmeoJLjNtBifme
         RzrG+5BRYVdMUi48BuPGr1j6rDHFmJtBan0qdkIhnNfra0stTKZ/ouo2m978Rlg52LJI
         BQi25x1sItXmRWKvenJiiHyv8y/HX+VZrn+45RjPJoaq4JRQYBfyyJTKiOCTZ36SYOZx
         QQ5N+Y0hpLSZedUMhIOdWbPQ3ymjMRXKHXCwe7h+T7tXa4TvBoJS94cbp+IWbPNlScBt
         NdfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KPqkngvc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l30si99113ywh.785.2018.02.22.10.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 10:22:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KPqkngvc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eovVh-0002uL-0i
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 13:22:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eovUd-0002a7-SS
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 13:21:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eovUc-0001Vy-RN
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 13:21:19 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eovUc-0001VS-K2
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 13:21:18 -0500
Received: by mail-oi0-x242.google.com with SMTP id e10so4389471oiy.8
	for <qemu-devel@nongnu.org>; Thu, 22 Feb 2018 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zQG0unBe2ziETePWp4N65Nezsb+k07RqmLO+/FLFxmM=;
	b=KPqkngvcxno4tMQj0F9G0IAYcBrMTGBDLRxKCN16SHh/hohEjr3GuEQ+pX08OfDEwZ
	+Rx38JCzbVXvZzhCuMqMZ/he/w+Nsnpa576O4JCzVr5aJ0i0QUzBszSpSjDhPBOBgkxI
	pH8CYpcAbPNmnBeoiH2tFctqDOzkPC4lARtUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zQG0unBe2ziETePWp4N65Nezsb+k07RqmLO+/FLFxmM=;
	b=QTF7HLuJvsfclYqBfgPm5qjyy3iBpsK2DPRy7J3MSMHhaOEFYRwROuoV3XnpNqJY/f
	kvYyszvXSpdNUTZqKFy75rDwLAC8MR+M9tJQtRyRSMU0uDcUNgwk/Z0cFMO/9VlyBA2h
	VdgSyMRz6wrs43+T5b04ZNut1La/Ez5pjXEdO+kemVSIS4iIRBo9Nb7iCFPP7BR5BxZ2
	KgdFHB21CCHuveBFQxJrlNX94NKWCcQlAYPc2cTlUOngnVXjBjK2wU1SYPVlMSKlOSxl
	8Y3VlFXE4Q7hkRVuGVnJaz6ha+MQMp1JZHNBo5ukucJr73MU2B02b/dSmFNYNZXpxYiT
	nk9g==
X-Gm-Message-State: APf1xPDMvtCzsceiC1UbsekCMVMQsI6t/fdWyByOuhOomCI2M1V8LgnW
	d/Co9A6dkXm40Nx+uZhTnCYuFOb3qKpAbnG3v4hBKA==
X-Received: by 10.202.95.68 with SMTP id t65mr5496266oib.102.1519323677422;
	Thu, 22 Feb 2018 10:21:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 10:20:57 -0800 (PST)
In-Reply-To: <20180217182323.25885-6-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 18:20:57 +0000
Message-ID: <CAFEAcA9dA5rgqRGJV8rPrDGdzX5ZCKOpTMwDRMp_yu-sycyV+g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v2 05/67] target/arm: Implement SVE load
 vector/predicate
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
X-TUID: qiFxgKLvANfE

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 132 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  22 +++++++-
>  2 files changed, 153 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 50cf2a1fdd..c0cccfda6f 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -46,6 +46,19 @@ typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
>   * Implement all of the translator functions referenced by the decoder.
>   */
>
> +/* Return the offset info CPUARMState of the predicate vector register Pn.
> + * Note for this purpose, FFR is P16.  */

Missing newline before */.

> +/*
> + *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
> + */
> +
> +/* Subroutine loading a vector register at VOFS of LEN bytes.
> + * The load should begin at the address Rn + IMM.
> + */
> +
> +#if UINTPTR_MAX == UINT32_MAX
> +# define ptr i32
> +#else
> +# define ptr i64
> +#endif

I think that rather than doing this we should improve the
provision that tcg/tcg-op.h has for *_ptr() wrappers, so
from the target's point of view it has a proper tcg_const_local_ptr()
and tcg_gen_brcondi_ptr(), same as for _i32, _i64 and _tl.

> +
> +static void do_ldr(DisasContext *s, uint32_t vofs, uint32_t len,
> +                   int rn, int imm)
> +{
> +    uint32_t len_align = QEMU_ALIGN_DOWN(len, 8);
> +    uint32_t len_remain = len % 8;
> +    uint32_t nparts = len / 8 + ctpop8(len_remain);
> +    int midx = get_mem_index(s);
> +    TCGv_i64 addr, t0, t1;
> +
> +    addr = tcg_temp_new_i64();
> +    t0 = tcg_temp_new_i64();
> +
> +    /* Note that unpredicated load/store of vector/predicate registers
> +     * are defined as a stream of bytes, which equates to little-endian
> +     * operations on larger quantities.  There is no nice way to force
> +     * a little-endian load for aarch64_be-linux-user out of line.
> +     *
> +     * Attempt to keep code expansion to a minimum by limiting the
> +     * amount of unrolling done.
> +     */
> +    if (nparts <= 4) {
> +        int i;
> +
> +        for (i = 0; i < len_align; i += 8) {
> +            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
> +            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
> +            tcg_gen_st_i64(t0, cpu_env, vofs + i);
> +        }
> +    } else {
> +        TCGLabel *loop = gen_new_label();
> +        TCGv_ptr i = TCGV_NAT_TO_PTR(glue(tcg_const_local_, ptr)(0));
> +        TCGv_ptr dest;
> +
> +        gen_set_label(loop);
> +
> +        /* Minimize the number of local temps that must be re-read from
> +         * the stack each iteration.  Instead, re-compute values other
> +         * than the loop counter.
> +         */
> +        dest = tcg_temp_new_ptr();
> +        tcg_gen_addi_ptr(dest, i, imm);
> +#if UINTPTR_MAX == UINT32_MAX
> +        tcg_gen_extu_i32_i64(addr, TCGV_PTR_TO_NAT(dest));
> +        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
> +#else
> +        tcg_gen_add_i64(addr, TCGV_PTR_TO_NAT(dest), cpu_reg_sp(s, rn));
> +#endif

Can we avoid the ifdef by creating a tcg_gen_ext_ptr_i64() (similar
to but opposite in effect to the existing tcg_gen_ext_i32_ptr()) ?

> +
> +        tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
> +
> +        tcg_gen_add_ptr(dest, cpu_env, i);
> +        tcg_gen_addi_ptr(i, i, 8);
> +        tcg_gen_st_i64(t0, dest, vofs);
> +        tcg_temp_free_ptr(dest);
> +
> +        glue(tcg_gen_brcondi_, ptr)(TCG_COND_LTU, TCGV_PTR_TO_NAT(i),
> +                                    len_align, loop);
> +        tcg_temp_free_ptr(i);
> +    }
> +
> +    /* Predicate register loads can be any multiple of 2.
> +     * Note that we still store the entire 64-bit unit into cpu_env.
> +     */
> +    if (len_remain) {
> +        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
> +
> +        switch (len_remain) {
> +        case 2:
> +        case 4:
> +        case 8:
> +            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
> +            break;
> +
> +        case 6:
> +            t1 = tcg_temp_new_i64();
> +            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEUL);
> +            tcg_gen_addi_i64(addr, addr, 4);
> +            tcg_gen_qemu_ld_i64(t1, addr, midx, MO_LEUW);
> +            tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
> +            tcg_temp_free_i64(t1);
> +            break;
> +
> +        default:
> +            g_assert_not_reached();
> +        }
> +        tcg_gen_st_i64(t0, cpu_env, vofs + len_align);
> +    }
> +    tcg_temp_free_i64(addr);
> +    tcg_temp_free_i64(t0);
> +}
> +
> +#undef ptr

>
> +&rri           rd rn imm
>  &rrr_esz       rd rn rm esz
>
>  ###########################################################################
> @@ -31,7 +37,13 @@
>  # reduce the amount of duplication between instruction patterns.
>
>  # Three operand with unused vector element size
> -@rd_rn_rm_e0   ........ ... rm:5  ... ...  rn:5 rd:5           &rrr_esz esz=0
> +@rd_rn_rm_e0   ........ ... rm:5 ... ... rn:5 rd:5             &rrr_esz esz=0

This change looks like it should be squashed into a previous patch?

> +
> +# Basic Load/Store with 9-bit immediate offset
> +@pd_rn_i9      ........ ........ ...... rn:5 . rd:4    \
> +               &rri imm=%imm9_16_10
> +@rd_rn_i9      ........ ........ ...... rn:5 rd:5      \
> +               &rri imm=%imm9_16_10
>

thanks
-- PMM
