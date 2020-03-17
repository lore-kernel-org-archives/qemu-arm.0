Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1434393lfe;
        Tue, 17 Mar 2020 04:43:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vswiKc0XbB2T3JJ3rir3ApWvmfanI9dIxXQ4CKdr72ODJ8pPrcbLeMPYs/2yLaIsoLc50Kw
X-Received: by 2002:a25:b790:: with SMTP id n16mr7073247ybh.66.1584445389952;
        Tue, 17 Mar 2020 04:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584445389; cv=none;
        d=google.com; s=arc-20160816;
        b=XGGVVA4rJWpxKj8i8Oww6hSJmJiSENbgAUO0dUxiLYOQWCy8krxpZrFxEzAM6vzee4
         8dU6Bw6lKnsTO/JMTpdzAG10pgm8p+0jd/n+9s0wGnNb+xR/cDkTiWnQ9AkP0y3Sf7KT
         ENpcYZYaJAabhPArUljOanXyKoda/owmUDouxPKxxVwlRwDOO00M+oDDYynObyyDSwBb
         eUOTpGTXpF2KsSIRWDon6NuiIIS+kFJOn4i7xE/ra3gFt3v/UOfpopsrr+YY9mco9Ml7
         fmFrFHxsniEhi+UNbwA6DKY0+x9qGZpLGakk0uTevjJ/Vpy3y0QkDHV7kt3+fmeE/IrL
         vvTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=20ZdneqOSlTomJxxeURY4Yn0mYCpnAG9b5XaayzYKQs=;
        b=J/1CsuHGtS1bzMWnx/s89qbf2vN92CkKzLGpURK74hlU2KDl8oQTgW74udQQCll+SG
         t/3iCkhfXGSGyqc78EaC3tYWF39AbMWDBfjFL+atNzIcmsZEHwwTInp9f29Bv7fTPHsR
         nGaLcs3cqrklsd4liqgAxHWVdfYI+9W0O4jwuFerIFNBTXKnaBxkvgLluDemrXXHtt4C
         UO8Yif5yJxbzooNyG8KgCubWoC+9fvoUvQ4tlBflb5gLdZaEhBJRLwkGID9K9VnGEBv6
         W9guBLpEsmJSUxKnwy54WOY7ncxu/VfJ4880FHY0IiMO8+QOb5li77XtHcn3wd2dkGzN
         DEvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hov/rdBe";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id d187si2357563ybb.436.2020.03.17.04.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 04:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hov/rdBe";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584445389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20ZdneqOSlTomJxxeURY4Yn0mYCpnAG9b5XaayzYKQs=;
	b=hov/rdBeTqlhFQz4eKyw7c8cVTDzQg+o7NmncI8Att9mC7VeRvQKYv0YBstcGZat8qx147
	5b5EP30gwcrhiCU2srI5TwgR0EL9oMk47+pGTU2GBkbODOj+XIxf20rhXSrlDRBNc3cf2s
	69sow6eI1oZHIWbB/LnSGArEYDKQXzs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154--Jzx8T6VNIuwIqqEWXy00Q-1; Tue, 17 Mar 2020 07:43:05 -0400
X-MC-Unique: -Jzx8T6VNIuwIqqEWXy00Q-1
Received: by mail-wr1-f70.google.com with SMTP id p5so10461814wrj.17
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 04:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WM8S8npTsS02n37DFAyG5zxa+Q37hBP7LfiJwp+F5w8=;
        b=glcyORyYobvXKgg9SgkdO0H2b7UOJipUkTBV9pjodsY3JWdUK86G2anM/VOFO3LGPH
         vgxMdvfvR9HVSknnB0fp7cGwYHhf9JyTqg+ZgtH611zv351tA11HV/oO2pWeirVwGd/e
         OfbtmKvH+xwjISUICOVqoAn6ZvV83FIho3aewNB+Royy4Og5zrXdBUGCLRvP1r5YcE7v
         kLYvL1XKTtWXJ5cruxNwtZaS25FodKm9nHB21SzdtNsTrh4DSg5f7GrNjCRDPQYUaNLs
         BGSSvwnY4Va/IP1kH8F6U7dcy/W3b2RRuK//SpKZCM3SySaTj97znTLWrxj4+Ub4JU0o
         wluw==
X-Gm-Message-State: ANhLgQ1fJFu+KZVxk8YnhXQQuerwzjIFA/GsZalQx/+5V0vRjxSCd6Tm
	XIEfOKBmFDzjoOAV6xYWpjK/LUHzwXf5m+XOacrcJy3oMNSBP0Oo8OJLQCXdivZahIerOQ61uXv
	+mrv/5aEPQvHcbtDx
