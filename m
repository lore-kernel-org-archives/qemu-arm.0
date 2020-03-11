Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp796587lfc;
        Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs4Io6tuYtXdvMcLupaA3uvVu9Oiat0oQkef4y8Ll+xfhT7eG8ddP04x7t6vRe8Fl09jrOv
X-Received: by 2002:a37:bc1:: with SMTP id 184mr2789822qkl.57.1583934722098;
        Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583934722; cv=none;
        d=google.com; s=arc-20160816;
        b=Reg1ZLBn8BcBre6ex8JuBiYhHuPot9WFTsSP5apQwjTMPWE9/DWUpWLPAeXxFPV5Vu
         n923nC0n1PF8M3Xz/NJ9WBA6EryD6VB5MGM/btCA0pNkveTZ23r4sDH35RxAvR0JBaZB
         5Ab/nUB01qLhIpSfDUoyeGBt5A9m5kiRyjXZkW57/yPVOjXAU/7OzK7eBAnJv3/Z7p+F
         a9PeDT2o0CtF58Tves9pzHMlfA3tWLOCKwUkz/SG/IIQfxvdMxEbDQQUp2fRiT+JzqlS
         XAVrHJq7M3UWpVDoI3LvppPy/qK1+skEwOxAF8XRw/+0P8fq4lCdUW/zl242cM2v4k3C
         xERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iYnVqFam6Wth4a1qDFI85EUofVk7pvTrA2O4qIpDqHQ=;
        b=bxQBtawYiVhXzUWr3P3/82kI+G9UHjgrPdhmaDu+bZQMmmGIUger0g+h9x4DaHYmqI
         +EtMC2O5zr3axD19w3ZUFwi16GqRJiFEWKD1jBO3nAGo5ODmJPzoGxMQP8/bS1HJ+gCR
         DpD1Bb1qzLWtUaKZ2ZxZjlfAqnxRhj9DMlyLHwd4WmEYWXflAduyFhuKUOXifOn6u8SV
         aGsPp0FpJl5vm32qqQWg55xlgUooAorzlW1P0KtKItBSqIELhdb4StBW2N9GG/ozYroK
         kIRsNvP3P0YTfFBrToEgQvQXpSV9/YPK+ZrosLE2YbdNHQmg2OmS1+6t/efT/bWRodc3
         vxNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="Zflp/RqB";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id f5si1090469qto.283.2020.03.11.06.52.01;
        Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="Zflp/RqB";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C5B8F4A95D;
	Wed, 11 Mar 2020 09:52:01 -0400 (EDT)
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
	with ESMTP id NyR7AAiqDVWT; Wed, 11 Mar 2020 09:52:00 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8B3CE4A7FE;
	Wed, 11 Mar 2020 09:52:00 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C89064A551
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 09:51:59 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZWabL3CCPIx for <kvmarm@lists.cs.columbia.edu>;
 Wed, 11 Mar 2020 09:51:58 -0400 (EDT)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C3ABF4A4FC
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 09:51:58 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583934718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zl9FDtxwOI/FksilYChFV1G9aFjsIXI5j5prCQSwE+w=;
 b=Zflp/RqBaACqwkoNIzFg7nMQwy1h3Z2EdxLnzn7YCFXQCxUZQxieCkKb7p5HVNzcr3yLxz
 YmXl7nfQuM2sG7WkEJakOxpcym8LuW9AOpiE1Vg8H2a/WrzCTuvqX4GDfD3Hpm8tPD1w1d
 utiOhX9ONV7Z4H7XU5AGedGQIVmg/oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-stmFc2VFMl6MkBlKwYFiCg-1; Wed, 11 Mar 2020 09:51:57 -0400
X-MC-Unique: stmFc2VFMl6MkBlKwYFiCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D828017CC;
 Wed, 11 Mar 2020 13:51:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AA1D5C13D;
 Wed, 11 Mar 2020 13:51:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v6 05/13] arm/arm64: gicv3: Set the LPI config
 and pending tables
Date: Wed, 11 Mar 2020 14:51:09 +0100
Message-Id: <20200311135117.9366-6-eric.auger@redhat.com>
In-Reply-To: <20200311135117.9366-1-eric.auger@redhat.com>
References: <20200311135117.9366-1-eric.auger@redhat.com>
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
X-TUID: GbmfE44JclTd

Allocate the LPI configuration and per re-distributor pending table.
Set redistributor's PROPBASER and PENDBASER. The LPIs are enabled
by default in the config table.

Also introduce a helper routine that allows to set the pending
table bit for a given LPI and macros to set/get its configuration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

---

v5 -> v6:
- fix the assert()
- remove GICR_PROPBASER_IDBITS_MASK
- remove gicv3_lpi_set_config and gicv3_lpi_get_config declarations
  and move macros in this patch

v4 -> v5:
- Moved some reformattings previously done in
  "arm/arm64: ITS: its_enable_defaults", in this patch
