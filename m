Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2237924njc;
        Mon, 4 Nov 2024 08:30:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbjMK+i76QGDuVqCdh2sQcbhWLVfvJ6sd7NELUMjKfG+xkvscxg7cXrdpNjg4eZGfnAAHBk0C7JMbJcA==@linaro.org
X-Received: by 2002:a05:6000:4006:b0:37d:3171:f2d4 with SMTP id ffacd0b85a97d-381bea1c0f9mr15670101f8f.43.1730737829158;
        Mon, 04 Nov 2024 08:30:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730737829; cv=none;
        d=google.com; s=arc-20240605;
        b=AKB0iqEY8mdAsbj0IN6S/Guh3A5XgMPkTlm/oqBwtlts7AXTw7HxDjBpLGKptn/suf
         0kZ0PBoY4jEFvShjSe3nmCDgkrjs3cRi2yVhmoyCCXEuFS+cQhiGouXrLWHLPQXJsBPo
         cEAU9QcIJt5iFEc0waPeg+J9uHlSU2tedhHPWFzYvzZqaQ3MkbdEIQL+bDy6AGdROatv
         gg5dxMoHywYrElgjj8UgqTrIaQ9HtpUJ1m+gSOfw7SeC5yMJaI1ZVx+qiC6p44rorycZ
         fvULU6fUNSs1M+8XgH6AsRRBs7VSfqsVYHEdtHbIaQPE2x93f7r7eysfZEbphaKRFC8D
         K5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=81MEKb96Xf23UJSyBQxdF8diKY/hHJyzem6vpJzEVks=;
        fh=YlQXsl84LpwH4LQ6pq1cUf760d9weJp/8oAm4vrnDjo=;
        b=aMbwbY5CNcIF7z+YpqpvKWZv43EdnylVpVSA3pxMmcKoBARPEtZXyzZ20iI4Aj4MK/
         uUHJbOgvLwT7p13/Rrak2PJ9YFuAJ9RvhApf1TqU9Lq3GMrKebU6cyAUvfYWQWrmd8Yg
         X4SSdlvfZwqcFWynPE6cO+3+ZGd8pp4z9UJ9qDsnBNxOE6QNfG3pgyk79r0/t/LeHn2A
         QakfPVb6Mxff+55dHQTfV1HwMClGtqBedg3fi+y9lhqbXDRvHmXP+bGS/cDC1M5hYhVE
         C3CmuwfTC2w1HV+hY5CV8lZmeoO5hmZkX4ETHZVQKlbDMP2PV0sNGgm5Ivl6ukMPzKJd
         vNsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dX6rYB/x";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381c119ed00sor3709303f8f.8.2024.11.04.08.30.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 08:30:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dX6rYB/x";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730737828; x=1731342628; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81MEKb96Xf23UJSyBQxdF8diKY/hHJyzem6vpJzEVks=;
        b=dX6rYB/xaYbg64TNPtBa0sDz3A6P8+BPuQ3y4M5o2YRqr4jKw6zj/wg+gLinQsePDj
         Pe/ikHlKQNgM8R9qeTFBsWAY6kyknCkyZtlmnhvpLMZAV7xJx3trcXl7zDtB6DZ/Fo4k
         sAdpwJYnLClmdr5U3Vy56n/g4zXHTpM2X/CCeddMTf1CVcYR3NUrMHOl8SAsuM5qg+qG
         r7Bh+79Z9T5qM3dqdMvhigxdFEuQS7jYEVbGdwmyxUWJpkndQtegjxHcavxs1tADkuBQ
         T1Ksn9tP6CQ26dvbgNR1jcsZg125CFxyEYQS7DRnJK4LYBFebPHQJZVA3rjlWMJLm5w7
         oIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730737828; x=1731342628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81MEKb96Xf23UJSyBQxdF8diKY/hHJyzem6vpJzEVks=;
        b=f2pgH3V78OG8zXVxFCWAvvHLLyKibCmsfKJEVq3t6ZJBQE8Ln9m0C4mT8OCoPTJ487
         dVhQUYP0b96eEK/AYOmVTVAfF3kC2az3qbXUnqtOzHE9zV8Vk0x0oDyH663+/4WDzPPJ
         7X1GpmHHoDGNnIWtAPfaCI8YQRpW9471Jdo4S5JKCGAgO2/loeZDeJRVnKFqPVIp5vEK
         qPaC1cu3zmnv2iQ2FOe0SbVOSHk+gI9buYCMZRUl7EwUTT6ZqbF2IGrpkqY0wK2ydbG8
         I6xWJ+21HWXK/F2mvZZfA4JW4a6Z9BsbtRH9GbYFcEgBPmc/u2gUbxz6oWgODmw1vVeb
         0/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeqImahbalAW+gdqnN4Hzl6BRuFMEGb3t8RT19RNa5K2NdODtEGQgjJwgC0p0ee6bwU6CduhKAKRM/ig==@linaro.org
