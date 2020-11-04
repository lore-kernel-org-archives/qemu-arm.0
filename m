Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp191319lfb;
        Wed, 4 Nov 2020 11:22:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1pcNss9SKNFMm/8GF/ckkuu+FFZ/oFnMI+I7wgxTrE/+JxPJnC1c1lsjnHicL3wCookr/
X-Received: by 2002:a17:90a:dc82:: with SMTP id j2mr5768463pjv.68.1604517755926;
        Wed, 04 Nov 2020 11:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604517755; cv=none;
        d=google.com; s=arc-20160816;
        b=Hu249tIsAmtTJA0znN+PsRmhhfoXyc/GzhEz7XKtSCqwyZUz0hKKIvgojGABVyEa6s
         zFAX4cWoSJykZfSw0CArsjWBB3Qlnm01ouhLMkkW1N4DuGJq6y3ZU05+mS81ELSFpwsL
         SsGNVGbDuRnrskMrW3PYgg8UmkTKG9XWnxbDcrUnSDF/O51YGelXprGuLAAsU/8jBMnm
         cNr/P+sr/qYaypeY+oj8IMIi4q3oHlvJ0i2q09AXWnvAwtQhGp+5O47kTqJK+hEgwnEr
         qQk3ify7ddSPOQQkT7BXs0jD/ZCGD5pu0siIqOxrMwAcwbNRDah3JtXOBi/nTrng3SZV
         k4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fazHbiiKDocfyf/xKPZxdo2RknaMdAkHW8M9pU94cU=;
        b=lCYEVUZsqTwAAJhH1siiRg58/pm9pu3deUcOWyK7BpryKh89ZpcqaWwTEHly2p75vQ
         Xzhzyx1O65LJGYlsKNg/aIcfo5PtjftAdP2kpvHRPHuT2v/+xB1wjAHQvZxNbaf3mLrM
         FgF8FgDdLYaUhIlveeTwrcjQLKLCzXwaR8fhKQ0r1KpIWudx27G/JUZ+ulKOFHd7uHOq
         Lt46s5vohz9pjBCNDK+RPVQvBN8IK1K9bw0D8HqB3iZy6YV8jgby/c4d1+qhxEbNhAVH
         XUvGOTVd7GuUpS8i0rMYQ6e9ec8rgHfArwfDq9ANRasnod6bx75XSzjBOZsYIZaunrbn
         gKmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=pRTYZdfI;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id w6si2777198plp.16.2020.11.04.11.22.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 11:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=pRTYZdfI;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 16523206FA;
	Wed,  4 Nov 2020 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604517755;
	bh=mc1OAYvp7GdP+aH8q3Iws3p+ay/3FTIveGLIk6zTOL4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pRTYZdfIjQBhfHapRrJ41elWeiE2N2nP+j7adJCGVrP7e1epVJldkroPmgW++Jn2r
	 eTutGvAfrVjJLc8Rgu9yKRvzJN+vtFlARnMyJU6fIKj+E7QFKRY6UqLgwpIMqefPDW
	 SbSZfszIodK/IbjDjiPt8179ehvVx2ZYlW5hz1Wo=
Received: by mail-ot1-f42.google.com with SMTP id l36so12384098ota.4;
        Wed, 04 Nov 2020 11:22:35 -0800 (PST)
X-Gm-Message-State: AOAM53374sIaC2Jf0RLGVOtvPIEm5oefvGkt3hwy+9xq8pLB4wxYnmrv
	VdgM9Dp1AK0IgyMTv9eSv6E8lsP90JN4dh2Z5vY=
X-Received: by 2002:a05:6830:115a:: with SMTP id x26mr1975255otq.77.1604517754253;
 Wed, 04 Nov 2020 11:22:34 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
 <87v9elax60.fsf@linaro.org> <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
 <87pn4taufd.fsf@linaro.org> <CAFEAcA8VNRTbSN4jowTzdZ-4fC+mKu+yEJ1nobo1CG668dLZWQ@mail.gmail.com>
 <CAMj1kXH1R4gjCHHNYSXd+4mEDE9_AzAqcFDrOETrqHBf=BKcAA@mail.gmail.com>
In-Reply-To: <CAMj1kXH1R4gjCHHNYSXd+4mEDE9_AzAqcFDrOETrqHBf=BKcAA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 4 Nov 2020 20:22:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGXDrP-tbx7q3Rkm3vR1pxT1z23atqi-prsGhPvVe=+Qw@mail.gmail.com>
Message-ID: <CAMj1kXGXDrP-tbx7q3Rkm3vR1pxT1z23atqi-prsGhPvVe=+Qw@mail.gmail.com>
Subject: Re: regression in TCG emulation of VTBL neon instruction
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: lQLU7UKIE3L0

On Wed, 4 Nov 2020 at 19:01, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 4 Nov 2020 at 18:50, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> >
> > On Wed, 4 Nov 2020 at 17:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> > > Just checking - what host are you on?
> >
>
> model name : Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
> flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
> pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
> pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl
> xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor
> ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1
> sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c
> rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti
> ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad
> fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx
> rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
> dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
> flush_l1d
>
>
> > Oh, good question -- what the TCG backend emits as vector
> > operations or not will depend on the host CPU (eg whether
> > it supports AVX1/AVX2/etc).
> >
> > If the test case can be cut down to a Linux userspace
> > program that can be run under the qemu-arm single-binary
> > emulator that will probably also be easier to debug than
> > "boot whole guest kernel and wait for it to get to a selftest".
> >
>
> Sure. The code can be found at [0]
>
> The sequence in question is
>
> # r4 between -31 and 0
> # q4-q5 holding 32 bytes of cipher stream
>
> adr lr, .Lpermute + 32
> add lr, lr, r4
> vld1.8 {q2-q3}, [lr]
>
> vtbl.8 d4, {q4-q5}, d4
> vtbl.8 d5, {q4-q5}, d5
> vtbl.8 d6, {q4-q5}, d6
> vtbl.8 d7, {q4-q5}, d7
>
> .Lpermute:
>  .byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
>  .byte 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
>  .byte 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17
>  .byte 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f
>  .byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
>  .byte 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
>  .byte 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17
>  .byte 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f
>
> This is essentially a bytewise rotate function operating on a 32 byte
> vector (the patch explains the purpose)
>
> Using GDB to single step through the code, I noticed that d6 and d7
> turn up as all zeroes.
>
>
> [0] https://lore.kernel.org/linux-arm-kernel/20201103162809.28167-1-ardb@=
kernel.org/

OK, I could not reproduce with qemu-arm. However, I did found out that
the issue only occurs when using qemu-system-aarch64, not when using
qemu-system-arm
