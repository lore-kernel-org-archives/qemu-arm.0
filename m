Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2201475lfp;
        Fri, 14 Feb 2020 09:54:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnkmWTP18DwQXi8H/PbZcDd1WMcYG6r7gcw0RxL4j49fviSOB2s9jvEhwgb0Kx+XZhfZ93
X-Received: by 2002:ad4:42aa:: with SMTP id e10mr3239837qvr.92.1581702855218;
        Fri, 14 Feb 2020 09:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702855; cv=none;
        d=google.com; s=arc-20160816;
        b=rb6u+icmMKIS63ByOcCAfwcK6Hi2icn5uK0bUBhKiFbJPeo8A+hXBO9xuL2qfJM027
         7s62fLNejPBONJvPI/W6ZO6DrPekzC4ar3ID2GnXRdz3NI2ensQgsMynVVz245eJgcYf
         fPXPP6eI65R0euoEJZxNZbazc+Kh097da9ndaez5hAzg9nL/qCcqkrc2WNKTAmHJs7nJ
         IWmNFrpBurxbN4ZWEVsjFN3Dol0Yv++8orD/cBwycUXBp75lIP+FEBlKuKFdG/PfWAbP
         1U1Vq8m5GX4xssFlV7HDtRK+FjJA0sJT6/x14AuwFspbalClkKslJM0oQtMH+x4mexXU
         yQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+1O468aAsxmPMNL3BnoErATUsLcXthstaq/0XPSyqIo=;
        b=ej03ROwdEzr/chE6HRcX/GzfVf+JsE3mnPzK5aRVubz+l5hXmlaeUMC0dYCnfmEPgr
         gyTH5VoZuwNuTjhhHI00C5zEAwelAK0FtWp51O3GH2TLkbawlrwf6ZF0DRPXhXcVheGW
         HSbsHWAb9lpNaKxJQ/fA0ydeSwie0vEMuIyVuU+X2EtOWB734h41XoTV73bucYZFoYwg
         cF4S8h7dBnAvpgQplQm/FD8e3fWVcj/PH0bQ5Ha9EvNDhQjcs8c32tOnNq2yGx7VHpQf
         LPn/EHx7iVr0FdK27sFy5kdrN9sbd+LtA8VHppjIbEgwigizzHg/FmZ8dsT7jCJn5dY1
         rL9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRc2ibr7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp6si1308207qvb.141.2020.02.14.09.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRc2ibr7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fAM-00030W-Ls
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7n-0005w5-Q3
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7l-0000nt-LF
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:35 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7l-0000mx-DM
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:33 -0500
Received: by mail-wm1-x342.google.com with SMTP id b17so11574825wmb.0
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 09:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1O468aAsxmPMNL3BnoErATUsLcXthstaq/0XPSyqIo=;
 b=pRc2ibr7hwdg7dOwW7sck4nbEns5BsaLDD5UjjoRG5XzfEjjlM/DoMyFIXpmrLKqu6
 yE7JG+khoOFZlz59eejFI6CyeCqOASRz0R95cKfczdMVkr0mp+17vp/rW8G0oxOrNwph
 0fU2bDNB4DhJK5jBfmwPbAtap1cuNwa7ZOyNu2ofOxly1nuDVwmHJtDc5m0o8t6P+pmI
 VU3v+9hpRh4RforROyWVvC68jS78apqrrH30+ggSu06YLPIz777adSm2O7T1VRT2EZRa
 nvz13Zk5ppkwq29WBguuk3+n4kGI0TFUTPicZh7bSWOLBHCxJLZjXtVrzbngMiqiDf2h
 fqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1O468aAsxmPMNL3BnoErATUsLcXthstaq/0XPSyqIo=;
 b=p5g0bnhO6/22Fv5ONtR8QoByg5ZzR3Jn8OTY9bGRAZU7HSHkB3meXAxQdoIdr0DAfo
 n8y7PhHqQlWuDklOz1OnVrDuCy2vSQb0sf3ackUf6OH9Txe+tNWYbp0gFKYIWkFAuWPD
 Tx3v8CfQGAtMesUi9sB0QDygsEgeacSaQVrLrMRmZkBZN5B2IWiNmGOQ+4wboibWtRny
 aGkOtECOgazgH8dmVaFGehokI2+AJyrjWjO5L/vRkNVqhvsh5efoFZBJDPhXknDmUZbA
 A5/lxbO4gQHQrRLjsxYVhVPKMvv+Q8Ftbp5JgsB5XVyc+gfKzx+gya2KJ22mo63qKlmb
 sVSw==
