Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp397239ejs;
        Wed, 16 Aug 2023 07:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA4vbwDPb7X48sDxpWIX4iamWfXig9VpmI7CGUp6+lpKj8gcvS38mG/eFDfpvaXXc7chtV
X-Received: by 2002:a05:620a:458a:b0:76c:e2db:42b0 with SMTP id bp10-20020a05620a458a00b0076ce2db42b0mr2621932qkb.64.1692196069493;
        Wed, 16 Aug 2023 07:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692196069; cv=none;
        d=google.com; s=arc-20160816;
        b=Xzz4HjO23lUqZxcDnfVfnqL+rlwahOyKcZCZQpF8QryIPccFa2cGCihAPe8qjU3pYS
         0/sMGS36WRdQ+ISrBd+On0D9lYtnm6CTbw9yYDOHT+w86a1IT40qkDJ4mzFpfYWfv2tI
         YT936pcu6CVeWnpMqNfHF+bQ1E0ilj2F0mWDOTR4SNgRc1WH+nUMCsrXA3FX6WfOAT+m
         N4ouaQRz0SwBUohmuj+rUFDjtWskjvkvgHipQP+OF8p+emVutKFfKKGuIddu551b4sdy
         hCrqvaMQdZV2GsiSmThKXhgkfYQTJtKYoFnde83Y1aPyPehzj7T18f8L+bIUGGevrO10
         LgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=72KfGjWBTb1YdYpl3rRLl1lNIdpPvxIAybrfsJIzoH4=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=aRn69oH1seKc6fk9F41yDbztd+qynLxeTktlflg/ib8Sfw51aCi1ERZJ09ab86BzsL
         n5YD6QhTUTVrb4xrWr4payrYMbrGmneKuHafDs+g8tJbaIn/n0UyzJoGhH+tQBM8nLKt
         GGD9cSF07G+QRp/H1NNt0bPwlRYDh3Sl0i4mOZlGD57nLlsAIgTbjUKb38w5YCzj0vIZ
         aIT5z44EiSPZb/vBJV6HkL1jmtW9OaQoMTyPfFlTagEiBv80tD5z2W/0vdGf+rT0/E9B
         xkiqU5ZyY6/rxNY6nluiIj/V1K4o9lAgnB3nYRrlN0VRe1rNMhs1KEaqqm6QBaYeI608
         jMFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CGI7VANI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a05620a0c0500b007683e92072dsi8595369qki.179.2023.08.16.07.27.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Aug 2023 07:27:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CGI7VANI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qWHSi-00043I-3v; Wed, 16 Aug 2023 10:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qWHSf-0003xC-OH
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 10:25:25 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qWHSc-0003kI-0x
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 10:25:25 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68890d565b5so491864b3a.2
 for <qemu-arm@nongnu.org>; Wed, 16 Aug 2023 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692195921; x=1692800721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=72KfGjWBTb1YdYpl3rRLl1lNIdpPvxIAybrfsJIzoH4=;
 b=CGI7VANIT8WO7Jmcpk+SUz+0TfSaYiCcxGNxg/UfK+xdVTDI0elHiAHEMboWC98lKq
 grGYPoX0LZsK0DG0GgvQFoUnIMAf5pr3Doqgh1J5VhsOXar7U0xb1ru1WM620X2Lqn/E
 zMo0qlkhNN+KC9zLbiaU5fc0t+DI9Es+44Mh2uCmReJ+8wClQeO41yNDnUtXiJXgCveW
 GBT5q2/zZrwvbPNZ9JQKbHMXfJdYLTQ4WbKaJm3AVjTSWH6MA7ijNJzXs9z1koEDZY6P
 IOkJbIIepXG//v4DBF3+BS5oZH2zthZ9DQfA6hDvj9XIuZKvFoKYtMG+XnyVxQiSKQxS
 Csrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692195921; x=1692800721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72KfGjWBTb1YdYpl3rRLl1lNIdpPvxIAybrfsJIzoH4=;
 b=LPHg7sTxKLJQ/73DdZd+deu5R+sMQlxj3JTNZkxTk+jsmbc3duucJuhr4X2f4AiOLH
 R/nhjRnClfAP4ybFM8QMfQEIKjpGMuoHYWxETXuhdoMxyN+sPFxTh33/wPrI4IjIKHtW
 +RvaFIypYAA3FZygx0mvSBaZ5gKduzyRgJhuta951fCeQQJYm4Fkj5MUk3VEz31pX+aR
 cMLlDHRTBLsn59VDJ8IhVanDZGy/pWDT9gm5zqE7fhvadArervbPWswkqjFwDo87bXt1
 uW2fhAAKk4+sAVr3Ez8yoghq2OuxBEsM6SLOJXT1G9GDLRV7FJBUDYzsZ7bSpWM233Vd
 bDBQ==
X-Gm-Message-State: AOJu0YxmwvJk6ukA1Rn5ztx0Zbk63EMKBNhCIFOAAb/5eUhL+75uKLfZ
 eS4ePPoQH6p+/e7f55ZOXfgf21xOEZMmC5vzwV8=
