Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62673C87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:47:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLrG-00033X-F1; Sat, 02 Aug 2025 19:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnf-0004tq-3p
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:38:03 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnX-00065X-Fz
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:56 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-72c47631b4cso1765271a34.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177874; x=1754782674; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUfIu25DnJupV1Db/3EipBIrM+Ws30vdyubQzMZmUk4=;
 b=v7XNIWFaM19gOBoXAnq2aLciuW0nVb4Rtka8tTkZUjfdXDDNaf1kiAHOigERhINAb9
 5Am+uJXC992CSICxIkOxoc5hCLGO1ezTaYcjntp8BxsYvEZ/7f4UYd6qOMfVgToSFG9G
 3GtxzIMgAIcVBuwvofeBMr6bKgjJSsrOlkI1+Y85jxhdd87R+y9igW8ETTu/6qCxiePG
 I8Oe44ZzmnGHmDGpiglYnSNzsQ8S4n9mbZCCo301H4szE6vQ+6Su99bDYr+uyh1p4Y/p
 5+jSWo6SKyVPb9Z+NXDDJYxrWc6u4HDo5r3uhDPqxWQqtjsxdroHVezGUQgFG1zQ1dUK
 7eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177874; x=1754782674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KUfIu25DnJupV1Db/3EipBIrM+Ws30vdyubQzMZmUk4=;
 b=OpRlSQhXvsDe9ozUvpXM6h2lkjQ+2qwjZ11N9UlER5Qa4e9KnQltO+V8E3BTJd1pqZ
 1Riyx4tjj73VM3qjCRc7y+ZCpI4gBR0/YAGB5bmbrYVG/MrWfftYrT2XGLAenV078txw
 PZ3NqD54svIJt8DH7CldNVyc0l/x0tBHS0LX89qC21ZG3rVqY9AVL9DKktvuqo2dniI3
 Yh9przAj0Jm6bIyR+4B2orEzJPEeOWqxPe4wV/VZ/Jcz1VZbbAptl/jnrQOTb7VKo72F
 M50Kb69IYN5hacIi2OdRXg5oM6xznCLCqR4DO8BIeQgB+A73qxlhawRQH7/068KFS8sO
 Lq8Q==
X-Gm-Message-State: AOJu0YzUZ8qWZ8+/LCOXzyP8c1F/qTOnaIBXRnGtqYTqOEa6uNEaKCZv
 fBhtR41PGdQeg/uozm0Dq6HO3AGLxvDzjgYUvsvNweqdryNkQq35ibRprT5B1/7ExLI=
X-Gm-Gg: ASbGncvv1ASZhHRL8oLpFm9ggS5AiXSgC0fd8npdbOojMhNJQmvmLa8+3AA+AUHcw87
 h2izx4IhsALhMdTNpZdBk6Hnw6zainuieNxImsGWYd7kPBDLTps0Siut2keW0pmotnSFb1mxDOt
 BBpjak4HA1VHnPmXN+b9AS4l0rd5OM89+t6ZjTjIE2DpYoZnYbzKvPIHH71AQ3vakDAIH3nrSTX
 Zkt8qEAapfzuGBRLnIuSnvkXGNa5zXU3UUHCRUOWGMDLrOUs/TeeuY9h9k/sPzNB2M3VsJpORrB
 otOctM+MeXmbh8L6xWmaKIoMprMr5C/jneBmFIZuM23+mYURqpezvDuCYkHiNwWz3aFC/zpiO7M
 L24ygNQTi2Hkfq0qNSrAbtj+dpCfi2fAUhiZ5pp9UZnOrXsWUyrPg9hqhSANq8Go=
