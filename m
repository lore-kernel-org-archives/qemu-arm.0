Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2440255lft;
        Sun, 3 Jul 2022 01:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWgTG1/F+etp3itIozPULOcH/RQcH8Q5IvPIw1XMgtpG9toqiQySdkAhh4auD+F1KF3WGP
X-Received: by 2002:a05:6902:1009:b0:66d:5f35:58aa with SMTP id w9-20020a056902100900b0066d5f3558aamr24650107ybt.275.1656837883811;
        Sun, 03 Jul 2022 01:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837883; cv=none;
        d=google.com; s=arc-20160816;
        b=iaa6jPseUqumySYe3hobVf+LY0LKclLxbNQ60WyjcFmg8S4rm4R92XdgkboCrBpRDo
         O/wHTQ/d0TzmUwt9NLKP8w2i10a2NBW+1Ul91HLhvtvEDDzhAkRw1947BxHdMHqib/j+
         WwihzrD5GCiOgafEkfnjn08CwoUyFCKRtwgBBnxIAOgZxj/ero7DN0ab2xOPuPteGFbw
         imC5G/X7bSeDxAeHjp1Q9gAOCwSHNWOgB/lU8XHzoj+DsxMl4W5F/37eTJJ1PnErGKCj
         UOrT/GnfcyZbLV+nefAx/WWf3yBhSSntUSHu0Du2JgJIgFyzh5sCt339oVAHeulFx3O2
         DsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2QgifQ8/UXpFYLo0AlrMI1Z36M4FSsNZYn7tIgKAL9c=;
        b=ReaE2S7VPhRcc6EJPICNjtzBj1by9Ddm+4+AGxqfz1SY3kUly6gYxbQBbleg8zxzR7
         CLHPZ7b+7HxLPc4U0JzyGkmxCocAdpDk6OKjEWCy9lKsij/9/s27mUGivzsR8+rb+kRb
         9UtK0xDe7QuBfdaw3BO3brmJ6jhTB0QVJWxhrBq7PqKn7sbuniPngDStcPCjRrIRBQoy
         yH/pPJFHvaazgTjBH0uvmApFEy80ijgrW/SEuFxIm8dsvVbzgEcxSantF5BNh74uU18e
         uKMxcs5qwvuXP2JmtTk3riPSSiGuDtcPp1yhPfRfdyxOQjZ/zos3Gon7c/FySdOolTMT
         1NFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5v4vily;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020a253b0a000000b0066c91af0faasi26642440yba.128.2022.07.03.01.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5v4vily;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vDf-0000fW-7M
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv8-0007zy-W3
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:35 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv6-0006A7-9u
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:34 -0400
Received: by mail-pg1-x529.google.com with SMTP id q140so6249906pgq.6
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2QgifQ8/UXpFYLo0AlrMI1Z36M4FSsNZYn7tIgKAL9c=;
 b=H5v4vilyka3BgkgIpqCJt4oYPazHXLTCnBhc1r7rxIGQ1hvKLQ6U7MRvc0RGWAwD4x
 yKR9MHm15AiGe1TramaB9qh915N0OmNgiv+7NPO+VEHK3TvQWo3HG6T11Mxgyn82nQRt
 X/5c24FLGA8bt1expR+onIaVkDcjFWQiuaVsMLGqlL7rpNq+5szEBz7Rh3QUhiIklFSf
 R0I/K9VRsMHUrO2Dq9saIMp3ss9h1d86GtRpUXJG+hoM0sgKFPnP3EC6euweQ7NTtAGa
 tq6U5yPI0K7cTubDL4JWcePnab2KnnFyxD3w1zEJfLTUiRntWoIbQyIOTMkWSpouuXo/
 joGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QgifQ8/UXpFYLo0AlrMI1Z36M4FSsNZYn7tIgKAL9c=;
 b=HX050tD/CJru8KX8mJjvZdtRvwr3Umr91bzfawOZzglaAbTYJzTehzu+1fl0jHOIqh
 yUBItu5LFBKpbTUxAqVHV9kUvoCld6Pa2qpgQUzPqaltVAQIsGOVLhLdmncC2UuXvbTK
 kgyA24/1GCk7B34iXizeVRi5pAN6SP/Q3oS5f9B53aM/Xq20LlCweXYVaJLGoeMzHLd8
 hjMpXgqQrHzne+p7jNvu3tvtJXzmkdI4VvyWp0NEO/AdaDsBtj+eZx9mhdFGMxhrYxd3
 93r6D1Sh3RHdFo50OkJyHSGKUkEVUSCde2YvOFBcXcnAVX65tZLIfih4RhqFjVvvajyB
 PxZg==
X-Gm-Message-State: AJIora8y6ctHC4nk7f0VpWGXHRmEJA2Kwu2S5ZJwBNA6RhcBVcdos4DX
 ev3XuYkZxKUAhKJ1a3OUgdNx8g==
X-Received: by 2002:a63:5366:0:b0:411:415a:5888 with SMTP id
 t38-20020a635366000000b00411415a5888mr19769917pgl.286.1656836730864; 
 Sun, 03 Jul 2022 01:25:30 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/62] target/arm: Add is_secure parameter to get_phys_addr_v6
Date: Sun,  3 Jul 2022 13:53:38 +0530
Message-Id: <20220703082419.770989-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jefM+cnUdz7y

Remove the use of regime_is_secure from get_phys_addr_v6.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1bef9c6c60..d424dec729 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -529,7 +529,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -552,8 +553,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -606,8 +606,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2505,7 +2504,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                result, fi);
+                                is_secure, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
-- 
2.34.1