X-Gm-Message-State: APjAAAVTKLdz3TEZhEMfXHKdfvyzRYnbzQ6ga1rOX4x94SJBuO4CHRt8
 kHNhg89lW3IQjZNpVcg2a7pScg==
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr5956238wme.21.1581702692467; 
 Fri, 14 Feb 2020 09:51:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/21] target/arm: Add _aa64_ and _any_ versions of pmu_8_1
 isar checks
Date: Fri, 14 Feb 2020 17:51:04 +0000
Message-Id: <20200214175116.9164-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l6/ZWPxmpll8

Add the 64-bit version of the "is this a v8.1 PMUv3?"
ID register check function, and the _any_ version that
checks for either AArch32 or AArch64 support. We'll use
this in a later commit.

We don't (yet) do any isar_feature checks on ID_AA64DFR1_EL1,
but we move id_aa64dfr1 into the ARMISARegisters struct with
id_aa64dfr0, for consistency.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2:
 * fix use of FIELD_EX32 in _aa64_ function
---
 target/arm/cpu.h    | 15 +++++++++++++--
 target/arm/cpu.c    |  3 ++-
 target/arm/cpu64.c  |  6 +++---
 target/arm/helper.c | 12 +++++++-----
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6c6088eb587..98240224c0c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -873,6 +873,8 @@ struct ARMCPU {
         uint64_t id_aa64mmfr0;
         uint64_t id_aa64mmfr1;
         uint64_t id_aa64mmfr2;
+        uint64_t id_aa64dfr0;
+        uint64_t id_aa64dfr1;
     } isar;
     uint32_t midr;
     uint32_t revidr;
@@ -889,8 +891,6 @@ struct ARMCPU {
     uint32_t id_mmfr2;
     uint32_t id_mmfr3;
     uint32_t id_mmfr4;
-    uint64_t id_aa64dfr0;
-    uint64_t id_aa64dfr1;
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
     uint32_t dbgdidr;
@@ -3686,6 +3686,12 @@ static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
 }
 
+static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
+        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
@@ -3699,6 +3705,11 @@ static inline bool isar_feature_any_predinv(const ARMISARegisters *id)
     return isar_feature_aa64_predinv(id) || isar_feature_aa32_predinv(id);
 }
 
+static inline bool isar_feature_any_pmu_8_1(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_pmu_8_1(id) || isar_feature_aa32_pmu_8_1(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b85040d36bc..7759e0f9329 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1718,7 +1718,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                 cpu);
 #endif
     } else {
-        cpu->id_aa64dfr0 = FIELD_DP64(cpu->id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
+        cpu->isar.id_aa64dfr0 =
+            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, PERFMON, 0);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9e4387158f9..2030e5e384b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -135,7 +135,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->id_aa64dfr0 = 0x10305106;
+    cpu->isar.id_aa64dfr0 = 0x10305106;
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->dbgdidr = 0x3516d000;
@@ -189,7 +189,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_isar6 = 0;
     cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->id_aa64dfr0 = 0x10305106;
+    cpu->isar.id_aa64dfr0 = 0x10305106;
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->dbgdidr = 0x3516d000;
@@ -241,7 +241,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_isar4 = 0x00011142;
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->id_aa64dfr0 = 0x10305106;
+    cpu->isar.id_aa64dfr0 = 0x10305106;
     cpu->isar.id_aa64isar0 = 0x00011120;
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->dbgdidr = 0x3516d000;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 048e541eda4..11b87723e47 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -25,6 +25,7 @@
 #include "hw/semihosting/semihost.h"
 #include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
@@ -6266,9 +6267,10 @@ static void define_debug_regs(ARMCPU *cpu)
      * check that if they both exist then they agree.
      */
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        assert(FIELD_EX64(cpu->id_aa64dfr0, ID_AA64DFR0, BRPS) == brps);
-        assert(FIELD_EX64(cpu->id_aa64dfr0, ID_AA64DFR0, WRPS) == wrps);
-        assert(FIELD_EX64(cpu->id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) == ctx_cmps);
+        assert(FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, BRPS) == brps);
+        assert(FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, WRPS) == wrps);
+        assert(FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS)
+               == ctx_cmps);
     }
 
     define_one_arm_cp_reg(cpu, &dbgdidr);
@@ -7010,12 +7012,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->id_aa64dfr0 },
+              .resetvalue = cpu->isar.id_aa64dfr0 },
             { .name = "ID_AA64DFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->id_aa64dfr1 },
+              .resetvalue = cpu->isar.id_aa64dfr1 },
             { .name = "ID_AA64DFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.20.1

