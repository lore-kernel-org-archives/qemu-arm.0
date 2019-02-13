Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp2121916wrp;
        Wed, 13 Feb 2019 09:03:10 -0800 (PST)
X-Received: by 2002:a9d:5c6:: with SMTP id 64mr910125otd.274.1550077389907;
        Wed, 13 Feb 2019 09:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550077389; cv=none;
        d=google.com; s=arc-20160816;
        b=NthxFhZvgCZFkUU9XRUnh0sMB9ff3Jku53/KPY15bLSLyyoKtIdmx30nDzkeHgSeZ/
         k0UqA4bCBCenJ+U0SuR81SAdSpfgx4hUq0qw9VLaM373yztzQ+9JO8/8AABDoqMLZQI7
         EesOQPsdUT5j6otpfw6otezu/CBjzjbAwGQkwrLqRtXa8q2q2ol9Xa2p4s0FGWyk8D7S
         qVjOVXAwAsGYi84bmZLUVfjmFK2VAsuZ+nduVVv6k/wPGKp8FbXkzE91vI1TRbsuKA6d
         y9rkY5oQfdpvzzK/jphgVGkFafca7OoSenGKqje8x2tv1AI7BRr69+puwVmeNbNoEHbG
         myWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Rbl0OTkL925hatTC8HPWbE3q9Ml9vt8+bfOb/2LGRg=;
        b=slHu+FrkjaL941fIstEHyDQ8kBKNkX+iT7YfiSEyJRCJPW3hpPpAX2L8wh/o1umWos
         xHc9ndEx0uKlNekHlPZmfqKFoxjDv+FxOYZ1GcmciaszeptFCidy5M/xwW5D/qBnbTBk
         Xx3iZGc3504w977Rq8DIUUXCSoRhpIFYZ4+4JC2yfn6yYFirlsj6nNmr2JOf7ymcrs5N
         W2xsur+bppIsWxyt78XaHQ3QxnH0pfecUrSo5VP+uhuEVXhBLmBrv1OwPEY86biIdIRQ
         RyXBfsFEGctNi/a57e0bcNDUWFxyJOh71zvOE6HVrZB2J0K8/0Pix4WyeEvrRTtbUlci
         r3ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RUaTEsdS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c19sor9715575otf.76.2019.02.13.09.03.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Feb 2019 09:03:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RUaTEsdS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0Rbl0OTkL925hatTC8HPWbE3q9Ml9vt8+bfOb/2LGRg=;
        b=RUaTEsdSWooz79LufieWZIRjD0JLbhPYGs4IMFl4Hy+AjBIqZKl6b1X9Ivr4LYyFvI
         q2OzqJyZAM2b9PkrnNU6PDRjVheFkTx6Q6uZc4kKkC18fDkPpj2P7hZ2yA7QbQSa0Tf2
         wIARnVDqsLEvsqDMTEn/Qh9Ff6SMD0AE9WY98ZGHMm1gh4zpFl/V7Mq18i4spbdjEsGl
         iTq4zs/k9lNttbwF4l0qH4kAvHET2LweLOPMwmv+UHELGUajPEtUn4cocXM4HQ1hHdg3
         epppdBGVs1pau8jU136tqvTnpDLUwP2370dn1IifVI+hDbuUdAMks2Z7h7HQRfhHlgsH
         Up0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0Rbl0OTkL925hatTC8HPWbE3q9Ml9vt8+bfOb/2LGRg=;
        b=LMGrZXSddkSu9KfiVaS2XEAi7MI5UyrbUWB86MRJ+u5BLB1NDHe9RruEOGyWDTYeKD
         tG7JL8fp1PCvBPDTCbknnZAcF0F58GRwRfepmFPPWUM0esw7CRMFpCTBYQ8GooA45Nnb
         /jA4MpMGYvsRCYdFTUjh6KoXWk7E4BnXC4L5xtz+QO1r8Tfg7vSsSSdoeU2NCqW+djrP
         UjELPQ8ZH5RSIn/eeKJrV54mg7ebYjO0rwMR6fyR/AWGYoOLOxdnT/ZGAMLuMyS6+N3Q
         4coxkAHSZGjeFODIgh7YqOGvPSnzElsrK92fnO5Ua+9rif/hpuGmdStl65je17MPLPdQ
         qBgg==
X-Gm-Message-State: AHQUAuY/BdOZW8SzNKP/o2JA66LbjYwMNHnr0ViONjp0j6jDFOulO6UW
	jXiUt0CvihWUeYVw57qkI6asu0IVdQDPlVCKatAcGs5pXpAjWg==
X-Google-Smtp-Source: AHgI3IbPmQyXrhUvZ5KpGhGw+hxzpU4Cv5opiIROGHF346ucj8tCWTuLcTRevMlQ81xxywzZmL+dei8dHYHXCBnWT6A=
X-Received: by 2002:a9d:61c7:: with SMTP id h7mr831379otk.363.1550077389104;
 Wed, 13 Feb 2019 09:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20181206151401.13455-1-peter.maydell@linaro.org> <87ftsrird3.fsf@zen.linaroharston>
In-Reply-To: <87ftsrird3.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Feb 2019 17:02:57 +0000
Message-ID: <CAFEAcA_GPW0B9bMOia_aB=H0PV8DwUNWBARz+uNbRk2565a+4w@mail.gmail.com>
Subject: Re: [RFC] arm: Allow system registers for KVM guests to be changed by
 QEMU code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dfRq9TT8uQtH

On Wed, 13 Feb 2019 at 16:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > At the moment the Arm implementations of kvm_arch_{get,put}_registers()
> > don't support having QEMU change the values of system registers
> > (aka coprocessor registers for AArch32). This is because although
> > kvm_arch_get_registers() calls write_list_to_cpustate() to
> > update the CPU state struct fields (so QEMU code can read the
> > values in the usual way), kvm_arch_put_registers() does not
> > call write_cpustate_to_list(), meaning that any changes to
> > the CPU state struct fields will not be passed back to KVM.
> >
> > The rationale for this design is documented in a comment in the
> > AArch32 kvm_arch_put_registers() -- writing the values in the
> > cpregs list into the CPU state struct is "lossy" because the
> > write of a register might not succeed, and so if we blindly
> > copy the CPU state values back again we will incorrectly
> > change register values for the guest. The assumption was that
> > no QEMU code would need to write to the registers.
> >
> > However, when we implemented debug support for KVM guests, we
> > broke that assumption: the code to handle "set the guest up
> > to take a breakpoint exception" does so by updating various
> > guest registers including ESR_EL1.
> >
> > Support this by making kvm_arch_put_registers() synchronize
> > CPU state back into the list. We sync only those registers
> > where the initial write succeeds, which should be sufficient.

> [snip a long test setup that I didn't really understand]

I'm confused -- I'm not sure if the things you're saying
didn't work:
 (a) didn't work before this patch and still don't
 (b) used to work and are broken by this patch
 (c) used to not work and are fixed by this patch

More generally:
 * this patch claims to fix the code path where QEMU sets
   up the guest to take a breakpoint exception (specifically
   making our change of ESR_EL1 actually take effect) -- so does
   it do that? Or is it impossible for that code path in QEMU
   to be used (if so, can we just remove it) ?

thanks
-- PMM
