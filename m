Received: by 10.25.159.131 with SMTP id i125csp1771801lfe;
        Mon, 5 Dec 2016 13:47:26 -0800 (PST)
X-Received: by 10.55.134.66 with SMTP id i63mr50146516qkd.309.1480974446069;
        Mon, 05 Dec 2016 13:47:26 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c190si9919549qkd.5.2016.12.05.13.47.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:26 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C0908FCF4;
	Mon,  5 Dec 2016 21:47:25 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKa019596;
	Mon, 5 Dec 2016 16:47:21 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 06/15] arm/arm64: ITS: Set the LPI config and pending tables
Date: Mon,  5 Dec 2016 22:46:37 +0100
Message-Id: <1480974406-29345-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 05 Dec 2016 21:47:25 +0000 (UTC)
X-TUID: LO3X2IRZzvBx

Allocate the LPI configuration and per re-distributor pending table.
Set redistributor's PROPBASER and PENDBASER. The LPIs are enabled
by default in the config table.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3-its.h | 20 +++++++++++++
 lib/arm/asm/gic-v3.h     | 77 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/arm/gic-v3-its.c     | 50 +++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 2fdc042..6fd5d6d 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -13,6 +13,26 @@
 #include <asm/setup.h>
 #include <asm/io.h>
 
