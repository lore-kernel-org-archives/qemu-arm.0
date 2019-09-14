Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s12sm23273269wrn.90.2019.09.14.10.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2019 10:51:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5F27D1FF87;
	Sat, 14 Sep 2019 18:51:09 +0100 (BST)
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-5-alex.bennee@linaro.org>
 <CAL1e-=giNc1e+kN04KqHFQGkJbP4BKziQyxVd3-RTtL+UOfSoQ@mail.gmail.com>
 <874l1j18vm.fsf@linaro.org>
 <5880b9c9-969f-fa79-f7f4-a45a6568635e@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 peter.maydell@linaro.org, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>
Subject: Re: [Qemu-devel] [PATCH v1 4/4] elf: move ELF_ARCH definition to
 elf-arch.h
In-reply-to: <5880b9c9-969f-fa79-f7f4-a45a6568635e@linaro.org>
Date: Sat, 14 Sep 2019 18:51:09 +0100
Message-ID: <87woeaahrm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wDnD5fr3BOzL


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/11/19 5:26 AM, Alex Benn=C3=A9e wrote:
>>
>> Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:
>>
>>> 10.09.2019. 21.34, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> =D1=98=
=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>>>>
>>>> This is preparatory for plugins which will want to report the
>>>> architecture to plugins. Move the ELF_ARCH definition out of the
>>>> loader and into its own header.
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> --
>>>
>>> Hi, Alex.
>>>
>>> I advice some caution here
>>> . For example, EM_NANOMIPS, and some other EM_xxx constants are not
>>> included in the new header.
>>
>> EM_ARCH was never set to EM_NANOMIPS. In fact I can see e_machine is
>> checked against it so I guess it is only ever used to checking the
>> loading elf directly.
>>
>> In fact EM_ARCH is only really the default fallback case for checking
>> the elf type if there is not a more "forgiving" check done by arch
>> specific code (elf_check_arch). The only other cace is the fallback for
>> EM_MACHINE unless PPC does something with it.
>>
>>> I am not sure what exactly you want to achieve
>>> with this refactoring. But you may miss your goal, since some EM_xxx wi=
ll
>>> be missing from your new header. Is this the right way to achieve what =
you
>>> want, and could you unintentionally introduce bugs? Can you outline in =
more
>>> details your intentions around the new header? Is this refactoring the =
only
>>> way?
>>
>> As mentioned in the other reply maybe exposing a value from configure
>> into config-target.[mak|h] would be a better approach?
>
> I think using EM_FOO to tell a plugin about the architecture is just goin=
g to
> be confusing.  As seen here wrt EM_NANOMIPS, but arguably elsewhere with
> EM_SPARC vs EM_SPARC64.
>
> You need to decide what it is that you want the plugin to know.  It is ju=
st be
> gross architecture?  In which case QEMU_ARCH_FOO is probably enough.  Is =
it the
> instruction set currently executing?  In which case neither EM_FOO nor
> QEMU_ARCH_FOO is sufficient -- e.g. arm thumb -- and you'll have to invent
> something new, because no two architectures handle this in the same way. =
 The
> closest you might be able to get without invention from whole cloth is the
> capstone cap_arch+cap_mode values from cc->disas_set_info().  But that on=
ly
> handles the most popular of targets.

I think I'm going to stick with the gross TARGET for now. It mostly
seems a way of avoiding building per-arch plugins. I assume most out of
tree plugins will be targeted at a specific machine anyway.

Anyway I think that means I'll drop this series unless 1-3 are worth
keeping as simple clean-ups leaving out 4?

>
> In any case, a single header that every target must touch is the wrong
> approach.  If you want to do some cleanup, move these defines into e.g.
> linux-user/$TARGET/target_elf.h.  (And I wouldn't bother touching bsd-use=
r in
> its current condition.)
>
>
> r~


--
Alex Benn=C3=A9e
