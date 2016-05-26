Received: by 10.25.30.65 with SMTP id e62csp529178lfe;
        Thu, 26 May 2016 07:46:59 -0700 (PDT)
X-Received: by 10.55.165.69 with SMTP id o66mr9445107qke.191.1464274019316;
        Thu, 26 May 2016 07:46:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b81si13202361qkc.242.2016.05.26.07.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5wYs-0003Zi-PY
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:46:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jens.wiklander@linaro.org>) id 1b5wY1-0003IC-O2
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:46:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jens.wiklander@linaro.org>) id 1b5wXx-0002y2-My
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:46:05 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:37069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jens.wiklander@linaro.org>) id 1b5wXx-0002xh-0t
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:46:01 -0400
Received: by mail-wm0-x234.google.com with SMTP id z87so102508851wmh.0
	for <qemu-devel@nongnu.org>; Thu, 26 May 2016 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ddX2r14JlW1l3UVR0N3HJJBvDIkaE5oUwEYt2NA8rI8=;
	b=kCGjw56Ur7KlLU9X7jNltcgbDn1n4dleBN+J1ZXq3Kfc5sqRIJbYqscN4hrzc9ECAs
	TB3fF3cTVgDUMmzXOtZxeNMp9WMT3fNIikV+tVRqHkbnI0O+fxkMxMzphq05yOjTfjaX
	/HkkXDWM9z+U0H1CLJAUp2iVtnd6JZftmdfFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ddX2r14JlW1l3UVR0N3HJJBvDIkaE5oUwEYt2NA8rI8=;
	b=V/vrgZrBAusABa1Tg3HwFPtXd7mqZ+jbFCWLNaGivXZlGRLdWpdQJpU/ddu2eFLVSq
	KgRaVmuMEmaz/jeszmFXCyRm+weKadwXmF6fIKBf1JMZ7IpYAUm+kAUlY57jRgYxp3ir
	jJbAckm4rSaY0EQeTDE411WYdNwmCZ76619kDQuu2+h+EF4YOvTK7f5RKp8YIGp8BeHt
	7nuVgbYz+M+tzAqc7RYW9Mt/iFM2/OJlZgeFm/v/dkyqaedL/Rsv8trkDZrA6cyyRnFS
	WJHe3IH+D3VBWpUuopMpWGaLIpuMsiGR/r4Yz/3qDsqKPMO2jR97KR7oxTEu5FFVRZHX
	FORw==
X-Gm-Message-State: ALyK8tK1+jKjts8xMZFok3H0HLxo8aE46TIzJzM4F05tonsIR2eMTJgchZgjx1avatwWZtAY
X-Received: by 10.194.158.69 with SMTP id ws5mr9946070wjb.17.1464273959804;
	Thu, 26 May 2016 07:45:59 -0700 (PDT)
Received: from ermac.urgonet (h-84-45.a175.priv.bahnhof.se. [79.136.84.45])
	by smtp.gmail.com with ESMTPSA id
	m3sm14689640wjc.27.2016.05.26.07.45.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2016 07:45:58 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 26 May 2016 16:45:45 +0200
Message-Id: <1464273945-2055-1-git-send-email-jens.wiklander@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Subject: [Qemu-devel] [PATCH] hw/intc/gic: RAZ/WI non-sec access to sec
 interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jens Wiklander <jens.wiklander@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c0SfD9DXycjU

