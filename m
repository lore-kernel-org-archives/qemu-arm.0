Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp2048500qvs;
        Mon, 8 Jun 2020 04:40:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZn/SjuYACN7feeh42tIcEi0NjZpFV1sBbaCko9ONTEumhwPnj7S8gZbNNfK3c8yzDgtkg
X-Received: by 2002:a25:5786:: with SMTP id l128mr37718818ybb.186.1591616452862;
        Mon, 08 Jun 2020 04:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591616452; cv=none;
        d=google.com; s=arc-20160816;
        b=GItd6FAlmpNQOIpDd7xR0/N4sDiMbK3h9B+ov1rpMrCj4uw/izEIQMjW1mOye7O78z
         IbZpB6v/d48eASocILpua9DWFtE7c0GdTriIviNIe1fXb6WBGC5f1v1+fMIRUMDoeKbl
         ouB7HPQ08tGeCnU91012q1sAzRrfGZg521j/u/I6kA0/66n5kMvEBeBjQuN/ZRcgfUXF
         LR5sTj1H280i14tGkVp8y85SX9U+ivSl3maCo8A21vlfFx7KZpGt0VylycTLcdT84Dw0
         FLzVx1XYZAmPDRYPKiazs9ROZQ5HE2AOjL5QzpxHXjqT65XWpqvsARnfbZzwOtoGUana
         9kcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V2TSsHVRZv5n6nm4rd17wgB0vrMj5AgJjY7Tq8D4v7E=;
        b=adwVxeAbDLXnDXTATTkWyJO8HmsvdeCIOfmw6u6QHaLOWcCPESHhZgy6WGdhxvRFH/
         uVFE+p+8SZqTh4qghgxQftB65dQNQF0+0SOuCHqktmmG1X7/sCyarMFpWnho8ZoIJzcp
         y1II79s49dY/4vZs1Bg9++mITeWL8Ln8382tBPSvEcgrataBpWw7sAb7yDcmq34najaQ
         KcC1fpbx+L7VxJcdYBTABsz60Q4etT3HRC83Wl1d/Mx6T/f0kD7Gr2nOCLcJ8/koEdUJ
         qVjgI7lqO3ItBbYGApt2s/4nSA4Lr6vYdd7vTPYK3nYtxKyIYk3drnA/Cmm6is/c6V1N
         Cgvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=XFg1V4fZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si14380091ybn.306.2020.06.08.04.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 04:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=XFg1V4fZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiG95-00088I-Vg
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 07:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jiG8o-000878-EG
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 07:40:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jiG8m-0003cc-LD
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 07:40:34 -0400
Received: by mail-wr1-x442.google.com with SMTP id e1so17038857wrt.5
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2TSsHVRZv5n6nm4rd17wgB0vrMj5AgJjY7Tq8D4v7E=;
 b=XFg1V4fZYjjfguvr9MNLuyck1yG+0Hb7wzfa14c2/wyF9unIy2e0ghtwAIqhRhXXU2
 43YKuKn+AcYawMqkdofiH/ykZYphdHN6Z4ZuRGdbVvQSIG5Y+Pdl34P0DODLQhn1tUSf
 pGk2hgUsHSmns/0lNL8jQXbbc0j2fUZXpTwZPhkjidrRCwjWZsrMcvuiB2sEGxH3/TQN
 reExKqBEptWPHiAOOcmgFYAnLHPOEU/d4kBDh/pSRoPL0ZTrtByNfzhwm1pxW4Omwc+o
 P6tXdS6v4k7yI8+7t/aRHiKdjamuNrvSaYy2d4o3BzYPwzu5fkAqDqB+kd732h8R4H53
 RRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2TSsHVRZv5n6nm4rd17wgB0vrMj5AgJjY7Tq8D4v7E=;
 b=rWXlY0JsoUqtWjdVLKbVNQx4XhjVy3G3F0ZqfOUevRxXI8/aBDwYgd+77QyX3SJQpF
 ABrA3UNy31FsPFRj0dMRTLoq+yOVg4QgrOM+6/ymI8pmI/pJKOLY+nTBBje10/8NtFXe
 NPU0k4ZGFkX25pTOLyU+jb7ErNp/388Gmwlo1Tcx838jYYB8EA5Fcqp3GHeVD0NxbweH
 y99AeykUlqCA/j72P3lTY03KS9bwJ6v8EhfEN8EYtsTB1o5debjR+QlS5yxn+6aVCNSN
 AQ4XJyz5QqiIEb1vt6zilqxuRBgtiERaoLsVHnpXoferMYTWWKW3XmRCHRtOlgm3QKwX
 hY6Q==
