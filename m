Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e25sm4508847wra.71.2020.11.04.12.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 12:37:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D389A1FF7E;
	Wed,  4 Nov 2020 20:36:59 +0000 (GMT)
References: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
 <87v9elax60.fsf@linaro.org>
 <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
 <87pn4taufd.fsf@linaro.org>
 <CAFEAcA8VNRTbSN4jowTzdZ-4fC+mKu+yEJ1nobo1CG668dLZWQ@mail.gmail.com>
 <CAMj1kXH1R4gjCHHNYSXd+4mEDE9_AzAqcFDrOETrqHBf=BKcAA@mail.gmail.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
 <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: regression in TCG emulation of VTBL neon instruction
In-reply-to: <CAMj1kXH1R4gjCHHNYSXd+4mEDE9_AzAqcFDrOETrqHBf=BKcAA@mail.gmail.com>
Date: Wed, 04 Nov 2020 20:36:59 +0000
Message-ID: <87lffgc104.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JQn+arWR+bD4


Ard Biesheuvel <ardb@kernel.org> writes:

> On Wed, 4 Nov 2020 at 18:50, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>>
>> On Wed, 4 Nov 2020 at 17:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> > Just checking - what host are you on?
>>
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

Eyeballing hackbox2 which has:

model name      : Intel(R) Xeon(R) Gold 6154 CPU @ 3.00GHz
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx p=
dpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopo=
logy nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx s=
mx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid
dca sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c=
 rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l3 cdp_l3 invpcid_sin=
gle pti intel_ppin ssbd mba ibrs ibpb stibp tpr_shadow vnmi flexpriority ep=
t vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm cqm mpx=
 rdt_a avx512f avx512dq rdseed adx smap clflushopt clwb intel_pt avx512cd a=
vx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_m=
bm_total cqm_mbm_local dtherm ida arat pln pts pku ospke md_clear flush_l1d

Seems to have avx512 but the avx1 and avx2 stuff is common which will
make use of more registers in the generated code:

    if (have_avx1) {
        tcg_target_available_regs[TCG_TYPE_V64] =3D ALL_VECTOR_REGS;
        tcg_target_available_regs[TCG_TYPE_V128] =3D ALL_VECTOR_REGS;
    }
    if (have_avx2) {
        tcg_target_available_regs[TCG_TYPE_V256] =3D ALL_VECTOR_REGS;
    }

>
>
>> Oh, good question -- what the TCG backend emits as vector
>> operations or not will depend on the host CPU (eg whether
>> it supports AVX1/AVX2/etc).
>>
>> If the test case can be cut down to a Linux userspace
>> program that can be run under the qemu-arm single-binary
>> emulator that will probably also be easier to debug than
>> "boot whole guest kernel and wait for it to get to a selftest".
>>
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


--=20
Alex Benn=C3=A9e
