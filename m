Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp100424wrt;
        Fri, 1 Feb 2019 01:29:28 -0800 (PST)
X-Received: by 2002:a19:6e0b:: with SMTP id j11mr29910179lfc.124.1549013368253;
        Fri, 01 Feb 2019 01:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549013368; cv=none;
        d=google.com; s=arc-20160816;
        b=KQ8EejI/T3dOWyueGdkUGIGoTtMYs+w33uNYVfy5nX7mVmxwDKrbzhN06novpyR9Pw
         p24PJA4ElYV0s+pgJSvlLkWjHTzLOuKlOpxBaHY9DdHfdM5qc5luNq7f4y24sfZqPxR1
         Ow71ak2+nAEnYy1KZtn4Egw6QiGsHug7u+agbGG/ZUB+DVTmlUBR6lUcBUsCiMHpnt0Z
         +ygqVPF2Pae+S3etoLI7tjsh/PKa0OQq6KbKi+JDbG7LcDULwZ5pN4N9IJCtS8cHDIll
         orlVmyf8vUwBHZnKoWnWNYXAcv5MLEzrWlpYjR+mks8rtR0lsyH90haQcRqG6ZppXdtE
         mYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WtickD4R4nGfDzLg2PtNzcMwuWLMoEhyUwNxBKHhe34=;
        b=n0oMyej6VOHc7Bbo7pmZLMMeam5x2+KeTlJ+/6EwYOeAyXDCTJjO20+dzOdAB+XhBH
         LmsoHnZHxlY4QO/SA2yiHoIFoAVGIe9A2GafsenRJ9DkKbRXr1fTOkU5SQLjvtrxk2Mo
         Q1GFuRe4vEn7ioKhf9DmVIRkhmf8tGAoM8bG+dTYH4ZhVJV7dCx1D8+TjCR6B0keRhY2
         HAnPbcolRo4ioVtfNE5f2ufNGPuU55/EPgOpPipghrBjrl8b95uKTFRY6J2BZhu9Qs4o
         91HyTD1hQg8T+ekmK1OROMbkL9ETvhjlSDvEQLE6TOGELKswJod24tHt5Oh9U29CJUqF
         +XTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSmjQSIZ;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e11-v6sor4844264ljg.24.2019.02.01.01.29.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Feb 2019 01:29:28 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSmjQSIZ;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WtickD4R4nGfDzLg2PtNzcMwuWLMoEhyUwNxBKHhe34=;
        b=MSmjQSIZVKvF4XmpivkhTNIVjmR5HaZ6uvrtCRW9TiZ3avOtoZigUHKjrO4gH+Qent
         xFTWKhpfrKQFyozDTjWZNknBZ1CQU2DVHIs2uhOF0QQyj6HoQKiISZec1ORM/+BF8sjg
         aMDfvvNAKr2Ihobj0J3sE3E74XF4yDQif99lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WtickD4R4nGfDzLg2PtNzcMwuWLMoEhyUwNxBKHhe34=;
        b=WB4nGrEtujM+z26n8asRbwbFY97fWELj9cQYZWiiVxBMs3e6jF0hVYp54WwMRpCRDA
         ltj3h8tTsLVNoGMFVQ0mCVGaJeiSa0w/uyd9IfvvL3UKNex0AllexK+bNRFOaF7HwAkB
         SBCZBLrIr6Vhej8mV8ZFBK3od3ZKRZQ9TVpVwa69/niuVUSZpLdCRGNP0/oATA7IfptN
         hdsdTRxu0QLg2GuuZmtAOuwLsJQY9jP+Wbh30Ov+TfT1OU4YEgKt9Tqpp2w8V/1xW+Rf
         hxaCWI2KCIVQjHxJ1QiUccmzHzQBcMEr3Pr5yy0rkMF472koBfyH46rHVP2SmDieuJg/
         g8Tw==
X-Gm-Message-State: AJcUuke5imMAnMm0eiC/oxvWWDJZCyuZZPHelR01oF8NVDYp9vjupqYo
	z9WShBRUF9lwFcYYfzHLIlpIuif7pagNSKQGiHfN/2/U
