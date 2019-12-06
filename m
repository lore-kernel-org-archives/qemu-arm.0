Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1040717lff;
        Fri, 6 Dec 2019 09:28:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZMqxmRCR2d8b0qGeS/V2pQkEanP7zbjt4henvFRY0SUVdCE4RB0QX69hchx17ncMlfJxB
X-Received: by 2002:a9d:1b4e:: with SMTP id l72mr12031414otl.345.1575653300523;
        Fri, 06 Dec 2019 09:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575653300; cv=none;
        d=google.com; s=arc-20160816;
        b=nnSHDHRX6sq35iCClM4mr9qjd5Xqu9NJpbO3wYbY/UTrLNv2tZ+tR6TFQCg3dRdDGF
         r/T6UUiDtuTMFt+iOyWUlutMcASCN3ll/9OZtNADKl2zgQbTR7FqTtnhmfG557JoQFdD
         RKG5f4FrOZ64W3/fMmSYdiyUZYI02wi/7jPaCDv58C/01axf6Ixd0K0y2roeNOyrH70R
         6vHeFHNRxGQaRyCJareFKyf0Qn5qHQoKsHRQer34xX0xFd+IY9GoSKGa3cekIYC1Naa0
         irx6UPAVF2ZgVdBGFx2HXGIa1FjN516JwZ1vsDtzExP7xZKHoIbvGzn5tGonWANiogXe
         mqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=uHy6JtDFNgRRZUOE/EOkjvVUEne6jqUvFOy591Cbfrs=;
        b=D8RzgQuciv/tS+CpQNS5LNp9ahDstT2lz+uwTYLaaq4h6hG8LWlmtDyyWxR8eiouhZ
         RhC8MIln1k6GBLrnHB05aGYBpjx3UuxmsUBPqlU9s9cTilXW+Yeg7B/l3R+u65QgjL5x
         /IYP5GSwK1w9QdhtwJCa2CQDaIB6+9W4D73jIkabBlsAJXGwT+mNqfxBgUhTGCZA7Fm4
         Vu9hpE1pyMwY5gMSgrDVeKWBLNI6y9yOmGKx9iAHJ2ogHwDyG+iaD7Rn/eyOSvgQ3AFw
         U19zwCSKu4tI5wGrOt+j9CtgYxBbsaF6o8YN8zPNkj/yAhuYlimXQtF+OCVTsSJEvgyX
         EosA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h47tVp+4;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g6si6984218otb.231.2019.12.06.09.28.20;
        Fri, 06 Dec 2019 09:28:20 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h47tVp+4;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfLFR2T (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 6 Dec 2019 12:28:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29446 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726473AbfLFR2T (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 6 Dec 2019 12:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575653297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uHy6JtDFNgRRZUOE/EOkjvVUEne6jqUvFOy591Cbfrs=;
        b=h47tVp+4Tc3SrZw+tDX0LUm6aXF0pOMfmv17POB1nphloPJPl8RyvKxB8UgODdFdMl/157
        b7UPOFIeD/Mdkuy1hL51B7TskLoDapmRfJEMmseKXOjVsi5NzfbtJjNfibPj0yZZ+5vkXX
        XB+fId0uzLRbyYM3xHahohw5dTrvnQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-BOXZZEcbPF-QJRXfsfQH8w-1; Fri, 06 Dec 2019 12:28:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 925BC800EB9;
        Fri,  6 Dec 2019 17:28:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 15F6560BF4;
        Fri,  6 Dec 2019 17:28:11 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org
Subject: [kvm-unit-tests RFC 10/10] pmu: Test overflow interrupts
Date:   Fri,  6 Dec 2019 18:27:24 +0100
Message-Id: <20191206172724.947-11-eric.auger@redhat.com>
In-Reply-To: <20191206172724.947-1-eric.auger@redhat.com>
References: <20191206172724.947-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: BOXZZEcbPF-QJRXfsfQH8w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: D9NVUg9YQcBD

Test overflows for MEM_ACESS and SW_INCR events. Also tests
overflows with 64-bit events.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/pmu.c         | 133 +++++++++++++++++++++++++++++++++++++++++++++-
 arm/unittests.cfg |   6 +++
 2 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/arm/pmu.c b/arm/pmu.c
index 47d46a2..a63b93e 100644
--- a/arm/pmu.c
+++ b/arm/pmu.c
@@ -45,8 +45,12 @@ struct pmu {
 =09uint32_t pmcr_ro;
 };
=20
-static struct pmu pmu;
+struct pmu_stats {
+=09unsigned long bitmap;
+=09uint32_t interrupts[32];
+};
=20
+static struct pmu pmu;
=20
 #if defined(__arm__)
 #define ID_DFR0_PERFMON_SHIFT 24
@@ -117,6 +121,7 @@ static void test_mem_access(void) {}
 static void test_chained_counters(void) {}
 static void test_chained_sw_incr(void) {}
 static void test_chain_promotion(void) {}
+static void test_overflow_interrupt(void) {}
=20
 #elif defined(__aarch64__)
 #define ID_AA64DFR0_PERFMON_SHIFT 8
@@ -263,6 +268,43 @@ asm volatile(
 =09: );
 }
=20
+static struct pmu_stats pmu_stats;
+
+static void irq_handler(struct pt_regs *regs)
+{
+        uint32_t irqstat, irqnr;
+
+        irqstat =3D gic_read_iar();
+        irqnr =3D gic_iar_irqnr(irqstat);
+        gic_write_eoir(irqstat);
+
+        if (irqnr =3D=3D 23) {
+                unsigned long overflows =3D read_sysreg(pmovsclr_el0);
+=09=09int i;
+
+                report_info("--> PMU overflow interrupt %d (counter bitmas=
k 0x%lx)", irqnr, overflows);
+=09=09for (i =3D 0; i < 32; i++) {
+=09=09=09if (test_and_clear_bit(i, &overflows)) {
+=09=09=09=09pmu_stats.interrupts[i]++;
+=09=09=09=09pmu_stats.bitmap |=3D 1 << i;
+=09=09=09}
+=09=09}
+                write_sysreg(0xFFFFFFFF, pmovsclr_el0);
+        } else {
+                report_info("Unexpected interrupt: %d\n", irqnr);
+        }
+}
+
+static void pmu_reset_stats(void)
+{
+=09int i;
+
+=09for (i =3D 0; i < 32; i++) {
+=09=09pmu_stats.interrupts[i] =3D 0;
+=09}
+=09pmu_stats.bitmap =3D 0;
+}
+
 static void pmu_reset(void)
 {
 =09/* reset all counters, counting disabled at PMCR level*/
@@ -273,6 +315,7 @@ static void pmu_reset(void)
 =09write_sysreg(0xFFFFFFFF, pmovsclr_el0);
 =09/* disable overflow interrupts on all counters */
 =09write_sysreg(0xFFFFFFFF, pmintenclr_el1);
+=09pmu_reset_stats();
 =09isb();
 }
=20
@@ -691,8 +734,93 @@ static void test_chain_promotion(void)
 =09=09=09read_sysreg(pmovsclr_el0));
 }
