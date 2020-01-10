Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp794529lff;
        Fri, 10 Jan 2020 06:54:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwIGq588InQ8QKPQEKPd0c6YrKyxdPDVqyUZfuwdGx8FvVU0m0O0mx0L/7PeXah52E2hvtx
X-Received: by 2002:a05:620a:1014:: with SMTP id z20mr3477009qkj.196.1578668097314;
        Fri, 10 Jan 2020 06:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668097; cv=none;
        d=google.com; s=arc-20160816;
        b=mIMLkW6SgKBNEaVtOkgGMf3zaRyXMaTioJSwyg38b/OOAYXpLQHcoFDct0e0AH0I6a
         LwIaFpPZSJl8aZY00TLAP+HlYo0lp7peOJ4fgicmqA1ozC2g5q/JLT1xU8LsWr7BRm5A
         kTpxVhG2eDMr/jLLvC4EoFYOqRpTgEc2vKfN2cTVJ9i2npr8k7Oo0qlASN0Gtj9VXhK1
         pM02eIu8LFG8LKRkfWOExnYTat8mczIzerIy2n08ql++cGnFG6g2YbljSs1lOtAh8iwg
         /PzFTjl5FrPPSTkfpdLJIaoEdyb6hArXXCZE9Ph660y+3Je5gXySI85aOzE2xhHownlR
         VWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g/7qiMx3RlaHPWFFABXvtwtV/gi8vUqjyzdE6s6iID8=;
        b=uYd0XUa90YnidJqKkQJCRNc1ntg4Gpgj1yyF5LXw9AOsqA7x5Bca5r8sUwzX+rHpwK
         ibB6iPGX5weaK25fDzPNo8mVKA5uvIrzCrXflygp6a+YztQCSTENfLHNH4IthvlCOXk9
         Cv4cbXZDLmzuPCuJtW9GA5ezS34Zlefqfyu/iXqOFj8wXKLW/wTzoeYYpHdC5fV+XYD+
         r62ahokR6TCP2qVqOFiuwmUVCL1P13J+ys1RIg2f7oO7mIG1R8QnT95XimtL0rzjiTCw
         M7+ffqSG6ktnSmdEfkwkDdMqt05Tmp3B1s4gIdyiTfNrGD15B1nBy7xG6ThLF2f9xfmI
         0IhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=Y23bUA2I;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id g19si1311851qvk.94.2020.01.10.06.54.57;
        Fri, 10 Jan 2020 06:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=Y23bUA2I;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0D2844B1C4;
	Fri, 10 Jan 2020 09:54:57 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qk8k7f85s5Aw; Fri, 10 Jan 2020 09:54:55 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 541984B197;
	Fri, 10 Jan 2020 09:54:55 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 30B394B154
 for <kvmarm@lists.cs.columbia.edu>; Fri, 10 Jan 2020 09:54:54 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzTZCfIDWVBs for <kvmarm@lists.cs.columbia.edu>;
 Fri, 10 Jan 2020 09:54:53 -0500 (EST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 2B0EE4B17A
 for <kvmarm@lists.cs.columbia.edu>; Fri, 10 Jan 2020 09:54:53 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578668093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=So3e0V/LUBPnehm9Y9Au2M9MYM91iN9NSNK40gnxpnE=;
 b=Y23bUA2INRJS2yeqy3wG9avsoHgfPeTvd7d5nX98FzDZG3lAJoWHdxErTx3C610MZ8Jpz3
 hctDpabopwoTm5KPlNLoXGwDa0jjc2uJ1/4HjnNgrjoJNq/v6NnzhFTbYFuXyGx0cTl3R0
 XnSaD2c+fKNT0SHhk0oxJyNw6Fn2+EQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-t4h7zcAyMMmPAqIqHvdivw-1; Fri, 10 Jan 2020 09:54:51 -0500
X-MC-Unique: t4h7zcAyMMmPAqIqHvdivw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF2CE107ACC9;
 Fri, 10 Jan 2020 14:54:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 106DB7BA5F;
 Fri, 10 Jan 2020 14:54:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v2 06/16] arm/arm64: ITS: Test BASER
Date: Fri, 10 Jan 2020 15:54:02 +0100
Message-Id: <20200110145412.14937-7-eric.auger@redhat.com>
In-Reply-To: <20200110145412.14937-1-eric.auger@redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
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
X-TUID: jiMUo4InS4NG

Add helper routines to parse and set up BASER registers.
Add a new test dedicated to BASER<n> accesses.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- remove everything related to memory attributes
- s/dev_baser/coll_baser/ in report_info
- add extra line
- removed index filed in its_baser
---
 arm/gic.c                | 21 ++++++++++-
 arm/unittests.cfg        |  6 +++
 lib/arm/asm/gic-v3-its.h | 14 +++++++
 lib/arm/gic-v3-its.c     | 80 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/arm/gic.c b/arm/gic.c
index adeb981..3597ac3 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -531,11 +531,26 @@ static void test_its_introspection(void)
 		    typer->collid_bits);
 	report(typer->eventid_bits && typer->deviceid_bits &&
 	       typer->collid_bits, "ID spaces");
-	report(!typer->hw_collections, "collections only in ext memory");
 	report_info("Target address format %s",
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
+	report_info("collection baser entry_size = 0x%x", coll_baser->esz);
+}
+
 int main(int argc, char **argv)
 {
 	if (!gic_init()) {
@@ -571,6 +586,10 @@ int main(int argc, char **argv)
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
index 8816d57..5a4dfe9 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -65,9 +65,20 @@ struct its_typer {
 	bool virt_lpi;
 };
 
+struct its_baser {
+	int type;
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
@@ -76,6 +87,9 @@ extern struct its_data its_data;
 
 extern void its_parse_typer(void);
 extern void its_init(void);
+extern int its_parse_baser(int i, struct its_baser *baser);
+extern void its_setup_baser(int i, struct its_baser *baser);
+extern struct its_baser *its_lookup_baser(int type);
 
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_ITS_H_ */
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index ce607bb..79946c3 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -4,6 +4,7 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 #include <asm/gic.h>
+#include <alloc_page.h>
 
 struct its_data its_data;
 
@@ -29,11 +30,90 @@ void its_parse_typer(void)
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
+
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
