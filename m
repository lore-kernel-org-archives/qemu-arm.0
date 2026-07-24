Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F84C531F9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:12:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6Jw-0004YU-Gm; Thu, 23 Jul 2026 23:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Ju-0004RX-Ny
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:30 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Js-0000TO-Ta
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:11:30 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-caf45fc5202so1271038a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862687; x=1785467487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uhO5s4iul0vXK1Y6GJ3YB3gbLNm60bTy/KydQifnUiw=;
 b=DYCczGwh8nCbEn75SPXwQ1jbPGUGt0hChJrpl1K3WowATUGJRpqaHislBNF5ri9ZsK
 wMoobxO5ouU3A8f8TJKwGY77nQtVsSftsIXBaMfJSCstV3dMNmo5EocXwFrMqtT7psvx
 Tj6R7lZvGbOyIwV13kBHbaxPaY2IGFdMxEaa5jg5DFNf4Xf22CQNxVNnec1AZt8WTVDS
 tpLLRMS7SuZ2mP2PVPkxuDwJvD4oUP4SwtyTWkHrMScxkTaGXDRKz3tLL3SHVuS5D1Qv
 JgXmpBfKwAUC/VUfNeqO1YlO37ulVSCpQ5Xa1ik0i3yQtf5oJZm7laNmoRQ37M1MGi7w
 1AQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862687; x=1785467487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uhO5s4iul0vXK1Y6GJ3YB3gbLNm60bTy/KydQifnUiw=;
 b=PmxsWe7YTcQqnrGsssAm3VDswQhQNYa9oot/EbQcIrP4km6xnAh+azYy22dulpjKh4
 k/6zWghshtT9rwJwCz/EHVE81Nesd2rKmKwPeaDKSWgHTIqzdcLs9eGCuhzoe40vKtZW
 3dUxhs6WBoCPenTViFOfzosH7QmYYd1U9nbi8N93w7WxziTQrjBN4wBm9oIHmOzmXSAC
 C7izqM6jWTMoRUAgGceImhRnJXJHnuVGzCzDknmkeO6PbL5ljt4qDjsPIKjIbKXGDL15
 I0vBwcBhhNwXNbqHfDLm78nX6n0am+jwjQ2CZV9vj5e4UxJbz08GfxtsCESiXGBF6Qo5
 Q+5A==
X-Gm-Message-State: AOJu0YyN+UEI2KI8at3TeGAl8Y6thL1UF/kdOo4oU9StiGmF7CSEoQaH
 BClSFHCo6duCgijY+tdqd0C1XE7pdJSwcXN11KLNz5tlnXWgDvoOXoExFgxIot1sf4FBpC4MV97
 aEBq8
X-Gm-Gg: AR+sD135Uaah4HR8fSIP99wUru6qyWJy30AaziSXd9UFKVdWaCHyHXmhxKH5olBm+wZ
 Dd8V2WYlKBPiGUYNcB6/Tr1FG04hn6ddCVT5hbXv8N7aHcfhxkPnpyzRhIRE1lXRPbAmibUp1qY
 ABtSlfHplTppeCDeJQ851jDie8GuKJyGov7GZCyzdlZ06PaswPDNENHPN9GFShQ+6yY93bPNDzo
 gn7dZztxbfeAAbauaZ4ndCeJ5MqGkc2btr+EpcZQH/LyzToMmPlDLbVbWS7weB4OQovPUv+suY7
 YMu1eo8tAOw2NqsVJwJgiBB05vRNLsjFv/ECaJlfkLXaReQiyPfnnKlM55G3H0pmxQ7xTfv0A2Y
 srao2HsbkvpK+9cdSLrTQ2uPVLq3wat+HVRsWm/2meaGSAFNTtbdp4DTTrZQ/BBj6QnP2iR2VCt
 LLA6lU/rBT+66GbR/Ex0hZXd1kx82wzuEjTesN/XpYXCym
X-Received: by 2002:a05:6a21:7008:b0:3c3:8de3:8eee with SMTP id
 adf61e73a8af0-3c44b222849mr6443688637.61.1784862687359; 
 Thu, 23 Jul 2026 20:11:27 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbb8f0d872bsm3617697a12.7.2026.07.23.20.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:11:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/6] target/arm: Implement HCR_EL2.TID3 trap on undefined TID3
 registers
