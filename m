Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp761378wrt;
        Thu, 13 Dec 2018 04:36:14 -0800 (PST)
X-Received: by 2002:a5e:da0c:: with SMTP id x12mr4330567ioj.246.1544704574110;
        Thu, 13 Dec 2018 04:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544704574; cv=none;
        d=google.com; s=arc-20160816;
        b=RjrtC2bbDHUdYez/9EG3oqzSp85Clj1LIkBcxAIEJ+owPWus71CFqpwM59JMu4+e9h
         fdcg+YdeBaTJ5rpIQIdo1DLIwDodBYtLxhwHPsj9umJlKt2E0jSl3q/doXn8S+mGaRSV
         lrqyJdpBkkk7sIjyYertx7DisKSnd2ktx8bSigzNyz2fGZWoeew983nVTEwqfjAxsFl+
         0wIIZ4XlKfLOiajCr3AOrumj8IC3Hayeckvzi9a5Uxg/tp12b068w/v1aeEM1oQ8SuZe
         K3Vy3xRa6F2/+dEiX9ycHvNaKEYVTDUU55dmxQ3ccpAb1I7F+0aRWmTROrBMBSZ612p/
         BKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhJrvIYzzakGURzet1wpM1pTqERVcavcxSiESFbLCSU=;
        b=Ms2jtIn4/LZdzZ24y5S6GYPI7PgFz98odP7eZa+mOVhBmBg71sQoFYrF5ijiAdK+T0
         SDNSQz5IKt7G/MVSfTHbZZD8FOPHsupJhZ5LrGkrpevdSukNQ7HM8Tadmu4P/3e7G1gs
         +7NLm1Z5gXSVQ3Md+sFAJ5IM4oIDTxUwa+EBKfaapk9TXfigzvVb3hD9EiGgTFT1ds4q
         PKzGgAFqwP/aMclGURtBJJ6mL2aaFFU6fRglVBiyYAF+UsPpRu2dWxcvFwyGq1hUuGXv
         CpRfqypH9L5e8Q8nhUSTN8D6sgIY0AEpOsOORLWrUEe6c4h4XnuroYr0JsvW46UOLksC
         IYsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FR5T2lMl;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i76sor3846128itb.11.2018.12.13.04.36.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Dec 2018 04:36:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FR5T2lMl;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fhJrvIYzzakGURzet1wpM1pTqERVcavcxSiESFbLCSU=;
        b=FR5T2lMlwc2iTxmV4gFmxFKwzWXgt3RXeYYACPgIoWlkexCMsbVeyOPBf7q1UwuLyR
         0LqokX9GwotfiX6N2x/ipOaSqSEBqlQ5MkkJEep3eiNevI6Cu/tdmII+zArXpiyqnLbq
         bMiVfwDN+Vxl74tAufQH0ebEUV2/NU5tQ4pBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fhJrvIYzzakGURzet1wpM1pTqERVcavcxSiESFbLCSU=;
        b=cbbeRk4r1mJ5u95AF9k/9Hs1rMThzz3OxTmjbf0C3ATa9mMqpfOxH2jhioVr/M9IfT
         IS10cYlTE51j39rnYGHoyKss00DQGdRQgyFIa4acjJs5fjjOpx48LQy5hhsolSONzNmQ
         VO3EnS0ZQ4hzH1pk+8tj9b7C/sVMei/Ngcbxj1R6Vy9rdLfyg/5t6rig6050slN8jSBY
         94Inh8E0Mr/cVT1+acswbSK2eNl2fGv7RL7SsDOrybkJwz1WKw0wqWyRDNCHqbWgXAyR
         2KkIToge4kWYeb0hQYKK1ksf3HNW4pcjuMpAZYPJuualOaAPQGd22IAUCweBfJG3KqCI
         ibTQ==
X-Gm-Message-State: AA+aEWYwB52dFHhpvAk7XpuC45cS1jI6H1anluH0roYabOf7cgmsHpPJ
	yltFqNs+z5DBPFNoYnDIo74CGDpsVHpyciMpmWhLKRTPqwE=
X-Google-Smtp-Source: AFSGD/WvejXXsBG4BxCierua5lOQw1dTOBs8jo/IjWPJu7SDf98+QoppDW0bnqN8/6BaHjbpPdF/nLBIOvWQaPOh7sY=
X-Received: by 2002:a24:710:: with SMTP id f16mr8431451itf.121.1544704573418;
 Thu, 13 Dec 2018 04:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20181213115503.24188-1-alex.bennee@linaro.org> <20181213115503.24188-2-alex.bennee@linaro.org>
In-Reply-To: <20181213115503.24188-2-alex.bennee@linaro.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 13 Dec 2018 13:36:01 +0100
Message-ID: <CAKv+Gu_C78f-a1MdsdXHi6u_gyhRh3djbzM3_vZ3K=AtWzqXGg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/arm: kvm64 make guest debug AA32 break
 point aware
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Mark Rutland <mark.rutland@arm.com>, omair.javaid@linaro.org, 
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 54wGOcFUMGjF

Hi Alex,

Thanks again for looking into this.

On Thu, 13 Dec 2018 at 12:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When supported by the hardware we can run AA32 guests or even AA64 EL1
> code with AA32 EL0 mode code. Inserting a AA64 break point into AA32
> code tends to break things. This is especially acute with gdb as it
> inserts temporary breakpoints when stepping through code.
>
> The heuristic of checking the current mode works but it's not perfect.
> A user could be placing a break point in code after a mode switch and
> that will still fail. However there doesn't seem to be a way to force
> a hbreak by default. According to "set breakpoint auto-hw on":
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

We'll need to cheat here, and use an opcode that is a BKPT instruction
in both ARM and Thumb modes, i.e., 0xe120be70 (where the lower 16 bits
constitute a T1 bkpt opcode with imm=3D0x70)

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

Should we be dealing with endianness here?

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
