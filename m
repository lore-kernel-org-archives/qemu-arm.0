Received: by 10.25.159.19 with SMTP id i19csp858037lfe;
        Fri, 12 Feb 2016 06:37:13 -0800 (PST)
X-Received: by 10.66.151.177 with SMTP id ur17mr2560044pab.68.1455287833639;
        Fri, 12 Feb 2016 06:37:13 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com. [2607:f8b0:400e:c00::241])
        by mx.google.com with ESMTPS id f2si20378656pas.32.2016.02.12.06.37.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:37:13 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) client-ip=2607:f8b0:400e:c00::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x241.google.com with SMTP id 71so4065872pfv.1;
        Fri, 12 Feb 2016 06:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gU+yQTn56mnRlZm+IMNbBuBH+2/mqBKaEXs7+7o9Sx8=;
        b=z80ReV7yc5tHSO/x2MdVNFu2OhE/esPMlaLjbeueiDaroZzkG/WVYhPwZGLJrYGV3G
         2GoRslXTpVU14k9WhHuDqVKIDmqvo95FTsjTVhIy7/hfLytAm9EzAv7ciCBTuRaDKH1F
         pEeBcjG+MSn8tm0kAMAezlI/5Tkc3op/+bwZTSMYXBO5x8IYSqq1am4+YsmwNebLLW/2
         PB8FZNGzhyPlitQKxmPksTnPoL4fU5roRrB98vwgJxX1hN5UUP4L6Z4kMs055CGx+WEn
         eIef4sxWgAnMbtmwmDcBq4SxriTEhzpeU0/nQ+txlorkj/TgFxZdhh2LULp9P94YJHJV
         M3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gU+yQTn56mnRlZm+IMNbBuBH+2/mqBKaEXs7+7o9Sx8=;
        b=jOn88kMRAUL8drQMeYl0COUkQilHr2dntBSYE6edy1BzDPS2XHdVJFEfFA7nUAqsga
         dnymadrWexB05tcqf2wU1KWX5V+d5tOF7hCq65fDUdQWiBLCjxx2BCNHUKwsP3NgJVfg
         ZkMVsJeAcveu/aGImi6knQyGv/rYjEF3URzQ6KBwPOBuM/HBtqkThaovDiLw817N6U8D
         zkjNKnKxFHLjqFFQvOIlXrY9c2Dq4xhol0VkdzXDiXKddO79k333NJXaYiHpy65ID8Kb
         6+EqgXnRzKn5HIXFhhViu2cSmMUu7ECQoBI+M1iCuUPzmBzBLU6k1vKr4DHAPPCdAs1D
         T03w==
X-Gm-Message-State: AG10YORF+IzCCLXM7h5E+/0q5Fyjk0FzuHt/joS6Nk3JKZKPI0dyqteQ8FZEVaI3ab9kdQ==
X-Received: by 10.98.15.145 with SMTP id 17mr2553324pfp.19.1455287833308;
        Fri, 12 Feb 2016 06:37:13 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id m16sm19976134pfi.75.2016.02.12.06.37.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:37:12 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 9/9] target-arm: Use isyn.swstep.ex to hold the is_ldex state
Date: Fri, 12 Feb 2016 15:34:02 +0100
Message-Id: <1455287642-28166-10-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: o31lUVi+1UWx

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Switch to using isyn.swstep.ex to hold the is_ldex state for
SWStep syndrome generation.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/translate-a64.c | 6 +++---
 target-arm/translate.c     | 6 +++---
 target-arm/translate.h     | 5 -----
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 2f17cba..1d7fbcb 100644
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
@@ -11127,7 +11127,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
      */
     dc->ss_active = ARM_TBFLAG_SS_ACTIVE(tb->flags);
     dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
-    dc->is_ldex = false;
+    dc->isyn.swstep.ex = false;
     dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
 
     init_tmp_a64_array(dc);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 0d53e7d..605d21b 100644
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
@@ -11284,7 +11284,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
      */
     dc->ss_active = ARM_TBFLAG_SS_ACTIVE(tb->flags);
     dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
-    dc->is_ldex = false;
+    dc->isyn.swstep.ex = false;
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
 
     cpu_F0s = tcg_temp_new_i32();
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 2130a84..d500342 100644
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
-- 
1.9.1
