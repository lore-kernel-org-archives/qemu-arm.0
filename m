Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E06CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:41:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNvT-0005Hb-TO; Sat, 30 Aug 2025 11:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELj-0005t8-Va
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:06 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELg-00046H-OP
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:02 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-248a638dbbeso24931295ad.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532519; x=1757137319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DZyOZ5ibz8YB1lWsiaU/JxXFHwk/vo9PWaKWI3jDReA=;
 b=woFakJBpAkWEZl3DVdle8hXFEtUjK6RGYHHfDUNfkfCl8BI32jOVExc4svPV83TTbF
 DLDxPgXiJeiva0UNHzsbMGrjMZVWquOxooRXCku0C3rv7QXOvsFRUWzgjzgbuMZnpE0C
 34/NSApBZ226jj5x1hHvqwofcaAu/3ZEcAn/9va1CQbcJAfUIgJUPvtKlsjHMsEVMSuL
 DW0EqJt89QQJK7hsSdbEBaQKDAP1BQK6ubYPF5FkhH7b0mlvyrwLd818du12zUG6/5Vs
 UNWP7TZFVhHVK9tE38MJdhRrdz+WFvAuWhcMN7hM6mpeOY+0FKW69QkE2p7eLMPLqZzg
 MoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532519; x=1757137319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DZyOZ5ibz8YB1lWsiaU/JxXFHwk/vo9PWaKWI3jDReA=;
 b=cXYaRlUp2ZoI84IIHvrBkqVb/98BMVkG8yHtx4dBqSSh4lz3IIvTqFoQgFb+erl0uh
 5wSq9ejUNwOum8COFi4ZLFXcF+1LXbZeZAkdMgyYXAxxWb+VodwFzd00H/TmeJNyT6BW
 gspYw8tZ3tBq7vEcnq/zNip2P0g1pwIB9bzGvPzW0SmXKcEcEznusq/rlbTOZDqKCp8j
 dA+wWGJY36HFjp5KlZex9F5S+MXBxyRksrMZrvQmbaMNWeRm/VIlfiDTfEHrn54TR2o0
 0I5rVfAOeDabl4B1xKMQULrrgWlPdMBBN8tU6aulCBPP/BTWDLmT/RVFLBinzdd42mfq
 s8dg==
X-Gm-Message-State: AOJu0YxLVq3ZIQ+8rlLTOXi5jwnhVngu01zyn/d4E8ar+C0K6EfDOtL/
 7pirkn9Zv2TjT/vUOPHEE/aGGRSD5RZFOE4lz8zGULBnN0k/dGT46t/a6InTnhY+vijUD4A7RKW
 BX4qQ9yo=
X-Gm-Gg: ASbGnctPQRvOVDZbbsUlIMnkjU1fJX9bvSZ3XgV5S+H8EVx4jbVgqAzFwgOdsofycDz
 /UDx9H9XCX0xmecuHY53eCfnWL75hNSYrRAaA8ryraxxo1kzf5CEsRqp0AZhELNVK6gbAs96plk
 5+yB7+XOd4vXi9CFww44qz5dIeq7lG9v1LNlW/QMof6qd7fLv17qIGYTz45ftWLaMEyTZhbUrWn
 Xj7TULIRWMNbbWyUVanaz0IXG89JP4pHgt6CVRSZ6oOnYKBRkCWTnlscdZUVzVhE3EJ1124hvcd
 1T4Pm4e9Cv4fx5s17FmHctIwDfA6n6I5u1vr14famJErdYzef657edpAeVfuZ44pUtchSVGOW3d
 xbvHHMeTWaNFBZbEroNnuvHeA0SH4HtwzvdAzGyNM4ldPN9CI9mA9W7u9lTyh
X-Google-Smtp-Source: AGHT+IGy9M+jfEKInLDx/wPZPtI3vEwu3bjqVOtpz4NnBS21UmV5qG9Xh4Ry9zDFhIqi5lpI0fDvdQ==
X-Received: by 2002:a17:903:41cc:b0:224:23be:c569 with SMTP id
 d9443c01a7336-249448f4103mr12371095ad.22.1756532519253; 
 Fri, 29 Aug 2025 22:41:59 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:41:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 09/84] target/arm: Add prot_check parameter to do_ats_write
Date: Sat, 30 Aug 2025 15:40:13 +1000
Message-ID: <20250830054128.448363-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Separate protection check from access type, in preparation
for skipping the protection check altogether.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpregs-at.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
index 2ff0b3e76f..bebf168997 100644
--- a/target/arm/tcg/cpregs-at.c
+++ b/target/arm/tcg/cpregs-at.c
@@ -24,14 +24,14 @@ static int par_el1_shareability(GetPhysAddrResult *res)
 }
 
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             unsigned prot_check, ARMMMUIdx mmu_idx,
                              ARMSecuritySpace ss)
 {
     uint64_t par64;
     bool format64 = false;
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
-    bool ret = get_phys_addr_for_at(env, value, 1 << access_type,
+    bool ret = get_phys_addr_for_at(env, value, prot_check,
                                     mmu_idx, ss, &res, &fi);
 
     /*
@@ -191,7 +191,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
 
 static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
-    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    unsigned access_perm = ri->opc2 & 1 ? PAGE_WRITE : PAGE_READ;
     uint64_t par64;
     ARMMMUIdx mmu_idx;
     int el = arm_current_el(env);
@@ -253,7 +253,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         g_assert_not_reached();
     }
 
-    par64 = do_ats_write(env, value, access_type, mmu_idx, ss);
+    par64 = do_ats_write(env, value, access_perm, mmu_idx, ss);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 }
@@ -261,11 +261,11 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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
@@ -309,7 +309,7 @@ static CPAccessResult at_s1e01_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    unsigned access_perm = ri->opc2 & 1 ? PAGE_WRITE : PAGE_READ;
     ARMMMUIdx mmu_idx;
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
     bool regime_e20 = (hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE);
@@ -352,7 +352,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 
     ss = for_el3 ? arm_security_space(env) : arm_security_space_below_el3(env);
-    env->cp15.par_el[1] = do_ats_write(env, value, access_type, mmu_idx, ss);
+    env->cp15.par_el[1] = do_ats_write(env, value, access_perm, mmu_idx, ss);
 }
 
 static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.43.0


