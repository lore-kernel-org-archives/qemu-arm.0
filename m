Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r9sm7013765wrv.82.2019.05.11.11.04.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 May 2019 11:04:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 94F381FF87;
	Sat, 11 May 2019 19:04:31 +0100 (BST)
References: <20190509165912.10512-1-alex.bennee@linaro.org> <20190509165912.10512-6-alex.bennee@linaro.org> <CAFEAcA8Dsdp2rnORnzqemWspfFxfhVwkAz=2EXdupo8iDj_=Hw@mail.gmail.com> <87tve2b5z2.fsf@zen.linaroharston> <CAFEAcA9q9n24wZF9nRM=norAK+tPv9LL4LM4-8gwH8F+0D0umw@mail.gmail.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v1 05/23] semihosting: enable chardev backed output
In-reply-to: <CAFEAcA9q9n24wZF9nRM=norAK+tPv9LL4LM4-8gwH8F+0D0umw@mail.gmail.com>
Date: Sat, 11 May 2019 19:04:31 +0100
Message-ID: <87k1ewrhow.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /lxNNs3c8K/c


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 10 May 2019 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 9 May 2019 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >>
>> >> For running system tests we want to be able to re-direct output to a
>> >> file like we do with serial output. This does the wiring to allow us
>> >> to treat semihosting like just another character output device.
>> >>
>> >> diff --git a/qemu-options.hx b/qemu-options.hx
>> >> index 51802cbb266..6aa3a08c2fb 100644
>> >> --- a/qemu-options.hx
>> >> +++ b/qemu-options.hx
>> >> @@ -3975,12 +3975,12 @@ STEXI
>> >>  Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
>> >>  ETEXI
>> >>  DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
>> >> -    "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto=
][,arg=3Dstr[,...]]\n" \
>> >> +    "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto=
][,chardev=3Did][,arg=3Dstr[,...]]\n" \
>> >>      "                semihosting configuration\n",
>> >>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
>> >>  QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
>> >
>> > As you can see in the docs here, semihosting is supported on
>> > five guest architectures, so we should implement this new
>> > feature for all of them, not just arm.
>>
>> As I've introduced this for testing I see no reason not to add support
>> for other architectures. However I was hoping this is something that
>> could be done organically as other system tests get enabled.
>
> IME transitions done "organically" really means "slowly, and
> nobody ever gets round to actually completing them".
> Semihosting is a user-facing feature, so if we want to add
> the user feature of allowing output to go to a chardev we
> should add it properly, I think.

So a quick review of the current semi output:

  - MIPS
    This has a fairly generalised open/read/write support with special
    handling for open/close on /dev/std[out/err/in]. There is also a
    UHI_plog which currently just printf's to stdout

  - xtensa
    This already has support for a sim_console char device as part of
    the xtensa sim platform. Otherwise the TARGET_SYS_open can open
    paths directly (which I assume could include stdio) which then
    read/write.

  - m68k
    This has the usual open/read/write/close support directly to the
    FD's as well as support for integrating with the gdbstub via
    gdb_do_syscall.

  - lm32
    Although based on the m68k semithosting support it lacks the gdbstub
    integration. It has the usual open/read/write/close stuff.

  - NIOS2
    Again based on the m68k semihosting but looks like it was taken
    later because it retains the gdbsub integration support.

Generally all the other semihosting stuff looks a lot cleaner - probably
an indication of being done later and avoiding some of the warts of the
early arm semihosting code.

One difference with ARM is it has specific calls aside from the
open/read/write/close (WRITEC/WRITE0) which are specifically aimed at
"console" type logging. They don't seem to require an explicit open at
the start and assume you can write to them from the get go.

One question that would need to be answered is should the chardev
support be generalised for all semihosts that can read/write to the
stdio outputs or should we restrict it to the "console" log operations
(xtensa sim, mips plog and ARM)?

--
Alex Benn=C3=A9e
