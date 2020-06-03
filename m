Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp31770lfc;
        Tue, 2 Jun 2020 18:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcBblzXtU54LkzjCW6rnmDo1aye9PVnTl6hpuCKbeJWC2prvbI40DIpImE++a/ZQxS3JcS
X-Received: by 2002:a25:c4c5:: with SMTP id u188mr44365700ybf.418.1591146926761;
        Tue, 02 Jun 2020 18:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591146926; cv=none;
        d=google.com; s=arc-20160816;
        b=v0nBabkkH8gnPAsegbPaSEcVoF5JNb0nNVDfBJA2XRG4srSZoU+RVOFkvdyMiPO1Lr
         TFic2gc32ezkItcSTcKHHSxn+lxPoEFmLLSlKIJWh005FOFNXsNFwDHqHrwnDflu5eb3
         vgCRjHXO+5yoYbKOqHwermOOs64JfheWlHZI/XatFpQM4LttD4gClAX/9D2KV3rD65we
         LKF7GnouqCWbxSNQQ6YhGnRCCdMdEs99IclKEdfhqazhhd4kpeF4BT5aSv9z1d1jGApx
         2Gz4fyZUYl98jBipV/IohE1K38avp3XbGDav7wTYF6nSTLzi7BrSSaoi2KaALKRpBOqq
         ahDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LFvCo0Qacf2rnL7CzQb0VBfQYmhjPV5RLkkRAA9+6zQ=;
        b=0n6NFak0BecmfO98tY8yCEMvidvwF7TSI8wyB7cbhKuNaGlQEl+rSmD0swRkanAVUs
         5gw0rJO+h6iTZneDCe/2BC21TofzuIbOwQVDQpP3i2fu0kDa3XC7hFQk0yeIT19TYn1Y
         e2TPlYYQsXEBq45GKk8RTdteyZu9Vp3OlPCuqdlsgJO+qM4n2zbVryw4UWcs0wFLaoPk
         uKAHuexMiswvkygqnQEHVo2NZs7Cr/l7KmoKQ+ExwXaKFS5/VtzfGJzJ5ikq5D+2FaDO
         +p4Y9t67OvCyMkj341wxO/qOTbgwUkBSfHuxTFPIXWjsjKcK1SYaRiXTwUaxrZBeUM1k
         LtWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BszsxdEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r65si342902ybc.379.2020.06.02.18.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BszsxdEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI06-0007G0-0K
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyB-0003QU-FD
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyA-0003WX-DT
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:27 -0400
Received: by mail-pf1-x434.google.com with SMTP id v2so414523pfv.7
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFvCo0Qacf2rnL7CzQb0VBfQYmhjPV5RLkkRAA9+6zQ=;
 b=BszsxdEwd5+sXi/rk3DwYO9vi41GSZNh2dI1VFjI+eMKAWPojNWHyGX46OMtETz0g2
 QZjpQN/OOukn5OSdSY7dWCRA7V39zZRs5PKfsrIHRhxm+e9U0UdzjoNrbgOOjJ9KRwkB
 qekIjaf3hxsyBvXuaaArfffhFtR+L7XvkRlxAONhXGFgGHV5clCGZS25kVitWT1OYArc
 4ANZIVWJq01OdLVsnz6G+LbgCjPplL5CjzVpPt9vCgnFPfCVYtA0qUORmKWoXiQJVzMJ
 13LDwwwHqwz93qR9QwNaoJrtkcW1oRCjgf8yeLjHQQdm1GNtxYBa325EQEk5SICxFN69
 S0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFvCo0Qacf2rnL7CzQb0VBfQYmhjPV5RLkkRAA9+6zQ=;
 b=gS52vbSHfLmwwXCSWmnnlDyvcIYIczypUcOHteAt3Em3Y0L+HXQivFr6Eh+Xt4XRPc
 pUHUf90bU+chtVLkSnittQJhpj4WqVLu7orGqrhKNfg5/Ms63wNRwYnBYnbKL4VDJZ0+
 w/PYrrvRaPiWnLkfiMGzLCKkVz/6fym1Fn5uMIK4EOQ6fm3BPFBMOdfUG+/2xruzd3aC
 RiEK3l1Jqm3H2artGxkvqJMLofF1fqqmD3WmVWvpDUI6MVeTp+716KW2yLUcNezsFHMB
 EacShDVxBeACTdU/zziY2dWmtBgWUKaGNf7YFR4mnj3xQceHNnB/RQCXy8RiePyVP55e
 nZvA==
