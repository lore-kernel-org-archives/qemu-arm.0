Received: by 10.25.159.19 with SMTP id i19csp690810lfe;
        Fri, 15 Jan 2016 12:37:11 -0800 (PST)
X-Received: by 10.66.227.1 with SMTP id rw1mr18114978pac.35.1452890231525;
        Fri, 15 Jan 2016 12:37:11 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com. [2607:f8b0:400e:c03::243])
        by mx.google.com with ESMTPS id d9si18521698pas.186.2016.01.15.12.37.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jan 2016 12:37:11 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::243 as permitted sender) client-ip=2607:f8b0:400e:c03::243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x243.google.com with SMTP id yy13so29839090pab.1;
        Fri, 15 Jan 2016 12:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=hxA89CoOBxue1m/9gsZNW2h9UE/b1emDfHxmjI++nxk=;
        b=GcBdaWhDKrfCtteoNLmJNYdMFbtnjWR/9ESeYgIBtydG1iYxXGq1/swRDZsn0mP0O9
         jncZqEYM7zBg1NFhm/8IkENkry+DzaRVWheqKudfL2aCJJvBCV1WUfAvX0m0+uVha/hp
         4nXn+3Qy8RokfO138+MqWwPlapcaR6gA7Wv6xBCZX53lz/HJVSGJyFmJHFUEXzeTHvTM
         RxcY1j9AWGGzFL36lAmjwDYXjGXjJWiET59lDnkW/YcsSI/LHE9Hd4WPwhjo9K+LOUD/
         Gw6l2ESLtpONoZywtnTKgdc07Po/ykS/AZMWHrlT4lvqC31VY56vGP1812bTeMnNVCmo
         IApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=hxA89CoOBxue1m/9gsZNW2h9UE/b1emDfHxmjI++nxk=;
        b=bY+Ot1Fz6Y3+uqvj7moax+IX/BRUASORzTalcwfW7Yod4vILJZoTcWyP6yTZVN1KV2
         tId11aWYefuJ7MbwwT/Bv6NDdGtwim2j3E+/0UCn/mymorWL/ZioWRhzWUuSPFltRBPL
         Vf6z1HwQWmXNjPtlSP5VkfUBLdxN9/KuF6CnDH7xFn0bm6YBxi4YmPIhwvXFbhYje1Ll
         xVbfHBnM1qPWFzMZxesJSFRL5HLBuT51LoACqbSyJtTHWM9bLeln+N70bzoIEX+4nqPj
         wCetUHyncWhWa0qFmhKeQbu2lEiFBWdwSx1YGSLKrCtvL/GBOouDvuHvNWqan1iYVG7v
         Km7Q==
X-Gm-Message-State: ALoCoQkoyVtL+fJqql3LtHfTkSuHF43fBYLTgw1ZIAKIG5WEKZ7THdY8+IbhTQosDpB2+MDQQflMP/30eyQXRuimqm4mw+dSrQ==
X-Received: by 10.66.187.145 with SMTP id fs17mr17708643pac.81.1452890230942;
        Fri, 15 Jan 2016 12:37:10 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id ux2sm17287292pac.46.2016.01.15.12.37.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 12:37:10 -0800 (PST)
Date: Fri, 15 Jan 2016 21:37:07 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/8] target-arm: Properly support EL2 and EL3 in
 arm_el_is_aa64()
Message-ID: <20160115203707.GM29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
 <20160115143836.GI29396@toto>
 <CAFEAcA_GkZNcXTHLN_rb1Tdi=sUSgxK07abZsOu59Ogbx-uqGQ@mail.gmail.com>
 <20160115153737.GL29396@toto>
 <CAFEAcA-qULPxKo4dwHkW-2xBzY8t=ei3-ny7Py0iigCk6DuunQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-qULPxKo4dwHkW-2xBzY8t=ei3-ny7Py0iigCk6DuunQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: 9Oc3rfWpyCun

On Fri, Jan 15, 2016 at 03:47:17PM +0000, Peter Maydell wrote:
> On 15 January 2016 at 15:37, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > On Fri, Jan 15, 2016 at 02:50:24PM +0000, Peter Maydell wrote:
> >> Do you have much locally extra that you needed for enabling
> >> EL3 in the Cortex-A53? I have an ARM Trusted Firmware + OP-TEE
> >> setup now that I'm going to use to work through the missing bits,
> >> but if you've already gone through that effort there's no need
> >> my duplicating work...
> >
> > I don't have anything immediate for EL3 beyond enabling it and some
> > boot thing for a15/aarch32 to allow me to run my tests.
> 
> Cool. I'm not sure at what point to add the patch that turns
> on the EL3 feature bit, but I guess in the not too distant future :-)

IMO, we should have enabled it by now :-)
I guess the EL2 needs the 2 stage MMU error handling and maybe the GIC virt features
to be reasonably useful, I don't know.

> 
> > I haven't
> > really looked at the boot in detail for aa32 so I haven't bothered
> > submitting it. This is it:
> >
> > commit b30c7102624241a67ebb2d3df70e88a4148f68a4
> > Author: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > Date:   Sun Sep 13 09:52:01 2015 +0200
> >
> >     target-arm: Start EL3 capable ARMv7 cores in MON mode
> >
> >     Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >
> > diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> > index f6f5539..485965f 100644
> > --- a/target-arm/cpu.c
> > +++ b/target-arm/cpu.c
> > @@ -164,6 +164,9 @@ static void arm_cpu_reset(CPUState *s)
> >  #else
> >      /* SVC mode with interrupts disabled.  */
> >      env->uncached_cpsr = ARM_CPU_MODE_SVC;
> > +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> > +        env->uncached_cpsr = ARM_CPU_MODE_MON;
> > +    }
> >      env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
> >      /* On ARMv7-M the CPSR_I is the value of the PRIMASK register, and is
> >       * clear at reset. Initial SP and PC are loaded from ROM.
> 
> This doesn't look right. A 32-bit CPU with TrustZone boots into
> Secure-SVC, not Mon. This works because in the v7 security model
> Secure-SVC and Mon are at the same privilege level, unlike AArch64
> where EL3 is higher privilege than EL1. If guest code needs to
> get into Mon mode it can do so from S-SVC (eg set MVBAR, make
> sure there's sensible code at that vector entrypoint, execute
> an SMC).

Thanks. I figured my zero research would prove me wrong :-)
Thinking about it, I have never ran my aa32 TZ testsuite on real
HW so there are tons of stuff that could be wrong!

Best regards,
Edgar
