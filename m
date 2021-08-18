Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1017145lfg;
        Tue, 17 Aug 2021 18:03:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy17XAr5HJgUHTlP8+Hwjx397Amqv7z0062+BqChLMKFjovm1q7T8Sa4tVCz3sDELSDSXx
X-Received: by 2002:a05:6102:5c5:: with SMTP id v5mr5558859vsf.20.1629248637305;
        Tue, 17 Aug 2021 18:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629248637; cv=none;
        d=google.com; s=arc-20160816;
        b=G82DAkP7iZ8S2NlPuZzC42jow3mTuCvRYztyEh2aNxHNx6tDOEos7LoVB8kLjnf1BN
         SiDk5RAIhjWdTyceIxwtmuZARQnb63dlyBv90ZX8Aa7y4kvPGWZ7HDIsqlYKbO1n8mxX
         6ogO8b7zHDX8oZ/XQW8fZnUVoqsw0XEtxQMpk2nQovpsSpYcntdf94VE7KbzrZAW2j57
         I2LUJH7UFfEBJ5mapeTkQs+w/DQwwSBcsiRdFUzcTRssoT93j3yNh26o6w74vEGvxZcZ
         +qr39nAVJuiaRNmRGTcRMnOmYuIVErGH5IrwrxqFcZOpTGePDbkiHPImpP2rR+a5k/XN
         gg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9JnJtkEPTQMAjak+m0xZ67Hy1xtLIgwP8K1eaZAkDt4=;
        b=riglF066aOnidF8RoQl5C7M0LrBuuTjHRIymZDjw03ut6UnkXzi8FuirNlQIjkhoZP
         xjybl1rqHgbelyKT/ozbHw6rGhEZ3tUGU4qtS9b01x6PHQ56NizcAgD2bqr39RoW7Tql
         v2+dovZctF/Lx4Ln3HhaO4Ezm7R8+q7WY4DPeuVXo9Em2wSnuRv8boPWkdwLtv/J/7N0
         QXO7gubIhICIY+fC7cEDc6usKmM2+qiTjB0PhqHEpXaUIVDZDpcWcoqIG0UMHttTgUR0
         SgcMliAI5MCJoFf6xUnmSMtdMLwlaBaciGLeWt1Bks01Yq+rLEB/EM45pWJTEaHtmOyR
         EEbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uC4PHSgA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si2271624vsi.291.2021.08.17.18.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 18:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uC4PHSgA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG9zo-00084p-Ix
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 21:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wt-00048i-2J
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wo-0001Ml-1r
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id j187so479051pfg.4
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 18:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9JnJtkEPTQMAjak+m0xZ67Hy1xtLIgwP8K1eaZAkDt4=;
 b=uC4PHSgAiYGMlCUl2+nejJRDGIPp62kGaPvAELQo1q0Nn/HCBHWrZFG+KO4EGkSgfx
 UJRNtTCSAImICZUb2fg18/QRsS2yKlGAetb9KezYWZc8zZxlDR+aGhRcg1QSqo6CdZr/
 UIsDPp3/SfT+FRUKX9WbljwxuWF5ED4hE79JXAI+Mui2VQ9UmEHy2Pbc+9BX7RW0BhgB
 0is8KSSBywN7Z9WIbZ+5Xb0kIpfS14dHMr0U5F+G+EmC7ispn49VR1CieeO2oOWvMSLU
 EdwOBRMmzden/mxEbblSJfl4LHdIIkmQOBLP96KJOynTZ3+0/NHX40oU2AqcucqRPKVv
 I26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JnJtkEPTQMAjak+m0xZ67Hy1xtLIgwP8K1eaZAkDt4=;
 b=lKD7ujUgiZqZskfaCGy4rQhl/tqx1Gbum6fbinTWBim8vU2XCYfIGkrRS9RrDUl3Ds
 UBydlH3BaPFZtMcSuSytKXxAwD4P9AxE4NopaI9+xbC+aiT7mZOC55fBlx+MBECRUpkb
 6h7OxAFEEpWno/5sKOettUouLW4NOl2mKF75xbGBGutWpivo6Yyhh///on9sHJM83vw+
 ANZN7OZ1ot28yOVWPmp/WZzy013o9VK9FF41miunKqmMx/yUCY5X7UIc31tZqLLtWCwu
 ZYplklgism0DTpFYQtuuvS2rh1fjkxq98pwF+M22SAS3hwI2FCJ1mXSOMc6PdHCiEsCG
 Viwg==
X-Gm-Message-State: AOAM5309c414UOvTv80GfLs76MqUdYFgquaLBpuRlk79D8K8oFezdgBY
 4lTEshHyOjrn/797AvljKG16w2lHDGIQQQ==
