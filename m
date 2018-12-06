Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10076380wrt;
        Wed, 5 Dec 2018 17:51:07 -0800 (PST)
X-Received: by 2002:a19:f204:: with SMTP id q4mr16651624lfh.133.1544061067918;
        Wed, 05 Dec 2018 17:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544061067; cv=none;
        d=google.com; s=arc-20160816;
        b=UJZw0/1TLlcF9/bKPRBFa7QZ/WXw/GWJgKkWso5ggflLCa7fZ8v24tdOmmbEjdwmdM
         g3vRLJxQYM7I0iH9yhDsnIe4mP3nAqwotcAsWglllCz+I2w+S4v74LI+rSBdgut9MRS7
         f0ni1HTmU5n9hrVn4QhegHbVctRLbnbospacl4U9wUIcFAXOhPNtt7dil302I3Vp34aN
         MQ+gXg3thdwFIYEu7YsJ8N+AAJPUXQuVXOYkmRZfe74ALOzQauKORNrdZmiK94QPPnCk
         IvyctlPj+VfZivuojuUqGDJu6Ebkw+cFAkmnu6hmVqV78wJCEhJlO7aFhJ3J2nrzUDpd
         GUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P11jkDCaM91tUWObbpXfpgj5QkHnvZwfx+LDqvE4ITQ=;
        b=01la0zHawAjgithWdpul5QjL9y8hjDqIyID44xAnWqXgJB4C3MgS4G1L5a8XFWfUw1
         Ke5e7aA+oFb7638bnSQ2bVEk9Aaj0TFdakkoliid4y+sSCidgpwTd8/d5oOAvyOYic0h
         z07JdHTl8XyIb/FrhwaqNm84W0W8TirzwTtYB+PnESNa+6h3W5FnZrzAwGt7dy48N2LR
         k72JcHyKH6ZKRMTPVwgpbr3fHAfosvK/PdK/Yqe5fz+jMAEj4vP+GnqoKs355q9wrUi/
         O+gXV6b7KbqdxUh57Yp/lYlNmv2c6uWCN3Cr6ECqWuxRwsLN7xA7tmTDIlSfuSY4etdi
         QxRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IcrFs6Jm;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c7sor5434893lfk.50.2018.12.05.17.51.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Dec 2018 17:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IcrFs6Jm;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P11jkDCaM91tUWObbpXfpgj5QkHnvZwfx+LDqvE4ITQ=;
        b=IcrFs6JmGjFum587mWc/8m9XmMQT+NY1xmlYhVfkelOP6uTa1oqF0Lb5xHSkkTtiVE
         UlDrbHwZ57ST89nBjxdZ0zzjmSUzW3YB4RIJWHaS0eS31vsXD2BNWQOxtluUGdsFH7oc
         Xphc3C5P2ZKjffv/DyMW8kMjmcBNySpsUfiB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P11jkDCaM91tUWObbpXfpgj5QkHnvZwfx+LDqvE4ITQ=;
        b=DadFnTi/KP4E4dTnhP04SaSM9u8wdLm0GZ5zbeEbp4c/aXVSsTsFulT9hqNhzGjB5Y
         TZqcDihBtbxQX4mkqEO8FP0PS8TU4gz649mxnBAvkggM9Js5Ml4WeNjkgu4kRtG4gL8L
         MPZWWtqKL4KmgUA1zRtK7qVGjhfvBfojPyTD3X0EGRVvhfYlOQOQXgDvCA3aL98hMuJ5
         6BxYVgL6ufmplnksuONpHYeGPl9v5vJf2iB8wPhvDMSc2jcCEuX7VsA3krAJeaOao3oj
         2lZCJJ/6u8qJf57w3kUBg9tcArGDcokrlbFz64kXSEuMo+C7V+ArEoVMcDBZUdjSJYQX
         6ZLQ==
X-Gm-Message-State: AA+aEWasKhBrxaDIdj3kW75b+szGJvPeahWV06oNd+Da96AB2W2Zc724
	HsXPlsQgO5yslY66OA8dCWvxj7PXMw85bi352RmWRXk5
X-Google-Smtp-Source: AFSGD/WxG/x3XPiw+Cmuay5ZkZsqKmunBLCq4IOOnfUp4qof6/pdG5bQXbTLnP/FIr1CHY8PDdECAx3F4kqWGnL1EZ4=
X-Received: by 2002:a19:5f1e:: with SMTP id t30mr15004655lfb.76.1544061067419;
 Wed, 05 Dec 2018 17:51:07 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvCN00LkSvmAY8nCtoGYrRDsALYRkg0x_yz6HaRgQkQn3w@mail.gmail.com> <20181205103634.cvogkgjdzq7e3feh@bivouac.eciton.net>
In-Reply-To: <20181205103634.cvogkgjdzq7e3feh@bivouac.eciton.net>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 6 Dec 2018 09:50:54 +0800
Message-ID: <CAHmQWvDvx7GB4+t3EGXcmR1-VLYW04Pu94EX0i7cov9Agv2F8g@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: GQsiz/axM0ms

On Wed, 5 Dec 2018 at 18:36, Leif Lindholm <leif.lindholm@linaro.org> wrote:
>
> On Wed, Dec 05, 2018 at 05:50:23PM +0800, Hongbo Zhang wrote:
> > > > +static
> > > > +void sbsa_ref_machine_done(Notifier *notifier, void *data)
> > > > +{
> > > > +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> > > > +                                         machine_done);
> > > > +    ARMCPU *cpu = ARM_CPU(first_cpu);
> > > > +    struct arm_boot_info *info = &vms->bootinfo;
> > > > +    AddressSpace *as = arm_boot_address_space(cpu, info);
> > > > +
> > > > +    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> > > > +        exit(1);
> > > > +    }
> > > > +}
> > >
> > > The virt board needs a machine-done notifier because it has
> > > to add extra things to the DTB here. You don't, so you don't
> > > need one. Don't set bootinfo.skip_dtb_autoload to true, and
> > > then the boot.c code will do the arm_load_dtb() call for you.
> > >
> > After test and check, I think we still need this machine_done callback
> > to call arm_load_dtb().
> > If only kernel loaded via -kernel but without any firmware, it should
> > work to let arm_load_kernel() call the arm_load_dtb(), while in our
> > case, we have have firmware loaded but no kernel, so the
> > arm_load_kernel() returns before calling arm_load_dtb(),  that is,
> > firmware runs and there is no chance to call arm_load_dtb(), then we
> > get error message and qemu quits.
> > Moving arm_load_dtb() to earlier place in arm_load_kernel() cannot fix
> > this issue either.
>
> I don't see the value in using -kernel on the SBSA machine.
> If it causes complexity, can we drop the functionality?
>
We don't use -kernel parameter on SBSA machine.
It doesn't cause complexity,  we were suggested to drop the previous
machine_done() callback to reduce code lines, but I think we have to
use it still.

> Regards,
>
> Leif
