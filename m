Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507171wru;
        Fri, 27 Jul 2018 02:55:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd4unaP+kYSHNdNiwjmWUvbThmGjAW+cBW4DyLhgCgfizJq2FSwsHXu+MgpoJHuYLH0tdiA
X-Received: by 2002:ae9:df81:: with SMTP id t123-v6mr5167221qkf.55.1532685330814;
        Fri, 27 Jul 2018 02:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685330; cv=none;
        d=google.com; s=arc-20160816;
        b=usQZLM7CLegBXgQLZ7FFjAPRMAGaFZjNUpJdu+beKEn+JNceyi7Ua7OxHVyF6GcqIT
         wQDye39+nO7w6kI8nnntpb8HHPY1FqOrD1BN+tE3acjn71d/1YA570lePIo/XujGsC0l
         Gp8XH6pJ0gDbJ+15TBLc/IN1RmkWgD9b+jaFwHvZKkA37zgA7KC1baP4rwwT95SCL4Ad
         xut7FWZIsw26MbETmDSDiDJdU6aE4UJGhR7p+KQ5jzzrqlqgdqWyEMLjfoIt5cy6Iu4j
         fwdYfQUjs+9fA6LlJIYsDfrE2bA1TSSht0KqMkTwwwQ4Dh7TGHUJPjKWYxWQnnxaR9uY
         hLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=dGpzKEGYvp8Sj2cOfV6AYNc0IV+Qf4bVzvp+J9XfK98=;
        b=s+femeZ2xAs6CPI0Mvy7miiWFSW5obOaypA1RP3v1n7nSMw42nM/6gmpoWT2XwtEPW
         s2ZQkiNq/dFPL1uXEqalBNR8oJKW8sIcXgbFb25mpUKXm/fLHqR1/7w1cDsTuMmKahet
         jVaxIVBH9jSmUJ4DWmWuUOTUERkMs20SBUCPXAgAKLKnTBPRVaGTvzfValybSOYOY/xL
         QuPlT4EKt4qE3A+4YSgzHaJKsBZOhr+isCC6puNTZkBVX9N2Ii6k8R2ZLqskSOYnl1xq
         meJd8U8lHvOrJl9UkXSZIT6DodLlS1b1qKobhIVxaVt3pyXIGqADUUHFa1V5MhUAEJKH
         IxMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="rD6S/lRg";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IBMnOemf;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IBMnOemf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92-v6si3865191qkt.368.2018.07.27.02.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="rD6S/lRg";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IBMnOemf;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IBMnOemf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizT8-0004NB-8v
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003W9-F4
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSY-00068E-Hn
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00064E-1E; Fri, 27 Jul 2018 05:54:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A8EB54434B9;
	Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685285;
	bh=t5FTPMLWoI8s9cEvq8oRgL4M4MPfkYWLBMKAaqpb6uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rD6S/lRgkd5maIHMLfr9wi1W8R05AGL025gacAEuFfGY8mbDQoUegrUgnsmWeYr5l
	2nwv/uWdnWKxstJd7LbP4Ja2FNdg8ZxtF0Wb6dMTYrcqWzJ/XAbBQUY1aphxv1hqvh
	ZaTKE/Mh+jDP3phpjooTyu3LhqAgRDC7+mcw/DpM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IBMnOemf;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IBMnOemf
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykn9hlZdDPOx; Fri, 27 Jul 2018 11:54:44 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 509D744354B; Fri, 27 Jul 2018 11:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685284;
	bh=t5FTPMLWoI8s9cEvq8oRgL4M4MPfkYWLBMKAaqpb6uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IBMnOemfIxID2bpmm6JVEaNxPJdPUS00HwdXhxvQ8vtX+Dfyq1iDHxeuXuwPp9w7B
	WOPx/rxAnc1+Mb4RHb5qNmkbCcc9YgFNThvguMBcCmN3q6+jyXPf2jG9D4uu3/7bY1
	8mSYIzbPiS9T7NJzjpvYf+QJQkrS23bGw+EPRU2c=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CFFC4400DC8;
	Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685284;
	bh=t5FTPMLWoI8s9cEvq8oRgL4M4MPfkYWLBMKAaqpb6uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IBMnOemfIxID2bpmm6JVEaNxPJdPUS00HwdXhxvQ8vtX+Dfyq1iDHxeuXuwPp9w7B
	WOPx/rxAnc1+Mb4RHb5qNmkbCcc9YgFNThvguMBcCmN3q6+jyXPf2jG9D4uu3/7bY1
	8mSYIzbPiS9T7NJzjpvYf+QJQkrS23bGw+EPRU2c=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:04 +0200
