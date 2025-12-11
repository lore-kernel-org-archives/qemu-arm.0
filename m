Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4DBD4335E
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 23:45:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTqKu-0003PR-Th; Thu, 11 Dec 2025 18:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vTqKt-0003No-32
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 18:44:39 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vTqKr-0003XC-Bt
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 18:44:38 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-343dfb673a8so670579a91.0
 for <qemu-arm@nongnu.org>; Thu, 11 Dec 2025 15:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765496676; x=1766101476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jKUQi9a2OWlZ7y6Jma65MPuLoFvySr8Ow6X58V0yBsk=;
 b=GsSXbDg9xwKcA/686kCAYTOgRTT0Q7gX9bzcl7Vf5Wm9FHuZMsBnfUKwp7ZTgtK+w6
 ere9lSwtKJBNq5atqbonCtMs6HnKeG45AJCxQHG6uBC6AINAWz+//A6NTyTIii70XzqQ
 97lB+VWr1qMaMlRYFg0ewdna2KCaLWgau+6A8Ik5qBH62a5IMu5DGvCEUDKB4AdJePbQ
 ygMiD5UDvoKwHkdHEk0CBhkBETTxBG9igKg0CXGPe0LkReVV2STtj/BJ1rYnEH8LnfNN
 XI02mJ9OAFJVauEtUNsvqlYzG9d6KDXTAS8Pwk3bcd5xO2xBr6aYkEnpVrlPDYOSMge0
 GaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765496676; x=1766101476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jKUQi9a2OWlZ7y6Jma65MPuLoFvySr8Ow6X58V0yBsk=;
 b=qrSn9TvRDLEzi1bsfKBKU1P2JdEgn6LkMG5mSvCSQ4dzrQn3zQVgJdvxSmCtublubB
 exDoYN/V/hcXnw6enOPane8S6Xc9CwXQsPs7IyVejKFddeUCRkCFqzUO4yeXVLQZsgRw
 KQzhEyxRbmzfJ5dd6TRMLfxB88KVt/61pFA5AJbgobRrS/DBtPJx7UEh5zhEV/xdbcP8
 QuTyrcGt/EGwtkzHYMaMtG7VhOeEPorB3R1w964Lk9dlL/EjwzduHSEeY/StBV6gqKA9
 DTSAkAxiNmtH5vsKEB9479IrSx3oBzQlV2C5y0w+y42VYmL1pbmq2Q5O6iHxjBpdfNBo
 rj0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUmuUKE8cl845Y1lEWyT+fK/d3DaRWYeaiuv4aXY9FTHDNEKta7UtnNp4YhSRDcLrxOo/q2nzUQw==@nongnu.org
X-Gm-Message-State: AOJu0Yw7NwVomH9X5gs1ylpL937zJ5tMH7k6/Tv9pcGda6uAL8ekN02U
 aNMA1qXJfKvD/CPbBlQLJEqruJbqX+JUVpmf+fwaWWCJTUIKuAPoX7DCVtTt61eKWU4=
X-Gm-Gg: AY/fxX5F6cjxUaudPggUoQIvc/jo3dSBffcgFplEkNpMx+3A7G3iHlchtuwHnvsy0W5
 517O1jh7HwS5pvRAvRia5wsYCez/4S+2oqe0BhazyQblzzVv1b3dLtgiYKuEMMY0Qdb3d7tWW7u
 84m3o8H4n/FbuULNmmR32ey2FWT9ULEHbKmAEcMqZzus6hjbrXez3pZFSUfAtEqAXmW9npaWeRe
 ZsAyRvdfMBNHLioJ/0+PQ1Sdp2XWIkd+ZOOGNDhPP+6GQZIuFaqFObn4Y9G1yonumfvjOO92u4q
 WRlCOMRusIXK3HOvup2GEQNgilHMJLyL2En9WFBq6KhfgOhVvFP8XBter5OmkFbYmOCdC/T1beK
 YOD0B8nlZl/L4U3VhekwUC5+xKamyhoL/JfeNMg7ieNiqMdWmjQQsK73/EyTXOd68uXKXS/5sQ8
 vc+d3Pz1yY8cvGtXnw55XniwuAuyp7lXAuwfXsWwPM05+tM5A+s5OqQGTjhuoRptI=
