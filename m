Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF295D5B87B
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Dec 2025 00:02:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVIVX-0008CE-3F; Mon, 15 Dec 2025 19:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVIVV-0008BD-Hf
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 19:01:37 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVIVT-0002LV-5V
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 19:01:37 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso13234795ad.0
 for <qemu-arm@nongnu.org>; Mon, 15 Dec 2025 16:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765843293; x=1766448093; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wpxQqIkn1zPUb7xju/t2hDWbTvCMIn1xgZfGioQkOY=;
 b=DHVrQc2pEoANCSRTvbZOhgiU/zpE2az1B9A7bWKJCc+ucGYIQmuT8v9ChXKH3+KFMx
 eSML25uSchbfPpDLAQHpQx4OaxVzndZgWmzEWlB8Bfp4CAdCQd2dI89/i37ce4TaTK/R
 2NXutuwka/4Rj+h/FugRX9UZ7U/x3keeLm7LzNBIjIQbU4/3cKchDQ/eS35rWXTxctnm
 eEeXfvSzhv4L/soTd6HpNv455zewcpIIzmA9tWKroNRgh+XytYztjxfV4vEtN9qaQVdy
 taB1KG6C6TzzuKtlSZX6mHsXpASNx6ogceOIJTSQtZ7zV0pTRQkyN0Bos5XW/fHwhx5k
 sHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765843293; x=1766448093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8wpxQqIkn1zPUb7xju/t2hDWbTvCMIn1xgZfGioQkOY=;
 b=kUS3iiOnqQI8ypgUveX7FY/TAoWYr5aFvjWxfALBsCvwChGlKRywvSmVc5CjpYeHII
 Zy0YrDHTjKtbld1//R/SsRuC7wONCfc+3r3i970NN4wlBxtK5yJNNtkocfxY04OlXb/W
 myPhTYyLuql9Z9oalDlgFZ6ok539i3S1Fq6nyMSA2s7CjFTcSB43myKhA5we97ap8NAj
 XchjMd1gaoZlDTrT2DbpMjeRTMVvo5geGeH+zvRZkIHtLMu+/mdDM0fIxHcmQxdqKdn8
 L6DGUboYcIs+qGn7SepYO31G2rbhViuZxzFnjso7gcCiTSRu8//UuOzYGRi1IkY+3fYm
 tJkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8UkIoxrqR1K469tSRy7zbF/M5JBa3Mv0oXtQLEHMwon/eu6l3q/1bJyrvDptLgVFV4tYVKCirJQ==@nongnu.org
X-Gm-Message-State: AOJu0YzyGu2PBadj7ZHQ6HNd8XTyDzjykS8K+SgNk+zbn8kqucm9+LgC
 OXjeHttazEH/4rM/X1fzK48l7Rw1haY/GE8vdfpggq0MLasKU/f25jXbbkPNjx7qXH4=
X-Gm-Gg: AY/fxX5geLfxRGXqs3sOj+tdC5rWDywh43TlcvnyOXn+awQ3CKNgmQFb25u6i+IiegL
 oJnV+f93aaGyW0bAlT+UoZ+r3lmHmZHGU3K1mzmDeP0YCSyUIxXhDMSjN2TJnhYL2fp+m14seBk
 ecB3y4TpCNDHoc42d/n6tvYhFRsIb2hMfIzW8mHfPWMQUJWjIf8vUNVENRTuHgu6vllFfjji3RH
 E7IOCabVlbjAIAvRcwuD9m/n2kIYaJ88Iv1LaH4x8piMC/dRX0Msrjqt2xj9gmEH0AX6VvdSEkK
 SSW4/dZ3MMK3Micuxtj8G6+MMn4RPdWGVVN8f2+64J+yKiVyVe/vRWSMJsmk4h7eKHgVbIGROmy
 B9nEvipfkiy7Fr7yCumZB2HvdLaf9lujkpV+ScoDKE5ihb69ndH3JSaStfIQ/6G/KhM23JTe8if
 OC5NpqNhQyUZd9bhsa9BcDu8Wl7qJT4h0vx8CA6wkjkGlrFpUjc7f18am5hMtgXPQ=
X-Google-Smtp-Source: AGHT+IE0Uww0V3sv0J36dKdMBf9t0AeAxnvRDxonP8mqU2nM5nzy579YVqxbkb2uPejHHli8zFq6RQ==
X-Received: by 2002:a17:903:2308:b0:29a:69d:acdc with SMTP id
 d9443c01a7336-29f24eb128dmr107568975ad.25.1765843292937; 
 Mon, 15 Dec 2025 16:01:32 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a0e96df1c9sm44882915ad.39.2025.12.15.16.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 16:01:32 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Tao Tang <tangtao1634@phytium.com.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 2/2] target/arm/ptw: make granule_protection_check usable
 without a cpu
Date: Mon, 15 Dec 2025 16:01:22 -0800
Message-ID: <20251216000122.763264-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216000122.763264-1-pierrick.bouvier@linaro.org>
References: <20251216000122.763264-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

