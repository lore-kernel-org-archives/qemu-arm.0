Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q4sm5912967wrs.56.2021.11.12.06.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 06:08:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B88221FF96;
	Fri, 12 Nov 2021 14:08:50 +0000 (GMT)
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
 <20211112132312.qrgmby55mlenj72p@gator.home>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Date: Fri, 12 Nov 2021 14:08:01 +0000
In-reply-to: <20211112132312.qrgmby55mlenj72p@gator.home>
Message-ID: <87wnldfoul.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 129gvXk0JbBA


Andrew Jones <drjones@redhat.com> writes:

> On Fri, Nov 12, 2021 at 11:47:31AM +0000, Alex Benn=C3=A9e wrote:
>> Hi,
>>=20
>> Sorry this has been sitting in my tree so long. The changes are fairly
>> minor from v2. I no longer split the tests up into TCG and KVM
>> versions and instead just ensure that ERRATA_FORCE is always set when
>> run under TCG.
>>=20
>> Alex Benn=C3=A9e (3):
>>   arm64: remove invalid check from its-trigger test
>>   arm64: enable its-migration tests for TCG
>>   arch-run: do not process ERRATA when running under TCG
>>=20
>>  scripts/arch-run.bash |  4 +++-
>>  arm/gic.c             | 16 ++++++----------
>>  arm/unittests.cfg     |  3 ---
>>  3 files changed, 9 insertions(+), 14 deletions(-)
>>=20
>> --=20
>> 2.30.2
>>=20
>> _______________________________________________
>> kvmarm mailing list
>> kvmarm@lists.cs.columbia.edu
>> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
>
> Hi Alex,
>
> Thanks for this. I've applied to arm/queue, but I see that
>
> FAIL: gicv3: its-trigger: inv/invall: dev2/eventid=3D20 pending LPI is re=
ceived
>
> consistently fails for me. Is that expected? Does it work for you?

doh - looks like I cocked up the merge conflict...

Did it fail for TCG or for KVM (or both)?

--=20
Alex Benn=C3=A9e