+#define GIC_BASER_CACHEABILITY(reg, inner_outer, type)                  \
+	(GIC_BASER_CACHE_##type << reg##_##inner_outer##_CACHEABILITY_SHIFT)
+
+#define GIC_BASER_SHAREABILITY(reg, type)                               \
+	(GIC_BASER_##type << reg##_SHAREABILITY_SHIFT)
+
+#define GICR_PROPBASER_SHAREABILITY_SHIFT               (10)
+#define GICR_PROPBASER_INNER_CACHEABILITY_SHIFT         (7)
+#define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT         (56)
+#define GICR_PROPBASER_SHAREABILITY_MASK                                \
+	GIC_BASER_SHAREABILITY(GICR_PROPBASER, SHAREABILITY_MASK)
+#define GICR_PROPBASER_INNER_CACHEABILITY_MASK                          \
+	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, MASK)
+#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK                          \
+	GIC_BASER_CACHEABILITY(GICR_PROPBASER, OUTER, MASK)
+#define GICR_PROPBASER_CACHEABILITY_MASK GICR_PROPBASER_INNER_CACHEABILITY_MASK
+
+#define GICR_PROPBASER_InnerShareable                                   \
+	GIC_BASER_SHAREABILITY(GICR_PROPBASER, InnerShareable)
+
 #define GITS_BASER                      0x0100
 
 #define GITS_BASER_NR_REGS              8
diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index 039b7c2..0bdb013 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -45,6 +45,81 @@
 #define MPIDR_TO_SGI_AFFINITY(cluster_id, level) \
 	(MPIDR_AFFINITY_LEVEL(cluster_id, level) << ICC_SGI1R_AFFINITY_## level ## _SHIFT)
 
+#define GIC_BASER_CACHE_nCnB            0ULL
+#define GIC_BASER_CACHE_SameAsInner     0ULL
+#define GIC_BASER_CACHE_nC              1ULL
+#define GIC_BASER_CACHE_RaWt            2ULL
+#define GIC_BASER_CACHE_RaWb            3ULL
+#define GIC_BASER_CACHE_WaWt            4ULL
+#define GIC_BASER_CACHE_WaWb            5ULL
+#define GIC_BASER_CACHE_RaWaWt          6ULL
+#define GIC_BASER_CACHE_RaWaWb          7ULL
+#define GIC_BASER_CACHE_MASK            7ULL
+#define GIC_BASER_NonShareable          0ULL
+#define GIC_BASER_InnerShareable        1ULL
+#define GIC_BASER_OuterShareable        2ULL
+#define GIC_BASER_SHAREABILITY_MASK     3ULL
+
+#define GIC_BASER_CACHEABILITY(reg, inner_outer, type)                  \
+	(GIC_BASER_CACHE_##type << reg##_##inner_outer##_CACHEABILITY_SHIFT)
+
+#define GIC_BASER_SHAREABILITY(reg, type)                               \
+	(GIC_BASER_##type << reg##_SHAREABILITY_SHIFT)
+
+#define GICR_PROPBASER_SHAREABILITY_SHIFT               (10)
+#define GICR_PROPBASER_INNER_CACHEABILITY_SHIFT         (7)
+#define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT         (56)
+#define GICR_PROPBASER_SHAREABILITY_MASK                                \
+	GIC_BASER_SHAREABILITY(GICR_PROPBASER, SHAREABILITY_MASK)
+#define GICR_PROPBASER_INNER_CACHEABILITY_MASK                          \
+	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, MASK)
+#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK                          \
+	GIC_BASER_CACHEABILITY(GICR_PROPBASER, OUTER, MASK)
+#define GICR_PROPBASER_CACHEABILITY_MASK GICR_PROPBASER_INNER_CACHEABILITY_MASK
+
+#define GICR_PROPBASER_InnerShareable                                   \
+	GIC_BASER_SHAREABILITY(GICR_PROPBASER, InnerShareable)
+
+#define GICR_PROPBASER_nCnB     GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, nCnB)
+#define GICR_PROPBASER_nC       GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, nC)
+#define GICR_PROPBASER_RaWt     GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWt)
+#define GICR_PROPBASER_RaWb     GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWt)
+#define GICR_PROPBASER_WaWt     GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, WaWt)
+#define GICR_PROPBASER_WaWb     GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, WaWb)
+#define GICR_PROPBASER_RaWaWt   GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWaWt)
+#define GICR_PROPBASER_RaWaWb   GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWaWb)
+
+#define GICR_PROPBASER_IDBITS_MASK                      (0x1f)
+
+#define GICR_PENDBASER_SHAREABILITY_SHIFT               (10)
+#define GICR_PENDBASER_INNER_CACHEABILITY_SHIFT         (7)
+#define GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT         (56)
+#define GICR_PENDBASER_SHAREABILITY_MASK                                \
+	GIC_BASER_SHAREABILITY(GICR_PENDBASER, SHAREABILITY_MASK)
+#define GICR_PENDBASER_INNER_CACHEABILITY_MASK                          \
+	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, MASK)
+#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK                          \
+	GIC_BASER_CACHEABILITY(GICR_PENDBASER, OUTER, MASK)
+#define GICR_PENDBASER_CACHEABILITY_MASK GICR_PENDBASER_INNER_CACHEABILITY_MASK
+
+#define GICR_PENDBASER_InnerShareable                                   \
+	GIC_BASER_SHAREABILITY(GICR_PENDBASER, InnerShareable)
+
+#define GICR_PENDBASER_nCnB     GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, nCnB)
+#define GICR_PENDBASER_nC       GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, nC)
+#define GICR_PENDBASER_RaWt     GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, RaWt)
+#define GICR_PENDBASER_RaWb     GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, RaWt)
+#define GICR_PENDBASER_WaWt     GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, WaWt)
+#define GICR_PENDBASER_WaWb     GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, WaWb)
+#define GICR_PENDBASER_RaWaWt   GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, RaWaWt)
+#define GICR_PENDBASER_RaWaWb   GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, RaWaWb)
+
+#define GICR_PENDBASER_PTZ                              BIT_ULL(62)
+
+#define LPI_PROP_GROUP1                 (1 << 1)
+#define LPI_PROP_ENABLED                (1 << 0)
+#define LPI_PROP_DEFAULT_PRIO   0xa0
+
 #include <asm/arch_gicv3.h>
 
 #ifndef __ASSEMBLY__
@@ -57,6 +132,8 @@
 struct gicv3_data {
 	void *dist_base;
 	void *redist_base[NR_CPUS];
+	void *lpi_prop;
+	void *lpi_pend[NR_CPUS];
 	unsigned int irq_nr;
 	unsigned int cpu_count;
 };
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 225a72e..5eb8e6a 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -86,3 +86,53 @@ void its_setup_baser(int i, struct its_baser *baser)
 	writeq(val, reg_addr);
 }
 
+/*
+ * alloc_lpi_tables: Allocate LPI config and pending tables
+ * Enable LPIs in the config table.
+ *
+ * prerequisites: gic_data.cpu_count must be set
+ */
+void alloc_lpi_tables(void)
+{
+	u64 prop_val;
+	unsigned int cpu;
+
+	if (!gicv3_data.cpu_count)
+		report_abort("%s cpu_count not set\n", __func__);
+
+	gicv3_data.lpi_prop =
+		(void *)phys_zalloc_aligned(SZ_64K, SZ_64K);
+
+	/* ID bits = 13, ie. up to 14b LPI INTID */
+	prop_val = ((u64)gicv3_data.lpi_prop |
+			GICR_PROPBASER_InnerShareable |
+			GICR_PROPBASER_WaWb |
+			(13 & GICR_PROPBASER_IDBITS_MASK));
+
+	/* All LPIs enabled */
+	memset(gicv3_data.lpi_prop,
+	      LPI_PROP_DEFAULT_PRIO | LPI_PROP_GROUP1 | 1,
+	      SZ_64K);
+
+	/*
+	 * Allocate pending tables for each redistributor
+	 * and set PROPBASER and PENDBASER
+	 */
+	for (cpu = 0; cpu < gicv3_data.cpu_count; cpu++) {
+		u64 pend_val;
+		void *ptr;
+
+		ptr = gicv3_data.redist_base[cpu];
+
+		writeq(prop_val, ptr + GICR_PROPBASER);
+
+		gicv3_data.lpi_pend[cpu] =
+			(void *)phys_zalloc_aligned(SZ_64K, SZ_64K);
+
+		pend_val = ((u64)gicv3_data.lpi_pend[cpu] |
+			GICR_PENDBASER_InnerShareable |
+			GICR_PENDBASER_WaWb);
+
+		writeq(pend_val, ptr + GICR_PENDBASER);
+	}
+}
-- 
2.5.5
