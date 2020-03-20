Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp625914lfe;
        Fri, 20 Mar 2020 02:25:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuBs1IqLqNKcuCR+rFefHPAt0iJCsxw3OJ4VFbaTeB+tJiY1CE46bDEZx03Qq2bVIjJ3rUc
X-Received: by 2002:aca:d40f:: with SMTP id l15mr5426339oig.90.1584696316817;
        Fri, 20 Mar 2020 02:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584696316; cv=none;
        d=google.com; s=arc-20160816;
        b=rwF0mrT6Ww8T9AtPnaKB271ZYiqapjqDPBIZ9hMFDB121IfnXM7/8V5ZM5g90Jhh19
         xKMff7Mlxi+7YkK952xjtNEIpF5Ew44gNfHl3zBuojCQujouVL0husxBRMQD5vj4VnJw
         rgkAGGQK1w4wNn1WqR0+/+XyRf/Qxymg0hAXNSg3KyD4dQ3LHMK9I7jIDEisK8tcSHAP
         giNkUkqnTygCnSFVkIq3XupybhM0YxavI/n4jCNxOHKyUZFYX1aPYFU06yjPtzxY7xhi
         LQjgBFwSnIdNlZ/3vijNiwKi5ljXdZJ6rF+j1h786Rp9EtwfevZ3lY9jo4MQylS6wXX3
         5Xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=zbwYQRdnJ0gHuLZ6b4AnrTg2nnXD+s5eXPGTxieqPBU=;
        b=FvK9A75YhRKxdCubO0h/nzRhr4ErJ2/OGYCiu3O1wEL8nDKkbKbGQRhE8SICnRFgbM
         1RWm1VVmdOhGGMxxEmCKviwd6GU07uuX61azuveqbiUn+9wnrWNM5E9cM1EwOxX8aY2B
         8czl0hnQk7iiVF41oKdAkP7qbDAeE/xMsbj7MhHrDLOoZ5Tbb+VddX/1ZgRKoaxJJdhN
         gH9uYBpyM3mDCKoCWhoTfcBj6CyQ6Lmz9C8GP30mM3TPUe/gxrjuvg4XsbCQUQ0Rznzt
         7aO7C5CTDdK+Wjk/fmlnznG0CcShEJRyJPrJ/zIyYR8BpKtM2uF6M8wMZ+rH7fqf6LQI
         CLwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gv+4c1rz;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v25si2732057oth.274.2020.03.20.02.25.16;
        Fri, 20 Mar 2020 02:25:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gv+4c1rz;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgCTJZP (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 20 Mar 2020 05:25:15 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:34417 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727154AbgCTJZP (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 20 Mar 2020 05:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584696314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zbwYQRdnJ0gHuLZ6b4AnrTg2nnXD+s5eXPGTxieqPBU=;
        b=Gv+4c1rzkBL36nTbya3oKbU/8ZfoDiNRA1ckNiJXuc9KY8sF3xIVy/QWhJg7TmNA+xnkXb
        GvV8rfNwd84k/M3Hz0qsU6gvhXgPC2NyScpfOF+UOVeXFUufBSld06xEc1A2/wLCUhGZH8
        0LBsrsIRd7FH6s3Mel6jY2+fkn86Vi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-zaEEvDL9NFq7ELMG1LOSnw-1; Fri, 20 Mar 2020 05:25:12 -0400
X-MC-Unique: zaEEvDL9NFq7ELMG1LOSnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14AE9107ACC4;
        Fri, 20 Mar 2020 09:25:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DEE755C1D8;
        Fri, 20 Mar 2020 09:25:07 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v7 07/13] arm/arm64: ITS: its_enable_defaults
Date:   Fri, 20 Mar 2020 10:24:22 +0100
Message-Id: <20200320092428.20880-8-eric.auger@redhat.com>
In-Reply-To: <20200320092428.20880-1-eric.auger@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: BVGuJZsNJ1xd

its_enable_defaults() enable LPIs at redistributor level
and ITS level.

gicv3_enable_defaults must be called before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

---
v6 -> v7:
- use for_each_present_cpu in its_enable_defaults

v5 -> v6:
- gicv3_lpi_set/get_config introduced before this patch
- dist/redist in commit msg
- Added Zenghui's R-b

v4 -> v5:
- some reformattings moved to earlier patch
- add assert(!gicv3_redist_base()) in alloc_lpi_tables()
- revert the usage of for_each_present_cpu()

v3 -> v4:
- use GITS_BASER_INDIRECT & GITS_BASER_VALID in its_setup_baser()
- don't parse BASERs again in its_enable_defaults
- rename its_setup_baser into its_baser_alloc_table
- All allocations moved to the init function
- squashed "arm/arm64: gicv3: Enable/Disable LPIs at re-distributor level=
"
  into this patch
- introduce gicv3_lpi_rdist_enable and gicv3_lpi_rdist_disable
- pend and prop table bases stored as virt addresses
- move some init functions from enable() to its_init
- removed GICR_PROPBASER_IDBITS_MASK
- introduced LPI_OFFSET
- lpi_prop becomes u8 *
- gicv3_lpi_set_config/get_config became macro
- renamed gicv3_lpi_set_pending_table_bit into gicv3_lpi_set_clr_pending

v2 -> v3:
- introduce its_setup_baser in this patch
- squash "arm/arm64: ITS: Init the command queue" in this patch.
---
 lib/arm/asm/gic-v3.h       |  6 ++++++
 lib/arm/gic-v3.c           | 25 +++++++++++++++++++++++++
 lib/arm64/asm/gic-v3-its.h |  1 +
 lib/arm64/gic-v3-its.c     | 13 +++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index fedffa8..cb72922 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -57,6 +57,10 @@
 #define LPI_PROP_DEFAULT_PRIO		0xa0
 #define LPI_PROP_DEFAULT		(LPI_PROP_DEFAULT_PRIO | LPI_PROP_GROUP1 | LPI=
_PROP_ENABLED)
=20
+#define LPI_ID_BASE			8192
+#define LPI(lpi)			((lpi) + LPI_ID_BASE)
+#define LPI_OFFSET(intid)		((intid) - LPI_ID_BASE)
+
 #include <asm/arch_gicv3.h>
