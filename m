Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3009051wru;
        Mon, 6 Aug 2018 05:35:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfSXGLl5Ljkf7JoFdC5if7dwmDHMpn9/3B7YJRzPUc7BeAWZr7NkzbfwFJpOLd0+bw6k2WS
X-Received: by 2002:ac8:2b81:: with SMTP id m1-v6mr13969344qtm.370.1533558914881;
        Mon, 06 Aug 2018 05:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533558914; cv=none;
        d=google.com; s=arc-20160816;
        b=bEwd0Iec+1S6OkEIs0yRGJe2ZFqH/quUQQUDYh6zKkIoeH3WY2xEdLTyOiJ9U+OzIZ
         MbzbDhCumIVbaU0wjGe6K5ce6ZXFSOuy712Qx482smbevdePID1Y4AOhuwqN7/DWXqed
         K8e2VUwrHsc3L8Cm0u2XBMPPb42mqgkPnawBwaWps93cy56/ACWEJ89BoMTfSlgzQZ5g
         IDFooOBn8vjFgj+dGQ5FM9MT2MOdiyqcoFDOQvD/WDb9N+YjUKeHIUbC5MVXqebrPM1A
         K40zepA4nvXCt4SWN2g8kmIgeNYUqQysFoLTkAKny3QXJQFHpOMCkqhe1RMDEG8ws0dW
         hLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=eFvTOuy8uzY6NC3VeTcO1NrZkxczQkykWxrAZrFOGU4=;
        b=l/zY3g527ndouCZsTJHbhx6dGWJ6fhmZHuSZYewQMTm8SY4IxB0orKjTrclqfLBXTC
         Xx8113OayNBQgzFIZcymUYKT9f35B+EZSEAdavXHKCH1Q3GwFqSnMOq6JOznUI0Dm7h8
         WEPZQ7+malWMoH6xIMW85KOsViCH1rSyxM4viQbK4dC9hb0uBcTsWffJNmfwE9gMy+3T
         2cnjyYUrsQwqtxZBF0w5QNu5OwKEzHKsP6gOru8rOKgyW1Pb7IiVqQx+FRMIH9B0vWxw
         20LZp4zEFUztdEEta7436LPYuB+H/QqtN4aWc0v4hc1N+lxWWs+qpeJMNoThmQxyQv57
         jDpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5-v6si2677220qte.9.2018.08.06.05.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 05:35:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmejC-00033B-Ae
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 08:35:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmeiz-00032D-Ty
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmeiy-0006cv-GV
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:01 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fmeiy-0006ZZ-8E; Mon, 06 Aug 2018 08:35:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fmeiu-0000yI-0K; Mon, 06 Aug 2018 13:34:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 Aug 2018 13:34:45 +0100
Message-Id: <20180806123445.1459-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180806123445.1459-1-peter.maydell@linaro.org>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 v2 5/5] hw/intc/arm_gicv3_common: Move
 gicd shift bug handling to gicv3_post_load
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VNM3hkDQL2Ym

The code currently in gicv3_gicd_no_migration_shift_bug_post_load()
that handles migration from older QEMU versions with a particular
bug is misplaced. We need to run this after migration in all cases,
not just the cases where the "arm_gicv3/gicd_no_migration_shift_bug"
subsection is present, so it must go in a post_load hook for the
top level VMSD, not for the subsection. Move it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 77 ++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 8175889f1e7..52480c3b4cf 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -29,6 +29,41 @@
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
 
