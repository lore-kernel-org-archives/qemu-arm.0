Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h2sm5204759wrz.23.2021.11.26.04.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 04:01:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6F2FE1FF96;
	Fri, 26 Nov 2021 12:01:08 +0000 (GMT)
References: <20211124202005.989935-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v2] hw/intc/arm_gicv3: Update cached state after LPI
 state changes
Date: Thu, 25 Nov 2021 15:37:53 +0000
In-reply-to: <20211124202005.989935-1-peter.maydell@linaro.org>
Message-ID: <877dcvf7nf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vpcA01aMG4bL


Peter Maydell <peter.maydell@linaro.org> writes:

> The logic of gicv3_redist_update() is as follows:
>  * it must be called in any code path that changes the state of
>    (only) redistributor interrupts
>  * if it finds a redistributor interrupt that is (now) higher
>    priority than the previous highest-priority pending interrupt,
>    then this must be the new highest-priority pending interrupt
>  * if it does *not* find a better redistributor interrupt, then:
>     - if the previous state was "no interrupts pending" then
>       the new state is still "no interrupts pending"
>     - if the previous best interrupt was not a redistributor
>       interrupt then that remains the best interrupt
>     - if the previous best interrupt *was* a redistributor interrupt,
>       then the new best interrupt must be some non-redistributor
>       interrupt, but we don't know which so must do a full scan
>
> In commit 17fb5e36aabd4b2c125 we effectively added the LPI interrupts
> as a kind of "redistributor interrupt" for this purpose, by adding
> cs->hpplpi to the set of things that gicv3_redist_update() considers
> before it gives up and decides to do a full scan of distributor
> interrupts. However we didn't quite get this right:
>  * the condition check for "was the previous best interrupt a
>    redistributor interrupt" must be updated to include LPIs
>    in what it considers to be redistributor interrupts
>  * every code path which updates the LPI state which
>    gicv3_redist_update() checks must also call gicv3_redist_update():
>    this is cs->hpplpi and the GICR_CTLR ENABLE_LPIS bit
>
> This commit fixes this by:
>  * correcting the test on cs->hppi.irq in gicv3_redist_update()
>  * making gicv3_redist_update_lpi() always call gicv3_redist_update()
>  * introducing a new gicv3_redist_update_lpi_only() for the one
>    callsite (the post-load hook) which must not call
>    gicv3_redist_update()
>  * making gicv3_redist_lpi_pending() always call gicv3_redist_update(),
>    either directly or via gicv3_redist_update_lpi()
>  * removing a couple of now-unnecessary calls to gicv3_redist_update()
>    from some callers of those two functions
>  * calling gicv3_redist_update() when the GICR_CTLR ENABLE_LPIS
>    bit is cleared
>
> (This means that the not-file-local gicv3_redist_* LPI related
> functions now all take care of the updates of internally cached
> GICv3 information, in the same way the older functions
> gicv3_redist_set_irq() and gicv3_redist_send_sgi() do.)
>
> The visible effect of this bug was that when the guest acknowledged
> an LPI by reading ICC_IAR1_EL1, we marked it as not pending in the
> LPI data structure but still left it in cs->hppi so we would offer it
> to the guest again.  In particular for setups using an emulated GICv3
> and ITS and using devices which use LPIs (ie PCI devices) a Linux
> guest would complain "irq 54: nobody cared" and then hang.  (The hang
> was intermittent, presumably depending on the timing between
> different interrupts arriving and being completed.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Interestingly this also triggers an extra IRQ in v4 of my kvm-unit-test
ITS patches. However it works with v3 which was more limited in the
excising of the test:

v3:

--8<---------------cut here---------------start------------->8---
modified   arm/gic.c
@@ -732,21 +732,17 @@ static void test_its_trigger(void)
 			"dev2/eventid=3D20 does not trigger any LPI");
