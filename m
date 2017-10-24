Received: by 10.223.161.27 with SMTP id o27csp736479wro;
        Tue, 24 Oct 2017 08:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QSu0snmjY/ChyK3uR920/JaEEMi41MKB43VEqIFp+nLZ4WRebisAfE8Z6Rcve1GeAmbRcD
X-Received: by 10.129.47.10 with SMTP id v10mr11031041ywv.332.1508860444395;
        Tue, 24 Oct 2017 08:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508860444; cv=none;
        d=google.com; s=arc-20160816;
        b=X1sTppbPC6V35bmrrtyXPeq40rBrau7NJcz9mKM4ltRrg4hYJR3tcRlG3/tuWrHneE
         FYQclDZDmGjc/VZR0leDl9jvqfFQ8UxmqSlnoeMikJ/cfxUp9gcrd8mXhmSL1Gzv1iZo
         ad4jFvxz6dW2k4PGM6TI1YttMTd5BmWCMUdoIcvYUvn0WETNhglV3XGg33L8Hgqf/pqJ
         suwlLo1hOb+z95W+evugUX6hTetDpmU1tD7II+j1aWOnNTjI6UgRy0DcqcIZwYZCRjye
         rwp34n5TYKdbH7SrPj478zffPKseSr2NGpBPuM6c059jP4TOSlGKmMC4iLQDJrrUsTEe
         RsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=p5WezB8fIuvIHKiQ8LDpB3oUL510QywD1ef5zbm064w=;
        b=Bwn0PLkEhjJmgA0yWY8bH5ny441f87ZpJsDMECGgxoJ4uRq6tJTvVlpsn3o9iELi7P
         jG5Ws6yCXtbsfIvYMFPIujY561HhjtY+E6STRj3gS2mXesvTcLOP8Y+CKgefuAvbNPEV
         H+0eWGVacm0YC1Y68N9PjYFL/jA0IuXXlkSrwmZWFVmls7oCF0BOMuEuGtbHt/C9ijC7
         z88+8FxU8l+F8dJmKbjA8pChigzdA7dnJJi5SBgh0VhYjKwK+Iwa6dz6xtY18Kcmznzo
         +lATD9ujMKSPaodswfcvESbnF859RitOgRcnVy/2AW1GgpDc5f0+FDkbs0lF6k0NHWSo
         GE3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JF+bI0bL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9si88736ybb.276.2017.10.24.08.54.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 08:54:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JF+bI0bL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e71Wl-00020V-S0
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 11:54:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e71Wa-000204-6K
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 11:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e71WZ-0002ju-F1
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 11:53:52 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:51889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e71WZ-0002jR-7s
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 11:53:51 -0400
Received: by mail-wr0-x236.google.com with SMTP id j15so9029889wre.8
	for <qemu-arm@nongnu.org>; Tue, 24 Oct 2017 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p5WezB8fIuvIHKiQ8LDpB3oUL510QywD1ef5zbm064w=;
	b=JF+bI0bL7Cfvybh9E5tuHpMBxxH1vqFGPj47sXuG5k1VrORTl5ZS7fp2s73cnJPy2g
	DrQ6DISEontAKNh9d1TElcmtSxIb6796MntJrApqI4Tl2klzBmWuG4ZpZbi79fXHOIaj
	urCVYJpggbW/XPsJ8LUAG9iQgyUHswE1YyeV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p5WezB8fIuvIHKiQ8LDpB3oUL510QywD1ef5zbm064w=;
	b=kxWYgfpPmc/K89wLsZ9AZE+S2hW0BoEQGxRlP3n68hE0594Mp5x4VXKu7oMTIbdOro
	LJduRDNWcgNqaOHiXm0SxFu8tTn169WoDt/u2spkfAGyQPwjGzR5XfHrAYxQCJWeIo/P
	4IYi0wxp4t2uMviXsYnf3yZN+sn4NJoWopMD4j0geLdJHuDrnE2/xN3kCKnh1Uob0iaR
	cCmmKJuE7R0K5ARnT5zAHmVj+6DrGvIbUnwYpy4++ZrVLsiDvOOyTMmiDOs4NJSDhaO6
	O0jtjouZpUaqRYdryyxNz1br+SmT3qNOTj+UQ7iHmTe0O6AqSdDLyeYiGqLhH3gmo7lr
	hDQw==
X-Gm-Message-State: AMCzsaWRIjGVaxziV9mh6KM7rG+yQrDdB/GuQ+0KMGcOFdnFFCwT9WCO
	yC5pFRQ1Hie93UXA5FK1MsuGfD/l3gpPRsACVgwCuA==
X-Received: by 10.223.169.80 with SMTP id u74mr10899519wrc.178.1508860430055; 
	Tue, 24 Oct 2017 08:53:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 24 Oct 2017 08:53:29 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710211105550.27209@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710211105550.27209@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Oct 2017 16:53:29 +0100
Message-ID: <CAFEAcA_-b5kb=_jDeDbCGugmzvcuUGKvWV0myThVJuTDbg9jNA@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-arm] [PATCH v2] fix WFI/WFE length in syndrome register
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
X-TUID: 44IFgc6tCc4U

On 21 October 2017 at 19:09, Stefano Stabellini <sstabellini@kernel.org> wrote:
> WFI/E are often, but not always, 4 bytes long. When they are, we need to
> set ARM_EL_IL_SHIFT in the syndrome register.
>
> Pass the instruction length to HELPER(wfi), use it to decrement pc
> appropriately and to pass an is_16bit flag to syn_wfx, which sets
> ARM_EL_IL_SHIFT if needed.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index a39b9d3..6f74589 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11380,17 +11380,20 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>              gen_helper_yield(cpu_env);
>              break;
>          case DISAS_WFI:
> +        {
> +            TCGv_i32 tmp = tcg_const_i32((dc->insn & (1U << 31)) ? 4 : 2);

This is the A64 translator, we know that WFI (like every instruction)
is 32 bit.

>              /* This is a special case because we don't want to just halt the CPU
>               * if trying to debug across a WFI.
>               */
>              gen_a64_set_pc_im(dc->pc);
> -            gen_helper_wfi(cpu_env);
> +            gen_helper_wfi(cpu_env, tmp);

As Philippe says, you need to free the TCG temp here.

>              /* The helper doesn't necessarily throw an exception, but we
>               * must go back to the main loop to check for interrupts anyway.
>               */
>              tcg_gen_exit_tb(0);
>              break;
>          }
> +        }
>      }
>
>      /* Functions above can change dc->pc, so re-align db->pc_next */
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4da1a4c..a89518f 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -12325,12 +12325,15 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>              /* nothing more to generate */
>              break;
>          case DISAS_WFI:
> -            gen_helper_wfi(cpu_env);
> +        {
> +            TCGv_i32 tmp = tcg_const_i32((dc->insn & (1U << 31)) ? 4 : 2);

This won't work, because dc->insn is only populated by the translate-a64.c
A64 translator, not by the A32/T32 code. I guess 'principle of least
surprise' suggests we should populate it for Thumb and ARM too.

> +            gen_helper_wfi(cpu_env, tmp);
>              /* The helper doesn't necessarily throw an exception, but we
>               * must go back to the main loop to check for interrupts anyway.
>               */
>              tcg_gen_exit_tb(0);
>              break;
> +        }
>          case DISAS_WFE:
>              gen_helper_wfe(cpu_env);
>              break;

thanks
-- PMM
