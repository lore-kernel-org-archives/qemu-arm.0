Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3082606wrt;
        Mon, 28 Jan 2019 01:46:26 -0800 (PST)
X-Received: by 2002:a2e:2e1a:: with SMTP id u26-v6mr17010477lju.8.1548668786564;
        Mon, 28 Jan 2019 01:46:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548668786; cv=none;
        d=google.com; s=arc-20160816;
        b=DvjkMYqYZrtwkojR/PP1oDUl/QZKl0cXZkSPQPp36bjSgukCkqlC01IIfWcI3lrHMz
         YHR+arGA1WatLbhogqgxUYB/EZhYWu0axb6U0qtYwqwt9FpLB1IOdMxYDhqQneeKECTD
         vQASH6MS2ZuyOn13RIfw0SCyBz+q6Zsmej1K1MZPNGHNpp6XQ2HjDRsERvkDQavQBPVO
         22G0h70U/tisxs56niFk6XsBNzsHXub3ZvaTNu/o1sExB5P7zt0vhzcq3HQS3CmAEf2H
         uZuq+y/BGUVwryhoFeXUx8tV1r7w+yGrxuhT02sMWltouuFYdf5IupEhZ2hOQOCaeQQ+
         sIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oYEtZurntTZuLoxLB/lbIGBz5ikcXYMMXLBV3IJuXv8=;
        b=F00OVVmbeLXh0tDQ3t9Q8/G6y46akpPEV3CAQAqJa+CagODgqUVt8E3mC6Ue+vdead
         GBz08LQSufTP/EJVN5/Ddr/NGCUH2DVlNXi1+IDCQ+DiFjoGrVyb+9l4fx+RIAk2bISO
         jRtcIEZcakJksGdizxRF/v3J9PnAs/FiQH4akib5VCs7afLaFOmGL7QROGlZHKPUGeMJ
         yMQGEfIylJfHAor/PYvpAfbCi7Y5X2zgOC+ggZ+4KSASR4pNXAW8kdby15Je2L0HSeYW
         ayJ2HjXuI1UGLvACDHR32mY3U0LmKQQSxPQ7EoAztVfWwZR9TsmCPAgSLHhUh7m9h7Zl
         WhRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D/FTBWkf";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g21sor4540587lfj.22.2019.01.28.01.46.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Jan 2019 01:46:26 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D/FTBWkf";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oYEtZurntTZuLoxLB/lbIGBz5ikcXYMMXLBV3IJuXv8=;
        b=D/FTBWkfeCrXrc2uNV3dffZ43jpPWkezHBM+BjVBclf/lusXmrsQzyn7DR8Uu7mSC9
         J656xJCRl2/UXVrZ7li+gTqTvR6sP9y/ssyXVNTWalIVatHduZgNqIzrJ4PE2J0K80nz
         lVWazTd5fhjdX7409MV1+yE1bxYnh43O9XPVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oYEtZurntTZuLoxLB/lbIGBz5ikcXYMMXLBV3IJuXv8=;
        b=rd8P2QnaO3ZyNaSLt5/V9uTy4xduL/BvQrICsmZnbJQYL7MZQDVru84ul8ovDBHlmj
         LWuyGDLnV6KN+NHSbBB7unWR6m4EI9CtRrUCF3uo/av3M2rxcMxsSbJvpW5+wlJePxQk
         4kHi1BmsL4+HGfQSM78nxm4Kc/qW0VPSKWnCAlqTq0L5tc8Blufj0ArNyZKr3EoMAtZh
         81rJ4BteOUAevs0HrRpP3hiPAXzZ2xd94euZ5ICINICzgZhfuOcYaF+wmPGJOFPo+Znc
         zQOuMSXTrxaGipSg1bKrQcW7Q6s2zdeJU6LfR/ZFUpApou0oN0Ww0w1Prvftugr3AY8Y
         EJKg==
X-Gm-Message-State: AJcUukd+Wekt+F4auzX/X/A4tRiHvFqet55MsBGOwiliYtjyfThpaBSH
	rPqnygL5Ovx71qUknUVlMO+HsMAD3a1Q2gQ0x5+B+Ofi
X-Google-Smtp-Source: ALg8bN7URcr9X2sXCX6mrTuX/N4qcJAT0JiRfCdZWzURVfuKXIqk6ZwlZTmvLjIW1x0O/4e2klvV4qAE0xxJlTENPJo=
X-Received: by 2002:a19:5d42:: with SMTP id p2mr15522880lfj.83.1548668786050;
 Mon, 28 Jan 2019 01:46:26 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-3-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA9mF+WiPLW4yyv1aEMLTg2QK2krZvxyjCSsMziJtzx3Ug@mail.gmail.com>
In-Reply-To: <CAFEAcA9mF+WiPLW4yyv1aEMLTg2QK2krZvxyjCSsMziJtzx3Ug@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Mon, 28 Jan 2019 17:46:14 +0800
Message-ID: <CAHmQWvCw5ndod93WqLXDgGxDERtRM3ee_qiLA+S34Y9X2JFvVQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] hw/arm: add Arm SBSA reference machine, devices part
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: OkT1UCqm0fda

On Tue, 22 Jan 2019 at 19:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > Following the previous patch, this patch adds peripheral devices to the
> > newly introduced SBSA-ref machine.
> >
> > Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> > ---
> >  hw/arm/sbsa-ref.c | 421 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 421 insertions(+)
>
> Most of this code looks good, thanks.
>

Thanks.
By the way, this patch https://patchwork.kernel.org/patch/10744759/
has been merged, now we have a generic EHCI controller, I will add
this in my next iteration.

> > +
> > +static void sbsa_ref_machine_done(Notifier *notifier, void *data)
> > +{
> > +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> > +                                         machine_done);
> > +    ARMCPU *cpu = ARM_CPU(first_cpu);
> > +    struct arm_boot_info *info = &vms->bootinfo;
> > +    AddressSpace *as = arm_boot_address_space(cpu, info);
> > +
> > +    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> > +        exit(1);
> > +    }
> > +}
>
> I still don't understand why we need this -- it doesn't seem
> to be doing anything different from the default behaviour that
> boot.c implements if skip_dtb_autoload is false.
>

According to the process of arm_load_kernel() in boot.c, If only
kernel loaded via -kernel but without any firmware, it works fine.
While in this case, we have have firmware loaded but no kernel (eg
firmware loads kernel from storage, firmware never come back to qemu
again), so the arm_load_kernel() returns in the middle before calling
arm_load_dtb(),  because arm_load_dtb() is the final step in
arm_load_kernel(), so there is no chance for the arm_load_dtb() to be
called, then we get error message and qemu quits.

> thanks
> -- PMM
