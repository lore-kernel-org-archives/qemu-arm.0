Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2795580lfq;
        Mon, 14 Sep 2020 20:12:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyycBUYrrUZzkOaNconDitvFN/wX9tuglrfxAwTFnRVFoqjj6IElUnUj44J99jUjC/v9biW
X-Received: by 2002:a25:cc5:: with SMTP id 188mr23352610ybm.326.1600139546162;
        Mon, 14 Sep 2020 20:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600139546; cv=none;
        d=google.com; s=arc-20160816;
        b=mcfa12o9OS3ygIS/EudVoY0+1EbQb+8pMWQNCbsVOQv+MSJJ2e+04ehyEwurbQSrPF
         Z5aeCiaXpVIUgDg8hXbomFqO1gDRP/MA34mYZtX5floLdz1NcqksiZ1Zs8N5kdp9A3Wf
         bsb9gZ5xn2jya45gfKhpZZj2sM0su8NqwFur+ejdlH2kRAsRf05Xkiu/vNGu5YSIjjAy
         qL1WlIioQfHZsMtH0Jw4DqQDnd/+CtkV3fehJThmcCM7EpwBQ8qIeTMBWjKzm3mSD9DD
         AnWGNxY++6dJGHBSOtKr7RtMIJrhPrAVvPu0JplLGsdhbSVgJNYOC6uSdvgiohdmx2Iv
         fYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xNqukfzIQSiMb442cY3crlBVIUwKZyVTuTOnolbR0sU=;
        b=hMTRhBQwTcnQVU4HlJrDXK6ABrBL5KFFiPDL6QL2CSJdEqShNlL9NlA5dHe+UjrXDb
         fbklwqRiNeajm6BL+n2t+r/iy5GiTLM6u155yPdusq87oaMsa53x9cx8lDgwqdXj2Oeq
         M/P2Hq0ALHSdbBVq83tbXCHIPjlngLCqJSiwDOV71Q3zuiAiErXo2P9amy1aVXDJpC9K
         fT6sA/kOK8zn1/2OMacHa6WMSQacQ562xwlwj9ZEFdXNXI5AjDCSNcCNsCh/QdspiSW7
         0GUHPa70uxMQj8wv0If4sCKngx6PYVaA1cXQijb7TS7/skMejI5RfAvZr46fGI8iSCyr
         PD/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OCmgSLMm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si11943281ybn.262.2020.09.14.20.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 20:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OCmgSLMm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI1OL-0000O3-FW
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 23:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1O8-0000Fp-1f
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:12 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1O4-0001gl-Vj
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:11 -0400
Received: by mail-pf1-x442.google.com with SMTP id d6so1099623pfn.9
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2020 20:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xNqukfzIQSiMb442cY3crlBVIUwKZyVTuTOnolbR0sU=;
 b=OCmgSLMme+s3Y+HIx1kiEPyUmzxcpN18WkeodgtUOlI1SlDFJTkS6loZPWPZm9Nffd
 tdM6mEc3rJmBr17yVlI/S0FEMPCqa8ddL8+YDgTEWyS2Q6dqdhYWk6VrzqX0t6DMmJYs
 US5HvvdR/VjbjSYH+e1MIvZWFuftRXnbKiWCV6OtJlHKG4fmm66xmmSClNXkt4X0Km2B
 UcdkEyyyEtN3YH0CxkK1aQwVuNO8y+nAtvjP26pEdifPATMsxjwuDwf8/59bIKhWlGEu
 CGBrdT3e7UD1bG5jWGTBsMKcRAq9o5eWAat9cb1kEFsqb33y9z+IreF8Q6G8eY6Dtj0J
 q/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xNqukfzIQSiMb442cY3crlBVIUwKZyVTuTOnolbR0sU=;
 b=E9kCrZVLqSqnzz852FubzkBlgW5neh8fF+UwFrJrd8axkxLsdLvDBcjIb700LbPjqq
 d2FDC0ERdbo+Sc20cZe1FXTsOvzAzzSZSPCSD8GqttFlLBSVyGPy864WRiMP5e9awQmy
 xss0fCAUiwYOhu0oxWSfIF7GAQHbOjfbsREYTTYlxFo0Gr4bEJqonK9N7F6wTRunduwJ
 mHdSQ3V4si6xMbjfpC0PphwGaYlIUhlORg9dmwTI4/fGBCZsr4ai2+nyyN3shVSlicJM
 AuPjYCb80jwv048NOCTijVoXYdMavXja1JbsvcsIY0rDj/f71LOWmV7xZ2E/TsDGuNfi
 WNPg==
