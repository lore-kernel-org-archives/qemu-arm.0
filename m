Received: by 10.25.208.137 with SMTP id h131csp239635lfg;
        Wed, 4 May 2016 08:48:27 -0700 (PDT)
X-Received: by 10.194.23.226 with SMTP id p2mr9204599wjf.131.1462376907243;
        Wed, 04 May 2016 08:48:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id kq8si5696969wjc.2.2016.05.04.08.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 08:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axz22-0003g9-50
	for alex.bennee@linaro.org; Wed, 04 May 2016 11:48:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axz1u-0003T4-E2
	for qemu-arm@nongnu.org; Wed, 04 May 2016 11:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axz1i-0000GT-Mk
	for qemu-arm@nongnu.org; Wed, 04 May 2016 11:47:56 -0400
Received: from mail-yw0-x233.google.com ([2607:f8b0:4002:c05::233]:34536)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axz1h-00008v-G6
	for qemu-arm@nongnu.org; Wed, 04 May 2016 11:47:50 -0400
Received: by mail-yw0-x233.google.com with SMTP id j74so88442303ywg.1
	for <qemu-arm@nongnu.org>; Wed, 04 May 2016 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pJLIaWSjmtVGngHFxfOd144/VYzo4xdawRSK0PUchX8=;
	b=hLpvhO+G/u6IXIISwCBTnlicGyBjiv8zt5iYGp6+B/GaKtJTuSXHVrqh76UhtNmIC+
	q6bNkiH4qSmww5Tanr0Sw+TZLmJBkmy9IWPuh1gux3wADEbdjPiCqKpJQMtJx5uXw9VA
	SuV/LmKNLN6uYCX/nIj2WW8ye0CIPfDVfKvD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pJLIaWSjmtVGngHFxfOd144/VYzo4xdawRSK0PUchX8=;
	b=d/zZUdB3Lk9vrFn9t9OJANvmK6ZoAOfc49yGjYfRA9Q4KIPcN+wnY7L+hP9WH+niQx
	Rb8cDDRsXgjgW8JnCIcdzlooGMwKcRIgqT8qWcYthbOiponPLeqT0zTTWuLj29WXB3LJ
	dwaA4xiWCUzmUDUj4R8OLmmmOl61e3ZiT6DDhqRj49kGNsLdFoEyWs2UlSdTWzBQEJte
	YUi9XS22AVR9Q6M82AMozvLydiqhHWMjPx3TUQ71T8Q+yGI4qnhAsrlJTszN2f1bxgKY
	MYwY9Lq1CqK1KKhnU7Dkydm8MJZJ4EAJ6gTs3rtQrsEYQjLqd+LXuHJN9hr1dd6S1IyW
	1jhw==
X-Gm-Message-State: AOPr4FUVgLU1MewjeRTr9gNtCpXSvCGYDL5+MEm0P/hNfIoCmPc4g2mD/Z8tnOlbRh/kN0n4nn4PauUTAJ3uWVDq
X-Received: by 10.159.35.12 with SMTP id 12mr5778825uae.119.1462376847232;
	Wed, 04 May 2016 08:47:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 08:47:07 -0700 (PDT)
In-Reply-To: <1461089238-18314-2-git-send-email-afarallax@yandex.ru>
References: <1461089238-18314-1-git-send-email-afarallax@yandex.ru>
	<1461089238-18314-2-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 16:47:07 +0100
Message-ID: <CAFEAcA-hAsCS2231ya+Ode7MKs26R-bRJzT3eAKMxo8-wzM8gg@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::233
Subject: Re: [Qemu-arm] [PATCH 1/2] target-arm: Unify AArch32 exception
 return generating functions
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
X-TUID: 7h9sl2hfg+ui

On 19 April 2016 at 19:07, Sergey Sorokin <afarallax@yandex.ru> wrote:
> There is a duplicating code in AArch32 exception return implementation.
> The patch rearranges the code to avoid this.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  target-arm/translate.c | 36 +++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 940ec8d..68671b7 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -4349,24 +4349,27 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
>      s->is_jmp = DISAS_UPDATE;
>  }
>
> -/* Generate an old-style exception return. Marks pc as dead. */
> -static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
> +/* Generate an exception return. Marks both values as dead. */
> +static void gen_exception_return_internal(DisasContext *s, TCGv_i32 pc,
> +                                          TCGv_i32 cpsr)
>  {
> -    TCGv_i32 tmp;
> +    gen_helper_cpsr_write_eret(cpu_env, cpsr);
> +    tcg_temp_free_i32(cpsr);
>      store_reg(s, 15, pc);
> -    tmp = load_cpu_field(spsr);
> -    gen_helper_cpsr_write_eret(cpu_env, tmp);
> -    tcg_temp_free_i32(tmp);
>      s->is_jmp = DISAS_JUMP;
>  }
>
> +/* Generate an old-style exception return. Marks pc as dead. */
> +static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
> +{
> +    TCGv_i32 tmp = load_cpu_field(spsr);
> +    gen_exception_return_internal(s, pc, tmp);
> +}
> +
>  /* Generate a v6 exception return.  Marks both values as dead.  */
>  static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
>  {
> -    gen_helper_cpsr_write_eret(cpu_env, cpsr);
> -    tcg_temp_free_i32(cpsr);
> -    store_reg(s, 15, pc);
> -    s->is_jmp = DISAS_JUMP;
> +    gen_exception_return_internal(s, pc, cpsr);
>  }

This rearrangement of code is OK.

>  static void gen_nop_hint(DisasContext *s, int val)
> @@ -9378,11 +9381,14 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                      store_reg(s, rn, loaded_var);
>                  }
>                  if (exc_return) {
> -                    /* Restore CPSR from SPSR.  */
> -                    tmp = load_cpu_field(spsr);
> -                    gen_helper_cpsr_write_eret(cpu_env, tmp);
> -                    tcg_temp_free_i32(tmp);
> -                    s->is_jmp = DISAS_JUMP;
> +                    /* Restore CPSR from SPSR.
> +                     * Since gen_exception_return() function updates r15
> +                     * we need just pass current r15 value into it.
> +                     */
> +                    tmp = tcg_temp_new_i32();
> +                    tcg_gen_mov_i32(tmp, cpu_R[15]);
> +                    /* It marks tmp as dead. */
> +                    gen_exception_return(s, tmp);

Won't this now emit TCG ops to load the PC from the state struct,
AND it with ~1, and then write it back again ? That seebms worse than the
current code.

>                  }
>              }
>              break;

thanks
-- PMM
