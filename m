Received: by 2002:a05:7108:4017:0:0:0:0 with SMTP id a23csp2693337gdh;
        Tue, 23 Aug 2022 06:09:54 -0700 (PDT)
X-Received: by 2002:a81:7702:0:b0:328:297a:fdcb with SMTP id s2-20020a817702000000b00328297afdcbmr25428342ywc.335.1661260193397;
        Tue, 23 Aug 2022 06:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661260193; cv=none;
        d=google.com; s=arc-20160816;
        b=0VhvWDYG9OFu9KI7EYxZmhQ+XBp9xNg07x0V+GeaNNhJNU4vqatzxdO3Ied4+KSmbc
         iEm6O5LJJeY79yJGi/CqzbbmISUCvaS9wqAh9KKD+vl9tw+lArhS6WKXZ05O4eVD8AgX
         bx6iiDgi8roS3lcOeiskB+DKXPc9U1vDRZfpSela8jHgnqAoPPU169eUMZrTtjZpVzJG
         1/irdYtPaWvMBKjTNCET7FGCjWd9pAQ5mQOauaijAlqGOiePK4E79b7U63v4B1jCLHWi
         FXYtHnMnWJAzsV+dBk2qbVKWWLkf2kkKls3fnvAq3aAPzdNFdxwFIrn5dOhUAZy16gOJ
         Jowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l6D4OkRsSxRrpdxS778PHcilllcgsWp5HtxIEzGoemY=;
        b=swQqxiik2szWoyPgaj5wlzQbEIxbXTaQwkvtaibP2w8J8TVV+4BqidFS1qVnFUFvsX
         AdTMOITAawmbJhmL74O+sQ25CrIGisiSFispMikADxHZDqTJzixqYgaF4Jhfd3w0oKkd
         WA/oOZrGiopGA2Nf0RXwGW91bPtmGl1Zwh5LMOsciNdggGx5aOzUAa5wH5AefFHSzsYk
         pLqhtREnptQPqLPfPj99L0k7keqS4TI0DjhdhxlIjUoBKdKrNsQr/rYpE3+5fTI24aTJ
         wx/Lv0YpuztZJVAkyttduG1WUpSL32vmOW35Oe1QWUr7eXcKbNIDq/BokJyV/1xzT2Fy
         hwAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9NZJvY7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i17-20020a25be91000000b00683e1ce371esor6730272ybk.17.2022.08.23.06.09.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Aug 2022 06:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9NZJvY7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=l6D4OkRsSxRrpdxS778PHcilllcgsWp5HtxIEzGoemY=;
        b=L9NZJvY7kMoaAbOA5oTpmdFYAU6SKs95nq+5Q5j6TkmWUm8firZdonlzNDma42u68f
         AdNMbiy4PTmwehlLFuD5icqdB8TG5koDBJqcEULisNE8HwK74N6jmMKttTWByTKCZ+BN
         qY3qUxQPobZlFtfd7JxRTPwG9DRJcNcMsLg7ALjg7b2wmKee1/3Qm/tmcSNBSFkOec4w
         TneH5UeeUoKQofvHLNVfGlrND+W/9CqDLDjz+cXZHyAroSb4w3C931l3IZOJLjTAM+rJ
         +i+v0K+XFpIcJtupdiuVB+jf1xn2Gbtrb4y/8QzcPzJeVP/8Synq5Z3p67V9/G+7BiqR
         qW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=l6D4OkRsSxRrpdxS778PHcilllcgsWp5HtxIEzGoemY=;
        b=6CjBHDJEkZGpHuz+29ksoM3wlKdgCEAO8nLJP3svyMVDpGfUDBPxOXH2OqBIZxT72e
         lZqWIx01786QQGhjqvGSkCbUeLafOgLk3uKEwmjivK1dcH3Hj1G4NcsclvHpzLYUaSfF
         hEL8I8eybZeGdWKwM2HtZXz8fvUYXqRPxFc26whdYiSRi5RjgdW5LsDkbDnXi7zcN3yE
         x0A6CVeL6WQRktmlW41gejV2ATfYK2WsUYreRBPm49z/KufytSAmK0Ra5Id1HjZSyixI
         CdGwnYRD50PbV+wBlaV5TCRrsZHqnD3GKn03QeUjHcfVxlY0eeSuTzjPGMtt05FbTg5o
         bklw==
X-Gm-Message-State: ACgBeo1LCLUMQivTEDkrNPNZcKTdvcuP5WrbpyPa1kyQ8lONiSF50b0o
	IoBb32iYu07l/XeNbgbx4opuHdPtfOGRyMRxL5oGVFvj
