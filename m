Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp305798lfp;
        Tue, 28 Jan 2020 02:36:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrk1H8YXkjdBfuvHpmv5fpsERn4rUts9FJqgqOsN/3PpmLx/T7+RvpLhiz+kVwsjP7wAiq
X-Received: by 2002:a9d:222f:: with SMTP id o44mr15626365ota.51.1580207803500;
        Tue, 28 Jan 2020 02:36:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580207803; cv=none;
        d=google.com; s=arc-20160816;
        b=r0z6VL2MFDTw3AOt3dwVKVBqRi02Hx0BOWUOVru/wSzonegQfWsdA5rVrX1eSZ1ssn
         h/9+5m5Q8Yv7N2t91AcQqd5F9I2u1Pzf7PDaZiKJ10h5fEdyZZdxOGJW5w/NNBBxX6+/
         LthIH+fgN8Gx9KqwAs1YkoLhxzxnSsRzcffpD68NF+PwM9qH9G9Z+iezte9EgD0hiQWA
         h41TGHkepKhdga8ZZJySSBe4njBTkzONXkEqQbRwuuOhbi8QxFE/XeI+kh6Bq5Z6iz43
         a2XyzGv7WVDq1MRJWp3PmAwsrspbHPnlXDPQNFhTdS/1sZ5WUbgUVkaZ/H5RLpp9o3/d
         roAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=S7IyFp9yNNPGRardzvjsfdUtfgsnLQUlfdwQx3hiSAI=;
        b=jqyghuP0GzXov4DaYvlTZT65C2KBD8zbVXiwpIvdDvRFutOp10ygvd8KwhamGrQNwl
         mwDtDcJ2ek3z6Xuo20ngQaavLwMnYS0x6s0+dW9SNhD+qNnJ06NAi8ZgeLYBwMnPQ6Eq
         1h9mzGNsGqISGpTlj9XueswxrRDKGLFcmkp4peZWvgpIsfiB+aUM2++7rLPGRmXgeuyI
         XHQ4gwY6glRW23KArga/SLdqbJTU+E59b/BZvV8lbZUyGMpQxrQ4642ShRpX9uxO8qhh
         HF1EtaXNJkqECWoKoe4px/gd5wYOWA9eiw4MbqnJiMRKiMRzk+c2qM+E3sINmkLpBKYD
         kWNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A6gwW4gE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s6si3478540otq.115.2020.01.28.02.36.43;
        Tue, 28 Jan 2020 02:36:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A6gwW4gE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgA1Kgm (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 28 Jan 2020 05:36:42 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36309 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726007AbgA1Kgm (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 28 Jan 2020 05:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580207800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S7IyFp9yNNPGRardzvjsfdUtfgsnLQUlfdwQx3hiSAI=;
        b=A6gwW4gEb+E408Db6/Uh0kcFo7feWYo12Hf4JoWYIvHeCC9DPiUl34AoDkbzHidhLlu2hO
        sQ+jZNpPNZdZByR8o6Mn0IIWzkX7t6G0hgjdrMqohRw17WMlCiGHJrxlX4Z2HE62oMfccr
        2WGYK2QZ0nl6qOjrQhAIcE8tXe3RKc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-9opVXubhMyK7jMA7Su5sZg-1; Tue, 28 Jan 2020 05:36:39 -0500
X-MC-Unique: 9opVXubhMyK7jMA7Su5sZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6CD3800D50;
        Tue, 28 Jan 2020 10:36:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 694E31001B30;
        Tue, 28 Jan 2020 10:36:29 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 11/14] arm/arm64: ITS: INT functional tests
Date:   Tue, 28 Jan 2020 11:34:56 +0100
Message-Id: <20200128103459.19413-12-eric.auger@redhat.com>
In-Reply-To: <20200128103459.19413-1-eric.auger@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 3xkA5yMV3fGc

Triggers LPIs through the INT command.

the test checks the LPI hits the right CPU and triggers
the right LPI intid, ie. the translation is correct.

Updates to the config table also are tested, along with inv
and invall commands.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- add comments
- keep the report_skip in case there aren't 4 vcpus to be able to
  run other tests in the its category.
- fix the prefix pop
- move its_event and its_stats to arm/gic.c
---
 arm/gic.c         | 228 +++++++++++++++++++++++++++++++++++++++++++---
 arm/unittests.cfg |   7 ++
 2 files changed, 224 insertions(+), 11 deletions(-)

diff --git a/arm/gic.c b/arm/gic.c
index 4d7dd03..50104b1 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -160,6 +160,87 @@ static void ipi_handler(struct pt_regs *regs __unuse=
d)
 	}
 }
