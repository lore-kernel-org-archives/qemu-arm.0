Received: by 10.28.71.27 with SMTP id u27csp4876461wma;
        Tue, 27 Feb 2018 06:21:39 -0800 (PST)
X-Google-Smtp-Source: AG47ELsqBGNnu30kfOrNBqp4GYUE3INT1n8n8wRPlojLuH/3erRT5RgueBZ91uP4DfY1D5xPHmlm
X-Received: by 2002:a25:c444:: with SMTP id u65-v6mr9620112ybf.487.1519741299720;
        Tue, 27 Feb 2018 06:21:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519741299; cv=none;
        d=google.com; s=arc-20160816;
        b=D5dDO+wFCLBEj5FtpGcogiL0S4dxafIcY86cCWKt4zsMt0fEAZmOU4ENNGqVNxwWRI
         VbZN7/gnrmHNR3FwCWlWaXekhBi/2yv0neV1KNb+x4ueCPZunZ40H2og7XMrXQwEMaIv
         LtWS2PGHcPP4TB5hOdfrzzwaM6T2JWbPQNruYrhSyh/Zqzr9O/2GWC+bSLpDGw+ohpgS
         etNA8FNuVXspmMm1CWwHxEhOcrxHdndgH8frLMDdRvoVPP5BBs0UIsI7ues5TWCcQdoO
         uAeLeOKnpuyiDadRZBXpKUy8/0+P2HYLXmsCwIaKvmLbBPN/nnWjVYKDBssBEGjF6KLo
         nkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IVdCFZCUQq68wsuSSUYcX5BLHG6RBQjOARvghrFrEFw=;
        b=EtPlOw7szo4jg0FJUFJ6ewd01TXrtm5BRKdMN5kNCYqrYOU9FOhfBg5BZA55EQgErl
         rLWq1SH8voQ7v0EL537tRp8aonD+dbQ3sJYVaXnbhrIitq+TL+9t+LiQQQ7dYGopnhnS
         DyxO5PRm/TGfGjJlXnjwjBq0C2dJRb//PrVrjbBzJ7eS2IEqF8isRWIbIReQJIHsh53m
         rO1PxZTY8OPNiFnBbnrwx940hsUu4aUHLrb0bCWy2/mDU+MqLQ9B7JUDeXCPIj4n8EZA
         Ip5i2RGzPuLAU9j2f84a6kqkp8K4sBooC3n6WHtt5ciE0gD6azSMQEoZuou5lwZdI9+T
         /4KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S7lkWgsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g125si1857170ywf.758.2018.02.27.06.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 06:21:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S7lkWgsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqg8R-0003mG-6M
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 09:21:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqg8H-0003lD-EK
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:21:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqg8G-0008N4-4O
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:21:29 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:40031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqg8F-0008Mt-V1
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:21:28 -0500
Received: by mail-oi0-x241.google.com with SMTP id c12so12971110oic.7
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 06:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IVdCFZCUQq68wsuSSUYcX5BLHG6RBQjOARvghrFrEFw=;
	b=S7lkWgsi+OKFnD46q3nZbQKvfpS4Dvqd6H376z6J+TpiZA/jns0oqivTh6+qmhzBbH
	i8DjJicp9k5g3zW6hqvTWk4HwB4c8hLSjEE4yQnjj1vFNASSnwvNE6I84scBSQwM5w+6
	s6j3XU6k7BZBTniqtcsuJuaVMNrgy1rdeUYAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IVdCFZCUQq68wsuSSUYcX5BLHG6RBQjOARvghrFrEFw=;
	b=XfzRStfmfvfZx6jQXL8qAhjCQJCli526+8xdAQyuLtcZ+2ER2DOGWTI6Ut2WoXulZ1
	zb8bqr0TksqqCZURlwYQufLzBmWM9+mu0nRUYUuOgQ0O1q6Gq2jskaUvx/Nqsbsj6eOV
	SeVZxPd6WM9/+tLRXJmxb44fKfRM0QO2xu5KaEjRpPMwY7ep2pj+0e3FXB1AyeTpudRS
	KZhmvu1Y5tPrQT/4SzabYEOkGS4+jPky0KXo3FHof9h7rPxIUv5alKeueGrjghjh8QO8
	cLGhw8sEThTPMk32mx1G2/gmr3fvxHuRFwleyfD8MCWxCWrNrv3Gh9hxa05guHqRoGXj
	DiZQ==
