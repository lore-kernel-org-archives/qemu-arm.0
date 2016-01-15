Received: by 10.25.159.19 with SMTP id i19csp543097lfe;
        Fri, 15 Jan 2016 07:47:37 -0800 (PST)
X-Received: by 10.31.162.20 with SMTP id l20mr7492630vke.137.1452872857595;
        Fri, 15 Jan 2016 07:47:37 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com. [2607:f8b0:400c:c05::232])
        by mx.google.com with ESMTPS id y2si11394978vky.74.2016.01.15.07.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jan 2016 07:47:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) client-ip=2607:f8b0:400c:c05::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x232.google.com with SMTP id n1so145985186vkb.3
        for <alex.bennee@linaro.org>; Fri, 15 Jan 2016 07:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=sbk5CK66Ht0h20jgYc/hoGyvZWCqFAwCL2PZbWD7X2M=;
        b=LzG97enzPSZaq6mpPx+vPQwadlqdAjc7H2H5WkCqFDPFmYLE7C7tx/VpZXlrYldYEC
         3d66jD/V/+9mmG5PAMastlXEO5fHd/o1SytC0yoUS2JXFsDb1TUHPvw8kv1i+YabaC5f
         97hXfXuf29o73hU6p+Eb/hkZkD6urQks+h+AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=sbk5CK66Ht0h20jgYc/hoGyvZWCqFAwCL2PZbWD7X2M=;
        b=bYZqLyhZ1T2gqdgQVNNwPnzBIANzOR12+pZIH4qkjmaeJrzSyIhbsvZKUzSubRQj98
         Fa4ngGsERxGcd75eT66Yq/kY734107r30f18FUjrBr+eONvKdnrsCxYTh01yQZRIoHPd
         Fakg3Q7+ZT1XDzAfPlHXBRbGRi0M/nxIOtZPt2fPViDQGVQYW2knmSaTSNQNoZ23OTVw
         ylI0qKW3pGiqVAHHRu7HpWh58T0dbGGBkKCWViqhRKaApwMXwtuWdBWA1UyosGLEbQts
         tIricFqqR8wThVZd0aV5R+fSMReRAH97lJ94md+94YvrHyY2FM5C5lu1/EWdZuHgnCP5
         BDuQ==
X-Gm-Message-State: ALoCoQlmM8p/QV9ykS5GWCmTaKXc5wI///xWCLbcgPD9F3x/Bz161kb3K/GT72Rd12wVsaUE4dJ6tgTthXeLITkjRRuCrlXcW/Uo6dBoONJc6BNoOSq1+x0=
X-Received: by 10.31.194.21 with SMTP id s21mr7853255vkf.92.1452872857163;
 Fri, 15 Jan 2016 07:47:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 07:47:17 -0800 (PST)
In-Reply-To: <20160115153737.GL29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
 <20160115143836.GI29396@toto> <CAFEAcA_GkZNcXTHLN_rb1Tdi=sUSgxK07abZsOu59Ogbx-uqGQ@mail.gmail.com>
 <20160115153737.GL29396@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 15:47:17 +0000
Message-ID: <CAFEAcA-qULPxKo4dwHkW-2xBzY8t=ei3-ny7Py0iigCk6DuunQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] target-arm: Properly support EL2 and EL3 in arm_el_is_aa64()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: eKB46bEBldLW

On 15 January 2016 at 15:37, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Fri, Jan 15, 2016 at 02:50:24PM +0000, Peter Maydell wrote:
>> Do you have much locally extra that you needed for enabling
>> EL3 in the Cortex-A53? I have an ARM Trusted Firmware + OP-TEE
>> setup now that I'm going to use to work through the missing bits,
>> but if you've already gone through that effort there's no need
>> my duplicating work...
>
> I don't have anything immediate for EL3 beyond enabling it and some
> boot thing for a15/aarch32 to allow me to run my tests.

Cool. I'm not sure at what point to add the patch that turns
on the EL3 feature bit, but I guess in the not too distant future :-)

> I haven't
> really looked at the boot in detail for aa32 so I haven't bothered
> submitting it. This is it:
>
> commit b30c7102624241a67ebb2d3df70e88a4148f68a4
> Author: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Date:   Sun Sep 13 09:52:01 2015 +0200
>
>     target-arm: Start EL3 capable ARMv7 cores in MON mode
>
>     Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index f6f5539..485965f 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -164,6 +164,9 @@ static void arm_cpu_reset(CPUState *s)
>  #else
>      /* SVC mode with interrupts disabled.  */
>      env->uncached_cpsr = ARM_CPU_MODE_SVC;
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        env->uncached_cpsr = ARM_CPU_MODE_MON;
> +    }
>      env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
>      /* On ARMv7-M the CPSR_I is the value of the PRIMASK register, and is
>       * clear at reset. Initial SP and PC are loaded from ROM.

This doesn't look right. A 32-bit CPU with TrustZone boots into
Secure-SVC, not Mon. This works because in the v7 security model
Secure-SVC and Mon are at the same privilege level, unlike AArch64
where EL3 is higher privilege than EL1. If guest code needs to
get into Mon mode it can do so from S-SVC (eg set MVBAR, make
sure there's sensible code at that vector entrypoint, execute
an SMC).

thanks
-- PMM
