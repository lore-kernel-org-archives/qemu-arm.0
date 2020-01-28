Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp306177lfp;
        Tue, 28 Jan 2020 02:37:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxt3aZiqILv/sn01Q3efJnKvdre7kh6QFy2LdPOUMR65J/gg8JHazNCzoM6YxGCalEDU2bE
X-Received: by 2002:a9d:53c4:: with SMTP id i4mr16816183oth.48.1580207824492;
        Tue, 28 Jan 2020 02:37:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580207824; cv=none;
        d=google.com; s=arc-20160816;
        b=IbH/2jdhshf0cbXWmEBDam9f//giB+x9F8ke0xVzAMNXF/LVFA3rbcfjoEG+rpIhGj
         htKI40nG9KxWp9lgLj8h/nCFIzmESQjO92NHUq7zCMpu+cv2z546Q47I5EJH8OTo8P8I
         8Ylzz5By+KxxZJWMDadwh6COEgP/L35ljGs6dp90bpS3D1Fc+W16SuxaWbFzuObRfNvE
         HrhhQ8Pt6h31eBYuUMD0fQNHsLeS85bY1PfOQ+Tvw/1j/yGR7EdPUXyrMYxo9yBeMNTc
         ADSs1vKhdQ9haoO6c8qqCeRie1gUHHkzhJIE8Ge6Da5nVv5jVh+oasldqlGg4fJBlvju
         nDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=iejx/JZ1+EnGuUcmALEj4bgYElrakUr3k1rCRIjvnWk=;
        b=yXLrq2zPwrMWm8/K50U4yrCAk2KTMyBXjut/Ex6+2jgqTrc/L1gkE6SzFHIk6swi+2
         gGE4BDCzsHzjQwrAj0CcppUWw4lmTPcLyfvQh9RxYd2tcGj4/9W3fV7+Vf8Xn24cMGK9
         RugYn6Uhg7L4iAVdzxx7aaMRu3X6rUsFRm7M6djdzDwvz+GYm4vx6f3+4B0QpQ5xoB9D
         /uRrVm7nllZGVSdECizNGu9NzSZwWdWqZCd9uQdAi1p5dPcmrDRqoVovCylh232bGCvd
         ts5odrZFn/vyO8Ee6UbCWoctCumoRBuG+WJuwXiSx+hqDsqWlywVaNQQ55QawD0/JOyA
         Jvqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bOTkgTJC;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s6si3478540otq.115.2020.01.28.02.37.04;
        Tue, 28 Jan 2020 02:37:04 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bOTkgTJC;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgA1KhD (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 28 Jan 2020 05:37:03 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22214 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726254AbgA1KhD (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 28 Jan 2020 05:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580207822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iejx/JZ1+EnGuUcmALEj4bgYElrakUr3k1rCRIjvnWk=;
        b=bOTkgTJCq6OhK5qYTfHbLo2eEz44h5FgNroCnNrTS2V4qPA7aS3ACyFdfvTn0F8KmpsAZJ
        Fle7bIhmNQDNfKRdCwiGBYxQPNVQmMtTwpC8hTPWaUG1n3agJSeZG+tMnmpAETZi72iQgg
        UlHtxcMExvE6mpJ3x6APTgzrMUlbga8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-8h2aoagmPQePo-TwIz8zLA-1; Tue, 28 Jan 2020 05:37:00 -0500
X-MC-Unique: 8h2aoagmPQePo-TwIz8zLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B199618C43C2;
        Tue, 28 Jan 2020 10:36:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA9FD1001DD8;
        Tue, 28 Jan 2020 10:36:50 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 14/14] arm/arm64: ITS: pending table migration test
Date:   Tue, 28 Jan 2020 11:34:59 +0100
Message-Id: <20200128103459.19413-15-eric.auger@redhat.com>
In-Reply-To: <20200128103459.19413-1-eric.auger@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 1ADuwYujwWDX

Add two new migration tests. One testing the migration of
a topology where collection were unmapped. The second test
checks the migration of the pending table.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- tests belong to both its and migration groups
---
 arm/gic.c         | 150 ++++++++++++++++++++++++++++++++++++++++++++++
 arm/unittests.cfg |  16 +++++
 2 files changed, 166 insertions(+)

diff --git a/arm/gic.c b/arm/gic.c
index fa8626a..ec3dd3a 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -195,6 +195,7 @@ static void lpi_handler(struct pt_regs *regs __unused=
)
 	smp_rmb(); /* pairs with wmb in lpi_stats_expect */
 	lpi_stats.observed.cpu_id =3D smp_processor_id();
 	lpi_stats.observed.lpi_id =3D irqnr;
+	acked[lpi_stats.observed.cpu_id]++;
 	smp_wmb(); /* pairs with rmb in check_lpi_stats */
 }
