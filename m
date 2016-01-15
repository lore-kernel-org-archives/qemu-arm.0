Received: by 10.25.159.19 with SMTP id i19csp356078lfe;
        Fri, 15 Jan 2016 02:00:05 -0800 (PST)
X-Received: by 10.55.79.69 with SMTP id d66mr11745456qkb.76.1452852005207;
        Fri, 15 Jan 2016 02:00:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si2546567qgn.107.2016.01.15.02.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 02:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@virtualopensystems-com.20150623.gappssmtp.com
Received: from localhost ([::1]:46145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK1Aq-0005tE-Lx
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 05:00:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1Ao-0005sz-JU
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:00:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1Al-00062o-RV
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:00:02 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:37670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1Al-00062a-HD
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 04:59:59 -0500
Received: by mail-wm0-x233.google.com with SMTP id f206so16441198wmf.0
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 01:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=virtualopensystems-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=917gH/7RfH/mhZ8BL3Xn77K4ZQ8/0UufsWKJ4scslfM=;
	b=VTFX07ixAG4n4Whw3pNNBziTWycFwuMCY8sXm1KIXP599t8EObycdO//8hvrwe+Sq0
	FHEcuJ2DLNE0XzO2wpMx/w8U+ETCUpj3tBKZ5w+NamYokN7zLUOgK3rpByWfeHqbNmZU
	ZtCqiP5iucumlB8fGRDqMMGoB8SniWIOnPsXvESiiTV2+d/D9Jo7jwBbBonJzU/KHXMK
	LcPJQlHPFrk8DiwjCAO7CLSkOthBcs8RbayEYCd6noqb2glTz4TTRMtiqxwP6mQXpRei
	j0li8VDWHfQl+evVibZw4PreW831cXBfsBrEhXJQChIxA9d4ixBUUqK4XKT4W/VQwe2x
	Mqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=917gH/7RfH/mhZ8BL3Xn77K4ZQ8/0UufsWKJ4scslfM=;
	b=DOKihlnQB67JKDG/nTW4gwYobpPFB1EBMI+hgHr7HHTTvz/duMHY9Ukj9e2D/2twak
	Rax9TIMirKd+KBhWQiRxwVq2e4YFFDGyJ40G3F+6z7fRt6P6ENtG6ST/wJoC5oftwrNp
	1dlCUD1A8NV90BAYMm42UpJF9tO8+nJnNMYFcnj5US4T/ghrQN5g7nXuH5zdJ0R+opWV
	94Wrhn9AhMQ8AQohSuDuAVIb0j9MnzE/f2Z5S7ozx1Zm+El98BK4DLdeZ5c2x8nZjt+O
	RjOPY0KJVoBPLoqPT0GIulF+8M/tL6zHoDHSEXM5d+RSSX6XGdB16pXFDHff9nsCnzI2
	oxxg==
X-Gm-Message-State: ALoCoQmu6tLiZvWqFq2SJePH9JEF467NOYTtprl/x75wcpb2Dnr254fFDftRKbLHCUTLDPVEdYQLvU5tqPi5vzTHfBp/gyXwSg==
X-Received: by 10.194.114.1 with SMTP id jc1mr8751161wjb.78.1452851997207;
	Fri, 15 Jan 2016 01:59:57 -0800 (PST)
Received: from localhost.localdomain
	(LPuteaux-656-1-278-113.w80-15.abo.wanadoo.fr. [80.15.154.113])
	by smtp.googlemail.com with ESMTPSA id
	gl10sm9847692wjb.30.2016.01.15.01.59.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jan 2016 01:59:56 -0800 (PST)
From: Alvise Rigo <a.rigo@virtualopensystems.com>
To: qemu-devel@nongnu.org
Date: Fri, 15 Jan 2016 10:59:25 +0100
Message-Id: <1452851965-19418-1-git-send-email-a.rigo@virtualopensystems.com>
X-Mailer: git-send-email 2.7.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: Peter Maydell <peter.maydell@linaro.org>, tech@virtualopensystems.com,
	Alvise Rigo <a.rigo@virtualopensystems.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: [Qemu-arm] [PATCH] target-arm: fix MMU index in
	arm_cpu_do_unaligned_access
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
X-TUID: JXSolFRsBQgh

arm_regime_using_lpae_format checks whether the LPAE extension is used
for stage 1 translation regimes. MMU indexes not exclusively of a stage 1
regime won't work with this method.

In case of ARMMMUIdx_S12NSE0 or ARMMMUIdx_S12NSE1, offset these values
by ARMMMUIdx_S1NSE0 to get the right index indicating a stage 1
translation regime.

Rename also the function to arm_s1_regime_using_lpae_format and update
the comments to reflect the change.

Signed-off-by: Alvise Rigo <a.rigo@virtualopensystems.com>
---
 target-arm/helper.c    | 8 ++++----
 target-arm/internals.h | 5 +++--
 target-arm/op_helper.c | 8 ++++++--
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 59d5a41..8317ff5 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5996,10 +5996,10 @@ static inline bool regime_using_lpae_format(CPUARMState *env,
     return false;
 }
 
-/* Returns true if the translation regime is using LPAE format page tables.
- * Used when raising alignment exceptions, whose FSR changes depending on
- * whether the long or short descriptor format is in use. */
-bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+/* Returns true if the stage 1 translation regime is using LPAE format page
+ * tables. Used when raising alignment exceptions, whose FSR changes depending
+ * on whether the long or short descriptor format is in use. */
+bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     return regime_using_lpae_format(env, mmu_idx);
 }
diff --git a/target-arm/internals.h b/target-arm/internals.h
index b925aaa..d226bbe 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -441,8 +441,9 @@ struct ARMMMUFaultInfo {
 bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
                   uint32_t *fsr, ARMMMUFaultInfo *fi);
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool arm_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
+/* Return true if the stage 1 translation regime is using LPAE format page
+ * tables */
+bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index e42d287..ccc505d 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -133,7 +133,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    int target_el;
+    int target_el, mmu_idx;
     bool same_el;
 
     if (retaddr) {
@@ -146,10 +146,14 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
 
     env->exception.vaddress = vaddr;
 
+    mmu_idx = cpu_mmu_index(env, false);
+    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
+        mmu_idx += ARMMMUIdx_S1NSE0;
+    }
     /* the DFSR for an alignment fault depends on whether we're using
      * the LPAE long descriptor format, or the short descriptor format
      */
-    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
+    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
         env->exception.fsr = 0x21;
     } else {
         env->exception.fsr = 0x1;
-- 
2.7.0