=20
+static bool expect_interrupts(uint32_t bitmap)
+{
+=09int i;
+
+=09if (pmu_stats.bitmap ^ bitmap)
+=09=09return false;
+
+=09for (i =3D 0; i < 32; i++) {
+=09=09if (test_and_clear_bit(i, &pmu_stats.bitmap))
+=09=09=09if (pmu_stats.interrupts[i] !=3D 1)
+=09=09=09=09return false;
+=09}
+=09return true;
+}
+
+static void test_overflow_interrupt(void)
+{
+=09uint32_t events[] =3D { 0x13 /* MEM_ACCESS */, 0x00 /* SW_INCR */};
+=09void *addr =3D malloc(PAGE_SIZE);
+=09int i;
+
+=09if (!satisfy_prerequisites(events, ARRAY_SIZE(events)))
+=09=09return;
+
+=09setup_irq(irq_handler);
+=09gic_enable_irq(23);
+
+=09pmu_reset();
+
+        write_regn(pmevtyper, 0, events[0] | PMEVTYPER_EXCLUDE_EL0);
+        write_regn(pmevtyper, 1, events[1] | PMEVTYPER_EXCLUDE_EL0);
+=09write_sysreg_s(0x3, PMCNTENSET_EL0);
+=09write_regn(pmevcntr, 0, 0xFFFFFFF0);
+=09write_regn(pmevcntr, 1, 0xFFFFFFF0);
+=09isb();
+
+=09/* interrupts are disabled */
+
+=09mem_access_loop(addr, 200, pmu.pmcr_ro | PMU_PMCR_E);
+=09report("no overflow interrupt received", expect_interrupts(0));
+
+=09set_pmcr(pmu.pmcr_ro | PMU_PMCR_E);
+=09for (i =3D 0; i < 100; i++) {
+=09=09write_sysreg(0x2, pmswinc_el0);
+=09}
+=09set_pmcr(pmu.pmcr_ro);
+=09report("no overflow interrupt received", expect_interrupts(0));
+
+=09/* enable interrupts */
+
+=09pmu_reset_stats();
+
+=09write_regn(pmevcntr, 0, 0xFFFFFFF0);
+=09write_regn(pmevcntr, 1, 0xFFFFFFF0);
+=09write_sysreg(0xFFFFFFFF, pmintenset_el1);
+=09isb();
+
+=09mem_access_loop(addr, 200, pmu.pmcr_ro | PMU_PMCR_E);
+=09for (i =3D 0; i < 100; i++) {
+=09=09write_sysreg(0x3, pmswinc_el0);
+=09}
+=09mem_access_loop(addr, 200, pmu.pmcr_ro);
+=09report_info("overflow=3D0x%lx", read_sysreg(pmovsclr_el0));
+=09report("overflow interrupts expected on #0 and #1", expect_interrupts(0=
x3));
+
+=09/* promote to 64-b */
+
+=09pmu_reset_stats();
+
+=09events[1] =3D 0x1E /* CHAIN */;
+        write_regn(pmevtyper, 1, events[1] | PMEVTYPER_EXCLUDE_EL0);
+=09write_regn(pmevcntr, 0, 0xFFFFFFF0);
+=09isb();
+=09mem_access_loop(addr, 200, pmu.pmcr_ro | PMU_PMCR_E);
+=09report("no overflow interrupt expected on 32b boundary", expect_interru=
pts(0));
+
+=09/* overflow on odd counter */
+=09pmu_reset_stats();
+=09write_regn(pmevcntr, 0, 0xFFFFFFF0);
+=09write_regn(pmevcntr, 1, 0xFFFFFFFF);
+=09isb();
+=09mem_access_loop(addr, 200, pmu.pmcr_ro | PMU_PMCR_E);
+=09report("expect overflow interrupt on odd counter", expect_interrupts(0x=
2));
+}
 #endif
=20
+
 /*
  * As a simple sanity check on the PMCR_EL0, ensure the implementer field =
isn't
  * null. Also print out a couple other interesting fields for diagnostic
@@ -896,6 +1024,9 @@ int main(int argc, char *argv[])
 =09} else if (strcmp(argv[1], "chain-promotion") =3D=3D 0) {
 =09=09report_prefix_push(argv[1]);
 =09=09test_chain_promotion();
+=09} else if (strcmp(argv[1], "overflow-interrupt") =3D=3D 0) {
+=09=09report_prefix_push(argv[1]);
+=09=09test_overflow_interrupt();
 =09} else {
 =09=09report_abort("Unknown subtest '%s'", argv[1]);
 =09}
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index eb6e87e..31b4c7a 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -108,6 +108,12 @@ groups =3D pmu
 arch =3D arm64
 extra_params =3D -append 'chain-promotion'
=20
+[pmu-chain-promotion]
+file =3D pmu.flat
+groups =3D pmu
+arch =3D arm64
+extra_params =3D -append 'overflow-interrupt'
+
 # Test PMU support (TCG) with -icount IPC=3D1
 #[pmu-tcg-icount-1]
 #file =3D pmu.flat
--=20
2.20.1
