Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp48820lfm;
        Thu, 25 Jun 2020 20:34:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvrVOOnbjdskXg0bxljGotpYCOnPmiVaDnccFGk0ymUG04/LTT/TKHBX7qkucJI3YzezyP
X-Received: by 2002:a25:be05:: with SMTP id h5mr1621860ybk.431.1593142454160;
        Thu, 25 Jun 2020 20:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142454; cv=none;
        d=google.com; s=arc-20160816;
        b=KFCaVGVl1wmXthyFjAPrWMCm0V8odQmfXEW6JHelydC56s6pQphwF1gbvSBRAmu0sA
         kGS4GIumBlrR2g1BtcMIGNnyley2PDcteOO9Sk+qvm26qv+KnZcHNb+4C+nXYlwkXYGu
         ZU/CwYIzOnZv9zotM4I8hLHvXLPJyOYMAFzQOxHDxVuowxNVPl7MyUpWGVyJyGdqPssc
         Swb6os4FSAVAl1TwSZKu+yIPUNaFX7OQk9gqDgTl3jdd8gkjQT4ZQxx8P2yD6Zn6ORWE
         kSQy5ZvbkmrFitFaI3RLZ4R6Qa142xFjZWkTsDeV3GWUxsAmR03eknXWo5hwAkd3aCh8
         8pxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9ylDk8PkvrYo5RCWHHinf/7TvINaMJjZipC+Ie2QRVo=;
        b=vbhrlEf1v9pKRoI/85gIZhvurUEdQs2hT8OSPulDz8dOVx9V2hL26h9B2fwRNCMa3A
         ZzeJcUlmlWUqImuS9890LmtenC5RSu3msGb5PoVnm8VEH5OxiHSn+5s2wkqAc32OV6m0
         8FbfmwTE2Dtl5XOIE/j9CcBVvG6m28uLP0N7xepIC5YmMyd8+4gdISRLGlyyM+hOmmw3
         BTfPxhV4KE3js2t44IXZ6hd5r2dLrjgc0Tj1UkCNimuqxvJi7x2yMwe5EgBcqvoXYplD
         oc3sqTdbm1Svmbs1LC3pMSbjE0PI7q+kJQJO8TUtxXzqbrm1F2TyuY0nyoSfT1dG9XNU
         zphA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Av9D5SVX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i35si23277735ybj.430.2020.06.25.20.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Av9D5SVX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jof81-0003zx-Co
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5o-0007sg-MO
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:31:56 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5m-0001kG-LS
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:31:56 -0400
Received: by mail-pf1-x429.google.com with SMTP id j12so4045087pfn.10
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ylDk8PkvrYo5RCWHHinf/7TvINaMJjZipC+Ie2QRVo=;
 b=Av9D5SVXBUcZ4gKVk1sJ6jZ3kqKdR+oq0o3j5rUn95/Y5bzTN8P3CbDDaezEl7gHGL
 c8s12z9D6zLM/xIqoMHyNrhUaYg2RzYwgiSirkdY0psGsf3VHvN15DVZZteiWN380mZt
 YBoqNPqYAlgm7dX0mITlzzfmp2XQ/mzRJ5MFKLS8raltAbnWHxa0jqirC3kwyeBPUcbN
 uFw30/U267gj4cZYhZt632ZE3nDdzm60lEI+bTE+5PykyGZcQi5vREhmKNcK6tJt/+4j
 wbGK+rAlTUacnY20ih0G+VOE06qi8DvSQUWo9kjAe35A0c35TOkdF4kdKnLbmupE5VLI
 IRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ylDk8PkvrYo5RCWHHinf/7TvINaMJjZipC+Ie2QRVo=;
 b=gydkRFHsLlMuTVaKstDfd1tJdVQ2bsdSSJuDqX/uYdbNk+mPksZkcoCPezynfnpreN
 TZYmCTsowC/28eiPTJKHYEZX0YJXfUGiOBT231KQmyn6eUTIYV2XjibjiD4xYEnlyPyM
 ZiYcopJPtYDmVXc/ApelYNwAm6vrW7okSVDflZutN4wMaGMAXtdrclckg43GFZKmuSYd
 EemEiETzugkg1rMOV8qJjYDqXXtBmeD6pNQO8I+roHxL30/6QnQCDMf5bMsdBiHmZY/8
 RGMMi5Nf94ckmoSuTl/kiy1Zi1QjCIFmfFQnhZZcRGMP0UbZFHWI3faKiPxseSLJ6MCf
 57ZQ==
X-Gm-Message-State: AOAM532voa6lrlAKr4hNj1yY48I8W3+3vvKNpzFzf7P7FH6kGkNljM1s
 f0PpGyQGC2zbz0LpcElhqGWLiQ==
X-Received: by 2002:a63:7c51:: with SMTP id l17mr899185pgn.303.1593142313248; 
 Thu, 25 Jun 2020 20:31:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:31:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 05/46] target/arm: Rename DISAS_UPDATE to DISAS_UPDATE_EXIT
Date: Thu, 25 Jun 2020 20:31:03 -0700
Message-Id: <20200626033144.790098-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: soJpRYphHPCO

Emphasize that the is_jmp option exits to the main loop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h         | 14 ++++++++------
 target/arm/translate-a64.c     |  8 ++++----
 target/arm/translate-vfp.inc.c |  4 ++--
 target/arm/translate.c         | 12 ++++++------
 4 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 19650a9e2d..d5edef2943 100644
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
index 4cef862c41..e4795ae100 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1616,7 +1616,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         gen_helper_msr_i_daifclear(cpu_env, t1);
         tcg_temp_free_i32(t1);
         /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
         break;
 
     default:
@@ -1795,7 +1795,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
         /* I/O operations must end the TB here (whether read or write) */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
     if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
         /*
@@ -1810,7 +1810,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          * but allow this to be suppressed by the register definition
          * (usually only necessary to work around guest bugs).
          */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
 }
 
@@ -14292,7 +14292,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, dc->base.pc_next);
             break;
         default:
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_a64_set_pc_im(dc->base.pc_next);
             /* fall through */
         case DISAS_EXIT:
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index bf31b18657..afa8a5f888 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -123,7 +123,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
              * this to be the last insn in the TB).
              */
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                s->base.is_jmp = DISAS_UPDATE;
+                s->base.is_jmp = DISAS_UPDATE_EXIT;
                 gen_io_start();
             }
             gen_helper_v7m_preserve_fp_state(cpu_env);
@@ -2860,6 +2860,6 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     tcg_temp_free_i32(fptr);
 
     /* End the TB, because we have updated FP control bits */
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
     return true;
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 795964da1f..146ff5ddc2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2775,7 +2775,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     tcg_temp_free_i32(tcg_reg);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
@@ -2797,7 +2797,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     store_reg(s, rn, tcg_reg);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 /* Store value to PC as for an exception return (ie don't
@@ -5114,7 +5114,7 @@ static void gen_srs(DisasContext *s,
         tcg_temp_free_i32(tmp);
     }
     tcg_temp_free_i32(addr);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 /* Generate a label used for skipping this instruction */
@@ -8160,7 +8160,7 @@ static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
     }
     if (a->E != (s->be_data == MO_BE)) {
         gen_helper_setend(cpu_env);
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
     return true;
 }
@@ -8873,7 +8873,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -8900,7 +8900,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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

