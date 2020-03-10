Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp848121lfc;
        Tue, 10 Mar 2020 07:54:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvDHEsyzw6TRtY9IFh9wve0OsCNPjdaRU0pmH2Wm+zSeSGgQriSdh+4hnpS4twBuyhTVTrF
X-Received: by 2002:a54:478c:: with SMTP id o12mr1388220oic.106.1583852092025;
        Tue, 10 Mar 2020 07:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852092; cv=none;
        d=google.com; s=arc-20160816;
        b=GhHzWRdKvX7qSf9A4etYajRanI/pLt5IUUldOU+ps0NEy06M0EiRlpjmIpwdIuzdej
         aeIQyxbvs3MYPI61GiAHhV0VsQlzfbQXr3osk+IEgPzsR2ozNeMcRQ+tYQqXdppwNJLr
         jb42hQanI8TLdfUgxSNt/SnteWgasYydjFfxIGySuKHGa+oXMyNm6YPJlmUC5cjY7hiM
         c6H0IL09XpP21/AM/YYVFCSofC3TIKN0QFTCn8iJsJyv0vnzETs7uNVjQHTFCTlAfvre
         0eeWN4LncTQX36043hChmKOWNmnWDXFYf0uZXVpEg9FjWyVzgJas8r3CwywfYAriyue+
         d0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=eWy5McY6eB7C+vh7RVoKKn2V/o13KXTlUdJUdwIQy/w=;
        b=HyaNFbXH3x7YKny/y+t0/XTEsRboCfUNlHpZEupxU7ToRIjkMcdEL7dQR31uvnYSlc
         tM13a5U10waPvZDlBhOjKR7lwoo3FE5seda2wdMeW5VYvQe/SPlhfrw/BYd7YGusT9mQ
         TJrocmXw/WIPg5zSU/soWLl1jkjyJkuh7tmAM8RhuNO6HdbN9WpTdsU1ngTvR7JK0ekU
         9B0BMrZKzK2YaDPWFiN0DZ6g5Qv8ohVIWH3ncjcYGVe3xW49CA+1oK74ym9H61YRXqkE
         0tEiAPGX0/tOnLLOcZgkwkItZGEPW2a5JXpyZSLwIpyw1x557y73hf9uRoXJ193q0Q0x
         ITGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lc+tLz24;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id i7si5431916oth.143.2020.03.10.07.54.51;
        Tue, 10 Mar 2020 07:54:52 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lc+tLz24;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbgCJOyv (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 10 Mar 2020 10:54:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32129 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727575AbgCJOyu (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 10 Mar 2020 10:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583852088;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eWy5McY6eB7C+vh7RVoKKn2V/o13KXTlUdJUdwIQy/w=;
        b=Lc+tLz2478isYZufoCmD4MUhdgVSvDr27R4nBOt/kDLDVNIWdgdcoMMfj4gWtj9AL6Rkkc
        xySDfswWOgeAi1dp1BTy0i8XTZwkzgql2eU/z59HlXlJmVSAO5ZPj8Zd41vWX/DAP9lcYJ
        4Brg9cn3/d09HjDU5kY2fd7KMzIvge4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-Uu-d2eREOSizLzybXeE1WQ-1; Tue, 10 Mar 2020 10:54:47 -0400
X-MC-Unique: Uu-d2eREOSizLzybXeE1WQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B8C81007269;
        Tue, 10 Mar 2020 14:54:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-85.ams2.redhat.com [10.36.117.85])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3A0B460BF3;
        Tue, 10 Mar 2020 14:54:40 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v5 05/13] arm/arm64: gicv3: Set the LPI config and pending tables
Date:   Tue, 10 Mar 2020 15:54:02 +0100
Message-Id: <20200310145410.26308-6-eric.auger@redhat.com>
In-Reply-To: <20200310145410.26308-1-eric.auger@redhat.com>
References: <20200310145410.26308-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ALx2D+Nes+2f

Allocate the LPI configuration and per re-distributor pending table.
Set redistributor's PROPBASER and PENDBASER. The LPIs are enabled
by default in the config table.

