Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d5552000000b002e5f6f8fc4fsm1663179wrw.100.2023.05.25.05.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:52:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 611471FFBB;
	Thu, 25 May 2023 13:52:05 +0100 (BST)
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-10-philmd@linaro.org>
 <CAFEAcA_7dkWB9qPkzYmW6_F1eaAet0PPk0PHywGS2EpAkFAsUQ@mail.gmail.com>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, Evgeny Iakovlev
 <eiakovlev@linux.microsoft.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 09/12] hw/char/pl011: Check if transmitter is enabled
Date: Thu, 25 May 2023 13:51:08 +0100
In-reply-to: <CAFEAcA_7dkWB9qPkzYmW6_F1eaAet0PPk0PHywGS2EpAkFAsUQ@mail.gmail.com>
Message-ID: <87zg5stvyi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DFRCi4q5Jzs+


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 22 May 2023 at 16:32, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
>>
>> Do not transmit characters when UART or transmitter are disabled.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Last time somebody tried to add checks on the tx/rx enable bits
> for the PL011 it broke 'make check' because the hand-rolled
> UART code in boot-serial-test and migration-test doesn't
> set up the UART control register strictly correctly:
>
> https://lore.kernel.org/qemu-devel/CAFEAcA8ZDmjP7G0eVpxcB1jiSGarZAbqPV0xr=
5WquR213mBUBg@mail.gmail.com/
>
> Given that imposing these checks doesn't help anything
> much and might break naive bare-metal tested-only-on-QEMU
> code, is it worthwhile ?

Surely we aim to be a correct model so the fix should be in our naive
and incorrect code?

>
>>  static void pl011_write_tx(PL011State *s, const uint8_t *buf, int lengt=
h)
>>  {
>> -    /* ??? Check if transmitter is enabled.  */
>> +    if (!(s->cr & (CR_UARTEN | CR_TXE))) {
>
> This will allow TX if either UARTEN or TXE is set, which
> probably isn't what you meant.
>
>> +        return;
>> +    }
>>
>>      /* XXX this blocks entire thread. Rewrite to use
>>       * qemu_chr_fe_write and background I/O callbacks */
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