=20
@@ -239,6 +240,18 @@ static void secondary_lpi_test(void)
 	while (1)
 		wfi();
 }
+
+static void check_lpi_hits(int *expected)
+{
+	int i;
+
+	for (i =3D 0; i < nr_cpus; i++) {
+		if (acked[i] !=3D expected[i])
+			report(false, "expected %d LPIs on PE #%d, %d observed",
+			       expected[i], i, acked[i]);
+		}
+	report(true, "check LPI on all vcpus");
+}
 #endif
=20
 static void gicv2_ipi_send_self(void)
@@ -594,6 +607,8 @@ static void gic_test_mmio(void)
 static void test_its_introspection(void) {}
 static void test_its_trigger(void) {}
 static void test_its_migration(void) {}
+static void test_migrate_unmapped_collection(void) {}
+static void test_its_pending_migration(void) {}
=20
 #else /* __arch64__ */
=20
@@ -666,6 +681,18 @@ static bool its_prerequisites(int nb_cpus)
 	return false;
 }
=20
+static void set_lpi(struct its_device *dev, u32 eventid, u32 physid,
+		    struct its_collection *col)
+{
+	if (!dev || !col)
+		report_abort("wrong device or collection");
+
+	its_send_mapti(dev, physid, eventid, col);
+
+	gicv3_lpi_set_config(physid, LPI_PROP_DEFAULT);
+	its_send_invall(col);
+}
+
 /*
  * Setup the configuration for those mappings:
  * dev_id=3D2 event=3D20 -> vcpu 3, intid=3D8195
@@ -806,6 +833,121 @@ static void test_its_migration(void)
 	its_send_int(dev7, 255);
 	check_lpi_stats();
 }
+
+static void test_migrate_unmapped_collection(void)
+{
+	struct its_collection *col;
+	struct its_device *dev2, *dev7;
+	u8 config;
+
+	if (its_setup1())
+		return;
+
+	col =3D its_create_collection(nr_cpus - 1, nr_cpus - 1);
+	dev2 =3D its_get_device(2);
+	dev7 =3D its_get_device(7);
+
+	/* MAPTI with the collection unmapped */
+	set_lpi(dev2, 0, 8192, col);
+
+	puts("Now migrate the VM, then press a key to continue...\n");
+	(void)getchar();
+	report(true, "Migration complete");
+
+	/* on the destination, map the collection */
+	its_send_mapc(col, true);
+
+	lpi_stats_expect(2, 8196);
+	its_send_int(dev7, 255);
+	check_lpi_stats();
+
+	config =3D gicv3_lpi_get_config(8192);
+	report(config =3D=3D LPI_PROP_DEFAULT,
+	       "Config of LPI 8192 was properly migrated");
+
+	lpi_stats_expect(nr_cpus - 1, 8192);
+	its_send_int(dev2, 0);
+	check_lpi_stats();
+
+	/* unmap the collection */
+	its_send_mapc(col, false);
+
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev2, 0);
+	check_lpi_stats();
+
+	/* remap event 0 onto lpiid 8193 */
+	set_lpi(dev2, 0, 8193, col);
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev2, 0);
+	check_lpi_stats();
+
+	/* remap the collection */
+	its_send_mapc(col, true);
+	lpi_stats_expect(nr_cpus - 1, 8193);
+}
+
+static void test_its_pending_migration(void)
+{
+	struct its_device *dev;
+	struct its_collection *collection[2];
+	int expected[NR_CPUS];
+	u64 pendbaser;
+	void *ptr;
+	int i;
+
+	if (its_prerequisites(4))
+		return;
+
+	dev =3D its_create_device(2 /* dev id */, 8 /* nb_ites */);
+	its_send_mapd(dev, true);
+
+	collection[0] =3D its_create_collection(nr_cpus - 1, nr_cpus - 1);
+	collection[1] =3D its_create_collection(nr_cpus - 2, nr_cpus - 2);
+	its_send_mapc(collection[0], true);
+	its_send_mapc(collection[1], true);
+
+	/* disable lpi at redist level */
+	gicv3_lpi_rdist_ctrl(nr_cpus - 1, false);
+	gicv3_lpi_rdist_ctrl(nr_cpus - 2, false);
+
+	/* even lpis are assigned to even cpu */
+	for (i =3D 0; i < 256; i++) {
+		struct its_collection *col =3D i % 2 ? collection[0] :
+						     collection[1];
+		int vcpu =3D col->target_address >> 16;
+
+		its_send_mapti(dev, 8192 + i, i, col);
+		gicv3_lpi_set_config(8192 + i, LPI_PROP_DEFAULT);
+		gicv3_lpi_set_pending_table_bit(vcpu, 8192 + i, true);
+	}
+	its_send_invall(collection[0]);
+	its_send_invall(collection[1]);
+
+	/* Set the PTZ bit on each pendbaser */
+
+	expected[nr_cpus - 1] =3D 128;
+	expected[nr_cpus - 2] =3D 128;
+
+	ptr =3D gicv3_data.redist_base[nr_cpus - 1] + GICR_PENDBASER;
+	pendbaser =3D readq(ptr);
+	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
+
+	ptr =3D gicv3_data.redist_base[nr_cpus - 2] + GICR_PENDBASER;
+	pendbaser =3D readq(ptr);
+	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
+
+	gicv3_lpi_rdist_ctrl(nr_cpus - 1, true);
+	gicv3_lpi_rdist_ctrl(nr_cpus - 2, true);
+
+	puts("Now migrate the VM, then press a key to continue...\n");
+	(void)getchar();
+	report(true, "Migration complete");
+
+	mdelay(1000);
+
+	check_lpi_hits(expected);
+}
 #endif
