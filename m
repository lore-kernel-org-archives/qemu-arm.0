Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9204999wrt;
        Wed, 5 Dec 2018 02:36:37 -0800 (PST)
X-Received: by 2002:a5d:66c1:: with SMTP id k1mr20645666wrw.132.1544006197864;
        Wed, 05 Dec 2018 02:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544006197; cv=none;
        d=google.com; s=arc-20160816;
        b=0wXK27gAgWEUfz7bEUsf8jVpnTAGAR5xIlZIRh9BrPUDp2j1aQhTbgOGh+Q53f0HwN
         bFogDldk8TP5lTFLdoJiEGbSarvGQMXAY/w3XOy5IQmCRzhuQ1qjWnJ1ZiyD/yd9IH0d
         eeuvvbmLotw2biC5ajngwORQl41H48PMf3FcLHDPCmxvLY3bMQ2jez4bmMM/XbCsSmQM
         ma5Xi2+fSv8j20BDMGVxw36xPRkWgLv7h6eCm/n6y6btAj2HOdcuIOUtBsW1bACZz2ad
         6jk+ozE/QIumXY8GKL52LdW1abh87o8l3VDjnUFlOL9Zgbn/N/VffLYstrCU111+Rbja
         s1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=kOqkRwWTD5CBy6HdqvsLgbCVo7iIWCV2JN5lOT1zHUA=;
        b=FNzLuTY0UGOQs/RDQZAmwcat+VFxDhVoTunH7of0VGDMkiyEmQehpKr6XT4iV5U8w8
         gfpqtd62GpODWPs9uhZkknKtNg4GP/+w2xajWRUpxkgF+c1igaftqrCIHq6ctJfpeAXq
         0uEfxD2Cgdb+GK8VW2FLUy6mv1isseab4JIvOql0Js4Qa1Q0+untJ2eqBag2jvIR2TCp
         C2YQ3E2xcG9wr/jon6BRczlhKhv3Jj4fGFRx7RN4qiIvz79kF38f+FBMoTOU5lXN1mF3
         puCm1l0ZBci5lqViwfGcyzsCVPhv7tz3M7AIf84Oc4dg876Ld7Fp9n/O14ffhFBITOMW
         7QEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYPkHG3X;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <leif.lindholm@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l127sor8303294wmb.7.2018.12.05.02.36.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Dec 2018 02:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYPkHG3X;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kOqkRwWTD5CBy6HdqvsLgbCVo7iIWCV2JN5lOT1zHUA=;
        b=BYPkHG3Xkk2mGficko96JAX8OzXh7cfr1yr4o0jryEcEm0802HgjnKRZzXpJ5vFjwC
         ewQVf91mp5IuW3sAl3FmQGeyoduHvLctKgURERZILdCpUKmBU3mmHRCmeYChbUZ6hhyW
         wIP0vAesB82kSDPqY2OejjLMdBoGm2twlglpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kOqkRwWTD5CBy6HdqvsLgbCVo7iIWCV2JN5lOT1zHUA=;
        b=FlRBIcX463JZDEdn0dV2vFymMy9+xWjdc46+LoeMIP7OxdMAkuJmFW74V9W07lsPWZ
         fZLkUZGKGBYmYd1GUdJjkscPjiQeHS53BiXPrGlGQds1yNjSjyM4QBFw3YEy7R5LBnMx
         DhSmsBz8w9gUSPraseE2FwecyASdj//533vYVWT/yTjPLBuDx0lAPD3XY5qRqDuixC9V
         /JpkS+9Ss/2aIK2CsUyi8Cigau53dIkn1vt2iIks+aSK4/IeJc9VWZW5W3z5IN8KH6UL
         uAgU7Z2c0GBIDF/NXi2E33ZGLRk98EZr1EpbfPlYhCsw2nZexu6N9v6YUxAjRyOfR2Qb
         Pd6Q==
X-Gm-Message-State: AA+aEWZAh1ihwX3RMxy0DuZf6BUnTPkRXHcZalPCIahfsEOdhb+r2jYT
	gRkeoDw8o1IGdcRvuY3UN08ongcp
X-Google-Smtp-Source: AFSGD/XDKYoHPN6v55IzGbOcnfn+2UJoQswvzmHkczgpyudtdSAooX03OXDVgHaIsDRhCTzxVvhxnw==
X-Received: by 2002:a1c:7e43:: with SMTP id z64mr15109423wmc.43.1544006197486;
        Wed, 05 Dec 2018 02:36:37 -0800 (PST)
Return-Path: <leif.lindholm@linaro.org>
Received: from bivouac.eciton.net (bivouac.eciton.net. [2a00:1098:0:86:1000:23:0:2])
        by smtp.gmail.com with ESMTPSA id d2sm14383273wrs.97.2018.12.05.02.36.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Dec 2018 02:36:36 -0800 (PST)
Date: Wed, 5 Dec 2018 10:36:34 +0000
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Subject: Re: [PATCH v4] hw/arm: Add arm SBSA reference machine
Message-ID: <20181205103634.cvogkgjdzq7e3feh@bivouac.eciton.net>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvCN00LkSvmAY8nCtoGYrRDsALYRkg0x_yz6HaRgQkQn3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvCN00LkSvmAY8nCtoGYrRDsALYRkg0x_yz6HaRgQkQn3w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: wpXoL+oeIKak

On Wed, Dec 05, 2018 at 05:50:23PM +0800, Hongbo Zhang wrote:
> > > +static
> > > +void sbsa_ref_machine_done(Notifier *notifier, void *data)
> > > +{
> > > +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> > > +                                         machine_done);
> > > +    ARMCPU *cpu = ARM_CPU(first_cpu);
> > > +    struct arm_boot_info *info = &vms->bootinfo;
> > > +    AddressSpace *as = arm_boot_address_space(cpu, info);
> > > +
> > > +    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> > > +        exit(1);
> > > +    }
> > > +}
> >
> > The virt board needs a machine-done notifier because it has
> > to add extra things to the DTB here. You don't, so you don't
> > need one. Don't set bootinfo.skip_dtb_autoload to true, and
> > then the boot.c code will do the arm_load_dtb() call for you.
> >
> After test and check, I think we still need this machine_done callback
> to call arm_load_dtb().
> If only kernel loaded via -kernel but without any firmware, it should
> work to let arm_load_kernel() call the arm_load_dtb(), while in our
> case, we have have firmware loaded but no kernel, so the
> arm_load_kernel() returns before calling arm_load_dtb(),  that is,
> firmware runs and there is no chance to call arm_load_dtb(), then we
> get error message and qemu quits.
> Moving arm_load_dtb() to earlier place in arm_load_kernel() cannot fix
> this issue either.

I don't see the value in using -kernel on the SBSA machine.
If it causes complexity, can we drop the functionality?

Regards,

Leif
