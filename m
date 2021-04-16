Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q5sm9549056wrv.17.2021.04.16.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 02:15:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4CE431FF7E;
	Fri, 16 Apr 2021 10:15:49 +0100 (BST)
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
 <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
 <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
 <CAFEAcA-x-eNaH=JROoSgF-ruWJDC2++qLNxz3ZEtziyUO-3aEQ@mail.gmail.com>
 <959e497c-7873-f449-c3d8-546479cccace@kaod.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
Date: Fri, 16 Apr 2021 10:14:44 +0100
In-reply-to: <959e497c-7873-f449-c3d8-546479cccace@kaod.org>
Message-ID: <8735vqlhdm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nnkYrPmNQzV9


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 4/15/21 7:34 PM, Peter Maydell wrote:
>> On Thu, 15 Apr 2021 at 18:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>>
>>> On 4/15/21 5:55 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 4/15/21 4:54 PM, Peter Maydell wrote:
>>>>> On Thu, 15 Apr 2021 at 15:32, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>>>>>> --8<---------------cut here---------------start------------->8---
>>>>>> accel/tcg: avoid re-translating one-shot instructions
>>>>>>
>>>>>> By definition a single instruction is capable of being an IO
>>>>>> instruction. This avoids a problem of triggering a cpu_io_recompile =
on
>>>>>> a non-cached translation which would only do exactly this anyway.
>>>>>>
>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>>
>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>> accel/tcg/translate-all.c | 2 +-
>>>>>>
>>>>>> modified   accel/tcg/translate-all.c
>>>>>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>>>>>
>>>>>>      if (phys_pc =3D=3D -1) {
>>>>>>          /* Generate a one-shot TB with 1 insn in it */
>>>>>> -        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
>>>>>> +        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>>>>>      }
>>>>>>
>>>>>>      max_insns =3D cflags & CF_COUNT_MASK;
>>>>>> --8<---------------cut here---------------end--------------->8---
>>>>>
>>>>> Yes, this fixes the problem. Do we want to put this in for 6.0? My
>>>>> feeling is that executing from non-RAM is pretty niche, so maybe
>>>>> if we need an rc4 anyway, but this isn't important enough to cause an
>>>>> rc4 itself.
>>>>
>>>> Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing C=C3=
=A9dric).
>>>
>>> You need to set the 'execute-in-place' machine option to load/execute t=
he
>>> instructions from the AHB window of CE0. It's not on by default because
>>> boot can be really slow with some recent u-boot which heavily trash the=
 TBs.
>>>
>>> But this seems to work fine with -rc3.
>>=20
>> Triggering the bug requires both execute-in-place and -icount -- did
>> you test with -icount enabled?
>
> It crashes.


Without the above patch? I've re-posted as a proper patch here:

  Subject: [RFC PATCH] accel/tcg: avoid re-translating one-shot instructions
  Date: Thu, 15 Apr 2021 17:24:53 +0100
  Message-Id: <20210415162454.22056-1-alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