X-Gm-Message-State: AOJu0Yxg1KasOotbYoksAq3ppMUb87DglkKg9hOKzMb7fKafc7bv7mVK
	+8lZICJUWE2z7YLpre5tDtgIenshdl70AlmlTUp9NJR/KJKREf//ka4tgQxGC/J8q3yRiAyAEIF
	XSV8cpkkrUBmESCtXWb8Qt9WSK7nxATCiw0KEou7s
X-Google-Smtp-Source: AGHT+IEju2LhnIlbLomjmkieAVQZclJMFur7ko24mfBkDSRB0/zezLDP4oMRlXLwj9h5AjtXpFCyqKny28HPJkpERnQ=
X-Received: by 2002:a05:6000:1569:b0:37d:3777:2ac6 with SMTP id
 ffacd0b85a97d-381be7d9781mr13788713f8f.35.1730737828579; Mon, 04 Nov 2024
 08:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com> <Zx__Zi3Zpg1AspnE@pinwheel> <52690aae-55b6-47d5-a308-dd75475f8377@redhat.com>
In-Reply-To: <52690aae-55b6-47d5-a308-dd75475f8377@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 16:30:17 +0000
Message-ID: <CAFEAcA9y5ooPNZ7JbGmRyTKbZn5XPK+5zZgVAvnER=++kWuBrg@mail.gmail.com>
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
To: eric.auger@redhat.com
Cc: Kashyap Chamarthy <kchamart@redhat.com>, eric.auger.pro@gmail.com, cohuck@redhat.com, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, 
	richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	oliver.upton@linux.dev, sebott@redhat.com, 
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, berrange@redhat.com, 
	abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com, 
	mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: BH36urXUZ5rf

On Mon, 4 Nov 2024 at 15:34, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Kashyap,
>
> On 10/28/24 22:17, Kashyap Chamarthy wrote:
> > On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
> >> From: Cornelia Huck <cohuck@redhat.com>
> >>
> >> Add some documentation for the custom model.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> ---
> >>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
> >>  1 file changed, 47 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> >> index a5fb929243..962a2c6c26 100644
> >> --- a/docs/system/arm/cpu-features.rst
> >> +++ b/docs/system/arm/cpu-features.rst
> >> @@ -2,7 +2,10 @@ Arm CPU Features
> > [...]
> >
> >> +Using the ``host`` type means the guest is provided all the same CPU
> >> +features as the host CPU type has.  And, for this reason, the ``host``
> >> +CPU type should enable all CPU features that the host has by default.
> >> +
> >> +In case some features need to be hidden to the guest, ``custom`` model
> >> +shall be used instead. This is especially useful for migration purpose.
> >> +
> >> +The ``custom`` CPU model generally is the better choice if you want more
> >> +flexibility or stability across different machines or with different kernel
> >> +versions.
> > Does "more flexibility or stability across different machines" also
> > imply "live migration compatiblity across host CPUs"?
> yes that's the goal
> >
> >> However, even the ``custom`` CPU model will not allow configuring
> >> +an arbitrary set of features; the ID registers must describe a subset of the
> >> +host's features, and all differences to the host's configuration must actually
> >> +be supported by the kernel to be deconfigured.
> > [...]
> >
> >> +The ``custom`` CPU model needs to be configured via individual ID register
> >> +field properties, for example::
> >> +
> >> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> > If possible, it would be really helpful (and user-friendly) to be able
> > to specify the CPU feature names as you see under /proc/cpuinfo, and be
> > able to turn the flags on or off:
> >
> >         -M virt -cpu franken,rndr=on,ts=on,fhm=off
> >
> > (... instead of specifying long system register IDs that groups together
> > a bunch of CPU features.  If I understand it correctly, the register
> > "ID_AA64ISAR0_EL1" maps to a set of visible features listed here:
> > https://docs.kernel.org/arch/arm64/cpu-feature-registers.html)
> Not all the writable ID regs are visible through the above technique.
> But indeed I think we converged on the idea to use higher level feature
> names than ID reg field values.
> However we need to study the feasibility and mappings between those high
> level features and ID reg field values.
> The cons is that we need to describe this mapping manually. Besides
> being cumbersome this is also error prone.

You might be interested in "Arm Architecture Features" on
https://developer.arm.com/Architectures/A-Profile%20Architecture#Downloads
which includes a 1.8MB Features.json which is a machine
readable version of the "what are the features and their
dependencies and ID registers and so on" information.

But note that (a) it is alpha quality and (b) I am not personally
going to try to interpret what might be reasonable to do with it
based on the legal notice attached to it: that's a matter for
you and your lawyer ;-)

-- PMM
