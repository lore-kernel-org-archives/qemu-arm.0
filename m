Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507267wru;
        Fri, 27 Jul 2018 02:55:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfRJKlCKmYS6b5p6/gvJnlpW9x8OgvR+xhxdPcDEatNRnXbeoYapqWaKbXTeIBvY1RKP2O3
X-Received: by 2002:a0c:8b11:: with SMTP id q17-v6mr4939360qva.193.1532685337733;
        Fri, 27 Jul 2018 02:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685337; cv=none;
        d=google.com; s=arc-20160816;
        b=UhWY8Svvw/rZK55mnp6/+db8ifWz7Wgur0HEb8rjtV6UrtRoONj/yhgqqaOeuWY7mS
         DL/67kxoO6ZYe5tubWzKO2MVQIkpAwLPDg+HWRdlUPQvr9hbhtBL5BhPVX7KbaqJRwLE
         +PKY/hz3hjzxeOUcItvZnb5fU8ypwKYlMzqowDU8akPjRKW3umHdCv6/pfAtnssPE/Cn
         SSRw0DdpVHUayTPcSe4wfCTtnJplWdBXtdy2wNcQ5k6OHN8Ez/1BgfIyxXIBrS2XTNnw
         Id8rpl0ZCzmC/FrW0WCAVNk3UYxFJoZeEN1XHPrIHippxPd52eB+UEYPxIzWNUdiWd6g
         vV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=ZqEJXTmnY/3PY3xbZcx7wUUfwvPPgeTHbevRfN7KpWs=;
        b=PpNOvj6zyclj5pF34dW7moAaIWe7md3QIVbZ3Scc41t9wUP6TBnTM4sBTYYK7SLA/i
         n97HVN8yz1xY7W9y6Tq0ARZtNesL5buDPVtjWsWtDeGDC9u1WCW8S/mTb4s5eg/sjcF8
         15iHT7THdeL+l0eKX1p01+IVjfaP+1Ddl6RLMQHTDNPIFWpCh+oW+ILvJ2gUSQ5UUcQf
         O/h+si2sRQsirNokBDX3962wrQFMcLQBSV/PgxAatRY7cjXJ5vvaZAU8uAIns+Q7V8NK
         oKrFnvZZDs4uvJbKSERBRkju2QWuFWoannfiMXpIKnrgnrqEu1Z+G9mnvrJHD3Gnu8kl
         nYHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="gUw9/R6F";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=S3WKF9qE;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=S3WKF9qE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x46-v6si3234323qvf.286.2018.07.27.02.55.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="gUw9/R6F";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=S3WKF9qE;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=S3WKF9qE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTF-0004QY-70
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003W5-EE
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006AS-7v
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00068l-S5; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id D515544357F;
	Fri, 27 Jul 2018 11:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685287;
	bh=1ZvPDdOhgZcw/g26n9kLneoLa70xnMn+7OWpKcPXGm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gUw9/R6FobY6OtooBaGYy2GLNDWdqc35iAH7KhVLKh+FzePyyry6Y56dv3HR53rou
	X+OnZkepYy7qQiwC0XJmKZ0SJfmPg/N97g0blGTGl8a/1xT4KiGnrbi8DCDaUhbqPK
	2PCuVqimJQqVvAo5ZBLvTfAgLVlKAXyYudO1Y/R8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=S3WKF9qE;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=S3WKF9qE
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qi6-DV3oJmOz; Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 4BF01443485; Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685286;
	bh=1ZvPDdOhgZcw/g26n9kLneoLa70xnMn+7OWpKcPXGm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S3WKF9qE3MfxbE07c9YirND+nUHjnrSj0GjFNMaxqGLyJ6Dhl6VdIkeeLLkV4Dzqu
	qfqIdeAVtoAqHg15idMDfU9oCNFyO18xPgpGlqpmFIvIO7L002FTP3DLASthCDN7ar
	cYhgCikRw7us8N0lQejnkvNo9wWvspe/8VpouCrE=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D5B34443557;
	Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685286;
	bh=1ZvPDdOhgZcw/g26n9kLneoLa70xnMn+7OWpKcPXGm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S3WKF9qE3MfxbE07c9YirND+nUHjnrSj0GjFNMaxqGLyJ6Dhl6VdIkeeLLkV4Dzqu
	qfqIdeAVtoAqHg15idMDfU9oCNFyO18xPgpGlqpmFIvIO7L002FTP3DLASthCDN7ar
	cYhgCikRw7us8N0lQejnkvNo9wWvspe/8VpouCrE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:09 +0200
