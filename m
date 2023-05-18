Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r11-20020adff70b000000b003021288a56dsm1783010wrp.115.2023.05.18.04.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 04:11:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0EEC81FFBB;
	Thu, 18 May 2023 12:11:33 +0100 (BST)
References: <20230516104420.407912-1-alex.bennee@linaro.org>
 <CAFEAcA8fu-+YUeuhVw8mpgYXO=ueXrCecC-LkhFwoubUkMvg4Q@mail.gmail.com>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anders Roxell
 <anders.roxell@linaro.org>, Evgeny Iakovlev
 <eiakovlev@linux.microsoft.com>
Subject: Re: [RFC PATCH] target/arm: add RAZ/WI handling for DBGDTR[TX|RX]
Date: Thu, 18 May 2023 12:09:47 +0100
In-reply-to: <CAFEAcA8fu-+YUeuhVw8mpgYXO=ueXrCecC-LkhFwoubUkMvg4Q@mail.gmail.com>
Message-ID: <87a5y1nbbv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iUZnpKytYO13


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 16 May 2023 at 11:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The commit b3aa2f2128 (target/arm: provide stubs for more external
>> debug registers) was added to handle HyperV's unconditional usage of
>> Debug Communications Channel. It turns out that Linux will similarly
>> break if you enable CONFIG_HVC_DCC "ARM JTAG DCC console".
>>
>> Extend the registers we RAZ/WI set to avoid this.
>
> Applied to target-arm.next, thanks.
>
> (In theory we could implement the DCC and wire it up to a
> chardev, which might be a cute way of getting early debug.)

I wondered about that - does DCC give you anything that you can't get
with semihosting (which I think also can support earlycon)?

I found it a little unclear if this is an always available feature.
Should you expect any modern Cortex/Arm chip to support DCC when
attached to jtag?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
