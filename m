Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y25sm11518920wma.19.2020.06.25.02.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 02:23:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CDDB51FF7E;
	Thu, 25 Jun 2020 10:23:06 +0100 (BST)
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
 <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
 <87o8pba35w.fsf@linaro.org>
 <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org>
 <56ffc60e-f458-e9d4-d89e-4ca70b1ed4e2@trusted-objects.com>
 <CAFEAcA8G3ngwUXMSCEN6UVEJ6Na5sBpHqYv1qh7PEn5uMAhGqQ@mail.gmail.com>
 <e9ad4bb6-e8c9-55f5-565a-01c3f35aea92@trusted-objects.com>
 <CAFEAcA9RAXmMeHFWX0La8yLL3M4mjC+mpsW6AvJFfsP8aGnfqQ@mail.gmail.com>
 <be9893b6-f3c2-2e6c-d00e-9d8ce803b946@trusted-objects.com>
 <87mu4s7oth.fsf@linaro.org>
 <bee6e254-6f69-109e-2571-4e4370768930@trusted-objects.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: Role of qemu-arm
In-reply-to: <bee6e254-6f69-109e-2571-4e4370768930@trusted-objects.com>
Date: Thu, 25 Jun 2020 10:23:06 +0100
Message-ID: <87a70r7b45.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kKm5LP6uUhR3


vincent Dupaquis <v.dupaquis@trusted-objects.com> writes:

> The libraries in this case do not make any interaction with I/O. We take
> control over them through GDB to be able to run them & test them.

So you could instead use a semihosting wrapper and use SYS_REPORTEXC to
report a pass/fail back to whatever invoked QEMU. If you look at
tests/tcg/arm/semihosting.c it can actually be built with:

  semihosting-arm: LDFLAGS+=3D-nostdlib -N -static

And you get a libc free executable with about ~30 insns that can be
invoked by qemu-arm.

> They can be linked into a ELF binary (indeed this is how we test them,
> we link them with a dummy binary and take control over it using the
> debug interface).
>
> Regading the priviledged instructions, I do not understand the question,
> we only use available core instructions (I do not remember about
> priviledged instructions in Cortex-Mx.

Things like accessing system control registers and the like.

>
> Le 24/06/2020 =C3=A0 12:14, Alex Benn=C3=A9e a =C3=A9crit :
>> vincent Dupaquis <v.dupaquis@trusted-objects.com> writes:
>>
>>> Indeed, for us it has an interest, as we do libraries running on
>>> cortex-Mx cores. We are not linked to any specific board and can run
>>> on any.
>> Do the libraries use any privileged instructions?
>> How do they interact with I/O?
>> Can they be linked into an ELF binary?
>>
>>> Currently, we are using a basic board (the netduino2), and do not make
>>> use of any peripherals (that's the goal of our project, being able to be
>>> used on any board, with the right core). We do not even use the IT
>>> controller.
>>>
>>> You are right to say that there is no need of having 'plain cpu'
>>> emulation, as long as you can use any existing simulated board model.
>>> So, as long as there is
>>>
>>> By the way, my original question was on the usage of qemu-arm, and I
>>> have my response now :) It has no interest for cortex-Mx devices.
>> So I believe some of the gcc m-profile test suite runs under qemu-arm
>> with semihosting for this reason. You may need to wrap a little test
>> harness around your libraries to get this to work though.
>>
>>> Best regards,
>>>
>>> Vincent.
>>>
>>> Le 22/06/2020 =C3=A0 15:43, Peter Maydell a =C3=A9crit :
>>>> On Mon, 22 Jun 2020 at 14:03, vincent Dupaquis
>>>> <v.dupaquis@trusted-objects.com> wrote:
>>>>>     It is a shame, so I suppose I'll have to stay with my emulation
>>>>> using netduino2 or so ...
>>>>>
>>>>>     That was the reason why I tried to use qem-arm, which is probably
>>>>> crashing because what you just suggested.
>>>> qemu-arm is for "I'm a linux userspace binary"; if your code is
>>>> a userspace binary then you can use it...
>>>>
>>>>>     Is there a way of pointing-out the interest for the feature ?
>>>> I'm afraid we don't support or have any plan to support
>>>> "just run a CPU, no peripherals". I don't think there's much
>>>> utility in it -- M-profile needs the interrupt controller,
>>>> almost any setup wants to have a UART for I/O, and you need
>>>> some actual RAM, which then leaves you with the question of
>>>> what address to put the RAM at. At that point you're not
>>>> really "just a CPU", you're "a minimalist board that doesn't
>>>> correspond to any real hardware". We've found from experience
>>>> that emulating things which don't correspond to something
>>>> in the real world is not really maintainable and supportable
>>>> in the long term.
>>>>
>>>> If your code will genuinely run on any M-profile board,
>>>> just pick whichever one seems most useful and ignore
>>>> the devices you don't need to use. (I like the mps2-an385,
>>>> it has a bit more RAM than most.)
>>>>
>>>> thanks
>>>> -- PMM
>>


--=20
Alex Benn=C3=A9e