X-Gm-Message-State: AOAM533uHx0+QfoHqwDuvHmirAllOouQmzixJlS/BcwKY3lSkHODWLJ+
 qheT4ZWOBwDQ09C4OmYd0o+3
X-Received: by 2002:a62:fcc1:: with SMTP id
 e184mr16255264pfh.152.1600139527685; 
 Mon, 14 Sep 2020 20:12:07 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id g23sm11551776pfh.133.2020.09.14.20.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:12:07 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v3 03/12] target/arm/cpu: spe: Add an option to turn on/off
 vSPE support
Date: Tue, 15 Sep 2020 03:11:39 +0000
Message-Id: <90fec9ff0da7595f52caccf052c019d9359c8724.1600135462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600135462.git.haibo.xu@linaro.org>
References: <cover.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x442.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: avzxyfupdGR7

Adds a spe=[on/off] option to enable/disable vSPE support in
guest vCPU.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/cpu.c   |  6 ++++++
 target/arm/cpu.h   | 13 ++++++++++++
 target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c179e0752d..f211958eaa 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1310,6 +1310,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+
+        arm_cpu_spe_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 }
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a1c7d8ebae..baf2bbcee8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -24,6 +24,7 @@
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "qapi/qapi-types-common.h"
 
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
@@ -196,9 +197,11 @@ typedef struct {
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -829,6 +832,8 @@ struct ARMCPU {
     bool has_el3;
     /* CPU has PMU (Performance Monitor Unit) */
     bool has_pmu;
+    /* CPU has SPE (Statistical Profiling Extension) */
+    OnOffAuto has_spe;
     /* CPU has VFP */
     bool has_vfp;
     /* CPU has Neon */
@@ -3869,6 +3874,14 @@ static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
+/*
+ * Currently we don't differentiate between the ARMv8.2-SPE and ARMv8.3-SPE.
+ */
+static inline bool isar_feature_aa64_spe(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMSVER) != 0;
+}
+
 static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3c2b3d9599..4997c4a3c0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -572,6 +572,55 @@ void aarch64_add_sve_properties(Object *obj)
     }
 }
 
+void arm_cpu_spe_finalize(ARMCPU *cpu, Error **errp)
+{
+    uint64_t t;
+    uint32_t value = 0;
+
+    if (cpu->has_spe == ON_OFF_AUTO_AUTO) {
+        if (kvm_enabled() && kvm_arm_spe_supported()) {
+            cpu->has_spe = ON_OFF_AUTO_ON;
+        } else {
+            cpu->has_spe = ON_OFF_AUTO_OFF;
+        }
+    } else if (cpu->has_spe == ON_OFF_AUTO_ON) {
+        if (!kvm_enabled() || !kvm_arm_spe_supported()) {
+            error_setg(errp, "'spe' cannot be enabled on this host");
+            return;
+        }
+    }
+
+    /*
+     * According to the ARM ARM, the ID_AA64DFR0[PMSVER] currently
+     * support 3 values:
+     *
+     * 0b0000: SPE not implemented
+     * 0b0001: ARMv8.2-SPE implemented
+     * 0b0010: ARMv8.3-SPE implemented
+     *
+     * But the kernel KVM API didn't expose all these 3 values, and
+     * we can only get whether the SPE feature is supported or not.
+     * So here we just set the PMSVER to 1 if this feature was supported.
+     */
+    if (cpu->has_spe == ON_OFF_AUTO_ON) {
+        value = 1;
+    }
+
+    t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, PMSVER, value);
+    cpu->isar.id_aa64dfr0 = t;
+}
+
+static bool arm_spe_get(Object *obj, Error **errp)
+{
+    return ARM_CPU(obj)->has_spe != ON_OFF_AUTO_OFF;
+}
+
+static void arm_spe_set(Object *obj, bool value, Error **errp)
+{
+    ARM_CPU(obj)->has_spe = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -721,6 +770,9 @@ static void aarch64_max_initfn(Object *obj)
     aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
+
+    cpu->has_spe = ON_OFF_AUTO_AUTO;
+    object_property_add_bool(obj, "spe", arm_spe_get, arm_spe_set);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-- 
2.17.1

