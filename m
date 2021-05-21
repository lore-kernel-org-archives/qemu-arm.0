Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y5sm2564312wrp.5.2021.05.21.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 07:45:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 11B6C1FF7E;
	Fri, 21 May 2021 15:45:44 +0100 (BST)
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com>
 <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, Cleber
 Rosa <crosa@redhat.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
Date: Fri, 21 May 2021 15:43:13 +0100
In-reply-to: <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
Message-ID: <87mtsob0x3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QBXgojakyJBd


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 5/21/21 3:03 PM, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>> On 5/21/21 2:28 PM, Willian Rampazzo wrote:
>>>> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>> On 20/05/2021 22.28, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
>>>>>>> Conceptually speaking, acceptance tests "are a series of specific t=
ests
>>>>>>> conducted by the customer in an attempt to uncover product errors b=
efore
>>>>>>> accepting the software from the developer. Conducted by the end-use=
r rather
>>>>>>> than software engineers, acceptance testing can range from an infor=
mal
>>>>>>> =E2=80=9Ctest drive=E2=80=9D to a planned and systematically execut=
ed series of scripted
>>>>>>> tests" [1]. Every time Pressman refers to the term "acceptance test=
ing," he
>>>>>>> also refers to user's agreement in the final state of an implemente=
d feature.
>>>>>>> Today, QEMU is not implementing user acceptance tests as described =
by Pressman.
>>>>>>>
>>>>>>> There are other three possible terms we could use to describe what =
is currently
>>>>>>> QEMU "acceptance" tests:
>>>>>>>
>>>>>>>    1 - Integration tests:
>>>>>>>        - "Integration testing is a systematic technique for constru=
cting the
>>>>>>>           software architecture while at the same time conducting t=
ests to
>>>>>>>           uncover errors associated with interfacing. The objective=
 is to take
>>>>>>>           unit-tested components and build a program structure that=
 has been
>>>>>>>           dictated by design." [2]
>>>>>>>        * Note: Sommerville does not have a clear definition of inte=
gration
>>>>>>>          testing. He refers to incremental integration of component=
s inside
>>>>>>>          the system testing (see [3]).
>>>>>
>>>>> After thinking about this for a while, I agree with you that renaming=
 the
>>>>> "acceptance" tests to "integration" tests is also not a good idea. Wh=
en I
>>>>> hear "integration" test in the context of the virt stack, I'd rather =
expect
>>>>> a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe
>>>>> virt-manager on top and tests them all together. So we should look fo=
r a
>>>>> different name indeed.
>>>>>
>>>>>>>    2 - Validation tests:
>>>>>>>        - "Validation testing begins at the culmination of integrati=
on testing,
>>>>>>>           when individual components have been exercised, the softw=
are is
>>>>>>>           completely assembled as a package, and interfacing errors=
 have been
>>>>>>>           uncovered and corrected. At the validation or system leve=
l, the
>>>>>>>           distinction between different software categories disappe=
ars. Testing
>>>>>>>           focuses on user-visible actions and user-recognizable out=
put from the
>>>>>>>           system." [4]
>>>>>>>        - "where you expect the system to perform correctly using a =
set of test
>>>>>>>           cases that reflect the system=E2=80=99s expected use." [5]
>>>>>>>        * Note: the definition of "validation testing" from Sommervi=
lle reflects
>>>>>>>          the same definition found around the Internet, as one of t=
he processes
>>>>>>>          inside the "Verification & Validation (V&V)." In this conc=
ept,
>>>>>>>          validation testing is a high-level definition that covers =
unit testing,
>>>>>>>          functional testing, integration testing, system testing, a=
nd acceptance
>>>>>>>          testing.
>>>>>>>
>>>>>>>    3 - System tests:
>>>>>>>        - "verifies that all elements mesh properly and that overall=
 system
>>>>>>>           function and performance is achieved." [6]
>>>>>>>        - "involves integrating components to create a version of th=
e system and
>>>>>>>           then testing the integrated system. System testing checks=
 that
>>>>>>>           components are compatible, interact correctly, and transf=
er the right
>>>>>>>           data at the right time across their interfaces." [7]
>>>>>>>
>>>>>>> The tests implemented inside the QEMU "acceptance" directory depend=
 on the
