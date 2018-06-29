Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp731913wrq;
        Fri, 29 Jun 2018 06:32:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfFsoq7izKOc7jN/rjd381tG9+C/OkcwFv8LmEQ1pd93G5Y+FNO+fuQvVhYngsP3cN86y2W
X-Received: by 2002:a37:3b03:: with SMTP id i3-v6mr6745039qka.141.1530279173642;
        Fri, 29 Jun 2018 06:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279173; cv=none;
        d=google.com; s=arc-20160816;
        b=kOWxLom1ncbi3xILAFMKwRmrDamlAeLG9TD5ts1XrUhgRXwihRXxL8n1BT4clwiWYc
         M7yjTsLqk85ILIAQjOdetArOWpj0VOvoDyTYeCFJ9tkvJ0vxR5VxxZ5IR6QHxu980VYQ
         8op+LFy/jg0K9gylE6AS77HSymQsGziwETGAqUZT6XAwYTibGHE0uF36pK/WBn93fPzY
         AZTB4lpKX+Bn8s5/lfAVhIjxtdTA0DQ2W81zTSrtQDiInotp4HQblQ6CFh8F5c/orX6R
         avOGLvWsyfQnfPMQE2T1F7SocBIwS3qQvd62GOfa+ucVJZy2DFBcCouOVhAZ6wyyKazv
         P9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=zziYh2ThgEbdk5Aiib0mSOYjMsgphBOP1xd9L22cJdA=;
        b=bRbg9ZSu64+nvYxNePbQlhS49Vaih8Q3kRDaDwzZnuqwvortWMhA05jxT05cwz37Fy
         BrXdK6W/6JZWQQfIFBbKvjUfGizQyQQKFRCrCOixiQpVF1dJSaSsoDqe9OvG96RyBBun
         cNrLgMym/a0/ZrtFtcF43L/4skVz5hj4mnPjGX92CMpFqmw7t/EEAmqvHeXIm4RdkBbr
         rwHKX+sZet2vpCTClKXdMmLITMnOWGj5PyY68SmiBBcjlvqRshMwLwASCWF8RIaiywP4
         gHUnAzglafOGSDIxhlHTuiEMNK4JYEkb8Tij1YVK3mCRmwEaVfh0EPi+8D6PdVzmp4dY
         5hzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ga4N4GCD;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tjYQrVLa;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tjYQrVLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x16-v6si2067459qtp.76.2018.06.29.06.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ga4N4GCD;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tjYQrVLa;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tjYQrVLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtW8-0000VR-Rv
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU6-0007Zv-U4
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU2-0006ou-MB
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:46 -0400
Received: from greensocs.com ([193.104.36.180]:58613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mN-9C; Fri, 29 Jun 2018 09:30:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2EDB54434AF;
	Fri, 29 Jun 2018 15:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279037;
	bh=+LWsPsIqavWrJSscmGjxw0qJwL1sojvQVzV7xzhVY40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ga4N4GCDoW2gnS/0CIjhf8N2FdqtAQhrfx/mXugHkW/THjeg2TVi//xwI/iq/OTQc
	bzkNQJy+YTuRmbiXkbfRHVNRJmFr3w9lG5//njpDfrbdkJ4KhQgVWn4W2fUepkmDPq
	ntbQCbS6CruxDDAiutjbnSKjxwgvUxVIugr9WpOE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tjYQrVLa;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tjYQrVLa
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHdXg_DQIdLy; Fri, 29 Jun 2018 15:30:35 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id DC8114434B1; Fri, 29 Jun 2018 15:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279035;
	bh=+LWsPsIqavWrJSscmGjxw0qJwL1sojvQVzV7xzhVY40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tjYQrVLaaIi7OpYrCJCqyP4E9Il3IjIphoCLZ5TsThD36E2hNEGQ7kRpj0T8DCwhr
	J3A0gSWZoYD4ZlKLtHV5LstqdFfbv9EUCZU51V/DiUEkBGmhpgloAhnj89K1jysDhb
	D4JchLyIIw/y3XRB58BlMzQSS6LEMw4hjLxs9omM=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 12F074434B3;
	Fri, 29 Jun 2018 15:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279035;
	bh=+LWsPsIqavWrJSscmGjxw0qJwL1sojvQVzV7xzhVY40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tjYQrVLaaIi7OpYrCJCqyP4E9Il3IjIphoCLZ5TsThD36E2hNEGQ7kRpj0T8DCwhr
	J3A0gSWZoYD4ZlKLtHV5LstqdFfbv9EUCZU51V/DiUEkBGmhpgloAhnj89K1jysDhb
	D4JchLyIIw/y3XRB58BlMzQSS6LEMw4hjLxs9omM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:42 +0200
Message-Id: <20180629132954.24269-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 08/20] intc/arm_gic: Refactor secure/ns access
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
X-TUID: aBmcReFnnfWM

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
The distributor code path is leaved unchanged, as the distributor is not
exposed to vCPUs at all.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index f25d1b1270..8ab3025901 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -74,6 +74,11 @@ static inline bool gic_has_groups(GICState *s)
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
@@ -221,7 +226,7 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
         /* On a GIC without the security extensions, reading this register
          * behaves in the same way as a secure access to a GIC with them.
          */
