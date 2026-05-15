Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8881FCD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:29:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUi-0006TJ-7r; Fri, 15 May 2026 10:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtUH-0005tb-Ha
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:26:02 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtUA-0000ys-R0
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:58 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so8159449f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855153; x=1779459953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TydCV87eriJQbdUNFILWluMIKkiaW+xceKfCgA5Uw1s=;
 b=MDXKpYexTLeyhmI9cy7nfhH0uYJ0g5p7h1hw9DL7Sz+DO1kBmu1i5VaQ4P61kfS7nm
 muKBKEBzokavr8e7M2GqDLnsW50Nj9V70qYGSLUzRvf8QcbUceeb4u4MILmMG9yRF+9b
 biQFXjyFeG03c9E4kP00kT/uAVRKj0A3HKjcsRdnzRXtljRpaAAM5GGIbeCSqHptB9Zk
 JXYeTlDErPzBlNu0m+4JWEIT/3xY+rR4Z/i223zT9NtyU2Tq0mETEYfMdwyXTaLflbSM
 LU9UPTpqKxQVilITtp6isgNquGT3EESuaMT7ZprmxpnJDxQesUQdIKANcydHDJjuxWEV
 nrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855153; x=1779459953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TydCV87eriJQbdUNFILWluMIKkiaW+xceKfCgA5Uw1s=;
 b=bbke1PKAX8Y1/z/O6Nph1JGohxWUPzFtZsbpWLwysFZcD5P2XQVp0BXxVgLaJ2Is5r
 rgeRkDv4piJPpdPEX1yS0OFbPHiL7VIf+dRed0sO41N316LXU6hJsoVZ7gVc0MqgtId/
 N2Yqs2uFu6fEshwGTTxAY70PS5wG5wDMHUQRLxoK1POkslB6BdUNqpAiDzoxzLSW4v1o
 RydOKNFPEXQCaxT3h19+KdQCg8GOU4q3L/zRChNahQys5pNmNZlelAf20QqVp3y8va4m
 C/tgSd4Qi3v9f+bk8ykBGlJe34KkcG1zl8QA9msLQbj7dJFxU/cvcCZaey2oi0ijCc+r
 Q0LQ==
X-Gm-Message-State: AOJu0Ywr1yWXa1Zn+p9ymP5pdwNjwapSmg60DSyAyogQnLYdcIUhTb9/
 WpJHV6UWBKO86zsN/5r3KYDNQW4zYb/qG7HAYwQ1J6EczEdDyN/mLyuSCeSpRWPkqIvVx1h6JsI
 Q9xNX
X-Gm-Gg: Acq92OF7NmvIzTo+gZoCf+5ZBzSvmqZSl6uGnObOBRzH66BoI5PMfHJzY1H5VcICql6
 l2c811PFa515sSlRCVVrOMHfsVj28kI73+YvJ39u8WopWMAYh4f2/uOYjMkZCtKKPmtPt9nwwJS
 WQ6Csh5CwGx5SBezgHjL8c27GTcGEqamn7+VtyPIdI736q89YJGoA5DG4vQN13grL/zDxVIABpa
 q/o5MRKcDEMN4MMNXnxbjjIHBcAjH1Yqlvykyt48+HDj7dmwH8dPXlSBIK+utzMAcTZgVkAaNqV
 uJZDd9qmG70VuQV3W1uNUGahCD90cyrQ5QEzx41Br3dNVKIxdFNYAoV34zFCWcEZ252dJ0GiLe/
 iUUPETs9NWidj5lh/xDWCuT2jDojHMDqZTrZakjq5bvlQrmCShfOnjQaSD2J1f2clP/f2g4Nquc
 NGrIOFVH4CB2ddIS1zYJk+dg9cx6prdUCfslp2q7X+q5pD1UUwgW3gs49Sh92YBSxvx7swmtapR
 VhlXC3Z0Z8LaZZqxQn9x3Q/Slq8uEE=
X-Received: by 2002:a05:6000:2485:b0:44f:da08:18f2 with SMTP id
 ffacd0b85a97d-45e5c3673d9mr5972601f8f.12.1778855153093; 
 Fri, 15 May 2026 07:25:53 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 10/14] target/arm/ptw: Flip sense of get_phys_addr_nogpc
 return value
