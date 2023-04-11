Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp183393ejc;
        Mon, 10 Apr 2023 18:07:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350akgSay7yOeelzvJx3qdLXAixm+DtFKONeUZKgCIEM1VFlUKhiXeMfWJ8Pqa45WGSG3teb1
X-Received: by 2002:a05:6214:27c8:b0:5c8:f391:944b with SMTP id ge8-20020a05621427c800b005c8f391944bmr1750069qvb.22.1681175234864;
        Mon, 10 Apr 2023 18:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175234; cv=none;
        d=google.com; s=arc-20160816;
        b=VW3SlPmSqejh2Qpf1RXq4fwusqdCsNg4XEsDDjtB6YUaILFJKcjFO0kXtUHMTceIsQ
         3zexdQsBfO1bD82XdOgoddOfZlre4Qj3XI78M9jdUlZLsNMzTndb6llaFY1KqERQlnnV
         e1TAWkIib49meNGK91jtqxOY67rkrDtLLBTuuT7WAtG4JsT0ADCUyx2zuGNarxmARHLo
         Dunr1OF9CPnGc1yCA7nA/UWJYe91bCjwF8IXPtcBvb1Oy2LiWGF4q+/waykSznmpKAEM
         tttwWZolKXcCFaM8kZfE5DPVq5dwltCKL8yXHPRg1R7OUNjzkE4K/HK5KiCpK0iWNW+a
         07Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KhxUgF13wIahgOapdfewDvrgVdfPLD/Ycd0bxfe59jM=;
        b=a5IEoK8bzMUrZaUiR/HFfp6Cl/mSRm1+ioit2g2BjARLAxcxjhsOlKYzfEDDkPgFZZ
         S79sgfBxrhzvFqXNYZlq4lWbqjiaQpwGePEOKX2UWOzxUkcFK3oX5xIgLe1VTV0zV5iz
         pB98/nkc+xUfWCmW+gQ3XIk357/XG0C7FSTH2CMLsNYECeYpunfx9Q0PyrrxjqGPtH0G
         2jZ0HnQGW2uqbo+M9ypce0cyjeqHKwQaAUONGQ94REq//Ek/rRL3EVwiHtZa3BuWOQqF
         u+vlUrPuPTaAVC7ra4LQbOlAiIu/p5h0XvKwLrRCpFyBCTr5m2lIwCbXfVY57LpwUf8b
         NUfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7GJWn2B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk11-20020a056214508b00b005a4e968cb1fsi8290115qvb.152.2023.04.10.18.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7GJWn2B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2TB-0006Mw-UR; Mon, 10 Apr 2023 21:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T2-0005pe-Uu
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:40 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sy-0000wM-Vu
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:40 -0400
Received: by mail-pl1-x62f.google.com with SMTP id kh6so4685163plb.0
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhxUgF13wIahgOapdfewDvrgVdfPLD/Ycd0bxfe59jM=;
 b=B7GJWn2BulyyGNKCgb5MyxsJkeOPk7bU/aCV52nTNoNempVOxOTG9wPaO+a4XRpd94
 PWdKXid3jePHaw9BhYJjw4sZeuhTx/GI/0as5SKcttNrrl3hfKh/aBuYCmJ3EhgIqUP1
 kzhzJIQSuTs1hOA2nhU/uTkeyEkyGdL21iI0KnYUT9DfFHmaZtbHyAJsQVjqM0lbyD9n
 7PWX35JXbGnUINmWOtPwRrUz/S9NS2llqJNT8C3oCkQbpkl4Bw1c/dGafjPZ15V4+tKk
 XH8z8UdwdLcUlXYrZMg1vLf9PDua4TbbQlfu6pXhej233qLk+/60zxLqbv3CyreoCDOW
 scdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhxUgF13wIahgOapdfewDvrgVdfPLD/Ycd0bxfe59jM=;
 b=6y3zq9AqaKYlkMKO+BFWLEiyhmHPc16Ng69pDhl9tFvxF1ativnYP5KRy1Pzfi9GOZ
 gSgSTKSOyLr7QuPEe2pVLA/cOOYEXTBXy0g56zGcpNAQ4+pBUs4qbbLUYbYK7c9ouKf7
 8eQxDiLLYHdqRujJlDduPBjOE+uLEjNV8CM8FzE0x5SKePutP6xpvZLJPUYi9vaftCDA
 GP4Lqc62YCuERM7WCp1+7k5GdXk0f2Tvxt4nha4tifymsuBYlqf50sbA3s6z+8Dh9Xjd
 gECus7k/Z4EiOqvkQMGzcZ9fT3sH5Ezhw11QRZ8MRgWKDLooEEHad3y8Te9iR9Rbmxpc
 e3sw==
X-Gm-Message-State: AAQBX9ckMZQ5tqJUqnvs2v/dYrl5Qp1v5jsgm+gnfQZYyzd+aBMbkQzX
 pkgIuzKQnLaQB0xSaROlPmLUKyFuIb8e2ti1O56cwA==
X-Received: by 2002:a17:902:c40e:b0:1a1:c2cb:f44e with SMTP id
 k14-20020a170902c40e00b001a1c2cbf44emr1099946plk.53.1681175193512; 
 Mon, 10 Apr 2023 18:06:33 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 28/54] tcg/riscv: Rationalize args to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:46 -0700
Message-Id: <20230411010512.5375-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Qzhd4/B7REuO

Interpret the variable argument placement in the caller.
Mark the argument registers const, because they must be passed to
add_qemu_ldst_label unmodified.

Pass data_type instead of is64 -- there are several places where
we already convert back from bool to type.  Clean things up by
using type throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 68 +++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 42 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1edc3b1c4d..d4134bc86f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1101,7 +1101,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
-                                   TCGReg base, MemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, TCGType type)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1120,7 +1120,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
         tcg_out_opc_imm(s, OPC_LH, val, base, 0);
         break;
     case MO_UL:
-        if (is_64) {
+        if (type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, val, base, 0);
             break;
         }
@@ -1136,30 +1136,22 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGReg data_reg,
+                            const TCGReg addr_reg, const MemOpIdx oi,
+                            TCGType data_type)
 {
-    TCGReg addr_reg, data_reg;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
+    MemOp opc = get_memop(oi);
     TCGReg base;
 
-    data_reg = *args++;
-    addr_reg = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
 #if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+
     base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
-    add_qemu_ldst_label(s, 1, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
@@ -1172,7 +1164,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
         base = TCG_REG_TMP0;
     }
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
 #endif
 }
 
@@ -1200,30 +1192,22 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_st(TCGContext *s, const TCGReg data_reg,
+                            const TCGReg addr_reg, const MemOpIdx oi,
+                            TCGType data_type)
 {
-    TCGReg addr_reg, data_reg;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
+    MemOp opc = get_memop(oi);
     TCGReg base;
 
-    data_reg = *args++;
-    addr_reg = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
 #if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+
     base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
     tcg_out_qemu_st_direct(s, data_reg, base, opc);
-    add_qemu_ldst_label(s, 0, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
@@ -1528,16 +1512,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_extrh_i64_i32:
-- 
2.34.1

