Received: by 10.28.4.212 with SMTP id 203csp1956114wme;
        Thu, 3 May 2018 07:15:03 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoj2CtON2gAGSUlrVRqEIId76bKOlHXB6j5IrKNvenltwFZ52kHxyStjzMqFkUoVqOd4IKt
X-Received: by 10.55.17.153 with SMTP id 25mr18114695qkr.409.1525356902972;
        Thu, 03 May 2018 07:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525356902; cv=none;
        d=google.com; s=arc-20160816;
        b=ECU0Lp2NNhG4IaUC05VhGkK1QNRWPWwysWijZOew+t2R7SF65sj6m/HRKgbZvdBqTY
         SasiEwk9ttCO3PcMXf+7iUNqAN9iXRGaCIsUuZ7EuP7rcTS9ca4+LhmwiU3Ri2f1EecG
         wcCDhWL4dxdxxnD7+WzyRyanzyt3PznaQ5s1cMPFv+h0gO+vbUV1Bc1borUQ9g6N7Y26
         RhLaBmuBsIjVqK/hXWFph+T4SNZ6d0vX38FtKOJzHzXRpQHWnVVofgVbSCxQJEK4iGtZ
         Tptl52Yo5/o4HU25SHZBNWGHlasxw6RlkF3JTiEv4Ax1bnmQ9TYzPa8qGD3r7qTA8/gJ
         GZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2dxKvK5a385isVff1AGNPHXu0WW8hOpJhn9WrCooiEo=;
        b=FPFGemjpYryChXOjTi0NPVnG8LdWminKF4vr5V+5lrHDg9gE0NshiwrFx2KdNg2sAh
         rmG+V0kAl384ItvlbpteXkQ1xbkVaUTeS+FYxJi8g0Zp7exvCBAUPokm8euiQsSUXsbi
         vs63n0zhKViZpDq4ijCDcFIo+qASPWCmUGKfriuKVwKIeaGiss9QJGocf12o400DbC3x
         aU//hObvUyTY8imUAug3sqhajL6vcea+ZdG/prMxjlOwRgBGfNcemEuncP3Poxyprvf+
         FxbeWKulqn0zi4Iu0N8QWe2hEE+sdvbVODTqcV9QRBNr9eeeHfMxMHkvZEPN4pZh5GWu
         CIGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i4KVIn95;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2-v6si418972qth.378.2018.05.03.07.15.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 07:15:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i4KVIn95;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEF0g-0007pr-Hh
	for alex.bennee@linaro.org; Thu, 03 May 2018 10:15:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEF0P-0007lM-Qk
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:14:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEF0O-0005zC-Nw
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:14:45 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:38840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEF0O-0005yt-Ib
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:14:44 -0400
Received: by mail-ot0-x243.google.com with SMTP id j27-v6so20774372ota.5
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2dxKvK5a385isVff1AGNPHXu0WW8hOpJhn9WrCooiEo=;
	b=i4KVIn95s32zGMBwa969/TRMiIW+qrVfL2c3u6b1t/8riOXTEbZNALoE52RC1LzcGg
	cYf6bo4TRUEB6+MbU/ZqhkizPuGNtj10dfNyh8u0QpXwtQCeyF5ZKjhFUGymiflH+Z64
	Ia8ESBYog7OAwz9O8BCrLrP+EZWsXFVYO65mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2dxKvK5a385isVff1AGNPHXu0WW8hOpJhn9WrCooiEo=;
	b=YNAzDpL6C2ej78N8Hw4bSAGmdiHojJvbnsx2MbAICQbzF3++hNOT1A5bRuxIHEbuJM
	u7uQ0hmgZAAi4eMWU32Gm2MQcplx468xnhKyPMvNNdoOAc+HJmBve/E0nnTXQDUvhsoA
	fPxd0jOlvblP6xQU1PvXS5tvIWJU/QJhGxGAmSy4p3QE+SfXLdfBsUJxYLITM7Kr5DxL
	xglODA0yIEinNPrYZGkqXXX0tMHUTq+9GSi1mJPPq/+LhXWUgljR/JtBcXzpJThIMqWo
	4CpPdm+9IDHDBjawm/2cSyjJPEGfwc5QAk5wT1WxpaqxSsCwRf2+/+eTAo3dVm/Qnfm2
	y+og==