By removing cpu details and use a config struct, we can use the
same granule_protection_check with other devices, like SMMU.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 34 ++++++++++++++++++++++++++++
 target/arm/ptw.c | 59 +++++++++++++++++++++++++++++++-----------------
 2 files changed, 72 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index efbef0341da..5752e1f58fb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1216,6 +1216,40 @@ void arm_v7m_cpu_do_interrupt(CPUState *cpu);
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
+
+typedef struct ARMGranuleProtectionConfig {
+    /* GPCCR_EL3 */
+    uint64_t gpccr;
+    /* GPTBR_EL3 */
+    uint64_t gptbr;
+    /* ID_AA64MMFR0_EL1.PARange */
+    uint8_t parange;
+    /* FEAT_SEL2 */
+    bool support_sel2;
+    /* Address space to access Granule Protection Table */
+    AddressSpace *gpt_as;
+} ARMGranuleProtectionConfig;
+
+/**
+ * arm_granule_protection_check
+ * @config: granule protection configuration
+ * @paddress: address accessed
+ * @pspace: physical address space accessed
+ * @ss: security state for access
+ * @fi: fault information in case a fault is detected
+ *
+ * Checks if @paddress can be accessed in physical adress space @pspace
+ * for @ss secure state, following granule protection setup with @config.
+ * If a fault is detected, @fi is set accordingly.
+ * See GranuleProtectionCheck() in A-profile manual.
+ *
+ * Returns: true if access is authorized, else false.
+ */
+bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
+                                  uint64_t paddress,
+                                  ARMSecuritySpace pspace,
+                                  ARMSecuritySpace ss,
+                                  ARMMMUFaultInfo *fi);
 #endif /* !CONFIG_USER_ONLY */
 
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2e6b149b2d1..cdc14b1735b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -330,26 +330,26 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
-                                     ARMSecuritySpace pspace,
-                                     ARMSecuritySpace ss,
-                                     ARMMMUFaultInfo *fi)
+bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
+                                  uint64_t paddress,
+                                  ARMSecuritySpace pspace,
+                                  ARMSecuritySpace ss,
+                                  ARMMMUFaultInfo *fi)
 {
     MemTxAttrs attrs = {
         .secure = true,
         .space = ARMSS_Root,
     };
-    ARMCPU *cpu = env_archcpu(env);
-    uint64_t gpccr = env->cp15.gpccr_el3;
+    const uint64_t gpccr = config.gpccr;
     unsigned pps, pgs, l0gptsz, level = 0;
     uint64_t tableaddr, pps_mask, align, entry, index;
-    AddressSpace *as;
     MemTxResult result;
     int gpi;
 
-    if (!FIELD_EX64(gpccr, GPCCR, GPC)) {
-        return true;
-    }
+    /*
+     * We assume Granule Protection Check is enabled when
+     * calling this function (GPCCR.GPC == 1).
+     */
 
     /*
      * GPC Priority 1 (R_GMGRR):
@@ -362,7 +362,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
      * physical address size is invalid.
      */
     pps = FIELD_EX64(gpccr, GPCCR, PPS);
-    if (pps > FIELD_EX64_IDREG(&cpu->isar, ID_AA64MMFR0, PARANGE)) {
+    if (pps > config.parange) {
         goto fault_walk;
     }
     pps = pamax_map[pps];
@@ -432,7 +432,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     }
 
     /* GPC Priority 4: the base address of GPTBR_EL3 exceeds PPS. */
-    tableaddr = env->cp15.gptbr_el3 << 12;
+    tableaddr = config.gptbr << 12;
     if (tableaddr & ~pps_mask) {
         goto fault_size;
     }
@@ -446,12 +446,10 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     align = MAKE_64BIT_MASK(0, align);
     tableaddr &= ~align;
 
-    as = arm_addressspace(env_cpu(env), attrs);
-
     /* Level 0 lookup. */
     index = extract64(paddress, l0gptsz, pps - l0gptsz);
     tableaddr += index * 8;
-    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
+    entry = address_space_ldq_le(config.gpt_as, tableaddr, attrs, &result);
     if (result != MEMTX_OK) {
         goto fault_eabt;
     }
@@ -479,7 +477,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     level = 1;
     index = extract64(paddress, pgs + 4, l0gptsz - pgs - 4);
     tableaddr += index * 8;
-    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
+    entry = address_space_ldq_le(config.gpt_as, tableaddr, attrs, &result);
     if (result != MEMTX_OK) {
         goto fault_eabt;
     }
@@ -513,7 +511,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     case 0b1111: /* all access */
         return true;
     case 0b1000: /* secure */
-        if (!cpu_isar_feature(aa64_sel2, cpu)) {
+        if (!config.support_sel2) {
             goto fault_walk;
         }
         /* fall through */
@@ -3786,11 +3784,30 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                             memop, result, fi)) {
         return true;
     }
-    if (!granule_protection_check(env, result->f.phys_addr,
-                                  result->f.attrs.space, ptw->in_space, fi)) {
-        fi->type = ARMFault_GPCFOnOutput;
-        return true;
+
+    const uint64_t gpccr = env->cp15.gpccr_el3;
+    const bool gpc_enabled = FIELD_EX64(gpccr, GPCCR, GPC);
+    if (gpc_enabled) {
+        ARMCPU *cpu = env_archcpu(env);
+        MemTxAttrs attrs = {
+            .secure = true,
+            .space = ARMSS_Root,
+        };
+        struct ARMGranuleProtectionConfig config = {
+            .gpccr = env->cp15.gpccr_el3,
+            .gptbr = env->cp15.gptbr_el3,
+            .parange = FIELD_EX64_IDREG(&cpu->isar, ID_AA64MMFR0, PARANGE),
+            .support_sel2 = cpu_isar_feature(aa64_sel2, cpu),
+            .gpt_as = arm_addressspace(env_cpu(env), attrs)
+        };
+        if (!arm_granule_protection_check(config, result->f.phys_addr,
+                                          result->f.attrs.space, ptw->in_space,
+                                          fi)) {
+            fi->type = ARMFault_GPCFOnOutput;
+            return true;
+        }
     }
+
     return false;
 }
 
-- 
2.47.3


