Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j190sm8376252wmb.19.2019.05.10.09.59.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 09:59:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A64391FF87;
	Fri, 10 May 2019 17:59:45 +0100 (BST)
References: <20190509165912.10512-1-alex.bennee@linaro.org> <20190509165912.10512-6-alex.bennee@linaro.org> <CAFEAcA8Dsdp2rnORnzqemWspfFxfhVwkAz=2EXdupo8iDj_=Hw@mail.gmail.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v1 05/23] semihosting: enable chardev backed output
In-reply-to: <CAFEAcA8Dsdp2rnORnzqemWspfFxfhVwkAz=2EXdupo8iDj_=Hw@mail.gmail.com>
Date: Fri, 10 May 2019 17:59:45 +0100
Message-ID: <87tve2b5z2.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BUKY/0eVBCgj


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 9 May 2019 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> For running system tests we want to be able to re-direct output to a
>> file like we do with serial output. This does the wiring to allow us
>> to treat semihosting like just another character output device.
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 51802cbb266..6aa3a08c2fb 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -3975,12 +3975,12 @@ STEXI
>>  Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
>>  ETEXI
>>  DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
>> -    "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,=
arg=3Dstr[,...]]\n" \
>> +    "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,=
chardev=3Did][,arg=3Dstr[,...]]\n" \
>>      "                semihosting configuration\n",
>>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
>>  QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
>
> As you can see in the docs here, semihosting is supported on
> five guest architectures, so we should implement this new
> feature for all of them, not just arm.

As I've introduced this for testing I see no reason not to add support
for other architectures. However I was hoping this is something that
could be done organically as other system tests get enabled.

--
Alex Benn=C3=A9e