X-Google-Smtp-Source: ALg8bN6ge/EQp3sllH1/LjzaQvniDU+xlWeP2aQods2vULcxX/KUltLSlLQLumOoewF0TaygH+M9IIS/bRL7pg3JKOA=
X-Received: by 2002:a2e:c41:: with SMTP id o1-v6mr30945201ljd.152.1549013367776;
 Fri, 01 Feb 2019 01:29:27 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA8WF1nKfgQWZ11GgMzgLxOtGwoJS9zyeFQkm5ii5GLrpw@mail.gmail.com>
 <CAHmQWvCRfcP1z01OD4_EWVz6nYoYgvDiQKiQJ0puxGGreJchHA@mail.gmail.com> <CAFEAcA8uZyW8i-5Enb_0AC04UEUrtjZ0Lk5Tr8XjXPCgVgwTfw@mail.gmail.com>
In-Reply-To: <CAFEAcA8uZyW8i-5Enb_0AC04UEUrtjZ0Lk5Tr8XjXPCgVgwTfw@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 1 Feb 2019 17:29:16 +0800
Message-ID: <CAHmQWvCBwZEWSvp3J8L7yTU-3HWxjXTqAR=bdCw=aJrTc=OMuw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hw/arm: Add arm SBSA reference machine, skeleton part
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: TnZWqtyQvx6h

On Thu, 31 Jan 2019 at 20:02, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 30 Jan 2019 at 08:59, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > On Tue, 22 Jan 2019 at 19:42, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > > > +    [VIRT_SECURE_MEM] =         { 0x20000000, 0x20000000 },
> > > > +    [VIRT_CPUPERIPHS] =         { 0x40000000, 0x00080000 },
> > > > +    /* GIC distributor and CPU interface expansion spaces reserved */
> > > > +    [VIRT_GIC_DIST] =           { 0x40000000, 0x00010000 },
> > > > +    [VIRT_GIC_CPU] =            { 0x40040000, 0x00010000 },
> > >
> > > If they're just reserved you don't really need to list them here,
> > > as they're covered by the VIRT_CPUPERIPHS space anyway. (You
> > > don't list the VIRT_GIC_HYP registers or VIRT_GIC_VCPU.)
> > >
> > We need more consideration here.
>
> Yeah, this is a little more complex than I thought.
>
> > Why CPUPERIPHS is used to cover DIST and CPU interface? is this from
> > some old platform? I don't see the term in GICv3 memory map in the
> > user manual, so do we still need it for this Arm64 GICv3?
> > If we only list CPUPERIPHS but without DIST, I am afraid firmware or
> > driver developer still looking for the term of DIST for base address.
>
> OK, so what CPUPERIPHS does (in the virt board) is set the
> CPU property which defines the reset value of the CBAR_EL1 register.
> (The size specified isn't used.)
>
> The set of memory mapped things in this area should (in theory)
> be the same as what the hardware CPU puts there, because guest
> code can reasonably look at CBAR and expect to find there the
> devices that the real CPU puts there. Unfortunately on the virt
> board we don't get this right (and in any case we support multiple
> CPU types which don't necessarily have the same set of devices).
> Things work in practice because Linux and OVMF both look at
> the device tree rather than assuming they can find things
> via CBAR_EL1. This is awkward to fix in the virt board without
> breaking compatibility, but we can get it right for this new board.
>
> > For GICv3, what we can have are DIST, CPU, REDIST, VCPU and HYP.
> > CPU, VCPU and HYP are not simulated for GICv3 (curious it still works
> > without CPU interface emulated), so we only have DIST and REDIST.
> > Can we only list the DIST and REDIST without CPUPERIPHS?
>
> QEMU's GICv3 implementation only supports the system register
> interface, not the memory-mapped interface. This is why we don't
> have a memory mapped thing to put into VIRT_GIC_HYP/VIRT_GIC_CPU/
> VIRT_GIC_VCPU.
>
> For the Cortex-A53/A57/A72, the only things in the CBAR area are
> these memory mapped interfaces that we don't implement:
>   CBAR+0x00000 : cpu interface
>   CBAR+0x10000 : virt interface control
>   CBAR+0x20000 : vcpu interface
>   CBAR+0x2F000 : alias of vcpu interface
> (other parts of the CBAR+0x00000 to CBAR+0x3ffff reserved)
>
> So for the SBSA reference board, I think the right thing is to
> leave a gap in the memory map of 0x40000 in size for CPUPERIPHS,
> with a comment that this is reserved CPU peripheral space
> because we don't implement the GICv3 memory-mapped CPU interface.
> Put GIC_DIST somewhere else (it is a GICv3 device register
> bank, not part of the CPU's peripherals), and don't define
> GIC_CPU at all (since you don't use it).
>
Yes, should like this, thanks.

> thanks
> -- PMM
