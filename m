Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4582987lff;
        Mon, 16 Dec 2019 06:04:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqyORJg78jMqMt0mUT5Ciq4daVMHq81POWPzzecmyxowQJMwkG+DuMb+uO05PhmE59S5FwP5
X-Received: by 2002:aed:2b04:: with SMTP id p4mr15355767qtd.270.1576505046313;
        Mon, 16 Dec 2019 06:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576505046; cv=none;
        d=google.com; s=arc-20160816;
        b=AiPDQF7gQ2C0KOwkPqW681ffTSOCGTNSgo+YmVhTm9T9BUae2vxGcZhfVgLQEK89z6
         q9vLr3UHOMFI5jA9ioDHpmnQgaqxEmAY9YzybZLAs87qevdZ7T3Hsdz5dM/WPK7IxJUT
         8HZQvd80IFu5UAlJEDHKdsB5f/37wixbhCYzSA4hkCckmTXxD1X7oDEdQdo4R6OjZ16e
         V9q9WF1O6xs5xrvZZpe4X7IB38anCSMvHT4IUcjPannAedMYP3/u3dJPsxtK3N+bFmHf
         9bi9rrWEx9LLWNMbQOHnbytCHLUuORb0AhrdIHZ9J1g+WT5L/SOHYLAMidU+eAsEbIpX
         SUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9MZsq39fPZG0F+xPGkO8mJLR5n2TUmtV+L4okoj4asA=;
        b=iphqS6EvKx75JEIKD1cJRt4VDlVhSY1a6cXXz5A4lm9X0EnlJgOlde2M40Q98r0iJb
         3F2c/zOOudzSFiYadf4D5wBidJmXIU8QPLFDqBd/AQxHbJVYrsAqu9JKlHwWJKH4LyH7
         /c397KYpqjCWzRxK9smS6+1dIM/cqtFs1UlzFEaOw1dKzEjcGI1q0NPvMdpnXHM8s39z
         yMXVwb6urhovXG5mj8pdpu53E7iP3wXw1S9kybcii3biCN9JiMUniE4q9rhgd1e+93Pb
         iqt/v21+dZ3eIaOL0ha0cCdzUMNgtz/Yrzuv9LV3495B15yh4innD7UoPfiAFxXzPhzv
         qumg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=GBpT9wgF;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id a68si10466820qke.236.2019.12.16.06.04.06;
        Mon, 16 Dec 2019 06:04:06 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=GBpT9wgF;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id F1FC64A521;
	Mon, 16 Dec 2019 09:04:05 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.391
X-Spam-Level: 
X-Spam-Status: No, score=-1.391 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6gw6YRhrPpL; Mon, 16 Dec 2019 09:04:04 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A0A244A8E0;
	Mon, 16 Dec 2019 09:04:04 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 302654A535
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Dec 2019 09:04:03 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waFVqYL-lvoT for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Dec 2019 09:04:02 -0500 (EST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id F418F4A319
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Dec 2019 09:04:01 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576505041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XB5s37rAPv1BzFFArVrq1786MkybtY4z+dn+u1KH+UE=;
 b=GBpT9wgFsiqCBwL1qL8i0ZjoimNi2wlht3Z6STIn+N5GBCf9aZcrGtmgBfngh+WJTCEPvM
 qKumrRLvLYWpr+f7VbRl4c5gLfCvDoU6P1gScsc40YJjxMMwgXPjTU+fNgDHaVg4fUoIsx
 l7IsQ+KB++pz7brJSp3Qmst7JKMN6c4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-4Pdl_56RMCGLwFQgWWRfxw-1; Mon, 16 Dec 2019 09:04:00 -0500
X-MC-Unique: 4Pdl_56RMCGLwFQgWWRfxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4FC107ACC9;
 Mon, 16 Dec 2019 14:03:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2565675BE;
 Mon, 16 Dec 2019 14:03:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH 06/16] arm/arm64: ITS: Test BASER
Date: Mon, 16 Dec 2019 15:02:25 +0100
Message-Id: <20191216140235.10751-7-eric.auger@redhat.com>
In-Reply-To: <20191216140235.10751-1-eric.auger@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: andre.przywara@arm.com, thuth@redhat.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 2WtomSCAjRhy

Add helper routines to parse and set up BASER registers.
Add a new test dedicated to BASER<n> accesses.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/gic.c                | 20 ++++++++++
 arm/unittests.cfg        |  6 +++
 lib/arm/asm/gic-v3-its.h | 17 ++++++++
 lib/arm/gic-v3-its.c     | 84 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 127 insertions(+)

