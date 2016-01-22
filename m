Received: by 10.25.159.19 with SMTP id i19csp102181lfe;
        Fri, 22 Jan 2016 03:16:21 -0800 (PST)
X-Received: by 10.60.40.39 with SMTP id u7mr1820214oek.54.1453461381260;
        Fri, 22 Jan 2016 03:16:21 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com. [2607:f8b0:4003:c06::241])
        by mx.google.com with ESMTPS id v8si5400694oex.16.2016.01.22.03.16.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jan 2016 03:16:21 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) client-ip=2607:f8b0:4003:c06::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x241.google.com with SMTP id a202so3618304oib.3;
        Fri, 22 Jan 2016 03:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nj/AtPwQWnckC5GaGSYLd0/eCcPtdJ7v4DntAjoikbY=;
        b=jZoqoK/eCE4QePZVATkUuXQ+XHuCHWaxBXYaJ7GNVHVnX3xXjVbuNL/jArlDpvvp9B
         yzD2xlFW1fwJz7UegMGOrkOhvdqwEwnyhkeHZRR+DfuI2bGTFwYc/4277guAD8cf4oXX
         hjZkuA6sw1SAhKCrgMAsM6M2wXrPe9kA9VUXNHcZSnvDxaU151/haZRr0hYR0dxRsxUK
         EoBx2Ng/GzR94P6Js7GSyjOWNuUpH7aRnVu9GcXSOhYCpTR+0KxR3tXRvopmgyIM/phe
         BA05mRVWSSPDnb9DdCH9yaUBrW9ub4v8UPv4aBTi+b2y1lF9/ZHQ0ZHY5RGLGUR4W7ij
         FX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=nj/AtPwQWnckC5GaGSYLd0/eCcPtdJ7v4DntAjoikbY=;
        b=mdQpfQd8nVZmOsfEN3OR4b/0yykDoT49WIbFFA+Bq2ebQBwxS7N3N1sg4WQIyUAae5
         JZm9PdRF88HDO4R1MoBvHYMxvUZlYZhFNpmZcSTHOVXZeRTRETWAwfysNA6KWI13oxNF
         TbSi1NJXsLTyEUreuL891kjTMcj526pgD8Wa/OfwNwJ+KZQ836thGWwHDvRdkOpi3YIB
         R62qRaLWsKf0czQ068Z3IApm9p6YielBgRRRyfRxcWrcceL2UHk/sTVOSMh8UN9zUUDd
         kQGkqc0fRKix6HJwjycJ2JP+7PtY85rkxC3o0IzSJAIxpPouLiLbMfxdAUb6IeXio4P6
         d4Jw==
X-Gm-Message-State: AG10YOSo4k5oWQLSRurifQNEJ84B5hWC/EmjL4Sa6u5S8XT9xJ3VzLavoW8wQBiLQKnJsw==
X-Received: by 10.202.77.74 with SMTP id a71mr1616498oib.73.1453461380949;
        Fri, 22 Jan 2016 03:16:20 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id e65sm2833359oif.15.2016.01.22.03.16.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 03:16:20 -0800 (PST)
Date: Fri, 22 Jan 2016 12:16:01 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: Re: [PATCH v2 3/3] target-arm: Implement the S2 MMU inputsize >
 pamax check
Message-ID: <20160122111601.GD25287@toto>
References: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com>
 <1453375108-25229-4-git-send-email-edgar.iglesias@gmail.com>
 <8737tpj4bo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8737tpj4bo.fsf@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: DgDW6ZygnOOo