X-Gm-Message-State: ALQs6tCl+vWBzBZ8UX6MWQWRO8sKKHlxzZggwm+FNflhvcZX+MbPFJpM
	PRLUb3jVXZkNG/BA5zR0BiJUBQXTVT3kwaWqX/+Tiw==
X-Received: by 2002:a9d:16d0:: with SMTP id
	s16-v6mr17494227ots.294.1525356883677; 
	Thu, 03 May 2018 07:14:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 07:14:23 -0700 (PDT)
In-Reply-To: <20180427002651.28356-8-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 15:14:23 +0100
Message-ID: <CAFEAcA9iEoMonBRZ8d1005q71bU6CyKEjorHb2towDNUYvmBaQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH 7/9] target/arm: Fill in disas_ldst_atomic
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
X-TUID: vRrqo7aRjntT

On 27 April 2018 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
> This implements all of the v8.1-Atomics instructions except
> for compare-and-swap, which is decoded elsewhere.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 0706c8c394..6ed7627d79 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -84,6 +84,7 @@ typedef void NeonGenOneOpFn(TCGv_i64, TCGv_i64);
>  typedef void CryptoTwoOpFn(TCGv_ptr, TCGv_ptr);
>  typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
>  typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
> +typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, TCGMemOp);
>
>  /* Note that the gvec expanders operate on offsets + sizes.  */
>  typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
> @@ -2772,6 +2773,8 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
>      int rn = extract32(insn, 5, 5);
>      int o3_opc = extract32(insn, 12, 4);
>      int feature = ARM_FEATURE_V8_ATOMICS;
> +    TCGv_i64 tcg_rn, tcg_rs;
> +    AtomicThreeOpFn *fn;
>
>      if (is_vector) {
>          unallocated_encoding(s);
> @@ -2779,14 +2782,32 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
>      }
>      switch (o3_opc) {
>      case 000: /* LDADD */
> +        fn = tcg_gen_atomic_fetch_add_i64;
> +        break;
>      case 001: /* LDCLR */
> +        fn = tcg_gen_atomic_fetch_and_i64;
> +        break;
>      case 002: /* LDEOR */
> +        fn = tcg_gen_atomic_fetch_xor_i64;
> +        break;
>      case 003: /* LDSET */
> +        fn = tcg_gen_atomic_fetch_or_i64;
> +        break;
>      case 004: /* LDSMAX */
> +        fn = tcg_gen_atomic_fetch_smax_i64;
> +        break;
>      case 005: /* LDSMIN */
> +        fn = tcg_gen_atomic_fetch_smin_i64;
> +        break;
>      case 006: /* LDUMAX */
> +        fn = tcg_gen_atomic_fetch_umax_i64;
> +        break;
>      case 007: /* LDUMIN */
> +        fn = tcg_gen_atomic_fetch_umin_i64;
> +        break;
>      case 010: /* SWP */
> +        fn = tcg_gen_atomic_xchg_i64;
> +        break;
>      default:
>          unallocated_encoding(s);
>          return;
> @@ -2796,8 +2817,21 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
>          return;
>      }
>
> -    (void)rs;
> -    (void)rn;
> +    if (rn == 31) {
> +        gen_check_sp_alignment(s);
> +    }
> +    tcg_rn = cpu_reg_sp(s, rn);
> +    tcg_rs = read_cpu_reg(s, rs, false);
> +
> +    if (o3_opc == 1) { /* LDCLR */
> +        tcg_gen_not_i64(tcg_rs, tcg_rs);
> +    }
> +
> +    /* The tcg atomic primitives are all full barriers.  Therefore we
> +     * can ignore the Acquire and Release bits of this instruction.
> +     */
> +    fn(cpu_reg(s, rt), tcg_rn, tcg_rs, get_mem_index(s),
> +       s->be_data | size | MO_ALIGN);

Does this definitely do the arithmetic operation at the datatype
size and not the _i64 size ? (It makes a difference for example
with LDEORB if Rs has high bits set: the result should always
have [31:8] zero.)

Still missing LDAPR*, but otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

>  }
>
>  /* Load/store register (all forms) */
> --
> 2.14.3

thanks
-- PMM
