Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4133408eje;
        Fri, 14 Jul 2023 08:48:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGG4g0DeW9qH8TgBe/8NQb9IS0Ok/mcRbUEzxlUsGi+/HvWw5n7B3zonwejNRuOv0qGmNSN
X-Received: by 2002:a05:620a:390f:b0:765:467e:133a with SMTP id qr15-20020a05620a390f00b00765467e133amr3436563qkn.23.1689349717757;
        Fri, 14 Jul 2023 08:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349717; cv=none;
        d=google.com; s=arc-20160816;
        b=Sa3M+GGfxzSkj9hA7/IOeK3QS2l0H/DC0+JrSYPppcGonc0O/IFmbfMg7f73guxFPY
         ejyaL998j2DCL6G4u+3GrnTX2LwYd0Z9Lh943abHR/IFGZfGRE/dcZq6lk7alf2v8f1s
         eBBbjnw2Tu1OFF0B/rZ01giKpfDOvCX+Cte3pooBe6ihmxdy66AROGcR+QloDT5T1v/6
         1a58A9IVbAKDV3grlSPFshgbwqKnW6QPr/jMwzaIgxjd3EyTeQ/wOaf7mK6jYPywXI8h
         ehX+IOqYY6fDGlHjJ6In9yujaTWGST3CCOvyBpwg6eL3yfeq2F69NUYJeGRqcwpnOebG
         Cjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q234a2QZpJLMfs9OiY+sBy9QxJhtbu9OJpiuspwmwC0=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=ZojCf3f9Im6YvK4FN9NBhd19PesXJkUeyumcLmsziMxsJV5Y9vjOVCQnaSs64XHVyt
         kceKa5Z3oKPSbbA/tYVLlEPDCSzXZG+v7oe9lFQYzSvOcr1hJ+j5/NQ8mCFx1m9zWrIS
         YnGjn0vv2pem2MQc4qtoTEwXNDoPWzisp/eQRRu8gb8jhw5qmvsKUARPdzL8VnX9BSt7
         WbutrUFhJMwPb4Hwnq963RIbNQRqtqgGhvLT+Ep34cq+7/jsyw84oKEMp4u4lB9Jpl5c
         auy8UWduHY0jU0Rcha2ZXAJC3RZoLq+/3DCl2Gx4B7331VVgu6nv+gn/eAe4h6nW6RJa
         RMhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d2aC1z2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b00767d4caabd7si4749905qkp.271.2023.07.14.08.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d2aC1z2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0V-0007DP-1V; Fri, 14 Jul 2023 11:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0T-0007C4-Si
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0Q-00075V-Qv
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3159da54e95so2075046f8f.3
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349613; x=1691941613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q234a2QZpJLMfs9OiY+sBy9QxJhtbu9OJpiuspwmwC0=;
 b=d2aC1z2ZaBNfrHagpI5ykhHUHfLkGTs7pI7ZAVr4J6GYf+GMKRE3csszuOfAMlLI/8
 WBqYtP/2M2/QAOash/c6f/XJv0e1pjdkCmHPk3xVYdwhjnijme8wlDpda+NR43ZfRSv4
 45aNRH1yfc1gwv6xxPdJiVChYWt8j0eMjVmROb+atuC5KA760pZXurrRpY7AWCpBA23x
 XTSUqFQ0zt0hbWfK8C7lLHvEI8Eai71WTJ3HhcN6EjivEja6Fl3Bg9AsfycK2wpTlc8v
 szBpPiNQ2SSEUQHO2BFv6ZjvBGXv+73wA1U916TGSOzvUU3vXajomy6/qKHGCXlaXgQa
 8BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349613; x=1691941613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q234a2QZpJLMfs9OiY+sBy9QxJhtbu9OJpiuspwmwC0=;
 b=O2CL2WJz7HKX0fd8CoguTiDS8a2HsP9AEE55daYKCLCSzbh73bttSdy+VHuBw+kK5g
 AXU35B3i50NJewxfNzK9784uMOJPeDdGzlveyFsWVDFksxCuOK1JTCYCvqasERQ/Rz8W
 HqgRRLrimgwNpxXRYgSxh0389gvd3ml7a+WsXDYHjgFZ0PEmFjzktkMl/tArzhONZHB3
 nSTyS2/arul+Yci9F03epYYn+D8KFy86tnf5eGmwdsvGktNz3JyTtOXpNu5HQ7zsA4bG
 0xQCutF3oPP2pqTTQSsbVMAHXohDsEHCicTJS9Z1BH6FyFTQRfrOng/JYAuy3193fWC4
 aSSQ==
