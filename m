Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp508041wru;
        Fri, 27 Jul 2018 02:56:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeN1NCf7Sq02sdemTi7OoLyLjXezz8BZk7ninnblD12TrMNDbko7qlLGKMyXF40zaSaIaPA
X-Received: by 2002:a37:d401:: with SMTP id l1-v6mr4999905qki.221.1532685408533;
        Fri, 27 Jul 2018 02:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685408; cv=none;
        d=google.com; s=arc-20160816;
        b=rT0HGhtTR8haSDaI6b9c18rIp+Zb86PmFdwdk4ZSDzikw5M44oettQfk0SJtcfPcAg
         yo4uPpZk/y5mO+LVPNexYp0gIIYM1TFuKoxyoL6kETfVAf/668YxkfPNmd+JmDkqnpMB
         FhFz/tBr5o1L0lMEK0kyWDmdPyvgrxCQNnp1dTqNdbb7Q5Bu/F1Cs1lGgxFwOzcij3NX
         +Rkde4USqhy+kK5CH7GFA0Cm4e5d4nABPJJXxN/Y7VIr5soadah5Ol6MCSvQqbxlG+4I
         1Jv1HP384W+J9dg4xsAJKcpUNdZxsoDp45HdavU4Tyd1TByTH4K6ZiFnDgr4F5oOOmGU
         GrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=kD/CMfY4eKOuP7hzHs8nSAPqnZ6msdL2RxIl1PxOWEQ=;
        b=y5jI+QfxbXPVaei2CXGjRM8F5f49swztgJ+rrL1M9pXp/D48dEIerjVQbJa/DZswdw
         mjcL8tpE3ntVYq+ns+zItmcfUBHnu6I1hxGprMguUOwI2amBZOt/D0QI9a6cOJHsBl9a
         QCNM4ELJzP35olZ7vA5Vrg9Cy0HdmGztNMQW/32e4YdzAyLylXVg414sdYgtBmkRqeHb
         RO/nrjC4z3Hys9hXwZO0xi9CsqXTJ4GHdGqK1h2nI4gPzIvhCfxagdUwYFbexa6MXdNV
         NiI56pq0PB5epXaQfOr8wZVYfRZRSyjfrqRmyINOhXjN/ZOs0QvqkOCiyGTs/F6rCHRj
         66aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mrfw3h0y;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CSZ5iPtS;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CSZ5iPtS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o24-v6si3250840qtp.120.2018.07.27.02.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mrfw3h0y;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CSZ5iPtS;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CSZ5iPtS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizUN-0005Qj-V1
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:56:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003WA-Fz
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSY-00068d-MC
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00064B-1N; Fri, 27 Jul 2018 05:54:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DF907443553;
	Fri, 27 Jul 2018 11:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685284;
	bh=nxv1H9jWe+gmJoPXDNpLVSbyIPMKUfUK6qW8IYnISKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mrfw3h0yykMK1abxoogR6kJOMJd98AFvzxniB9iXFj4K1E4fb9n8mINUQnHdHWOl1
	I+F06VxvJs6d18XQwDh2Ho6H7nKKiXieyXO5zX4yJ4OXft2i0iP/h4qfc9QZPikbvm
	i1zRZ/wyxziEfIL/niXn8UkFSwldwG5O3Sri3dhk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CSZ5iPtS;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CSZ5iPtS
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtBT0Xr9icuQ; Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 74D8B4434A7; Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685283;
	bh=nxv1H9jWe+gmJoPXDNpLVSbyIPMKUfUK6qW8IYnISKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CSZ5iPtS1gwFE9d9Tvg9XIbPz0wzBpm7Ba+IhnLuFef5uV6pPT9UapkhJvBqxLLuF
	dphhrSh/rbIWFuv3sH5terJ5pnLia9hdlUMY6Ib3aCqJMP5MbYCRXfFhf0BWmiNjL9
	IssLVb8FmZ30VKlz9nCMJmD06Q/mhKAjh5PVJp9I=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1A1BB400DC8;
	Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685283;
	bh=nxv1H9jWe+gmJoPXDNpLVSbyIPMKUfUK6qW8IYnISKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CSZ5iPtS1gwFE9d9Tvg9XIbPz0wzBpm7Ba+IhnLuFef5uV6pPT9UapkhJvBqxLLuF
	dphhrSh/rbIWFuv3sH5terJ5pnLia9hdlUMY6Ib3aCqJMP5MbYCRXfFhf0BWmiNjL9
	IssLVb8FmZ30VKlz9nCMJmD06Q/mhKAjh5PVJp9I=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:02 +0200
Message-Id: <20180727095421.386-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 01/20] intc/arm_gic: Refactor operations on
 the distributor
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
X-TUID: nABnfj0r2UrC