X-Google-Smtp-Source: AA6agR4wf1NBp4Fo6j5Vk3mJFoXAjbgojAnt3+xDe+2riUwFpwtzJ1obLLhK2jaJHbC+xIvHeM7f07V01GLjXmAUeF0=
X-Received: by 2002:a05:6902:10c3:b0:695:e4a3:ea8f with SMTP id
 w3-20020a05690210c300b00695e4a3ea8fmr4848244ybu.288.1661260191530; Tue, 23
 Aug 2022 06:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org> <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
 <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
In-Reply-To: <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Aug 2022 14:09:09 +0100
Message-ID: <CAFEAcA8TmrMo+MOhOutUuwE=GOEFYUGxgRA2_XGZ2iunMTAe5w@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Shiny Saana <shinysaana@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: SkzEhUo+wk53

On Sun, 21 Aug 2022 at 01:05, Shiny Saana <shinysaana@gmail.com> wrote:
> I've been able to write an initial Teensy 4.1 machine, for now with
> only the few important memory regions initialized, and successfully
> ran some hand-written ARM code on it.

Great, that's good progress!

> The documentation ( https://www.pjrc.com/teensy/IMXRT1060RM_rev3.pdf ),
> in section 9.7.1, gives some informations on how, in the actual
> Teensy board, the ROM, executed at boot, initialize the board
> peripherals, and also reads from a data structure included in the
> Flash memory (the user-provided program) where the CPU should jump
> to after the ROM has done its work (somewhere in that same Flash memory,
> usually).
>
> I was able to successfully dump the ROM of the real board and
> confirm this behavior. Given that the current plan is not to
> emulate every peripherals, I am of the opinion that writing a very
> simple ROM that merely reads this Flash provided data structure and
> jumps to the provided address sounds like a good starting point, so
> that I can keep iterating on writing more and more complex code
> through the provided Teensy toolchain, and implementing needed
> peripherals.
>
> As such, I have several questions:
>
> 1/ To replicate this behaviour, is this considered the correct
> approach by the current QEMU maintainers?

Yes, I think this is probably a reasonable way to go.

> 2/ If so, I have not been able to find any function that would be
> able to load data into a memory region "statically". Does one
> exist? Is there an alternative to this process?

Depends exactly what you want to do. If you want "let the user
load data to an arbitrary address", then the "generic loader"
is usually helpful:
https://www.qemu.org/docs/master/system/generic-loader.html

If you mean "C code within QEMU loads data to a specific place",
rom_add_blob_fixed_as() is probably what you want. This is how
hw/arm/boot.c loads both user-provided data files and the
hand-coded mini-bootloader into the guest.

> 3/ Regarding loading the "kernel" of the board, as part of the
> init process, I am calling the usual "armv7m_load_kernel" function
> with its usual parameters. However, it seems to load it as the
> very start of the address space, which is not where the flash
> memory is, and so is not where the kernel should be loaded. I
> wasn't able to find a workaround. Is there something I'm missing?

The behaviour of armv7m_load_kernel() depends on what kind
of file you pass to -kernel. If you pass -kernel an ELF file,
then it will get loaded to the addresses as specified by
the ELF file, so you can use that to put data anywhere you like.
If you pass it a raw binary file then, yeah, at the moment
that gets loaded to address 0. There's no real reason for this
limitation -- it's mainly because when that code was written
we supported very few M-profile boards, and all of them booted
from address 0. (That is, the board doesn't set either the
init-svtor or init-nsvtor properties on the armv7m object to
anything other than 0.) We could change how this works, but
the difficulty is that the desire for "Just Do What I Mean"
behaviour for a specific board tends to conflict with the
desire for all boards to behave in a consistent manner.
In particular, at the moment passing a binary file to -kernel
means "I want this to be loaded so that it has the
CPU vector table in it and execution starts from reset as
the architecture says it should"; it can't both mean that
consistently across M-profile boards and also mean "on the
teeny board, be an image file intended to boot via the ROM
loader".

Loading the teeny images via the generic loader rather than
via -kernel would be one way to sidestep this issue...

Do you know what the hardware sets the initial vector
base address to? (that is, where the ROM itself puts its
reset/interrupt vector table). I couldn't find anything in
the datasheet that said that.

(By the way, calling armv7m_load_kernel() is mandatory even if
you don't care about loading an image, because it's the function
that arranges that the CPU gets reset correctly.)

thanks
-- PMM