X-Google-Smtp-Source: AGHT+IFewyR+NKTxigr57KKZtJeEIDW4hl7Ge1LzWxNDgYZ8i8NeO1XFaJUo7A+HpnIc9eSgo2efMw==
X-Received: by 2002:a05:6830:60c1:10b0:739:f3b2:80f6 with SMTP id
 46e09a7af769-7419d284cabmr1592006a34.14.1754177874063; 
 Sat, 02 Aug 2025 16:37:54 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:37:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 61/85] target/arm: Implement GCSPUSHX
Date: Sun,  3 Aug 2025 09:29:29 +1000
Message-ID: <20250802232953.413294-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  2 ++
 target/arm/cpregs-gcs.c        | 17 +++++++++++++++
 target/arm/tcg/translate-a64.c | 40 ++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 9b19520346..3d76afd20b 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -49,6 +49,7 @@ enum {
     /* Special: gcs instructions */
     ARM_CP_GCSPUSHM              = 0x0008,
     ARM_CP_GCSPOPM               = 0x0009,
+    ARM_CP_GCSPUSHX              = 0x000a,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
@@ -865,6 +866,7 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, CPPRCTX),
     DO_BIT(HFGITR, DCCVAC),
     DO_REV_BIT(HFGITR, NGCSPUSHM_EL1),
+    DO_REV_BIT(HFGITR, NGCSEPP),
     DO_BIT(HFGITR, ATS1E1A),
 } FGTBit;
 
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 74a1697840..6f25543426 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -44,6 +44,19 @@ static CPAccessResult access_gcspushm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_gcspushx(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
+{
+    /* Trap if lock taken, and enabled. */
+    if (!(env->pstate & PSTATE_EXLOCK)) {
+        int el = arm_current_el(env);
+        if (env->cp15.gcscr_el[el] & GCSCR_EXLOCKEN) {
+            return CP_ACCESS_EXLOCK;
+        }
+    }
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSCRE0_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 5, .opc2 = 2,
@@ -88,6 +101,10 @@ static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSPOPM", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 1,
       .access = PL0_R, .type = ARM_CP_GCSPOPM },
+    { .name = "GCSPUSHX", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
+      .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
+      .type = ARM_CP_GCSPUSHX },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0279111cd2..732d65f54e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2523,6 +2523,38 @@ static void gen_gcspopm(DisasContext *s, int rt)
     tcg_gen_mov_i64(cpu_reg(s, rt), value);
 }
 
+static void gen_gcspushx(DisasContext *s)
+{
+    int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
+    int spsr_idx = aarch64_banked_spsr_index(s->current_el);
+    int spsr_off = offsetof(CPUARMState, banked_spsr[spsr_idx]);
+    int elr_off = offsetof(CPUARMState, elr_el[s->current_el]);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    tcg_gen_ld_i64(addr, tcg_env, sp_off);
+
+    tcg_gen_addi_i64(addr, addr, -8);
+    tcg_gen_qemu_st_i64(cpu_reg(s, 30), addr, mmuidx, mop);
+
+    tcg_gen_ld_i64(tmp, tcg_env, spsr_off);
+    tcg_gen_addi_i64(addr, addr, -8);
+    tcg_gen_qemu_st_i64(tmp, addr, mmuidx, mop);
+
+    tcg_gen_ld_i64(tmp, tcg_env, elr_off);
+    tcg_gen_addi_i64(addr, addr, -8);
+    tcg_gen_qemu_st_i64(tmp, addr, mmuidx, mop);
+
+    tcg_gen_addi_i64(addr, addr, -8);
+    tcg_gen_qemu_st_i64(tcg_constant_i64(0b1001), addr, mmuidx, mop);
+
+    tcg_gen_st_i64(addr, tcg_env, sp_off);
+
+    clear_pstate_bits(PSTATE_EXLOCK);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2810,6 +2842,14 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspopm(s, rt);
         }
         return;
+    case ARM_CP_GCSPUSHX:
+        /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
+        if (rt != 31) {
+            unallocated_encoding(s);
+        } else if (s->gcs_en) {
+            gen_gcspushx(s);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


