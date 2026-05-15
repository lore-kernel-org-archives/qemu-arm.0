Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6068CD4F47
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:26:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUl-0006fS-9f; Fri, 15 May 2026 10:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtUD-0005qo-PB
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU9-0000xi-BQ
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-448528f4e69so5312202f8f.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855151; x=1779459951; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dG4YbbQLzdn6s6+yCfVqlzQwYjjvxFEtdufrlxMzgL4=;
 b=Uw9g5njR/dDRRoyiPO0XdzmZa+lG1znEV6c8pA/tAgkOTb4j0W827XR92BD3hfZtiN
 o1/V7RME3zjLTyk630/S7agOfVbO2u+T5YIC6cY+blrziTMhEYMK8kHXr8tbiaydCzrK
 BEifc4zXV4d+YyXGgWitkvXuTFXbLGPoczVm/IxEZ6tngbj7lxi2lFSUEpTI4ouh/Jx9
 8HXZ7llnbQZHKzq/Shm73auzJmt/oElrYq2zYnmy0vDwW2hsxpT921Wv7dZmmypy4VQ5
 8BdNijsB12D2kT92D9B9NDpV0SemeOnde/jEqWruwR7+PkDXBPTQwltBn74HbOghzzrr
 5qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855151; x=1779459951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dG4YbbQLzdn6s6+yCfVqlzQwYjjvxFEtdufrlxMzgL4=;
 b=L8Qy3Gyff5m47FEP77mWC9idclm992YlB2KR6HaC3WyAJZ0rH89ynrBWtGgAjctFtO
 +hzothGWve0natVHgTlxvyT3ozLgE89Tx8YlLMtRniuSizvk3K07pYqkqa3dxMLONZ/d
 39elNHU0EvxGUpQdQEPWMiGch+pwBIIlg+xIYQTIB8YE6cZpNlG7/xRIKZfyi/8/JZOB
 cE6AXRAmiJzxpMr+J0er4Mgs4nV3pRaAZdV6+0ieAsRDeJgYOqaeYGG9hmr++0DvuMAQ
 k0xJorYYkUcXbWhuh/UB2oK1THv21EQu4YK1Ng2Q+qS1QqSO44bqKj+Aw05RxuVT1EZB
 qLpg==
X-Gm-Message-State: AOJu0YwNZ46WZ/RxmS03KKbYEdpHvUs/1qzzAPT7B23gTSpxlyi/CPr2
 3HEV/wg+n1ErWFfmWh9tiLvvybbLJSNO1Zy0S/kktbK9Ll7lWsjnvDiZHlTlwGeqVCfTXY8nkHl
 4qAl3
X-Gm-Gg: Acq92OHy0YrW0CaFygvyFeta637UD1FIdB1Km0LKv/RXgPCj4QV+yBfQmwf+dHWwGtf
 FPKDBU0m8UQD6mDuS7U4JMukJkg+QhOsMBx93UiIsniwUNqjey+CPcjKlejQGBojI/AW4MjVjPT
 EbqxSmfmRL2gWngq1SF4WHpJKb6/eW/dUp2xwbAlMKOjsX1Nr8hw/7czCqD1f6lD3GWkQRSOhHE
 5VWqvrTpiJk8llrBi5ZYStueHgTae9XdWPR/jCuxU+WZpbu7PoBgoXtxIJ/9Wpyn8UCTIBSnyGJ
 CKdJzEJk37hoQ+7y/J2hviyP8xF0C5ZlsNoCA/lRq3p6C8pvAlrJyumdzekS8fSYzoZYkQOUEAm
 3HH682NSmv4Wc2N8XVhxVQb9w1PQYGtrayJqqh846qvagRzMo5H7hr2+jyw+DbnwNY3mf9r3mkC
 63NH577QmyqdA21Fs8L6C63WOhsnI+HCmacyIfRDUhLjoSCCNGCHShwIAICa/G0UJTazkCrK8AL
 e8j2ShHDjiXUSn1EN8YPcMULR1aCvE=
X-Received: by 2002:a05:6000:1ace:b0:43d:775b:c9bd with SMTP id
 ffacd0b85a97d-45e5c58906amr5815222f8f.10.1778855151388; 
 Fri, 15 May 2026 07:25:51 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 08/14] target/arm/ptw: Flip sense of pmsav8_mpu_lookup
 return value
Date: Fri, 15 May 2026 15:25:35 +0100
Message-ID: <20260515142541.571911-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9e5a7e77c0..c89cccd431 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2844,6 +2844,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * If the region hit doesn't cover the entire TARGET_PAGE the address
      * is within, then we set the result page_size to 1 to force the
      * memory system to use a subpage.
+     * Return true on success, false on fault.
      */
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(mmu_idx);
@@ -2944,7 +2945,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                 if (arm_feature(env, ARM_FEATURE_M)) {
                     fi->level = 1;
                 }
-                return true;
+                return false;
             }
 
             matchregion = n;
@@ -2958,7 +2959,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         } else {
             fi->type = ARMFault_Permission;
         }
-        return true;
+        return false;
     }
 
     if (matchregion == -1) {
@@ -3020,7 +3021,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     if (arm_feature(env, ARM_FEATURE_M)) {
         fi->level = 1;
     }
-    return (prot_check & ~result->f.prot) != 0;
+    return (prot_check & ~result->f.prot) == 0;
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -3222,7 +3223,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
         }
     }
 
-    ret = !pmsav8_mpu_lookup(env, address, access_type, ptw->in_prot_check,
+    ret = pmsav8_mpu_lookup(env, address, access_type, ptw->in_prot_check,
                             mmu_idx, secure, result, fi, NULL);
     /*
      * For two-stage PMSA translations, s2prot holds the stage 2
-- 
2.43.0


