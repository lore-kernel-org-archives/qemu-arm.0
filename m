Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s10-20020a5d6a8a000000b002efdf3e5be0sm7736513wru.44.2023.04.11.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 00:45:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0218F1FFB7;
	Tue, 11 Apr 2023 08:45:57 +0100 (BST)
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230321152649.zae7edlfub76fyqq@orel>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, kvmarm@lists.linux.dev, qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 0/7] MTTCG sanity tests for ARM
Date: Tue, 11 Apr 2023 08:43:49 +0100
In-reply-to: <20230321152649.zae7edlfub76fyqq@orel>
Message-ID: <87mt3erhe3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: M+7F0Eua7V95


Andrew Jones <andrew.jones@linux.dev> writes:

> On Tue, Mar 07, 2023 at 11:28:38AM +0000, Alex Benn=C3=A9e wrote:
>> I last had a go at getting these up-streamed at the end of 2021 so
>> its probably worth having another go. From the last iteration a
>> number of the groundwork patches did get merged:
>>=20
>>   Subject: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
>>   Date: Thu,  2 Dec 2021 11:53:43 +0000
>>   Message-Id: <20211202115352.951548-1-alex.bennee@linaro.org>
>>=20
>> So this leaves a minor gtags patch, adding the isaac RNG library which
>> would also be useful for other users, see:
>>=20
>>   Subject: [kvm-unit-tests PATCH v3 11/27] lib: Add random number genera=
tor
>>   Date: Tue, 22 Nov 2022 18:11:36 +0200
>>   Message-Id: <20221122161152.293072-12-mlevitsk@redhat.com>
>>=20
>> Otherwise there are a few minor checkpatch tweaks.
>>=20
>> I would still like to enable KVM unit tests inside QEMU as things like
>> the x86 APIC tests are probably a better fit for unit testing TCG
>> emulation than booting a whole OS with various APICs enabled.
>>=20
>> Alex Benn=C3=A9e (7):
>>   Makefile: add GNU global tags support
>>   add .gitpublish metadata
>>   lib: add isaac prng library from CCAN
>>   arm/tlbflush-code: TLB flush during code execution
>>   arm/locking-tests: add comprehensive locking test
>>   arm/barrier-litmus-tests: add simple mp and sal litmus tests
>>   arm/tcg-test: some basic TCG exercising tests
>>=20
>>  Makefile                  |   5 +-
>>  arm/Makefile.arm          |   2 +
>>  arm/Makefile.arm64        |   2 +
>>  arm/Makefile.common       |   6 +-
>>  lib/arm/asm/barrier.h     |  19 ++
>>  lib/arm64/asm/barrier.h   |  50 +++++
>>  lib/prng.h                |  83 +++++++
>>  lib/prng.c                | 163 ++++++++++++++
>>  arm/tcg-test-asm.S        | 171 +++++++++++++++
>>  arm/tcg-test-asm64.S      | 170 ++++++++++++++
>>  arm/barrier-litmus-test.c | 450 ++++++++++++++++++++++++++++++++++++++
>>  arm/locking-test.c        | 321 +++++++++++++++++++++++++++
>>  arm/spinlock-test.c       |  87 --------
>>  arm/tcg-test.c            | 340 ++++++++++++++++++++++++++++
>>  arm/tlbflush-code.c       | 209 ++++++++++++++++++
>>  arm/unittests.cfg         | 170 ++++++++++++++
>>  .gitignore                |   3 +
>>  .gitpublish               |  18 ++
>>  18 files changed, 2180 insertions(+), 89 deletions(-)
>>  create mode 100644 lib/prng.h
>>  create mode 100644 lib/prng.c
>>  create mode 100644 arm/tcg-test-asm.S
>>  create mode 100644 arm/tcg-test-asm64.S
>>  create mode 100644 arm/barrier-litmus-test.c
>>  create mode 100644 arm/locking-test.c
>>  delete mode 100644 arm/spinlock-test.c
>>  create mode 100644 arm/tcg-test.c
>>  create mode 100644 arm/tlbflush-code.c
>>  create mode 100644 .gitpublish
>>=20
>> --=20
>> 2.39.2
>>
>
> I don't see any problem with the series, but I didn't review it closely.
> I think it's unlikely we'll get reviewers, but, as the tests are
> nodefault, then that's probably OK. Can you make sure all tests have a
> "tcg" type prefix when they are TCG-only, like the last patch does for
> its tests? That will help filter them out when building all tests as
> standalone tests.

tcg-tests is the only test that explicitly targets TCG behaviour (in the
choice of loops and SMC). The other tests are architecture validation
tests which should just be easy passes on real silicon.

> Someday mkstandalone could maybe learn how to build
> a directory hierarchy using the group names, e.g.
>
>  tests/mttcg/tlb/all_other

So nodefault isn't enough for this?

>
> but I don't expect to have time for that myself anytime soon, so prefixes
> will likely have to do for now (or forever).
>
> Thanks,
> drew


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