diff --git a/arm/gic.c b/arm/gic.c
index adeb981..8b56fce 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -536,6 +536,22 @@ static void test_its_introspection(void)
 			typer->pta ? "Redist basse address" : "PE #");
 }
 
+static void test_its_baser(void)
+{
+	struct its_baser *dev_baser, *coll_baser;
+
+	if (!gicv3_its_base()) {
+		report_skip("No ITS, skip ...");
+		return;
+	}
+
+	dev_baser = its_lookup_baser(GITS_BASER_TYPE_DEVICE);
+	coll_baser = its_lookup_baser(GITS_BASER_TYPE_COLLECTION);
+	report(dev_baser && coll_baser, "detect device and collection BASER");
+	report_info("device baser entry_size = 0x%x", dev_baser->esz);
+	report_info("collection baser entry_size = 0x%x", dev_baser->esz);
+}
+
 int main(int argc, char **argv)
 {
 	if (!gic_init()) {
@@ -571,6 +587,10 @@ int main(int argc, char **argv)
 		report_prefix_push(argv[1]);
 		test_its_introspection();
 		report_prefix_pop();
+	} else if (strcmp(argv[1], "its-baser") == 0) {
+		report_prefix_push(argv[1]);
+		test_its_baser();
+		report_prefix_pop();
 	} else {
 		report_abort("Unknown subtest '%s'", argv[1]);
 	}
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index bd20460..2234a0f 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -128,6 +128,12 @@ smp = $MAX_SMP
 extra_params = -machine gic-version=3 -append 'its-introspection'
 groups = its
 
+[its-baser]
+file = gic.flat
+smp = $MAX_SMP
+extra_params = -machine gic-version=3 -append 'its-baser'
+groups = its
+
 # Test PSCI emulation
 [psci]
 file = psci.flat
diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 2ce483e..0c0178d 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -100,9 +100,23 @@ struct its_typer {
 	bool virt_lpi;
 };
 
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
 	struct its_typer typer;
+	struct its_baser baser[GITS_BASER_NR_REGS];
 };
 
 extern struct its_data its_data;
@@ -111,6 +125,9 @@ extern struct its_data its_data;
 
 extern void its_parse_typer(void);
 extern void its_init(void);
+extern int its_parse_baser(int i, struct its_baser *baser);
+extern void its_setup_baser(int i, struct its_baser *baser);
+extern struct its_baser *its_lookup_baser(int type);
 
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_ITS_H_ */
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 34f4d0e..303022f 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -4,6 +4,7 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 #include <asm/gic.h>
+#include <alloc_page.h>
 
 struct its_data its_data;
 
@@ -31,11 +32,94 @@ void its_parse_typer(void)
 	its_data.typer.phys_lpi = typer & GITS_TYPER_PLPIS;
 }
 
+int its_parse_baser(int i, struct its_baser *baser)
+{
+	void *reg_addr = gicv3_its_base() + GITS_BASER + i * 8;
+	u64 val = readq(reg_addr);
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
+	baser->table_addr = val & GITS_BASER_PHYS_ADDR_MASK;
+	baser->cache = (val >> GITS_BASER_INNER_CACHEABILITY_SHIFT) &
+			GITS_BASER_CACHEABILITY_MASK;
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
+	return 0;
+}
+
+struct its_baser *its_lookup_baser(int type)
+{
+	int i;
+
+	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
+		struct its_baser *baser = &its_data.baser[i];
+
+		if (baser->type == type)
+			return baser;
+	}
+	return NULL;
+}
+
 void its_init(void)
 {
+	int i;
 	if (!its_data.base)
 		return;
 
 	its_parse_typer();
+	for (i = 0; i < GITS_BASER_NR_REGS; i++)
+		its_parse_baser(i, &its_data.baser[i]);
+}
+
+void its_setup_baser(int i, struct its_baser *baser)
+{
+	unsigned long n = (baser->nr_pages * baser->psz) >> PAGE_SHIFT;
+	unsigned long order = is_power_of_2(n) ? fls(n) : fls(n) + 1;
+	u64 val;
+
+	baser->table_addr = (u64)virt_to_phys(alloc_pages(order));
+
+	val = ((u64)baser->table_addr					|
+		((u64)baser->type	<< GITS_BASER_TYPE_SHIFT)	|
+		((u64)(baser->esz - 1)	<< GITS_BASER_ENTRY_SIZE_SHIFT)	|
+		((baser->nr_pages - 1)	<< GITS_BASER_PAGES_SHIFT)	|
+		baser->cache						|
+		baser->shr						|
+		(u64)baser->indirect	<< 62				|
+		(u64)baser->valid	<< 63);
+
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
+	writeq(val, gicv3_its_base() + GITS_BASER + i * 8);
 }
 
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
