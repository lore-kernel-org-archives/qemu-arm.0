Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6782201wrt;
        Thu, 31 Jan 2019 04:02:05 -0800 (PST)
X-Received: by 2002:a9d:908:: with SMTP id 8mr26853904otp.28.1548936125262;
        Thu, 31 Jan 2019 04:02:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548936125; cv=none;
        d=google.com; s=arc-20160816;
        b=BrKwyVzlpR9d+1AjJA2ZhEIeK4GlNqvgk2NQim8VcHQLgwptYNVDc/RiU1glRSb5CY
         my+uLay5ZU941fAIXRfTqA3WPMMevYYYOZB9tYDVOvMWdH2I+6vzeWOMShupxtT2sovs
         uJesv65eWGB+gtXu9AwDieW0KYVUgPBBOB9JhwgQYJhyRVE6O26R1VSAcaTtDqGrzFJA
         +BEENhZmCvoeb3BXkIjD3uKi8XwDcWqhsZmBknp8nqyHSkcQLROk2JeAkoW5Vu2OWgfA
         oFCAlmfSzx7v4q20l+CnTPgZYorjYKa1hUAnnk7ckYz5kEgalD3ofbDRj8Mn76C1v8z2
         rk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ynjsnciFralf6Bmf9SXjB4eRLOUAGotw5tZyhd5LCKY=;
        b=P8DoawJLX2Whd1ownaS2zZFqOUnlrFyn5c9ONVYojq9WzFPCLhrxLJu2evpW76gAp4
         HEgfBUvpxIldvIa71ch7eBc6AVqTqgNaU8NeCmZVwxlhVPDZhZhMOyMLHqZj8hN8z/t9
         qM2nC/yMwlg29kPMlJIHW7dz85TF+E/IoqOq7B0PPdSMaezgO7mNIL0UJUem4yRbGf2w
         MQaVP7MKE2fZwVBWKhgR3SJnwqcJFpaydBg2tc6mLguIcFzvtE/1UepY5QxgibwNgYXl
         osrR2HF/oNdGUeYDmavja0gR1p9SP7/dw6EwZcisNDOHAtgpicIsU2jkbW6JSC8YhpV4
         6xHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XtU9r3gF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i83sor2102314oif.115.2019.01.31.04.02.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Jan 2019 04:02:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XtU9r3gF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ynjsnciFralf6Bmf9SXjB4eRLOUAGotw5tZyhd5LCKY=;
        b=XtU9r3gFgo3bUEH4w0RJrQGsg+ZyUiLkb02g16d1lz4I5Ej22pJjBjnr5xiRGMEV3P
         ziVHeyyY1jZ8aCYtCkTBJ+h1ITT2/E42aydIy3hfSSzo4zAGwMFIxjz439uVPbLLZ+hX
         5IW5tYOQTmcQiDY2is2EOAqgzmeLEVqzW3Dvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ynjsnciFralf6Bmf9SXjB4eRLOUAGotw5tZyhd5LCKY=;
        b=nz39XCnCXsfpBc7CHOGmtWhAR4GUHmgRjCNmVSQ7q1VY3C1KNGElnV4K5nnHVeMryp
         Ojd3notLp04JmMNB/Brhu3QZuZSnaBpHmF6ZmFhYQHt+wvjV2dv/ES0s1AZKDJyyvU+m
         MITgg9gYh7Pc9MPMmyDpg0cJPsO6n+zJmPml4+FFjXxxTnSqB4Mf34qDSv0DmpQfqnS6
         rBXHDTWvVtGlW/kX/IzlsApVNOWg5DDO0n0L9moASLi/ArJaTcLkPW3sO9yWwmc4kGuH
         k5LQnovAtzi+BFGJPLAPs6FitcqAwxtayGVnSfBaOSqhxGtt+NuYHIGwCJ7b1V0P5SDm
         tq6Q==
X-Gm-Message-State: AJcUukfiynM8fEH9IpAutjOvec57DwTo8F7v9BIsUtg0APOcoiiNb8pS
	NNzmNBIQ8GZ1c+zdJfSd403gEyRojnFvroPmx3UcnOuE