X-Gm-Message-State: ABy/qLYJdA9ud9xobRh2TjKlzg/sn7CVAUrW+cpGmh7Q4YSnquIn5MZ+
 zTdu+Kv1boCZjgdCIrIT8vfm/GyzudBeOoMoDBM=
X-Received: by 2002:a5d:6046:0:b0:313:ef08:c83b with SMTP id
 j6-20020a5d6046000000b00313ef08c83bmr4859404wrt.56.1689349613385; 
 Fri, 14 Jul 2023 08:46:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/14] target/arm/ptw: Pass ARMSecurityState to
 regime_translation_disabled()
Date: Fri, 14 Jul 2023 16:46:39 +0100
Message-Id: <20230714154648.327466-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UXeS8WSxrGzr

Plumb the ARMSecurityState through to regime_translation_disabled()
rather than just a bool is_secure.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a873fbe0239..63dd8e3cbe1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -206,9 +206,10 @@ static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 
 /* Return true if the specified stage of address translation is disabled */
 static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                        bool is_secure)
+                                        ARMSecuritySpace space)
 {
     uint64_t hcr_el2;
+    bool is_secure = arm_space_is_secure(space);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         switch (env->v7m.mpu_ctrl[is_secure] &
@@ -2057,9 +2058,8 @@ static bool get_phys_addr_pmsav5(CPUARMState *env,
     uint32_t base;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     bool is_user = regime_is_user(env, mmu_idx);
-    bool is_secure = arm_space_is_secure(ptw->in_space);
 
-    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
+    if (regime_translation_disabled(env, mmu_idx, ptw->in_space)) {
         /* MPU disabled.  */
         result->f.phys_addr = address;
         result->f.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -2231,7 +2231,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
     result->f.lg_page_size = TARGET_PAGE_BITS;
     result->f.prot = 0;
 
-    if (regime_translation_disabled(env, mmu_idx, secure) ||
+    if (regime_translation_disabled(env, mmu_idx, ptw->in_space) ||
         m_is_ppb_region(env, address)) {
         /*
          * MPU disabled or M profile PPB access: use default memory map.
@@ -2475,7 +2475,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * are done in arm_v7m_load_vector(), which always does a direct
      * read using address_space_ldl(), rather than going via this function.
      */
-    if (regime_translation_disabled(env, mmu_idx, secure)) { /* MPU disabled */
+    if (regime_translation_disabled(env, mmu_idx, arm_secure_to_space(secure))) {
+        /* MPU disabled */
         hit = true;
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
@@ -3303,7 +3304,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
          */
         ptw->in_mmu_idx = mmu_idx = s1_mmu_idx;
         if (arm_feature(env, ARM_FEATURE_EL2) &&
-            !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+            !regime_translation_disabled(env, ARMMMUIdx_Stage2, ptw->in_space)) {
             return get_phys_addr_twostage(env, ptw, address, access_type,
                                           result, fi);
         }
@@ -3362,7 +3363,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
     /* Definitely a real MMU, not an MPU */
 
-    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
+    if (regime_translation_disabled(env, mmu_idx, ptw->in_space)) {
         return get_phys_addr_disabled(env, ptw, address, access_type,
                                       result, fi);
     }
-- 
2.34.1

