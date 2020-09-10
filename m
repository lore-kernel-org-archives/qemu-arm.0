Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1514461lfq;
        Thu, 10 Sep 2020 10:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFXHEJvA/jmhRzEbJICIpn2B5/CSBTsHvoEx0eGj154wChJLhliQVCzM5ETnmuS+2SjLCO
X-Received: by 2002:a25:2d59:: with SMTP id s25mr13744452ybe.317.1599759558552;
        Thu, 10 Sep 2020 10:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599759558; cv=none;
        d=google.com; s=arc-20160816;
        b=nMTyKItrL1qFRC/SOiMka8sCK+JT+z3yGfx2Gtg4WBfNSbMa2dboeoRrHiM5GTVSdz
         beHrHUQVElMLRtf60uStTmQrNawyeHOh150poCbqBa06Sl+EtVTQfnuqtNxUrpjW1IJM
         gAohqRWsfEYu4DAQZqt5jDAet3Hzu+K4ltI9H87CFt+BqUdeLIeuF/l66+HSd2VphQHV
         KNsqAenZxwICWoHxprRBINKtr+Y7412MEZDReRusglapCStd8v/9ldw6AUC37iNuljJg
         G114j5b5/FU8kjIvaVSs4WSSZcnfw1Eve+vojZ06kT/ucRq6dw+fT5rt7uEGvvfmmyMk
         ywqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yrb435SyHhRGm1EucboctVOMgvMxS5WyjB6BP+Kvcd0=;
        b=xty5skcVzNmPkMLihVJQqwDi4uCFcDR7p7vQseEt/wOPuFE34E4o37Fl1Ak+bFPBB2
         VpbWvLiaQ2ewjXSg4hxo7/Vl4/keSAGBHfj2Bepc3d+lYoQeIgiL2CsSMkvcjAa4+mih
         GDBU/GLT+is+S4+POSXeE/4GNk9Rl/pWxkNMwWo7CxpIhjTE0wFHaiOJ+UoGt7WZbSUS
         YDe+foWWUMKQ1w6dU+U2NL6597UdeIB8w9uwml82zkm1R/enEO2Wa2yA9xTrX89QWJms
         ADCOeAAsQ6HGdFo+dadXhiolMAp46l+4Enhj0YB0zbC+1PtqCVkzKK0uJaBz6uZqpTca
         Bx7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aRJZoQEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si6518628ybf.6.2020.09.10.10.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 10:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aRJZoQEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGQXV-0003uU-Sw
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 13:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXL-0003sx-FA
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:39:07 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXH-0002nK-Em
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:39:06 -0400
Received: by mail-wr1-x444.google.com with SMTP id g4so7728251wrs.5
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yrb435SyHhRGm1EucboctVOMgvMxS5WyjB6BP+Kvcd0=;
 b=aRJZoQECV3V+9Om8kMKrD61gHhCIOwhhv4/7pKpind93deQArKPxJZHSDyByWCwL2m
 Z1kf8ohN3bJnOw+9sDlIJDZsYgLAFH8bVQN+Qc2VxkGB61iaEo2xmNE+uJkytJwr/qDC
 C/1YDTVAdG7JhyMcuCeOa3C1HuZmd71WTFFHkEd/6HOHRaSakLgz/p14TTxOTkdBNduJ
 LmjNnKMGeb5owvIhtzZHu5sL6SpURvkhx9kCidu51+1ox0IFE+kZCsE0l7G0uCtaPtY0
 Bdn8bUiVWJ3HsXFmm8vLd1/VpfR4UcY6nQKK+UROroeC9WkAw9hkyZiF+za2D0DxZRcg
 ZiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yrb435SyHhRGm1EucboctVOMgvMxS5WyjB6BP+Kvcd0=;
 b=QDzgOYglAH1hp+xm3zb8bmfPJ/AouzSD6RgSClhvmTL5zr+RVmrjyAdsWqk7bvM/cO
 U+6XkC4kxIOPY+y6ubvBqpcBCxUlsV8R45U5IGE9orcg3kQlQhFFkWIJO8aJ3l33qT/t
 UrcNQ/KMG3u3wyiv1iNhNGtvWf+pXURhZZiUqAu45tVZH3tjmUIkWr/cpdM/0/UPMbTp
 3VRpa+pDi45Bc+Ye68EbhEwl3ZyAABJ4kqwC/KTwkBQcre9qA1CTIPbVrMjKVT5mOlDa
 5LyE7aglmYhCSrQBBFtqVs23ZEIeK3SalfRsASPFg0/rMKziZD5lFDdXzOe2X4AE0pPR
 jjAg==