X-Gm-Message-State: AOAM530Fy5L7Kdipn98jGCjEhCIjRqscvQTHvfXrKEL03czn/vXHYqZ2
 tNwu45qmFaEjbrj2lotc7414aA==
X-Received: by 2002:adf:de84:: with SMTP id w4mr23496358wrl.54.1591616431157; 
 Mon, 08 Jun 2020 04:40:31 -0700 (PDT)
Received: from vanye.hemma.eciton.net
 (cpc92302-cmbg19-2-0-cust304.5-4.cable.virginm.net. [82.1.209.49])
 by smtp.gmail.com with ESMTPSA id y5sm24225932wrs.63.2020.06.08.04.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 04:40:30 -0700 (PDT)
From: Leif Lindholm <leif@nuviainc.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [RFC PATCH 1/3] target/arm: commonalize aarch64 cpu init
Date: Mon,  8 Jun 2020 12:40:26 +0100
Message-Id: <20200608114028.25345-2-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200608114028.25345-1-leif@nuviainc.com>
References: <20200608114028.25345-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fkU+UdulX0GH

Some basic options will be set by all aarch64 platforms.
Break those out into a separate aarch64_cpu_common_init function, which
also takes implementer, partnum, variant, and revision as arguments to
set up MIDR.

Invoke this to remove duplication between a57/a53/a72 init.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu-qom.h |  3 +++
 target/arm/cpu64.c   | 46 ++++++++++++++++++++++++--------------------
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 56395b87f6..48f6303308 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -44,6 +44,9 @@ typedef struct ARMCPUInfo {
 void arm_cpu_register(const ARMCPUInfo *info);
 void aarch64_cpu_register(const ARMCPUInfo *info);
 
+void aarch64_cpu_common_init(Object *obj, uint8_t impl, uint16_t part,
+                             uint8_t var, uint8_t rev);
+
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index cbc5c3868f..79786e034f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -29,6 +29,8 @@
 #include "kvm_arm.h"
 #include "qapi/visitor.h"
 
+#define MIDR_IMPLEMENTER_ARM 0x41
+
 #ifndef CONFIG_USER_ONLY
 static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
@@ -86,11 +88,19 @@ static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-static void aarch64_a57_initfn(Object *obj)
+void aarch64_cpu_common_init(Object *obj, uint8_t impl, uint16_t part,
+                             uint8_t var, uint8_t rev)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+
+    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, impl);
+    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
+    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, part);
+    t = FIELD_DP64(t, MIDR_EL1, VARIANT, var);
+    t = FIELD_DP64(t, MIDR_EL1, REVISION, rev);
+    cpu->midr = t;
 
-    cpu->dtb_compatible = "arm,cortex-a57";
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
@@ -99,8 +109,16 @@ static void aarch64_a57_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
+}
+
+static void aarch64_a57_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    aarch64_cpu_common_init(obj, MIDR_IMPLEMENTER_ARM, 0xd07, 1, 0);
+
+    cpu->dtb_compatible = "arm,cortex-a57";
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
-    cpu->midr = 0x411fd070;
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034070;
     cpu->isar.mvfr0 = 0x10110222;
@@ -143,17 +161,10 @@ static void aarch64_a53_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
+    aarch64_cpu_common_init(obj, MIDR_IMPLEMENTER_ARM, 0xd03, 0, 4);
+
     cpu->dtb_compatible = "arm,cortex-a53";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
-    cpu->midr = 0x410fd034;
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034070;
     cpu->isar.mvfr0 = 0x10110222;
@@ -196,16 +207,9 @@ static void aarch64_a72_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
+    aarch64_cpu_common_init(obj, MIDR_IMPLEMENTER_ARM, 0xd08, 0, 3);
+
     cpu->dtb_compatible = "arm,cortex-a72";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->midr = 0x410fd083;
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034080;
     cpu->isar.mvfr0 = 0x10110222;
-- 
2.20.1