=20
 int main(int argc, char **argv)
@@ -847,6 +989,14 @@ int main(int argc, char **argv)
 		report_prefix_push(argv[1]);
 		test_its_migration();
 		report_prefix_pop();
+	} else if (!strcmp(argv[1], "its-pending-migration")) {
+		report_prefix_push(argv[1]);
+		test_its_pending_migration();
+		report_prefix_pop();
+	} else if (!strcmp(argv[1], "its-migrate-unmapped-collection")) {
+		report_prefix_push(argv[1]);
+		test_migrate_unmapped_collection();
+		report_prefix_pop();
 	} else if (strcmp(argv[1], "its-introspection") =3D=3D 0) {
 		report_prefix_push(argv[1]);
 		test_its_introspection();
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 8b8ec79..d917157 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -144,6 +144,22 @@ extra_params =3D -machine gic-version=3D3 -append 'i=
ts-migration'
 groups =3D its migration
 arch =3D arm64
=20
+[its-pending-migration]
+file =3D gic.flat
+smp =3D $MAX_SMP
+accel =3D kvm
+extra_params =3D -machine gic-version=3D3 -append 'its-pending-migration=
'
+groups =3D its migration
+arch =3D arm64
+
+[its-migrate-unmapped-collection]
+file =3D gic.flat
+smp =3D $MAX_SMP
+accel =3D kvm
+extra_params =3D -machine gic-version=3D3 -append 'its-migrate-unmapped-=
collection'
+groups =3D its migration
+arch =3D arm64
+
 # Test PSCI emulation
 [psci]
 file =3D psci.flat
--=20
2.20.1
