Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1696361lfj;
        Tue, 11 Jan 2022 06:38:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIWMIX0djA7XZlpSqwLc87KwV5aNJYEP5KabqLPSknZKIU+ag7Grh6Wi6v/OGqkvIdwbDy
X-Received: by 2002:a17:906:f01:: with SMTP id z1mr3958540eji.346.1641911913842;
        Tue, 11 Jan 2022 06:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641911913; cv=none;
        d=google.com; s=arc-20160816;
        b=ie6h8MOWCz8LXnGpckddy1+lCMQPkMHAHfqjIuBgpWxBwGWDAfZ4PI4r+d9iAFScmJ
         mh0t04AkiF4EiDmG41X/w1K1vwQ27llyIH8DT+3CZlm2+V2jQhA+fAaBCXcKAd23Bbhh
         8dubO2zjLV2YNBzY8vW4blAOJLVErue6gXDzfLwpTb2PhHGzlBo9TxQYxYyr8gU2wB7T
         khwtsnfsB1tAICYqHSbdBmdDDtvo1tw0b1SL3KI2dEseeSpbu4A72c+UNciexr8AeH8v
         GqRz/v+65EgZrrlWIbvUCEqPe3opznZurwN2Ae+7T3qVKldgU1eHegPozPFxYo2oHRv/
         dr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JcFIZQAGkW4l2coWNcK1nDoIuneVvgQf5UfEGY0IVCQ=;
        b=iiG+0mIknjtKboVMfgCZcKa0qIHZR3kRdZNMwBJzCoS3SJ8HtLrFLM+Z96T6Sppkuv
         dBh47ee+XYNnH6KHd1uewnFlM4uzOqsO34LXrRUtA9Q3E0u5BcjT9uPao1GahFr50/rD
         KE7ok8kReG1smLdHIvZWqx4YEK8a3HEhDWaDPlxDbwKgXIlQ8buo9IYVEdM32IEpYzkm
         qIuA2CMXCJspZS4KwyLC9Qzk42aeaa8qZtMwVN+FVw5n2r/KyDz3Vz/7IOw+so8CqVq3
         VMfTlDvBXyPJou1g/zO0uOOPPBTiGgR0RzMNsIZRabgm93PtVfBSpBznruyIQfvb5W39
         pWSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="vJLu/yvn";
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id z19si3856624edc.530.2022.01.11.06.38.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jan 2022 06:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="vJLu/yvn";
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 675D661684;
	Tue, 11 Jan 2022 14:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29A2C36AED;
	Tue, 11 Jan 2022 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641911911;
	bh=PutJFyltCPb08IZGrqTG7R4v/+VWa2fWSkEQMTS1hjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vJLu/yvnRPB69/k+Fv8GIeC1OlS1qTs16aPTiG/GocigM2X68NkMrFntdVM5KWvME
	 8Pc5RMtfD4FtG3TBcdPd0KOiOV8sw8MPg3KYDMXBTKrEESCpCUioJgWfNbzu+1TAaw
	 LC7yuzFbUNre1tMlcAW448a3x6zwOK2MBT2TrnVN3nfuzn5WqqlekdslxOo3b45n6L
	 cfwTo9pFU5f/vIpLHiloC22/u4wstIC6tWBbyDUq0mVydIWEDizsdmeQZl+aQHf48M
	 moH6NJ1D3TQ4/XGNM7JHOf+So7JEPkgDYu0aNvVzs13HQ0nzUVIRQ+eKyXo+1C3PmN
	 bgACAcvR7nwYA==
Received: by mail-wr1-f52.google.com with SMTP id l25so22497660wrb.13;
        Tue, 11 Jan 2022 06:38:31 -0800 (PST)
X-Gm-Message-State: AOAM533eX55Fz5pFuEllGOQhfrHVb9gpbD/rDcCzG0o7RIrzGpO6scaV
	l/wPPZO4Gzt+wxRohHHUT2fB10o2N8Cqm3HbhN0=