In preparation for the virtualization extensions implementation,
refactor the name of the functions and macros that act on the GIC
distributor to make that fact explicit. It will be useful to
differentiate them from the ones that will act on the virtual
interfaces.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c        | 163 +++++++++++++++++++++------------------
 hw/intc/arm_gic_common.c |   6 +-
 hw/intc/arm_gic_kvm.c    |  23 +++---
 hw/intc/gic_internal.h   |  51 ++++++------
 4 files changed, 127 insertions(+), 116 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 34dc84ae81..9286236d86 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -90,15 +90,16 @@ void gic_update(GICState *s)
             continue;
         }
         best_prio =3D 0x100;
         best_irq =3D 1023;
         for (irq =3D 0; irq < s->num_irq; irq++) {
-            if (GIC_TEST_ENABLED(irq, cm) && gic_test_pending(s, irq, cm=
) &&
-                (!GIC_TEST_ACTIVE(irq, cm)) &&
-                (irq < GIC_INTERNAL || GIC_TARGET(irq) & cm)) {
-                if (GIC_GET_PRIORITY(irq, cpu) < best_prio) {
-                    best_prio =3D GIC_GET_PRIORITY(irq, cpu);
+            if (GIC_DIST_TEST_ENABLED(irq, cm) &&
+                gic_test_pending(s, irq, cm) &&
+                (!GIC_DIST_TEST_ACTIVE(irq, cm)) &&
+                (irq < GIC_INTERNAL || GIC_DIST_TARGET(irq) & cm)) {
+                if (GIC_DIST_GET_PRIORITY(irq, cpu) < best_prio) {
+                    best_prio =3D GIC_DIST_GET_PRIORITY(irq, cpu);
                     best_irq =3D irq;
                 }
             }
         }
=20
@@ -110,11 +111,11 @@ void gic_update(GICState *s)
         irq_level =3D fiq_level =3D 0;
=20
         if (best_prio < s->priority_mask[cpu]) {
             s->current_pending[cpu] =3D best_irq;
             if (best_prio < s->running_priority[cpu]) {
-                int group =3D GIC_TEST_GROUP(best_irq, cm);
+                int group =3D GIC_DIST_TEST_GROUP(best_irq, cm);
=20
                 if (extract32(s->ctlr, group, 1) &&
                     extract32(s->cpu_ctlr[cpu], group, 1)) {
                     if (group =3D=3D 0 && s->cpu_ctlr[cpu] & GICC_CTLR_F=
IQ_EN) {
                         DPRINTF("Raised pending FIQ %d (cpu %d)\n",
@@ -143,39 +144,39 @@ void gic_set_pending_private(GICState *s, int cpu, =
int irq)
     if (gic_test_pending(s, irq, cm)) {
         return;
     }
=20
     DPRINTF("Set %d pending cpu %d\n", irq, cpu);
-    GIC_SET_PENDING(irq, cm);
+    GIC_DIST_SET_PENDING(irq, cm);
     gic_update(s);
 }
=20
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
                                  int cm, int target)
 {
     if (level) {
-        GIC_SET_LEVEL(irq, cm);
-        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)) {
+        GIC_DIST_SET_LEVEL(irq, cm);
+        if (GIC_DIST_TEST_EDGE_TRIGGER(irq) || GIC_DIST_TEST_ENABLED(irq=
, cm)) {
             DPRINTF("Set %d pending mask %x\n", irq, target);
-            GIC_SET_PENDING(irq, target);
+            GIC_DIST_SET_PENDING(irq, target);
         }
     } else {
-        GIC_CLEAR_LEVEL(irq, cm);
+        GIC_DIST_CLEAR_LEVEL(irq, cm);
     }
 }
=20
 static void gic_set_irq_generic(GICState *s, int irq, int level,
                                 int cm, int target)
 {
     if (level) {
-        GIC_SET_LEVEL(irq, cm);
+        GIC_DIST_SET_LEVEL(irq, cm);
         DPRINTF("Set %d pending mask %x\n", irq, target);
-        if (GIC_TEST_EDGE_TRIGGER(irq)) {
-            GIC_SET_PENDING(irq, target);
+        if (GIC_DIST_TEST_EDGE_TRIGGER(irq)) {
+            GIC_DIST_SET_PENDING(irq, target);
         }
     } else {
-        GIC_CLEAR_LEVEL(irq, cm);
+        GIC_DIST_CLEAR_LEVEL(irq, cm);
     }
 }
=20
 /* Process a change in an external IRQ input.  */
 static void gic_set_irq(void *opaque, int irq, int level)
@@ -190,11 +191,11 @@ static void gic_set_irq(void *opaque, int irq, int =
level)
     int cm, target;
     if (irq < (s->num_irq - GIC_INTERNAL)) {
         /* The first external input line is internal interrupt 32.  */
         cm =3D ALL_CPU_MASK;
         irq +=3D GIC_INTERNAL;
-        target =3D GIC_TARGET(irq);
+        target =3D GIC_DIST_TARGET(irq);
     } else {
         int cpu;
         irq -=3D (s->num_irq - GIC_INTERNAL);
         cpu =3D irq / GIC_INTERNAL;
         irq %=3D GIC_INTERNAL;
@@ -202,11 +203,11 @@ static void gic_set_irq(void *opaque, int irq, int =
level)
         target =3D cm;
     }
=20
     assert(irq >=3D GIC_NR_SGIS);
=20
-    if (level =3D=3D GIC_TEST_LEVEL(irq, cm)) {
+    if (level =3D=3D GIC_DIST_TEST_LEVEL(irq, cm)) {
         return;
     }
=20
     if (s->revision =3D=3D REV_11MPCORE) {
         gic_set_irq_11mpcore(s, irq, level, cm, target);
@@ -222,11 +223,11 @@ static uint16_t gic_get_current_pending_irq(GICStat=
e *s, int cpu,
                                             MemTxAttrs attrs)
 {
     uint16_t pending_irq =3D s->current_pending[cpu];
=20
     if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
-        int group =3D GIC_TEST_GROUP(pending_irq, (1 << cpu));
+        int group =3D GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
         /* On a GIC without the security extensions, reading this regist=
er
          * behaves in the same way as a secure access to a GIC with them=
.
          */
         bool secure =3D !s->security_extn || attrs.secure;
=20
@@ -253,11 +254,11 @@ static int gic_get_group_priority(GICState *s, int =
cpu, int irq)
     int bpr;
     uint32_t mask;
=20
     if (gic_has_groups(s) &&
         !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
-        GIC_TEST_GROUP(irq, (1 << cpu))) {
+        GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
         bpr =3D s->abpr[cpu] - 1;
         assert(bpr >=3D 0);
     } else {
         bpr =3D s->bpr[cpu];
     }
@@ -266,11 +267,11 @@ static int gic_get_group_priority(GICState *s, int =
cpu, int irq)
      * a BPR of 1 means they are [7:2], and so on down to
      * a BPR of 7 meaning no group priority bits at all.
      */
     mask =3D ~0U << ((bpr & 7) + 1);
=20
-    return GIC_GET_PRIORITY(irq, cpu) & mask;
+    return GIC_DIST_GET_PRIORITY(irq, cpu) & mask;
 }
=20
 static void gic_activate_irq(GICState *s, int cpu, int irq)
 {
     /* Set the appropriate Active Priority Register bit for this IRQ,
@@ -279,18 +280,18 @@ static void gic_activate_irq(GICState *s, int cpu, =
int irq)
     int prio =3D gic_get_group_priority(s, cpu, irq);
     int preemption_level =3D prio >> (GIC_MIN_BPR + 1);
     int regno =3D preemption_level / 32;
     int bitno =3D preemption_level % 32;
=20
-    if (gic_has_groups(s) && GIC_TEST_GROUP(irq, (1 << cpu))) {
+    if (gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
         s->nsapr[regno][cpu] |=3D (1 << bitno);
     } else {
         s->apr[regno][cpu] |=3D (1 << bitno);
     }
=20
     s->running_priority[cpu] =3D prio;
-    GIC_SET_ACTIVE(irq, 1 << cpu);
+    GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
 }
=20
 static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
 {
     /* Recalculate the current running priority for this CPU based
@@ -355,20 +356,21 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, =
MemTxAttrs attrs)
     if (irq >=3D GIC_MAXIRQ) {
         DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
         return irq;
     }
=20
-    if (GIC_GET_PRIORITY(irq, cpu) >=3D s->running_priority[cpu]) {
+    if (GIC_DIST_GET_PRIORITY(irq, cpu) >=3D s->running_priority[cpu]) {
         DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n=
", irq);
         return 1023;
     }
=20
     if (s->revision =3D=3D REV_11MPCORE) {
         /* Clear pending flags for both level and edge triggered interru=
pts.
          * Level triggered IRQs will be reasserted once they become inac=
tive.
          */
-        GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : cm);
+        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_M=
ASK
+                                                             : cm);
         ret =3D irq;
     } else {
         if (irq < GIC_NR_SGIS) {
             /* Lookup the source CPU for the SGI and clear this in the
              * sgi_pending map.  Return the src and clear the overall pe=
nding
@@ -376,34 +378,37 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, =
MemTxAttrs attrs)
              */
             assert(s->sgi_pending[irq][cpu] !=3D 0);
             src =3D ctz32(s->sgi_pending[irq][cpu]);
             s->sgi_pending[irq][cpu] &=3D ~(1 << src);
             if (s->sgi_pending[irq][cpu] =3D=3D 0) {
-                GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MAS=
K : cm);
+                GIC_DIST_CLEAR_PENDING(irq,
+                                       GIC_DIST_TEST_MODEL(irq) ? ALL_CP=
U_MASK
+                                                                : cm);
             }
             ret =3D irq | ((src & 0x7) << 10);
         } else {
             /* Clear pending state for both level and edge triggered
              * interrupts. (level triggered interrupts with an active li=
ne
              * remain pending, see gic_test_pending)
              */
-            GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : =
cm);
+            GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_C=
PU_MASK
+                                                                 : cm);
             ret =3D irq;
         }
     }
=20
     gic_activate_irq(s, cpu, irq);
     gic_update(s);
     DPRINTF("ACK %d\n", irq);
     return ret;
 }
=20
-void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
+void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
                       MemTxAttrs attrs)
 {
     if (s->security_extn && !attrs.secure) {
-        if (!GIC_TEST_GROUP(irq, (1 << cpu))) {
+        if (!GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
             return; /* Ignore Non-secure access of Group0 IRQ */
         }
         val =3D 0x80 | (val >> 1); /* Non-secure view */
     }
=20
@@ -412,17 +417,17 @@ void gic_set_priority(GICState *s, int cpu, int irq=
, uint8_t val,
     } else {
         s->priority2[(irq) - GIC_INTERNAL] =3D val;
     }
 }
=20
-static uint32_t gic_get_priority(GICState *s, int cpu, int irq,
+static uint32_t gic_dist_get_priority(GICState *s, int cpu, int irq,
                                  MemTxAttrs attrs)
 {
-    uint32_t prio =3D GIC_GET_PRIORITY(irq, cpu);
+    uint32_t prio =3D GIC_DIST_GET_PRIORITY(irq, cpu);
=20
     if (s->security_extn && !attrs.secure) {
-        if (!GIC_TEST_GROUP(irq, (1 << cpu))) {
+        if (!GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
             return 0; /* Non-secure access cannot read priority of Group=
0 IRQ */
         }
         prio =3D (prio << 1) & 0xff; /* Non-secure view */
     }
     return prio;
@@ -555,11 +560,11 @@ static void gic_deactivate_irq(GICState *s, int cpu=
, int irq, MemTxAttrs attrs)
          * and so this is UNPREDICTABLE. We choose to ignore it.
          */
         return;
     }
=20
-    group =3D gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
+    group =3D gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
=20
     if (!gic_eoi_split(s, cpu, attrs)) {
         /* This is UNPREDICTABLE; we choose to ignore it */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_deactivate_irq: GICC_DIR write when EOIMode c=
lear");
@@ -569,11 +574,11 @@ static void gic_deactivate_irq(GICState *s, int cpu=
, int irq, MemTxAttrs attrs)
     if (s->security_extn && !attrs.secure && !group) {
         DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
         return;
     }
=20
-    GIC_CLEAR_ACTIVE(irq, cm);
+    GIC_DIST_CLEAR_ACTIVE(irq, cm);
 }
=20
 void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
     int cm =3D 1 << cpu;
@@ -596,18 +601,19 @@ void gic_complete_irq(GICState *s, int cpu, int irq=
, MemTxAttrs attrs)
     }
=20
     if (s->revision =3D=3D REV_11MPCORE) {
         /* Mark level triggered interrupts as pending if they are still
            raised.  */
-        if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
-            && GIC_TEST_LEVEL(irq, cm) && (GIC_TARGET(irq) & cm) !=3D 0)=
 {
+        if (!GIC_DIST_TEST_EDGE_TRIGGER(irq) && GIC_DIST_TEST_ENABLED(ir=
q, cm)
+            && GIC_DIST_TEST_LEVEL(irq, cm)
+            && (GIC_DIST_TARGET(irq) & cm) !=3D 0) {
             DPRINTF("Set %d pending mask %x\n", irq, cm);
-            GIC_SET_PENDING(irq, cm);
+            GIC_DIST_SET_PENDING(irq, cm);
         }
     }
=20
-    group =3D gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
+    group =3D gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
=20
     if (s->security_extn && !attrs.secure && !group) {
         DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq)=
;
         return;
     }
@@ -619,11 +625,11 @@ void gic_complete_irq(GICState *s, int cpu, int irq=
, MemTxAttrs attrs)
=20
     gic_drop_prio(s, cpu, group);
=20
     /* In GICv2 the guest can choose to split priority-drop and deactiva=
te */
     if (!gic_eoi_split(s, cpu, attrs)) {
-        GIC_CLEAR_ACTIVE(irq, cm);
+        GIC_DIST_CLEAR_ACTIVE(irq, cm);
     }
     gic_update(s);
 }
