Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2208979lfp;
        Fri, 14 Feb 2020 10:02:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZM3h9UK1jL+GIVaXwzK5Pufp2YlkjvFwsdHwSGrtF3M+e3YxcdWfQP0qVVUAaLV+yTPCl
X-Received: by 2002:aed:3384:: with SMTP id v4mr3561768qtd.58.1581703340610;
        Fri, 14 Feb 2020 10:02:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581703340; cv=none;
        d=google.com; s=arc-20160816;
        b=KgwfBpWprdOEdxTBsaX6NNDUm4t0aEPeZomS2mEntt7fJUltDb1I484L1lSvX/WxIu
         vxed3EUuE0YKvXlUPAWeBFuXisQ5o3b/1gNIF+BHJ8/jAZDBPyHt1OzwUbcrWjf0HcP3
         VgdER2tC+NoAYjspgncx/gVwlFWygTIn5AYDVXKk+7rFy5YJl6cxN8GAmspVHEKJfahq
         a/x1nPo06BeGLqDeXDVlhlLDSZsGj9cmbgsnRXsVZgAhywZnx40F26OBw8+H8uaYIt7m
         J0SFr96cOA0UQ7A5KpXC9byIQgnLu8St2+UF4c2p97oR1A1sSUaLN73ZF/drFEJWaJ19
         1+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4BLXsVcN28YFgzh7RunR4by8doFHHVtIkmiy7Jly1NU=;
        b=ePqMwT3CCf1BRmLLm7XxorEvB4ROQtjhVbYEmUKwh45w3d8cT5EtBhi7W5c4gP87WK
         v405CnEmVQX1Ns3vHOaDES9ZEvonWbmtTRikcQXxnkDqRte7tbYt9clihYHvyDTwRymT
         t7UfaK2d30PBcOnZ5C3T2f2/GWEnywui5A0QniCP16LGJJNs3zt07rK0HkgCSasYaOIB
         xQlwEsPwdJv6E/oSZs1kMBzry4biEcrC/i/gujNnUS2KgvhbXpmI+o3tntp7gHlpjQuL
         hg5TnQRzXqjdMYRjdYNc+8G4JIZ3cBjutxAdRe7I9Vsbi7O6xJHFR1/O+CvDWHCEhrnl
         cKUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bJq6wSO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v35si3285330qtk.206.2020.02.14.10.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 10:02:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bJq6wSO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fIB-0000f6-V8
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 13:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7w-00064o-4C
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7t-0000vB-9C
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:43 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35078)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7s-0000sn-P2
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:41 -0500
Received: by mail-wr1-x441.google.com with SMTP id w12so11894268wrt.2
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BLXsVcN28YFgzh7RunR4by8doFHHVtIkmiy7Jly1NU=;
 b=bJq6wSO64nQ7655iHrQy8uQ33zF92z6mllFOsd9mCZz9w/YAosZY/9qPsG69XByf4u
 ZcANLz6nOXrvhQJi4Ybn0eQTHvzbNrNUS8Qf3srvCqzUfQ96ycljrzhaalZYE3CKdpcr
 BDuP5yjRB9ClLPtg/a7/yseWhUV3a4vRBun+5dT/4Vm5lQLybz6KOZ4yps4GI82zDs22
 qojNNb4P3LxD69VBsrF4G1xF2dldKCKJ396BUQF/JMkTSRBIZMiwvA8+fsDpMp/RiLuX
 z+uN9q/Y2105JXkzLHHyoEU/fneulHwbP8nsDSgnebVUQ1BAXfvpKEahMUAr2Z1DNgkt
 GZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4BLXsVcN28YFgzh7RunR4by8doFHHVtIkmiy7Jly1NU=;
 b=n4hhhWbmsF3KDDOG+F3l9W8N3GqCIJXblhzXbsR6ACXvxCpnVMM3F+6tk481UuEij7
 ktbkCoKi0MtizPiltwZRqgXhmTG1sqVJ0b0+zV7S46BUtD8UcYjaF0ToZ+H7vikMYper
 KFUd+oc9fPa50PtHAEoqsDcYhTR7FfQe7aVtSPT6gqy0gRUsjg0BTBVDGOtrYagWwHl3
 Mn5vRV5uYKS7H958THofxKx1TNry7x7sQLz+SZKdBj4SE7Hne4KNQHig7atbVEoLZ5pM
 uVa4QApOtNt++EAL3HGC2RBAiAYGGrOk/TjoVpGvUE/n+/h06MHWTczXhDUILrk4laXO
 7t6g==
