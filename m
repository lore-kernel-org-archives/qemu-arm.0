Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359b94sm367255666b.106.2024.12.16.11.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 11:32:47 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B3A705F952;
	Mon, 16 Dec 2024 19:32:46 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Radoslaw Biernacki <rad@semihalf.com>,
  qemu-stable@nongnu.org,  Andrei Homescu <ahomescu@google.com>,  Arve
 =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@google.com>,  =?utf-8?Q?R=C3=A9mi?=
 Denis-Courmont
 <remi.denis.courmont@huawei.com>
Subject: Re: [PATCH 3/3] target/arm: implement SEL2 physical and virtual timers
In-Reply-To: <CAFEAcA8mi=gTBvh9FqyMFeyqAHqirkah84sW4m8axKPqwMZDkQ@mail.gmail.com>
	(Peter Maydell's message of "Mon, 16 Dec 2024 18:14:55 +0000")
References: <20241206160239.3229094-1-alex.bennee@linaro.org>
	<20241206160239.3229094-4-alex.bennee@linaro.org>
	<CAFEAcA8mi=gTBvh9FqyMFeyqAHqirkah84sW4m8axKPqwMZDkQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 16 Dec 2024 19:32:46 +0000
Message-ID: <877c7z1l0h.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fiSk7V3bStHk

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 6 Dec 2024 at 16:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> When FEAT_SEL2 was implemented the SEL2 timers where missed. This
>> shows up when building the latest Hafnium with SPMC_AT_EL=3D2. The
>> actual implementation utilises the same logic as the rest of the
>> timers so all we need to do is:
>>
>>   - define the timers and their access functions
>>   - conditionally add the correct system registers
>>   - create a new accessfn as the rules are subtly different to the
>>     existing secure timer
>>
>> Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: qemu-stable@nongnu.org
>> Cc: Andrei Homescu <ahomescu@google.com>
>> Cc: Arve Hj=C3=B8nnev=C3=A5g <arve@google.com>
>> Cc: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>>
>> ---
>> v1
>>   - add better comments to GTIMER descriptions
>>   - also define new timers for sbsa-ref
>>   - don't conditionally gate qemu_timer creation on the feature
>>   - take cntvoff_el2 int account for SEC_VEL2 in gt_recalc/g_tval_[read|=
write]
>> ---
>>  include/hw/arm/bsa.h |   2 +
>>  target/arm/cpu.h     |   2 +
>>  target/arm/gtimer.h  |   4 +-
>>  hw/arm/sbsa-ref.c    |   2 +
>>  hw/arm/virt.c        |   2 +
>
> I would put the board changes in their own patch(es).

Won't that break bisection?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
