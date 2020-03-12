Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087184lfc;
        Thu, 12 Mar 2020 12:42:28 -0700 (PDT)
X-Received: by 2002:a17:90a:364d:: with SMTP id s71mr5464369pjb.185.1584042148224;
        Thu, 12 Mar 2020 12:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042148; cv=none;
        d=google.com; s=arc-20160816;
        b=als3kcvXCzmukrua9Q+X4nE+GL/Sfk0fb1L8TXtbwgNs+uuYZ0ATjeMP7aFYcNAAN+
         cyOBQxzItCDfriZjsNooQyn/zGhYJBoTV2DjTm7JUlnmVqTLCfvtwd2PPSy0oriGSrVL
         Kjc0JDFGv4j8TVKO5r9WmRDWrhB6nrmZD5yx0JuATGqa9UFAdAODM+xPPTBpRSGu5+xR
         vnd+KA6wAF25v5kNPPaBWA0hDvriZvWrlJyxTL1xJaefKcxyG3d3xbg/7vuIyyKs1Sl9
         cgWk6mhNyuJfeU/nxctatUDK6oAWwtOHG8X4GjGNpc8+GfTDvsB2gq10HV8SRovlkehk
         5ewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/pGqR0ZT/lu7yV5pm4MglVp61s4Mp3dEdpOqchZImpI=;
        b=h7QxONBz7x6Kwsu/jngRMcmXrgCwNzTPqjAdcv3l5Q/zkM62aFasspeKIp5kOM0jCt
         eqgl+x+A50uEr8QLMsOF7TuRAXTanwaK37fDTBBYAbEWltSPpTTAWizDEij716qPfgsK
         2WosCqnBJcmEAy4wFOxPbIU577CWXPZWveHLMTBiKXZ4QlwdizR35Pg97NHpvpn7a/Hy
         wkxuQYoV+1tG+h2SCnYWfqBL4sCCBvGG0LHH4gJenUePpzj9VdgVkx3rGT7kpUbu9Beg
         NBcAHOmXTOpsECoOjZyeOrwTDKJFK1iNaJzBFpVrn9PakG32O1oiLa1uOs9ugF4xTmHT
         h+Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjnJenYd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mv3sor7023734pjb.23.2020.03.12.12.42.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjnJenYd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/pGqR0ZT/lu7yV5pm4MglVp61s4Mp3dEdpOqchZImpI=;
        b=ZjnJenYdXVG6ygE/hvwGUgJolEbNN7rTg4fkKZlbbgupjYkXXQpCk5HCZaC/BRndAg
         Sb2EC7oePEBHntT7+/ntA22H6yJ8EdKr79Qw4nUcT/O1YaVEE4UTIBRFNbekNmnDYJKl
         W2Yltewzxm04aQie/Qs+zlIZodGj85e5JlaZlt6qonWkzt9cu+TKUVljnHDMW1vBiu8t
         xdqNi6kOadEmGDExWf0aLVYMo8cfT3S4NPA7NDnv/ueaG4b91LRLZVDPNYEyzT/kUfAD
         v0OUYnYjwPzcSTQIIRFwZssBgvDk+8Xa63ur6oT4fDF4MySzIHQ1IqS9W0qh9LZM9c8h
         WSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pGqR0ZT/lu7yV5pm4MglVp61s4Mp3dEdpOqchZImpI=;
        b=KGTAfxX3YocYuQ/Ct1zK+GLChYEn51PnmudqXZxKUG0GenE1aK9cqMhYFl/uDbICZl
         89BBQQrBPnsQBEYlHqCmD/aLJ87l9VYmZpfuKVGtTYE+jH+DYGBDddKP8DTNBfiVtblR
         hDRAVtBPY8Kpz8Fu5rI+fzjs35DUGznsJuk4VpsXOsRystY4Ok23JbMZw2wS4vKVvxQj
         64HMcBWZkjVSVhhYV0ytEl2TBrEAiExInNQIfSr4ryN8u9zooi7hqgOSud457g5xpCr+
         QtcbRQZfTQ/Qxq9ULB6qvBnwgAU6ACZN+H+qjEDBLQ17giWQrhb0IuKfcei1mqWzChpt
         eWjg==
X-Gm-Message-State: ANhLgQ1B1IWdE4sPouGVe8dvY8hMLDbfmIgmSUagYPFTF74W41v21s8+
	wMZDCif7CyBGDtP7b6otG42+/5xt
X-Google-Smtp-Source: ADFU+vs5jLyNuoDQREiDOpSSrTfH2SYhM8rP0b36Jhg4f7MZ9bdvTvUYbVaU5wxZLfquXJb/q36xjg==
X-Received: by 2002:a17:90a:aa83:: with SMTP id l3mr5721193pjq.5.1584042147577;
        Thu, 12 Mar 2020 12:42:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 05/42] target/arm: Rename DISAS_UPDATE to DISAS_UPDATE_EXIT
Date: Thu, 12 Mar 2020 12:41:42 -0700
Message-Id: <20200312194219.24406-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IAT0jDTdxZo1

Emphasize that the is_jmp option exits to the main loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h         | 14 ++++++++------
 target/arm/translate-a64.c     |  8 ++++----
 target/arm/translate-vfp.inc.c |  2 +-
 target/arm/translate.c         | 12 ++++++------
 4 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d9ea0c99cc..41d6cc8db5 100644
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
index 8fffb52203..a793ec9ee1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1661,7 +1661,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         gen_helper_msr_i_daifclear(cpu_env, t1);
         tcg_temp_free_i32(t1);
         /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
         break;
 
     default:
@@ -1840,7 +1840,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
         /* I/O operations must end the TB here (whether read or write) */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
     if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
         /*
@@ -1855,7 +1855,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          * but allow this to be suppressed by the register definition
          * (usually only necessary to work around guest bugs).
          */
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
 }
 
@@ -14456,7 +14456,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, dc->base.pc_next);
             break;
         default:
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_a64_set_pc_im(dc->base.pc_next);
             /* fall through */
         case DISAS_EXIT:
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index b087bbd812..454bff6d01 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2867,6 +2867,6 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     tcg_temp_free_i32(fptr);
 
     /* End the TB, because we have updated FP control bits */
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
     return true;
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6259064ea7..5a21766cce 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2935,7 +2935,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     tcg_temp_free_i32(tcg_reg);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
@@ -2957,7 +2957,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     store_reg(s, rn, tcg_reg);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 /* Store value to PC as for an exception return (ie don't
@@ -7635,7 +7635,7 @@ static void gen_srs(DisasContext *s,
         tcg_temp_free_i32(tmp);
     }
     tcg_temp_free_i32(addr);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 /* Generate a label used for skipping this instruction */
@@ -10682,7 +10682,7 @@ static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
     }
     if (a->E != (s->be_data == MO_BE)) {
         gen_helper_setend(cpu_env);
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
     return true;
 }
@@ -11419,7 +11419,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -11446,7 +11446,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
-- 
2.20.1
