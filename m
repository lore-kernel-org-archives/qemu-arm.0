Received: by 10.25.159.131 with SMTP id i125csp1771763lfe;
        Mon, 5 Dec 2016 13:47:18 -0800 (PST)
X-Received: by 10.55.180.135 with SMTP id d129mr48103104qkf.96.1480974438072;
        Mon, 05 Dec 2016 13:47:18 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id q58si9900092qta.108.2016.12.05.13.47.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:18 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E28B61BB5;
	Mon,  5 Dec 2016 21:47:17 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKY019596;
	Mon, 5 Dec 2016 16:47:12 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 04/15] arm/arm64: ITS: BASER parsing and setup
Date: Mon,  5 Dec 2016 22:46:35 +0100
Message-Id: <1480974406-29345-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 05 Dec 2016 21:47:17 +0000 (UTC)
X-TUID: R0TtzWqvGbxT

Add helper routines to parse BASER registers and set them up

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3-its.h | 72 +++++++++++++++++++++++++++++++++++++++++++
 lib/arm/gic-v3-its.c     | 79 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 2044565..2fdc042 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -10,13 +10,85 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/setup.h>
+#include <asm/io.h>
+
+#define GITS_BASER                      0x0100
+
+#define GITS_BASER_NR_REGS              8
+
+#define GITS_BASER_VALID                        (1UL << 63)
+#define GITS_BASER_INDIRECT                     (1ULL << 62)
+
+#define GITS_BASER_INNER_CACHEABILITY_SHIFT     (59)
+#define GITS_BASER_OUTER_CACHEABILITY_SHIFT     (53)
+#define GITS_BASER_INNER_CACHEABILITY_MASK                              \
+	GIC_BASER_CACHEABILITY(GITS_BASER, INNER, MASK)
+#define GITS_BASER_CACHEABILITY_MASK            GITS_BASER_INNER_CACHEABILITY_MASK
+#define GITS_BASER_OUTER_CACHEABILITY_MASK                              \
+	GIC_BASER_CACHEABILITY(GITS_BASER, OUTER, MASK)
+#define GITS_BASER_SHAREABILITY_MASK                                    \
+	GIC_BASER_SHAREABILITY(GITS_BASER, SHAREABILITY_MASK)
+
+#define GITS_BASER_nCnB         GIC_BASER_CACHEABILITY(GITS_BASER, INNER, nCnB)
+#define GITS_BASER_nC           GIC_BASER_CACHEABILITY(GITS_BASER, INNER, nC)
+#define GITS_BASER_RaWt         GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWt)
+#define GITS_BASER_RaWb         GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWt)
+#define GITS_BASER_WaWt         GIC_BASER_CACHEABILITY(GITS_BASER, INNER, WaWt)
+#define GITS_BASER_WaWb         GIC_BASER_CACHEABILITY(GITS_BASER, INNER, WaWb)
+#define GITS_BASER_RaWaWt       GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWaWt)
+#define GITS_BASER_RaWaWb       GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWaWb)
+
+#define GITS_BASER_TYPE_SHIFT                   (56)
+#define GITS_BASER_TYPE(r)              (((r) >> GITS_BASER_TYPE_SHIFT) & 7)
+#define GITS_BASER_ENTRY_SIZE_SHIFT             (48)
+#define GITS_BASER_ENTRY_SIZE(r)        ((((r) >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) + 1)
+#define GITS_BASER_SHAREABILITY_SHIFT   (10)
+#define GITS_BASER_InnerShareable                                       \
+	GIC_BASER_SHAREABILITY(GITS_BASER, InnerShareable)
+#define GITS_BASER_PAGE_SIZE_SHIFT      (8)
+#define GITS_BASER_PAGE_SIZE_4K         (0UL << GITS_BASER_PAGE_SIZE_SHIFT)
+#define GITS_BASER_PAGE_SIZE_16K        (1UL << GITS_BASER_PAGE_SIZE_SHIFT)
+#define GITS_BASER_PAGE_SIZE_64K        (2UL << GITS_BASER_PAGE_SIZE_SHIFT)
+#define GITS_BASER_PAGE_SIZE_MASK       (3UL << GITS_BASER_PAGE_SIZE_SHIFT)
+#define GITS_BASER_PAGES_MAX            256
+#define GITS_BASER_PAGES_SHIFT          (0)
+#define GITS_BASER_NR_PAGES(r)          (((r) & 0xff) + 1)
+
+#define GITS_BASER_TYPE_NONE            0
+#define GITS_BASER_TYPE_DEVICE          1
+#define GITS_BASER_TYPE_VCPU            2
+#define GITS_BASER_TYPE_CPU             3
+#define GITS_BASER_TYPE_COLLECTION      4
+#define GITS_BASER_TYPE_RESERVED5       5
+#define GITS_BASER_TYPE_RESERVED6       6
+#define GITS_BASER_TYPE_RESERVED7       7
+
+struct its_baser {
+	unsigned int index;
+	int type;
+	u64 cache;
+	int shr;
+	size_t psz;
+	int nr_pages;
+	bool indirect;
+	phys_addr_t table_addr;
+	bool valid;
+	int esz;
+};
+
 struct its_data {
 	void *base;
+	struct its_baser baser[GITS_BASER_NR_REGS];
 };
 
 extern struct its_data its_data;
 
 #define gicv3_its_base()		(its_data.base)
 