X-Received: by 2002:a1c:bb86:: with SMTP id l128mr4839145wmf.41.1584445383855;
        Tue, 17 Mar 2020 04:43:03 -0700 (PDT)
X-Received: by 2002:a1c:bb86:: with SMTP id l128mr4839110wmf.41.1584445383444;
        Tue, 17 Mar 2020 04:43:03 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id b10sm4341649wrm.30.2020.03.17.04.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 04:43:02 -0700 (PDT)
Subject: Re: [PATCH v1 20/28] tests/tcg/aarch64: userspace system register
 test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-21-alex.bennee@linaro.org>
 <18254420-c4a6-b8b6-a8cd-cad3b1d6e38b@redhat.com> <87lfnzjlax.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <17987391-ad3c-5671-831f-0d36aa2c93b2@redhat.com>
Date: Tue, 17 Mar 2020 12:43:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87lfnzjlax.fsf@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: et8weAcuiY2v

On 3/17/20 12:03 PM, Alex Benn=C3=A9e wrote:
>=20
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
>>> This tests a bunch of registers that the kernel allows userspace to
>>> read including the CPUID registers. We need a SVE aware compiler as we
>>> are testing the id_aa64zfr0_el1 register in the set.
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Message-Id: <20190205190224.2198-7-alex.bennee@linaro.org>
>>> ---
>>> vgdbstub
>>>     - don't build unless using docker or CROSS_CC_HAS_SVE
>>> ---
>>>    tests/tcg/aarch64/sysregs.c       | 172 ++++++++++++++++++++++++++++=
++
>>>    tests/tcg/aarch64/Makefile.target |   6 ++
>>>    2 files changed, 178 insertions(+)
>>>    create mode 100644 tests/tcg/aarch64/sysregs.c
>>> diff --git a/tests/tcg/aarch64/sysregs.c
>>> b/tests/tcg/aarch64/sysregs.c
>>> new file mode 100644
>>> index 00000000000..40cf8d2877e
>>> --- /dev/null
>>> +++ b/tests/tcg/aarch64/sysregs.c
>>> @@ -0,0 +1,172 @@
>>> +/*
>>> + * Check emulated system register access for linux-user mode.
>>> + *
>>> + * See: https://www.kernel.org/doc/Documentation/arm64/cpu-feature-reg=
isters.txt
>>> + *
>>> + * Copyright (c) 2019 Linaro
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
>>> + * See the COPYING file in the top-level directory.
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include <asm/hwcap.h>
>>> +#include <stdio.h>
>>> +#include <sys/auxv.h>
>>> +#include <signal.h>
>>> +#include <string.h>
>>> +#include <stdbool.h>
>>> +
>>> +#ifndef HWCAP_CPUID
>>> +#define HWCAP_CPUID (1 << 11)
>>> +#endif
>>> +
>>> +int failed_bit_count;
>>> +
>>> +/* Read and print system register `id' value */
>>> +#define get_cpu_reg(id) ({                                      \
>>> +            unsigned long __val =3D 0xdeadbeef;                   \
>>> +            asm("mrs %0, "#id : "=3Dr" (__val));                  \
>>> +            printf("%-20s: 0x%016lx\n", #id, __val);            \
>>> +            __val;                                               \
>>> +        })
>>> +
>>> +/* As above but also check no bits outside of `mask' are set*/
>>> +#define get_cpu_reg_check_mask(id, mask) ({                     \
>>> +            unsigned long __cval =3D get_cpu_reg(id);             \
>>> +            unsigned long __extra =3D __cval & ~mask;             \
>>> +            if (__extra) {                                      \
>>> +                printf("%-20s: 0x%016lx\n", "  !!extra bits!!", __extr=
a);   \
>>> +                failed_bit_count++;                            \
>>> +            }                                                   \
>>> +})
>>> +
>>> +/* As above but check RAZ */
>>> +#define get_cpu_reg_check_zero(id) ({                           \
>>> +            unsigned long __val =3D 0xdeadbeef;                   \
>>> +            asm("mrs %0, "#id : "=3Dr" (__val));                  \
>>> +            if (__val) {                                        \
>>> +                printf("%-20s: 0x%016lx (not RAZ!)\n", #id, __val);   =
     \
>>> +                failed_bit_count++;                            \
>>> +            }                                                   \
>>> +})
>>> +
>>> +/* Chunk up mask into 63:48, 47:32, 31:16, 15:0 to ease counting */
>>> +#define _m(a, b, c, d) (0x ## a ## b ## c ## d ##ULL)
>>> +
>>> +bool should_fail;
>>> +int should_fail_count;
>>> +int should_not_fail_count;
>>> +uintptr_t failed_pc[10];
>>> +
>>> +void sigill_handler(int signo, siginfo_t *si, void *data)
>>> +{
>>> +    ucontext_t *uc =3D (ucontext_t *)data;
>>> +
>>> +    if (should_fail) {
>>> +        should_fail_count++;
>>> +    } else {
>>> +        uintptr_t pc =3D (uintptr_t) uc->uc_mcontext.pc;
>>> +        failed_pc[should_not_fail_count++] =3D  pc;
>>> +    }
>>> +    uc->uc_mcontext.pc +=3D 4;
>>> +}
>>> +
>>> +int main(void)
>>> +{
>>> +    struct sigaction sa;
>>> +
>>> +    /* Hook in a SIGILL handler */
>>> +    memset(&sa, 0, sizeof(struct sigaction));
>>> +    sa.sa_flags =3D SA_SIGINFO;
>>> +    sa.sa_sigaction =3D &sigill_handler;
>>> +    sigemptyset(&sa.sa_mask);
>>> +
>>> +    if (sigaction(SIGILL, &sa, 0) !=3D 0) {
>>> +        perror("sigaction");
>>> +        return 1;
>>> +    }
>>> +
>>> +    /* Counter values have been exposed since Linux 4.12 */
>>> +    printf("Checking Counter registers\n");
>>> +
>>> +    get_cpu_reg(ctr_el0);
>>> +    get_cpu_reg(cntvct_el0);
>>> +    get_cpu_reg(cntfrq_el0);
>>> +
>>> +    /* HWCAP_CPUID indicates we can read feature registers, since Linu=
x 4.11 */
>>> +    if (!(getauxval(AT_HWCAP) & HWCAP_CPUID)) {
>>> +        printf("CPUID registers unavailable\n");
>>> +        return 1;
>>> +    } else {
>>> +        printf("Checking CPUID registers\n");
>>> +    }
>>> +
>>> +    /*
>>> +     * Some registers only expose some bits to user-space. Anything
>>> +     * that is IMPDEF is exported as 0 to user-space. The _mask checks
>>> +     * assert no extra bits are set.
>>> +     *
>>> +     * This check is *not* comprehensive as some fields are set to
>>> +     * minimum valid fields - for the purposes of this check allowed
>>> +     * to have non-zero values.
>>> +     */
>>> +    get_cpu_reg_check_mask(id_aa64isar0_el1, _m(00ff,ffff,f0ff,fff0));
>>> +    get_cpu_reg_check_mask(id_aa64isar1_el1, _m(0000,00f0,ffff,ffff));
>>> +    /* TGran4 & TGran64 as pegged to -1 */
>>> +    get_cpu_reg_check_mask(id_aa64mmfr0_el1, _m(0000,0000,ff00,0000));
>>> +    get_cpu_reg_check_zero(id_aa64mmfr1_el1);
>>> +    /* EL1/EL0 reported as AA64 only */
>>> +    get_cpu_reg_check_mask(id_aa64pfr0_el1,  _m(000f,000f,00ff,0011));
>>> +    get_cpu_reg_check_mask(id_aa64pfr1_el1,  _m(0000,0000,0000,00f0));
>>> +    /* all hidden, DebugVer fixed to 0x6 (ARMv8 debug architecture) */
>>> +    get_cpu_reg_check_mask(id_aa64dfr0_el1,  _m(0000,0000,0000,0006));
>>> +    get_cpu_reg_check_zero(id_aa64dfr1_el1);
>>> +    get_cpu_reg_check_zero(id_aa64zfr0_el1);
>>> +
>>> +    get_cpu_reg_check_zero(id_aa64afr0_el1);
>>> +    get_cpu_reg_check_zero(id_aa64afr1_el1);
>>> +
>>> +    get_cpu_reg_check_mask(midr_el1,         _m(0000,0000,ffff,ffff));
>>> +    /* mpidr sets bit 31, everything else hidden */
>>> +    get_cpu_reg_check_mask(mpidr_el1,        _m(0000,0000,8000,0000));
>>> +    /* REVIDR is all IMPDEF so should be all zeros to user-space */
>>> +    get_cpu_reg_check_zero(revidr_el1);
>>> +
>>> +    /*
>>> +     * There are a block of more registers that are RAZ in the rest of
>>> +     * the Op0=3D3, Op1=3D0, CRn=3D0, CRm=3D0,4,5,6,7 space. However f=
or
>>> +     * brevity we don't check stuff that is currently un-allocated
>>> +     * here. Feel free to add them ;-)
>>> +     */
>>> +
>>> +    printf("Remaining registers should fail\n");
>>> +    should_fail =3D true;
>>> +
>>> +    /* Unexposed register access causes SIGILL */
>>> +    get_cpu_reg(id_mmfr0_el1);
>>> +    get_cpu_reg(id_mmfr1_el1);
>>> +    get_cpu_reg(id_mmfr2_el1);
>>> +    get_cpu_reg(id_mmfr3_el1);
>>> +
>>> +    get_cpu_reg(mvfr0_el1);
>>> +    get_cpu_reg(mvfr1_el1);
>>> +
>>> +    if (should_not_fail_count > 0) {
>>> +        int i;
>>> +        for (i =3D 0; i < should_not_fail_count; i++) {
>>> +            uintptr_t pc =3D failed_pc[i];
>>> +            uint32_t insn =3D *(uint32_t *) pc;
>>> +            printf("insn %#x @ %#lx unexpected FAIL\n", insn, pc);
>>> +        }
>>> +        return 1;
>>> +    }
>>> +
>>> +    if (failed_bit_count > 0) {
>>> +        printf("Extra information leaked to user-space!\n");
>>> +        return 1;
>>> +    }
>>> +
>>> +    return should_fail_count =3D=3D 6 ? 0 : 1;
>>> +}
>>> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Make=
file.target
>>> index 8ed477d0d51..a25afc071cc 100644
>>> --- a/tests/tcg/aarch64/Makefile.target
>>> +++ b/tests/tcg/aarch64/Makefile.target
>>> @@ -42,4 +42,10 @@ run-semiconsole: semiconsole
>>>    run-plugin-semiconsole-with-%:
>>>    =09$(call skip-test, $<, "MANUAL ONLY")
>>>    +ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
>>> +# System Registers Tests
>>> +AARCH64_TESTS +=3D sysregs
>>> +sysregs: CFLAGS+=3D-march=3Darmv8.1-a+sve
>>> +endif
>>> +
>>>    TESTS +=3D $(AARCH64_TESTS)
>>>
>>
>> warning: while parsing target description (at line 47): Vector
>> "vq128hf" references undefined type "ieee_half"
>> warning: Could not load XML target description; ignoring
>> *** stack smashing detected ***: <unknown> terminated
>=20
> How? That test doesn't even use the gdbstub.

