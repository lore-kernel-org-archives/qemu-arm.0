Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local (host5-81-235-77.range5-81.btcentralplus.com. [5.81.235.77])
        by smtp.gmail.com with ESMTPSA id r195sm2594326wme.25.2017.02.24.06.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 06:40:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 63EBB3E037F;
	Fri, 24 Feb 2017 14:40:16 +0000 (GMT)
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org> <CAFEAcA-MMw0_ombzTD+kQYpeNKywtcKY2UczcpR-hFDwGZhZJw@mail.gmail.com> <87wpcflmmb.fsf@linaro.org> <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches\@linaro.org" <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 00/13] Rewrite NVIC to not depend on the GIC
In-reply-to: <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com>
Date: Fri, 24 Feb 2017 14:40:16 +0000
Message-ID: <87shn3lkj3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: SLHmTFRkSkeH


Peter Maydell <peter.maydell@linaro.org> writes:

> On 24 February 2017 at 13:55, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Even this branch is failing the tests for me:
>
>> =============== Testing test9-kern.bin ===============
>
>> not ok 9 - 00000000 == 00000800 icsr
>
>> =============== Testing test10-kern.bin ===============
>> not ok 1 - 00000000 == 00000800 ICSR
>
>> not ok 9 - 00000000 == 00000800 ICSR
>
>> =============== Testing test4-kern.bin ===============
>> not ok 5 - 00000000 == 00000800 ICSR
>
>> not ok 9 - 00410000 == 00410800 ICSR
>
> Ah, I missed the test failures, but these are all test bugs.

I thought it was likely to be that ;-)

> All of these failures are for reads of ICSR when we're not
> in an exception handler and the mismatch is because the
> expected value of RETTOBASE differs. The bit is architecturally
> UNKNOWN, and we did a late swap from making it be clear to
> making it be set, because that seemed to be more in line
> with the Cortex-M3 documented behaviour.
>
> I didn't notice that the tests needed to be updated to
> mask out the UNKNOWN bit before comparison.

The tests currently fail to build:

/usr/bin/arm-none-eabi-objcopy -S -O binary test6-kern.elf test6-kern.bin
test7.c: In function 'usage':
test7.c:58:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
         testDiag("Ignoring bogus LR %x, doing return to handler", old_lr);
         ^
test7.c:76:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
         testDiag("Ignoring bogus LR %x, doing return to thread", old_lr);
         ^
test7.c: In function 'svc':
test7.c:105:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
         testDiag("New xPSR %x", sframe[7]);
         ^
test7.c:109:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
         testDiag("old xPSR %x", sframe[7]);
         ^
test7.c:116:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
         testDiag("In SVC handler (direct call from main with LR %x)", old_lr);
         ^
/usr/bin/arm-none-eabi-objcopy -S -O binary test8-kern.elf test8-kern.bin
/usr/bin/arm-none-eabi-objcopy -S -O binary test9-kern.elf test9-kern.bin
/usr/bin/arm-none-eabi-objcopy -S -O binary test10-kern.elf test10-kern.bin
/usr/bin/arm-none-eabi-objcopy -S -O binary test11-kern.elf test11-kern.bin
/usr/bin/arm-none-eabi-objcopy -S -O binary test13-kern.elf test13-kern.bin
/usr/bin/arm-none-eabi-objcopy -S -O binary test14-kern.elf test14-kern.bin
cc1: all warnings being treated as errors
Makefile:49: recipe for target 'test7.o' failed
make: *** [test7.o] Error 1
make: Target 'all' not remade because of errors.

I suspect its the same thing as I came across with kvm-unit-tests that
compilers targeting the same abi can still disagree about sizes:

  https://git.kernel.org/cgit/virt/kvm/kvm-unit-tests.git/commit/?id=529046c397059b8c5ef4dc5fb3c258d86fafb126

>
> thanks
> -- PMM


--
Alex Bennée
