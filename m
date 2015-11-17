Received: by 10.182.158.201 with SMTP id ww9csp985657obb;
        Tue, 17 Nov 2015 13:41:42 -0800 (PST)
X-Received: by 10.129.92.3 with SMTP id q3mr11469945ywb.256.1447796502716;
        Tue, 17 Nov 2015 13:41:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m125si13386736ywd.407.2015.11.17.13.41.42
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 13:41:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@getpebble_com.20150623.gappssmtp.com
Received: from localhost ([::1]:60776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zyo0U-0000rX-BA
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 16:41:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1Zyo08-0000YN-J1
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 16:41:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1Zyo04-0005oE-IY
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 16:41:20 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:32825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1Zyo04-0005o4-8j
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 16:41:16 -0500
Received: by pabfh17 with SMTP id fh17so21555267pab.0
	for <qemu-devel@nongnu.org>; Tue, 17 Nov 2015 13:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=getpebble_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=UxfGgNI8yVraKzp7cvK68dpuWMOie1JpxcliEjadg1Q=;
	b=vxQGUm8hyTlWqLoe37KVV/pvbnm5a57sHnMugWUGfAu9wg1WY74uZwVWtqaK6gLX7K
	s8J38WuKlPBS/dlgPFokxBkkGbkb7GQ2yJ1ahWAVK1QXuGvnitVUXSU3Oly1mhJRXdyw
	1Z7FZ/dswvP9u3bHbhNO2+slS6BC0wUF9MECd6/XjHLwomhrbImtTgeA/y30dDuNx4vb
	hVX6JF+P4vp8nTTnJoAMayxm2tEDbXF5VX46kFldgT92iFBdq6PPPoCAh66VS2n6ChR/
	VL/PWPAokWP3ktp49cYNhfan5HtIvfzFZ8NC9tJ8EmRzhJASFPIV0x1X7S0RPHmnUa41
	C4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=UxfGgNI8yVraKzp7cvK68dpuWMOie1JpxcliEjadg1Q=;
	b=BJBCL0zCZgeqt0oh1jbA9NRd4VRFEf8vvW4tCA70Fxax4Md0nFEBcgEQiZ7qoEBDes
	ScQK9lOfzpP5cDlgP/E9jLxuiZgsen5xzmJbDumUC56SZhIgjZJszbGOPpIBJNYFFbkH
	Q41hX2nogJIa3DCS9xuZ0NNIP+sFV556s1Uv4VN7wEPz77kiviceXgd7juzOmyOBLS0A
	KLdyPtUSRAEqRlXp/58MFQPz8kcjfvmCXqWnql7/iyez/UUmYucv9W7JQJphhV0yz5AC
	d+0mOw7CmSsoSSp6qDB2ZddcIGV6Ek9GJW50+WEho14KcAn/CjLoFqWPNi5A44vcmJAu
	bkzg==
X-Gm-Message-State: ALoCoQnSMbkqgQoCKifXGNbRQcGvfMfekmUMvgLIkhxhGWch+3vQgmfL+tLdu0hoetQSrURmf2PV
X-Received: by 10.68.65.6 with SMTP id t6mr66444826pbs.90.1447796475381;
	Tue, 17 Nov 2015 13:41:15 -0800 (PST)
Received: from A1254-MBP13.hq.getpebble.com (pao-34.net.getpebble.com.
	[216.218.175.34]) by smtp.gmail.com with ESMTPSA id
	i9sm44702021pbq.93.2015.11.17.13.41.14
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Nov 2015 13:41:14 -0800 (PST)
From: =?UTF-8?q?Fran=C3=A7ois=20Baldassari?= <francois@getpebble.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Nov 2015 13:40:30 -0800
Message-Id: <1447796430-90226-1-git-send-email-francois@getpebble.com>
X-Mailer: git-send-email 2.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::230
Cc: =?UTF-8?q?Fran=C3=A7ois=20Baldassari?= <francois@getpebble.com>,
	peter.maydell@linaro.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Fran=C3=A7ois=20Baldassari?= <francois@pebble.com>
Subject: [Qemu-devel] [PATCH] target-arm: Priority masking with basepri on
	v7m
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IqZY5Ls3wB+4

On armv7m mcus, the BASEPRI register can be set to mask interrupts
above a certain priority.

This changeset implements that functionality by way of the NVIC which
ultimately sets the interrupt mask in the GIC.

Signed-off-by: François Baldassari <francois@pebble.com>
---
 hw/intc/arm_gic.c      |  2 +-
 hw/intc/armv7m_nvic.c  | 11 +++++++++++
 hw/intc/gic_internal.h |  4 ++++
 target-arm/cpu.h       |  1 +
 target-arm/helper.c    |  2 ++
 5 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d71aeb8..27b4906 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -399,7 +399,7 @@ static uint32_t gic_get_priority(GICState *s, int cpu, int irq,
     return prio;
 }
 
-static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
+void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
                                   MemTxAttrs attrs)
 {
     if (s->security_extn && !attrs.secure) {
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 6fc167e..d1aa556 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -148,6 +148,17 @@ void armv7m_nvic_complete_irq(void *opaque, int irq)
     gic_complete_irq(&s->gic, 0, irq, MEMTXATTRS_UNSPECIFIED);
 }
 
+
+void armv7m_nvic_set_priority_mask(void *opaque, uint16_t mask)
+{
+    nvic_state *s = (nvic_state *)opaque;
+    if (mask == 0) {
+        /* 0 is used to disable the priority mask */
+        mask = 0x100;
+    }
+    gic_set_priority_mask(&s->gic, 0, mask, MEMTXATTRS_UNSPECIFIED);
+}
+
 static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
 {
     ARMCPU *cpu;
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 20c1e8a..995f337 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -84,6 +84,10 @@ void gic_update(GICState *s);
 void gic_init_irqs_and_distributor(GICState *s);
 void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
                       MemTxAttrs attrs);
+void gic_set_priority_mask(GICState *s,
+                           int cpu,
+                           uint8_t pmask,
+                           MemTxAttrs attrs);
 
 static inline bool gic_test_pending(GICState *s, int irq, int cm)
 {
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 815fef8..fb7dc61 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1034,6 +1034,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 void armv7m_nvic_set_pending(void *opaque, int irq);
 int armv7m_nvic_acknowledge_irq(void *opaque);
 void armv7m_nvic_complete_irq(void *opaque, int irq);
+void armv7m_nvic_set_priority_mask(void *opaque, uint16_t mask);
 
 /* Interface for defining coprocessor registers.
  * Registers are defined in tables of arm_cp_reginfo structs
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4ecae61..27807e9 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7449,11 +7449,13 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
         break;
     case 17: /* BASEPRI */
         env->v7m.basepri = val & 0xff;
+        armv7m_nvic_set_priority_mask(env->nvic, env->v7m.basepri);
         break;
     case 18: /* BASEPRI_MAX */
         val &= 0xff;
         if (val != 0 && (val < env->v7m.basepri || env->v7m.basepri == 0))
             env->v7m.basepri = val;
+            armv7m_nvic_set_priority_mask(env->nvic, env->v7m.basepri);
         break;
     case 19: /* FAULTMASK */
         if (val & 1) {
-- 
2.4.0

