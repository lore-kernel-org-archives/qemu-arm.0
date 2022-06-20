Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp603422lft;
        Mon, 20 Jun 2022 11:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttgNAiS1HwKHi4xYsjgX6FPptRhK5gSxxRbPsL8gR1ZlgZCFG3chZWwNya6awcfs4Y+vcd
X-Received: by 2002:ad4:5944:0:b0:470:4083:3962 with SMTP id eo4-20020ad45944000000b0047040833962mr5842329qvb.107.1655748297615;
        Mon, 20 Jun 2022 11:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748297; cv=none;
        d=google.com; s=arc-20160816;
        b=jSIBMMvLJ0hjRsIO+8/d19FSeL8lJYYY1ear4/nzQBKWwg+ckxPuk4Y0MLYmn4qVH0
         peR5XHjcYVGI8hCu/pdGJcHxU/elnTQTyv+GIe+C9DBSMb2QltMUvW51EuQr0+5biZ+V
         K1Q5Xgxl8/SIUjvMnol0TD7ZsEKexxo91Jxz9JktFh2GhJ4BU8Q71keQ1tcoSjDZ58xP
         P86pHztH4kWIUCcyvv8M5+XI+GbpuAozOLNDxxHWZBOsBILkMAfFdcGFC/gAIjLEZgIq
         tpBpI5GX+xnXuZle7YJOx1MZEeYXckfmMtqDj62Knwfw6wNFmuL67a4siODw3hZGAe+1
         z8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OTwSql157RtQxY3jED1sEe12wrHBwQT/BOMQSkxCQmU=;
        b=UXYXelPFhadgbvJU83jeFzxh55KiKaIkMHnCtbIwDhjNX1VBojrpICbuizAlAns7be
         /M95vZRG0Tb0IbqndPAdYaO6O1x8xDlUrXVDyV69Y60IVWauH4pxn1EoFEpdZGIoMoN5
         262Ul6IDcHpvtSOi3K+Iy4auIOriuNV2spK4D6QFhcrHrZjy2i4z0wVq1WSNxC1WvOJn
         1DnHNEZ/ZV7RYQfhXyaT1rFTT48DhO5Lqz0OTRt+ISRZNU+HGeAWobQNjH1v8vQWx1N9
         sw98JYhaHsIf1GAxrXPO1O5w0bPzqSkGG94zHH1EYFRsfYiHVlRRtCjtIU7kvwsPVg0n
         mQvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sb0i2eus;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18-20020a05620a451200b006a7609f54f7si8574864qkp.14.2022.06.20.11.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sb0i2eus;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Llg-0002oT-Ue
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZz-0005oz-Kz
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:51 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZw-0001Q9-R7
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:50 -0400
Received: by mail-pg1-x536.google.com with SMTP id f65so10886903pgc.7
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTwSql157RtQxY3jED1sEe12wrHBwQT/BOMQSkxCQmU=;
 b=Sb0i2euseFnCHgeYLTgCgv/WNeCJxTt7kesAF6FkVTWH9cIGQRIuH9tXb/hpDc4vfo
 Up/5YPGc4FZ5siunExOGUMYsjnTpVRiMVEwfQP2RtyVuUWJwz4KZOOQ0WAcqqFZIeoO7
 nbF3kIhQ8DGgWzebtAvHXLzt+5Sd0sxB2jomFNStmd3mbLD7VbA/6iz2NLtwvAH6JKXV
 pSs157JrDMe0g8diLyVFIUk/TLNcA7JF6jZjIcWhWj5tLJrxc3Slf+6K/Y9tnSMX/bQK
 srecx2FQQxle+2ZcW5q10sc7Os0B6XWRzl5C+lrncoNTymrHpr4TE632qa3TKHPmlPcM
 RKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTwSql157RtQxY3jED1sEe12wrHBwQT/BOMQSkxCQmU=;
 b=txdXvlohNsNpMOakUPUWUrk7XEjB4psjXK+ah/xEGW3DLSr2xjc7NfMKKxhJ3I2AIq
 2TaBVRSmp2vXG+nb4HcJ+IfyQY4zv42iFj1bdldtPqYwr0AbDFFsPu0zcFftKsY7qMQ4
 EcIdaKvNE1IF/Ij+M1sjJ3K0g2t+15j0d/V/AIBIce0lZSRfSerwhxkN/AI5X8XDdRNa
 3H580gRtGalN5vH6KYsjcmiDKCcS+ONt6rlsHAKRZWR2pfknVSQGW9CKKxP+sNP0Wkdv
 gCp/1q0PZ5dd7nikKqKhFOtQibiuEMSDBVz995S9OSgt2FKik78Kritpwx1Av3dcqUUG
 Avaw==
X-Gm-Message-State: AJIora/TEuavUIxrRhXgUdGnSOoYQYaVB50VWIZ2/fzaBdd+s5VUQ3nq
 KPkcdP2gLLxUykunIgURW57HS8Qtd2Nc0A==
X-Received: by 2002:a63:d806:0:b0:408:9e5d:68b9 with SMTP id
 b6-20020a63d806000000b004089e5d68b9mr22051662pgh.22.1655747567390; 
 Mon, 20 Jun 2022 10:52:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 12/51] target/arm: Create ARMVQMap
