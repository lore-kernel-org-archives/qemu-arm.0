Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DE3C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:08:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwPM-0001Ks-2v; Sun, 27 Jul 2025 04:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMD-0006bb-SW
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:46 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMA-0004Cr-Un
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:45 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so4332826a12.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603420; x=1754208220; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+7R5cwd/2Q0LtBzEZr6GfHkwiI/pvqCBPx4b4tvS3Y=;
 b=qL+cgDgfrEgXBe9b2rrTHJvImdZY6FL1TdCLhAU53F9Wfql31pDNhUsmt607tdUXoe
 7R4GlQYB7YCgqS5M1ijKR5LxhL103udOjpifDUZ8iO0zDEpG0hR1zMCVgCEvsZXNmtTO
 6pdYXRGYBXajtAycdu0+ohx9SDKQZ4A3FogvSNyW4TXRFetpqPQpCtY9j2dkUlBWANu6
 kgjKvNqpHQEXQAZSbymGYEIsu3XBAgJby0bBTeJCFA26LcgYStEKzZyditTfBBlSPEpu
 Y6I0nUQyFp2vRvx9j7fp28F0cChLnqVyj45SXIldtciDK1pUF75sPB5GhT36mXlASQBW
 020w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603420; x=1754208220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+7R5cwd/2Q0LtBzEZr6GfHkwiI/pvqCBPx4b4tvS3Y=;
 b=Zd8VgCi/CHT2SB7RWZBu+pujB1WPj3631IXS2771f7gpBxdfXjakhb1TXY6LMoAPri
 r/r0wHD5D5oNg/NJ2VB8488Xy8l71b8KgcWUOotTEgLLvDOxc/MUOR9oS8uqmKI6mfwy
 ipZ8ePdaaKoCB8WVcp5USZThmlzK+3d5r+v9YsJkniqEca0Awuus9T/kAvldBp+9rKOh
 aZmmEz+E6doJClMD5jwFfD12GDAo6zz2tZdywlEO2NpWBtwFrHuI3WplB6qXKXBEk5E1
 yj5WPbkL4BhkE2DygAIqNF+tbdehkM02Xk3cKViIHVn3qGc0hGkYCC0YcdtibO50dIBo
 DBnQ==
X-Gm-Message-State: AOJu0YzpnEVOrJqZrOPCkAPdzhTQp+CnwdfCU5aLkuuK5JrD85p+I/pO
 ChEHL2cHZWkpHrT6QPMFMVjeGWRMq4dNp+fLATKodO2EkBMQGfxagjBKpuS383qLHfh8t1FNJ7v
 ejBvd
X-Gm-Gg: ASbGncs/KC8rCn/ay+LyGfAUf2kOjWUT095MURvHGO6IoupJoGOrWH0zY+ktXWRmHZF
 nXXiPqHs+XLRnC+/3b6Jjq/HjnBEVHwIqmYqGu1LIetW87xO0mNPmP6Bytk0xfD2+EwlzFQ+1UX
 ipkeFewGgvqQg5V0QrshMUWBK8R7OtyyEwgWsShBk6UawvWP1n6fVKyfm4QRi+KSG2ye/YQcSq+
 vb8A+gMwMqdxGir/dRILiIQamH+BdwGkmqT0KPAlozdGXQOU1sMVKw+IyAYz5lnJun/l1cGAzZb
 XOI5ZCpRNuuS9o6bhhiEhOIbY7cFrxnGO7zwWhFgmF0HxcjpSCAg/SwGNU6thEPIv7w05DIeKfo
 FAfPCpI1no2nrYPXQ7D7zBMijKVDD2J/AmW76rTWmkkMZE0lMlfe6ODvWy+VCTayOjxYDmtZUPy
 jxFcwyMoxtmX8lAUY4Vhph
X-Google-Smtp-Source: AGHT+IEIqi++EfqOOvPwadQDVtDVG7jKssc5axOHTnXU/WixWBhIwLPSffx3B5gKVFBVM1KCqd7YIw==
X-Received: by 2002:a17:902:f549:b0:237:e3a0:9d63 with SMTP id
 d9443c01a7336-23fb30e8635mr124077765ad.43.1753603420282; 
 Sun, 27 Jul 2025 01:03:40 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 36/82] target/arm: Remove unused env argument from
 regime_is_user
Date: Sat, 26 Jul 2025 22:02:08 -1000
Message-ID: <20250727080254.83840-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  2 +-
 target/arm/helper.c    |  2 +-
 target/arm/ptw.c       | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f665971b97..ea210c7179 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1034,7 +1034,7 @@ static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
     return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
 }
 
-static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+static inline bool regime_is_user(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_E10_0:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 461572f918..d82f2b1131 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9692,7 +9692,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ds = extract64(tcr, 59, 1);
 
         if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
-            regime_is_user(env, mmu_idx)) {
+            regime_is_user(mmu_idx)) {
             epd = true;
         }
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c75b15b263..493ec78c1a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -964,7 +964,7 @@ static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                          int ap, int domain_prot)
 {
    return ap_to_rw_prot_is_user(env, mmu_idx, ap, domain_prot,
-                                regime_is_user(env, mmu_idx));
+                                regime_is_user(mmu_idx));
 }
 
 /*
@@ -990,7 +990,7 @@ static int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
 
 static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 {
-    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
+    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(mmu_idx));
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
@@ -1377,7 +1377,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                       ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
 {
     ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     bool have_wxn;
     int wxn = 0;
 
@@ -1539,7 +1539,7 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
         if ((u_perm & (PAGE_RWX | PAGE_GCS)) && regime_is_pan(mmu_idx)) {
             p_perm &= ~(PAGE_READ | PAGE_WRITE);
         }
-        perm = regime_is_user(env, mmu_idx) ? u_perm : p_perm;
+        perm = regime_is_user(mmu_idx) ? u_perm : p_perm;
     }
 
     if (in_pa != out_pa) {
@@ -2384,7 +2384,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env,
     uint32_t mask;
     uint32_t base;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
 
     if (regime_translation_disabled(env, mmu_idx, ptw->in_space)) {
         /* MPU disabled.  */
@@ -2551,7 +2551,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
     ARMCPU *cpu = env_archcpu(env);
     int n;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     bool secure = arm_space_is_secure(ptw->in_space);
 
     result->f.phys_addr = address;
@@ -2771,7 +2771,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * memory system to use a subpage.
      */
     ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -3651,7 +3651,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         break;
     }
 
-    result->f.attrs.user = regime_is_user(env, mmu_idx);
+    result->f.attrs.user = regime_is_user(mmu_idx);
 
     /*
      * Fast Context Switch Extension. This doesn't exist at all in v8.
-- 
2.43.0


