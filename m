Received: by 10.25.0.147 with SMTP id 141csp1985022lfa;
        Wed, 1 Mar 2017 10:28:48 -0800 (PST)
X-Received: by 10.200.56.210 with SMTP id g18mr11457872qtc.63.1488392928843;
        Wed, 01 Mar 2017 10:28:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p24si4854742qtf.288.2017.03.01.10.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Mar 2017 10:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cj8zW-0006UH-2F
	for alex.bennee@linaro.org; Wed, 01 Mar 2017 13:28:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cj8xc-0004tW-MU
	for qemu-arm@nongnu.org; Wed, 01 Mar 2017 13:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cj8xZ-0006w7-2i
	for qemu-arm@nongnu.org; Wed, 01 Mar 2017 13:26:48 -0500
Received: from mail.kernel.org ([198.145.29.136]:41354)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cj8xY-0006vQ-Q3; Wed, 01 Mar 2017 13:26:45 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id DA3B320383;
	Wed,  1 Mar 2017 18:26:42 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8D90D20218;
	Wed,  1 Mar 2017 18:26:39 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  1 Mar 2017 20:26:16 +0200
Message-Id: <20170301182618.22395-4-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170301182618.22395-1-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 3/5] hw/timer/exynos4210_mct: Cleanup indentation
 and empty new lines
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5q7KBdGIMl8g

Statements under 'case' were in some places wrongly indented bringing
confusion and making the code less readable.  Remove also few unneeded
blank lines.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/timer/exynos4210_mct.c | 45 ++++++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 0c189348ae04..76634fb1b4fd 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1015,9 +1015,9 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
 
     case G_COMP_L(0): case G_COMP_L(1): case G_COMP_L(2): case G_COMP_L(3):
     case G_COMP_U(0): case G_COMP_U(1): case G_COMP_U(2): case G_COMP_U(3):
-    index = GET_G_COMP_IDX(offset);
-    shift = 8 * (offset & 0x4);
-    value = UINT32_MAX & (s->g_timer.reg.comp[index] >> shift);
+        index = GET_G_COMP_IDX(offset);
+        shift = 8 * (offset & 0x4);
+        value = UINT32_MAX & (s->g_timer.reg.comp[index] >> shift);
     break;
 
     case G_TCON:
@@ -1066,7 +1066,6 @@ static uint64_t exynos4210_mct_read(void *opaque, hwaddr offset,
         lt_i = GET_L_TIMER_IDX(offset);
 
         value = exynos4210_lfrc_get_count(&s->l_timer[lt_i]);
-
         break;
 
     case L0_TCON: case L1_TCON:
@@ -1152,23 +1151,23 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case G_COMP_L(0): case G_COMP_L(1): case G_COMP_L(2): case G_COMP_L(3):
     case G_COMP_U(0): case G_COMP_U(1): case G_COMP_U(2): case G_COMP_U(3):
-    index = GET_G_COMP_IDX(offset);
-    shift = 8 * (offset & 0x4);
-    s->g_timer.reg.comp[index] =
-            (s->g_timer.reg.comp[index] &
-            (((uint64_t)UINT32_MAX << 32) >> shift)) +
-            (value << shift);
+        index = GET_G_COMP_IDX(offset);
+        shift = 8 * (offset & 0x4);
+        s->g_timer.reg.comp[index] =
+                (s->g_timer.reg.comp[index] &
+                (((uint64_t)UINT32_MAX << 32) >> shift)) +
+                (value << shift);
 
-    DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
+        DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
 
-    if (offset&0x4) {
-        s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
-    } else {
-        s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
-    }
+        if (offset&0x4) {
+            s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
+        } else {
+            s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
+        }
 
-    exynos4210_gfrc_restart(s);
-    break;
+        exynos4210_gfrc_restart(s);
+        break;
 
     case G_TCON:
         old_val = s->g_timer.reg.tcon;
@@ -1206,7 +1205,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         break;
 
     case G_INT_ENB:
-
         /* Raise IRQ if transition from disabled to enabled and CSTAT pending */
         for (i = 0; i < MCT_GT_CMP_NUM; i++) {
             if ((value & G_INT_ENABLE(i)) > (s->g_timer.reg.tcon &
@@ -1287,7 +1285,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         break;
 
     case L0_TCNTB: case L1_TCNTB:
-
         lt_i = GET_L_TIMER_IDX(offset);
         index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
@@ -1315,7 +1312,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         break;
 
     case L0_ICNTB: case L1_ICNTB:
-
         lt_i = GET_L_TIMER_IDX(offset);
         index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
@@ -1352,13 +1348,12 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
         if (icntb_max[lt_i] < value) {
             icntb_max[lt_i] = value;
         }
-DPRINTF("local timer[%d] ICNTB write %llx; max=%x, min=%x\n\n",
-        lt_i, value, icntb_max[lt_i], icntb_min[lt_i]);
+        DPRINTF("local timer[%d] ICNTB write %llx; max=%x, min=%x\n\n",
+                lt_i, value, icntb_max[lt_i], icntb_min[lt_i]);
 #endif
-break;
+        break;
 
     case L0_FRCNTB: case L1_FRCNTB:
-
         lt_i = GET_L_TIMER_IDX(offset);
         index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
-- 
2.9.3

