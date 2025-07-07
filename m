Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40597C71130
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:06:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYt2l-00015m-AZ; Mon, 07 Jul 2025 17:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLZ-0005Rh-Ix
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:22:06 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLW-0004Nw-Nc
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:53 -0400
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4a5851764e1so83652791cf.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919707; x=1752524507; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MliDKdTKGlgBv1q4BM2bRtbciL0yD7VmHEPhXciATY=;
 b=mQBdiGuA1EDRTiN2CPIRCo0SyagGd6/gR2zUEVnlaq0SqhiJdFVR4EskbtwP+gfVoH
 I7izhwiec73Vo62LEyJ7PrbOcyvabdQfm3QvRvn/O6fyIB1uO/cYEg4dxQpxneec5zmD
 9r8+S5mcLRu9XKpSV6hOfIIAgIbn8KO5Woxj1McS06WxMNhs2OVCsbkOo/phfNg3p+rC
 KmgwRwSx2lYSfUp3Er4mXn9gvvsrhDoHzhljFJ5+aSTw8Qm1T7TzJ1YxiQTPiSCHyAI6
 hWtqznqZGUFnMNuLPtoyZKoPH4i5efafgGaauA25RUTrHR1jq+0xbN1Ig4XSr/cIo6lW
 bmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919707; x=1752524507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MliDKdTKGlgBv1q4BM2bRtbciL0yD7VmHEPhXciATY=;
 b=evcr1w59ljgoqTywHEN8TRZBQQ+Fsv5inVPczQYU+Bzb/z4chxiIDeWcnCBnW4haYM
 D0+N1RRtmKldLcM7uj16weHVd5KqPDuJRwnYeF64MYBNf7++idZTqb72E96YcIogCBMi
 9ZkoAHeeMxZcz5HZ2MYk1hDfb+JwD9t7m+wi8jmqBlOUriLtyq6XkfP7yG3JxwpoMqmq
 UC5Q+yEVGTSCFpKniy6f+1YdQvfusDiJilBI5qRvddigcqvFMK/OYmqeQmt9yjF2q7Ke
 x49XL/d0V9/VinrPddaqJGIF7nxY4QUY1AbzzW/Tn/N3Z9ilLABuqJ2atYKutVokbb2/
 bbPw==
X-Gm-Message-State: AOJu0YzAUH2qMS06TKrbqOXAfxUg2w+xOGsYoZG3HMTzMwyBivUzzy1g
 NVUlJlwoeYt9pcZQd1pyiOlr9DhpN8WzppwW2Gh4sIathqzwatoc73HwVvqY2X1j7gU5+c1DmUu
 BXDhbzes=
X-Gm-Gg: ASbGncsIQjCKx0mcXJNt5ThPW7p82o+17K/sdEq+vBBD/O6n/Sc8/OPl1K78SwQ+X28
 UZw1x4mHDyVFaoQuzdxqE6oKBbeA8VlX/6iFhNxAOqUIlOuCw0tE9IVgyXCwa9O02n6Ujx65l5K
 9T/u6lJkv05ResfFLAFOibfxM11ofFUd2gkK+big0jtRYTAx/IH0Zx3O0L0IoS3UUnQcOppUT3Y
 D7jduV6+inHOimrQ4bTje7DZieUByvFc+glOMzMLMZdo/Ata0A/Lrfk/CresXJBH/nNAMQqgP7g
 2akULElkEESr8jUM6PwzhYjFNZ8QqdbYVYRakdosjpi5OAw8+682SxNVsuOpd26Sy45a3kmMpRP
 at0Qecg/LDTixPHFB
X-Google-Smtp-Source: AGHT+IGE9+Dm/VXk1Ly3nZ7JDsI3bgRrHiIyTSNALchRuSZxOXbMGjooHLwJVOLLIQwNTMLGZZIVQw==
X-Received: by 2002:ac8:5a43:0:b0:4a4:4103:f301 with SMTP id
 d75a77b69052e-4a9cc4d21a0mr12602411cf.0.1751919707143; 
 Mon, 07 Jul 2025 13:21:47 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 18/20] target/arm: Convert do_ats_write to access_perm
Date: Mon,  7 Jul 2025 14:21:09 -0600
Message-ID: <20250707202111.293787-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
 target/arm/tcg/cpregs-at.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
index e79866e651..39141c83aa 100644
--- a/target/arm/tcg/cpregs-at.c
+++ b/target/arm/tcg/cpregs-at.c
@@ -24,7 +24,7 @@ static int par_el1_shareability(GetPhysAddrResult *res)
 }
 
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             unsigned access_perm, ARMMMUIdx mmu_idx,
                              ARMSecuritySpace ss)
 {
     bool ret;
@@ -33,7 +33,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
 
-    ret = get_phys_addr_for_at(env, value, 1 << access_type,
+    ret = get_phys_addr_for_at(env, value, access_perm,
                                mmu_idx, ss, &res, &fi);
 
     /*
@@ -193,7 +193,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
 
 static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
-    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    unsigned access_perm = ri->opc2 & 1 ? PAGE_WRITE : PAGE_READ;
     uint64_t par64;
     ARMMMUIdx mmu_idx;
     int el = arm_current_el(env);
@@ -255,7 +255,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         g_assert_not_reached();
     }
 
-    par64 = do_ats_write(env, value, access_type, mmu_idx, ss);
+    par64 = do_ats_write(env, value, access_perm, mmu_idx, ss);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 }
@@ -263,11 +263,11 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    unsigned access_perm = ri->opc2 & 1 ? PAGE_WRITE : PAGE_READ;
     uint64_t par64;
 
     /* There is no SecureEL2 for AArch32. */
-    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2,
+    par64 = do_ats_write(env, value, access_perm, ARMMMUIdx_E2,
                          ARMSS_NonSecure);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
@@ -311,7 +311,7 @@ static CPAccessResult at_s1e01_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    unsigned access_perm = ri->opc2 & 1 ? PAGE_WRITE : PAGE_READ;
     ARMMMUIdx mmu_idx;
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
     bool regime_e20 = (hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE);
@@ -354,7 +354,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 
     ss = for_el3 ? arm_security_space(env) : arm_security_space_below_el3(env);
-    env->cp15.par_el[1] = do_ats_write(env, value, access_type, mmu_idx, ss);
+    env->cp15.par_el[1] = do_ats_write(env, value, access_perm, mmu_idx, ss);
 }
 
 static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.43.0