=20
 static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs a=
ttrs)
@@ -667,11 +673,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
                 irq =3D (offset - 0x080) * 8 + GIC_BASE_IRQ;
                 if (irq >=3D s->num_irq) {
                     goto bad_reg;
                 }
                 for (i =3D 0; i < 8; i++) {
-                    if (GIC_TEST_GROUP(irq + i, cm)) {
+                    if (GIC_DIST_TEST_GROUP(irq + i, cm)) {
                         res |=3D (1 << i);
                     }
                 }
             }
             return res;
@@ -687,15 +693,15 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
         if (irq >=3D s->num_irq)
             goto bad_reg;
         res =3D 0;
         for (i =3D 0; i < 8; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
=20
-            if (GIC_TEST_ENABLED(irq + i, cm)) {
+            if (GIC_DIST_TEST_ENABLED(irq + i, cm)) {
                 res |=3D (1 << i);
             }
         }
     } else if (offset < 0x300) {
         /* Interrupt Set/Clear Pending.  */
@@ -708,11 +714,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
             goto bad_reg;
         res =3D 0;
         mask =3D (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
         for (i =3D 0; i < 8; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
=20
             if (gic_test_pending(s, irq + i, mask)) {
                 res |=3D (1 << i);
@@ -725,24 +731,24 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
             goto bad_reg;
         res =3D 0;
         mask =3D (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
         for (i =3D 0; i < 8; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
=20
-            if (GIC_TEST_ACTIVE(irq + i, mask)) {
+            if (GIC_DIST_TEST_ACTIVE(irq + i, mask)) {
                 res |=3D (1 << i);
             }
         }
     } else if (offset < 0x800) {
         /* Interrupt Priority.  */
         irq =3D (offset - 0x400) + GIC_BASE_IRQ;
         if (irq >=3D s->num_irq)
             goto bad_reg;
-        res =3D gic_get_priority(s, cpu, irq, attrs);
+        res =3D gic_dist_get_priority(s, cpu, irq, attrs);
     } else if (offset < 0xc00) {
         /* Interrupt CPU Target.  */
         if (s->num_cpu =3D=3D 1 && s->revision !=3D REV_11MPCORE) {
             /* For uniprocessor GICs these RAZ/WI */
             res =3D 0;
@@ -754,29 +760,31 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
             if (irq < 29 && s->revision =3D=3D REV_11MPCORE) {
                 res =3D 0;
             } else if (irq < GIC_INTERNAL) {
                 res =3D cm;
             } else {
-                res =3D GIC_TARGET(irq);
+                res =3D GIC_DIST_TARGET(irq);
             }
         }
     } else if (offset < 0xf00) {
         /* Interrupt Configuration.  */
         irq =3D (offset - 0xc00) * 4 + GIC_BASE_IRQ;
         if (irq >=3D s->num_irq)
             goto bad_reg;
         res =3D 0;
         for (i =3D 0; i < 4; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
=20
-            if (GIC_TEST_MODEL(irq + i))
+            if (GIC_DIST_TEST_MODEL(irq + i)) {
                 res |=3D (1 << (i * 2));
-            if (GIC_TEST_EDGE_TRIGGER(irq + i))
+            }
+            if (GIC_DIST_TEST_EDGE_TRIGGER(irq + i)) {
                 res |=3D (2 << (i * 2));
+            }
         }
     } else if (offset < 0xf10) {
         goto bad_reg;
     } else if (offset < 0xf30) {
         if (s->revision =3D=3D REV_11MPCORE) {
@@ -790,11 +798,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
             irq =3D (offset - 0xf20);
             /* GICD_SPENDSGIRn */
         }
=20
         if (s->security_extn && !attrs.secure &&
-            !GIC_TEST_GROUP(irq, 1 << cpu)) {
+            !GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
             res =3D 0; /* Ignore Non-secure access of Group0 IRQ */
         } else {
             res =3D s->sgi_pending[irq][cpu];
         }
     } else if (offset < 0xfd0) {
@@ -886,14 +894,14 @@ static void gic_dist_writeb(void *opaque, hwaddr of=
fset,
                 for (i =3D 0; i < 8; i++) {
                     /* Group bits are banked for private interrupts */
                     int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_C=
PU_MASK;
                     if (value & (1 << i)) {
                         /* Group1 (Non-secure) */
-                        GIC_SET_GROUP(irq + i, cm);
+                        GIC_DIST_SET_GROUP(irq + i, cm);
                     } else {
                         /* Group0 (Secure) */
-                        GIC_CLEAR_GROUP(irq + i, cm);
+                        GIC_DIST_CLEAR_GROUP(irq + i, cm);
                     }
                 }
             }
         } else {
             goto bad_reg;
@@ -908,29 +916,30 @@ static void gic_dist_writeb(void *opaque, hwaddr of=
fset,
         }
=20
         for (i =3D 0; i < 8; i++) {
             if (value & (1 << i)) {
                 int mask =3D
-                    (irq < GIC_INTERNAL) ? (1 << cpu) : GIC_TARGET(irq +=
 i);
+                    (irq < GIC_INTERNAL) ? (1 << cpu)
+                                         : GIC_DIST_TARGET(irq + i);
                 int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_M=
ASK;
=20
                 if (s->security_extn && !attrs.secure &&
-                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                     continue; /* Ignore Non-secure access of Group0 IRQ =
*/
                 }
=20
-                if (!GIC_TEST_ENABLED(irq + i, cm)) {
+                if (!GIC_DIST_TEST_ENABLED(irq + i, cm)) {
                     DPRINTF("Enabled IRQ %d\n", irq + i);
                     trace_gic_enable_irq(irq + i);
                 }
-                GIC_SET_ENABLED(irq + i, cm);
+                GIC_DIST_SET_ENABLED(irq + i, cm);
                 /* If a raised level triggered IRQ enabled then mark
                    is as pending.  */
-                if (GIC_TEST_LEVEL(irq + i, mask)
-                        && !GIC_TEST_EDGE_TRIGGER(irq + i)) {
+                if (GIC_DIST_TEST_LEVEL(irq + i, mask)
+                        && !GIC_DIST_TEST_EDGE_TRIGGER(irq + i)) {
                     DPRINTF("Set %d pending mask %x\n", irq + i, mask);
-                    GIC_SET_PENDING(irq + i, mask);
+                    GIC_DIST_SET_PENDING(irq + i, mask);
                 }
             }
         }
     } else if (offset < 0x200) {
         /* Interrupt Clear Enable.  */
@@ -944,19 +953,19 @@ static void gic_dist_writeb(void *opaque, hwaddr of=
fset,
         for (i =3D 0; i < 8; i++) {
             if (value & (1 << i)) {
                 int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_M=
ASK;
=20
                 if (s->security_extn && !attrs.secure &&
-                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                     continue; /* Ignore Non-secure access of Group0 IRQ =
*/
                 }
=20
-                if (GIC_TEST_ENABLED(irq + i, cm)) {
+                if (GIC_DIST_TEST_ENABLED(irq + i, cm)) {
                     DPRINTF("Disabled IRQ %d\n", irq + i);
                     trace_gic_disable_irq(irq + i);
                 }
-                GIC_CLEAR_ENABLED(irq + i, cm);
+                GIC_DIST_CLEAR_ENABLED(irq + i, cm);
             }
         }
     } else if (offset < 0x280) {
         /* Interrupt Set Pending.  */
         irq =3D (offset - 0x200) * 8 + GIC_BASE_IRQ;
@@ -967,15 +976,15 @@ static void gic_dist_writeb(void *opaque, hwaddr of=
fset,
         }
=20
         for (i =3D 0; i < 8; i++) {
             if (value & (1 << i)) {
                 if (s->security_extn && !attrs.secure &&
-                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                     continue; /* Ignore Non-secure access of Group0 IRQ =
*/
                 }
=20
-                GIC_SET_PENDING(irq + i, GIC_TARGET(irq + i));
+                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
             }
         }
     } else if (offset < 0x300) {
         /* Interrupt Clear Pending.  */
         irq =3D (offset - 0x280) * 8 + GIC_BASE_IRQ;
@@ -985,30 +994,30 @@ static void gic_dist_writeb(void *opaque, hwaddr of=
fset,
             value =3D 0;
         }
=20
         for (i =3D 0; i < 8; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
=20
             /* ??? This currently clears the pending bit for all CPUs, e=
ven
                for per-CPU interrupts.  It's unclear whether this is the
                corect behavior.  */
             if (value & (1 << i)) {
-                GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
+                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
             }
         }
     } else if (offset < 0x400) {
         /* Interrupt Active.  */
         goto bad_reg;
     } else if (offset < 0x800) {
         /* Interrupt Priority.  */
         irq =3D (offset - 0x400) + GIC_BASE_IRQ;
         if (irq >=3D s->num_irq)
             goto bad_reg;
-        gic_set_priority(s, cpu, irq, value, attrs);
+        gic_dist_set_priority(s, cpu, irq, value, attrs);
     } else if (offset < 0xc00) {
         /* Interrupt CPU Target. RAZ/WI on uniprocessor GICs, with the
          * annoying exception of the 11MPCore's GIC.
          */
         if (s->num_cpu !=3D 1 || s->revision =3D=3D REV_11MPCORE) {
@@ -1030,25 +1039,25 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
             goto bad_reg;
         if (irq < GIC_NR_SGIS)
             value |=3D 0xaa;
         for (i =3D 0; i < 4; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
=20
             if (s->revision =3D=3D REV_11MPCORE) {
                 if (value & (1 << (i * 2))) {
-                    GIC_SET_MODEL(irq + i);
+                    GIC_DIST_SET_MODEL(irq + i);
                 } else {
-                    GIC_CLEAR_MODEL(irq + i);
+                    GIC_DIST_CLEAR_MODEL(irq + i);
                 }
             }
             if (value & (2 << (i * 2))) {
-                GIC_SET_EDGE_TRIGGER(irq + i);
+                GIC_DIST_SET_EDGE_TRIGGER(irq + i);
             } else {
-                GIC_CLEAR_EDGE_TRIGGER(irq + i);
+                GIC_DIST_CLEAR_EDGE_TRIGGER(irq + i);
             }
         }
     } else if (offset < 0xf10) {
         /* 0xf00 is only handled for 32-bit writes.  */
         goto bad_reg;
@@ -1058,26 +1067,26 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
             goto bad_reg;
         }
         irq =3D (offset - 0xf10);
=20
         if (!s->security_extn || attrs.secure ||
-            GIC_TEST_GROUP(irq, 1 << cpu)) {
+            GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
             s->sgi_pending[irq][cpu] &=3D ~value;
             if (s->sgi_pending[irq][cpu] =3D=3D 0) {
-                GIC_CLEAR_PENDING(irq, 1 << cpu);
+                GIC_DIST_CLEAR_PENDING(irq, 1 << cpu);
             }
         }
     } else if (offset < 0xf30) {
         /* GICD_SPENDSGIRn */
         if (s->revision =3D=3D REV_11MPCORE) {
             goto bad_reg;
         }
         irq =3D (offset - 0xf20);
=20
         if (!s->security_extn || attrs.secure ||
-            GIC_TEST_GROUP(irq, 1 << cpu)) {
-            GIC_SET_PENDING(irq, 1 << cpu);
+            GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
+            GIC_DIST_SET_PENDING(irq, 1 << cpu);
             s->sgi_pending[irq][cpu] |=3D value;
         }
     } else {
         goto bad_reg;
     }
@@ -1120,11 +1129,11 @@ static void gic_dist_writel(void *opaque, hwaddr =
offset,
         default:
             DPRINTF("Bad Soft Int target filter\n");
             mask =3D ALL_CPU_MASK;
             break;
         }
-        GIC_SET_PENDING(irq, mask);
+        GIC_DIST_SET_PENDING(irq, mask);
         target_cpu =3D ctz32(mask);
         while (target_cpu < GIC_NCPU) {
             s->sgi_pending[irq][target_cpu] |=3D (1 << cpu);
             mask &=3D ~(1 << target_cpu);
             target_cpu =3D ctz32(mask);
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index aee50a20e0..295ee9cc5e 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -202,12 +202,12 @@ static void arm_gic_common_reset(DeviceState *dev)
         for (j =3D 0; j < GIC_NR_SGIS; j++) {
             s->sgi_pending[j][i] =3D 0;
         }
     }
     for (i =3D 0; i < GIC_NR_SGIS; i++) {
-        GIC_SET_ENABLED(i, ALL_CPU_MASK);
-        GIC_SET_EDGE_TRIGGER(i);
+        GIC_DIST_SET_ENABLED(i, ALL_CPU_MASK);
+        GIC_DIST_SET_EDGE_TRIGGER(i);
     }
=20
     for (i =3D 0; i < ARRAY_SIZE(s->priority2); i++) {
         s->priority2[i] =3D resetprio;
     }
@@ -220,11 +220,11 @@ static void arm_gic_common_reset(DeviceState *dev)
             s->irq_target[i] =3D 0;
         }
     }
     if (s->security_extn && s->irq_reset_nonsecure) {
         for (i =3D 0; i < GIC_MAXIRQ; i++) {
-            GIC_SET_GROUP(i, ALL_CPU_MASK);
+            GIC_DIST_SET_GROUP(i, ALL_CPU_MASK);
         }
     }
=20
     s->ctlr =3D 0;
 }
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 86665080bd..4b611c8d6d 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -138,28 +138,28 @@ static void translate_group(GICState *s, int irq, i=
nt cpu,
                             uint32_t *field, bool to_kernel)
 {
     int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
=20
     if (to_kernel) {
-        *field =3D GIC_TEST_GROUP(irq, cm);
+        *field =3D GIC_DIST_TEST_GROUP(irq, cm);
     } else {
         if (*field & 1) {
-            GIC_SET_GROUP(irq, cm);
+            GIC_DIST_SET_GROUP(irq, cm);
         }
     }
 }
=20
 static void translate_enabled(GICState *s, int irq, int cpu,
                               uint32_t *field, bool to_kernel)
 {
     int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
=20
     if (to_kernel) {
-        *field =3D GIC_TEST_ENABLED(irq, cm);
+        *field =3D GIC_DIST_TEST_ENABLED(irq, cm);
     } else {
         if (*field & 1) {
-            GIC_SET_ENABLED(irq, cm);
+            GIC_DIST_SET_ENABLED(irq, cm);
         }
     }
 }
=20
 static void translate_pending(GICState *s, int irq, int cpu,
@@ -169,11 +169,11 @@ static void translate_pending(GICState *s, int irq,=
 int cpu,
=20
     if (to_kernel) {
         *field =3D gic_test_pending(s, irq, cm);
     } else {
         if (*field & 1) {
-            GIC_SET_PENDING(irq, cm);
+            GIC_DIST_SET_PENDING(irq, cm);
             /* TODO: Capture is level-line is held high in the kernel */
         }
     }
 }
=20
@@ -181,37 +181,38 @@ static void translate_active(GICState *s, int irq, =
int cpu,
                              uint32_t *field, bool to_kernel)
 {
     int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
=20
     if (to_kernel) {
-        *field =3D GIC_TEST_ACTIVE(irq, cm);
+        *field =3D GIC_DIST_TEST_ACTIVE(irq, cm);
     } else {
         if (*field & 1) {
-            GIC_SET_ACTIVE(irq, cm);
+            GIC_DIST_SET_ACTIVE(irq, cm);
         }
     }
 }
=20
 static void translate_trigger(GICState *s, int irq, int cpu,
                               uint32_t *field, bool to_kernel)
 {
     if (to_kernel) {
-        *field =3D (GIC_TEST_EDGE_TRIGGER(irq)) ? 0x2 : 0x0;
+        *field =3D (GIC_DIST_TEST_EDGE_TRIGGER(irq)) ? 0x2 : 0x0;
     } else {
         if (*field & 0x2) {
-            GIC_SET_EDGE_TRIGGER(irq);
+            GIC_DIST_SET_EDGE_TRIGGER(irq);
         }
     }
 }
=20
 static void translate_priority(GICState *s, int irq, int cpu,
                                uint32_t *field, bool to_kernel)
 {
     if (to_kernel) {
-        *field =3D GIC_GET_PRIORITY(irq, cpu) & 0xff;
+        *field =3D GIC_DIST_GET_PRIORITY(irq, cpu) & 0xff;
     } else {
-        gic_set_priority(s, cpu, irq, *field & 0xff, MEMTXATTRS_UNSPECIF=
IED);
+        gic_dist_set_priority(s, cpu, irq,
+                              *field & 0xff, MEMTXATTRS_UNSPECIFIED);
     }
 }
=20
 static void translate_targets(GICState *s, int irq, int cpu,
                               uint32_t *field, bool to_kernel)
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 7fe87b13de..6f8d242904 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -25,34 +25,35 @@
=20
 #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
=20
 #define GIC_BASE_IRQ 0
=20
-#define GIC_SET_ENABLED(irq, cm) s->irq_state[irq].enabled |=3D (cm)
-#define GIC_CLEAR_ENABLED(irq, cm) s->irq_state[irq].enabled &=3D ~(cm)
-#define GIC_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (cm)) !=3D=
 0)
-#define GIC_SET_PENDING(irq, cm) s->irq_state[irq].pending |=3D (cm)
-#define GIC_CLEAR_PENDING(irq, cm) s->irq_state[irq].pending &=3D ~(cm)
-#define GIC_SET_ACTIVE(irq, cm) s->irq_state[irq].active |=3D (cm)
-#define GIC_CLEAR_ACTIVE(irq, cm) s->irq_state[irq].active &=3D ~(cm)
-#define GIC_TEST_ACTIVE(irq, cm) ((s->irq_state[irq].active & (cm)) !=3D=
 0)
-#define GIC_SET_MODEL(irq) s->irq_state[irq].model =3D true
-#define GIC_CLEAR_MODEL(irq) s->irq_state[irq].model =3D false
-#define GIC_TEST_MODEL(irq) s->irq_state[irq].model
-#define GIC_SET_LEVEL(irq, cm) s->irq_state[irq].level |=3D (cm)
-#define GIC_CLEAR_LEVEL(irq, cm) s->irq_state[irq].level &=3D ~(cm)
-#define GIC_TEST_LEVEL(irq, cm) ((s->irq_state[irq].level & (cm)) !=3D 0=
)
-#define GIC_SET_EDGE_TRIGGER(irq) s->irq_state[irq].edge_trigger =3D tru=
e
-#define GIC_CLEAR_EDGE_TRIGGER(irq) s->irq_state[irq].edge_trigger =3D f=
alse
-#define GIC_TEST_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger)
-#define GIC_GET_PRIORITY(irq, cpu) (((irq) < GIC_INTERNAL) ?            =
\
+#define GIC_DIST_SET_ENABLED(irq, cm) (s->irq_state[irq].enabled |=3D (c=
m))
+#define GIC_DIST_CLEAR_ENABLED(irq, cm) (s->irq_state[irq].enabled &=3D =
~(cm))
+#define GIC_DIST_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (cm=
)) !=3D 0)
+#define GIC_DIST_SET_PENDING(irq, cm) (s->irq_state[irq].pending |=3D (c=
m))
+#define GIC_DIST_CLEAR_PENDING(irq, cm) (s->irq_state[irq].pending &=3D =
~(cm))
+#define GIC_DIST_SET_ACTIVE(irq, cm) (s->irq_state[irq].active |=3D (cm)=
)
+#define GIC_DIST_CLEAR_ACTIVE(irq, cm) (s->irq_state[irq].active &=3D ~(=
cm))
+#define GIC_DIST_TEST_ACTIVE(irq, cm) ((s->irq_state[irq].active & (cm))=
 !=3D 0)