Message-Id: <20180727095421.386-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 08/20] intc/arm_gic: Refactor secure/ns access
 check in the CPU interface
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
X-TUID: d1vhorDYe1YN

An access to the CPU interface is non-secure if the current GIC instance
implements the security extensions, and the memory access is actually
non-secure. Until then, it was checked with tests such as
  if (s->security_extn && !attrs.secure) { ... }
in various places of the CPU interface code.

With the implementation of the virtualization extensions, those tests
must be updated to take into account whether we are in a vCPU interface
or not. This is because the exposed vCPU interface does not implement
security extensions.

This commits replaces all those tests with a call to the
gic_cpu_ns_access() function to check if the current access to the CPU
interface is non-secure. This function takes into account whether the
current CPU is a vCPU or not.

Note that this function is used only in the (v)CPU interface code path.
The distributor code path is left unchanged, as the distributor is not
exposed to vCPUs at all.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 41141fee53..94d5982e2a 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -72,10 +72,15 @@ static inline int gic_get_current_vcpu(GICState *s)
 static inline bool gic_has_groups(GICState *s)
 {
     return s->revision == 2 || s->security_extn;
 }
 
+static inline bool gic_cpu_ns_access(GICState *s, int cpu, MemTxAttrs attrs)
+{
+    return !gic_is_vcpu(cpu) && s->security_extn && !attrs.secure;
+}
+
 /* TODO: Many places that call this routine could be optimized.  */
 /* Update interrupt status after enabled or pending bits have been changed.  */
 static void gic_update(GICState *s)
 {
     int best_irq;
@@ -219,11 +224,11 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
     if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
         int group = GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
         /* On a GIC without the security extensions, reading this register
          * behaves in the same way as a secure access to a GIC with them.
          */
-        bool secure = !s->security_extn || attrs.secure;
+        bool secure = !gic_cpu_ns_access(s, cpu, attrs);
 
         if (group == 0 && !secure) {
             /* Group0 interrupts hidden from Non-secure access */
             return 1023;
         }
@@ -426,11 +431,11 @@ static uint32_t gic_dist_get_priority(GICState *s, int cpu, int irq,
 }
 
 static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
                                   MemTxAttrs attrs)
 {
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         if (s->priority_mask[cpu] & 0x80) {
             /* Priority Mask in upper half */
             pmask = 0x80 | (pmask >> 1);
         } else {
             /* Non-secure write ignored if priority mask is in lower half */
@@ -442,11 +447,11 @@ static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
 
 static uint32_t gic_get_priority_mask(GICState *s, int cpu, MemTxAttrs attrs)
 {
     uint32_t pmask = s->priority_mask[cpu];
 
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         if (pmask & 0x80) {
             /* Priority Mask in upper half, return Non-secure view */
             pmask = (pmask << 1) & 0xff;
         } else {
             /* Priority Mask in lower half, RAZ */
@@ -458,11 +463,11 @@ static uint32_t gic_get_priority_mask(GICState *s, int cpu, MemTxAttrs attrs)
 
 static uint32_t gic_get_cpu_control(GICState *s, int cpu, MemTxAttrs attrs)
 {
     uint32_t ret = s->cpu_ctlr[cpu];
 
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         /* Construct the NS banked view of GICC_CTLR from the correct
          * bits of the S banked view. We don't need to move the bypass
          * control bits because we don't implement that (IMPDEF) part
          * of the GIC architecture.
          */
@@ -474,11 +479,11 @@ static uint32_t gic_get_cpu_control(GICState *s, int cpu, MemTxAttrs attrs)
 static void gic_set_cpu_control(GICState *s, int cpu, uint32_t value,
                                 MemTxAttrs attrs)
 {
     uint32_t mask;
 
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         /* The NS view can only write certain bits in the register;
          * the rest are unchanged
          */
         mask = GICC_CTLR_EN_GRP1;
         if (s->revision == 2) {
@@ -505,11 +510,11 @@ static uint8_t gic_get_running_priority(GICState *s, int cpu, MemTxAttrs attrs)
     if ((s->revision != REV_11MPCORE) && (s->running_priority[cpu] > 0xff)) {
         /* Idle priority */
         return 0xff;
     }
 
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         if (s->running_priority[cpu] & 0x80) {
             /* Running priority in upper half of range: return the Non-secure
              * view of the priority.
              */
             return s->running_priority[cpu] << 1;
@@ -529,11 +534,11 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
 {
     if (s->revision != 2) {
         /* Before GICv2 prio-drop and deactivate are not separable */
         return false;
     }
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE_NS;
     }
     return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE;
 }
 
@@ -561,11 +566,11 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_deactivate_irq: GICC_DIR write when EOIMode clear");
         return;
     }
 
-    if (s->security_extn && !attrs.secure && !group) {
+    if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
         return;
     }
 
     GIC_DIST_CLEAR_ACTIVE(irq, cm);
@@ -603,11 +608,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         }
     }
 
     group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
 
-    if (s->security_extn && !attrs.secure && !group) {
+    if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
         return;
     }
 
     /* Secure EOI with GICC_CTLR.AckCtl == 0 when the IRQ is a Group 1
@@ -1279,11 +1284,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         break;
     case 0x04: /* Priority mask */
         *data = gic_get_priority_mask(s, cpu, attrs);
         break;
     case 0x08: /* Binary Point */
-        if (s->security_extn && !attrs.secure) {
+        if (gic_cpu_ns_access(s, cpu, attrs)) {
             if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
                 /* NS view of BPR when CBPR is 1 */
                 *data = MIN(s->bpr[cpu] + 1, 7);
             } else {
                 /* BPR is banked. Non-secure copy stored in ABPR. */
@@ -1306,11 +1311,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         /* GIC v2, no security: ABPR
          * GIC v1, no security: not implemented (RAZ/WI)
          * With security extensions, secure access: ABPR (alias of NS BPR)
          * With security extensions, nonsecure access: RAZ/WI
          */
-        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
             *data = 0;
         } else {
             *data = s->abpr[cpu];
         }
         break;
@@ -1318,11 +1323,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
     {
         int regno = (offset - 0xd0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2) {
             *data = 0;
-        } else if (s->security_extn && !attrs.secure) {
+        } else if (gic_cpu_ns_access(s, cpu, attrs)) {
             /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
             *data = gic_apr_ns_view(s, regno, cpu);
         } else {
             *data = s->apr[regno][cpu];
         }
@@ -1331,11 +1336,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
     case 0xe0: case 0xe4: case 0xe8: case 0xec:
     {
         int regno = (offset - 0xe0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2 || !gic_has_groups(s) ||
-            (s->security_extn && !attrs.secure)) {
+            gic_cpu_ns_access(s, cpu, attrs)) {
             *data = 0;
         } else {
             *data = s->nsapr[regno][cpu];
         }
         break;
@@ -1358,11 +1363,11 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         break;
     case 0x04: /* Priority mask */
         gic_set_priority_mask(s, cpu, value, attrs);
         break;
     case 0x08: /* Binary Point */
-        if (s->security_extn && !attrs.secure) {
+        if (gic_cpu_ns_access(s, cpu, attrs)) {
             if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
                 /* WI when CBPR is 1 */
                 return MEMTX_OK;
             } else {
                 s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
@@ -1373,11 +1378,11 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         break;
     case 0x10: /* End Of Interrupt */
         gic_complete_irq(s, cpu, value & 0x3ff, attrs);
         return MEMTX_OK;
     case 0x1c: /* Aliased Binary Point */
-        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
             /* unimplemented, or NS access: RAZ/WI */
             return MEMTX_OK;
         } else {
             s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
         }
@@ -1387,11 +1392,11 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         int regno = (offset - 0xd0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2) {
             return MEMTX_OK;
         }
-        if (s->security_extn && !attrs.secure) {
+        if (gic_cpu_ns_access(s, cpu, attrs)) {
             /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
             gic_apr_write_ns_view(s, regno, cpu, value);
         } else {
             s->apr[regno][cpu] = value;
         }
@@ -1402,11 +1407,11 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         int regno = (offset - 0xe0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2) {
             return MEMTX_OK;
         }
-        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
             return MEMTX_OK;
         }
         s->nsapr[regno][cpu] = value;
         break;
     }
-- 
2.18.0

