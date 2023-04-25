Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3721735ejm;
        Tue, 25 Apr 2023 12:45:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZYpf+Fubs785oUdgN0A4cp10eRLsGpbZGwxc37XmxV4O4o7c9Vnmy7/88GLHJ0NJBO/p+1
X-Received: by 2002:a05:622a:190c:b0:3ef:6818:c937 with SMTP id w12-20020a05622a190c00b003ef6818c937mr16710174qtc.1.1682451907242;
        Tue, 25 Apr 2023 12:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451907; cv=none;
        d=google.com; s=arc-20160816;
        b=LRoLJhak3pFnRqr4dIKVDM2Ov37rN9F/Ow9vf4QAke18BYmsP9rXv88MJ2AmpKDmT0
         26+xk6ac/Fg4YtemzQG8cCvvHAuoW1wYzkIjYmVvXahM1BqsY0cFYol5MwMLoTkvl8tm
         YU7u2sfCfj/Kf+TAvQpqTamid01DG2De9lABrH0dgt/3uhvDO1bP5hwKDxVg2ZF20Ug/
         6GZBjcqtpAFcXDmJ4BYs323nOLv+1635FPY0p4B6javhOis7Iu5gMgrnb+xDgVvCwZ2p
         HTbLZeQ79EMs4zvV7d7WHszq3OQX3yWKRlV/ORPGn6lz7c+zXajw/96hk54XcjiJkIHB
         1QXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oGeKBjwjj2E8w/f9+TfXbJ+6j6aLsf9VhcvO9oNW35I=;
        b=p1eoaG96nvPUV5m0amlHwJTa9+l8aLH6iokLLehnDjMGW/A7FqXfaLKdzH7q34LvpH
         uFVVHeQ3xTYCaFv/OoiVVEKR1DqtWHMu5YVKVbboioPdpVAu2Sp3A6A5bMWntbjIwqwV
         58Em6+ZEYt8Voq60fFcb0+W3UO7Ro7gBlmNoih0MWAfDvzC6LIcgDF72YvVI6Xvf0fcr
         skk26WKqHSWdac3v20O4GUfpflHL5DZ7rLBC3KLSxvDyqaa1KntYucz527jRf0cfnAqW
         jwgsCCwu46td2qGEvhdsmkekFNF3Q+YZJzIlPVC25UCoxPBm28vq5VOeHF4g1h9ZwnYz
         Q4tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NrntvLZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22-20020ac85b56000000b003e387a06148si9023087qtw.586.2023.04.25.12.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NrntvLZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOR2-00043i-PY; Tue, 25 Apr 2023 15:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQl-0003dA-4D
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:27 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQZ-0004mP-EK
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:26 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2a8a600bd05so59241811fa.2
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451253; x=1685043253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGeKBjwjj2E8w/f9+TfXbJ+6j6aLsf9VhcvO9oNW35I=;
 b=NrntvLZJUfj0+vtXua8gkDNDcStI/DQgjhUuy3ko37kA2ecnz+5WMYTg9QTrUnapJk
 dzPqJAkJrIS+bRbqh9ORJByMZltD5WTyIe9N67dcpW3ZjunbH3gwo11xq86JsZogFvmx
 T/BUuEwvV+rmiOLd25eKwY+9Gnwkt4WuyO24Gr0tozJ/j4RHA0ih1medIxJichTH4r/A
 T5+6zVHiZVja2r7Mv+Zg0PxK/2AZd0DwBqmw5LwYnFKNXTjK/d15h28HPeNUNYyM5nBJ
 6xTa0tNRjraQe2bz/0wXAOh+/KhKFDm5koVY51PpGUgYkoOpDYc8M2MYB7Gpgao/6nmA
 v0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451253; x=1685043253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGeKBjwjj2E8w/f9+TfXbJ+6j6aLsf9VhcvO9oNW35I=;
 b=fdB48NHhCH8f8soQLfqhxITVyMYDwNznf3lRK5D2xmWogn9hB/6ZkxcEu5TdyoWaZg
 HtZvS0JVND3Spwe00eIHzqjyFCZPzgl0kEJi1iQ2L1aGdoT0Yjs2tjZKX/tu/oTOTJAL
 MpZAx/iON+Y+G8ipQGVstdFspb72w1uZqQoL1ZV36WqsQk0dZ0JXIttMjXSfKTyaYlpV
 43hKTDd+KoVF7vf3OyIOSuK1D7U7vVjiO0SpU8h8WMr3kRfY9YhbDcGECLh+fyL8bVkE
 /yBvPIgNX0hOOOa6RySEMcBfLkglWIpEVn8vGiraUwmlZX6BTEtF5dojMRfiVOY0kAnf
 A80w==
X-Gm-Message-State: AAQBX9czJJbJhdRD723N3uENthGzfPP6Z/YoPhyatf2OGM6Q05iNfNrw
 Lz0CYSt7jscVclRXvb8DmhYJwOJDpfstAkyglvT9Eg==
X-Received: by 2002:a2e:9c03:0:b0:2ab:e50:315a with SMTP id
 s3-20020a2e9c03000000b002ab0e50315amr2185784lji.51.1682451253648; 
 Tue, 25 Apr 2023 12:34:13 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 20/57] tcg: Introduce TCG_OPF_TYPE_MASK
Date: Tue, 25 Apr 2023 20:31:09 +0100
Message-Id: <20230425193146.2106111-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: pzTdZu36OOt5

