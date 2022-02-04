Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a14sm774220edx.96.2022.02.04.04.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 04:41:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 169211FFB7;
	Fri,  4 Feb 2022 12:41:01 +0000 (GMT)
References: <20220203155304.2648009-1-valentinghita@google.com>
 <87tudfsv80.fsf@linaro.org>
 <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
 <87czk3rnfl.fsf@linaro.org>
 <CAFEAcA9y1F5X1BQOwzbJgJKPYvroHFM7ivSUOE-07d3S-GE7DA@mail.gmail.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Valentin Ghita <valentinghita@google.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
Date: Fri, 04 Feb 2022 12:33:46 +0000
In-reply-to: <CAFEAcA9y1F5X1BQOwzbJgJKPYvroHFM7ivSUOE-07d3S-GE7DA@mail.gmail.com>
Message-ID: <878ruqst2a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Egphmw6tYums


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 4 Feb 2022 at 09:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>> Assuming you are happy for the device to act as though a external
>> debugger is attached regardless of the gdbstub state you could use a CPU
>> property on the command line to enable this behaviour. We have some
>> examples for SVE for the 64 bit CPUs (see object_property_add for
>> sve-max-vq). So something like:
>>
>>   -cpu cortex-m3,dhscr=3Dtrue
>>
>> You would probably want to model the behaviour of DHSCR.C_HALT as well
>> because that is something the core might do to itself if it detects it
>> is running under debug.
>
> This is sounding pretty hacky to me. I think we should either have
> a proper implementation of all of halting debug (probably opt-in,
> with the default being that the gdbstub is transparent to the guest),

So we could flip it and make it a property of gdbstub with transparency
being the default. Then any architecture that wanted to have this
behaviour could query the stub if enabled.

> or we should just say that no, this isn't something we support,
> and if you want gdb to get control when a particular bit of code
> is executed then you should set a breakpoint there.

It's a fairly niche use case but I don't see why we shouldn't assuming
someone is willing to write the code. However I suspect there is quite a
wide range of potential behaviours to model.

> We don't even implement the guest-visible debug parts of the
> architecture (eg architected single-step) yet, incidentally.

Is this just for Aarch32? Because for Aarch64 as far as I'm aware the
v8.0 debug works fine modulo bugs which I sent a fix for:

  Subject: [RFC PATCH] arm: force flag recalculation when messing with DAIF
  Date: Wed,  2 Feb 2022 12:23:53 +0000
  Message-Id: <20220202122353.457084-1-alex.bennee@linaro.org>

Implementing more of the debug functionality is on the list for
supporting Neoverse. We don't currently have a plan for how to deal with
the slowly growing series of PMU features though.

>
> -- PMM


--=20
Alex Benn=C3=A9e