Date: Mon, 20 Jun 2022 10:51:56 -0700
Message-Id: <20220620175235.60881-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: bPYi7O4dJWsz

Pull the three sve_vq_* values into a structure.
This will be reused for SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 29 ++++++++++++++---------------
 target/arm/cpu64.c  | 22 +++++++++++-----------
 target/arm/helper.c |  2 +-
 target/arm/kvm64.c  |  2 +-
 4 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2e049291da..ece720a757 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -793,6 +793,19 @@ typedef enum ARMPSCIState {
 
 typedef struct ARMISARegisters ARMISARegisters;
 
+/*
+ * In map, each set bit is a supported vector length of (bit-number + 1) * 16
+ * bytes, i.e. each bit number + 1 is the vector length in quadwords.
+ *
+ * While processing properties during initialization, corresponding init bits
+ * are set for bits in sve_vq_map that have been set by properties.
+ *
+ * Bits set in supported represent valid vector lengths for the CPU type.
+ */
+typedef struct {
+    uint32_t map, init, supported;
+} ARMVQMap;
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
@@ -1041,21 +1054,7 @@ struct ArchCPU {
     uint32_t sve_default_vq;
 #endif
 
-    /*
-     * In sve_vq_map each set bit is a supported vector length of
-     * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
-     * length in quadwords.
-     *
-     * While processing properties during initialization, corresponding
-     * sve_vq_init bits are set for bits in sve_vq_map that have been
-     * set by properties.
-     *
-     * Bits set in sve_vq_supported represent valid vector lengths for
-     * the CPU type.
-     */
-    uint32_t sve_vq_map;
-    uint32_t sve_vq_init;
-    uint32_t sve_vq_supported;
+    ARMVQMap sve_vq;
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a46e40f4f2..cadc401c7e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -355,8 +355,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * any of the above.  Finally, if SVE is not disabled, then at least one
      * vector length must be enabled.
      */
-    uint32_t vq_map = cpu->sve_vq_map;
-    uint32_t vq_init = cpu->sve_vq_init;
+    uint32_t vq_map = cpu->sve_vq.map;
+    uint32_t vq_init = cpu->sve_vq.init;
     uint32_t vq_supported;
     uint32_t vq_mask = 0;
     uint32_t tmp, vq, max_vq = 0;
@@ -369,14 +369,14 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      */
     if (kvm_enabled()) {
         if (kvm_arm_sve_supported()) {
-            cpu->sve_vq_supported = kvm_arm_sve_get_vls(CPU(cpu));
-            vq_supported = cpu->sve_vq_supported;
+            cpu->sve_vq.supported = kvm_arm_sve_get_vls(CPU(cpu));
+            vq_supported = cpu->sve_vq.supported;
         } else {
             assert(!cpu_isar_feature(aa64_sve, cpu));
             vq_supported = 0;
         }
     } else {
-        vq_supported = cpu->sve_vq_supported;
+        vq_supported = cpu->sve_vq.supported;
     }
 
     /*
@@ -534,7 +534,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
-    cpu->sve_vq_map = vq_map;
+    cpu->sve_vq.map = vq_map;
 }
 
 static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
@@ -595,7 +595,7 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     if (!cpu_isar_feature(aa64_sve, cpu)) {
         value = false;
     } else {
-        value = extract32(cpu->sve_vq_map, vq - 1, 1);
+        value = extract32(cpu->sve_vq.map, vq - 1, 1);
     }
     visit_type_bool(v, name, &value, errp);
 }
@@ -611,8 +611,8 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    cpu->sve_vq_map = deposit32(cpu->sve_vq_map, vq - 1, 1, value);
-    cpu->sve_vq_init |= 1 << (vq - 1);
+    cpu->sve_vq.map = deposit32(cpu->sve_vq.map, vq - 1, 1, value);
+    cpu->sve_vq.init |= 1 << (vq - 1);
 }
 
 static bool cpu_arm_get_sve(Object *obj, Error **errp)
@@ -974,7 +974,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-    cpu->sve_vq_supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
+    cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
@@ -1023,7 +1023,7 @@ static void aarch64_a64fx_initfn(Object *obj)
 
     /* The A64FX supports only 128, 256 and 512 bit vector lengths */
     aarch64_add_sve_properties(obj);
-    cpu->sve_vq_supported = (1 << 0)  /* 128bit */
+    cpu->sve_vq.supported = (1 << 0)  /* 128bit */
                           | (1 << 1)  /* 256bit */
                           | (1 << 3); /* 512bit */
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 88d96f7991..a80ca461e5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6287,7 +6287,7 @@ uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
         len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    len = 31 - clz32(cpu->sve_vq_map & MAKE_64BIT_MASK(0, len + 1));
+    len = 31 - clz32(cpu->sve_vq.map & MAKE_64BIT_MASK(0, len + 1));
     return len;
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ff8f65da22..d16d4ea250 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -820,7 +820,7 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
 static int kvm_arm_sve_set_vls(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq_map };
+    uint64_t vls[KVM_ARM64_SVE_VLS_WORDS] = { cpu->sve_vq.map };
     struct kvm_one_reg reg = {
         .id = KVM_REG_ARM64_SVE_VLS,
         .addr = (uint64_t)&vls[0],
-- 
2.34.1