+extern int its_parse_baser(int i, struct its_baser *baser);
+extern void its_setup_baser(int i, struct its_baser *baser);
+
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_ITS_H_ */
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index e382b80..225a72e 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -7,3 +7,82 @@
 
 struct its_data its_data;
 
+static const char * const its_base_type_string[] = {
+	[GITS_BASER_TYPE_DEVICE]        = "Devices",
+	[GITS_BASER_TYPE_VCPU]          = "Virtual CPUs",
+	[GITS_BASER_TYPE_CPU]           = "Physical CPUs",
+	[GITS_BASER_TYPE_COLLECTION]    = "Interrupt Collections",
+	[GITS_BASER_TYPE_RESERVED5]     = "Reserved (5)",
+	[GITS_BASER_TYPE_RESERVED6]     = "Reserved (6)",
+	[GITS_BASER_TYPE_RESERVED7]     = "Reserved (7)",
+};
+
+int its_parse_baser(int i, struct its_baser *baser)
+{
+	void *reg_addr = gicv3_its_base() + GITS_BASER + i * 8;
+	u64 val = readq(reg_addr);
+	int inner_cache;
+
+	if (!val) {
+		memset(baser, 0, sizeof(*baser));
+		return -1;
+	}
+
+	baser->valid = val & GITS_BASER_VALID;
+	baser->indirect = val & GITS_BASER_INDIRECT;
+	baser->type = GITS_BASER_TYPE(val);
+	baser->esz = GITS_BASER_ENTRY_SIZE(val);
+	baser->nr_pages = GITS_BASER_NR_PAGES(val);
+	baser->table_addr = (val >> 12) & 36;
+	inner_cache = (val >> 59) & 0x7;
+	baser->cache = inner_cache;
+	switch (val & GITS_BASER_PAGE_SIZE_MASK) {
+	case GITS_BASER_PAGE_SIZE_4K:
+		baser->psz = SZ_4K;
+		break;
+	case GITS_BASER_PAGE_SIZE_16K:
+		baser->psz = SZ_16K;
+		break;
+	case GITS_BASER_PAGE_SIZE_64K:
+		baser->psz = SZ_64K;
+		break;
+	default:
+		baser->psz = SZ_64K;
+	}
+	baser->shr = (val >> 10) & 0x3;
+
+	return 0;
+}
+
+void its_setup_baser(int i, struct its_baser *baser)
+{
+	void *reg_addr = gicv3_its_base() + GITS_BASER + i * 8;
+	u64 val = readq(reg_addr);
+
+	baser->table_addr =
+		(u64)phys_zalloc(baser->psz * baser->nr_pages);
+
+	val = ((u64)baser->table_addr					|
+		((u64)baser->type << GITS_BASER_TYPE_SHIFT)		|
+		((u64)(baser->esz - 1) << GITS_BASER_ENTRY_SIZE_SHIFT)	|
+		((baser->nr_pages - 1) << GITS_BASER_PAGES_SHIFT)	|
+		baser->cache						|
+		baser->shr						|
+		GITS_BASER_VALID);
+
+	val |=  baser->indirect ? GITS_BASER_INDIRECT : 0x0;
+	switch (baser->psz) {
+	case SZ_4K:
+		val |= GITS_BASER_PAGE_SIZE_4K;
+		break;
+	case SZ_16K:
+		val |= GITS_BASER_PAGE_SIZE_16K;
+		break;
+	case SZ_64K:
+		val |= GITS_BASER_PAGE_SIZE_64K;
+		break;
+	}
+
+	writeq(val, reg_addr);
+}
+
-- 
2.5.5
