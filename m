Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id jl17sm14870439ejc.13.2022.02.01.05.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 05:10:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E8B0C1FFB7;
	Tue,  1 Feb 2022 13:10:45 +0000 (GMT)
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
 <20211112132312.qrgmby55mlenj72p@gator.home> <87wnldfoul.fsf@linaro.org>
 <20211112145442.5ktlpwyolwdsxlnx@gator.home> <877dd4umy6.fsf@linaro.org>
 <20211119183059.jwrhb77jfjbv5rbz@gator.home> <87a6hlzq8t.fsf@linaro.org>
 <20211130143425.bh27yy47vpihllvs@gator.home>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Date: Tue, 01 Feb 2022 13:10:13 +0000
In-reply-to: <20211130143425.bh27yy47vpihllvs@gator.home>
Message-ID: <87sft2yboq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ed3JKxmkWmyY


Andrew Jones <drjones@redhat.com> writes:

> On Tue, Nov 30, 2021 at 02:11:34PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Andrew Jones <drjones@redhat.com> writes:
>>=20
>> > On Fri, Nov 19, 2021 at 04:30:47PM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> Andrew Jones <drjones@redhat.com> writes:
>> >>=20
>> >> > On Fri, Nov 12, 2021 at 02:08:01PM +0000, Alex Benn=C3=A9e wrote:
>> >> >>=20
>> >> >> Andrew Jones <drjones@redhat.com> writes:
>> >> >>=20
>> >> >> > On Fri, Nov 12, 2021 at 11:47:31AM +0000, Alex Benn=C3=A9e wrote:
>> >> >> >> Hi,
>> >> >> >>=20
>> >> >> >> Sorry this has been sitting in my tree so long. The changes are=
 fairly
>> >> >> >> minor from v2. I no longer split the tests up into TCG and KVM
>> >> >> >> versions and instead just ensure that ERRATA_FORCE is always se=
t when
>> >> >> >> run under TCG.
>> >> >> >>=20
>> >> >> >> Alex Benn=C3=A9e (3):
>> >> >> >>   arm64: remove invalid check from its-trigger test
>> >> >> >>   arm64: enable its-migration tests for TCG
>> >> >> >>   arch-run: do not process ERRATA when running under TCG
>> >> >> >>=20
>> >> >> >>  scripts/arch-run.bash |  4 +++-
>> >> >> >>  arm/gic.c             | 16 ++++++----------
>> >> >> >>  arm/unittests.cfg     |  3 ---
>> >> >> >>  3 files changed, 9 insertions(+), 14 deletions(-)
>> >> >> >>=20
>> >> >> >> --=20
>> >> >> >> 2.30.2
>> >> >> >>=20
>> >> >> >> _______________________________________________
>> >> >> >> kvmarm mailing list
>> >> >> >> kvmarm@lists.cs.columbia.edu
>> >> >> >> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
>> >> >> >
>> >> >> > Hi Alex,
>> >> >> >
>> >> >> > Thanks for this. I've applied to arm/queue, but I see that
>> >> >> >
>> >> >> > FAIL: gicv3: its-trigger: inv/invall: dev2/eventid=3D20 pending =
LPI is received
>> >> >> >
>> >> >> > consistently fails for me. Is that expected? Does it work for yo=
u?
>> >> >>=20
>> >> >> doh - looks like I cocked up the merge conflict...
>> >> >>=20
>> >> >> Did it fail for TCG or for KVM (or both)?
>> >> >
>> >> > Just TCG, which was why I was wondering if it was expected. I've ne=
ver run
>> >> > these tests with TCG before.
>> >>=20
>> >> Hmm I think expecting the IRQ at all is broken so I think I should
>> >> delete the whole pending test.
>> >
>> > Feel free to repost. I'll update the patches in arm/queue before my ne=
xt
>> > MR.
>>=20
>> Actually I think the problem was with a regression in the TCG ITS
>> support (now fixed in master). So I believe as of v3 everything is
>> correct (and v4 should be ignored).
>>=20
>> Are you happy to apply this series or do you want me to repost it as v5?
>
> No need to repost. I'll retest v3 with latest QEMU.

Gentle ping, I'm trying to clear this off my internal JIRA so let me
know if you want me to do anything to help.

>
> Thanks,
> drew


--=20
Alex Benn=C3=A9e
