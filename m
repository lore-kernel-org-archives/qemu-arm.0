Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2451663lft;
        Sun, 3 Jul 2022 02:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s7uwiS85He+komgYR+RO3IcaSGVy8z36e+PclCEGc30N4EMfkpuB/5kdSS/Z4sEc6QFS5s
X-Received: by 2002:a81:f0d:0:b0:31c:8860:c59f with SMTP id 13-20020a810f0d000000b0031c8860c59fmr3174023ywp.31.1656839565224;
        Sun, 03 Jul 2022 02:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839565; cv=none;
        d=google.com; s=arc-20160816;
        b=UjWL2FYgyJl7I0ykLz6LYOmIsSwTBNb9lIxOcJvj1PEDKG7VJXLNXmL5VTclqJ7jSH
         CxIMO/9BW3gb7KFaIznwnq+17m45sRRHkIXi2eCAai7MtDinIuA2iwC39dSKCVAhgXxb
         VlAN0JimouvVATV+ipojYzTT7OFMWxDnDM5Uln41wofw1Gfb7CGZ8ZUOndZr9EDVTbSL
         svyW+3gWiha0W7qP3faERUGYNXR8UL8GzLoA/FDX+/93Kx+uCPqUdbo0ofK90nwz6wv1
         HM2mKgriFJGMuAfpV6XyHamJgBSyBt/l9p2z6M7NSfNZu2JG3qfd6GfAfs1wZpKlUrcX
         /Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2GREabbEg+nDIDAuvpznWWqWDzHWosOK+NnY9rFGuOE=;
        b=0nvQZb5n+wYSK+6djK15uR2bcjSBUGDAYRUuZdGanU15Gt9b1mdV7vVLhvwcosnJa7
         4g/aF6VZjkAusVkGNu2MhBE09/18MDEFIripIuJK6Y1lkHRnNP3AIl0YTAfIadW50+VD
         Yyreg/VtdH8+rYA6vAMyCn+jhsajfy5nvdW739VF+mVExjHNpzIo8t4sCz70HYUJ89XM
         Ez4tkaWwap+OJYXCp3W7b/zXCPRHMdXjClcyzYvXDmp9KGDzGTc/Hy2BRo/C35QrP+F0
         AHJ7vH7UeUHWGT9ryJvDwkO8FZKx2FQNxlsu+5sN9W8qD9HEgdDHRJCG/MMNOQfZvkzK
         v25Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZvUEkPZp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62-20020a811641000000b0031b79f73984si30393010yww.391.2022.07.03.02.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZvUEkPZp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vem-0001xw-HY
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzC-0000Lv-Nc
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz9-0006g4-Qo
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so6693757pjj.5
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2GREabbEg+nDIDAuvpznWWqWDzHWosOK+NnY9rFGuOE=;
 b=ZvUEkPZpWXWtBAkQaMCS/tYuuu4ZYd0Y3JEZr8wTZWqg57dShVzKxiZWYis2lIkC5c
 V9ySmkPVaO+ZK7ElRo1/x6OghG/vVWW8DKgM7O71/GLI1pZ61Pwnqi6kT8taa+Cbd1uB
 cjhExKpXvDPe2ap0QlWpxMQTvrLkjkSyamHAaOVNevCoH7rYpKO+HOWmy3Hnf2O0cd54
 58R3fmlLLtlO/aqUfUK/tIyuaAysG0RSpX7ZB2/vrVg1iuYamts9CNVZcXc7migu1z0D
 iuCL4ecaab/wDCYJ9ioV2QxFUPR7NJa0GVqyF5Qd/GQhTk45BqDLxyNgrL01i3Dzwwea
 /b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2GREabbEg+nDIDAuvpznWWqWDzHWosOK+NnY9rFGuOE=;
 b=ru1m/ogkrKaXK4gCYCC6ISGIziEHjMR7LcPL5pD6Fm5W8suLjvEvxVJ6jfII7ghp1Z
 HZxXMRJnNbjm4Hep8PGAktkLgKj7mhSniTf5QdIYM2RkuvWPoCM7TRh2XnESA/K1xWyZ
 sa7XjR3ZQQ0JjyABAbesnrupPkrKySKMDHT/nTv0Xz5/5dsLtNB4Ppd33w9aSE4dea/D
 MfNyKH06LWJfSHAqViicOZsi0q2ZfpkfliLGj20na4AUnnsm7GcdfCPWaqTRpZ3wDvaT
 HAt9SeU9vv3GRf8a7TRrlXVC1QqmAH4++yL5KI6fu5cishg1ALqiIdAOTC/6vIwNNCG5
 zopg==
X-Gm-Message-State: AJIora+coz/d92qq1ebzrVUI/00kaFndl+Fe1GkVQ0Sl20OsB0JP8It4
 EsWRUPhHsNapUg7VQPPg9tYdtCWcl8wGrOMl
X-Received: by 2002:a17:902:dac3:b0:16b:914a:81ba with SMTP id
 q3-20020a170902dac300b0016b914a81bamr26663447plx.19.1656836982539; 
 Sun, 03 Jul 2022 01:29:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 44/62] target/arm: Add ARMMMUIdx_Phys_{S,NS}
Date: Sun,  3 Jul 2022 13:54:01 +0530
Message-Id: <20220703082419.770989-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: QpFnAqVMlRc2

Not yet used, but add mmu indexes for 1-1 mapping
to physical addresses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 +-
 target/arm/cpu.h       | 4 ++++
 target/arm/ptw.c       | 9 +++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 6f702f58d9..931808f2e7 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@ struct PageEntryExtra {
 };
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 10
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dd577a08bc..c5aec164ba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2934,6 +2934,10 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3a098882a6..7510a9276a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -179,6 +179,11 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E3:
         break;
 
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        /* No translation for physical address spaces. */
+        return true;
+
     default:
         g_assert_not_reached();
     }
@@ -2284,6 +2289,8 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
         memattr = 0x00;    /* unused, but Device, nGnRnE */
         shareability = 0;  /* unused, but non-shareable */
         break;
@@ -2574,6 +2581,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         is_secure = arm_is_secure_below_el3(env);
         break;
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -2582,6 +2590,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         break;
     case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-- 
2.34.1