On Fri, Jan 22, 2016 at 10:28:43AM +0000, Alex Bennée wrote:
> 
> Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:
> 
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Implement the inputsize > pamax check for Stage 2 translations.
> > We have multiple choices for how to respond to errors and
> > choose to fault.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/helper.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/target-arm/helper.c b/target-arm/helper.c
> > index 4abeb4d..9a7ff5e 100644
> > --- a/target-arm/helper.c
> > +++ b/target-arm/helper.c
> > @@ -6808,7 +6808,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >           */
> >          int startlevel = extract32(tcr->raw_tcr, 6, 2);
> >          unsigned int pamax = arm_pamax(cpu);
> > -        bool ok;
> > +        bool ok = true;
> >
> >          if (va_size == 32 || stride == 9) {
> >              /* AArch32 or 4KB pages */
> > @@ -6818,9 +6818,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >              level = 3 - startlevel;
> >          }
> >
> > -        /* Check that the starting level is valid. */
> > -        ok = check_s2_startlevel(cpu, va_size == 64, level,
> > -                                 inputsize, stride, pamax);
> > +        if (va_size == 64 &&
> > +            inputsize > pamax &&
> > +            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
> 
> If va_size == 64 doesn't that imply arm_el_is_aa64(env, 1)? Looking
> further up the function it seems that is what sets va_size in the first
> place. I think that makes the inputsize > 40 check redundant.

va_size == 64 is true if the EL corresponding to the translation _regime_
is in 64 bit mode (in this case EL2).

EL1 may very well be in 32bit mode.


> 
> > +            /* We have multiple choices but choose to fault.  */
> > +            ok = false;
> > +        }
> > +        if (ok) {
> > +            /* Check that the starting level is valid. */
> > +            ok = check_s2_startlevel(cpu, va_size == 64, level,
> > +                                     inputsize, stride, pamax);
> > +        }
> >          if (!ok) {
> >              /* AArch64 reports these as level 0 faults.
> >               * AArch32 reports these as level 1 faults.
> 
> I'm not a fan of the ok = true / ok = false / ok =
> check_s2_start_level() / if (!ok) ping-pong here as it is hard to
> follow. I'm not sure how you could make it cleaner to follow though.
> Maybe something like:
> 
>         /* For stage 2 translations the starting level is specified by the
>          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
>          */
>         int startlevel = extract32(tcr->raw_tcr, 6, 2);
>         unsigned int pamax = arm_pamax(cpu);
>         bool is_aarch64_regime = (va_size == 64);
>         bool ok;
> 
>         if (va_size == 32 || stride == 9) {
>             /* AArch32 or 4KB pages */
>             level = 2 - startlevel;
>         } else {
>             /* 16KB or 64KB pages */
>             level = 3 - startlevel;
>         }
> 
>         if (is_aarch64_regime &&
>             inputsize > pamax) {
>             /* We have multiple choices but choose to fault.  */
>             ok = false;
>         } else {
>             /* Check that the starting level is valid. */
>             ok = check_s2_startlevel(cpu, is_aarch64_regime, level,
>                                      inputsize, stride, pamax);
>         }
>         if (!ok) {
>             /* AArch64 reports these as level 0 faults.
>              * AArch32 reports these as level 1 faults.
>              */
>             level = is_aarch64_regime ? 0 : 1;
>             fault_type = translation_fault;
>             goto do_fault;
>         }
> 
> But I'm wondering if it just makes more sense to push the:
> 
>     is_aarch64_regime && inputsize > pamax
> 
> Check into check_s2_startlevel? Then you could just have a simple call
> which succeeds or falls through to a fault?

Yeah, I guess we could rename check_s2_startlevel to something more generic
and move all the checks there. I don't feel very strongly about either way...

Thanks,
Edgar



> 
>         /* Check that the starting level is valid. */
>         if (!check_s2_startlevel(cpu, is_aarch64_regime, level,
>                                      inputsize, stride, pamax) ){
>             /* AArch64 reports these as level 0 faults.
>              * AArch32 reports these as level 1 faults.
>              */
>             level = is_aarch64_regime ? 0 : 1;
>             fault_type = translation_fault;
>             goto do_fault;
>         }
> 
> --
> Alex Bennée