+#define GIC_DIST_SET_MODEL(irq) (s->irq_state[irq].model =3D true)
+#define GIC_DIST_CLEAR_MODEL(irq) (s->irq_state[irq].model =3D false)
+#define GIC_DIST_TEST_MODEL(irq) (s->irq_state[irq].model)
+#define GIC_DIST_SET_LEVEL(irq, cm) (s->irq_state[irq].level |=3D (cm))
+#define GIC_DIST_CLEAR_LEVEL(irq, cm) (s->irq_state[irq].level &=3D ~(cm=
))
+#define GIC_DIST_TEST_LEVEL(irq, cm) ((s->irq_state[irq].level & (cm)) !=
=3D 0)
+#define GIC_DIST_SET_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger =3D=
 true)
+#define GIC_DIST_CLEAR_EDGE_TRIGGER(irq) \
+    (s->irq_state[irq].edge_trigger =3D false)
+#define GIC_DIST_TEST_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger)
+#define GIC_DIST_GET_PRIORITY(irq, cpu) (((irq) < GIC_INTERNAL) ?       =
     \
                                     s->priority1[irq][cpu] :            =
\
                                     s->priority2[(irq) - GIC_INTERNAL])
-#define GIC_TARGET(irq) s->irq_target[irq]
-#define GIC_CLEAR_GROUP(irq, cm) (s->irq_state[irq].group &=3D ~(cm))
-#define GIC_SET_GROUP(irq, cm) (s->irq_state[irq].group |=3D (cm))
-#define GIC_TEST_GROUP(irq, cm) ((s->irq_state[irq].group & (cm)) !=3D 0=
)
+#define GIC_DIST_TARGET(irq) (s->irq_target[irq])
+#define GIC_DIST_CLEAR_GROUP(irq, cm) (s->irq_state[irq].group &=3D ~(cm=
))
+#define GIC_DIST_SET_GROUP(irq, cm) (s->irq_state[irq].group |=3D (cm))
+#define GIC_DIST_TEST_GROUP(irq, cm) ((s->irq_state[irq].group & (cm)) !=
=3D 0)
=20
 #define GICD_CTLR_EN_GRP0 (1U << 0)
 #define GICD_CTLR_EN_GRP1 (1U << 1)
=20
 #define GICC_CTLR_EN_GRP0    (1U << 0)
@@ -77,12 +78,12 @@
 void gic_set_pending_private(GICState *s, int cpu, int irq);
 uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
 void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs);
 void gic_update(GICState *s);
 void gic_init_irqs_and_distributor(GICState *s);
-void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
-                      MemTxAttrs attrs);
+void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
+                           MemTxAttrs attrs);
=20
 static inline bool gic_test_pending(GICState *s, int irq, int cm)
 {
     if (s->revision =3D=3D REV_11MPCORE) {
         return s->irq_state[irq].pending & cm;
@@ -91,10 +92,10 @@ static inline bool gic_test_pending(GICState *s, int =
irq, int cm)
          * level-triggered interrupts are either considered pending when=
 the
          * level is active or if software has explicitly written to
          * GICD_ISPENDR to set the state pending.
          */
         return (s->irq_state[irq].pending & cm) ||
-            (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_LEVEL(irq, cm));
+            (!GIC_DIST_TEST_EDGE_TRIGGER(irq) && GIC_DIST_TEST_LEVEL(irq=
, cm));
     }
 }
=20
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
--=20
2.18.0