- added assert(!gicv3_redist_base()) in gicv3_lpi_alloc_tables()
- revert for_each_present_cpu() change

v2 -> v3:
- Move the helpers in lib/arm/gic-v3.c and prefix them with "gicv3_"
  and add _lpi prefix too

v1 -> v2:
- remove memory attributes
---
 lib/arm/asm/gic-v3.h | 17 ++++++++++++++
 lib/arm/gic-v3.c     | 53 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index 47df051..fedffa8 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -50,6 +50,13 @@
 #define MPIDR_TO_SGI_AFFINITY(cluster_id, level) \
 	(MPIDR_AFFINITY_LEVEL(cluster_id, level) << ICC_SGI1R_AFFINITY_## level ## _SHIFT)
 
+#define GICR_PENDBASER_PTZ		BIT_ULL(62)
+
+#define LPI_PROP_GROUP1			(1 << 1)
+#define LPI_PROP_ENABLED		(1 << 0)
+#define LPI_PROP_DEFAULT_PRIO		0xa0
+#define LPI_PROP_DEFAULT		(LPI_PROP_DEFAULT_PRIO | LPI_PROP_GROUP1 | LPI_PROP_ENABLED)
+
 #include <asm/arch_gicv3.h>
 
 #ifndef __ASSEMBLY__
@@ -66,6 +73,8 @@ struct gicv3_data {
 	void *dist_base;
 	void *redist_bases[GICV3_NR_REDISTS];
 	void *redist_base[NR_CPUS];
+	u8 *lpi_prop;
+	void *lpi_pend[NR_CPUS];
 	unsigned int irq_nr;
 };
 extern struct gicv3_data gicv3_data;
@@ -82,6 +91,8 @@ extern void gicv3_write_eoir(u32 irqstat);
 extern void gicv3_ipi_send_single(int irq, int cpu);
 extern void gicv3_ipi_send_mask(int irq, const cpumask_t *dest);
 extern void gicv3_set_redist_base(size_t stride);
+extern void gicv3_lpi_set_clr_pending(int rdist, int n, bool set);
+extern void gicv3_lpi_alloc_tables(void);
 
 static inline void gicv3_do_wait_for_rwp(void *base)
 {
@@ -127,5 +138,11 @@ static inline u64 mpidr_uncompress(u32 compressed)
 	return mpidr;
 }
 
+#define gicv3_lpi_set_config(intid, value) ({		\
+	gicv3_data.lpi_prop[LPI_OFFSET(intid)] = value;	\
+})
+
+#define gicv3_lpi_get_config(intid) (gicv3_data.lpi_prop[LPI_OFFSET(intid)])
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_H_ */
diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
index feecb5e..6cf1d1d 100644
--- a/lib/arm/gic-v3.c
+++ b/lib/arm/gic-v3.c
@@ -5,6 +5,7 @@
  */
 #include <asm/gic.h>
 #include <asm/io.h>
+#include <alloc_page.h>
 
 void gicv3_set_redist_base(size_t stride)
 {
@@ -147,3 +148,55 @@ void gicv3_ipi_send_single(int irq, int cpu)
 	cpumask_set_cpu(cpu, &dest);
 	gicv3_ipi_send_mask(irq, &dest);
 }
+
+#if defined(__aarch64__)
+
+/*
+ * alloc_lpi_tables - Allocate LPI config and pending tables
+ * and set PROPBASER (shared by all rdistributors) and per
+ * redistributor PENDBASER.
+ *
+ * gicv3_set_redist_base() must be called before
+ */
+void gicv3_lpi_alloc_tables(void)
+{
+	unsigned long n = SZ_64K >> PAGE_SHIFT;
+	unsigned long order = fls(n);
+	u64 prop_val;
+	int cpu;
+
+	assert(gicv3_redist_base());
+
+	gicv3_data.lpi_prop = alloc_pages(order);
+
+	/* ID bits = 13, ie. up to 14b LPI INTID */
+	prop_val = (u64)(virt_to_phys(gicv3_data.lpi_prop)) | 13;
+
+	for_each_present_cpu(cpu) {
+		u64 pend_val;
+		void *ptr;
+
+		ptr = gicv3_data.redist_base[cpu];
+
+		writeq(prop_val, ptr + GICR_PROPBASER);
+
+		gicv3_data.lpi_pend[cpu] = alloc_pages(order);
+		pend_val = (u64)(virt_to_phys(gicv3_data.lpi_pend[cpu]));
+		writeq(pend_val, ptr + GICR_PENDBASER);
+	}
+}
+
+void gicv3_lpi_set_clr_pending(int rdist, int n, bool set)
+{
+	u8 *ptr = gicv3_data.lpi_pend[rdist];
+	u8 mask = 1 << (n % 8), byte;
+
+	ptr += (n / 8);
+	byte = *ptr;
+	if (set)
+		byte |=  mask;
+	else
+		byte &= ~mask;
+	*ptr = byte;
+}
+#endif /* __aarch64__ */
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