=20
+static void setup_irq(handler_t handler)
+{
+	gic_enable_defaults();
+#ifdef __arm__
+	install_exception_handler(EXCPTN_IRQ, handler);
+#else
+	install_irq_handler(EL1H_IRQ, handler);
+#endif
+	local_irq_enable();
+}
+
+#if defined(__aarch64__)
+struct its_event {
+	int cpu_id;
+	int lpi_id;
+};
+
+struct its_stats {
+	struct its_event expected;
+	struct its_event observed;
+};
+
+static struct its_stats lpi_stats;
+
+static void lpi_handler(struct pt_regs *regs __unused)
+{
+	u32 irqstat =3D gic_read_iar();
+	int irqnr =3D gic_iar_irqnr(irqstat);
+
+	gic_write_eoir(irqstat);
+	if (irqnr < 8192)
+		report(false, "Unexpected non LPI interrupt received");
+	smp_rmb(); /* pairs with wmb in lpi_stats_expect */
+	lpi_stats.observed.cpu_id =3D smp_processor_id();
+	lpi_stats.observed.lpi_id =3D irqnr;
+	smp_wmb(); /* pairs with rmb in check_lpi_stats */
+}
+
+static void lpi_stats_expect(int exp_cpu_id, int exp_lpi_id)
+{
+	lpi_stats.expected.cpu_id =3D exp_cpu_id;
+	lpi_stats.expected.lpi_id =3D exp_lpi_id;
+	lpi_stats.observed.cpu_id =3D -1;
+	lpi_stats.observed.lpi_id =3D -1;
+	smp_wmb(); /* pairs with rmb in handler */
+}
+
+static void check_lpi_stats(void)
+{
+	mdelay(100);
+	smp_rmb(); /* pairs with wmb in lpi_handler */
+	if ((lpi_stats.observed.cpu_id !=3D lpi_stats.expected.cpu_id) ||
+	    (lpi_stats.observed.lpi_id !=3D lpi_stats.expected.lpi_id)) {
+		if (lpi_stats.observed.cpu_id =3D=3D -1 &&
+		    lpi_stats.observed.lpi_id =3D=3D -1) {
+			report(false,
+			       "No LPI received whereas (cpuid=3D%d, intid=3D%d) "
+			       "was expected", lpi_stats.expected.cpu_id,
+			       lpi_stats.expected.lpi_id);
+		} else {
+			report(false, "Unexpected LPI (cpuid=3D%d, intid=3D%d)",
+			       lpi_stats.observed.cpu_id,
+			       lpi_stats.observed.lpi_id);
+		}
+	} else if (lpi_stats.expected.lpi_id !=3D -1) {
+		report(true, "LPI %d on CPU %d", lpi_stats.observed.lpi_id,
+		       lpi_stats.observed.cpu_id);
+	} else {
+		report(true, "no LPI received, as expected");
+	}
+}
+
+static void secondary_lpi_test(void)
+{
+	setup_irq(lpi_handler);
+	cpumask_set_cpu(smp_processor_id(), &ready);
+	while (1)
+		wfi();
+}
+#endif
+
 static void gicv2_ipi_send_self(void)
 {
 	writel(2 << 24 | IPI_IRQ, gicv2_dist_base() + GICD_SGIR);
@@ -217,17 +298,6 @@ static void ipi_test_smp(void)
 	report_prefix_pop();
 }
=20
-static void setup_irq(handler_t handler)
-{
-	gic_enable_defaults();
-#ifdef __arm__
-	install_exception_handler(EXCPTN_IRQ, handler);
-#else
-	install_irq_handler(EL1H_IRQ, handler);
-#endif
-	local_irq_enable();
-}
-
 static void ipi_send(void)
 {
 	setup_irq(ipi_handler);
@@ -522,6 +592,7 @@ static void gic_test_mmio(void)
 #if defined(__arm__)
=20
 static void test_its_introspection(void) {}
+static void test_its_trigger(void) {}
=20
 #else /* __arch64__ */
=20
@@ -561,6 +632,137 @@ static void test_its_introspection(void)
 	report_info("collection baser entry_size =3D 0x%x", coll_baser->esz);
 }
