Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1786705wrt;
        Fri, 14 Dec 2018 00:38:18 -0800 (PST)
X-Received: by 2002:ac8:839:: with SMTP id u54mr1819649qth.313.1544776698210;
        Fri, 14 Dec 2018 00:38:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544776698; cv=none;
        d=google.com; s=arc-20160816;
        b=v3glKX0MqqwFGu0eckhyynvfsdS/KrW+vWNRF8IugvfzC4DF0vE+6lC8WEpn6MMRgc
         S+0z6Jz4ar6DV8/uePbGoStDA2rTXuePj+G97C+oXxykEgReXRGr2VYIKCskESsgbJAU
         X6hS7rNYjFEu0YNNIP5K3WC132hDZCPTpFgcS4AB1TWoCMcQsumWd2r1HHA5WqsgzBJ/
         WfxAUp9bbpYqdnVlffTD7x8ze646ouIkmgOy8Nkt32AFwdL7th07mfeW3O++Mrxrq3jL
         jUIjxe2ogMHtzFpy3jGjD0SRrwgVM5DjK+cK2ClBKvR2/JCgitU23puNhgviiqRNW68o
         wMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBDWlxEM4yb82ps77Mp79E5EWOKIqH1F2/vQIxi/QnY=;
        b=WxQULo73aZa99Nb9AHg8iwzjyT5k7v6Xoa4mIpoPFGB767MwLbi9vLnODLbXKncwSS
         w4CT+rA6sBntswS1MBpru0HDT2cPg+hZS5DxGlkWCeN6GRXvuKu/tHdEJ6pl8i/iK3xz
         wd4lZHlzlsTli5PHAfS502nzGfuBxCsj+A/Uvqb61DD0RRhXWN7hVJB1l2Hfb8f+Y+9I
         zAKwqQyebN61D5SKc1Z8szMAF4fO8nLC1Vyypo8lImTjmg1pbk478WahC7jBZHK5VGCA
         LYvG3nsHWKUMBFUoBNXR8OEjakThe0F+vzPrNOujahKAUMT1BW/1wpLpoZbsk50ImcAZ
         LLHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fLjF8PNV;
       spf=pass (google.com: domain of omair.javaid@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=omair.javaid@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <omair.javaid@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k184sor2573432qke.141.2018.12.14.00.38.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Dec 2018 00:38:18 -0800 (PST)
Received-SPF: pass (google.com: domain of omair.javaid@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fLjF8PNV;
       spf=pass (google.com: domain of omair.javaid@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=omair.javaid@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hBDWlxEM4yb82ps77Mp79E5EWOKIqH1F2/vQIxi/QnY=;
        b=fLjF8PNVQdEkCo9Cd4wHBYsy2YkEwbyZLIXi/FfotUGzIMVpuEGF66fYIxkXKqCCDK
         KJqsuahX5A5lqKwqiny3t3M0NjlPo5IeC8gOfwDrDJKpGwNn1iiSIXoQxzz5vVLQNIOh
         i4UNMQXSdODPsiPFPe+X1erIP/jFujMhS9Kao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hBDWlxEM4yb82ps77Mp79E5EWOKIqH1F2/vQIxi/QnY=;
        b=XXGzQMv85xijm4gZRO8TacFej+8IxGe1/fxql/xwSqXJBm/6E+IMPP561hGZ89krt5
         ITl9wmh7moM93TFDN1sFzqmNNwWz9leBiTddU9V5gy4zYlCG3Df7s+8E8M3QNAGzZciM
         ddkFvuvwpQhOtf76S04C6/yMPVFZ/vXbVsUx50xGbvUAYT0iSr+NqxlRBcXkpDgaLNZT
         Ng9/madSyAExnOhCGBdOVaci7/NHLUPVPffYrRO+x2zR+DFuFf2WYPzP9PJt7zljdCHj
         mw3cgzfLSjhB4u0utJrd0laZPRSk9cuhCosIPmXbaLeU37/qKKJhPCbrxhOxeIv63dj1
         zfHQ==
X-Gm-Message-State: AA+aEWZAu6/5sS/ozlRGyAFsa8Ewfp34Rm01Uq6hryWy61jAqVWGxuE3
	fhVznLWAIyoNmbqPNsAkc3bBhKxCn/T7JJStSZbphWNvq1N4DA==
X-Google-Smtp-Source: AFSGD/XasrWexB06BfnpampyEqLJtCCA4YTFrUXxAeMwCPdAPmTLwkug0D0e0t4qnN5kyIN9g4b55Bm98WmHwHCBP7o=
X-Received: by 2002:a37:455:: with SMTP id 82mr1785460qke.60.1544776697660;
 Fri, 14 Dec 2018 00:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20181213115503.24188-1-alex.bennee@linaro.org> <20181213115503.24188-2-alex.bennee@linaro.org>
In-Reply-To: <20181213115503.24188-2-alex.bennee@linaro.org>
From: Omair Javaid <omair.javaid@linaro.org>
Date: Fri, 14 Dec 2018 13:37:51 +0500
Message-ID: <CANW4E-1UmZOGHya4jHxj10O2Ki7MPGMqme7wT0jaCO8Ufrii6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/arm: kvm64 make guest debug AA32 break
 point aware
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mark.rutland@arm.com, 
	ard.biesheuvel@linaro.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 0j2yUIHNTGaS

On Thu, 13 Dec 2018 at 16:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When supported by the hardware we can run AA32 guests or even AA64 EL1
> code with AA32 EL0 mode code. Inserting a AA64 break point into AA32
> code tends to break things. This is especially acute with gdb as it
> inserts temporary breakpoints when stepping through code.

Hi Alex,

Are you expecting GDB to switch targets (from AArch64 to AArch32 or
vice versa) when there is mode switch for example a AArch64 binary
calling a AArch32 library function.
I think GDB will behave nicely when doing 1 type of debug but seamless
switching between modes is still tricky for GDB. There has been some
work in last few months on this but not sure where it has reached.

>
> The heuristic of checking the current mode works but it's not perfect.
> A user could be placing a break point in code after a mode switch and
> that will still fail. However there doesn't seem to be a way to force
> a hbreak by default. According to "set breakpoint auto-hw on":

On mode switch we ll have to switch target architecture on GDB side
and GDB may not be able to do that seamlessly. Have you tried
debugging such an example?

>
>   This is the default behavior. When GDB sets a breakpoint, it will try
>   to use the target memory map to decide if software or hardware
>   breakpoint must be used.
>
> Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Omair Javaid <omair.javaid@linaro.org>
> ---
>  target/arm/kvm64.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 0a502091e7..dd564a59b7 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -989,14 +989,20 @@ int kvm_arch_get_registers(CPUState *cs)
>      return ret;
>  }
>
> -/* C6.6.29 BRK instruction */
> +/* BRK (A64) and BKPT (A32) instructions */
>  static const uint32_t brk_insn =3D 0xd4200000;
> +static const uint32_t bkpt_insn =3D 0xe1200070;
>
>  int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint=
 *bp)
>  {
> +    CPUARMState *env =3D &ARM_CPU(cs)->env;
> +    int el =3D arm_current_el(env);
> +    bool is_aa64 =3D arm_el_is_aa64(env, el);
> +    const uint32_t *bpi =3D is_aa64 ? &brk_insn : &bkpt_insn;
> +
>      if (have_guest_debug) {
>          if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, =
4, 0) ||
> -            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1))=
 {
> +            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)bpi, 4, 1)) {
>              return -EINVAL;
>          }
>          return 0;
> @@ -1012,7 +1018,7 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, str=
uct kvm_sw_breakpoint *bp)
>
>      if (have_guest_debug) {
>          if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
> -            brk !=3D brk_insn ||
> +            !(brk =3D=3D brk_insn || brk =3D=3D bkpt_insn) ||
>              cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, =
4, 1)) {
>              return -EINVAL;
>          }
> @@ -1055,6 +1061,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_=
debug_exit_arch *debug_exit)
>              return false;
>          }
>          break;
> +    case EC_AA32_BKPT:
>      case EC_AA64_BKPT:
>          if (kvm_find_sw_breakpoint(cs, env->pc)) {
>              return true;
> --
> 2.17.1
>
