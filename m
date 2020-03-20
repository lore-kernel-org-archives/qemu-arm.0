Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp625830lfe;
        Fri, 20 Mar 2020 02:25:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvcL1j/k0eylOodGhOy6B95jIBTpoGjlTXuzjnBekoEnmdZdieo8rWLft5rHaoDjx2LFmqp
X-Received: by 2002:a05:6830:1513:: with SMTP id k19mr5621021otp.276.1584696312492;
        Fri, 20 Mar 2020 02:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584696312; cv=none;
        d=google.com; s=arc-20160816;
        b=S6+Ovs2lGiUWd8wuDJ2cL6/HhuUhKROdSyIlv6yzF/JVIylh8QjmgVkyu8IGtXH2Y2
         sG2Iin6XXbjrJ5LfnCO5BWkHw7whWd95AyDs+rKevbRD1K4qLNJH9gEk0GBjIVhhNbS4
         pp4alLssO8Jb3NsIWizEerZsATySo3tlFFAEubSr6WaNUrmAHzuWYnF7XupcoAvZKAJ3
         8egnphPxgCsrqnQuyHa0njLTzrwcTtlZkF/4tldoo7bEiNBRfDZIF8zaLYYquVIh5qhn
         Voihiiv9N+VhNvBPNZeo6dddwxhAWlOgqSIz8JD7huNnfFOj5L0ZqpgQc1KwlQZit4K5
         v5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Zl9FDtxwOI/FksilYChFV1G9aFjsIXI5j5prCQSwE+w=;
        b=QnaB5z/6HHjF6d1NPJQGthtaprmIr/n1+Zw87yhpsBpLqMck51+L9HQl+95Nv3bszz
         8ZDZqx2n9lLfiYMFg/BGoSlAZDCKYR6lCSPztMuT9kEshBHyE3i53vdOUPCMw7Fs6wlb
         Vh3DchZGpa1vKR8lh9irOGy22vg6bFNMDJ4lIwzOJTvvXYRbiNuXolZ6u0/pYl7LTjjc
         58o7GaI/HZqG3DmpNPfgtzP2ghnvs8TiUAgw66kAt6i11JaCFxj+aQHU6m2tBC8bIz8R
         C5TOnqSZ2Uqe/7SH2sU2oDQnnz22MUKYdlFDJw7AJOPxscMDd8PJyFTFFgSTOm2LC9zQ
         7fKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HR9lNlrN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v25si2732057oth.274.2020.03.20.02.25.12;
        Fri, 20 Mar 2020 02:25:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HR9lNlrN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgCTJZI (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 20 Mar 2020 05:25:08 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:57533 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727002AbgCTJZH (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 20 Mar 2020 05:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584696307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zl9FDtxwOI/FksilYChFV1G9aFjsIXI5j5prCQSwE+w=;
        b=HR9lNlrNuuAQg7GZFmKphGaTQspCDTG0TSVX51fFTWpqOHTLoMu19Sh2FQ6BlqDv2w/fpj
        VooXgWtHXWlraOnv2yGCNvq4yE0yyNVnbXlfG1K2r4SB7MemdR8AtwTfJN1QATxaKVsUoN
        Pk487DtKw8fixgPUCWtBQuAooauQs7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-kec4IxgiNq-1dn2OBz0ktw-1; Fri, 20 Mar 2020 05:25:05 -0400
X-MC-Unique: kec4IxgiNq-1dn2OBz0ktw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10FCB8017CC;
        Fri, 20 Mar 2020 09:25:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E83075C1D8;
        Fri, 20 Mar 2020 09:24:58 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v7 05/13] arm/arm64: gicv3: Set the LPI config and pending tables
Date:   Fri, 20 Mar 2020 10:24:20 +0100
Message-Id: <20200320092428.20880-6-eric.auger@redhat.com>
In-Reply-To: <20200320092428.20880-1-eric.auger@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 94BjAwSEDOpV

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
 	(MPIDR_AFFINITY_LEVEL(cluster_id, level) << ICC_SGI1R_AFFINITY_## level=
 ## _SHIFT)
=20
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
=20
 static inline void gicv3_do_wait_for_rwp(void *base)
 {
@@ -127,5 +138,11 @@ static inline u64 mpidr_uncompress(u32 compressed)
 	return mpidr;
 }
=20
+#define gicv3_lpi_set_config(intid, value) ({		\
+	gicv3_data.lpi_prop[LPI_OFFSET(intid)] =3D value;	\
+})
+
+#define gicv3_lpi_get_config(intid) (gicv3_data.lpi_prop[LPI_OFFSET(inti=
d)])
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
+	assert(gicv3_redist_base());
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
