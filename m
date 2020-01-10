Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp794580lff;
        Fri, 10 Jan 2020 06:55:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaxpBKaN+MTLcGATm/R4988dS+UfT+5RPJjjoOfv5clzxDTLfBLhksVFBoz0qYYQbeHprr
X-Received: by 2002:a37:6706:: with SMTP id b6mr3298699qkc.461.1578668101084;
        Fri, 10 Jan 2020 06:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668101; cv=none;
        d=google.com; s=arc-20160816;
        b=YIJ3iTYKeU3oWRzstjh1pe1LH+Pon00Gul5e7Rx6eqqn7ySPDrSq+woc7ZkcGCmdPO
         wuPGWCSZ/vWjBHpqonDYrbhOk9+MtkYHKjjRWoHyPoy9iT/e8aq5qvxl8bKP4eFNDXkc
         1qMbcURkvOczlyUQrnnJGkbprTHhZbSxAbauVOUn/Xw8blDbAI3NxdzTz5GF77jzOh1Z
         eZ/kZ1v9Z1rpO/8XDJzSQt+aHRPMsmbHpC5w0fFMdTR6cgQC+17xNGTSwS/GR5kIt5nb
         DC9So6n6e1yLNCUOPHpLXnGlZwY1TvWm/YGFF9IAMU0f6ab3zfvL9v7ibUSlIHNeCBEQ
         hsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bytVURlKUFv7ucXkxCG9iQPMIHkm8T7+JMCuv+SFHG8=;
        b=PIe/bOh7otxy+UPWwgqn6z8BOGNCvECpqIOnd0XkZOwev/GqUcuomrIY2pyWkHwKzo
         SqyFXzg1+d1GyxBNBht91FH4SFZXWR5+6urI56ElWzl97UGi7JEAUExJEuWYcRDCw6AN
         N9FOgdAWCN5C+hsxjARm2kH/Qa/xRixRC3+EuhY+L78ANHds3QlBo/7q2ppzMlk8QzL0
         jAQmIEUYckl27MoM/3mPVQw4T/cC3OQfyaxHWSp4HMRcDiuRCoNzZ/szKSQ5B0HIgkSO
         3NbasYsPcaylz8VzAOOUXnwnjIdxwvlH40StUJYJFj0pyJecVKIejfLn2BkOL3zhNcAd
         8kQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=dTiq6sRM;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id r5si1282958qta.383.2020.01.10.06.55.00;
        Fri, 10 Jan 2020 06:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=dTiq6sRM;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C6CDF4B19E;
	Fri, 10 Jan 2020 09:55:00 -0500 (EST)
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
	with ESMTP id qmfOchM4uOq0; Fri, 10 Jan 2020 09:54:59 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8BC0A4B1A1;
	Fri, 10 Jan 2020 09:54:59 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 09F574B179
 for <kvmarm@lists.cs.columbia.edu>; Fri, 10 Jan 2020 09:54:58 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 584Y5YznZYuW for <kvmarm@lists.cs.columbia.edu>;
 Fri, 10 Jan 2020 09:54:56 -0500 (EST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id BA2054B1C5
 for <kvmarm@lists.cs.columbia.edu>; Fri, 10 Jan 2020 09:54:56 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578668096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnzALuqyh0uZ601oQnRmWo1hHMGDJqgYfkqYRybw578=;
 b=dTiq6sRM+EpnTaav4mR8F2LEqwoi2QL60RXCksdtSroJEsVcnqc/cl/rE5vME8147whV3y
 jfgURfQ/NB3VcnaJot8RBYXDhXYALs6fP3iVb6xQdGNSCn9ArqUPv9XaVhkNyXUDTW1VEx
 2/5svbpNJJo99585GmFnNlSSI7RR81E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-L6q4vxrGMBe3EPeq3xolFw-1; Fri, 10 Jan 2020 09:54:55 -0500
X-MC-Unique: L6q4vxrGMBe3EPeq3xolFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 408CE2F63;
 Fri, 10 Jan 2020 14:54:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 520987BA5F;
 Fri, 10 Jan 2020 14:54:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v2 07/16] arm/arm64: ITS: Set the LPI config
 and pending tables
Date: Fri, 10 Jan 2020 15:54:03 +0100
Message-Id: <20200110145412.14937-8-eric.auger@redhat.com>
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
X-TUID: cJINqDUZWXIz

