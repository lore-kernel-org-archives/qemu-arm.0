Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp588804wrt;
        Tue, 20 Nov 2018 05:54:40 -0800 (PST)
X-Google-Smtp-Source: AJdET5dHh9KunM2qoiOtTR0I9ZMjaKwkhyJDRTBkA5k4vZyaoz2trTMnYYZHR6Ye/1Z1J3DgD46I
X-Received: by 2002:a81:b718:: with SMTP id v24mr1940339ywh.126.1542722080718;
        Tue, 20 Nov 2018 05:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542722080; cv=none;
        d=google.com; s=arc-20160816;
        b=ChsbC4f9+n/thj54LX6THcz2ibLiCjr02obP0TcliALp9sEeAF/RWGlCR0+xPhcN2O
         UA8ogDtFCQu0rKU5foYoGnqGWcPbLFYyBADjbeWX89IhSw9X97cq4xFb8qTf/9vZQ8oW
         WK6Pv82MPYDFjTy+c5MKsS1n/g1p4bYyUA51P/svx4kthrcXwRkWuPUCK6HZKt3wdxy6
         Znt/UVHnI68573vnzGXwgoJI4RMGO2qsBV+qBp3DiAPcAJG5qBUTONJHdTKinbvdl7yJ
         UrSANgg2/adp6CCB6zsuA6KNsiDLmFETxIF2ELiDH5A3ZiSyGZeCOgfiuO2SNWXtE8B6
         FW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=1JCSbH9/jiDI/L3Pywyz2myvTO6pI5romaIiXNuWYT8=;
        b=hoGJWZddjFbvl+ivEWTCC4NOvJfTVcPwUkCUulCdh8jgUoAu86m0sMUX9SZ4PYny7Y
         vnl0eyCoR46yJ5VYPZQOCnvjhHxYMkaSm12S5mob4oyTZVYUF3cAJMU42Uq5/wG4wRwM
         TYvFIug66blXAfRomGPIf+lF4tWEhT72dR70xIloahEn4VKbKQxhwcFVK+GFwmIMKC/+
         2ZMr50X3rpWE/ZvrVebb0I/vcE2J/HlUBxW0x6Qq/pj9vR9NEt70b4Kpmb/XWep2/Njr
         ng1QKw6EcietoiFgnEYw0CUh4lyjKlpiLxoMoXQU8W60YZCO4aU/jjdHg2puyzlWQGDy
         56jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=isJbe2i7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4-v6si25597809ywa.271.2018.11.20.05.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 05:54:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=isJbe2i7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP6UC-0006zt-2s
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 08:54:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6U2-0006zD-Rp
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 08:54:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6U1-0007TW-T8
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 08:54:30 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP6U1-0007SB-Np
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 08:54:29 -0500
Received: by mail-ot1-x341.google.com with SMTP id 81so1717156otj.2
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 05:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1JCSbH9/jiDI/L3Pywyz2myvTO6pI5romaIiXNuWYT8=;
	b=isJbe2i7DrFXsP8TKuaCLD/jv7iyWCKPvagBdATQZ/15HtHORjNyCoz9qeUH/rntND
	y8iiVUFuGpKqZ3Yu7dkU0ELVshuBext3EHbSWjnEIRVjLBQQq5FDxkjlIraOc0HD8jlE
	WB2UW1qmJyQmPi+mzWo/8b7HGAouQ76hzW4hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1JCSbH9/jiDI/L3Pywyz2myvTO6pI5romaIiXNuWYT8=;
	b=p5iNP9zYJe5X9jUiQrvTufN7WO6gSBXQlXmexs4iJ6xQGIp8VzHKbM5n07S89WQjW+
	YVx/xEpCFkSm0Mv2oRpykb8OKZ85NbTC4DvMqv9BPEaPtA5yya8b3ooGbuAE0mThPu7K
	b6k2j4QoHJPvyYRGK2FNaFQZfEicoLYs12gC7FhEeSpsCq8NTd4ABLZyPbhFyenpQLfD
	uUBQB07BTqtYFtaz0XGdGF3fJFeBFc/jc/ohNakKRYgRIkZ02ahM8Mw8AVccLbGNNqy9
	by9ZFrBjJZ4Lt3y9lbKGDz4Mu47GjUFdbOAw4FymL4HooyORJj4moy4L8ehVKHLnS+PA
	AvsA==
X-Gm-Message-State: AA+aEWZ/GXyHuEF/OcnBDL6cjF5jpf/QEABLQ3E62d/w06q+MWnaK8CK
	GZD0y9iENL5u2sedf0WekrIK3QhM41QD0Qk6TU2ezA==
X-Received: by 2002:a9d:2cd3:: with SMTP id e19mr1115635otd.363.1542722068942; 
	Tue, 20 Nov 2018 05:54:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 05:54:08
	-0800 (PST)
In-Reply-To: <20181113165247.4806-4-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-4-sameo@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 13:54:08 +0000
Message-ID: <CAFEAcA98so9yyJN=qAhD=Kr6pi1xxfrxt28atqZ8ATVJYXTaMg@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 03/13] target: arm: Move all v7m helpers into
 their own file
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a3MxbLqeHvH9