X-Received: by 2002:a5d:6210:: with SMTP id y16mr3899265wru.454.1641911910149;
 Tue, 11 Jan 2022 06:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20220108150952.1483911-1-ardb@kernel.org> <CAFEAcA9DCzNJ8q7wLqSW-4pCzGM4gSvo2FLVhkG94cdriYj4zQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9DCzNJ8q7wLqSW-4pCzGM4gSvo2FLVhkG94cdriYj4zQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Jan 2022 15:38:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFg_q=43YXScs_pOb3f21V_2dv+HMm3sR3YUu+HK222TA@mail.gmail.com>
Message-ID: <CAMj1kXFg_q=43YXScs_pOb3f21V_2dv+HMm3sR3YUu+HK222TA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Alex Bennee <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: T/V3cOkedGyO

On Tue, 11 Jan 2022 at 15:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 8 Jan 2022 at 15:10, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > When running under KVM, we may decide to run the CPU in 32-bit mode, by
> > setting the 'aarch64=off' CPU option. In this case, we need to switch to
> > the 32-bit version of the GDB stub too, so that GDB has the correct view
> > of the CPU state. Without this, GDB debugging does not work at all, and
> > errors out upon connecting to the target with a mysterious 'g' packet
> > length error.
> >
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Alex Bennee <alex.bennee@linaro.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > v2: refactor existing CPUClass::gdb_... member assignments for the
> >     32-bit code so we can reuse it for the 64-bit code
> >
> >  target/arm/cpu.c   | 16 +++++++++++-----
> >  target/arm/cpu.h   |  2 ++
> >  target/arm/cpu64.c |  3 +++
> >  3 files changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index a211804fd3df..ae8e78fc1472 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -2049,6 +2049,15 @@ static const struct TCGCPUOps arm_tcg_ops = {
> >  };
> >  #endif /* CONFIG_TCG */
> >
> > +void arm_cpu_class_gdb_init(CPUClass *cc)
> > +{
> > +    cc->gdb_read_register = arm_cpu_gdb_read_register;
> > +    cc->gdb_write_register = arm_cpu_gdb_write_register;
> > +    cc->gdb_num_core_regs = 26;
> > +    cc->gdb_core_xml_file = "arm-core.xml";
> > +    cc->gdb_arch_name = arm_gdb_arch_name;
> > +}
>
> Most of these fields are not used by the gdbstub until
> runtime, but cc->gdb_num_core_regs is used earlier.
> In particular, in cpu_common_initfn() we copy that value
> into cpu->gdb_num_regs and cpu->gdb_num_g_regs (this happens
> at the CPU object's instance_init time, ie before the
> aarch64_cpu_set_aarch64 function is called), and these are the
> values that are then used when registering dynamic sysreg
> XML, coprocessor registers, etc.
>

Right.

> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -906,6 +906,7 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
> >  static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
> >  {
> >      ARMCPU *cpu = ARM_CPU(obj);
> > +    CPUClass *cc = CPU_GET_CLASS(obj);
>
> This is called to change the property for a specific CPU
> object -- you can't change the values of the *class* here.
> (Consider a system with 2 CPUs, one of which has aarch64=yes
> and one of which has aarch64=no.)
>

So how is this fundamentally going to work then? Which GDB stub should
we choose in such a case?


> >      /* At this time, this property is only allowed if KVM is enabled.  This
> >       * restriction allows us to avoid fixing up functionality that assumes a
> > @@ -919,6 +920,8 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
> >              return;
> >          }
> >          unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +
> > +        arm_cpu_class_gdb_init(cc)
>
> This fails to compile because of the missing semicolon...
>

Oops, my bad. I spotted this locally as well but failed to fold it
into the patch.

> >      } else {
> >          set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>
> If the user (admittedly slightly perversely) toggles the
> aarch64 flag from on to off to on again, we should reset the
> gdb function pointers to the aarch64 versions again.
>

Ack.

So I can fix most of these issues, but the fundamental one remains, so
I'll hold off on a v3 until we can settle that.

Thanks,
Ard.