Date: Fri, 15 May 2026 15:25:37 +0100
Message-ID: <20260515142541.571911-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 545138464d..9ecb6238a7 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3570,8 +3570,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                               memop, result, fi);
 
     /* If S1 fails, return early.  */
-    if (ret) {
-        return !ret;
+    if (!ret) {
+        return ret;
     }
 
     ipa = result->f.phys_addr;
@@ -3601,8 +3601,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     result->f.prot = s1_prot & result->s2prot;
 
     /* If S2 fails, return early.  */
-    if (ret) {
-        return !ret;
+    if (!ret) {
+        return ret;
     }
 
     /*
@@ -3683,7 +3683,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     case ARMMMUIdx_Phys_Root:
     case ARMMMUIdx_Phys_Realm:
         /* Checking Phys early avoids special casing later vs regime_el. */
-        return !get_phys_addr_disabled(env, ptw, address, access_type,
+        return get_phys_addr_disabled(env, ptw, address, access_type,
                                       result, fi);
 
     case ARMMMUIdx_Stage1_E0:
@@ -3724,7 +3724,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         ptw->in_mmu_idx = mmu_idx = s1_mmu_idx;
         if (arm_feature(env, ARM_FEATURE_EL2) &&
             !regime_translation_disabled(env, ARMMMUIdx_Stage2, ptw->in_space)) {
-            return !get_phys_addr_twostage(env, ptw, address, access_type,
+            return get_phys_addr_twostage(env, ptw, address, access_type,
                                           memop, result, fi);
         }
         /* fall through */
@@ -3756,15 +3756,15 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
-            ret = !get_phys_addr_pmsav8(env, ptw, address, access_type,
+            ret = get_phys_addr_pmsav8(env, ptw, address, access_type,
                                        result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
-            ret = !get_phys_addr_pmsav7(env, ptw, address, access_type,
+            ret = get_phys_addr_pmsav7(env, ptw, address, access_type,
                                        result, fi);
         } else {
             /* Pre-v7 MPU */
-            ret = !get_phys_addr_pmsav5(env, ptw, address, access_type,
+            ret = get_phys_addr_pmsav5(env, ptw, address, access_type,
                                        result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
@@ -3772,7 +3772,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                       access_type == MMU_DATA_LOAD ? "reading" :
                       (access_type == MMU_DATA_STORE ? "writing" : "execute"),
                       (uint32_t)address, mmu_idx,
-                      ret ? "Miss" : "Hit",
+                      ret ? "Hit" : "Miss",
                       result->f.prot & PAGE_READ ? 'r' : '-',
                       result->f.prot & PAGE_WRITE ? 'w' : '-',
                       result->f.prot & PAGE_EXEC ? 'x' : '-');
@@ -3783,18 +3783,18 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     /* Definitely a real MMU, not an MPU */
 
     if (regime_translation_disabled(env, mmu_idx, ptw->in_space)) {
-        return !get_phys_addr_disabled(env, ptw, address, access_type,
+        return get_phys_addr_disabled(env, ptw, address, access_type,
                                       result, fi);
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return !get_phys_addr_lpae(env, ptw, address, access_type,
+        return get_phys_addr_lpae(env, ptw, address, access_type,
                                   memop, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-        return !get_phys_addr_v6(env, ptw, address, access_type, result, fi);
+        return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
-        return !get_phys_addr_v5(env, ptw, address, access_type, result, fi);
+        return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
     }
 }
 
@@ -3804,7 +3804,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
-    if (get_phys_addr_nogpc(env, ptw, address, access_type,
+    if (!get_phys_addr_nogpc(env, ptw, address, access_type,
                             memop, result, fi)) {
         return true;
     }
@@ -3851,7 +3851,7 @@ bool get_phys_addr_for_at(CPUARMState *env, vaddr address,
      * check is handled or bypassed by .in_prot_check) and "memop = MO_8"
      * bypasses any alignment check.
      */
-    return get_phys_addr_nogpc(env, &ptw, address,
+    return !get_phys_addr_nogpc(env, &ptw, address,
                                MMU_DATA_LOAD, MO_8, result, fi);
 }
 
-- 
2.43.0


