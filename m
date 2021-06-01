Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c64sm84851wma.15.2021.06.01.09.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 09:52:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2D3831FF7E;
	Tue,  1 Jun 2021 17:52:56 +0100 (BST)
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-5-alex.bennee@linaro.org>
 <5fe1c796-c886-e5c6-6e61-e12d0f73a884@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Cc: kvm@vger.kernel.org, shashi.mallela@linaro.org,
 alexandru.elisei@arm.com, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com, maz@kernel.org
Subject: Re: [kvm-unit-tests PATCH v2 4/4] arm64: split
 its-migrate-unmapped-collection into KVM and TCG variants
Date: Tue, 01 Jun 2021 17:49:01 +0100
In-reply-to: <5fe1c796-c886-e5c6-6e61-e12d0f73a884@redhat.com>
Message-ID: <87sg21bk7r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jMOn0NmAMNP6


Auger Eric <eric.auger@redhat.com> writes:

> Hi Alex,
>
> On 5/25/21 7:26 PM, Alex Benn=C3=A9e wrote:
>> When running the test in TCG we are basically running on bare metal so
>> don't rely on having a particular kernel errata applied.
>>=20
>> You might wonder why we handle this with a totally new test name
>> instead of adjusting the append to take an extra parameter? Well the
>> run_migration shell script uses eval "$@" which unwraps the -append
>> leading to any second parameter being split and leaving QEMU very
>> confused and the test hanging. This seemed simpler than re-writing all
>> the test running logic in something sane ;-)
>
> there is
> lib/s390x/vm.h:bool vm_is_tcg(void)
>
> but I don't see any particular ID we could use to differentiate both the
> KVM and the TCG mode, do you?

For -cpu max we do:

        /*
         * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a=
 real
         * one and try to apply errata workarounds or use impdef features we
         * don't provide.
         * An IMPLEMENTER field of 0 means "reserved for software use";
         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID regis=
ters
         * to see which features are present";
         * the VARIANT, PARTNUM and REVISION fields are all implementation
         * defined and we choose to define PARTNUM just in case guest
         * code needs to distinguish this QEMU CPU from other software
         * implementations, though this shouldn't be needed.
         */
        t =3D FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
        t =3D FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
        t =3D FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
        t =3D FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
        t =3D FIELD_DP64(t, MIDR_EL1, REVISION, 0);
        cpu->midr =3D t;

However for the default -cpu cortex-a57 we aim to look just like the
real thing - only without any annoying micro-architecture bugs ;-)

>
> without a more elegant solution,

I'll look into the suggestion made by Richard.

> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>
> Thanks
>
> Eric
>
>
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Shashi Mallela <shashi.mallela@linaro.org>
>> ---
>>  arm/gic.c         |  8 +++++++-
>>  arm/unittests.cfg | 10 +++++++++-
>>  2 files changed, 16 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arm/gic.c b/arm/gic.c
>> index bef061a..0fce2a4 100644
>> --- a/arm/gic.c
>> +++ b/arm/gic.c
>> @@ -36,6 +36,7 @@ static struct gic *gic;
>>  static int acked[NR_CPUS], spurious[NR_CPUS];
>>  static int irq_sender[NR_CPUS], irq_number[NR_CPUS];
>>  static cpumask_t ready;
>> +static bool under_tcg;
>>=20=20
>>  static void nr_cpu_check(int nr)
>>  {
>> @@ -834,7 +835,7 @@ static void test_migrate_unmapped_collection(void)
>>  		goto do_migrate;
>>  	}
>>=20=20
>> -	if (!errata(ERRATA_UNMAPPED_COLLECTIONS)) {
>> +	if (!errata(ERRATA_UNMAPPED_COLLECTIONS) && !under_tcg) {
>>  		report_skip("Skipping test, as this test hangs without the fix. "
>>  			    "Set %s=3Dy to enable.", ERRATA_UNMAPPED_COLLECTIONS);
>>  		test_skipped =3D true;
>> @@ -1005,6 +1006,11 @@ int main(int argc, char **argv)
>>  		report_prefix_push(argv[1]);
>>  		test_migrate_unmapped_collection();
>>  		report_prefix_pop();
>> +	} else if (!strcmp(argv[1], "its-migrate-unmapped-collection-tcg")) {
>> +		under_tcg =3D true;
>> +		report_prefix_push(argv[1]);
>> +		test_migrate_unmapped_collection();
>> +		report_prefix_pop();
>>  	} else if (strcmp(argv[1], "its-introspection") =3D=3D 0) {
>>  		report_prefix_push(argv[1]);
>>  		test_its_introspection();
>> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
>> index 1a39428..adc1bbf 100644
>> --- a/arm/unittests.cfg
>> +++ b/arm/unittests.cfg
>> @@ -205,7 +205,7 @@ extra_params =3D -machine gic-version=3D3 -append 'i=
ts-pending-migration'
>>  groups =3D its migration
>>  arch =3D arm64
>>=20=20
>> -[its-migrate-unmapped-collection]
>> +[its-migrate-unmapped-collection-kvm]
>>  file =3D gic.flat
>>  smp =3D $MAX_SMP
>>  accel =3D kvm
>> @@ -213,6 +213,14 @@ extra_params =3D -machine gic-version=3D3 -append '=
its-migrate-unmapped-collection'
>>  groups =3D its migration
>>  arch =3D arm64
>>=20=20
>> +[its-migrate-unmapped-collection-tcg]
>> +file =3D gic.flat
>> +smp =3D $MAX_SMP
>> +accel =3D tcg
>> +extra_params =3D -machine gic-version=3D3 -append 'its-migrate-unmapped=
-collection-tcg'
>> +groups =3D its migration
>> +arch =3D arm64
>> +
>>  # Test PSCI emulation
>>  [psci]
>>  file =3D psci.flat
>>=20


--=20
Alex Benn=C3=A9e
