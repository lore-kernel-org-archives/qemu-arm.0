Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5211885lfh;
        Thu, 2 Jun 2022 15:21:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU51/UyizW05MjPfq5zkcrzxxcTBZS+tD6qm2cjZ0JWHd2AStudVg5X/v+CawjyyPyY1ej
X-Received: by 2002:a05:622a:4295:b0:2f1:d202:8285 with SMTP id cr21-20020a05622a429500b002f1d2028285mr5384594qtb.378.1654208495954;
        Thu, 02 Jun 2022 15:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208495; cv=none;
        d=google.com; s=arc-20160816;
        b=e37HdDSZsnop2kCRwYCCoXmmX44LO2yUb5ZUpv3nzPlC3JMDrFKFm5hraAODtf65+9
         7usun/JEmf+zzyC+ZRSQlSgIkNVO21s6tSWNEULZe0RxyAIQ20f7pBfUYqs6ltrc/b+J
         ZNwX9L4OnXycspQP/ezgNADXbCqhZGPLg78ZOPKvkhMEzqkoVbnpM3fcOgyBtecx34ka
         H0kBeyYAT50DApYvXlXJfHi8fLDCtKDTuMc6crXpusUxFZ7TOCBKFG8UaVYudA6KOIKT
         Ik/L7L+hXivOxE2YXknC843ltLKMpf8SGt5pwvGTPhKB4L/XYM4LAG0OtfZG9xwDStr6
         j64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OfdXIFbJWIlpAFLLIFA1bOTv8f8qnwiGd4/gzGRW5Ho=;
        b=zr5QhRptXcMbJIa1KO1LL+h1rZg9fQ37I69H3Zypov0hhNJ6to/qj5cpIiP7iLi1iX
         IETNB+uDzeJau/yE09XhVyVJ3xpygTQCS5gUhKl7PYI5ADvhrKeI6tG9d3iu3xfvB0jG
         C3FMNex2Wm/c+stItboRz97jJKclDdC1cuoKMWc+ShbIwy31FmT8inSv610rZ9AJ17R/
         O3wGIb7Crb5dvMrtkur3va1QiLjytnl8LckeOSrXUYZBgRkgqazwv9XijI0FntdCECKr
         UM6BL+YHXH3F62Y9BmSnTo5mnHIevp5wkHtKl8alcDFirbfgwgtbloFcfmWIlOU5dj9B
         RrcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/2QUKzL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u32-20020a05622a19a000b00304b655d32bsi2705359qtc.154.2022.06.02.15.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/2QUKzL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtCB-00054w-Bg
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh4-0004zq-Tv
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:26 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh1-0008Tv-8p
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:26 -0400
Received: by mail-pj1-x1034.google.com with SMTP id a10so6007407pju.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OfdXIFbJWIlpAFLLIFA1bOTv8f8qnwiGd4/gzGRW5Ho=;
 b=S/2QUKzLpj7rQDmKwrBHIVqkBuvrWTiQsQ3iikuA9v7O9WXUcL3xbMZfiDuar06ZaN
 BY9oxBPtP5rMY1+m2R7cntIQVZOBhjGjl7QEom8CP5SJkIWGZwbVbGsEcAMRCX1e7W7C
 RyOKVJQltDJ0FKnOEgXDk5pyxcKN4TL98ub0sTKQGnh8qSvG4guQRnOT4Jqovj3by+v2
 6TJAFeTR9Ovksch4IK31gDhDldc9IMnmYr3QXRoNBw1vAk+D/NMv21138NJzqiy4Ra+a
 bM5cB73OLCvBmBf0luPmnBGxcA4RDwQAn/K00zAZKWaslgn9+OQcOK7U2Tp5uCF/JjS8
 wLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OfdXIFbJWIlpAFLLIFA1bOTv8f8qnwiGd4/gzGRW5Ho=;
 b=IPNQv6jY+FSDFIpWL9frOB7qWgGOcyz2QwrywPzHtYnqYpojdgm3kd32ROAFvt4JrK
 jXY4Oa9bcsHRNaT5/8E/j8dHRIZvgFWD/MBVXf0lW6EybEr+Cnxa4kvEIXvN3cjDAQjR
 LGhgM8w2ZsNd1re0JJ2RtsWYlDCccpQXuK/vlhhr4KZWfHAUVp78uqvKksNYWaJ5PsqF
 +riLtqc8HnjkKxE01IMXrNXk1GsTMNgy2smKjaNVT27cvFvPQkhDUG30nozvt/w3rTib
 k5MUiNGk4krtunJV4olLClZ/AwKA8mbYvlGKe6a8Sao+c1+gZeN5nrAfMHlUqsLvL4ce
 F69Q==
X-Gm-Message-State: AOAM5330RsHXyFvrxtFJDExWuZnTKa3hE6KNRt9oKppXeIekl5WvNcb2
 1O4rOedtR+3XpqfH99dP5z5c8DlH48QtLg==
X-Received: by 2002:a17:902:ccc4:b0:156:5d37:b42f with SMTP id
 z4-20020a170902ccc400b001565d37b42fmr7001379ple.157.1654206562436; 
 Thu, 02 Jun 2022 14:49:22 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 32/71] target/arm: Create ARMVQMap
Date: Thu,  2 Jun 2022 14:48:14 -0700
Message-Id: <20220602214853.496211-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cxZPNWUO/LXX

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
index b65e370b70..9408d36b8a 100644
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
index 5328676deb..2e7669180f 100644
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
index 28001643c6..0ac9f0b802 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -818,7 +818,7 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
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

