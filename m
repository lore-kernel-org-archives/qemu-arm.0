Received: by 10.25.208.211 with SMTP id h202csp31354lfg;
        Fri, 19 Feb 2016 12:05:37 -0800 (PST)
X-Received: by 10.98.0.84 with SMTP id 81mr20834328pfa.67.1455912337340;
        Fri, 19 Feb 2016 12:05:37 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com. [2607:f8b0:400e:c03::22c])
        by mx.google.com with ESMTPS id 7si15427779pfm.127.2016.02.19.12.05.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:05:37 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22c as permitted sender) client-ip=2607:f8b0:400e:c03::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22c as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x22c.google.com with SMTP id ho8so56910083pac.2;
        Fri, 19 Feb 2016 12:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9ftPWjHmmBvxfcfzm/KhRzkEFzATz+BoZKs6RO16zeM=;
        b=NKK2KGTESssCr6+Hu7IxNGQXOx7klMeHJBNHYeje8n/6ekS9WaGokzPV6b7A+wXREh
         K0cAMxQEsWA1MniAwYPo6n0697FvWi2j9QGwdTrs94otPBWsci+DwhELZbFepy+kLINQ
         KZq9kU5ZrNb0ITs9oYgzhpiIyno8co/yC3x+hkVOFldwRCafoEZfZ8MlXKSdr3cZjIWY
         hwjgM8Bgu+U5zkCwhRwj0DaTNSsTxuOpAvhkEqQflAqaMEQ391/96dbvLliFwfIMK6d4
         I5R0IJh1P9JvBzXCxN0X8fQWQ2gdzn/NUBpS2xeFmZjUkRBIxydcFwS4jNqjmhtGs5rj
         6BHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9ftPWjHmmBvxfcfzm/KhRzkEFzATz+BoZKs6RO16zeM=;
        b=lux6NREdZ89pA+vlfQIk/hKB31KXeCnm2glPN7F/xHnnOQqdvz4T7gSjgoTf17+nxS
         f8mv/YEmAk5ipRA4B6H32QXIbQnLatUt6DpPnV45yE/fwDK0gJpKqGDtkvYUmXCpc3E3
         rehjE6GAiqZ8rARfSneH4zFExbC37mT92oU836M9SnZu4YSE6SAJ9gVlVBG1bFJGAZgf
         j0ZUZ+WmKPOGngbQMd7/mUn6xM5GDagyV4gNJFEsohODRK0unJkXoYZr8tqOTaXKffhm
         H7kdQP+aRAtGaMvV0yszttWBDVqlzQm63B+X4rgRh2CyFoWxLB6YV5yh7UVonTBHqZZj
         i4ow==
X-Gm-Message-State: AG10YOQ1kpiAmY98R5uYwUvLsEkmFwqn9Gg1Eacf5N+WjQDpgEMP6Vwqi/nK9QxXjgQvCQ==
X-Received: by 10.66.252.100 with SMTP id zr4mr20277675pac.111.1455912336926;
        Fri, 19 Feb 2016 12:05:36 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id fl9sm19771576pab.30.2016.02.19.12.05.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:05:36 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 8/8] target-arm: Use isyn.swstep.ex to hold the is_ldex state
Date: Fri, 19 Feb 2016 21:04:52 +0100
Message-Id: <1455912292-23807-9-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: gr3yrFFhDYdo

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Switch to using isyn.swstep.ex to hold the is_ldex state for
SWStep syndrome generation.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/translate-a64.c |  6 +++---
 target-arm/translate.c     |  6 +++---
 target-arm/translate.h     | 13 ++++++++-----
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 5250c08..ab249d1 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -260,7 +260,7 @@ static void gen_step_complete_exception(DisasContext *s)
      * of the exception, and our syndrome information is always correct.
      */
     gen_ss_advance(s);
-    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex),
+    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->isyn.swstep.ex),
                   default_exception_el(s));
     s->is_jmp = DISAS_EXC;
 }
@@ -1865,7 +1865,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
 
     if (is_excl) {
         if (!is_store) {
-            s->is_ldex = true;
+            s->isyn.swstep.ex = true;
             gen_load_exclusive(s, rt, rt2, tcg_addr, size, is_pair);
         } else {
             gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, is_pair);
@@ -11136,7 +11136,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
      */
     dc->ss_active = ARM_TBFLAG_SS_ACTIVE(tb->flags);
     dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
-    dc->is_ldex = false;
+    dc->isyn.swstep.ex = false;
     dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
 
     init_tmp_a64_array(dc);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 7d83c94..5aee066 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -250,7 +250,7 @@ static void gen_step_complete_exception(DisasContext *s)
      * of the exception, and our syndrome information is always correct.
      */
     gen_ss_advance(s);
-    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex),
+    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->isyn.swstep.ex),
                   default_exception_el(s));
     s->is_jmp = DISAS_EXC;
 }
@@ -7431,7 +7431,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
 
-    s->is_ldex = true;
+    s->isyn.swstep.ex = true;
 
     switch (size) {
     case 0:
@@ -11341,7 +11341,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
      */
     dc->ss_active = ARM_TBFLAG_SS_ACTIVE(tb->flags);
     dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
-    dc->is_ldex = false;
+    dc->isyn.swstep.ex = false;
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
 
     cpu_F0s = tcg_temp_new_i32();
diff --git a/target-arm/translate.h b/target-arm/translate.h
index e002c90..1c4c087 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -49,11 +49,6 @@ typedef struct DisasContext {
      */
     bool ss_active;
     bool pstate_ss;
-    /* True if the insn just emitted was a load-exclusive instruction
-     * (necessary for syndrome information for single step exceptions),
-     * ie A64 LDX*, LDAX*, A32/T32 LDREX*, LDAEX*.
-     */
-    bool is_ldex;
     /* True if a single-step exception will be taken to the current EL */
     bool ss_same_el;
     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
@@ -69,6 +64,14 @@ typedef struct DisasContext {
             bool sf;
             bool ar;
         } dabt;
+        /* SWStep section.  */
+        struct {
+            /* True if the insn just emitted was a load-exclusive instruction
+             * (necessary for syndrome information for single step exceptions),
+             * ie A64 LDX*, LDAX*, A32/T32 LDREX*, LDAEX*.
+             */
+            bool ex;
+        } swstep;
     } isyn;
     /* TCG op index of the current insn_start.  */
     int insn_start_idx;
-- 
1.9.1
