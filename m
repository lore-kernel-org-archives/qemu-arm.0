Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp3089085lfj;
        Tue, 18 Jan 2022 11:42:08 -0800 (PST)
X-Received: by 2002:a05:6000:1862:: with SMTP id d2mr25528125wri.337.1642534928436;
        Tue, 18 Jan 2022 11:42:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642534928; cv=none;
        d=google.com; s=arc-20160816;
        b=WFtAhQsrYYhJKwXrvoIHod9f0h7IVcNTcJYq/VwjGoKE0smvvE88uTlhneEwps+s+P
         FXhItgnq89I6ZuinbXZH4RuGmDQY9eAG5RmflrmkEsi5gq5ZjHJwQqjWX6O208pVIZ5T
         hpTKkDxsaOdwQUEFjwoxOr+UIMH1V0KL0cJiUyL04Oi17pPmXBAfioiaJ88uxBMR0Yym
         jqycaAkSPFAqeklTc3rRcpzUsXwmYwXy+Pa+PfHQWrhgSp0J9ZT8rjoQP8qrGA7jnvHA
         NF5CNw+H2GOkg//rDqDKOSfIyXfuxc6JiYMm2PYuT0L4wGA3aD9dFTEVzu70uUYy8TKg
         sdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bVxUUPk+/IN4XX9Y+l2cv7mBXCaWlv920qPi2CqZPZE=;
        b=ROml6DWCJtkZjN0VhR/MznZ0GF/iOafUdGdr85hUjkoC97A6XQ3fBWI5g+mfcCeDiM
         a89suFrdPg72s8P0G2NF9Nb7zhwoFgqcDE+95wem9BusCoTDaxPH0DxG0xwHlnNras2/
         YAgDFw4UFlUkD939RoH0uEb7DLM6UOVQbw8BLdAgmNiW4HE8VV2loXmSlX4v/jsN+IM4
         AfyBOkiT/veuqm2t2V5t1n9KJue19l+wnR0Vqf836TAKjpuKqQyeOkyCiDI/ru9RTDNc
         KbV8PRuVi7BU3ODERQfGXD9I8g46mRMBuwfMysIw9NCSzSk/TFM9ZDj1kcFn4ywaBic5
         Pcsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sGzzfyTU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m18sor1684323wms.27.2022.01.18.11.42.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Jan 2022 11:42:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sGzzfyTU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bVxUUPk+/IN4XX9Y+l2cv7mBXCaWlv920qPi2CqZPZE=;
        b=sGzzfyTUeryJ4dxMv+qbRTpXzBS7GYnzE4VMJ17ev9tFUY3/FrxGB2I+ICNeix2+1J
         G3c+ZKPNBn8uNXQA6wUAqbVQz5Dg5eOy/g1oIPPdE7YYpsIkkYsRtllnClKPJ7MWt1fN
         Tl0hzDkxcYUxeqJAhaPqdkHF5bDxp0U4epubfhZ2AQg/D0RjW3Za13cheU/CGRIqMbGM
         H70I5JL+LgwVItN8cQvvPbR+IaGTBXej4IJtxhfeiu8PxARXnDXHwfVUyjj9OThjCWOI
         /CMfc9mOfvEsUEvDfA2PuBgsnYWWmMZ5F1qz16u2IH1rVUn3gGasHU+Z55NQXUrckMjJ
         /Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bVxUUPk+/IN4XX9Y+l2cv7mBXCaWlv920qPi2CqZPZE=;
        b=ZX7JWmrecbrCgmjaz0gN8l1eIIU2KYpk4lVIaZ2Ja8FUG+kbNkTGBEtVurMvIovVNO
         TRKH/s5D7f+0IeEsJGC2KKOyhSRuIGLyH3YasQY5L+5LZwrFUQKTjCaBSv1utKSJJBsi
         YMmOapwsRZwZ/vqbgbfXNVID00ul18AHnqKR5os9y5+a+DmmkVgma6zWf+ZWkGPoibMD
         5ufyW+9Porz0Gj2SfhJ2CMjtlXr7ZBGsR79KqtpDJRYgwUI4WhWk5bb0q0R9VoPENisY
         rzVnIdXhEEPtMeTnql6813/0ceNBJIfgUykBCg46PH3JuOi+Ac9+0kwhXH74OjXICMKz
         Mq4Q==
X-Gm-Message-State: AOAM5314re6DUMzu+xYCv3/9cGPYSb3EZV9OJtC2l0bvLDfjs5VeV3qK
	gIq4R327wA0dkwA6U52GQkH+mFD1lo0zldJISCuUuwzZk/ASHg==