Reorg TCG_OPF_64BIT and TCG_OPF_VECTOR into a two-bit field so
that we can add TCG_OPF_128BIT without requiring another bit.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 22 ++++++++++++----------
 tcg/optimize.c               | 15 ++++++++++++---
 tcg/tcg.c                    |  4 ++--
 tcg/aarch64/tcg-target.c.inc |  8 +++++---
 tcg/tci/tcg-target.c.inc     |  3 ++-
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b19e167e1d..efbd891f87 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -932,24 +932,26 @@ typedef struct TCGArgConstraint {
 
 /* Bits for TCGOpDef->flags, 8 bits available, all used.  */
 enum {
+    /* Two bits describing the output type. */
+    TCG_OPF_TYPE_MASK    = 0x03,
+    TCG_OPF_32BIT        = 0x00,
+    TCG_OPF_64BIT        = 0x01,
+    TCG_OPF_VECTOR       = 0x02,
+    TCG_OPF_128BIT       = 0x03,
     /* Instruction exits the translation block.  */
-    TCG_OPF_BB_EXIT      = 0x01,
+    TCG_OPF_BB_EXIT      = 0x04,
     /* Instruction defines the end of a basic block.  */
-    TCG_OPF_BB_END       = 0x02,
+    TCG_OPF_BB_END       = 0x08,
     /* Instruction clobbers call registers and potentially update globals.  */
-    TCG_OPF_CALL_CLOBBER = 0x04,
+    TCG_OPF_CALL_CLOBBER = 0x10,
     /* Instruction has side effects: it cannot be removed if its outputs
        are not used, and might trigger exceptions.  */
-    TCG_OPF_SIDE_EFFECTS = 0x08,
-    /* Instruction operands are 64-bits (otherwise 32-bits).  */
-    TCG_OPF_64BIT        = 0x10,
+    TCG_OPF_SIDE_EFFECTS = 0x20,
     /* Instruction is optional and not implemented by the host, or insn
        is generic and should not be implemened by the host.  */
-    TCG_OPF_NOT_PRESENT  = 0x20,
-    /* Instruction operands are vectors.  */
-    TCG_OPF_VECTOR       = 0x40,
+    TCG_OPF_NOT_PRESENT  = 0x40,
     /* Instruction is a conditional branch. */
-    TCG_OPF_COND_BRANCH  = 0x80
+    TCG_OPF_COND_BRANCH  = 0x80,
 };
 
 typedef struct TCGOpDef {
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9614fa3638..37d46f2a1f 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -2051,12 +2051,21 @@ void tcg_optimize(TCGContext *s)
         copy_propagate(&ctx, op, def->nb_oargs, def->nb_iargs);
 
         /* Pre-compute the type of the operation. */
-        if (def->flags & TCG_OPF_VECTOR) {
+        switch (def->flags & TCG_OPF_TYPE_MASK) {
+        case TCG_OPF_VECTOR:
             ctx.type = TCG_TYPE_V64 + TCGOP_VECL(op);
-        } else if (def->flags & TCG_OPF_64BIT) {
+            break;
+        case TCG_OPF_128BIT:
+            ctx.type = TCG_TYPE_I128;
+            break;
+        case TCG_OPF_64BIT:
             ctx.type = TCG_TYPE_I64;
-        } else {
+            break;
+        case TCG_OPF_32BIT:
             ctx.type = TCG_TYPE_I32;
+            break;
+        default:
+            qemu_build_not_reached();
         }
 
         /* Assume all bits affected, no bits known zero, no sign reps. */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d7659fdc67..8216855810 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2294,7 +2294,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             nb_iargs = def->nb_iargs;
             nb_cargs = def->nb_cargs;
 
-            if (def->flags & TCG_OPF_VECTOR) {
+            if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
                 col += ne_fprintf(f, "v%d,e%d,", 64 << TCGOP_VECL(op),
                                   8 << TCGOP_VECE(op));
             }
@@ -4782,7 +4782,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         tcg_out_extrl_i64_i32(s, new_args[0], new_args[1]);
         break;
     default:
-        if (def->flags & TCG_OPF_VECTOR) {
+        if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
                            new_args, const_args);
         } else {
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3adc5fd3a3..43acb4fbcb 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1921,9 +1921,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
-    /* 99% of the time, we can signal the use of extension registers
-       by looking to see if the opcode handles 64-bit data.  */
-    TCGType ext = (tcg_op_defs[opc].flags & TCG_OPF_64BIT) != 0;
+    /*
+     * 99% of the time, we can signal the use of extension registers
+     * by looking to see if the opcode handles 32-bit data or not.
+     */
+    TCGType ext = (tcg_op_defs[opc].flags & TCG_OPF_TYPE_MASK) != TCG_OPF_32BIT;
 
     /* Hoist the loads of the most common arguments.  */
     TCGArg a0 = args[0];
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4cf03a579c..e31640d109 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -790,7 +790,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_32_64(sextract) /* Optional (TCG_TARGET_HAS_sextract_*). */
         {
             TCGArg pos = args[2], len = args[3];
-            TCGArg max = tcg_op_defs[opc].flags & TCG_OPF_64BIT ? 64 : 32;
+            TCGArg max = ((tcg_op_defs[opc].flags & TCG_OPF_TYPE_MASK)
+                          == TCG_OPF_32BIT ? 32 : 64);
 
             tcg_debug_assert(pos < max);
             tcg_debug_assert(pos + len <= max);
-- 
2.34.1