Message-Id: <20180727095421.386-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 03/20] intc/arm_gic: Remove some dead code and
 put some functions static
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qI22AfaclPMW

Some functions are now only used in arm_gic.c, put them static. Some of
them where only used by the NVIC implementation and are not used
anymore, so remove them.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c      | 23 ++---------------------
 hw/intc/gic_internal.h |  4 ----
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 53b749d216..b8eba6e594 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -69,11 +69,11 @@ static inline bool gic_has_groups(GICState *s)
     return s->revision =3D=3D 2 || s->security_extn;
 }
=20
 /* TODO: Many places that call this routine could be optimized.  */
 /* Update interrupt status after enabled or pending bits have been chang=
ed.  */
-void gic_update(GICState *s)
+static void gic_update(GICState *s)
 {
     int best_irq;
     int best_prio;
     int irq;
     int irq_level, fiq_level;
@@ -135,23 +135,10 @@ void gic_update(GICState *s)
         qemu_set_irq(s->parent_irq[cpu], irq_level);
         qemu_set_irq(s->parent_fiq[cpu], fiq_level);
     }
 }
=20
-void gic_set_pending_private(GICState *s, int cpu, int irq)
-{
-    int cm =3D 1 << cpu;
-
-    if (gic_test_pending(s, irq, cm)) {
-        return;
-    }
-
-    DPRINTF("Set %d pending cpu %d\n", irq, cpu);
-    GIC_DIST_SET_PENDING(irq, cm);
-    gic_update(s);
-}
-
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
                                  int cm, int target)
 {
     if (level) {
         GIC_DIST_SET_LEVEL(irq, cm);
@@ -577,11 +564,11 @@ static void gic_deactivate_irq(GICState *s, int cpu=
, int irq, MemTxAttrs attrs)
     }
=20
     GIC_DIST_CLEAR_ACTIVE(irq, cm);
 }
=20
-void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
+static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs a=
ttrs)
 {
     int cm =3D 1 << cpu;
     int group;
=20
     DPRINTF("EOI %d\n", irq);
@@ -1486,16 +1473,10 @@ static const MemoryRegionOps gic_cpu_ops =3D {
     .read_with_attrs =3D gic_do_cpu_read,
     .write_with_attrs =3D gic_do_cpu_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
-/* This function is used by nvic model */
-void gic_init_irqs_and_distributor(GICState *s)
-{
-    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
-}
-
 static void arm_gic_realize(DeviceState *dev, Error **errp)
 {
     /* Device instance realize function for the GIC sysbus device */
     int i;
     GICState *s =3D ARM_GIC(dev);
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 6f8d242904..a2075a94db 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -73,15 +73,11 @@
 #define GICC_CTLR_V2_S_MASK  0x61f
=20
 /* The special cases for the revision property: */
 #define REV_11MPCORE 0
=20
-void gic_set_pending_private(GICState *s, int cpu, int irq);
 uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
-void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs);
-void gic_update(GICState *s);
-void gic_init_irqs_and_distributor(GICState *s);
 void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
                            MemTxAttrs attrs);
=20
 static inline bool gic_test_pending(GICState *s, int irq, int cm)
 {
--=20
2.18.0