-        bool secure = !s->security_extn || attrs.secure;
+        bool secure = !gic_cpu_ns_access(s, cpu, attrs);
 
         if (group == 0 && !secure) {
             /* Group0 interrupts hidden from Non-secure access */
@@ -428,7 +433,7 @@ static uint32_t gic_dist_get_priority(GICState *s, int cpu, int irq,
 static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
                                   MemTxAttrs attrs)
 {
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         if (s->priority_mask[cpu] & 0x80) {
             /* Priority Mask in upper half */
             pmask = 0x80 | (pmask >> 1);
@@ -444,7 +449,7 @@ static uint32_t gic_get_priority_mask(GICState *s, int cpu, MemTxAttrs attrs)
 {
     uint32_t pmask = s->priority_mask[cpu];
 
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         if (pmask & 0x80) {
             /* Priority Mask in upper half, return Non-secure view */
             pmask = (pmask << 1) & 0xff;
@@ -460,7 +465,7 @@ static uint32_t gic_get_cpu_control(GICState *s, int cpu, MemTxAttrs attrs)
 {
     uint32_t ret = s->cpu_ctlr[cpu];
 
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         /* Construct the NS banked view of GICC_CTLR from the correct
          * bits of the S banked view. We don't need to move the bypass
          * control bits because we don't implement that (IMPDEF) part
@@ -476,7 +481,7 @@ static void gic_set_cpu_control(GICState *s, int cpu, uint32_t value,
 {
     uint32_t mask;
 
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         /* The NS view can only write certain bits in the register;
          * the rest are unchanged
          */
@@ -507,7 +512,7 @@ static uint8_t gic_get_running_priority(GICState *s, int cpu, MemTxAttrs attrs)
         return 0xff;
     }
 
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         if (s->running_priority[cpu] & 0x80) {
             /* Running priority in upper half of range: return the Non-secure
              * view of the priority.
@@ -531,7 +536,7 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
         /* Before GICv2 prio-drop and deactivate are not separable */
         return false;
     }
-    if (s->security_extn && !attrs.secure) {
+    if (gic_cpu_ns_access(s, cpu, attrs)) {
         return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE_NS;
     }
     return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE;
@@ -549,7 +554,7 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         return;
     }
 
-    if (s->security_extn && !attrs.secure && !group) {
+    if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
         return;
     }
@@ -591,7 +596,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 
     group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
 
-    if (s->security_extn && !attrs.secure && !group) {
+    if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
         return;
     }
@@ -1249,7 +1254,7 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         *data = gic_get_priority_mask(s, cpu, attrs);
         break;
     case 0x08: /* Binary Point */
-        if (s->security_extn && !attrs.secure) {
+        if (gic_cpu_ns_access(s, cpu, attrs)) {
             if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
                 /* NS view of BPR when CBPR is 1 */
                 *data = MIN(s->bpr[cpu] + 1, 7);
@@ -1276,7 +1281,7 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
          * With security extensions, secure access: ABPR (alias of NS BPR)
          * With security extensions, nonsecure access: RAZ/WI
          */
-        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
             *data = 0;
         } else {
             *data = s->abpr[cpu];
@@ -1288,7 +1293,7 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
 
         if (regno >= GIC_NR_APRS || s->revision != 2) {
             *data = 0;
-        } else if (s->security_extn && !attrs.secure) {
+        } else if (gic_cpu_ns_access(s, cpu, attrs)) {
             /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
             *data = gic_apr_ns_view(s, regno, cpu);
         } else {
@@ -1301,7 +1306,7 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         int regno = (offset - 0xe0) / 4;
 
         if (regno >= GIC_NR_APRS || s->revision != 2 || !gic_has_groups(s) ||
-            (s->security_extn && !attrs.secure)) {
+            gic_cpu_ns_access(s, cpu, attrs)) {
             *data = 0;
         } else {
             *data = s->nsapr[regno][cpu];
@@ -1328,7 +1333,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         gic_set_priority_mask(s, cpu, value, attrs);
         break;
     case 0x08: /* Binary Point */
-        if (s->security_extn && !attrs.secure) {
+        if (gic_cpu_ns_access(s, cpu, attrs)) {
             if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
                 /* WI when CBPR is 1 */
                 return MEMTX_OK;
@@ -1343,7 +1348,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         gic_complete_irq(s, cpu, value & 0x3ff, attrs);
         return MEMTX_OK;
     case 0x1c: /* Aliased Binary Point */
-        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
             /* unimplemented, or NS access: RAZ/WI */
             return MEMTX_OK;
         } else {
@@ -1357,7 +1362,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         if (regno >= GIC_NR_APRS || s->revision != 2) {
             return MEMTX_OK;
         }
-        if (s->security_extn && !attrs.secure) {
+        if (gic_cpu_ns_access(s, cpu, attrs)) {
             /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
             gic_apr_write_ns_view(s, regno, cpu, value);
         } else {
@@ -1372,7 +1377,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         if (regno >= GIC_NR_APRS || s->revision != 2) {
             return MEMTX_OK;
         }
-        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
             return MEMTX_OK;
         }
         s->nsapr[regno][cpu] = value;
-- 
2.17.1

