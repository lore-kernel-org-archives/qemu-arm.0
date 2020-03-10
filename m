Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp848800lfc;
        Tue, 10 Mar 2020 07:55:35 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsNPVfFrMWF8hDi5vl2Rq/5oPNxgQFm0PvSggfCk4DJC+hlGkYmebAUmLBpmeZ3M+IFTRpl
X-Received: by 2002:a9d:882:: with SMTP id 2mr2410541otf.198.1583852134994;
        Tue, 10 Mar 2020 07:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852134; cv=none;
        d=google.com; s=arc-20160816;
        b=OL5KvHJ0hmHRo/Rif/Ok4zet1Ou6iEv8tu9yBtEC9FnM3NYA643fVWRa8JagPdaGHP
         n7vyU8cpeHJ4DY6DmIC1YKo/kP1goXk905xJ6N8rcF0DMJy3JHaZF5KyiKuKdT5+1I0g
         6wASJfYt5CrdQ6LnuGqUhjy/obRR62IEKBmOKSlTLp2wmjqJwM1Z3Nr9HKP4BN5IL9Dg
         iVQZSrqPqw6tCGb1po21CpREcsLHdAxWf50EHJJbxolWmQNTw1UmQbuRO6ekLvaW0Lu9
         Ib7uoYFl+LQqD4YkdtHitZgJHGtAPjIw26pydPoM5Wg/8F/fvPjuuK++ZnExBuNrq18Y
         lvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=AW4Dpadwv9KvI99qJhPRmUnuMZSlqBERCvP34WOH9to=;
        b=aVmCCwVueSj3EduXKivMVU3QzBGG4oKpkCyJIDC/jy1jhcMqNB3JJ5UR4sPGXi2vNr
         x+8CzJw3wNYi0XVZ+asQyExW0xgyEuIknXnquJUER2dJuRmIvObNfLwY3zGPX8O8K+Eg
         /RMbicYA0Io7kd93wIlbWGjvpwfN3ZtXg8rQz/xfzAewm77wmVzSk1WfsxuUCS4B+YsV
         MNeFkyRV3UbNLQgz/Zo8jkD+xSuShg1bVpvuntoUJzUWHJLHpTpShLRkL8hPdD02BoDh
         V1nq3Qd1LPOegF0ZUVFRIDg5hgTLspvm+QIY5+ZdjiUuVdDG0xJlN1/PlocQfqe2W/Yk
         zJGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LVDcs3om;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id i7si5431916oth.143.2020.03.10.07.55.34;
        Tue, 10 Mar 2020 07:55:34 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LVDcs3om;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbgCJOze (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 10 Mar 2020 10:55:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22934 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727654AbgCJOzd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 10 Mar 2020 10:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583852132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AW4Dpadwv9KvI99qJhPRmUnuMZSlqBERCvP34WOH9to=;
        b=LVDcs3om8hhfZWPuzHD6S9K/JjAsUGuIZ1WY3N44QGTIC/MLQDFkvfu1siFhKRfYhYI152
        IBEhlxAfRHsEXjiePMwxO4gP3PxcwATUcfgu59cEhnCxo3mbWrZaRcBIxiHRAFE1MwPurW
        RkTB9sYqVMIm+M/mOyrSzELGSAFVyQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-7-dyeq4iOsOohr5XMImhyw-1; Tue, 10 Mar 2020 10:55:28 -0400
X-MC-Unique: 7-dyeq4iOsOohr5XMImhyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA665107ACC4;
        Tue, 10 Mar 2020 14:55:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-85.ams2.redhat.com [10.36.117.85])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DAA6560BF3;
        Tue, 10 Mar 2020 14:55:23 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v5 13/13] arm/arm64: ITS: pending table migration test
Date:   Tue, 10 Mar 2020 15:54:10 +0100
Message-Id: <20200310145410.26308-14-eric.auger@redhat.com>
In-Reply-To: <20200310145410.26308-1-eric.auger@redhat.com>
References: <20200310145410.26308-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: DII8Ydg6mcg3

Add two new migration tests. One testing the migration of
a topology where collection were unmapped. The second test
checks the migration of the pending table.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- move stub from header to arm/gic.c

v3 -> v4:
- do not talk about odd/even CPUs, use pe0 and pe1
- comment the delay

v2 -> v3:
- tests belong to both its and migration groups
- use LPI(i)
- gicv3_lpi_set_pending_table_bit renamed into gicv3_lpi_set_clr_pending
---
 arm/gic.c         | 146 ++++++++++++++++++++++++++++++++++++++++++++++
 arm/unittests.cfg |  16 +++++
 2 files changed, 162 insertions(+)

diff --git a/arm/gic.c b/arm/gic.c
index b8fbc13..e6ffbc3 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -193,6 +193,7 @@ static void lpi_handler(struct pt_regs *regs __unused=
)
 	smp_rmb(); /* pairs with wmb in lpi_stats_expect */
 	lpi_stats.observed.cpu_id =3D smp_processor_id();
 	lpi_stats.observed.lpi_id =3D irqnr;
+	acked[lpi_stats.observed.cpu_id]++;
 	smp_wmb(); /* pairs with rmb in check_lpi_stats */
 }
=20
@@ -236,6 +237,22 @@ static void secondary_lpi_test(void)
 	while (1)
 		wfi();
 }
