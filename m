Received: by 10.25.159.131 with SMTP id i125csp1771827lfe;
        Mon, 5 Dec 2016 13:47:30 -0800 (PST)
X-Received: by 10.200.54.4 with SMTP id m4mr50968410qtb.141.1480974450156;
        Mon, 05 Dec 2016 13:47:30 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d76si9890283qkc.278.2016.12.05.13.47.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:30 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FEAC61BA0;
	Mon,  5 Dec 2016 21:47:29 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKb019596;
	Mon, 5 Dec 2016 16:47:25 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 07/15] arm/arm64: ITS: Init the command queue
Date: Mon,  5 Dec 2016 22:46:38 +0100
Message-Id: <1480974406-29345-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 05 Dec 2016 21:47:29 +0000 (UTC)
X-TUID: WqmrMvhqFwaw

Allocate the command queue and initialize related registers:
CBASER, CREADR, CWRITER.

The command queue is 64kB. This aims at not bothing with fullness.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3-its.h | 37 +++++++++++++++++++++++++++++++++++++
 lib/arm/gic-v3-its.c     | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 6fd5d6d..21054cb 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -33,8 +33,35 @@
 #define GICR_PROPBASER_InnerShareable                                   \
 	GIC_BASER_SHAREABILITY(GICR_PROPBASER, InnerShareable)
 
+#define GITS_CBASER                     0x0080
+#define GITS_CWRITER                    0x0088
+#define GITS_CREADR                     0x0090
 #define GITS_BASER                      0x0100
 
+#define GITS_CBASER_VALID                       (1UL << 63)
+#define GITS_CBASER_SHAREABILITY_SHIFT          (10)
+#define GITS_CBASER_INNER_CACHEABILITY_SHIFT    (59)
+#define GITS_CBASER_OUTER_CACHEABILITY_SHIFT    (53)
+#define GITS_CBASER_SHAREABILITY_MASK                                   \
+	GIC_BASER_SHAREABILITY(GITS_CBASER, SHAREABILITY_MASK)
+#define GITS_CBASER_INNER_CACHEABILITY_MASK                             \
+	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, MASK)
+#define GITS_CBASER_OUTER_CACHEABILITY_MASK                             \
+	GIC_BASER_CACHEABILITY(GITS_CBASER, OUTER, MASK)
+#define GITS_CBASER_CACHEABILITY_MASK GITS_CBASER_INNER_CACHEABILITY_MASK
+
+#define GITS_CBASER_InnerShareable                                      \
+	GIC_BASER_SHAREABILITY(GITS_CBASER, InnerShareable)
+
+#define GITS_CBASER_nCnB        GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, nCnB)
+#define GITS_CBASER_nC          GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, nC)
+#define GITS_CBASER_RaWt        GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, RaWt)
+#define GITS_CBASER_RaWb        GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, RaWt)
+#define GITS_CBASER_WaWt        GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, WaWt)
+#define GITS_CBASER_WaWb        GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, WaWb)
+#define GITS_CBASER_RaWaWt      GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, RaWaWt)
+#define GITS_CBASER_RaWaWb      GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, RaWaWb)
+
 #define GITS_BASER_NR_REGS              8
 
 #define GITS_BASER_VALID                        (1UL << 63)
@@ -84,6 +111,8 @@
 #define GITS_BASER_TYPE_RESERVED6       6
 #define GITS_BASER_TYPE_RESERVED7       7
 
+#define ITS_FLAGS_CMDQ_NEEDS_FLUSHING           (1ULL << 0)
+
 struct its_baser {
 	unsigned int index;
 	int type;
@@ -97,9 +126,17 @@ struct its_baser {
 	int esz;
 };
 
+struct its_cmd_block {
+	u64     raw_cmd[4];
+};
+
 struct its_data {
 	void *base;
+	struct its_cmd_block *cmd_base;
+	struct its_cmd_block *cmd_write;
+	struct its_cmd_block *cmd_readr;
 	struct its_baser baser[GITS_BASER_NR_REGS];
+	u64 flags;
 };
 
 extern struct its_data its_data;
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 5eb8e6a..f577d5f 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -136,3 +136,38 @@ void alloc_lpi_tables(void)
 		writeq(pend_val, ptr + GICR_PENDBASER);
 	}
 }
+
+/**
+ * init_cmd_queue: Allocate the command queue and initialize
+ * CBASER, CREADR, CWRITER
+ */
+void init_cmd_queue(void)
+{
+	u64 cbaser, tmp;
+
+	its_data.cmd_base = (void *)phys_zalloc_aligned(SZ_64K, SZ_64K);
+
+	cbaser = ((u64)its_data.cmd_base	|
+		 GITS_CBASER_WaWb               |
+		 GITS_CBASER_InnerShareable     |
+		 (SZ_64K / SZ_4K - 1) |
+		 GITS_CBASER_VALID);
+
+	writeq(cbaser, its_data.base + GITS_CBASER);
+	tmp = readq(its_data.base + GITS_CBASER);
+
+	if ((tmp ^ cbaser) & GITS_CBASER_SHAREABILITY_MASK) {
+		if (!(tmp & GITS_CBASER_SHAREABILITY_MASK)) {
+			cbaser &= ~(GITS_CBASER_SHAREABILITY_MASK |
+				GITS_CBASER_CACHEABILITY_MASK);
+			cbaser |= GITS_CBASER_nC;
+			writeq(cbaser, its_data.base + GITS_CBASER);
+		}
+		its_data.flags |= ITS_FLAGS_CMDQ_NEEDS_FLUSHING;
+	}
+
+	its_data.cmd_write = its_data.cmd_base;
+	its_data.cmd_readr = its_data.cmd_base;
+	writeq(0, its_data.base + GITS_CWRITER);
+	writeq(0, its_data.base + GITS_CREADR);
+}
-- 
2.5.5