X-Google-Smtp-Source: ABdhPJxfh+oHSuA2nPWFWybQqziZnkTy91zjXMm0DxwdYJwUnpAMZ8UEW56WO6QfdQ+027n5iuhMWrYAaEbqczFrCpw=
X-Received: by 2002:a05:600c:3544:: with SMTP id i4mr84579wmq.21.1642534927973;
 Tue, 18 Jan 2022 11:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20220111171048.3545974-1-peter.maydell@linaro.org> <87pmop7xfw.fsf@linaro.org>
In-Reply-To: <87pmop7xfw.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 19:41:56 +0000
Message-ID: <CAFEAcA-ncYCtpH2aCjd4GWuN9SLcxGMQUOutBWyNHByD6_gG0w@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Shashi Mallela <shashi.mallela@linaro.org>, Andrew Jones <drjones@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, andre.przywara@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: r1Dy3D8M80kC

On Tue, 18 Jan 2022 at 17:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > I've been working on the ITS to add support for the GICv4 functionality=
.
> > In the course of that I found a handful of bugs in it and also some
> > places where the code benefited from refactoring to make it a better
> > base to put in the GICv4 parts. This patchset is just the bugfixes
> > and cleanups, because there are enough patches here that I figured it
> > made sense to send them out now rather than holding on to them.
> >
> > Most of these patches were in v1 and have been reviewed already.
>
> I've reviewed the patches and they look good to me. kvm-unit-tests is
> still failing some tests but the ones it fails hasn't changed from
> before this patch:
>
>   =E2=9C=97  env QEMU=3D$HOME/lsrc/qemu.git/builds/arm.all/qemu-system-aa=
rch64 ./run_tests.sh -g gic
>   PASS gicv2-ipi (3 tests)
>   PASS gicv2-mmio (17 tests, 1 skipped)
>   FAIL gicv2-mmio-up (17 tests, 2 unexpected failures)
>   FAIL gicv2-mmio-3p (17 tests, 3 unexpected failures)
>   PASS gicv3-ipi (3 tests)
>   PASS gicv2-active (1 tests)
>   PASS gicv3-active (1 tests)
>
> That said running with -d unimp,guest_errors there are some things that
> should probably be double checked, e.g.:

Almost all of the logging seems to be where the test code is
doing stuff that the GIC spec says isn't valid. Also, this
test is gicv2, which is unrelated to either the gicv3 code
or to the ITS...

>   /home/alex/lsrc/qemu.git/builds/arm.all/qemu-system-aarch64 -nodefaults=
 -machine virt -accel tcg -cpu cortex-a57 -device virtio-serial-device -dev=
ice virtconsole,chardev=3D
>   ctd -chardev testdev,id=3Dctd -device pci-testdev -display none -serial=
 stdio -kernel arm/gic.flat -machine gic-version=3D2 -smp 1 -append "mmio" =
-d unimp,guest_errors
>   PASS: gicv2: mmio: all CPUs have interrupts
>   gic_dist_readb: Bad offset 8
>   gic_dist_readb: Bad offset 9
>   gic_dist_readb: Bad offset a
>   gic_dist_readb: Bad offset b

This is GICD_IIDR, which is a 32-bit register. The test looks like it's
trying to read it as 4 separate bytes, which is out of spec, and
is why our implementation is warning about it.

>   INFO: gicv2: mmio: IIDR: 0x00000000
>   gic_dist_writeb: Bad offset 4
>   gic_dist_writeb: Bad offset 5
>   gic_dist_writeb: Bad offset 6
>   gic_dist_writeb: Bad offset 7
>   gic_dist_writeb: Bad offset 4
>   gic_dist_writeb: Bad offset 5
>   gic_dist_writeb: Bad offset 6
>   gic_dist_writeb: Bad offset 7
>   gic_dist_writeb: Bad offset 4
>   gic_dist_writeb: Bad offset 5
>   gic_dist_writeb: Bad offset 6
>   gic_dist_writeb: Bad offset 7

These complaints are because the test is trying to write
to GICD_TYPER, which is not permitted.

>   PASS: gicv2: mmio: GICD_TYPER is read-only
>   gic_dist_readb: Bad offset 8
>   gic_dist_readb: Bad offset 9
>   gic_dist_readb: Bad offset a
>   gic_dist_readb: Bad offset b

More attempts to do byte accesses to a word-only register.