+
+static void check_lpi_hits(int *expected, const char *msg)
+{
+	bool pass =3D true;
+	int i;
+
+	for (i =3D 0; i < nr_cpus; i++) {
+		if (acked[i] !=3D expected[i]) {
+			report_info("expected %d LPIs on PE #%d, %d observed",
+				    expected[i], i, acked[i]);
+			pass =3D false;
+			break;
+		}
+	}
+	report(pass, "%s", msg);
+}
 #endif
=20
 static void gicv2_ipi_send_self(void)
@@ -591,6 +608,8 @@ static void gic_test_mmio(void)
 static void test_its_introspection(void) {}
 static void test_its_trigger(void) {}
 static void test_its_migration(void) {}
+static void test_its_pending_migration(void) {}
+static void test_migrate_unmapped_collection(void) {}
=20
 #else /* __aarch64__ */
=20
@@ -659,6 +678,17 @@ static int its_prerequisites(int nb_cpus)
 	return 0;
 }
=20
+static void set_lpi(struct its_device *dev, u32 eventid, u32 physid,
+		    struct its_collection *col)
+{
+	assert(dev && col);
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
@@ -799,6 +829,114 @@ static void test_its_migration(void)
 	its_send_int(dev7, 255);
 	check_lpi_stats("dev7/eventid=3D255 triggers LPI 8196 on PE #2 after mi=
gration");
 }
+
+static void test_migrate_unmapped_collection(void)
+{
+	struct its_collection *col;
+	struct its_device *dev2, *dev7;
+	int pe0 =3D nr_cpus - 1;
+	u8 config;
+
+	if (its_setup1())
+		return;
+
+	col =3D its_create_collection(pe0, pe0);
+	dev2 =3D its_get_device(2);
+	dev7 =3D its_get_device(7);
+
+	/* MAPTI with the collection unmapped */
+	set_lpi(dev2, 0, 8192, col);
+
+	puts("Now migrate the VM, then press a key to continue...\n");
+	(void)getchar();
+	report_info("Migration complete");
+
+	/* on the destination, map the collection */
+	its_send_mapc(col, true);
+
+	lpi_stats_expect(2, 8196);
+	its_send_int(dev7, 255);
+	check_lpi_stats("dev7/eventid=3D 255 triggered LPI 8196 on PE #2");
+
+	config =3D gicv3_lpi_get_config(8192);
+	report(config =3D=3D LPI_PROP_DEFAULT,
+	       "Config of LPI 8192 was properly migrated");
+
+	lpi_stats_expect(pe0, 8192);
+	its_send_int(dev2, 0);
+	check_lpi_stats("dev2/eventid =3D 0 triggered LPI 8192 on PE0");
+
+	/* unmap the collection */
+	its_send_mapc(col, false);
+
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev2, 0);
+	check_lpi_stats("no LPI triggered after collection unmapping");
+}
+
+static void test_its_pending_migration(void)
+{
+	struct its_device *dev;
+	struct its_collection *collection[2];
+	int *expected =3D malloc(nr_cpus * sizeof(int));
+	int pe0 =3D nr_cpus - 1, pe1 =3D nr_cpus - 2;
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
+	collection[0] =3D its_create_collection(pe0, pe0);
+	collection[1] =3D its_create_collection(pe1, pe1);
+	its_send_mapc(collection[0], true);
+	its_send_mapc(collection[1], true);
+
+	/* disable lpi at redist level */
+	gicv3_lpi_rdist_disable(pe0);
+	gicv3_lpi_rdist_disable(pe1);
+
+	/* lpis are interleaved inbetween the 2 PEs */
+	for (i =3D 0; i < 256; i++) {
+		struct its_collection *col =3D i % 2 ? collection[0] :
+						     collection[1];
+		int vcpu =3D col->target_address >> 16;
+
+		its_send_mapti(dev, LPI(i), i, col);
+		gicv3_lpi_set_config(LPI(i), LPI_PROP_DEFAULT);
+		gicv3_lpi_set_clr_pending(vcpu, LPI(i), true);
+	}
+	its_send_invall(collection[0]);
+	its_send_invall(collection[1]);
+
+	/* Set the PTZ bit on each pendbaser */
+
+	expected[pe0] =3D 128;
+	expected[pe1] =3D 128;
+
+	ptr =3D gicv3_data.redist_base[pe0] + GICR_PENDBASER;
+	pendbaser =3D readq(ptr);
+	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
+
+	ptr =3D gicv3_data.redist_base[pe1] + GICR_PENDBASER;
+	pendbaser =3D readq(ptr);
+	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
+
+	gicv3_lpi_rdist_enable(pe0);
+	gicv3_lpi_rdist_enable(pe1);
+
+	puts("Now migrate the VM, then press a key to continue...\n");
+	(void)getchar();
+	report_info("Migration complete");
+
+	/* let's wait for the 256 LPIs to be handled */
+	mdelay(1000);
+
+	check_lpi_hits(expected, "128 LPIs on both PE0 and PE1 after migration"=
);
+}
 #endif
=20
 int main(int argc, char **argv)
@@ -840,6 +978,14 @@ int main(int argc, char **argv)
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
index 480adec..b96f0a1 100644
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
