Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local (host5-81-235-77.range5-81.btcentralplus.com. [5.81.235.77])
        by smtp.gmail.com with ESMTPSA id w17sm11012972wra.28.2017.02.24.08.43.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 08:43:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4A9123E0198;
	Fri, 24 Feb 2017 16:43:05 +0000 (GMT)
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org> <CAFEAcA-MMw0_ombzTD+kQYpeNKywtcKY2UczcpR-hFDwGZhZJw@mail.gmail.com> <87wpcflmmb.fsf@linaro.org> <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com> <87shn3lkj3.fsf@linaro.org> <CAFEAcA-e5s6Tru_Kfba9hQHL827r2N5jyBvbpwbro7fHX2m1KA@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches\@linaro.org" <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 00/13] Rewrite NVIC to not depend on the GIC
In-reply-to: <CAFEAcA-e5s6Tru_Kfba9hQHL827r2N5jyBvbpwbro7fHX2m1KA@mail.gmail.com>
Date: Fri, 24 Feb 2017 16:43:05 +0000
Message-ID: <87r32nleue.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: nucSsjxU69VP


Peter Maydell <peter.maydell@linaro.org> writes:

> On 24 February 2017 at 14:40, Alex Bennée <alex.bennee@linaro.org> wrote:
>> The tests currently fail to build:
>>
>> /usr/bin/arm-none-eabi-objcopy -S -O binary test6-kern.elf test6-kern.bin
>> test7.c: In function 'usage':
>> test7.c:58:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
>>          testDiag("Ignoring bogus LR %x, doing return to handler", old_lr);
>>          ^
>> test7.c:76:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
>>          testDiag("Ignoring bogus LR %x, doing return to thread", old_lr);
>>          ^
>> test7.c: In function 'svc':
>> test7.c:105:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
>>          testDiag("New xPSR %x", sframe[7]);
>>          ^
>> test7.c:109:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
>>          testDiag("old xPSR %x", sframe[7]);
>>          ^
>> test7.c:116:9: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'uint32_t' [-Werror=format=]
>>          testDiag("In SVC handler (direct call from main with LR %x)", old_lr);
>>          ^
>> /usr/bin/arm-none-eabi-objcopy -S -O binary test8-kern.elf test8-kern.bin
>> /usr/bin/arm-none-eabi-objcopy -S -O binary test9-kern.elf test9-kern.bin
>> /usr/bin/arm-none-eabi-objcopy -S -O binary test10-kern.elf test10-kern.bin
>> /usr/bin/arm-none-eabi-objcopy -S -O binary test11-kern.elf test11-kern.bin
>> /usr/bin/arm-none-eabi-objcopy -S -O binary test13-kern.elf test13-kern.bin
>> /usr/bin/arm-none-eabi-objcopy -S -O binary test14-kern.elf test14-kern.bin
>> cc1: all warnings being treated as errors
>> Makefile:49: recipe for target 'test7.o' failed
>> make: *** [test7.o] Error 1
>> make: Target 'all' not remade because of errors.
>>
>> I suspect its the same thing as I came across with kvm-unit-tests that
>> compilers targeting the same abi can still disagree about sizes:
>>
>>   https://git.kernel.org/cgit/virt/kvm/kvm-unit-tests.git/commit/?id=529046c397059b8c5ef4dc5fb3c258d86fafb126
>
> Could be. I use arm-linux-gnueabihf-gcc to build. If you use
> PRIx32 does it build OK?

Well the problem is the non-eabi compilers don't have PRIx32 defined for
you. You have to specify yourself.

>
> thanks
> -- PMM


--
Alex Bennée
