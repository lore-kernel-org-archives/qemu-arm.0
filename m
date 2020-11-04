Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp135864lfb;
        Wed, 4 Nov 2020 10:01:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyunRz6J/k2HVHutvCTedpMmSwgD8rnay0J9ieyW0Snr+KF+Y72nx9XxSOkT9UfbfiqLTiX
X-Received: by 2002:aa7:8b0b:0:b029:152:900d:2288 with SMTP id f11-20020aa78b0b0000b0290152900d2288mr31081898pfd.53.1604512904010;
        Wed, 04 Nov 2020 10:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604512904; cv=none;
        d=google.com; s=arc-20160816;
        b=tFeiQLyskZ9fhqSOhJ2z0RTh43J3zLS8HyCWrG3eMLipo0u7CQ/Il5qrlTw3cvxZn7
         EPyAdJOsm/k39+jChm6KLIZxtVQLw7oS3loEby5FAQ1Qx0PueCyhCpK7rrvpKXNof/8F
         Z3Muv+Lrt61D8SQhiuJ65E27Zxs5qSRm6w2rwWl+mEicgE5ZoXAXl6SNays6yYpUDrZH
         Y5GJZOdn6CDHxwx/dJhn4YSybSKPFELhqd6pwlQMTj+8UwNyCF/E4/OA/cnyXjmgIdjh
         zJibSKUuxHjlpiIdEc1csom2wxhqska3ulLuNNsRZhJTMjQI3ShVJiXqTXbyByiGh+FF
         0Auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gUuQuHryKtiqBsx8NJ2o48diGGf68wr9gQMfcLU811Q=;
        b=NdPDg5cas+AhCbI77xGsfo6XmbS7mYqar5PiWMKEEEr6xwtlTGGIQBWPdIRZuvk9c8
         YG+suDIcS7bGwctcEfCIdM4GxNxTcbmp5jnvNLIfext07bkUsF6mKsUErjhF66suZ4DT
         zhW3F3sA3px9l3njCcRVppd0EpBdqMygwp1tbf6zpbDC2YjqOfyKIGq+1/Xu6KFiFc/S
         zlERLNBM9uB5Hn0wgA1y9eYKbW4He+4I8leQKNIYDwfRoQhrY8Qzq9YSoSsa+Ae2TfXG
         wwxVObJUoUOdbHVYKignkAMeMsre27oaFNkLGaeC8ISwwLYVlZTNf2dNgG65n3/YUoFA
         YC7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=zPKhODsM;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id c24si2245441pgw.144.2020.11.04.10.01.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 10:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=zPKhODsM;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2C29B206ED;
	Wed,  4 Nov 2020 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604512903;
	bh=gUuQuHryKtiqBsx8NJ2o48diGGf68wr9gQMfcLU811Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=zPKhODsMULPmn3tJj8iPNsZwzEigi3Pf2i20eSVJHSkG19z4G1erM+UEVXR1MB/0Z
	 8L4HCQ0qSOXB3EaQ/CQF12iaciD53+zC4chVbKsWm2EQWdbZ8gTOGBF3DmMeuyz2qd
	 q8dyA8h1eDBRwkgBWGELouMx6PxShRg5VyMbRXWw=
Received: by mail-oo1-f50.google.com with SMTP id z14so5275433oom.10;
        Wed, 04 Nov 2020 10:01:43 -0800 (PST)
X-Gm-Message-State: AOAM533Sx7PXRWdZ5GUexEbINdehJomlJjSTXmx0xkILvMWRbmE/Jvfx
	rgSApIGK4PsZkO7v2NzygOifPgQCAGN9QWBTYWA=
X-Received: by 2002:a4a:9806:: with SMTP id y6mr19735323ooi.45.1604512902398;
 Wed, 04 Nov 2020 10:01:42 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
 <87v9elax60.fsf@linaro.org> <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
 <87pn4taufd.fsf@linaro.org> <CAFEAcA8VNRTbSN4jowTzdZ-4fC+mKu+yEJ1nobo1CG668dLZWQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8VNRTbSN4jowTzdZ-4fC+mKu+yEJ1nobo1CG668dLZWQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 4 Nov 2020 19:01:30 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH1R4gjCHHNYSXd+4mEDE9_AzAqcFDrOETrqHBf=BKcAA@mail.gmail.com>
Message-ID: <CAMj1kXH1R4gjCHHNYSXd+4mEDE9_AzAqcFDrOETrqHBf=BKcAA@mail.gmail.com>
Subject: Re: regression in TCG emulation of VTBL neon instruction
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: RepALND/oRf7

On Wed, 4 Nov 2020 at 18:50, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Wed, 4 Nov 2020 at 17:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> > Just checking - what host are you on?
>

model name : Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1
sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti
ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad
fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d


> Oh, good question -- what the TCG backend emits as vector
> operations or not will depend on the host CPU (eg whether
> it supports AVX1/AVX2/etc).
>
> If the test case can be cut down to a Linux userspace
> program that can be run under the qemu-arm single-binary
> emulator that will probably also be easier to debug than
> "boot whole guest kernel and wait for it to get to a selftest".
>

Sure. The code can be found at [0]

The sequence in question is

# r4 between -31 and 0
# q4-q5 holding 32 bytes of cipher stream

adr lr, .Lpermute + 32
add lr, lr, r4
vld1.8 {q2-q3}, [lr]

vtbl.8 d4, {q4-q5}, d4
vtbl.8 d5, {q4-q5}, d5
vtbl.8 d6, {q4-q5}, d6
vtbl.8 d7, {q4-q5}, d7

.Lpermute:
 .byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
 .byte 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
 .byte 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17
 .byte 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f
 .byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
 .byte 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
 .byte 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17
 .byte 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f

This is essentially a bytewise rotate function operating on a 32 byte
vector (the patch explains the purpose)

Using GDB to single step through the code, I noticed that d6 and d7
turn up as all zeroes.


[0] https://lore.kernel.org/linux-arm-kernel/20201103162809.28167-1-ardb@ke=
rnel.org/
