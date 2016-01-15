Received: by 10.25.159.19 with SMTP id i19csp373427lfe;
        Fri, 15 Jan 2016 02:38:03 -0800 (PST)
X-Received: by 10.55.74.141 with SMTP id x135mr11885524qka.20.1452854283853;
        Fri, 15 Jan 2016 02:38:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m90si12711114qge.24.2016.01.15.02.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 02:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@virtualopensystems-com.20150623.gappssmtp.com
Received: from localhost ([::1]:46284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK1lb-0005Xa-DD
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 05:38:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1lZ-0005XI-OY
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:38:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1lV-0008T0-1F
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:38:01 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <a.rigo@virtualopensystems.com>) id 1aK1lU-0008Sh-Lj
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 05:37:56 -0500
Received: by mail-wm0-x241.google.com with SMTP id f206so2155128wmf.2
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 02:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=virtualopensystems-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zeTOywR/cFBFX9YQj8tcUXkH/UQXB5+RSgXReuXmTSo=;
	b=u7lWJwof7aTWFiIQZI197DCTrkG/cguVrB/qwh5u4DdAZhUVw03oxPoKzj8ASsIdqh
	E+F2VdFS18KABRS15Z/xH9FBZJyT6S2Li9qsob5DW3TxD0G1AX67kPbyX+tbYAjaGzP2
	umcO10QXJc84XNAMawW6PNmngKYi4HkriWCQ2JmOr+c6nblIctaRIcp3KAyop09jSCKc
	X6hDLjdKM0t8oBgE7GDhhjDb9T83m5xTMthS/vWkkA0LAI4SlN+WY0Z7h09kgyIH0+y3
	BMoFsQc14J9Ch4Pryod2PhgCqDgozGXqUU1OGSX4vwEGPbt30aNHe6VkKYK06mwat0fS
	WC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zeTOywR/cFBFX9YQj8tcUXkH/UQXB5+RSgXReuXmTSo=;
	b=mdOuXgyKObHOKLhgpEBXuO4HKoVLmTumsRyeadpm1zSuhiRla8b/pOfyLpjSO/0BJZ
	qMUQQh5fKaXfGjtU8EXSv5t6u6x99PKTSk5oyJ2j+ApCpTxTg/0EAFuus2Kj9A4csLbF
	yeSLBWxTyvxsfWTaUl1fAvGUIsLBjm9YzBJrgATvj/g1KZZ2LJ+Xn3ECVIXKzSGmuaTB
	lCPFQRpGWgCL3ygUwQ5BnQ95UqEKIPBdhlqLiwx/QWh9WyyPihj6ZUAo9gx036eiCmKA
	Y2DTijVpOQfu/0x/vGUO5zWbdK2CeVeiSi6oEjP9bA+HivWAd8nCcJNTa8frHwLTzRoi
	8eWw==
X-Gm-Message-State: ALoCoQmp4jvoSENuuCEWNgjLPFTddzCbzk3505ZTLgc3ggYMsj7RxvFa1zDV6ZPoMAbyOp4dWkfaCBQNLlL/JFHAwIme45l1cA==
X-Received: by 10.194.75.202 with SMTP id e10mr10498939wjw.160.1452854275581; 
	Fri, 15 Jan 2016 02:37:55 -0800 (PST)
Received: from localhost.localdomain
	(LPuteaux-656-1-278-113.w80-15.abo.wanadoo.fr. [80.15.154.113])
	by smtp.googlemail.com with ESMTPSA id
	id1sm9999337wjb.19.2016.01.15.02.37.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jan 2016 02:37:54 -0800 (PST)
From: Alvise Rigo <a.rigo@virtualopensystems.com>
To: qemu-devel@nongnu.org
Date: Fri, 15 Jan 2016 11:37:42 +0100
Message-Id: <1452854262-19550-1-git-send-email-a.rigo@virtualopensystems.com>
X-Mailer: git-send-email 2.7.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Cc: Peter Maydell <peter.maydell@linaro.org>, tech@virtualopensystems.com,
	Alvise Rigo <a.rigo@virtualopensystems.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: [Qemu-arm] [Qemu-devel] [PATCH v2] target-arm: Use the right MMU
	index in arm_regime_using_lpae_format
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
X-TUID: t/SxslO2wOTH

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
 target-arm/helper.c    | 12 ++++++++----
 target-arm/internals.h |  5 +++--
 target-arm/op_helper.c |  2 +-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 59d5a41..faeaaa8 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5996,11 +5996,15 @@ static inline bool regime_using_lpae_format(CPUARMState *env,
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
+    if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
+        mmu_idx += ARMMMUIdx_S1NSE0;
+    }
+
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
index e42d287..951fc5a 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -149,7 +149,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
     /* the DFSR for an alignment fault depends on whether we're using
      * the LPAE long descriptor format, or the short descriptor format
      */
-    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
+    if (arm_s1_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
         env->exception.fsr = 0x21;
     } else {
         env->exception.fsr = 0x1;
-- 
2.7.0

