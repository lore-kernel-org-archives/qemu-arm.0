Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2404306wrt;
        Fri, 23 Nov 2018 10:45:22 -0800 (PST)
X-Received: by 2002:a9d:6e06:: with SMTP id e6mr8631945otr.194.1542998722528;
        Fri, 23 Nov 2018 10:45:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542998722; cv=none;
        d=google.com; s=arc-20160816;
        b=pFkgpjUkZ5jquBSSm97RyyIFlKSJtftBFSHT77atZF6MawSNr1+O1bIi5ZsfZATt6K
         XG1I/EK8b/ecBJWWnNyIpHHoxYiAdGI2koCVPlZyJfL7/kqlz58JPd7KRriy7D5lg3ko
         nArMuHZP6MHx7ngN7FF0lZQPCUr8oPxzMh8Ho981rKgLImV/hsMcUKlCu9VWUT0ssCYF
         ysAGw5XAKlo0S4kHt6QVSQLlTbhB5bC6okAsP5d4KB74ek99tOZiG4iIFKehEO7arHb9
         aJdeWeoMB5qmwu/+lnKCC8H08s+XJj4/2w4OjlnOridI1vWTdK4CPqqfYpj+Jv1utkh8
         pIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ewNPkW0vRAGg8olO9/j7Ob48cDnVoZyAoUBHYj0F9NQ=;
        b=chjhvuGEYBQaUC5WAhSo+nwcFhJKc+iC022kexyJATB6dL6yLHIJPupVnprTMA8yrv
         RYRjieYLZxirMvN5BZbDc2OMtPEFqI8JtxM3ulCJLHKHBlIcXX53oHcZ0GXyP26KTEgm
         F8fbVjlwERoJ7INsjBijM+Spyt8u4m2z19ClxJE5Wlwq3u0PRNFkkEeGDn1MxZ8VV62i
         agO55Ab5glG+tK1zQRDeuS2hTE5AuiLhDf9y58UhaHF1TFHPJlAOpe/PhRYHBEPUb+P1
         7jH1QoD6sB8MFjr1amYeXA1c+5Ym5ELPUgdIdz1fXKGNr1vx4FIzyg1LPPMXZU3PHhff
         ayWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=djrMWnCY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o129-v6sor30930633oia.157.2018.11.23.10.45.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Nov 2018 10:45:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=djrMWnCY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ewNPkW0vRAGg8olO9/j7Ob48cDnVoZyAoUBHYj0F9NQ=;
        b=djrMWnCYuFg0lULEz4sT1Afi6aMO0/0QUC6Sz+4ydnKIDJhaSn+W/5p6T5hwNSSwzH
         a93+tXCWaUtnvv8aRj3xEYsaf4tZOP5EXxoRRdfzF0/2joDuDDlzzpiMYoD/BV6lxxK9
         QWiQuVh/Z9MfhCVvDFLTZPylAcFtxoB75oyAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ewNPkW0vRAGg8olO9/j7Ob48cDnVoZyAoUBHYj0F9NQ=;
        b=uSZvQWCRz+a5og2Cqv2rqMKuKhkG+6VptSQpWspqxcaAVB5ySj0NvjEpRCnAHEVDdA
         1RNpkwf0Jrju75S6cOGxxqa/fLEQA/5eqsKTSfoWNxxW367GR2yvZYrMAU7q4fCN035b
         SpwQOBeN3c7cHxI0bYZc5Aott3E6NefEAKBPKvn8WOhV9GvxWJITvN5oW6M82L38Upjp
         6TmzmR14rnLcBS5M5Jet93bKARmqYCwarVtgn3gGsqzoM25sUWmf4O9Ok3iKFKsEHuC9
         dYerNHkO9TI/4y+E1Om+tYA7BVYFw83x2adj6slyyeodcjtugWTIESftODz18WWwOtSX
         MyKw==
X-Gm-Message-State: AGRZ1gJQXlx6GWf+9H/qrY+m3cTE+l1CGh6QsDHZjEEyzcu4U1ACy2N2
	P+vFdG5q1eY6emsKqxLBCGhwGxnqntSnQXpTMU6jJ1NJ