X-Google-Smtp-Source: AGHT+IH/7OG8gHsl5qG/OTEpuhBwf4zkG/wsAOiTePqRKG/CVS0cRAKW879n6aoH6GAlmW2YvLIzFg==
X-Received: by 2002:a17:90b:5645:b0:343:b610:901c with SMTP id
 98e67ed59e1d1-34abd76f325mr289059a91.26.1765496675802; 
 Thu, 11 Dec 2025 15:44:35 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c0c2599228dsm3370410a12.1.2025.12.11.15.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 15:44:35 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Tao Tang <tangtao1634@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 2/2] target/arm/ptw: make granule_protection_check usable
 without a cpu
Date: Thu, 11 Dec 2025 15:44:26 -0800
Message-ID: <20251211234426.2403792-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
References: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1034.google.com
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
 target/arm/cpu.h | 14 ++++++++++++++
 target/arm/ptw.c | 41 ++++++++++++++++++++++++-----------------
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index efbef0341da..38cc5823a93 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1216,6 +1216,20 @@ void arm_v7m_cpu_do_interrupt(CPUState *cpu);
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
+
+typedef struct ARMGranuleProtectionConfig {
+    uint64_t gpccr;
+    uint64_t gptbr;
+    uint8_t parange;
+    bool support_sel2;
+    AddressSpace *as_secure;
+} ARMGranuleProtectionConfig;
+
+bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
+                                  uint64_t paddress,
+                                  ARMSecuritySpace pspace,
+                                  ARMSecuritySpace ss,
+                                  ARMMMUFaultInfo *fi);
 #endif /* !CONFIG_USER_ONLY */
 
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2e6b149b2d1..2b620b03014 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -330,24 +330,23 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
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
+    if (!FIELD_EX64(config.gpccr, GPCCR, GPC)) {
         return true;
     }
 
@@ -362,7 +361,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
      * physical address size is invalid.
      */
     pps = FIELD_EX64(gpccr, GPCCR, PPS);
-    if (pps > FIELD_EX64_IDREG(&cpu->isar, ID_AA64MMFR0, PARANGE)) {
+    if (pps > config.parange) {
         goto fault_walk;
     }
     pps = pamax_map[pps];
@@ -432,7 +431,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     }
 
     /* GPC Priority 4: the base address of GPTBR_EL3 exceeds PPS. */
-    tableaddr = env->cp15.gptbr_el3 << 12;
+    tableaddr = config.gptbr << 12;
     if (tableaddr & ~pps_mask) {
         goto fault_size;
     }
@@ -446,12 +445,10 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     align = MAKE_64BIT_MASK(0, align);
     tableaddr &= ~align;
 
-    as = arm_addressspace(env_cpu(env), attrs);
-
     /* Level 0 lookup. */
     index = extract64(paddress, l0gptsz, pps - l0gptsz);
     tableaddr += index * 8;
-    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
+    entry = address_space_ldq_le(config.as_secure, tableaddr, attrs, &result);
     if (result != MEMTX_OK) {
         goto fault_eabt;
     }
@@ -479,7 +476,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     level = 1;
     index = extract64(paddress, pgs + 4, l0gptsz - pgs - 4);
     tableaddr += index * 8;
-    entry = address_space_ldq_le(as, tableaddr, attrs, &result);
+    entry = address_space_ldq_le(config.as_secure, tableaddr, attrs, &result);
     if (result != MEMTX_OK) {
         goto fault_eabt;
     }
@@ -513,7 +510,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
     case 0b1111: /* all access */
         return true;
     case 0b1000: /* secure */
-        if (!cpu_isar_feature(aa64_sel2, cpu)) {
+        if (!config.support_sel2) {
             goto fault_walk;
         }
         /* fall through */
@@ -3786,8 +3783,18 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                             memop, result, fi)) {
         return true;
     }
-    if (!granule_protection_check(env, result->f.phys_addr,
-                                  result->f.attrs.space, ptw->in_space, fi)) {
+
+    ARMCPU *cpu = env_archcpu(env);
+    struct ARMGranuleProtectionConfig gpc = {
+        .gpccr = env->cp15.gpccr_el3,
+        .gptbr = env->cp15.gptbr_el3,
+        .parange = FIELD_EX64_IDREG(&cpu->isar, ID_AA64MMFR0, PARANGE),
+        .support_sel2 = cpu_isar_feature(aa64_sel2, cpu),
+        .as_secure = cpu_get_address_space(env_cpu(env), ARMASIdx_S)
+    };
+    if (!arm_granule_protection_check(gpc, result->f.phys_addr,
+                                      result->f.attrs.space, ptw->in_space,
+                                      fi)) {
         fi->type = ARMFault_GPCFOnOutput;
         return true;
     }
-- 
2.47.3