>   gic_dist_writeb: Bad offset 8
>   gic_dist_writeb: Bad offset 9
>   gic_dist_writeb: Bad offset a
>   gic_dist_writeb: Bad offset b
>   gic_dist_readb: Bad offset 8
>   gic_dist_readb: Bad offset 9
>   gic_dist_readb: Bad offset a
>   gic_dist_readb: Bad offset b
>   gic_dist_writeb: Bad offset 8
>   gic_dist_writeb: Bad offset 9
>   gic_dist_writeb: Bad offset a
>   gic_dist_writeb: Bad offset b
>   gic_dist_readb: Bad offset 8
>   gic_dist_readb: Bad offset 9
>   gic_dist_readb: Bad offset a
>   gic_dist_readb: Bad offset b
>   PASS: gicv2: mmio: GICD_IIDR is read-only
>   gic_dist_writeb: Bad offset fe8
>   gic_dist_writeb: Bad offset fe9
>   gic_dist_writeb: Bad offset fea
>   gic_dist_writeb: Bad offset feb
>   gic_dist_writeb: Bad offset fe8
>   gic_dist_writeb: Bad offset fe9
>   gic_dist_writeb: Bad offset fea
>   gic_dist_writeb: Bad offset feb
>   gic_dist_writeb: Bad offset fe8
>   gic_dist_writeb: Bad offset fe9
>   gic_dist_writeb: Bad offset fea
>   gic_dist_writeb: Bad offset feb

Writing bytes to a register that is both read-only and also 32-bit only.

>   PASS: gicv2: mmio: ICPIDR2 is read-only
>   INFO: gicv2: mmio: value of ICPIDR2: 0x0000002b
>   PASS: gicv2: mmio: IPRIORITYR: consistent priority masking
>   INFO: gicv2: mmio: IPRIORITYR: priority mask is 0xffffffff
>   PASS: gicv2: mmio: IPRIORITYR: implements at least 4 priority bits
>   INFO: gicv2: mmio: IPRIORITYR: 8 priority bits implemented
>   PASS: gicv2: mmio: IPRIORITYR: clearing priorities
>   gic_dist_readb: Bad offset 520
>   gic_dist_readb: Bad offset 521
>   gic_dist_readb: Bad offset 522
>   gic_dist_readb: Bad offset 523
>   gic_dist_writeb: Bad offset 520
>   gic_dist_writeb: Bad offset 521
>   gic_dist_writeb: Bad offset 522
>   gic_dist_writeb: Bad offset 523
>   gic_dist_readb: Bad offset 520
>   gic_dist_readb: Bad offset 521
>   gic_dist_readb: Bad offset 522
>   gic_dist_readb: Bad offset 523
>   gic_dist_writeb: Bad offset 520
>   gic_dist_writeb: Bad offset 521
>   gic_dist_writeb: Bad offset 522
>   gic_dist_writeb: Bad offset 523
>   gic_dist_readb: Bad offset 520
>   gic_dist_readb: Bad offset 521
>   gic_dist_readb: Bad offset 522
>   gic_dist_readb: Bad offset 523

I suspect from what the following test says that this is an
attempt to write beyond the end of the valid IPRIORITYR registers,
which isn't permitted.

>   PASS: gicv2: mmio: IPRIORITYR: accesses beyond limit RAZ/WI
>   PASS: gicv2: mmio: IPRIORITYR: accessing last SPIs
>   PASS: gicv2: mmio: IPRIORITYR: priorities are preserved
>   PASS: gicv2: mmio: IPRIORITYR: byte reads successful
>   PASS: gicv2: mmio: IPRIORITYR: byte writes successful
>   PASS: gicv2: mmio: ITARGETSR: bits for non-existent CPUs masked
>   INFO: gicv2: mmio: ITARGETSR: 7 non-existent CPUs
>   PASS: gicv2: mmio: ITARGETSR: accesses beyond limit RAZ/WI
>   FAIL: gicv2: mmio: ITARGETSR: register content preserved
>   INFO: gicv2: mmio: ITARGETSR: writing 01010001 reads back as 00000000
>   PASS: gicv2: mmio: ITARGETSR: byte reads successful
>   FAIL: gicv2: mmio: ITARGETSR: byte writes successful
>   INFO: gicv2: mmio: ITARGETSR: writing 0x1f into bytes 2 =3D> 0x00000000
>   SUMMARY: 17 tests, 2 unexpected failures

These ITARGETSR failures are not correct (or you're not running the
test case the way it's supposed to be). Your command line runs
only one CPU, and for a uniprocessor GIC the ITARGETRSn registers
are supposed to be RAZ/WI, whereas the test seems to be expecting
something else.

thanks
-- PMM