=20
+static bool its_prerequisites(int nb_cpus)
+{
+	int cpu;
+
+	if (!gicv3_its_base()) {
+		report_skip("No ITS, skip ...");
+		return true;
+	}
+
+	if (nr_cpus < 4) {
+		report_skip("Test requires at least %d vcpus", nb_cpus);
+		return true;
+	}
+
+	stats_reset();
+
+	setup_irq(lpi_handler);
+
+	for_each_present_cpu(cpu) {
+		if (cpu =3D=3D 0)
+			continue;
+		smp_boot_secondary(cpu, secondary_lpi_test);
+	}
+	wait_on_ready();
+
+	its_enable_defaults();
+
+	lpi_stats_expect(-1, -1);
+	check_lpi_stats();
+
+	return false;
+}
+
+static void test_its_trigger(void)
+{
+	struct its_collection *col3, *col2;
+	struct its_device *dev2, *dev7;
+
+	if (its_prerequisites(4))
+		return;
+
+	dev2 =3D its_create_device(2 /* dev id */, 8 /* nb_ites */);
+	dev7 =3D its_create_device(7 /* dev id */, 8 /* nb_ites */);
+
+	col3 =3D its_create_collection(3 /* col id */, 3/* target PE */);
+	col2 =3D its_create_collection(2 /* col id */, 2/* target PE */);
+
+	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
+	gicv3_lpi_set_config(8196, LPI_PROP_DEFAULT);
+
+	its_send_invall(col2);
+	its_send_invall(col3);
+
+	report_prefix_push("int");
+	/*
+	 * dev=3D2, eventid=3D20  -> lpi=3D 8195, col=3D3
+	 * dev=3D7, eventid=3D255 -> lpi=3D 8196, col=3D2
+	 * Trigger dev2, eventid=3D20 and dev7, eventid=3D255
+	 * Check both LPIs hit
+	 */
+
+	its_send_mapd(dev2, true);
+	its_send_mapd(dev7, true);
+
+	its_send_mapc(col3, true);
+	its_send_mapc(col2, true);
+
+	its_send_mapti(dev2, 8195 /* lpi id */,
+		       20 /* event id */, col3);
+	its_send_mapti(dev7, 8196 /* lpi id */,
+		       255 /* event id */, col2);
+
+	lpi_stats_expect(3, 8195);
+	its_send_int(dev2, 20);
+	check_lpi_stats();
+
+	lpi_stats_expect(2, 8196);
+	its_send_int(dev7, 255);
+	check_lpi_stats();
+
+	report_prefix_pop();
+
+	report_prefix_push("inv/invall");
+
+	/*
+	 * disable 8195, check dev2/eventid=3D20 does not trigger the
+	 * corresponding LPI
+	 */
+	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT & ~0x1);
+	its_send_inv(dev2, 20);
+
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev2, 20);
+	check_lpi_stats();
+
+	/*
+	 * re-enable the LPI but willingly do not call invall
+	 * so the change in config is not taken into account.
+	 * The LPI should not hit
+	 */
+	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev2, 20);
+	check_lpi_stats();
+
+	/* Now call the invall and check the LPI hits */
+	its_send_invall(col3);
+	lpi_stats_expect(3, 8195);
+	its_send_int(dev2, 20);
+	check_lpi_stats();
+
+	report_prefix_pop();
+	/*
+	 * Unmap device 2 and check the eventid 20 formerly
+	 * attached to it does not hit anymore
+	 */
+	report_prefix_push("mapd valid=3Dfalse");
+	its_send_mapd(dev2, false);
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev2, 20);
+	check_lpi_stats();
+	report_prefix_pop();
+
+	/* Unmap the collection this time and check no LPI does hit */
+	report_prefix_push("mapc valid=3Dfalse");
+	its_send_mapc(col2, false);
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev7, 255);
+	check_lpi_stats();
+	report_prefix_pop();
+}
 #endif
=20
 int main(int argc, char **argv)
@@ -594,6 +796,10 @@ int main(int argc, char **argv)
 		report_prefix_push(argv[1]);
 		gic_test_mmio();
 		report_prefix_pop();
+	} else if (!strcmp(argv[1], "its-trigger")) {
+		report_prefix_push(argv[1]);
+		test_its_trigger();
+		report_prefix_pop();
 	} else if (strcmp(argv[1], "its-introspection") =3D=3D 0) {
 		report_prefix_push(argv[1]);
 		test_its_introspection();
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index ba2b31b..bfafec5 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -129,6 +129,13 @@ extra_params =3D -machine gic-version=3D3 -append 'i=
ts-introspection'
 groups =3D its
 arch =3D arm64
=20
+[its-trigger]
+file =3D gic.flat
+smp =3D $MAX_SMP
+extra_params =3D -machine gic-version=3D3 -append 'its-trigger'
+groups =3D its
+arch =3D arm64
+
 # Test PSCI emulation
 [psci]
 file =3D psci.flat
--=20
2.20.1