On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> In preparation for supporting TCG disablement on ARM, we move all TCG
> related v7m helpers and APIs into their own file (m_helper.c for all
> v*-m helpers).
> arm_v7m_cpu_do_interrupt pulls a large number of static functions
> out of helper.c into m_helper.c because it is TCG dependent.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> ---
>  target/arm/internals.h   |   37 +
>  target/arm/helper.c      | 2209 +++-----------------------------------
>  target/arm/m_helper.c    | 1892 ++++++++++++++++++++++++++++++++
>  target/arm/Makefile.objs |    2 +-
>  4 files changed, 2086 insertions(+), 2054 deletions(-)
>  create mode 100644 target/arm/m_helper.c

> +/* Function used to synchronize QEMU's AArch64 register set with AArch32
> + * register set.  This is necessary when switching between AArch32 and A=
Arch64
> + * execution state.
> + */
> +void aarch64_sync_32_to_64(CPUARMState *env)
>  {
> -    uint32_t new_ss_msp, new_ss_psp;
> +    int i;
> +    uint32_t mode =3D env->uncached_cpsr & CPSR_M;
>
> -    if (env->v7m.secure =3D=3D new_secstate) {
> -        return;
> +    /* We can blanket copy R[0:7] to X[0:7] */
> +    for (i =3D 0; i < 8; i++) {
> +        env->xregs[i] =3D env->regs[i];
>      }
>
> -    /* All the banked state is accessed by looking at env->v7m.secure
> -     * except for the stack pointer; rearrange the SP appropriately.
> +    /* Unless we are in FIQ mode, x8-x12 come from the user registers r8=
-r12.
> +     * Otherwise, they come from the banked user regs.
>       */
> -    new_ss_msp =3D env->v7m.other_ss_msp;
> -    new_ss_psp =3D env->v7m.other_ss_psp;
> -
> -    if (v7m_using_psp(env)) {
> -        env->v7m.other_ss_psp =3D env->regs[13];
> -        env->v7m.other_ss_msp =3D env->v7m.other_sp;
> -    } else {
> -        env->v7m.other_ss_msp =3D env->regs[13];
> -        env->v7m.other_ss_psp =3D env->v7m.other_sp;
> -    }
> -
> -    env->v7m.secure =3D new_secstate;
> -
> -    if (v7m_using_psp(env)) {
> -        env->regs[13] =3D new_ss_psp;
> -        env->v7m.other_sp =3D new_ss_msp;
> +    if (mode =3D=3D ARM_CPU_MODE_FIQ) {
> +        for (i =3D 8; i < 13; i++) {
> +            env->xregs[i] =3D env->usr_regs[i - 8];
> +        }
>      } else {
> -        env->regs[13] =3D new_ss_msp;
> -        env->v7m.other_sp =3D new_ss_psp;
> +        for (i =3D 8; i < 13; i++) {
> +            env->xregs[i] =3D env->regs[i];
> +        }
>      }
> -}
>
> -void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
> -{
> -    /* Handle v7M BXNS:
> -     *  - if the return value is a magic value, do exception return (lik=
e BX)
> -     *  - otherwise bit 0 of the return value is the target security sta=
te
> +    /* Registers x13-x23 are the various mode SP and FP registers. Regis=
ters
> +     * r13 and r14 are only copied if we are in that mode, otherwise we =
copy
> +     * from the mode banked register.
>       */
> -    uint32_t min_magic;
> -
> -    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> -        /* Covers FNC_RETURN and EXC_RETURN magic */
> -        min_magic =3D FNC_RETURN_MIN_MAGIC;
> +    if (mode =3D=3D ARM_CPU_MODE_USR || mode =3D=3D ARM_CPU_MODE_SYS) {
> +        env->xregs[13] =3D env->regs[13];
> +        env->xregs[14] =3D env->regs[14];
>      } else {
> -        /* EXC_RETURN magic only */
> -        min_magic =3D EXC_RETURN_MIN_MAGIC;
> +        env->xregs[13] =3D env->banked_r13[bank_number(ARM_CPU_MODE_USR)=
];
> +        /* HYP is an exception in that it is copied from r14 */
> +        if (mode =3D=3D ARM_CPU_MODE_HYP) {
> +            env->xregs[14] =3D env->regs[14];
> +        } else {
> +            env->xregs[14] =3D env->banked_r14[bank_number(ARM_CPU_MODE_=
USR)];
> +        }
>      }

This part of the patch is a mess to read. I suspect this is a
combination of (a) your git not being configured to use a better
diff algorithm than the default (try "algorithm =3D histogram"
in the [diff] section of your .gitconfig), and it doing an effective
revert of 593cfa2b637b92d37 by accident.

It's also an absolutely enormous patch, even for a "just
moving code" patch, which makes it hard to review even
with diff --color-moved. Maybe it would be better in two
pieces ("helper routines for various insns" and "exception
handling functions" seems like a workable split).

thanks
-- PMM
