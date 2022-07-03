Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2442629lft;
        Sun, 3 Jul 2022 01:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vWr7mZuFd4DXSx8e7ElzFnPaOTkvXW1oSWLH6jK6aZhJYoZPxogpthy806UOKTuS6THxia
X-Received: by 2002:a25:ced0:0:b0:66e:40ab:c336 with SMTP id x199-20020a25ced0000000b0066e40abc336mr450763ybe.220.1656838324170;
        Sun, 03 Jul 2022 01:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656838324; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3KHp6EsclazBwEKx5fS0jgElfVosW30UekWazqfqXM7nGe+gXVCFt1pKIidCVJbyq
         nH4/uk7BrnoRC16CBMYiuP3N3uDd3SCg3MEUCzMp9qyDWbvos6IiSJAVp3o/MT3qtxVr
         5JKBXO7EGyiX1cYJTcSZgZs21lJiVF+UltysCBM2k/fXKHdgCm/623e7fsG+yh41WMtE
         GMNv2BHrCJo5S/Cw1OgM3/OmNHhXcnHIAAqoHw8QW/La6P6vUkLaZL5jBQk0/Z0H+nMy
         AkMn0cvydl3PIK7aS8jKGpug7oqJ0upoGiBYlwZzxpy32K2tebDyBL/84/QjjNPfGFmZ
         KGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GvXUGU1iRA1atVwXCiqqvbPFvrWHZ4nIvxHqNJBxHmA=;
        b=Do0/9wV+4FCPpAuFR9JAHd+i18hqqamCWffmDoxezAouznL98Ga0uVJ8pXEpcTdFX/
         zELVwEQ1oIfjnFmLXmoP54UUAAZqDKJIedbJBVzUslFpy+LMdnh8II/zKOAwfZL6Ax1j
         OwQYYJycl3UNpf43zsyiVNX8QhVgQHAfbkO936nXeiGxZtKeUIORSiZanYdTWd43p+nf
         dI+Ixcpk4sGzZjtN4ybk4re2nDCrYa56NiTm85KfRogi2yjIhLq8NsAs3HWn1zIyIy+F
         dHu57pP/cA6vISXEqFXG1QHDGr2F/v/uYlX/YRZ5NvG1jV14iVUOLy6UP02Q5DnHWOCl
         7dqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jCv21o8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v139-20020a252f91000000b0066d27b7158bsi21600072ybv.135.2022.07.03.01.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:52:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jCv21o8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vKl-0007Sy-HF
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvr-0001ca-DM
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:26:19 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvp-0006D9-Rz
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:26:19 -0400
Received: by mail-pl1-x636.google.com with SMTP id m2so6034936plx.3
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvXUGU1iRA1atVwXCiqqvbPFvrWHZ4nIvxHqNJBxHmA=;
 b=jCv21o8u9ZXAXS4v1JkKykW4Pizq6aQb08a7B7UmKzECJgRinTvI97AYrEgzqLkUDy
 5Kblir2IRsi6+mZr5O/vMYnLZQ1/FylqbOpIb+ISOg+k7d0f3CNhMaVsQ4pGjtcSHCOL
 8vhuYix47F7peUArdxjszDkv8G97F4Wh6kfERMWR84ys2CSVFcw/qZ6HMLXRc3DD+XVU
 BqZ4zJOxugc2Zp2zvkmGhstgKZLsWwOHOVuvcGbe5eOovLS5WBnSzLXNtMBIWYmWH5H7
 iNclkEHcbljNDLr2sfcPrTFXNoNtOAaISMboB9uieI9/ZBk9t8KSrJWhRpka2G/7eL1z
 KtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvXUGU1iRA1atVwXCiqqvbPFvrWHZ4nIvxHqNJBxHmA=;
 b=Hnq7RJq0fAlYs+QQAp4ZGYgUajlJMDzMRk5SFf2cch4qdhwPVrin/KkmZ/JokUFIi5
 kT42pENSbER8aD11mpNjXRPjB7l4OvlVp8DXEG1L6E7bPPdkFCE5UconECKjD3CfQJtv
 Zu72N7tOApBBHKY/UnY1UpO5BLqL2bzvbfEwumZn2c0GBCajhzDXQOrcNb/2IQia8d/b
 kkPuimV3PhqzImTzmD8dQPb33DpaOAcac8qwTXRlcYIvbfBSRb/85lvJx5ZWgoTxHSp+
 vmYhlS0KNl73X7sgDSBqbOlR2inVqmbbI3KTrz3p48/K/vc8d4rZNDueut0cSKQo03iU
 WsPQ==
X-Gm-Message-State: AJIora8Mhh9OEqIdT1zdVAwJNaeRLmSUp4u4LEJXflcGWmNguxIeUwX2
 gJBBakybEimHX++Xt1CFvTqJxFDruHueYuLZ
X-Received: by 2002:a17:903:283:b0:16a:6db9:3f02 with SMTP id
 j3-20020a170903028300b0016a6db93f02mr29271865plr.173.1656836777060; 
 Sun, 03 Jul 2022 01:26:17 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 37/62] target/arm: Hoist read of *is_secure in S1_ptw_translate
Date: Sun,  3 Jul 2022 13:53:54 +0530
Message-Id: <20220703082419.770989-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zRadOPfmDVWC

Rename the argument to is_secure_ptr, and introduce a
local variable is_secure with the value.  We only write
back to the pointer toward the end of the function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f76a8e931a..12288ac365 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -207,24 +207,26 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
+                               hwaddr addr, bool *is_secure_ptr,
                                ARMMMUFaultInfo *fi)
 {
+    bool is_secure = *is_secure_ptr;
+
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2, *is_secure)) {
-        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
-                                          : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
+                                         : ARMMMUIdx_Stage2;
         GetPhysAddrResult s2 = {};
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 *is_secure, false, &s2, fi);
+                                 is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
@@ -237,19 +239,20 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
 
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
+            if (is_secure) {
+                is_secure = !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+                is_secure = !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
             }
+            *is_secure_ptr = is_secure;
         } else {
-            assert(!*is_secure);
+            assert(!is_secure);
         }
 
         addr = s2.phys;
-- 
2.34.1

