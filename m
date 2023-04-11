Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp184971ejc;
        Mon, 10 Apr 2023 18:11:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350a3YQSjrWng5xYzFWi0uQwK3JWtmdYUgb/Ps0IWVu77GYGTp+6XxT6fC/6UaDXNAbeaZz/Z
X-Received: by 2002:a05:6214:2402:b0:5cc:ce87:7d7a with SMTP id fv2-20020a056214240200b005ccce877d7amr2124682qvb.41.1681175463729;
        Mon, 10 Apr 2023 18:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175463; cv=none;
        d=google.com; s=arc-20160816;
        b=h9TKphdS5ch7hFLqAgaLFoqO+fj63+9xxswVEBPjY8gbCk5Nci7nalPyIzW7/VNx0X
         W2xn76XDnH9SNYaEU0kQ/vQ44/ELEX1//HruVXY3NDjIjzL1izvWxxCzsFt2AKAq6h7r
         YIuCwcis9frmSnT+hpRzZo2X6yzQRnIIJnHtFxDcjAz+15mvpNLqpgG2pclLpwYkuFG6
         3EQMvDPVxNN6TmW9Z616rUzfmX27FSHCqmmg7+WBuS+8bdK6OE5pWNWaZXAq9SXa1Kp7
         uIvgrcFeXtZKRtPouw/h2vHISJCgT5GQupA1jNvRkMHcjeoSI780Ah5eNaHt1OKDp+nf
         if/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a7UuMOTAwgY8VnO8LHxq40hAVyjp379dPa1x2qs/CQQ=;
        b=x9yHIq7hkuP0BdObtkybka5Zhx05UX69KYE1HpZdsTFyv2hJiDA11V13eObHKQFX8W
         hP5hVuoJ3e52gktGbNajsko4LP27KbLWrqRYO6tpB4VGT/mOENvrmaaJucqK88nl95Cq
         /CIls8MZ2T2ogiJ4B6scEdMChlZj8rIKhu3UjMFcIAFEH4rXfVZW/VyIXkY541GsQ2c5
         SOggs0C/aic6NoackQLVZCyvK+71inq8jZs6xEYj6a+8LCNo6/HZX4M1uY6k+WIHE2t2
         hT7oqr5als2LG60MNKbE7Qm3LYtuqBh0uDXluAQ7fv66AsjlGFDMedPXLe3HbqkuDlcU
         YGWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CeFuq1GL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22-20020a37a916000000b0074a4c0030dasi8315630qke.99.2023.04.10.18.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CeFuq1GL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2T1-0005n4-DD; Mon, 10 Apr 2023 21:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2So-000548-2M
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:26 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sk-0000Uj-0W
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 d22-20020a17090a111600b0023d1b009f52so9250915pja.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7UuMOTAwgY8VnO8LHxq40hAVyjp379dPa1x2qs/CQQ=;
 b=CeFuq1GLFHCiznHDk87vRe/pMi5S5iYCgdhwYOq8Xp6nXgd/AXMvHnajZms/HqEOPO
 nKLbM+x6YdfcjRnN8AtYL2tAi+219SHmyjYvNbou3uJnEwilji1l8Migbpht4n+tOG8J
 gue3ScaW0a7IXzvusXCk6mCNYp+bB1B6wWOWTnzKWsxyoP+cWDSGXTHLoxwn3+p5CWvw
 3I7J4k71qAZeOf3MyAXOdlXzR7YeLoP9s/5L1kVTZq+5Wky451PEYeVAG20crxYUyqIo
 6FjqVY03WzdUNC7PyfsxDoRziZJVmXIm0C4xzPnZsohtSnXTlmu8YmevR/JYz0o32Zce
 mnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7UuMOTAwgY8VnO8LHxq40hAVyjp379dPa1x2qs/CQQ=;
 b=rQ1BDa8r00O94ppQyPdLoIQ25dX1HWsJyMTHG48jx56y91QcOW2Tb5AIoiU88qcP8z
 1IE01a5KyCCC07N2ZcmWKch0T0AKqCp+rJXjhMWzH3b0wiUn8Ju1k7Ya+DDjorXTxY8M
 bmENMQY+Wbw5YW0ieuZy9mqGl/1qLfNls5yvCm1ZRusYb//tEG9xpVw0RhVuwZV7a9Bh
 IQNm2KkNBfFHJGZgdxWBs5U6R5vUBwUWHTyXk5vn4kQ89/ifL0XHs3ri4RzAv+q3AiIv
 DdY28u6Lg1tISn0w8mc0VfYzxvRpeweFDtctY4c63c0FA3721ryhx8H6+2YYM2XYJC11
 NYtQ==