X-Gm-Message-State: APjAAAWpjnTzONo579TPEg0BLc4BMffk45b8pIAd536E4jdOIhP8FUrz
 du6nmTGZdBGwQxw8TYnBje/ju0N0MaU=
X-Received: by 2002:adf:b64b:: with SMTP id i11mr5502856wre.58.1581702698797; 
 Fri, 14 Feb 2020 09:51:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/21] target/arm: Implement ARMv8.4-PMU extension
Date: Fri, 14 Feb 2020 17:51:09 +0000
Message-Id: <20200214175116.9164-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0QxICXvLDN3i

The ARMv8.4-PMU extension adds:
 * one new required event, STALL
 * one new system register PMMIR_EL1

(There are also some more L1-cache related events, but since
we don't implement any cache we don't provide these, in the
same way we don't provide the base-PMUv3 cache events.)

The STALL event "counts every attributable cycle on which no
attributable instruction or operation was sent for execution on this
PE".  QEMU doesn't stall in this sense, so this is another
always-reads-zero event.

The PMMIR_EL1 register is a read-only register providing
implementation-specific information about the PMU; currently it has
only one field, SLOTS, which defines behaviour of the STALL_SLOT PMU
event.  Since QEMU doesn't implement the STALL_SLOT event, we can
validly make the register read zero.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 18 ++++++++++++++++++
 target/arm/helper.c | 22 +++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e043932fcb1..cfa9fd6c1b9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3519,6 +3519,13 @@ static inline bool isar_feature_aa32_pmu_8_1(const ARMISARegisters *id)
         FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
 }
 
+static inline bool isar_feature_aa32_pmu_8_4(const ARMISARegisters *id)
+{
+    /* 0xf means "non-standard IMPDEF PMU" */
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) >= 5 &&
+        FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -3704,6 +3711,12 @@ static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
+static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 5 &&
+        FIELD_EX32(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
@@ -3722,6 +3735,11 @@ static inline bool isar_feature_any_pmu_8_1(const ARMISARegisters *id)
     return isar_feature_aa64_pmu_8_1(id) || isar_feature_aa32_pmu_8_1(id);
 }
 
+static inline bool isar_feature_any_pmu_8_4(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_pmu_8_4(id) || isar_feature_aa32_pmu_8_4(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index aeb01617150..2feded1518c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1130,6 +1130,12 @@ static bool pmu_8_1_events_supported(CPUARMState *env)
     return cpu_isar_feature(any_pmu_8_1, env_archcpu(env));
 }
 
+static bool pmu_8_4_events_supported(CPUARMState *env)
+{
+    /* For events which are supported in any v8.1 PMU */
+    return cpu_isar_feature(any_pmu_8_4, env_archcpu(env));
+}
+
 static uint64_t zero_event_get_count(CPUARMState *env)
 {
     /* For events which on QEMU never fire, so their count is always zero */
@@ -1170,6 +1176,11 @@ static const pm_event pm_events[] = {
       .get_count = zero_event_get_count,
       .ns_per_count = zero_event_ns_per,
     },
+    { .number = 0x03c, /* STALL */
+      .supported = pmu_8_4_events_supported,
+      .get_count = zero_event_get_count,
+      .ns_per_count = zero_event_ns_per,
+    },
 };
 
 /*
@@ -1178,7 +1189,7 @@ static const pm_event pm_events[] = {
  * should first be updated to something sparse instead of the current
  * supported_event_map[] array.
  */
-#define MAX_EVENT_ID 0x24
+#define MAX_EVENT_ID 0x3c
 #define UNSUPPORTED_EVENT UINT16_MAX
 static uint16_t supported_event_map[MAX_EVENT_ID + 1];
 
@@ -6414,6 +6425,15 @@ static void define_pmu_regs(ARMCPU *cpu)
         };
         define_arm_cp_regs(cpu, v81_pmu_regs);
     }
+    if (cpu_isar_feature(any_pmu_8_4, cpu)) {
+        static const ARMCPRegInfo v84_pmmir = {
+            .name = "PMMIR_EL1", .state = ARM_CP_STATE_BOTH,
+            .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 6,
+            .access = PL1_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+            .resetvalue = 0
+        };
+        define_one_arm_cp_reg(cpu, &v84_pmmir);
+    }
 }
 
 /* We don't know until after realize whether there's a GICv3
-- 
2.20.1

