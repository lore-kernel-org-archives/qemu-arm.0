Received: by 10.25.159.131 with SMTP id i125csp1771894lfe;
        Mon, 5 Dec 2016 13:47:42 -0800 (PST)
X-Received: by 10.55.134.1 with SMTP id i1mr52163101qkd.219.1480974462278;
        Mon, 05 Dec 2016 13:47:42 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 9si9914771qkf.42.2016.12.05.13.47.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 497FD7F7B1;
	Mon,  5 Dec 2016 21:47:41 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKe019596;
	Mon, 5 Dec 2016 16:47:37 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 10/15] arm/arm64: ITS: its_enable_defaults
Date: Mon,  5 Dec 2016 22:46:41 +0100
Message-Id: <1480974406-29345-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 05 Dec 2016 21:47:41 +0000 (UTC)
X-TUID: rwY1d8IatSp7

its_enable_defaults() is the top init function that allocates all
the requested tables (device, collection, lpi config and pending
tables), enable LPIs at distributor level and ITS level.

gicv3_enable_defaults must be called before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3-its.h | 10 ++++++++++
 lib/arm/gic-v3-its.c     | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 353db6f..b73736c 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -33,6 +33,7 @@
 #define GICR_PROPBASER_InnerShareable                                   \
 	GIC_BASER_SHAREABILITY(GICR_PROPBASER, InnerShareable)
 
+#define GITS_CTLR                       0x0000
 #define GITS_TYPER                      0x0008
 #define GITS_CBASER                     0x0080
 #define GITS_CWRITER                    0x0088
@@ -46,6 +47,8 @@
 #define GITS_TYPER_PTA                  (1UL << 19)
 #define GITS_TYPER_HWCOLLCNT_SHIFT      24
 
+#define GITS_CTLR_ENABLE                (1U << 0)
+
 #define GITS_CBASER_VALID                       (1UL << 63)
 #define GITS_CBASER_SHAREABILITY_SHIFT          (10)
 #define GITS_CBASER_INNER_CACHEABILITY_SHIFT    (59)
@@ -151,6 +154,11 @@ struct its_typer {
 	bool virt_lpi;
 };
 
+struct its_collection {
+	u64 target_address;
+	u16 col_id;
+};
+
 struct its_data {
 	void *base;
 	struct its_cmd_block *cmd_base;
@@ -158,6 +166,7 @@ struct its_data {
 	struct its_cmd_block *cmd_readr;
 	struct its_baser baser[GITS_BASER_NR_REGS];
 	struct its_typer typer;
+	struct its_collection *collections;
 	u64 flags;
 };
 
@@ -169,6 +178,7 @@ extern void its_parse_typer(void);
 extern int its_parse_baser(int i, struct its_baser *baser);
 extern void its_setup_baser(int i, struct its_baser *baser);
 extern void enable_lpi(u32 redist);
+extern void its_enable_defaults(void);
 
 
 #endif /* !__ASSEMBLY__ */
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index c8ffa53..ecb8f98 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -212,3 +212,49 @@ void enable_lpi(u32 redist)
 	val |= GICR_CTLR_ENABLE_LPIS;
 	writel(val,  ptr + GICR_CTLR);
 }
+
+void its_enable_defaults(void)
+{
+	unsigned int i;
+
+	its_parse_typer();
+
+	/* Allocate BASER tables (device and collection tables) */
+	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+		struct its_baser *baser = &its_data.baser[i];
+		int ret;
+
+		ret = its_parse_baser(i, baser);
+		if (ret)
+			continue;
+
+		switch (baser->type) {
+		case GITS_BASER_TYPE_DEVICE:
+			if (baser->valid)
+				continue;
+			baser->cache = GITS_BASER_nCnB;
+			its_setup_baser(i, baser);
+			break;
+		case GITS_BASER_TYPE_COLLECTION:
+			if (baser->valid)
+				continue;
+			its_setup_baser(i, baser);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* Allocate LPI config and pending tables */
+	alloc_lpi_tables();
+
+	its_data.collections = malloc(gicv3_data.cpu_count *
+			       sizeof(struct its_collection));
+
+	init_cmd_queue();
+
+	for (i = 0; i < gicv3_data.cpu_count; i++)
+		enable_lpi(i);
+
+	writel(GITS_CTLR_ENABLE, its_data.base + GITS_CTLR);
+}
-- 
2.5.5