X-Received: by 2002:a05:6a00:22cb:b0:688:4909:d79d with SMTP id
 f11-20020a056a0022cb00b006884909d79dmr2086405pfj.25.1692195920693; 
 Wed, 16 Aug 2023 07:25:20 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:a064:e3f9:a812:973b])
 by smtp.gmail.com with ESMTPSA id
 i12-20020aa78b4c000000b00678cb337353sm11156019pfd.208.2023.08.16.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:25:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/4] tcg/aarch64: Emit BTI insns at jump landing pads
Date: Wed, 16 Aug 2023 07:25:15 -0700
Message-Id: <20230816142516.469743-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816142516.469743-1-richard.henderson@linaro.org>
References: <20230816142516.469743-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q7WOMFXN9gHm

The prologue is entered via "call"; the epilogue, each tb,
and each goto_tb continuation point are all reached via "jump".

As tcg_out_goto_long is only used by tcg_out_exit_tb, merge
the two functions.  Change the indirect register used to
TCG_REG_TMP1, aka X16, so that the BTI condition created
is "jump" instead of "jump or call".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 49 +++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 8d71ac68f6..fca5baea57 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -602,6 +602,10 @@ typedef enum {
     DMB_ISH         = 0xd50338bf,
     DMB_LD          = 0x00000100,
     DMB_ST          = 0x00000200,
+
+    BTI_C           = 0xd503245f,
+    BTI_J           = 0xd503249f,
+    BTI_JC          = 0xd50324df,
 } AArch64Insn;
 
 static inline uint32_t tcg_in32(TCGContext *s)
@@ -843,6 +847,17 @@ static void tcg_out_insn_3313(TCGContext *s, AArch64Insn insn,
               | rn << 5 | (rd & 0x1f));
 }
 
+static void tcg_out_bti(TCGContext *s, AArch64Insn insn)
+{
+    /*
+     * While BTI insns are nops on hosts without FEAT_BTI,
+     * there is no point in emitting them in that case either.
+     */
+    if (cpuinfo & CPUINFO_BTI) {
+        tcg_out32(s, insn);
+    }
+}
+
 /* Register to register move using ORR (shifted register with no shift). */
 static void tcg_out_movr(TCGContext *s, TCGType ext, TCGReg rd, TCGReg rm)
 {
@@ -1351,18 +1366,6 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     tcg_out_insn(s, 3206, B, offset);
 }
 
-static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
-    if (offset == sextract64(offset, 0, 26)) {
-        tcg_out_insn(s, 3206, B, offset);
-    } else {
-        /* Choose X9 as a call-clobbered non-LR temporary. */
-        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_X9, (intptr_t)target);
-        tcg_out_insn(s, 3207, BR, TCG_REG_X9);
-    }
-}
-
 static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
@@ -1947,12 +1950,23 @@ static const tcg_insn_unit *tb_ret_addr;
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 {
+    const tcg_insn_unit *target;
+    ptrdiff_t offset;
+
     /* Reuse the zeroing that exists for goto_ptr.  */
     if (a0 == 0) {
-        tcg_out_goto_long(s, tcg_code_gen_epilogue);
+        target = tcg_code_gen_epilogue;
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_X0, a0);
-        tcg_out_goto_long(s, tb_ret_addr);
+        target = tb_ret_addr;
+    }
+
+    offset = tcg_pcrel_diff(s, target) >> 2;
+    if (offset == sextract64(offset, 0, 26)) {
+        tcg_out_insn(s, 3206, B, offset);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP1, (intptr_t)target);
+        tcg_out_insn(s, 3207, BR, TCG_REG_TMP1);
     }
 }
 
@@ -1970,6 +1984,7 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     tcg_out32(s, I3206_B);
     tcg_out_insn(s, 3207, BR, TCG_REG_TMP0);
     set_jmp_reset_offset(s, which);
+    tcg_out_bti(s, BTI_J);
 }
 
 void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
@@ -3062,6 +3077,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 {
     TCGReg r;
 
+    tcg_out_bti(s, BTI_C);
+
     /* Push (FP, LR) and allocate space for all saved registers.  */
     tcg_out_insn(s, 3314, STP, TCG_REG_FP, TCG_REG_LR,
                  TCG_REG_SP, -PUSH_SIZE, 1, 1);
@@ -3102,10 +3119,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * and fall through to the rest of the epilogue.
      */
     tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
+    tcg_out_bti(s, BTI_J);
     tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_X0, 0);
 
     /* TB epilogue */
     tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
+    tcg_out_bti(s, BTI_J);
 
     /* Remove TCG locals stack space.  */
     tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_SP, TCG_REG_SP,
@@ -3125,7 +3144,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 static void tcg_out_tb_start(TCGContext *s)
 {
-    /* nothing to do */
+    tcg_out_bti(s, BTI_J);
 }
 
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
-- 
2.34.1