X-Gm-Message-State: APf1xPB1Vekorf32bNp6rPn1vrQGy0kmn6xnXbJ2us2M2Lt/zgDHmBEv
	ClLpt5qnik/UBAqTB8wxpt4BNMz6HSas032Iwn82Ag==
X-Received: by 10.202.68.213 with SMTP id r204mr9508352oia.80.1519741287204;
	Tue, 27 Feb 2018 06:21:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 06:21:06 -0800 (PST)
In-Reply-To: <20180217182323.25885-53-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 14:21:06 +0000
Message-ID: <CAFEAcA_ocCQF9Ha45kKiBAQLAHr4jOYGcdArqDgYGDLfQL87Vg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2 52/67] target/arm: Implement SVE store
 vector/predicate register
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
X-TUID: k6wPog96PdT5

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 101 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |   6 +++
>  2 files changed, 107 insertions(+)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index b000a2482e..9c724980a0 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -3501,6 +3501,95 @@ static void do_ldr(DisasContext *s, uint32_t vofs, uint32_t len,
>      tcg_temp_free_i64(t0);
>  }
>
> +/* Similarly for stores.  */
> +static void do_str(DisasContext *s, uint32_t vofs, uint32_t len,
> +                   int rn, int imm)
> +{
> +    uint32_t len_align = QEMU_ALIGN_DOWN(len, 8);
> +    uint32_t len_remain = len % 8;
> +    uint32_t nparts = len / 8 + ctpop8(len_remain);
> +    int midx = get_mem_index(s);
> +    TCGv_i64 addr, t0;
> +
> +    addr = tcg_temp_new_i64();
> +    t0 = tcg_temp_new_i64();
> +
> +    /* Note that unpredicated load/store of vector/predicate registers
> +     * are defined as a stream of bytes, which equates to little-endian
> +     * operations on larger quantities.  There is no nice way to force
> +     * a little-endian load for aarch64_be-linux-user out of line.

"store" in this case, I assume.

> +     *
> +     * Attempt to keep code expansion to a minimum by limiting the
> +     * amount of unrolling done.
> +     */
> +    if (nparts <= 4) {
> +        int i;
> +
> +        for (i = 0; i < len_align; i += 8) {
> +            tcg_gen_ld_i64(t0, cpu_env, vofs + i);
> +            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
> +            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
> +        }
> +    } else {
> +        TCGLabel *loop = gen_new_label();
> +        TCGv_ptr i = TCGV_NAT_TO_PTR(glue(tcg_const_local_, ptr)(0));
> +        TCGv_ptr src;
> +
> +        gen_set_label(loop);
> +
> +        src = tcg_temp_new_ptr();
> +        tcg_gen_add_ptr(src, cpu_env, i);
> +        tcg_gen_ld_i64(t0, src, vofs);
> +
> +        /* Minimize the number of local temps that must be re-read from
> +         * the stack each iteration.  Instead, re-compute values other
> +         * than the loop counter.
> +         */
> +        tcg_gen_addi_ptr(src, i, imm);
> +#if UINTPTR_MAX == UINT32_MAX
> +        tcg_gen_extu_i32_i64(addr, TCGV_PTR_TO_NAT(src));
> +        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
> +#else
> +        tcg_gen_add_i64(addr, TCGV_PTR_TO_NAT(src), cpu_reg_sp(s, rn));
> +#endif

We should be able to avoid the ifdef with more support for tcg_*_ptr
ops (similar to an earlier patch in the series).

> +        tcg_temp_free_ptr(src);
> +
> +        tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
> +
> +        tcg_gen_addi_ptr(i, i, 8);
> +
> +        glue(tcg_gen_brcondi_, ptr)(TCG_COND_LTU, TCGV_PTR_TO_NAT(i),
> +                                   len_align, loop);
> +        tcg_temp_free_ptr(i);
> +    }
> +
> +    /* Predicate register stores can be any multiple of 2.  */
> +    if (len_remain) {
> +        tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
> +        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
> +
> +        switch (len_remain) {
> +        case 2:
> +        case 4:
> +        case 8:
> +            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
> +            break;
> +
> +        case 6:
> +            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUL);
> +            tcg_gen_addi_i64(addr, addr, 4);
> +            tcg_gen_shri_i64(addr, addr, 32);
> +            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUW);
> +            break;
> +
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +    tcg_temp_free_i64(addr);
> +    tcg_temp_free_i64(t0);
> +}
> +
>  #undef ptr

thanks
-- PMM