Also introduce a helper routine that allows to set the pending table
bit for a given LPI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

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
 lib/arm/asm/gic-v3.h | 15 +++++++++++++
 lib/arm/gic-v3.c     | 53 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index 47df051..064cc68 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -50,6 +50,15 @@
 #define MPIDR_TO_SGI_AFFINITY(cluster_id, level) \
 	(MPIDR_AFFINITY_LEVEL(cluster_id, level) << ICC_SGI1R_AFFINITY_## level=
 ## _SHIFT)
=20
+#define GICR_PROPBASER_IDBITS_MASK	(0x1f)
+
+#define GICR_PENDBASER_PTZ		BIT_ULL(62)
+
+#define LPI_PROP_GROUP1			(1 << 1)
+#define LPI_PROP_ENABLED		(1 << 0)
+#define LPI_PROP_DEFAULT_PRIO		0xa0
+#define LPI_PROP_DEFAULT		(LPI_PROP_DEFAULT_PRIO | LPI_PROP_GROUP1 | LPI=
_PROP_ENABLED)
+
 #include <asm/arch_gicv3.h>
=20
 #ifndef __ASSEMBLY__
@@ -66,6 +75,8 @@ struct gicv3_data {
 	void *dist_base;
 	void *redist_bases[GICV3_NR_REDISTS];
 	void *redist_base[NR_CPUS];
+	u8 *lpi_prop;
+	void *lpi_pend[NR_CPUS];
 	unsigned int irq_nr;
 };
 extern struct gicv3_data gicv3_data;
@@ -82,6 +93,10 @@ extern void gicv3_write_eoir(u32 irqstat);
 extern void gicv3_ipi_send_single(int irq, int cpu);
 extern void gicv3_ipi_send_mask(int irq, const cpumask_t *dest);
 extern void gicv3_set_redist_base(size_t stride);
+extern void gicv3_lpi_set_config(int n, u8 val);
+extern u8 gicv3_lpi_get_config(int n);
+extern void gicv3_lpi_set_clr_pending(int rdist, int n, bool set);
+extern void gicv3_lpi_alloc_tables(void);
=20
 static inline void gicv3_do_wait_for_rwp(void *base)
 {
diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
index feecb5e..d752bd4 100644
--- a/lib/arm/gic-v3.c
+++ b/lib/arm/gic-v3.c
@@ -5,6 +5,7 @@
  */
 #include <asm/gic.h>
 #include <asm/io.h>
+#include <alloc_page.h>
=20
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
+	unsigned long n =3D SZ_64K >> PAGE_SHIFT;
+	unsigned long order =3D fls(n);
+	u64 prop_val;
+	int cpu;
+
+	assert(!gicv3_redist_base());
+
+	gicv3_data.lpi_prop =3D alloc_pages(order);
+
+	/* ID bits =3D 13, ie. up to 14b LPI INTID */
+	prop_val =3D (u64)(virt_to_phys(gicv3_data.lpi_prop)) | 13;
+
+	for_each_present_cpu(cpu) {
+		u64 pend_val;
+		void *ptr;
+
+		ptr =3D gicv3_data.redist_base[cpu];
+
+		writeq(prop_val, ptr + GICR_PROPBASER);
+
+		gicv3_data.lpi_pend[cpu] =3D alloc_pages(order);
+		pend_val =3D (u64)(virt_to_phys(gicv3_data.lpi_pend[cpu]));
+		writeq(pend_val, ptr + GICR_PENDBASER);
+	}
+}
+
+void gicv3_lpi_set_clr_pending(int rdist, int n, bool set)
+{
+	u8 *ptr =3D gicv3_data.lpi_pend[rdist];
+	u8 mask =3D 1 << (n % 8), byte;
+
+	ptr +=3D (n / 8);
+	byte =3D *ptr;
+	if (set)
+		byte |=3D  mask;
+	else
+		byte &=3D ~mask;
+	*ptr =3D byte;
+}
+#endif /* __aarch64__ */
--=20
2.20.1