X-Google-Smtp-Source: ALg8bN6mdRwKZnNpf22H+Qqy6UY5qg2s3ebu7H4UbIxN7Y91qy1mOY8XXguA0SGSQy+n4OKZsmy2rKkuPe03XhqBsv8=
X-Received: by 2002:aca:5c05:: with SMTP id q5mr14435971oib.146.1548936124876;
 Thu, 31 Jan 2019 04:02:04 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA8WF1nKfgQWZ11GgMzgLxOtGwoJS9zyeFQkm5ii5GLrpw@mail.gmail.com> <CAHmQWvCRfcP1z01OD4_EWVz6nYoYgvDiQKiQJ0puxGGreJchHA@mail.gmail.com>
In-Reply-To: <CAHmQWvCRfcP1z01OD4_EWVz6nYoYgvDiQKiQJ0puxGGreJchHA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jan 2019 12:01:53 +0000
Message-ID: <CAFEAcA8uZyW8i-5Enb_0AC04UEUrtjZ0Lk5Tr8XjXPCgVgwTfw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hw/arm: Add arm SBSA reference machine, skeleton part
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: x0/uXf/gmRrE

On Wed, 30 Jan 2019 at 08:59, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> On Tue, 22 Jan 2019 at 19:42, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > > +    [VIRT_SECURE_MEM] =         { 0x20000000, 0x20000000 },
> > > +    [VIRT_CPUPERIPHS] =         { 0x40000000, 0x00080000 },
> > > +    /* GIC distributor and CPU interface expansion spaces reserved */
> > > +    [VIRT_GIC_DIST] =           { 0x40000000, 0x00010000 },
> > > +    [VIRT_GIC_CPU] =            { 0x40040000, 0x00010000 },
> >
> > If they're just reserved you don't really need to list them here,
> > as they're covered by the VIRT_CPUPERIPHS space anyway. (You
> > don't list the VIRT_GIC_HYP registers or VIRT_GIC_VCPU.)
> >
> We need more consideration here.

Yeah, this is a little more complex than I thought.

> Why CPUPERIPHS is used to cover DIST and CPU interface? is this from
> some old platform? I don't see the term in GICv3 memory map in the
> user manual, so do we still need it for this Arm64 GICv3?
> If we only list CPUPERIPHS but without DIST, I am afraid firmware or
> driver developer still looking for the term of DIST for base address.

OK, so what CPUPERIPHS does (in the virt board) is set the
CPU property which defines the reset value of the CBAR_EL1 register.
(The size specified isn't used.)

The set of memory mapped things in this area should (in theory)
be the same as what the hardware CPU puts there, because guest
code can reasonably look at CBAR and expect to find there the
devices that the real CPU puts there. Unfortunately on the virt
board we don't get this right (and in any case we support multiple
CPU types which don't necessarily have the same set of devices).
Things work in practice because Linux and OVMF both look at
the device tree rather than assuming they can find things
via CBAR_EL1. This is awkward to fix in the virt board without
breaking compatibility, but we can get it right for this new board.

> For GICv3, what we can have are DIST, CPU, REDIST, VCPU and HYP.
> CPU, VCPU and HYP are not simulated for GICv3 (curious it still works
> without CPU interface emulated), so we only have DIST and REDIST.
> Can we only list the DIST and REDIST without CPUPERIPHS?

QEMU's GICv3 implementation only supports the system register
interface, not the memory-mapped interface. This is why we don't
have a memory mapped thing to put into VIRT_GIC_HYP/VIRT_GIC_CPU/
VIRT_GIC_VCPU.

For the Cortex-A53/A57/A72, the only things in the CBAR area are
these memory mapped interfaces that we don't implement:
  CBAR+0x00000 : cpu interface
  CBAR+0x10000 : virt interface control
  CBAR+0x20000 : vcpu interface
  CBAR+0x2F000 : alias of vcpu interface
(other parts of the CBAR+0x00000 to CBAR+0x3ffff reserved)

So for the SBSA reference board, I think the right thing is to
leave a gap in the memory map of 0x40000 in size for CPUPERIPHS,
with a comment that this is reserved CPU peripheral space
because we don't implement the GICv3 memory-mapped CPU interface.
Put GIC_DIST somewhere else (it is a GICv3 device register
bank, not part of the CPU's peripherals), and don't define
GIC_CPU at all (since you don't use it).

thanks
-- PMM