X-Gm-Message-State: AOAM533SMvUGArBJEez95ZepmGoLOsVmB0jF8k23pcn3XBawC1Ph/5CB
 ylC2/qObCwsUjylQYU5WIopEkIRxNipcbojn
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr9983889wrt.32.1599759541467; 
 Thu, 10 Sep 2020 10:39:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q186sm4603128wma.45.2020.09.10.10.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:39:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/arm: Replace ARM_FEATURE_PXN with ID_MMFR0.VMSA
 check
Date: Thu, 10 Sep 2020 18:38:51 +0100
Message-Id: <20200910173855.4068-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910173855.4068-1-peter.maydell@linaro.org>
References: <20200910173855.4068-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TwPPzeGt/9ul

The ARM_FEATURE_PXN bit indicates whether the CPU supports the PXN
bit in short-descriptor translation table format descriptors.  This
is indicated by ID_MMFR0.VMSA being at least 0b0100.  Replace the
feature bit with an ID register check, in line with our preference
for ID register checks over feature bits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 15 ++++++++++++++-
 target/arm/cpu.c    |  1 -
 target/arm/helper.c |  5 +++--
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a1c7d8ebae5..b7c2615b2fe 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1775,6 +1775,15 @@ FIELD(ID_ISAR6, FHM, 8, 4)
 FIELD(ID_ISAR6, SB, 12, 4)
 FIELD(ID_ISAR6, SPECRES, 16, 4)
 
+FIELD(ID_MMFR0, VMSA, 0, 4)
+FIELD(ID_MMFR0, PMSA, 4, 4)
+FIELD(ID_MMFR0, OUTERSHR, 8, 4)
+FIELD(ID_MMFR0, SHARELVL, 12, 4)
+FIELD(ID_MMFR0, TCM, 16, 4)
+FIELD(ID_MMFR0, AUXREG, 20, 4)
+FIELD(ID_MMFR0, FCSE, 24, 4)
+FIELD(ID_MMFR0, INNERSHR, 28, 4)
+
 FIELD(ID_MMFR3, CMAINTVA, 0, 4)
 FIELD(ID_MMFR3, CMAINTSW, 4, 4)
 FIELD(ID_MMFR3, BPMAINT, 8, 4)
@@ -1952,7 +1961,6 @@ enum arm_features {
     ARM_FEATURE_CACHE_DIRTY_REG, /* 1136/1176 cache dirty status register */
     ARM_FEATURE_CACHE_BLOCK_OPS, /* v6 optional cache block operations */
     ARM_FEATURE_MPIDR, /* has cp15 MPIDR */
-    ARM_FEATURE_PXN, /* has Privileged Execute Never bit */
     ARM_FEATURE_LPAE, /* has Large Physical Address Extension */
     ARM_FEATURE_V8,
     ARM_FEATURE_AARCH64, /* supports 64 bit mode */
@@ -3618,6 +3626,11 @@ static inline bool isar_feature_aa32_vminmaxnm(const ARMISARegisters *id)
     return FIELD_EX32(id->mvfr2, MVFR2, FPMISC) >= 4;
 }
 
+static inline bool isar_feature_aa32_pxn(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_mmfr0, ID_MMFR0, VMSA) >= 4;
+}
+
 static inline bool isar_feature_aa32_pan(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_mmfr3, ID_MMFR3, PAN) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c179e0752da..c5e86ce50af 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1589,7 +1589,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
     if (arm_feature(env, ARM_FEATURE_LPAE)) {
         set_feature(env, ARM_FEATURE_V7MP);
-        set_feature(env, ARM_FEATURE_PXN);
     }
     if (arm_feature(env, ARM_FEATURE_CBAR_RO)) {
         set_feature(env, ARM_FEATURE_CBAR);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 44d666627a8..ef6eaf6450f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10537,6 +10537,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              target_ulong *page_size, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
+    ARMCPU *cpu = env_archcpu(env);
     int level = 1;
     uint32_t table;
     uint32_t desc;
@@ -10563,7 +10564,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         goto do_fault;
     }
     type = (desc & 3);
-    if (type == 0 || (type == 3 && !arm_feature(env, ARM_FEATURE_PXN))) {
+    if (type == 0 || (type == 3 && !cpu_isar_feature(aa32_pxn, cpu))) {
         /* Section translation fault, or attempt to use the encoding
          * which is Reserved on implementations without PXN.
          */
@@ -10605,7 +10606,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         pxn = desc & 1;
         ns = extract32(desc, 19, 1);
     } else {
-        if (arm_feature(env, ARM_FEATURE_PXN)) {
+        if (cpu_isar_feature(aa32_pxn, cpu)) {
             pxn = (desc >> 2) & 1;
         }
         ns = extract32(desc, 3, 1);
-- 
2.20.1