X-Gm-Message-State: AOAM531QI3dZXCQMTe00XF0yWKfOlADA0SdFWbumsT96cboUofJj5o5W
 34zHRdwCie9f8Y/UvtBdh58mpgUfgVY=
X-Received: by 2002:a17:90a:c215:: with SMTP id
 e21mr2405516pjt.224.1591146805021; 
 Tue, 02 Jun 2020 18:13:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/42] target/arm: Rename DISAS_UPDATE to DISAS_UPDATE_EXIT
Date: Tue,  2 Jun 2020 18:12:40 -0700
Message-Id: <20200603011317.473934-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hGi7+xBJ9r4o

Emphasize that the is_jmp option exits to the main loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h         | 14 ++++++++------
 target/arm/translate-a64.c     |  8 ++++----
 target/arm/translate-vfp.inc.c |  2 +-
 target/arm/translate.c         | 12 ++++++------
 4 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index c937dfe9bf..68a55251c3 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -148,7 +148,8 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
-#define DISAS_UPDATE    DISAS_TARGET_1 /* cpu state was modified dynamically */
+/* CPU state was modified dynamically; exit to main loop for interrupts. */
+#define DISAS_UPDATE_EXIT  DISAS_TARGET_1
 /* These instructions trap after executing, so the A32/T32 decoder must
  * defer them until after the conditional execution state has been updated.
  * WFI also needs special handling when single-stepping.
@@ -164,11 +165,12 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * custom end-of-TB code)
  */
 #define DISAS_BX_EXCRET DISAS_TARGET_8
-/* For instructions which want an immediate exit to the main loop,
- * as opposed to attempting to use lookup_and_goto_ptr. Unlike
- * DISAS_UPDATE this doesn't write the PC on exiting the translation
- * loop so you need to ensure something (gen_a64_set_pc_im or runtime
- * helper) has done so before we reach return from cpu_tb_exec.
+/*
+ * For instructions which want an immediate exit to the main loop, as opposed
+ * to attempting to use lookup_and_goto_ptr.  Unlike DISAS_UPDATE_EXIT, this
+ * doesn't write the PC on exiting the translation loop so you need to ensure
+ * something (gen_a64_set_pc_im or runtime helper) has done so before we reach
+ * return from cpu_tb_exec.
  */
 #define DISAS_EXIT      DISAS_TARGET_9
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 874f3eb4f9..430f1867ab 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1607,7 +1607,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         gen_helper_msr_i_daifclear(cpu_env, t1);
         tcg_temp_free_i32(t1);
         /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
         break;
 
     default:
@@ -1786,7 +1786,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
         /* I/O operations must end the TB here (whether read or write) */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
     if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
         /*
@@ -1801,7 +1801,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          * but allow this to be suppressed by the register definition
          * (usually only necessary to work around guest bugs).
          */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
 }
 
@@ -14334,7 +14334,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, dc->base.pc_next);
             break;
         default:
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_a64_set_pc_im(dc->base.pc_next);
             /* fall through */
         case DISAS_EXIT:
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index e1a9017598..4e1fbe0dc0 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2861,6 +2861,6 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     tcg_temp_free_i32(fptr);
 
     /* End the TB, because we have updated FP control bits */
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
     return true;
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c8296116d4..00a6fe6752 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2931,7 +2931,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     tcg_temp_free_i32(tcg_reg);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
@@ -2953,7 +2953,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     store_reg(s, rn, tcg_reg);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 /* Store value to PC as for an exception return (ie don't
@@ -7312,7 +7312,7 @@ static void gen_srs(DisasContext *s,
         tcg_temp_free_i32(tmp);
     }
     tcg_temp_free_i32(addr);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 /* Generate a label used for skipping this instruction */
@@ -10361,7 +10361,7 @@ static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
     }
     if (a->E != (s->be_data == MO_BE)) {
         gen_helper_setend(cpu_env);
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
     return true;
 }
@@ -11084,7 +11084,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -11111,7 +11111,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
-- 
2.25.1