X-Gm-Message-State: AAQBX9fewUhK/Kc475ru2ER1uD2VlgMGRNKfhbjzMTaSYWHVCxu5Ksz3
 +pysyhFdHsF0pc1U9BIFysmCnbETmRWhO10L46zGhA==
X-Received: by 2002:a17:902:fa46:b0:1a1:c0e6:d8d6 with SMTP id
 lb6-20020a170902fa4600b001a1c0e6d8d6mr1060321plb.54.1681175181110; 
 Mon, 10 Apr 2023 18:06:21 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 22/54] tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:40 -0700
Message-Id: <20230411010512.5375-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: WZmfoxTaYW47

Interpret the variable argument placement in the caller.
Mark the argument registers const, because they must be passed to
add_qemu_ldst_label unmodified.

Pass data_type instead of is_64.  We need to set this in
TCGLabelQemuLdst, so plumb this all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 115 ++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 57 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 83c818a58b..3706a3b93e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1526,15 +1526,18 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGReg datalo, TCGReg datahi, TCGReg addrlo,
-                                TCGReg addrhi, tcg_insn_unit *raddr,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                MemOpIdx oi, TCGType type,
+                                TCGReg datalo, TCGReg datahi,
+                                TCGReg addrlo, TCGReg addrhi,
+                                tcg_insn_unit *raddr,
                                 tcg_insn_unit *label_ptr)
 {
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
     label->oi = oi;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -1796,41 +1799,29 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s,
+                            const TCGReg datalo, const TCGReg datahi,
+                            const TCGReg addrlo, const TCGReg addrhi,
+                            const MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
-#ifdef CONFIG_SOFTMMU
-    int mem_index;
-    TCGReg addend;
-    tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
-
-    datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
+    MemOp opc = get_memop(oi);
 
 #ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 1);
+    TCGReg addend= tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
 
-    /* This a conditional BL only to load a pointer within this opcode into LR
-       for the slow path.  We will not be using the value for a tail call.  */
-    label_ptr = s->code_ptr;
+    /*
+     * This a conditional BL only to load a pointer within this opcode into
+     * LR for the slow path.  We will not be using the value for a tail call.
+     */
+    tcg_insn_unit *label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
     tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
 
-    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
@@ -1918,41 +1909,27 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s,
+                            const TCGReg datalo, const TCGReg datahi,
+                            const TCGReg addrlo, const TCGReg addrhi,
+                            const MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
-#ifdef CONFIG_SOFTMMU
-    int mem_index;
-    TCGReg addend;
-    tcg_insn_unit *label_ptr;
-#else
-    unsigned a_bits;
-#endif
-
-    datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
+    MemOp opc = get_memop(oi);
 
 #ifdef CONFIG_SOFTMMU
-    mem_index = get_mmuidx(oi);
-    addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 0);
+    TCGReg addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
 
     tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi,
                           addrlo, addend, true);
 
     /* The conditional call must come last, as we're going to return here.  */
-    label_ptr = s->code_ptr;
+    tcg_insn_unit *label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
@@ -2245,16 +2222,40 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, 0);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
+                            args[2], TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
+                            args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
+                            args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
+                            args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_bswap16_i32:
-- 
2.34.1

