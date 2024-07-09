Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bda308d7sm1088890a12.91.2024.07.09.07.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 07:05:08 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4247C5F8D7;
	Tue,  9 Jul 2024 15:05:07 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,  pbonzini@redhat.com,
  drjones@redhat.com,  thuth@redhat.com,  kvm@vger.kernel.org,
  qemu-arm@nongnu.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.cs.columbia.edu,  christoffer.dall@arm.com,  maz@kernel.org,
  Anders Roxell <anders.roxell@linaro.org>,  Andrew Jones
 <andrew.jones@linux.dev>,  Eric Auger <eric.auger@redhat.com>,  "open
 list:ARM" <kvmarm@lists.linux.dev>
Subject: Re: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU
 introspection test if missing
In-Reply-To: <CAFEAcA-LFtAi0DkFGc0Q3TYR_+X3TUWQru8crhbKun4EHctcdQ@mail.gmail.com>
	(Peter Maydell's message of "Tue, 9 Jul 2024 10:33:28 +0100")
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
	<20240702163515.1964784-2-alex.bennee@linaro.org>
	<Zoz7sQNoC9ePXH7w@arm.com>
	<CAFEAcA-LFtAi0DkFGc0Q3TYR_+X3TUWQru8crhbKun4EHctcdQ@mail.gmail.com>
Date: Tue, 09 Jul 2024 15:05:07 +0100
Message-ID: <87ed82slt8.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: F6aAIe0ZsjRi

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 9 Jul 2024 at 09:58, Alexandru Elisei <alexandru.elisei@arm.com> =
wrote:
>>
>> Hi,
>>
>> On Tue, Jul 02, 2024 at 05:35:14PM +0100, Alex Benn=C3=A9e wrote:
>> > The test for number of events is not a substitute for properly
>> > checking the feature register. Fix the define and skip if PMUv3 is not
>> > available on the system. This includes emulator such as QEMU which
>> > don't implement PMU counters as a matter of policy.
>> >
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Cc: Anders Roxell <anders.roxell@linaro.org>
>> > ---
>> >  arm/pmu.c | 7 ++++++-
>> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arm/pmu.c b/arm/pmu.c
>> > index 9ff7a301..66163a40 100644
>> > --- a/arm/pmu.c
>> > +++ b/arm/pmu.c
>> > @@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool overflow_=
at_64bits) {}
>> >  #define ID_AA64DFR0_PERFMON_MASK  0xf
>> >
>> >  #define ID_DFR0_PMU_NOTIMPL  0b0000
>> > -#define ID_DFR0_PMU_V3               0b0001
>> > +#define ID_DFR0_PMU_V3               0b0011
>> >  #define ID_DFR0_PMU_V3_8_1   0b0100
>> >  #define ID_DFR0_PMU_V3_8_4   0b0101
>> >  #define ID_DFR0_PMU_V3_8_5   0b0110
>> > @@ -286,6 +286,11 @@ static void test_event_introspection(void)
>> >               return;
>> >       }
>> >
>> > +     if (pmu.version < ID_DFR0_PMU_V3) {
>> > +             report_skip("PMUv3 extensions not supported, skip ...");
>> > +             return;
>> > +     }
>> > +
>>
>> I don't get this patch - test_event_introspection() is only run on 64bit=
. On
>> arm64, if there is a PMU present, that PMU is a PMUv3.  A prerequisite to
>> running any PMU tests is for pmu_probe() to succeed, and pmu_probe() fai=
ls if
>> there is no PMU implemented (PMUVer is either 0, or 0b1111). As a result=
, if
>> test_event_introspection() is executed, then a PMUv3 is present.
>>
>> When does QEMU advertise FEAT_PMUv3*, but no event counters (other than =
the cycle
>> counter)?

The other option I have is this:

--8<---------------cut here---------------start------------->8---
arm/pmu: event-introspection needs icount for TCG

The TCG accelerator will report a PMU (unless explicitly disabled with
-cpu foo,pmu=3Doff) however not all events are available unless you run
under icount. Fix this by splitting the test into a kvm and tcg
version.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

1 file changed, 8 insertions(+)
arm/unittests.cfg | 8 ++++++++

modified   arm/unittests.cfg
@@ -52,8 +52,16 @@ extra_params =3D -append 'cycle-counter 0'
 file =3D pmu.flat
 groups =3D pmu
 arch =3D arm64
+accel =3D kvm
 extra_params =3D -append 'pmu-event-introspection'
=20
+[pmu-event-introspection-icount]
+file =3D pmu.flat
+groups =3D pmu
+arch =3D arm64
+accel =3D tcg
+extra_params =3D -icount shift=3D1 -append 'pmu-event-introspection'
+
 [pmu-event-counter-config]
 file =3D pmu.flat
 groups =3D pmu
--8<---------------cut here---------------end--------------->8---

which just punts icount on TCG to its own test (note there are commented
out versions further down the unitests.cfg file)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
