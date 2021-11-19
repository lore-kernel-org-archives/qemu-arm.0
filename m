Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h15sm15359588wmq.32.2021.11.19.08.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:31:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 053491FF96;
	Fri, 19 Nov 2021 16:31:14 +0000 (GMT)
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
 <20211112132312.qrgmby55mlenj72p@gator.home> <87wnldfoul.fsf@linaro.org>
 <20211112145442.5ktlpwyolwdsxlnx@gator.home>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Date: Fri, 19 Nov 2021 16:30:47 +0000
In-reply-to: <20211112145442.5ktlpwyolwdsxlnx@gator.home>
Message-ID: <877dd4umy6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6aD1Dw3R6kKc


Andrew Jones <drjones@redhat.com> writes:

> On Fri, Nov 12, 2021 at 02:08:01PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Andrew Jones <drjones@redhat.com> writes:
>>=20
>> > On Fri, Nov 12, 2021 at 11:47:31AM +0000, Alex Benn=C3=A9e wrote:
>> >> Hi,
>> >>=20
>> >> Sorry this has been sitting in my tree so long. The changes are fairly
>> >> minor from v2. I no longer split the tests up into TCG and KVM
>> >> versions and instead just ensure that ERRATA_FORCE is always set when
>> >> run under TCG.
>> >>=20
>> >> Alex Benn=C3=A9e (3):
>> >>   arm64: remove invalid check from its-trigger test
>> >>   arm64: enable its-migration tests for TCG
>> >>   arch-run: do not process ERRATA when running under TCG
>> >>=20
>> >>  scripts/arch-run.bash |  4 +++-
>> >>  arm/gic.c             | 16 ++++++----------
>> >>  arm/unittests.cfg     |  3 ---
>> >>  3 files changed, 9 insertions(+), 14 deletions(-)
>> >>=20
>> >> --=20
>> >> 2.30.2
>> >>=20
>> >> _______________________________________________
>> >> kvmarm mailing list
>> >> kvmarm@lists.cs.columbia.edu
>> >> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
>> >
>> > Hi Alex,
>> >
>> > Thanks for this. I've applied to arm/queue, but I see that
>> >
>> > FAIL: gicv3: its-trigger: inv/invall: dev2/eventid=3D20 pending LPI is=
 received
>> >
>> > consistently fails for me. Is that expected? Does it work for you?
>>=20
>> doh - looks like I cocked up the merge conflict...
>>=20
>> Did it fail for TCG or for KVM (or both)?
>
> Just TCG, which was why I was wondering if it was expected. I've never run
> these tests with TCG before.

Hmm I think expecting the IRQ at all is broken so I think I should
delete the whole pending test.

>
> Thanks,
> drew


--=20
Alex Benn=C3=A9e
