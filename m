Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp331992lfb;
        Wed, 4 Nov 2020 15:19:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz66CnslsKJZKaRAcqOPdSPHnfK9R2lLtvXFxe7E+5fifTlWSHjU4Tn5xmjzlpV+xQxNDIW
X-Received: by 2002:a63:f514:: with SMTP id w20mr279586pgh.313.1604531943733;
        Wed, 04 Nov 2020 15:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604531943; cv=none;
        d=google.com; s=arc-20160816;
        b=IEaFFXep+RYSWhGNw9DSb+kaLMCTKKscYkX9n6dhLLgwVC4AwnijdU1LCx6puPV+B4
         Gx8M1iM7WtKBHBzldKAEkJxvI8T//2fmcrKAJBdKUDc1NTEtn+D1kPPYgt6U2QPFgYq0
         j3rrMS4dCnkuehyKCokZ4zPymNuTESmbHeOlcI8FFWgSZ62dBqgHdt4qcEMcs7OutQQs
         LMBDE9X3usSMifOsEXs6oqWwip0U0aDpPLBp98a14SxF/J7RRnkN+iQx8VJcKh/bHZ8p
         6ZBaKgwLyNSo96k9b22U85GpaEVZuwYdp4cf2XxT9l9PKqKNKGQuEC4SQwGNcH0lpxVO
         HeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7n79MAohkyrGjE9r8MzLOZKGBdMtpzUnSZpQvpLLK8=;
        b=B4vlDIb9JGuWC2IHglxdgK0ehmOIPhs2YxFWBVEALd9yq3czNRi1SH/wngi86bnh8W
         AEUG64xrKmg4JPHEP8vYcfTRAhllI+8zC4MyBICk/NuMK7yCekWC8oETF4Ibyp4kfaV1
         FLYJPvJ0vbab2F6jLcjqCgtWYM7UnXWlTFgThzaqfpKYZSmniBKJFBUJ+5xCTIPwIf5Z
         QMbuEvGDj5AmsKjXoc/ilCjsZQv+5OXrR8KO2MPQ3E4jnGdSKup5+e9Lv4jZa2a+D6b4
         Qpu1Ertc2GFCo7WMSvafqumYROpZ/hCux02XCL3SNkUIaIyMOL8psTrduIxMiEbkBAHR
         pWZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=R3nQkXZ2;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id f18si3255560pfe.57.2020.11.04.15.19.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 15:19:03 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=R3nQkXZ2;
       spf=pass (google.com: domain of ardb@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C529820786;
	Wed,  4 Nov 2020 23:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604531942;
	bh=2APCBoLarr0uY3uD7l5cubWb11NoFcX1PZd7FgZgmJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R3nQkXZ2XIPuFYUvW5evfRnwbYXfqb/b+Pum31/1CgStKZMKq2QCaHg0iQrYeUG/N
	 f88zQXx9d4/d4DWIky2M4nJVJcj4UvEVVCbES0Uaj2TYw+FweNfOT5litLMmckWxtM
	 hWvnNy3K7P35LFBqMSnf3u2xwKHd90Q7yG78idZA=
Received: by mail-oi1-f173.google.com with SMTP id j7so24013295oie.12;
        Wed, 04 Nov 2020 15:19:02 -0800 (PST)
X-Gm-Message-State: AOAM530+ebyrJFw4qY0ErSB1x9E7nkUr6zFtr0tB2lzMPJ1nBpkrJUXY
	CUInPGH44J3GHvDmkbekj2/pL4187Ptbht17fYI=
X-Received: by 2002:aca:5c82:: with SMTP id q124mr97471oib.33.1604531941935;
 Wed, 04 Nov 2020 15:19:01 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
 <87v9elax60.fsf@linaro.org> <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
 <87pn4taufd.fsf@linaro.org> <CAFEAcA8VNRTbSN4jowTzdZ-4fC+mKu+yEJ1nobo1CG668dLZWQ@mail.gmail.com>
 <CAMj1kXH1R4gjCHHNYSXd+4mEDE9_AzAqcFDrOETrqHBf=BKcAA@mail.gmail.com> <87lffgc104.fsf@linaro.org>
In-Reply-To: <87lffgc104.fsf@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 5 Nov 2020 00:18:50 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFjBWKRmAXR3osfQA_UP6_UNEwOstNnKmdvy_aUaAWeDw@mail.gmail.com>
Message-ID: <CAMj1kXFjBWKRmAXR3osfQA_UP6_UNEwOstNnKmdvy_aUaAWeDw@mail.gmail.com>
Subject: Re: regression in TCG emulation of VTBL neon instruction
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FKikLrcBvS4q

On Wed, 4 Nov 2020 at 21:37, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Ard Biesheuvel <ardb@kernel.org> writes:
>
> > On Wed, 4 Nov 2020 at 18:50, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >>
> >> On Wed, 4 Nov 2020 at 17:44, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >> > Just checking - what host are you on?
> >>
> >
> > model name : Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
> > flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
> > pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
> > pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl
> > xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor
> > ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1
> > sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c
> > rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti
> > ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad
> > fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx
> > rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
> > dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
> > flush_l1d
>
> Eyeballing hackbox2 which has:
>
> model name      : Intel(R) Xeon(R) Gold 6154 CPU @ 3.00GHz
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx=
 pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xto=
pology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx=
 smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid
> dca sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f1=
6c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l3 cdp_l3 invpcid_s=
ingle pti intel_ppin ssbd mba ibrs ibpb stibp tpr_shadow vnmi flexpriority =
ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm cqm m=
px rdt_a avx512f avx512dq rdseed adx smap clflushopt clwb intel_pt avx512cd=
 avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm=
_mbm_total cqm_mbm_local dtherm ida arat pln pts pku ospke md_clear flush_l=
1d
>
> Seems to have avx512 but the avx1 and avx2 stuff is common which will
> make use of more registers in the generated code:
>
>     if (have_avx1) {
>         tcg_target_available_regs[TCG_TYPE_V64] =3D ALL_VECTOR_REGS;
>         tcg_target_available_regs[TCG_TYPE_V128] =3D ALL_VECTOR_REGS;
>     }
>     if (have_avx2) {
>         tcg_target_available_regs[TCG_TYPE_V256] =3D ALL_VECTOR_REGS;
>     }
>
> >
> >
> >> Oh, good question -- what the TCG backend emits as vector
> >> operations or not will depend on the host CPU (eg whether
> >> it supports AVX1/AVX2/etc).
> >>
> >> If the test case can be cut down to a Linux userspace
> >> program that can be run under the qemu-arm single-binary
> >> emulator that will probably also be easier to debug than
> >> "boot whole guest kernel and wait for it to get to a selftest".
> >>
> >
> > Sure. The code can be found at [0]
> >
> > The sequence in question is
> >
> > # r4 between -31 and 0
> > # q4-q5 holding 32 bytes of cipher stream
> >
> > adr lr, .Lpermute + 32
> > add lr, lr, r4
> > vld1.8 {q2-q3}, [lr]
> >
> > vtbl.8 d4, {q4-q5}, d4
> > vtbl.8 d5, {q4-q5}, d5
> > vtbl.8 d6, {q4-q5}, d6
> > vtbl.8 d7, {q4-q5}, d7
> >
> > .Lpermute:
> >  .byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
> >  .byte 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
> >  .byte 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17
> >  .byte 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f
> >  .byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
> >  .byte 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
> >  .byte 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17
> >  .byte 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f
> >
> > This is essentially a bytewise rotate function operating on a 32 byte
> > vector (the patch explains the purpose)
> >
> > Using GDB to single step through the code, I noticed that d6 and d7
> > turn up as all zeroes.
> >
> >
> > [0] https://lore.kernel.org/linux-arm-kernel/20201103162809.28167-1-ard=
b@kernel.org/
>
>

So comparing qemu-system-aarch64 and qemu-system-arm running in GDB gives m=
e:

qemu-system-arm:

(gdb) b helper_neon_tbl if maxindex=3D=3D32
Breakpoint 1 at 0x60e250: file ../target/arm/op_helper.c, line 73.
(gdb) r -M virt -cpu cortex-a15 -m 2048 -net none -nographic -kernel
arch/arm/boot/zImage
Starting program: /home/ardbie01/build/qemu/build/qemu-system-arm -M
virt -cpu cortex-a15 -m 2048 -net none -nographic -kernel
arch/arm/boot/zImage

(gdb) x/8x table
0x555556e6d390: 0xbb75b15a 0xdb0107ff 0x560fe329 0x980e8754
0x555556e6d3a0: 0x08e58eb7 0x814e8602 0x2654e32c 0x979ff7d2

whereas qemu-system-aarch64 gives me

(gdb) x/8x table
0x555556ff8c20: 0xbb75b15a 0xdb0107ff 0x560fe329 0x980e8754
0x555556ff8c30: 0x00000000 0x00000000 0x00000000 0x00000000

Looking at HELPER(neon_tbl)(), it seems to me that casting void *vn to
uint64_t* and indexing it as an array fails to account for the SVE
view of the registers. This also explains why qemu-system-arm works
and qemu-system-aarch64 doesn't.
