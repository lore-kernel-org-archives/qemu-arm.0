Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z18sm8011759wrh.16.2021.04.28.05.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 05:07:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B1ADC1FF7E;
	Wed, 28 Apr 2021 13:07:07 +0100 (BST)
References: <20210428101844.22656-1-alex.bennee@linaro.org>
 <20210428101844.22656-2-alex.bennee@linaro.org>
 <eaed3c63988513fe2849c2d6f22937af@kernel.org>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, shashi.mallela@linaro.org,
 alexandru.elisei@arm.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/4] arm64: split its-trigger test
 into KVM and TCG variants
Date: Wed, 28 Apr 2021 13:06:18 +0100
In-reply-to: <eaed3c63988513fe2849c2d6f22937af@kernel.org>
Message-ID: <87fszasjdg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: v2SonhQQ7UMU


Marc Zyngier <maz@kernel.org> writes:

> On 2021-04-28 11:18, Alex Benn=C3=A9e wrote:
>> A few of the its-trigger tests rely on IMPDEF behaviour where caches
>> aren't flushed before invall events. However TCG emulation doesn't
>> model any invall behaviour and as we can't probe for it we need to be
>> told. Split the test into a KVM and TCG variant and skip the invall
>> tests when under TCG.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Shashi Mallela <shashi.mallela@linaro.org>
>> ---
>>  arm/gic.c         | 60 +++++++++++++++++++++++++++--------------------
>>  arm/unittests.cfg | 11 ++++++++-
>>  2 files changed, 45 insertions(+), 26 deletions(-)
>> diff --git a/arm/gic.c b/arm/gic.c
>> index 98135ef..96a329d 100644
>> --- a/arm/gic.c
>> +++ b/arm/gic.c
>> @@ -36,6 +36,7 @@ static struct gic *gic;
>>  static int acked[NR_CPUS], spurious[NR_CPUS];
>>  static int irq_sender[NR_CPUS], irq_number[NR_CPUS];
>>  static cpumask_t ready;
>> +static bool under_tcg;
>>  static void nr_cpu_check(int nr)
>>  {
>> @@ -734,32 +735,38 @@ static void test_its_trigger(void)
>>  	/*
>>  	 * re-enable the LPI but willingly do not call invall
>>  	 * so the change in config is not taken into account.
>> -	 * The LPI should not hit
>> +	 * The LPI should not hit. This does however depend on
>> +	 * implementation defined behaviour - under QEMU TCG emulation
>> +	 * it can quite correctly process the event directly.
>
> It looks to me that you are using an IMPDEF behaviour of *TCG*
> here. The programming model mandates that there is an invalidation
> if you change the configuration of the LPI.

But does it mandate that the LPI cannot be sent until the invalidation?

>
>         M.


--=20
Alex Benn=C3=A9e
