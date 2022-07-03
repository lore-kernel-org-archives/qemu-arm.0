Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2437823lft;
        Sun, 3 Jul 2022 01:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s5N+XKrbASX2bsot6EZLDMqxXoD5slXHtjCY/e32nUwWZiXWayH5jKUbOXTt+JbO4U1ZmQ
X-Received: by 2002:a0d:d9d6:0:b0:31c:7763:c1ac with SMTP id b205-20020a0dd9d6000000b0031c7763c1acmr8455213ywe.240.1656837492554;
        Sun, 03 Jul 2022 01:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837492; cv=none;
        d=google.com; s=arc-20160816;
        b=gVjnsaep7S6RyO53YJEW0KPEyOvWxHLhogDKUCmcaDIZdL9DdHykwfwOdmTrGgJo3z
         8TeHpnKzHtOwxSmI5Nn7OL9TTKNPCypjk6zAIPm8MDS4l21pRbnFFubpSYByDihcEdWw
         s6btoeYKpaEbcSzYH+bu969Bv1c15MRYopGqs1N80E/ete/+Y4hPtprN0bQYUb4BPDVc
         /VOawq1Zj0faF1K/W4qL4UVFjziLRyolNfD7A9mB5NC7X5gVRAVJTUvMPPqoulbgD23+
         keH/WKJtrUvKlEMV62I6XKVvEvCzAfPyFiaX87WQBQxT52tbKJaMm8CZCY3ssLtaD2TH
         CczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LaYP+2o95zy27QHmyX20UD82IAVILTEsp61gOqT10lM=;
        b=BGVpy8xRmDTucn0PMfLn2gtBHImCZPTEiRcat+b3YAzox4z76ak8bIknkrE+bzJb/M
         jnNj2VYpK9fw+aus3VlFjJFZC9bkbegpZNKSvW+QF9plg25+Y+tHaFsAUV7ou85dYFzT
         qdnZV+Q65/6fQqYfJtF1Z0ibgfBjGul29omjeVWUmHm42ujeEINhr4yz1QBHD1gaXx9Y
         dOD9FnJb2MR3S5+D+IgtUCPANjUhnq6JGTRHoVT+DfEhHdAhKaTnAlf2cD2/AbbgRgWe
         UR1ygekjlwZcGqZDRwzmykN/NARZbUPTIY+owYG9U1t+XrUtauOB0aoLAxWSIymPsz9B
         6Lnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KChJYuAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67-20020a251046000000b0066e05fd208fsi6460111ybq.184.2022.07.03.01.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KChJYuAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7v7L-0004Kh-VX
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv1-0007et-K6
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:27 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuz-00069A-W7
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:27 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so6698790pji.4
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LaYP+2o95zy27QHmyX20UD82IAVILTEsp61gOqT10lM=;
 b=KChJYuAuc0J/uOVFYtz/nSDmIC7VkWWBibHIFC5ktYc1ODj4fRn0SpWq2kqXrwYChA
 aKNZZLu4uZ4a4bht1JtalhhaBC7XWu+Dp9Qf+n9Yq4mHmhdtlLULNKUZgv1jbr6C3m8B
 nse3RfprDQUKa7ZCd7zUnNO31YaMpzMsM/X1Ya6+qfajmxiU2oZBDi48PtILIFAYKUxv
 Us8VW5lqlz1d3lzptSrF5rI0txDLAKicDA22UkHLrS/nuxDOhKG8pKEWH7HJYA1+Gx+M
 MeuKumCMYwS4OKxaG13JXv2kjYNnWHLlspxPxpBAiarCCrzVd3mLsG6kjSM1XnD7WtSK
 0x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LaYP+2o95zy27QHmyX20UD82IAVILTEsp61gOqT10lM=;
 b=aCbhcRIHYTz2/GDm0coLefw8AKiDkr3Kw9VqExbYP2apSfrp1f0lnDbDJdCsuxR8kd
 j8rtAUSR4EbcblonaPJz6wQQvFGaCt4CVuDZi1uj7H1tD+0vgSL0aJ4t4LvyWmdhlJua
 bGzaLUxdT0dKj47sJ4jQKL3XSHmMWU5R4ogHWD/DBholeGiRMYErFYqH/NIPu2D1gnXn
 OaoLR3AsiKcYnOQ4MgjB1Vw2OT0iRpmvgW4B1Qlj0MFoXa3/L0+ZypgJvqwVgy44aXwu
 vLUTN03C9bLBZpPKy5fsnL8T8Fn+iwrv64lfSQJoM3OcZG7iKlfliRzZSVZWth5Ons3Q
 82Ug==
X-Gm-Message-State: AJIora/00+y3crHVAcFe3S/NiX/ulYPYseiSg3WUYadhOXCuAF2KvsyG
 RY2vjm44ln4lM8pWHagYQAS8RCEwo+loexU1
X-Received: by 2002:a17:903:120c:b0:167:8847:21f2 with SMTP id
 l12-20020a170903120c00b00167884721f2mr28391645plh.11.1656836724769; 
 Sun, 03 Jul 2022 01:25:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/62] target/arm: Add is_secure parameter to pmsav8_mpu_lookup
Date: Sun,  3 Jul 2022 13:53:36 +0530
Message-Id: <20220703082419.770989-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: loBNXMskNzEq

Remove the use of regime_is_secure from pmsav8_mpu_lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++--
 target/arm/m_helper.c  | 2 +-
 target/arm/ptw.c       | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 30bda00a09..f75ac2e1b7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1143,8 +1143,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
-                       uint32_t *mregion);
+                       bool is_secure, GetPhysAddrResult *result,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
 
 void arm_log_exception(CPUState *cs);
 
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 45fbf19559..5ee4ee15b3 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2810,7 +2810,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, targetsec,
                           &res, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3b70c423a8..1a0e708d11 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1697,8 +1697,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
-                       uint32_t *mregion)
+                       bool secure, GetPhysAddrResult *result,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1711,7 +1711,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      */
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -2031,7 +2030,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
         result->page_size = 1;
-- 
2.34.1

