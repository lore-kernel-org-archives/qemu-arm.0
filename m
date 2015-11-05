Received: by 10.182.105.169 with SMTP id gn9csp535659obb;
        Thu, 5 Nov 2015 07:42:28 -0800 (PST)
X-Received: by 10.31.162.148 with SMTP id l142mr7760516vke.40.1446738148033;
        Thu, 05 Nov 2015 07:42:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c207si4967057vkc.76.2015.11.05.07.42.27
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 07:42:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuMgF-0004kF-Fy
	for alex.bennee@linaro.org; Thu, 05 Nov 2015 10:42:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuMDV-0007NW-TL
	for qemu-arm@nongnu.org; Thu, 05 Nov 2015 10:12:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuMDQ-00058G-6q
	for qemu-arm@nongnu.org; Thu, 05 Nov 2015 10:12:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1ZuMDQ-000583-2P; Thu, 05 Nov 2015 10:12:40 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 23C2C19F202;
	Thu,  5 Nov 2015 15:12:39 +0000 (UTC)
Received: from rhlaptop.redhat.com (vpn-57-107.rdu2.redhat.com [10.10.57.107])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id tA5FCb7u030746; Thu, 5 Nov 2015 10:12:38 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Thu,  5 Nov 2015 09:12:37 -0600
Message-Id: <1446736357-17610-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 05 Nov 2015 10:42:26 -0500
Cc: qemu-trivial@nongnu.org, afaerber@suse.de
Subject: [Qemu-arm] [PATCH Trivial] hw/intc/arm_gic: Use pre-defined macro
	for cpu_num in code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HXmtUo82+Lst

Given that there is a macro, NUM_CPU(s), defined for CPU number in
arm_gic.c, it is better to use it instead of using s->num_cpu in
this file. Code is more consistent after this change.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/intc/arm_gic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 8bad132..4e7733c 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -39,7 +39,7 @@ static const uint8_t gic_id[] = {
 
 static inline int gic_get_current_cpu(GICState *s)
 {
-    if (s->num_cpu > 1) {
+    if (NUM_CPU(s) > 1) {
         return current_cpu->cpu_index;
     }
     return 0;
@@ -643,7 +643,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         res = gic_get_priority(s, cpu, irq, attrs);
     } else if (offset < 0xc00) {
         /* Interrupt CPU Target.  */
-        if (s->num_cpu == 1 && s->revision != REV_11MPCORE) {
+        if (NUM_CPU(s) == 1 && s->revision != REV_11MPCORE) {
             /* For uniprocessor GICs these RAZ/WI */
             res = 0;
         } else {
@@ -863,7 +863,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         /* Interrupt CPU Target. RAZ/WI on uniprocessor GICs, with the
          * annoying exception of the 11MPCore's GIC.
          */
-        if (s->num_cpu != 1 || s->revision == REV_11MPCORE) {
+        if (NUM_CPU(s) != 1 || s->revision == REV_11MPCORE) {
             irq = (offset - 0x800) + GIC_BASE_IRQ;
             if (irq >= s->num_irq) {
                 goto bad_reg;
-- 
2.4.3