+
+static void gicv3_gicd_no_migration_shift_bug_post_load(GICv3State *cs)
+{
+    if (cs->gicd_no_migration_shift_bug) {
+        return;
+    }
+
+    /* Older versions of QEMU had a bug in the handling of state save/restore
+     * to the KVM GICv3: they got the offset in the bitmap arrays wrong,
+     * so that instead of the data for external interrupts 32 and up
+     * starting at bit position 32 in the bitmap, it started at bit
+     * position 64. If we're receiving data from a QEMU with that bug,
+     * we must move the data down into the right place.
+     */
+    memmove(cs->group, (uint8_t *)cs->group + GIC_INTERNAL / 8,
+            sizeof(cs->group) - GIC_INTERNAL / 8);
+    memmove(cs->grpmod, (uint8_t *)cs->grpmod + GIC_INTERNAL / 8,
+            sizeof(cs->grpmod) - GIC_INTERNAL / 8);
+    memmove(cs->enabled, (uint8_t *)cs->enabled + GIC_INTERNAL / 8,
+            sizeof(cs->enabled) - GIC_INTERNAL / 8);
+    memmove(cs->pending, (uint8_t *)cs->pending + GIC_INTERNAL / 8,
+            sizeof(cs->pending) - GIC_INTERNAL / 8);
+    memmove(cs->active, (uint8_t *)cs->active + GIC_INTERNAL / 8,
+            sizeof(cs->active) - GIC_INTERNAL / 8);
+    memmove(cs->edge_trigger, (uint8_t *)cs->edge_trigger + GIC_INTERNAL / 8,
+            sizeof(cs->edge_trigger) - GIC_INTERNAL / 8);
+
+    /*
+     * While this new version QEMU doesn't have this kind of bug as we fix it,
+     * so it needs to set the flag to true to indicate that and it's necessary
+     * for next migration to work from this new version QEMU.
+     */
+    cs->gicd_no_migration_shift_bug = true;
+}
+
 static int gicv3_pre_save(void *opaque)
 {
     GICv3State *s = (GICv3State *)opaque;
@@ -46,6 +81,8 @@ static int gicv3_post_load(void *opaque, int version_id)
     GICv3State *s = (GICv3State *)opaque;
     ARMGICv3CommonClass *c = ARM_GICV3_COMMON_GET_CLASS(s);
 
+    gicv3_gicd_no_migration_shift_bug_post_load(s);
+
     if (c->post_load) {
         c->post_load(s);
     }
@@ -161,45 +198,6 @@ static int gicv3_pre_load(void *opaque)
     return 0;
 }
 
-static int gicv3_gicd_no_migration_shift_bug_post_load(void *opaque,
-                                                       int version_id)
-{
-    GICv3State *cs = opaque;
-
-    if (cs->gicd_no_migration_shift_bug) {
-        return 0;
-    }
-
-    /* Older versions of QEMU had a bug in the handling of state save/restore
-     * to the KVM GICv3: they got the offset in the bitmap arrays wrong,
-     * so that instead of the data for external interrupts 32 and up
-     * starting at bit position 32 in the bitmap, it started at bit
-     * position 64. If we're receiving data from a QEMU with that bug,
-     * we must move the data down into the right place.
-     */
-    memmove(cs->group, (uint8_t *)cs->group + GIC_INTERNAL / 8,
-            sizeof(cs->group) - GIC_INTERNAL / 8);
-    memmove(cs->grpmod, (uint8_t *)cs->grpmod + GIC_INTERNAL / 8,
-            sizeof(cs->grpmod) - GIC_INTERNAL / 8);
-    memmove(cs->enabled, (uint8_t *)cs->enabled + GIC_INTERNAL / 8,
-            sizeof(cs->enabled) - GIC_INTERNAL / 8);
-    memmove(cs->pending, (uint8_t *)cs->pending + GIC_INTERNAL / 8,
-            sizeof(cs->pending) - GIC_INTERNAL / 8);
-    memmove(cs->active, (uint8_t *)cs->active + GIC_INTERNAL / 8,
-            sizeof(cs->active) - GIC_INTERNAL / 8);
-    memmove(cs->edge_trigger, (uint8_t *)cs->edge_trigger + GIC_INTERNAL / 8,
-            sizeof(cs->edge_trigger) - GIC_INTERNAL / 8);
-
-    /*
-     * While this new version QEMU doesn't have this kind of bug as we fix it,
-     * so it needs to set the flag to true to indicate that and it's necessary
-     * for next migration to work from this new version QEMU.
-     */
-    cs->gicd_no_migration_shift_bug = true;
-
-    return 0;
-}
-
 static bool needed_always(void *opaque)
 {
     return true;
@@ -210,7 +208,6 @@ const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = needed_always,
-    .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_BOOL(gicd_no_migration_shift_bug, GICv3State),
         VMSTATE_END_OF_LIST()
-- 
2.17.1

