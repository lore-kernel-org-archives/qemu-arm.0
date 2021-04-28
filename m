Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u17sm6548332wmq.30.2021.04.28.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 09:32:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E47051FF7E;
	Wed, 28 Apr 2021 17:32:48 +0100 (BST)
References: <20210428101844.22656-1-alex.bennee@linaro.org>
 <20210428101844.22656-2-alex.bennee@linaro.org>
 <eaed3c63988513fe2849c2d6f22937af@kernel.org> <87fszasjdg.fsf@linaro.org>
 <996210ae-9c63-54ff-1a65-6dbd63da74d2@arm.com>
 <87k0omo4rr.wl-maz@kernel.org> <87czues90k.fsf@linaro.org>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, kvm@vger.kernel.org,
 shashi.mallela@linaro.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/4] arm64: split its-trigger test
 into KVM and TCG variants
Date: Wed, 28 Apr 2021 17:31:27 +0100
In-reply-to: <87czues90k.fsf@linaro.org>
Message-ID: <877dkms72n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8p2pvmGY+u4n


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Marc Zyngier <maz@kernel.org> writes:
>
>> On Wed, 28 Apr 2021 15:00:15 +0100,
>> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>>>=20
>>> I interpret that as that an INVALL guarantees that a change is
>>> visible, but it the change can become visible even without the
>>> INVALL.
>>
>> Yes. Expecting the LPI to be delivered or not in the absence of an
>> invalidate when its configuration has been altered is wrong. The
>> architecture doesn't guarantee anything of the sort.
>
> Is the underlying hypervisor allowed to invalidate and reload the
> configuration whenever it wants or should it only be driven by the
> guests requests?
>
> I did consider a more nuanced variant of the test that allowed for a
> delivery pre-inval and a pass for post-inval as long as it had been
> delivered one way or another:
>
> --8<---------------cut here---------------start------------->8---
> modified   arm/gic.c
> @@ -36,6 +36,7 @@ static struct gic *gic;
>  static int acked[NR_CPUS], spurious[NR_CPUS];
>  static int irq_sender[NR_CPUS], irq_number[NR_CPUS];
>  static cpumask_t ready;
> +static bool under_tcg;
>=20=20
>  static void nr_cpu_check(int nr)
>  {
> @@ -687,6 +688,7 @@ static void test_its_trigger(void)
>  	struct its_collection *col3;
>  	struct its_device *dev2, *dev7;
>  	cpumask_t mask;
> +	bool before, after;
>=20=20
>  	if (its_setup1())
>  		return;
> @@ -734,15 +736,17 @@ static void test_its_trigger(void)
>  	/*
>  	 * re-enable the LPI but willingly do not call invall
>  	 * so the change in config is not taken into account.
> -	 * The LPI should not hit
> +	 * The LPI should not hit. This does however depend on
> +	 * implementation defined behaviour - under QEMU TCG emulation
> +	 * it can quite correctly process the event directly.
>  	 */
>  	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
>  	stats_reset();
>  	cpumask_clear(&mask);
>  	its_send_int(dev2, 20);
>  	wait_for_interrupts(&mask);
> -	report(check_acked(&mask, -1, -1),
> -			"dev2/eventid=3D20 still does not trigger any LPI");
> +	before =3D check_acked(&mask, -1, -1);
> +	report_xfail(under_tcg, before, "dev2/eventid=3D20 still may not trigge=
r any LPI");
>=20=20
>  	/* Now call the invall and check the LPI hits */
>  	stats_reset();
> @@ -750,8 +754,8 @@ static void test_its_trigger(void)
>  	cpumask_set_cpu(3, &mask);
>  	its_send_invall(col3);
>  	wait_for_interrupts(&mask);
> -	report(check_acked(&mask, 0, 8195),
> -			"dev2/eventid=3D20 pending LPI is received");
> +	after =3D check_acked(&mask, 0, 8195);
> +	report(before !=3D after, "dev2/eventid=3D20 pending LPI is
>  	received");

Actually that should be:

         report(after || !before, "dev2/eventid=3D20 pending LPI is receive=
d");

so either the IRQ arrives after the flush or it had previously.

--=20
Alex Benn=C3=A9e