=20
 	/*
-	 * re-enable the LPI but willingly do not call invall
-	 * so the change in config is not taken into account.
-	 * The LPI should not hit
+	 * re-enable the LPI. While "A change to the LPI configuration
+	 * is not guaranteed to be visible until an appropriate
+	 * invalidation operation has completed" hardware that doesn't
+	 * implement caches may have delivered the event at any point
+	 * after the enabling. Check the LPI has hit by the time the
+	 * invall is done.
 	 */
 	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
 	stats_reset();
 	cpumask_clear(&mask);
 	its_send_int(dev2, 20);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, -1, -1),
-			"dev2/eventid=3D20 still does not trigger any LPI");
-
-	/* Now call the invall and check the LPI hits */
-	stats_reset();
-	cpumask_clear(&mask);
 	cpumask_set_cpu(3, &mask);
 	its_send_invall(col3);
 	wait_for_interrupts(&mask);
--8<---------------cut here---------------end--------------->8---

v4:

--8<---------------cut here---------------start------------->8---
modified   arm/gic.c
@@ -732,34 +732,22 @@ static void test_its_trigger(void)
 			"dev2/eventid=3D20 does not trigger any LPI");
=20
 	/*
-	 * re-enable the LPI but willingly do not call invall
-	 * so the change in config is not taken into account.
-	 * The LPI should not hit
+	 * re-enable the LPI. While "A change to the LPI configuration
+	 * is not guaranteed to be visible until an appropriate
+	 * invalidation operation has completed" hardware that doesn't
+	 * implement caches may have delivered the event at any point
+	 * after the enabling. Check the LPI has hit by the time the
+	 * invall is done.
 	 */
-	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
-	stats_reset();
-	cpumask_clear(&mask);
-	its_send_int(dev2, 20);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, -1, -1),
-			"dev2/eventid=3D20 still does not trigger any LPI");
-
-	/* Now call the invall and check the LPI hits */
 	stats_reset();
-	cpumask_clear(&mask);
-	cpumask_set_cpu(3, &mask);
+	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
 	its_send_invall(col3);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, 0, 8195),
-			"dev2/eventid=3D20 pending LPI is received");
-
-	stats_reset();
 	cpumask_clear(&mask);
 	cpumask_set_cpu(3, &mask);
 	its_send_int(dev2, 20);
 	wait_for_interrupts(&mask);
 	report(check_acked(&mask, 0, 8195),
-			"dev2/eventid=3D20 now triggers an LPI");
+			"dev2/eventid=3D20 triggers an LPI");
=20
 	report_prefix_pop();
=20
--8<---------------cut here---------------end--------------->8---

I think my v3 was correct and the v4 is too aggressive as I was chasing
a regression in the QEMU code.

> ---
> I think this is now a proper fix for the problem. Testing
> definitely welcomed... The commit message makes it sound like a bit
> of a "several things in one patch" change, but it isn't really IMHO:
> I just erred on the side of being very verbose in the description...
> ---
>  hw/intc/gicv3_internal.h   | 17 +++++++++++++++++
>  hw/intc/arm_gicv3.c        |  6 ++++--
>  hw/intc/arm_gicv3_redist.c | 14 ++++++++++----
>  3 files changed, 31 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index a0369dace7b..70f34ee4955 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -463,7 +463,24 @@ void gicv3_dist_set_irq(GICv3State *s, int irq, int =
level);
>  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
>  void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
>  void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
> +/**
> + * gicv3_redist_update_lpi:
> + * @cs: GICv3CPUState
> + *
> + * Scan the LPI pending table and recalculate the highest priority
> + * pending LPI and also the overall highest priority pending interrupt.
> + */
>  void gicv3_redist_update_lpi(GICv3CPUState *cs);
> +/**
> + * gicv3_redist_update_lpi_only:
> + * @cs: GICv3CPUState
> + *
> + * Scan the LPI pending table and recalculate cs->hpplpi only,
> + * without calling gicv3_redist_update() to recalculate the overall
> + * highest priority pending interrupt. This should be called after
> + * an incoming migration has loaded new state.
> + */
> +void gicv3_redist_update_lpi_only(GICv3CPUState *cs);

good commenting ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