Date: Thu, 23 Jul 2026 20:11:20 -0700
Message-ID: <20260724031123.76597-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724031123.76597-1-richard.henderson@linaro.org>
References: <20260724031123.76597-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
within the range which are not explicitly listed.  Previously we chose
not to honor the TID3 bit.

However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
on these registers, so we might as well honor HCR_EL2.TID3 too.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  8 ++++++++
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/tcg/op_helper.c     | 19 +++++++++++++++++++
 target/arm/tcg/translate-a64.c | 12 ++++++++++--
 target/arm/tcg/translate.c     |  8 ++++++++
 5 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 9f2532fe66..b1fc1f9f85 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -1213,6 +1213,14 @@ static inline bool arm_cpreg_in_idspace(const ARMCPRegInfo *ri)
                                       ri->crn, ri->crm);
 }
 
+/* The TID3 subset of idspace. */
+static inline bool
+arm_cpreg_encoding_in_tid3(uint8_t opc0, uint8_t opc1, uint8_t opc2,
+                           uint8_t crn, uint8_t crm)
+{
+    return opc0 == 3 && opc1 == 0 && crn == 0 && crm >= 2 && crm < 8;
+}
+
 #ifdef CONFIG_USER_ONLY
 static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 #else
diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 0077aeb4e2..97b8678f19 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -86,6 +86,7 @@ DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, cptr, env, i32, i32, i32)
 DEF_HELPER_FLAGS_2(lookup_cp_reg, TCG_CALL_NO_RWG_SE, cptr, env, i32)
+DEF_HELPER_FLAGS_2(tid3_udef_el1, TCG_CALL_NO_WG, noreturn, env, i32)
 DEF_HELPER_FLAGS_2(tidcp_el0, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_2(tidcp_el1, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_3(set_cp_reg, void, env, cptr, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index d4186b3d0a..93336daf53 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1187,6 +1187,25 @@ const void *HELPER(lookup_cp_reg)(CPUARMState *env, uint32_t key)
     return ri;
 }
 
+/* Raise an exception for an unimplemented sysreg in TID3 space, from EL1. */
+void HELPER(tid3_udef_el1)(CPUARMState *env, uint32_t syndrome)
+{
+    int target_el = 1;
+    int excp = EXCP_UDEF;
+
+    if (arm_hcr_el2_eff(env) & HCR_TID3) {
+        target_el = 2;
+        excp = EXCP_HYP_TRAP;
+    } else if (is_a64(env)) {
+        if (!cpu_isar_feature(aa64_idst, env_archcpu(env))) {
+            syndrome = syn_uncategorized();
+        }
+    } else {
+        syndrome = syn_uncategorized();
+    }
+    raise_exception(env, excp, syndrome, target_el);
+}
+
 /*
  * Test for HCR_EL2.TIDCP at EL1.
  * Since implementation defined registers are rare, and within QEMU
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b45e1b28b2..7e78d62496 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2675,9 +2675,17 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
      */
     uint32_t syndrome;
 
-    if (isread && dc_isar_feature(aa64_idst, s) &&
-        arm_cpreg_encoding_in_idspace(op0, op1, op2, crn, crm)) {
+    if (isread && arm_cpreg_encoding_in_idspace(op0, op1, op2, crn, crm)) {
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
+        if (s->current_el == 1 &&
+            arm_cpreg_encoding_in_tid3(op0, op1, op2, crn, crm)) {
+            gen_a64_update_pc(s, 0);
+            gen_helper_tid3_udef_el1(tcg_env, tcg_constant_i32(syndrome));
+            return;
+        }
+        if (!dc_isar_feature(aa64_idst, s)) {
+            syndrome = syn_uncategorized();
+        }
     } else {
         syndrome = syn_uncategorized();
     }
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index a1fc050618..3fa15f493a 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1824,6 +1824,14 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                           isread ? "read" : "write", cpnum, opc1, crn,
                           crm, opc2, s->ns ? "non-secure" : "secure");
         }
+        if (isread
+            && s->current_el == 1
+            && cpnum == 15
+            && arm_cpreg_encoding_in_tid3(3, opc1, opc2, crn, crm)) {
+            gen_set_condexec(s);
+            gen_update_pc(s, 0);
+            gen_helper_tid3_udef_el1(tcg_env, tcg_constant_i32(syndrome));
+        }
         unallocated_encoding(s);
         return;
     }
-- 
2.43.0