X-Received: by 2002:aa7:8754:0:b0:3e2:1de:4f92 with SMTP id
 g20-20020aa78754000000b003e201de4f92mr6534416pfo.16.1629248448691; 
 Tue, 17 Aug 2021 18:00:48 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id r13sm4567422pgl.90.2021.08.17.18.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:00:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
Date: Tue, 17 Aug 2021 15:00:40 -1000
Message-Id: <20210818010041.337010-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818010041.337010-1-richard.henderson@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4q7xuACWgbze

For A64, any input to an indirect branch can cause this.

For A32, many indirect branch paths force the branch to be aligned,
but BXWritePC does not.  This includes the BX instruction but also
other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
With v8, this is CONSTRAINED UNDEFINED and may either raise an
exception or force align the PC.

We choose to raise an exception because we have the infrastructure,
it makes the generated code for gen_bx simpler, and it has the
possibility of catching more guest bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h      |  5 ++++
 target/arm/translate-a64.c | 12 +++++++++
 target/arm/translate.c     | 50 +++++++++++++++++++++++++++-----------
 3 files changed, 53 insertions(+), 14 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index c590a109da..569b0c1115 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -275,4 +275,9 @@ static inline uint32_t syn_illegalstate(void)
     return EC_ILLEGALSTATE << ARM_EL_EC_SHIFT;
 }
 
+static inline uint32_t syn_pcalignment(void)
+{
+    return EC_PCALIGNMENT << ARM_EL_EC_SHIFT;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 333bc836b2..c394bddac6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14754,6 +14754,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     CPUARMState *env = cpu->env_ptr;
     uint32_t insn;
 
+    /* Singlestep exceptions have the highest priority. */
     if (s->ss_active && !s->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -14771,6 +14772,17 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         return;
     }
 
+    if (s->base.pc_next & 3) {
+        /*
+         * PC alignment fault.  This has priority over the instruction abort
+         * that we would receive from a translation fault via arm_ldl_code.
+         */
+        gen_exception_insn(s, s->base.pc_next, EXCP_UDEF,
+                           syn_pcalignment(), default_exception_el(s));
+        s->base.pc_next = QEMU_ALIGN_UP(s->base.pc_next, 4);
+        return;
+    }
+
     s->pc_curr = s->base.pc_next;
     insn = arm_ldl_code(env, s->base.pc_next, s->sctlr_b);
     s->insn = insn;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5e0fc8a0a0..00ddd4879c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9452,19 +9452,8 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool arm_pre_translate_insn(DisasContext *dc)
+static bool arm_check_ss_active(DisasContext *dc)
 {
-#ifdef CONFIG_USER_ONLY
-    /* Intercept jump to the magic kernel page.  */
-    if (dc->base.pc_next >= 0xffff0000) {
-        /* We always get here via a jump, so know we are not in a
-           conditional execution block.  */
-        gen_exception_internal(EXCP_KERNEL_TRAP);
-        dc->base.is_jmp = DISAS_NORETURN;
-        return true;
-    }
-#endif
-
     if (dc->ss_active && !dc->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -9485,6 +9474,21 @@ static bool arm_pre_translate_insn(DisasContext *dc)
     return false;
 }
 
+static bool arm_check_kernelpage(DisasContext *dc)
+{
+#ifdef CONFIG_USER_ONLY
+    /* Intercept jump to the magic kernel page.  */
+    if (dc->base.pc_next >= 0xffff0000) {
+        /* We always get here via a jump, so know we are not in a
+           conditional execution block.  */
+        gen_exception_internal(EXCP_KERNEL_TRAP);
+        dc->base.is_jmp = DISAS_NORETURN;
+        return true;
+    }
+#endif
+    return false;
+}
+
 static void arm_post_translate_insn(DisasContext *dc)
 {
     if (dc->condjmp && !dc->base.is_jmp) {
@@ -9500,7 +9504,25 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     CPUARMState *env = cpu->env_ptr;
     unsigned int insn;
 
-    if (arm_pre_translate_insn(dc)) {
+    /* Singlestep exceptions have the highest priority. */
+    if (arm_check_ss_active(dc)) {
+        dc->base.pc_next += 4;
+        return;
+    }
+
+    if (dc->base.pc_next & 3) {
+        /*
+         * PC alignment fault.  This has priority over the instruction abort
+         * that we would receive from a translation fault via arm_ldl_code
+         * (or the execution of the kernelpage entrypoint).
+         */
+        gen_exception_insn(dc, dc->base.pc_next, EXCP_UDEF,
+                           syn_pcalignment(), default_exception_el(dc));
+        dc->base.pc_next = QEMU_ALIGN_UP(dc->base.pc_next, 4);
+        return;
+    }
+
+    if (arm_check_kernelpage(dc)) {
         dc->base.pc_next += 4;
         return;
     }
@@ -9570,7 +9592,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
-    if (arm_pre_translate_insn(dc)) {
+    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next += 2;
         return;
     }
-- 
2.25.1

