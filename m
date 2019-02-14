Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d16sm2716249wru.52.2019.02.14.06.44.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Feb 2019 06:44:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C98FD1FF80;
	Thu, 14 Feb 2019 14:44:08 +0000 (UTC)
References: <20190205190224.2198-1-alex.bennee@linaro.org> <CAFEAcA_FdK2HsFto8zBZnoZQWyrnKLtskOz6Sb42n_qBw-qV=Q@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2 0/6] HWCAP_CPUID registers for aarch64
In-reply-to: <CAFEAcA_FdK2HsFto8zBZnoZQWyrnKLtskOz6Sb42n_qBw-qV=Q@mail.gmail.com>
Date: Thu, 14 Feb 2019 14:44:08 +0000
Message-ID: <874l96ig5j.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ofLg9T6jgJwq


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 5 Feb 2019 at 20:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Hi,
>>
>> I've re-spun the cpuid patches with the changes suggested by Peter's
>> review. The biggest change is the squashing of bits is now all data
>> driven with ARMCPRegUserSpaceInfo being used to control how bits are
>> altered for userspace presentation. This includes using glob matching
>> to set whole bunches to RAZ.
>>
>> The testcase isn't as comprehensive as it could be because you need a
>> fairly new compiler (binutils) to emit all the various system register
>> id's to test. I did look into upgrading debian-arm64-cross with Buster
>> but I managed to find a bug in Debian's dependencies which rules out
>> upgrading for now.
>>
>> checkpatch is complaining about the _m macro I used to group together
>> words in the masks I defined. I'm not sure adding the spaces makes it
>> as readable though.
>>
>> The following patches need review:
>>  patch 0001/target arm relax permission checks for HWCAP_CPUI.patch
>>  patch 0002/target arm expose CPUID registers to userspace.patch
>>  patch 0003/target arm expose MPIDR_EL1 to userspace.patch
>>  patch 0004/target arm expose remaining CPUID registers as RA.patch
>>  patch 0006/tests tcg aarch64 userspace system register test.patch
>
> I'll take 1-5 into target-arm.next, but 6 breaks 'make check-tcg'
> for me:
>
>   BUILD   aarch64 guest-tests with aarch64-linux-gnu-gcc
> cc1: error: invalid feature modifier in =E2=80=98-march=3Darmv8.1-a+sve=
=E2=80=99
>
> I imagine you're assuming a newer binutils than Ubuntu ships.
> You should probably go for just encoding the insns rather than using
> their names -- binutils should accept "S<op0>_<op1>_<Cn>_<Cm>_<op2>"
> as a register name for mrs and msr insn.


Yeah I'm now on buster so have a newer gcc:

  aarch64-linux-gnu-gcc (Debian 8.2.0-11) 8.2.0

But I'm surprised that the pauth test cases worked on your system.
However they should all work with the recent docker update which you
merged earlier this week.

> It would also be nice to test some of the sysreg cases which
> go through your "glob the register name" code path -- I think
> at the moment you are only testing the ones which use the
> specific-match case ? (Ideally we'd loop through and test that
> we could read everything in the defined-to-be-exposed encoding
> range, though that would require some slightly tedious preprocessor
> macro effort.)

Yeah the main reason I didn't push to hard to do it but I guess we
should for completeness sake. It's times like this I wish C's macros
weren't the pale imitations of what you can do with lisp (or rust ;-).

--
Alex Benn=C3=A9e