>>>>>>> software completely assembled and, sometimes, on other elements, li=
ke operating
>>>>>>> system images. In this case, the proposal here is to rename the cur=
rent
>>>>>>> "acceptance" directory to "system."
>>>>>>
>>>>>> Are user-mode tests using Avocado also system tests?
>>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html
>>>>>
>>>>> We've indeed got the problem that the word "system" is a little bit
>>>>> overloaded in the context of QEMU. We often talk about "system" when
>>>>> referring to the qemu-softmmu-xxx emulators (in contrast to the linux=
-user
>>>>> emulator binaries). For example, the "--disable-system" switch of the
>>>>> configure script, or the "build-system" and "check-system" jobs in the
>>>>> .gitlab-ci.yml file ... thus this could get quite confusing in the
>>>>> .gitlab-ci.yml file afterwards.
>>>>
>>>> I agree with you here. After I made the changes to the code, I noticed
>>>> QEMU has the "system" word spread all over the place. That may confuse
>>>> people looking at the "system tests" without much interaction with
>>>> software testing terminology.
>>>>
>>>>>
>>>>> So I think renaming "acceptance" to "system" is especially ok if we o=
nly
>>>>> keep the "softmmu"-related tests in that folder... would it maybe mak=
e sense
>>>>> to add the linux-user related tests in a separate folder called tests=
/user/
>>>>> instead, Philippe? And we should likely rename the current build-syst=
em and
>>>>> check-system jobs in our gitlab-CI to build-softmmu and check-softmmu=
 or so?
>>>>>
>>>>
>>>> As I mentioned in Philippe's reply, those tests are still considered
>>>> system tests because system testing is the software built and
>>>> interacting with external test artifacts in software engineering.
>>>>
>>>>> Alternatively, what about renaming the "acceptance" tests to "validat=
ion"
>>>>> instead? That word does not have a duplicated definition in the conte=
xt of
>>>>> QEMU yet, so I think it would be less confusing.
>>>>
>>>> While at the beginning of your reply, I started thinking if
>>>> "validation" would cause less confusion for the QEMU project. Although
>>>> validation testing is a broader concept inside the Verification &
>>>> Validation process, encompassing unit testing, functional testing,
>>>> integration testing, system testing, and acceptance testing, it may be
>>>> an option for the QEMU project.
>>>>
>>>> While system testing would be the correct terminology to use, if it
>>>> causes more confusion, using a less strict terminology, like
>>>> validation testing, is valid, in my opinion.
>>>
>>> This works for me:
>>>
>>> - tests/system/softmmu
>>> - tests/system/user
>>>
>>> Or validation, as you prefer.
>>=20
>> So what are tests/tcg if not user tests? They *mostly* test
>> linux-user emulation but of course we have softmmu tests in there as
>> well.=20
>
> I expect a tests/tcg/ to check a specific TCG feature, which doesn't
> have to be user-mode specific (IIRC Xtensa does some sysemu checks).
> Also, you control the compiler toolchain, flags, etc... so you can
> adapt for a specific feature bit to test, use kludges and so on.

Well I won't say there are things that couldn't be tested elsewhere. I
think the initial record/replay tests are probably replaceable by the
acceptance/whatever tests - and possibly the gdbstub tests as well.

> I expect tests in tests/system/ (user/softmmu) to user real-world
> binaries, which we aren't modifying. Sometime non-public/released
> compiler toolchain has been used.

LTP binaries?

>
> See for example the test referred tests the bFLT loader (beside
> testing userland Linux binary for Cortex-M).
>
> Another example is the Sony PlayStation2 binary testing the
> O32 ABI and multiple opcodes from the TX79 SIMD core:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782493.html
>
> Personally I'm not interested in writing a test for a loader or
> multiple opcodes when we have pre-built binaries. For the opcodes
> coverage I'd use a TCG plugin to confirm the opcodes have been
> used.
>
> If you think these tests belong to tests/tcg/, I am OK to put
> them they, but I don't think adding the Avocado buildsys
> machinery to the already-complex tests/tcg/ Makefiles is going
> to help us...

No I wasn't advocating that - it was more a comment on the naming of
things. -ETOOMUCHFRIDAYBIKESHEDDING...

>
> Regards,
>
> Phil.


--=20
Alex Benn=C3=A9e
