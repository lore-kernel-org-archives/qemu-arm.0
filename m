Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5075195lff;
        Mon, 16 Dec 2019 12:49:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzBJ1Eb0VpH9OerJh2y423Yg11JvqrTMlPO+DBRcNVIRxtURasB9mEH2bPGnRXSTOXMOxax
X-Received: by 2002:a05:6830:128e:: with SMTP id z14mr32591555otp.184.1576529340074;
        Mon, 16 Dec 2019 12:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576529340; cv=none;
        d=google.com; s=arc-20160816;
        b=nPc8sVCZ9KP8G+p+MY3JJzmUIPXGBNVr6yZdS+3oaUrryg95ClabAX67vtJtubt9ew
         sH3OTcBnnIXauzsXD7ng+0Iz8EsNfxa1TvibUlqxf1aVmsrvFP2i4mSvK/TGzILx7S2H
         hIeNOy9ywFBGcnt9/WLTCDFV/OJ+El26pnlpWisQYSAUidyieNZCkhnhbpJApo5HzT/D
         1Fjb8lUzrwZkzS2XGctgS0sjrYGmNp4p6B2g8fpT8NKWQNLQ9Bk4U9IavC6o9fYWWWwO
         EJQxR17aX15gsM1Llfk+NqY4xymJh16qk4j5bCSc/sz6DUhlJgf748SCU2AsN0J1cItW
         /z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=xlSr73pKSiopKdILGn5ZrLva3IOgBSdl74YTmPimHio=;
        b=gyyMbhWvb5bxJkbf/tIIXgQKQ6cI04YzKyjB/Ib5WKGVa5NUdVnO3zHnoM2HavKU0A
         QHRIpnxBTfYJUZu3FalqD/cf2gqCBDsW12JhcWAvJ5F8JYEKDkvZCX9OJsV1DI9wdzWm
         QM1zSbAWJNnv0Pf5CQwErKkLjtOioaHmuQGsoAo0MbJznsS9RbadDEDlhbmhCDUtyzOv
         Rdne/Ve6uhfdk1d/zCe9E8uAm/xXpmZYx2yDxF923xNcfUqtGYO2v/4umD5FfPytRGm1
         mmQAKb4NSGiWU4oZcjdipRtefXnmttxcmxs7EEahgwNzYokJjoHwXHai0AZFRjVrFlhP
         fo7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=coEMHF6x;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id q10si11463915otn.53.2019.12.16.12.48.59;
        Mon, 16 Dec 2019 12:49:00 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=coEMHF6x;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfLPUs7 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 15:48:59 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32576 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726571AbfLPUs6 (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 16 Dec 2019 15:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576529337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xlSr73pKSiopKdILGn5ZrLva3IOgBSdl74YTmPimHio=;
        b=coEMHF6xnRZaxsmeSuZdjR0pNBdy27RSCNFd5TQN1V8dDzvI0lueDuyrLp57pBRUV0WhBu
        AoiCEjNiOMT23EZZ5fjn6L9dOicXfgtyd5UiosFlUgeZLLPYnsnJYgyARVmRP76d4fR8Qo
        gAvuMNcimZfzJY5H7txb1ekUDGrncXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-OlX8qa1eNJigoM1oY1pwZA-1; Mon, 16 Dec 2019 15:48:53 -0500
X-MC-Unique: OlX8qa1eNJigoM1oY1pwZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 027DF10B9593;
        Mon, 16 Dec 2019 20:48:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E2015D9C9;
        Mon, 16 Dec 2019 20:48:34 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH 08/10] arm: gic: Provide per-IRQ helper functions
Date:   Mon, 16 Dec 2019 21:47:55 +0100
Message-Id: <20191216204757.4020-9-eric.auger@redhat.com>
In-Reply-To: <20191216204757.4020-1-eric.auger@redhat.com>
References: <20191216204757.4020-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: BJL6SEstDyJM

From: Andre Przywara <andre.przywara@arm.com>

A common theme when accessing per-IRQ parameters in the GIC distributor
is to set fields of a certain bit width in a range of MMIO registers.
Examples are the enabled status (one bit per IRQ), the level/edge
configuration (2 bits per IRQ) or the priority (8 bits per IRQ).

Add a generic helper function which is able to mask and set the
respective number of bits, given the IRQ number and the MMIO offset.
Provide wrappers using this function to easily allow configuring an IRQ.

For now assume that private IRQ numbers always refer to the current CPU.
In a GICv2 accessing the "other" private IRQs is not easily doable (the
registers are banked per CPU on the same MMIO address), so we impose the
same limitation on GICv3, even though those registers are not banked
there anymore.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>

---

