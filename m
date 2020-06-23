Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4342454lfm;
        Tue, 23 Jun 2020 12:39:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoD2vvY2GREd7kD6BMRMtiNeChf4qSn0vFucVrbVn5h4fQQQ4AlzI7FzKt3Wr+n6IzxQYs
X-Received: by 2002:a25:18d5:: with SMTP id 204mr31167190yby.209.1592941189602;
        Tue, 23 Jun 2020 12:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941189; cv=none;
        d=google.com; s=arc-20160816;
        b=MWxxgWasWjQxOdl0DDAvDdjOwVgaf8iDXuqragrRB6FPrzhyvwu71w+313gKp5gwX7
         F18VBpa5IBW2/SAiraSroOdNV83d6PjCJF82S7DTsPIRg0X3pF061wU8pfW2mxgymJDT
         Knm539/9KP1N0znG5dUyrgDJw3WXtFL5mWShSRgUJ3std8J9PcdlkcpJM9aPao10nI3Y
         MM29gpaN7EiJIqCkPMzx266VjZOJuI1+9AvpZIH6fDyOquq+ZbB1MQaJIsBNufoUWXTI
         5MeISPssaC9vxAFSxAf2u0L07e4kKsuZnBqcBw9WPzFJN6mILtuqeLBotfMeXlal3Rt0
         9TqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EemCmCeJAX9oRc6/PPaLb6AwYfBZhrshvT4SfsNOHuE=;
        b=vJpaf624SUdPhzNy7Yi8eXJoxb+i5LJndGkRZi76JlsjbQvh7waeejjTh0RloU9JOj
         FhO5KwO1asdYNssJk8Vqhc4mHui/GxqoyPKe4c4A4XdUlIN4WZsEzoBvLPbfmKbGMboZ
         kyTkC4rObzwi5Ov9jwAjpELlP0seUay4eYkImKZtgBB+y/9+bcUMAsTkNKME2aAPbMyf
         OXwT0dKI3Y/jKfC75rfQqtp/ZHVXorSrNUPxQT8BVagr1wQf/rSAgD3r5q0v46ZzrrY4
         04inc+ZTGILV7Qq7cnOmmEQEqmaUgpfH9ojqEEix3HVe/IcTlyLe8b7QfkhADYsaiBDv
         8N6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oKLCwT0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s71si18694074ybi.302.2020.06.23.12.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oKLCwT0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnoln-00008F-7I
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojH-0003IT-3r
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:11 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojE-0005Wf-R2
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:10 -0400
Received: by mail-pj1-x1034.google.com with SMTP id u14so1912366pjj.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EemCmCeJAX9oRc6/PPaLb6AwYfBZhrshvT4SfsNOHuE=;
 b=oKLCwT0ZKl8oFR6RrUUnQ85Qhv/iCETt+j8CdCZxFJ5JAemsTr6Njtp/lWYMVyRuzT
 ihd3JHUxOvOoYi1bTAZyEK1yoim2DUBGGRov/VoeF6Biba22dioBd4fuZ5s7TjKSAdIs
 jebp+VAPCxisN4NeSe/ju8RAeEN2nngNL4v7HfmfpHwXBVh1aLH+AGSwXRrfk0tssYeS
 dJO2aUyS0WjDBglZjQpdScvBi6B03llr8+lbmxH8c0IJjIcxKyyBkgr4PQCg6c0yRg4b
 P3Ut4w1gUFxM9D85zv9159xvLga9bshSm/QhXyndOnOP313os5BPwmdo5gMhVr+GKl9o
 V3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EemCmCeJAX9oRc6/PPaLb6AwYfBZhrshvT4SfsNOHuE=;
 b=VlNznyGgX2oQekC3JtiAXSYSg9G9WNoBDd6onHB0VJCcgE92tYA511pe94maq6uNX2
 eKBMnY4qIYT4HB7nErf0atN3sr9UciSPrepss+XAoosedT7/3MKuoov9cgCEr8w4RWll
 R/4Z3UAiLMdXBy8c0VKr1UBoy5Y0fxtByDViGbzEVY8PUUIT74tItqsTsyw4UgfyKm7N
 ZnLLXIisnz+o9GvAVHUaZ0Qbx9y2wuGS00J19vsFi0ZY4CHddc3bpGOz0swWNpvKJsw8
 vDlt8WFG2IoQJ3Xfqhgup8YXGJWjZgmYPbHJD2uk8w040XXVUcMRFFgvADcPFcIc6vYA
 104A==
X-Gm-Message-State: AOAM533RB6AezK1pKfJVADmIaSwZCxhtIWI4zUgrxs0OdVnOqwLDWO4C
 ifRUXV2Us0IzcpLQU6K8pJ73Pg==
X-Received: by 2002:a17:90a:8a98:: with SMTP id
 x24mr24661589pjn.103.1592941027376; 
 Tue, 23 Jun 2020 12:37:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/45] target/arm: Rename DISAS_UPDATE to DISAS_UPDATE_EXIT
Date: Tue, 23 Jun 2020 12:36:18 -0700
Message-Id: <20200623193658.623279-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: zudCmBVEN6PC

Emphasize that the is_jmp option exits to the main loop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h         | 14 ++++++++------
 target/arm/translate-a64.c     |  8 ++++----
 target/arm/translate-vfp.inc.c |  2 +-
 target/arm/translate.c         | 12 ++++++------
 4 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 62ed5c4780..6c01f47983 100644
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
index a0e72ad694..63029bbc59 100644
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
 
@@ -14304,7 +14304,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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
index 6d18892ade..45ea788370 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2876,7 +2876,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     tcg_temp_free_i32(tcg_reg);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
@@ -2898,7 +2898,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     tcg_temp_free_i32(tcg_tgtmode);
     tcg_temp_free_i32(tcg_regno);
     store_reg(s, rn, tcg_reg);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 /* Store value to PC as for an exception return (ie don't
@@ -6153,7 +6153,7 @@ static void gen_srs(DisasContext *s,
         tcg_temp_free_i32(tmp);
     }
     tcg_temp_free_i32(addr);
-    s->base.is_jmp = DISAS_UPDATE;
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
 }
 
 /* Generate a label used for skipping this instruction */
@@ -9202,7 +9202,7 @@ static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
     }
     if (a->E != (s->be_data == MO_BE)) {
         gen_helper_setend(cpu_env);
-        s->base.is_jmp = DISAS_UPDATE;
+        s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
     return true;
 }
@@ -9925,7 +9925,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-        case DISAS_UPDATE:
+        case DISAS_UPDATE_EXIT:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -9952,7 +9952,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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