This is a bug in my gdb :/

GNU gdb (GDB) Fedora 8.3-7.fc30
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later=20
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-redhat-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
     <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from sysregs...
Remote debugging using localhost:1234
warning: while parsing target description (at line 47): Vector "vq128hf"=20
references undefined type "ieee_half"
warning: Could not load XML target description; ignoring
0x0000000000400498 in _start ()
PASS: connected to aarch64
x0             0x0                 0
x1             0x0                 0
x2             0x0                 0
x3             0x0                 0
x4             0x0                 0
x5             0x0                 0
x6             0x0                 0
x7             0x0                 0
x8             0x0                 0
x9             0x0                 0
x10            0x0                 0
x11            0x0                 0
x12            0x0                 0
x13            0x0                 0
x14            0x0                 0
x15            0x0                 0
x16            0x0                 0
x17            0x0                 0
x18            0x0                 0
x19            0x0                 0
x20            0x0                 0
x21            0x0                 0
x22            0x0                 0
x23            0x0                 0
x24            0x0                 0
x25            0x0                 0
x26            0x0                 0
x27            0x0                 0
x28            0x0                 0
x29            0x0                 0
x30            0x0                 0
sp             0x40007ff0d0        0x40007ff0d0
pc             0x400498            0x400498 <_start>
cpsr           0x40000000          [ EL=3D0 Z ]
fpsr           0x0                 0
fpcr           0x0                 0
PASS: info registers
*** stack smashing detected ***: <unknown> terminated
Aborted (core dumped)

(gdb) bt
#0  0x00007f9036e02e35 in raise () from /lib64/libc.so.6
#1  0x00007f9036ded895 in abort () from /lib64/libc.so.6
#2  0x00007f9036e4608f in __libc_message () from /lib64/libc.so.6
#3  0x00007f9036ed6ce5 in __fortify_fail_abort () from /lib64/libc.so.6
#4  0x00007f9036ed6c98 in __stack_chk_fail () from /lib64/libc.so.6
#5  0x0000562619e27191 in remote_target::fetch_register_using_p=20
(this=3D<optimized out>, regcache=3D0x56261ab84430, reg=3D0x56261ab09140) a=
t=20
../../gdb/remote.c:7959
#6  0x0000000000000000 in ?? ()

>=20
>>
>> (GCC 9.2.1, Fedora 30)
>=20
>=20