X-Google-Smtp-Source: AJdET5cHMSqiKpOS/aeYMevJGMcmjXWLB8YyjhJmF1M9qlO51T4xc73BohRYWExk1ML7h6fuKEGbQyS808rqFwHoNag=
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr9611836oit.325.1542998722124;
 Fri, 23 Nov 2018 10:45:22 -0800 (PST)
MIME-Version: 1.0
References: <0184EA26B2509940AA629AE1405DD7F201F7BBE8@DGGEMA503-MBX.china.huawei.com>
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F201F7BBE8@DGGEMA503-MBX.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Nov 2018 18:45:09 +0000
Message-ID: <CAFEAcA_abaoxA=myPszVrO59-hSazHAePRJXUCHKSFnoEdsfiw@mail.gmail.com>
Subject: Re: [PATCH RESEND v15 08/10] target-arm: kvm64: inject synchronous
 External Abort
To: gengdongjiu <gengdongjiu@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Laszlo Ersek <lersek@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>, 
	James Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marcelo Tosatti <mtosatti@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	Zheng Xiang <zhengxiang9@huawei.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	kvm-devel <kvm@vger.kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 9uRcMAtEvoer

On Wed, 21 Nov 2018 at 14:34, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
> Hi Peter,
>   Thanks for the review and comments.
>
> >
> > On 8 November 2018 at 10:29, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> > > +bool write_part_cpustate_to_list(ARMCPU *cpu, ptrdiff_t fieldoffset)
> >
> > What is this about? Nothing else in QEMU needs to mess with the cpustate synchronization. My first assumption is that you should not
> > need to do so either.
>
> We should change the guest CP15 ESR_EL1's value, the only method is to change the cpu->cpreg_values[] in QEMU, then QEMU call write_list_to_kvmstate()
> to set the cpu->cpreg_values[] to KVM which include the specified ESR_EL1 value, KVM do world switch, and then set the specified ESR_EL1's value to guest kernel.

Ah, I see. This is a bug in our current handling of the register
state, where we implicitly assume that nothing in QEMU will ever
want to change any system register values. This assumption is
now false -- kvm_arm_handle_debug() broke it -- so we need to
fix the code that does kvm_arch_put_registers(). There is a comment
in the kvm32.c version of that function about this. (The kvm64.c
version has the same assumption but doesn't comment on it.)

We should (ideally) fix this bug in the code that does register
syncing, without requiring places in QEMU that update system
registers to have to manually indicate which registers they have
changed. I'll have a think about how best to do this.

> About the detailed explanation, as shown in [2].
>
> kvm_arm_handle_debug() does not need to do this because QEMU does not need to change CP15 registers, such as ESR_EL1.

kvm_arm_handle_debug does change ESR_EL1: it is injecting an exception
and so should set the exception register. This happens when it
calls the do_interrupt() hook, because arm_cpu_do_interrupt_aarch64()
writes to env->cp15.esr_el[new_el].

I'm not entirely sure why this is working today, in fact.
Alex, did you test whether our debug-exception-injection
reports the correct ESR_EL1 to the guest ?

> > > +/* Inject synchronous external abort */ static void
> > > +kvm_inject_arm_sea(CPUState *c) {
> > > +    ARMCPU *cpu = ARM_CPU(c);
> > > +    CPUARMState *env = &cpu->env;
> > > +    CPUClass *cc = CPU_GET_CLASS(c);
> > > +    uint32_t esr;
> > > +    int ret;
> > > +
> > > +    /* This exception is synchronous data abort */
> > > +    c->exception_index = EXCP_DATA_ABORT;
> > > +    /* Inject the exception to guest EL1 */
> > > +    env->exception.target_el = 1;
> >
> > These comments don't tell us anything that the code does not.
>
>  Thanks, do you mean I need to remove it or add more detailed comments to it?

As a rule of thumb, comments should provide information to
the reader which they wouldn't get if they only had the code.
Comments often answer the "why do we do this" question, or
provide an overall summary of what the code is going to do,
or refer to an external source (a datasheet, an algorithm)
that is necessary to understand the code. It's better to
avoid comments that say "what the code is doing" at a line-by-line
level, because the code itself already answers the "what"
question at that level of detail.

thanks
-- PMM