=20
 #ifndef __ASSEMBLY__
@@ -93,6 +97,8 @@ extern void gicv3_ipi_send_mask(int irq, const cpumask_=
t *dest);
 extern void gicv3_set_redist_base(size_t stride);
 extern void gicv3_lpi_set_clr_pending(int rdist, int n, bool set);
 extern void gicv3_lpi_alloc_tables(void);
+extern void gicv3_lpi_rdist_enable(int redist);
+extern void gicv3_lpi_rdist_disable(int redist);
=20
 static inline void gicv3_do_wait_for_rwp(void *base)
 {
diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
index 6cf1d1d..a7e2cb8 100644
--- a/lib/arm/gic-v3.c
+++ b/lib/arm/gic-v3.c
@@ -199,4 +199,29 @@ void gicv3_lpi_set_clr_pending(int rdist, int n, boo=
l set)
 		byte &=3D ~mask;
 	*ptr =3D byte;
 }
+
+static void gicv3_lpi_rdist_ctrl(u32 redist, bool set)
+{
+	void *ptr;
+	u64 val;
+
+	assert(redist < nr_cpus);
+
+	ptr =3D gicv3_data.redist_base[redist];
+	val =3D readl(ptr + GICR_CTLR);
+	if (set)
+		val |=3D GICR_CTLR_ENABLE_LPIS;
+	else
+		val &=3D ~GICR_CTLR_ENABLE_LPIS;
+	writel(val,  ptr + GICR_CTLR);
+}
+
+void gicv3_lpi_rdist_enable(int redist)
+{
+	gicv3_lpi_rdist_ctrl(redist, true);
+}
+void gicv3_lpi_rdist_disable(int redist)
+{
+	gicv3_lpi_rdist_ctrl(redist, false);
+}
 #endif /* __aarch64__ */
diff --git a/lib/arm64/asm/gic-v3-its.h b/lib/arm64/asm/gic-v3-its.h
index 30f2d90..4683011 100644
--- a/lib/arm64/asm/gic-v3-its.h
+++ b/lib/arm64/asm/gic-v3-its.h
@@ -92,5 +92,6 @@ extern struct its_data its_data;
 extern void its_parse_typer(void);
 extern void its_init(void);
 extern int its_baser_lookup(int i, struct its_baser *baser);
+extern void its_enable_defaults(void);
=20
 #endif /* _ASMARM64_GIC_V3_ITS_H_ */
diff --git a/lib/arm64/gic-v3-its.c b/lib/arm64/gic-v3-its.c
index fb8e3f2..afc66a3 100644
--- a/lib/arm64/gic-v3-its.c
+++ b/lib/arm64/gic-v3-its.c
@@ -96,3 +96,16 @@ void its_init(void)
 	its_cmd_queue_init();
 }
=20
+/* must be called after gicv3_enable_defaults */
+void its_enable_defaults(void)
+{
+	int cpu;
+
+	/* Allocate LPI config and pending tables */
+	gicv3_lpi_alloc_tables();
+
+	for_each_present_cpu(cpu)
+		gicv3_lpi_rdist_enable(cpu);
+
+	writel(GITS_CTLR_ENABLE, its_data.base + GITS_CTLR);
+}
--=20
2.20.1
