Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2419528lfb;
        Tue, 7 Jun 2022 14:12:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtPt5ZOAMUNayFgMCPRCpQAsgWQdzpVXVwZXZ7ggi3SNV5DWc6CdgHF1G4MbS6vjiPxDwn
X-Received: by 2002:a05:6214:1948:b0:464:4c88:dafa with SMTP id q8-20020a056214194800b004644c88dafamr38012242qvk.12.1654636348394;
        Tue, 07 Jun 2022 14:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654636348; cv=none;
        d=google.com; s=arc-20160816;
        b=qRdMSNq7HSic13uuqQ7diY3rtzPxQ1dAZtMprPE4lR6TZfXprFehS2yyKzrgm0qseE
         FCoW5VYI+e2u9LoX5mqNlNA4A5Q1bjOY7Tr0EdoaaW3+RVgacPKfxlncgHan3cAA7avH
         FAW4mRhKLjv6wvnt4RISvbadH+2xEyxZ+hR8qNV/MdIcvUv+zI8HoTLzJgOWkzRMoAdE
         ueweRnF6i4IqIFPo2qGZbQfWCNlu1sxqvxEqOOyTA5BGgV2Dk6thjBnPRCXNDBtsccAc
         oDqZPJPK92k18PAPT4mGygzkzCV36I/xP+hb4S8WkQwuacJXr2kRc4bPVgblQ03FeVLB
         85hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1+sOff0+QrylHPJptcCOIS0ShDDTD4Sb4O393k+bbFc=;
        b=SXLDXqdK/15s1vhCKEROcMBTPLmmlovC7/R5Z4uPzZTumVHyqZsq/vRfXlsQ0d2w3D
         CBFnlrRbzcgeBE6Bv0OjEqvlstT7UbMwKAQqGXseY3ifSln+B2CdUFu0M1bSXkP3X9Ao
         kBEbYO/SAMnPID8m/8JMr8lr1A1ATCYXTKnsHmjI84IRrOcgejh++3dhYvpNAqLEmFwK
         ACBO6O2iEy/IkyRT/Uv1MMINnvHdnb/xnarRQ2JfqBFiWrcT2lQGUHxQFldxnZbsD+/w
         DviUkZoG8+VyRROL+ametGrkIe7IpgWvSsyWPi8z7kLhmSRPIIi31ohUhJI6dgIeiqSn
         y4LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sh1z2Z8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020ac858d0000000b00304e82703dcsi5018762qta.519.2022.06.07.14.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sh1z2Z8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygV1-0000JC-Pw
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfta-00009k-KR
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftS-0007RZ-L9
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:46 -0400
Received: by mail-pj1-x1031.google.com with SMTP id a10so16651399pju.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1+sOff0+QrylHPJptcCOIS0ShDDTD4Sb4O393k+bbFc=;
 b=Sh1z2Z8dy75CpmxSz/Cm2fbWdPPDzFPOTSXp0hu6LbszyPtiEIxPvkvZClnI/1d4Ul
 s/VrsIhL0y4kmJDiKgeglJs8HfLSSl13Mv7ScB0B0XHuSy5Ij2XPcE9G66jM3MEIDcCn
 F/rkb1EqsbamZQIxmZMUBiEtMdkZkYt0bcyMy4MwNj5HYmGzQdgEq7oSfHGw8ya2ZKaD
 s8+X3I3Xos1qGVMvFnnoe9UeI2tqnQVKoaU7lmdqoPS6hAXf6+U75z0WLFCRm7SjsBI/
 k7XP+MrTXZe6YYpnNosq0LtXEHDR1PpqKlDiRzeyjYHbO5K0+jZSqnVnL+IpyIrSM8lo
 +a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+sOff0+QrylHPJptcCOIS0ShDDTD4Sb4O393k+bbFc=;
 b=zYVXYyqrWbXj1D9+32r2LTghMUUgfyL8HWd2ieGXvVgIolPzFf8x0ZLM3Vx4k1qzv8
 RRJWozuPLDcpjFLdRPSKtCZePvFlb8Y0pms8EO/iL8rVDH2QwuLRbHh/TiMFNWiys2fA
 uAOmxJo4q6Vh9vftNmeW88Y1P85vXBOgg181TM7HLKqKyyPp/TrtTBOU8Z3kx9su6u4A
 /Nd/uf/0Zkqk7k2XRlE/MXsLWL8zFnf03J+8c5V/dlgQohl/0VT5CnaucsRT/FpCEs7X
 b95rdQ3e6oa3gVIETACdD7+hDQUGSeWa3fAhwSftkC4o3fg4YPXghKV7kUPd2L75N7HO
 y7FQ==
X-Gm-Message-State: AOAM530Cc9QrN4fW38Rg1/vZ/OQ1jFWZMlbCazWCN1E7hL2vbDuLzK+b
 I3C0TBAXqb+YgMpLq+rDp+PvxUqM0sfG2g==
X-Received: by 2002:a17:902:e886:b0:163:f3e5:b3b9 with SMTP id
 w6-20020a170902e88600b00163f3e5b3b9mr30442727plg.80.1654634017274; 
 Tue, 07 Jun 2022 13:33:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 32/71] target/arm: Create ARMVQMap
Date: Tue,  7 Jun 2022 13:32:27 -0700
Message-Id: <20220607203306.657998-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: y+wMBWeR3xjr

Pull the three sve_vq_* values into a structure.
This will be reused for SME.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 29 ++++++++++++++---------------
 target/arm/cpu64.c  | 22 +++++++++++-----------
 target/arm/helper.c |  2 +-
 target/arm/kvm64.c  |  2 +-
 4 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e7ec03a8a7..4e86d143c8 100644
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
index e18f585fa7..0a2f4f3170 100644
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
@@ -973,7 +973,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-    cpu->sve_vq_supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
+    cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
@@ -1022,7 +1022,7 @@ static void aarch64_a64fx_initfn(Object *obj)
 
     /* The A64FX supports only 128, 256 and 512 bit vector lengths */
     aarch64_add_sve_properties(obj);
-    cpu->sve_vq_supported = (1 << 0)  /* 128bit */
+    cpu->sve_vq.supported = (1 << 0)  /* 128bit */
                           | (1 << 1)  /* 256bit */
                           | (1 << 3); /* 512bit */
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e065a1deb8..e3f3e4dfc2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6291,7 +6291,7 @@ uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
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

