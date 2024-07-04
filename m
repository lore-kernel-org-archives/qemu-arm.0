Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77ba8dab57sm35135566b.55.2024.07.04.03.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 03:32:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D11015F839;
	Thu,  4 Jul 2024 11:32:23 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Zenghui Yu <yuzenghui@huawei.com>,  pbonzini@redhat.com,
  thuth@redhat.com,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  linux-arm-kernel@lists.infradead.org,  christoffer.dall@arm.com,  Anders
 Roxell <anders.roxell@linaro.org>,  Andrew Jones <andrew.jones@linux.dev>,
  Alexandru Elisei <alexandru.elisei@arm.com>,  Eric Auger
 <eric.auger@redhat.com>,  "open list:ARM" <kvmarm@lists.linux.dev>
Subject: Re: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU
 introspection test if missing
In-Reply-To: <74e184afbc4b58fba984b91964915a9e@kernel.org> (Marc Zyngier's
	message of "Wed, 03 Jul 2024 08:23:37 +0100")
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
	<20240702163515.1964784-2-alex.bennee@linaro.org>
	<8c11996c-b36d-e560-cdeb-e543ee478a54@huawei.com>
	<74e184afbc4b58fba984b91964915a9e@kernel.org>
Date: Thu, 04 Jul 2024 11:32:23 +0100
Message-ID: <87ed89o3bc.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8SVm1ePgczR3

Marc Zyngier <maz@kernel.org> writes:

> On 2024-07-03 08:09, Zenghui Yu wrote:
>> On 2024/7/3 0:35, Alex Benn=C3=A9e wrote:
>>> The test for number of events is not a substitute for properly
>>> checking the feature register. Fix the define and skip if PMUv3 is not
>>> available on the system. This includes emulator such as QEMU which
>>> don't implement PMU counters as a matter of policy.
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Cc: Anders Roxell <anders.roxell@linaro.org>
>>> ---
>>>  arm/pmu.c | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>> diff --git a/arm/pmu.c b/arm/pmu.c
>>> index 9ff7a301..66163a40 100644
>>> --- a/arm/pmu.c
>>> +++ b/arm/pmu.c
>>> @@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool
>>> overflow_at_64bits) {}
>>>  #define ID_AA64DFR0_PERFMON_MASK  0xf
>>>   #define ID_DFR0_PMU_NOTIMPL	0b0000
>>> -#define ID_DFR0_PMU_V3		0b0001
>>> +#define ID_DFR0_PMU_V3		0b0011
>> Why? This is a macro used for AArch64 and DDI0487J.a (D19.2.59, the
>> description of the PMUVer field) says that
>> "0b0001	Performance Monitors Extension, PMUv3 implemented."
>> while 0b0011 is a reserved value.
>
> I think this is a mix of 32bit and 64bit views (ID_DFR0_EL1.PerfMon
> instead of ID_AA64DFR0_EL1.PMUVer), and the whole thing is a mess
> (ID_AA64DFR0_PERFMON_MASK is clearly confused...).
>
> I haven't looked at how this patch fits in the rest of the code
> though.

Doh - yes different set of values for 32 bit.

>
>         M.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