Allocate the LPI configuration and per re-distributor pending table.
Set redistributor's PROPBASER and PENDBASER. The LPIs are enabled
by default in the config table.

Also introduce a helper routine that allows to set the pending table
bit for a given LPI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- remove memory attributes
---
 lib/arm/asm/gic-v3-its.h |  3 ++
 lib/arm/asm/gic-v3.h     | 12 ++++++++
 lib/arm/gic-v3-its.c     | 60 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 5a4dfe9..2f8b8f1 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -90,6 +90,9 @@ extern void its_init(void);
 extern int its_parse_baser(int i, struct its_baser *baser);
 extern void its_setup_baser(int i, struct its_baser *baser);
 extern struct its_baser *its_lookup_baser(int type);
+extern void set_lpi_config(int n, u8 val);
+extern u8 get_lpi_config(int n);
+extern void set_pending_table_bit(int rdist, int n, bool set);
 
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_ITS_H_ */
diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index ffb2e26..90a7304 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -48,6 +48,16 @@
 #define MPIDR_TO_SGI_AFFINITY(cluster_id, level) \
 	(MPIDR_AFFINITY_LEVEL(cluster_id, level) << ICC_SGI1R_AFFINITY_## level ## _SHIFT)
 
+#define GICR_PROPBASER_IDBITS_MASK                      (0x1f)
+
+#define GICR_PENDBASER_PTZ                              BIT_ULL(62)
+
+#define LPI_PROP_GROUP1		(1 << 1)
+#define LPI_PROP_ENABLED	(1 << 0)
+#define LPI_PROP_DEFAULT_PRIO   0xa0
+#define LPI_PROP_DEFAULT	(LPI_PROP_DEFAULT_PRIO | LPI_PROP_GROUP1 | \
+				 LPI_PROP_ENABLED)
+
 #include <asm/arch_gicv3.h>
 
 #ifndef __ASSEMBLY__
@@ -64,6 +74,8 @@ struct gicv3_data {
 	void *dist_base;
 	void *redist_bases[GICV3_NR_REDISTS];
 	void *redist_base[NR_CPUS];
+	void *lpi_prop;
+	void *lpi_pend[NR_CPUS];
 	unsigned int irq_nr;
 };
 extern struct gicv3_data gicv3_data;
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 79946c3..6c97569 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -117,3 +117,63 @@ void its_setup_baser(int i, struct its_baser *baser)
 	writeq(val, gicv3_its_base() + GITS_BASER + i * 8);
 }
 
+inline void set_lpi_config(int n, u8 value)
+{
+	u8 *entry = (u8 *)(gicv3_data.lpi_prop + (n - 8192));
+	*entry = value;
+}
+
+inline u8 get_lpi_config(int n)
+{
+	u8 *entry = (u8 *)(gicv3_data.lpi_prop + (n - 8192));
+	return *entry;
+}
+
+/* alloc_lpi_tables: Allocate LPI config and pending tables */
+void alloc_lpi_tables(void);
+void alloc_lpi_tables(void)
+{
+	unsigned long n = SZ_64K >> PAGE_SHIFT;
+	unsigned long order = fls(n);
+	u64 prop_val;
+	int cpu;
+
+	gicv3_data.lpi_prop = (void *)virt_to_phys(alloc_pages(order));
+
+	/* ID bits = 13, ie. up to 14b LPI INTID */
+	prop_val = (u64)gicv3_data.lpi_prop | 13;
+
+	/*
+	 * Allocate pending tables for each redistributor
+	 * and set PROPBASER and PENDBASER
+	 */
+	for_each_present_cpu(cpu) {
+		u64 pend_val;
+		void *ptr;
+
+		ptr = gicv3_data.redist_base[cpu];
+
+		writeq(prop_val, ptr + GICR_PROPBASER);
+
+		gicv3_data.lpi_pend[cpu] =
+			(void *)virt_to_phys(alloc_pages(order));
+
+		pend_val = (u64)gicv3_data.lpi_pend[cpu];
+
+		writeq(pend_val, ptr + GICR_PENDBASER);
+	}
+}
+
+void set_pending_table_bit(int rdist, int n, bool set)
+{
+	u8 *ptr = phys_to_virt((phys_addr_t)gicv3_data.lpi_pend[rdist]);
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
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