initialize reg
---
 lib/arm/asm/gic-v3.h |  2 +
 lib/arm/asm/gic.h    |  9 +++++
 lib/arm/gic.c        | 90 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index 347be2f..4a445a5 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -23,6 +23,8 @@
 #define GICD_CTLR_ENABLE_G1A		(1U << 1)
 #define GICD_CTLR_ENABLE_G1		(1U << 0)
=20
+#define GICD_IROUTER			0x6000
+
 /* Re-Distributor registers, offsets from RD_base */
 #define GICR_TYPER			0x0008
=20
diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
index 1fc10a0..21cdb58 100644
--- a/lib/arm/asm/gic.h
+++ b/lib/arm/asm/gic.h
@@ -15,6 +15,7 @@
 #define GICD_IIDR			0x0008
 #define GICD_IGROUPR			0x0080
 #define GICD_ISENABLER			0x0100
+#define GICD_ICENABLER			0x0180
 #define GICD_ISPENDR			0x0200
 #define GICD_ICPENDR			0x0280
 #define GICD_ISACTIVER			0x0300
@@ -73,5 +74,13 @@ extern void gic_write_eoir(u32 irqstat);
 extern void gic_ipi_send_single(int irq, int cpu);
 extern void gic_ipi_send_mask(int irq, const cpumask_t *dest);
=20
+void gic_set_irq_bit(int irq, int offset);
+void gic_enable_irq(int irq);
+void gic_disable_irq(int irq);
+void gic_set_irq_priority(int irq, u8 prio);
+void gic_set_irq_target(int irq, int cpu);
+void gic_set_irq_group(int irq, int group);
+int gic_get_irq_group(int irq);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_H_ */
diff --git a/lib/arm/gic.c b/lib/arm/gic.c
index 9430116..aa9cb86 100644
--- a/lib/arm/gic.c
+++ b/lib/arm/gic.c
@@ -146,3 +146,93 @@ void gic_ipi_send_mask(int irq, const cpumask_t *des=
t)
 	assert(gic_common_ops && gic_common_ops->ipi_send_mask);
 	gic_common_ops->ipi_send_mask(irq, dest);
 }
+
+enum gic_bit_access {
+	ACCESS_READ,
+	ACCESS_SET,
+	ACCESS_RMW
+};
+
+static u8 gic_masked_irq_bits(int irq, int offset, int bits, u8 value,
+			      enum gic_bit_access access)
+{
+	void *base;
+	int split =3D 32 / bits;
+	int shift =3D (irq % split) * bits;
+	u32 reg =3D 0, mask =3D ((1U << bits) - 1) << shift;
+
+	switch (gic_version()) {
+	case 2:
+		base =3D gicv2_dist_base();
+		break;
+	case 3:
+		if (irq < 32)
+			base =3D gicv3_sgi_base();
+		else
+			base =3D gicv3_dist_base();
+		break;
+	default:
+		return 0;
+	}
+	base +=3D offset + (irq / split) * 4;
+
+	switch (access) {
+	case ACCESS_READ:
+		return (readl(base) & mask) >> shift;
+	case ACCESS_SET:
+		reg =3D 0;
+		break;
+	case ACCESS_RMW:
+		reg =3D readl(base) & ~mask;
+		break;
+	}
+
+	writel(reg | ((u32)value << shift), base);
+
+	return 0;
+}
+
+void gic_set_irq_bit(int irq, int offset)
+{
+	gic_masked_irq_bits(irq, offset, 1, 1, ACCESS_SET);
+}
+
+void gic_enable_irq(int irq)
+{
+	gic_set_irq_bit(irq, GICD_ISENABLER);
+}
+
+void gic_disable_irq(int irq)
+{
+	gic_set_irq_bit(irq, GICD_ICENABLER);
+}
+
+void gic_set_irq_priority(int irq, u8 prio)
+{
+	gic_masked_irq_bits(irq, GICD_IPRIORITYR, 8, prio, ACCESS_RMW);
+}
+
+void gic_set_irq_target(int irq, int cpu)
+{
+	if (irq < 32)
+		return;
+
+	if (gic_version() =3D=3D 2) {
+		gic_masked_irq_bits(irq, GICD_ITARGETSR, 8, 1U << cpu,
+				    ACCESS_RMW);
+
+		return;
+	}
+
+	writeq(cpus[cpu], gicv3_dist_base() + GICD_IROUTER + irq * 8);
+}
+
+void gic_set_irq_group(int irq, int group)
+{
+	gic_masked_irq_bits(irq, GICD_IGROUPR, 1, group, ACCESS_RMW);
+}
+
+int gic_get_irq_group(int irq)
+{
+	return gic_masked_irq_bits(irq, GICD_IGROUPR, 1, 0, ACCESS_READ);
+}
--=20
2.20.1