Treat non-secure accesses to registers and bits in registers of secure
interrupts as RAZ/WI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 hw/intc/arm_gic.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 06a22e0..b30cc91 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -661,6 +661,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             goto bad_reg;
         res = 0;
         for (i = 0; i < 8; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
             if (GIC_TEST_ENABLED(irq + i, cm)) {
                 res |= (1 << i);
             }
@@ -677,6 +682,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         res = 0;
         mask = (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
         for (i = 0; i < 8; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
             if (gic_test_pending(s, irq + i, mask)) {
                 res |= (1 << i);
             }
@@ -689,6 +699,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         res = 0;
         mask = (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
         for (i = 0; i < 8; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
             if (GIC_TEST_ACTIVE(irq + i, mask)) {
                 res |= (1 << i);
             }
@@ -722,6 +737,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             goto bad_reg;
         res = 0;
         for (i = 0; i < 4; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
             if (GIC_TEST_MODEL(irq + i))
                 res |= (1 << (i * 2));
             if (GIC_TEST_EDGE_TRIGGER(irq + i))
@@ -742,7 +762,12 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             /* GICD_SPENDSGIRn */
         }
 
-        res = s->sgi_pending[irq][cpu];
+        if (s->security_extn && !attrs.secure &&
+            !GIC_TEST_GROUP(irq, 1 << cpu)) {
+            res = 0; /* Ignore Non-secure access of Group0 IRQ */
+        } else {
+            res = s->sgi_pending[irq][cpu];
+        }
     } else if (offset < 0xfd0) {
         goto bad_reg;
     } else if (offset < 0x1000) {
@@ -862,6 +887,11 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
                     (irq < GIC_INTERNAL) ? (1 << cpu) : GIC_TARGET(irq + i);
                 int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
 
+                if (s->security_extn && !attrs.secure &&
+                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    continue; /* Ignore Non-secure access of Group0 IRQ */
+                }
+
                 if (!GIC_TEST_ENABLED(irq + i, cm)) {
                     DPRINTF("Enabled IRQ %d\n", irq + i);
                     trace_gic_enable_irq(irq + i);
@@ -889,6 +919,11 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
             if (value & (1 << i)) {
                 int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
 
+                if (s->security_extn && !attrs.secure &&
+                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    continue; /* Ignore Non-secure access of Group0 IRQ */
+                }
+
                 if (GIC_TEST_ENABLED(irq + i, cm)) {
                     DPRINTF("Disabled IRQ %d\n", irq + i);
                     trace_gic_disable_irq(irq + i);
@@ -907,6 +942,11 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
 
         for (i = 0; i < 8; i++) {
             if (value & (1 << i)) {
+                if (s->security_extn && !attrs.secure &&
+                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    continue; /* Ignore Non-secure access of Group0 IRQ */
+                }
+
                 GIC_SET_PENDING(irq + i, GIC_TARGET(irq + i));
             }
         }
@@ -920,6 +960,11 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
 
         for (i = 0; i < 8; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
             /* ??? This currently clears the pending bit for all CPUs, even
                for per-CPU interrupts.  It's unclear whether this is the
                corect behavior.  */
@@ -960,6 +1005,11 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         if (irq < GIC_NR_SGIS)
             value |= 0xaa;
         for (i = 0; i < 4; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
             if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
                 if (value & (1 << (i * 2))) {
                     GIC_SET_MODEL(irq + i);
@@ -983,9 +1033,12 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
         irq = (offset - 0xf10);
 
-        s->sgi_pending[irq][cpu] &= ~value;
-        if (s->sgi_pending[irq][cpu] == 0) {
-            GIC_CLEAR_PENDING(irq, 1 << cpu);
+        if (!s->security_extn || attrs.secure ||
+            GIC_TEST_GROUP(irq, 1 << cpu)) {
+            s->sgi_pending[irq][cpu] &= ~value;
+            if (s->sgi_pending[irq][cpu] == 0) {
+                GIC_CLEAR_PENDING(irq, 1 << cpu);
+            }
         }
     } else if (offset < 0xf30) {
         /* GICD_SPENDSGIRn */
@@ -994,8 +1047,11 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
         irq = (offset - 0xf20);
 
-        GIC_SET_PENDING(irq, 1 << cpu);
-        s->sgi_pending[irq][cpu] |= value;
+        if (!s->security_extn || attrs.secure ||
+            GIC_TEST_GROUP(irq, 1 << cpu)) {
+            GIC_SET_PENDING(irq, 1 << cpu);
+            s->sgi_pending[irq][cpu] |= value;
+        }
     } else {
         goto bad_reg;
     }
-- 
1.9.1

