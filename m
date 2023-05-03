Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2653617ejm;
        Wed, 3 May 2023 00:10:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4EQocNZxyLMQe9Am/cr5gzXQyUycCh6zldIBPykpjUOIeCXLxT9m2NGj7al3t6Jul71VwV
X-Received: by 2002:a05:6214:5019:b0:619:ca55:970a with SMTP id jo25-20020a056214501900b00619ca55970amr10594027qvb.47.1683097858723;
        Wed, 03 May 2023 00:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097858; cv=none;
        d=google.com; s=arc-20160816;
        b=ftUlamkLNxhatYATyDapeoShKPA5ul1LddM1+Gi5YQ/CDut2XWVRgNHaLDrjs8Z4hC
         k6cdy32T3uQDKWNWzl8rRdSxxLLIdFXrWgiUhtwshGJZvgTtzmnO3HqQw/d8cFU3gbsD
         tSDObzq1daA0HiNY02dZwb8eiSK4HZhJs6EPyNJ1zB9440qbVBNzRD7vd1ZM/av1k5Ju
         VFyWc0SIRqfqgU5tnM2VjCWJaIKNBQmcbrplfvaXPGDettqbhsqmjv30GYi3ul2vP3fi
         mDa016oVzXM2/S4oPGpvc37P1KDhq4XejochD0RleUZUV8A5Qdf3gd6YrAmJjdDHcLPM
         8NJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/LNx4AQ8LEDs2bqV5zvn6xWFsTqqlF00MmHmvqgX6b8=;
        b=bsP6J0HxQYh8MyMC60HkZXc/zpusqF1BuNrnQb7SWKrqiwaK6oNgC9hGUFRY1RXk01
         ew4o0EBpBRMbRlmImtqf+ZY6v7dyfzc8vCK0DhhF0zCStIgMiIFB+SbUgBc2gAU2pYlw
         Cftouxb5QvXqAjS+J+WLAOp6L7RtIPbQNNmWB/2zVeTpCh6pqhINNUUvF/zFTot7m6nu
         v3NWTC05bPFuErNMydcV/iLkOv9xqaFPxlw9l4jCBX6uYXp1zIZF99iUmCqAx6DnDdIM
         k+IXcXnv6mv0FidX01KLTr0ZlbGv+F4/d7+fFiOKj6Fzk88ZSLRW4F49isxNkhdJ+gBa
         WdHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=turhtRP4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed14-20020ad44eae000000b005ef641c3b77si18246130qvb.338.2023.05.03.00.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=turhtRP4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6Qz-0007fA-N7; Wed, 03 May 2023 02:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qy-0007e2-Cs
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:57:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qm-0001j6-5M
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:57:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so47044355e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 23:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097058; x=1685689058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/LNx4AQ8LEDs2bqV5zvn6xWFsTqqlF00MmHmvqgX6b8=;
 b=turhtRP4GC3DZ0F3TWyiWg63yw3JVNoZOD0GOc6ogfvUut1+v+eaa/sxtBfIfHYXbt
 APpenz/xdHMNN21aoSVT0ItwtOGVKMkYpO2QYInwyzUIXngIaE6ioDz3RdlVI9KsJn+M
 rSu1XnqlVeMrIlixmnNTk94z+PmmFxSTzTyJlb9K0DKW9Pe87mdIOpj2g8YbXw09AVel
 WyY00TJoxKmCnLT/gWFHMer5lz3yY+qFgrGizmhWYTiM0N0Az1ziM6mhMzP1eYX3AuMx
 qqKsjFDGuNdAr7Yyv94XIPvIPVqz+DMXaSQGDLvv5Iq44PZBABTMJvLYPKLcHH/xDOAU
 nI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097058; x=1685689058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/LNx4AQ8LEDs2bqV5zvn6xWFsTqqlF00MmHmvqgX6b8=;
 b=ZxwfX8kvulXD1kJOm0YM424VeAcoQ4vSOfEAlTpe3Ea43ho9mOSt8DW6+YCMFbmXAY
 t0BJszHM6688II4qOh0Nx19RAuR0hXeHkRnmuLirmytSERYOjhsC3UVlNIpLuHuE8p3u
 yF1QZHAa0HYsL/nlxpAPmhRwtCPeQ+TvD4ClLM+ncI/51/MBpJ0FS6bLXZsg+Tm10MXI
 QFNdPbZ/aIh+BBcZbFQqwlLEAHCsPAuyUYxVavu+Y37UfbPiz5p40U0R0BIOgwAq8gur
 3kqEUv5y2e833sYgIjU70HewyeBVcpq6H/btfdVtGlYQNgXIqsbm0QFjw/nAfV/oRAsr
 txvQ==
X-Gm-Message-State: AC+VfDwRKrLkHS4xES8SLDH9iQWybVQqyQsgmgB7Gf71j0Gn2Z+vLEPo
 WvDwuOa8LzCqs/KtzUd0QIda3Q==
X-Received: by 2002:a1c:7211:0:b0:3f1:728a:1881 with SMTP id
 n17-20020a1c7211000000b003f1728a1881mr14191830wmc.31.1683097058542; 
 Tue, 02 May 2023 23:57:38 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 11/54] tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
Date: Wed,  3 May 2023 07:56:46 +0100
Message-Id: <20230503065729.1745843-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: aZsq39/c+oek

Interpret the variable argument placement in the caller.
Pass data_type instead of is_64.  We need to set this in
TCGLabelQemuLdst, so plumb this all the way through from tcg_out_op.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 113 +++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 57 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 83c818a58b..6ce52b9612 100644
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
@@ -1796,41 +1799,28 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
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
@@ -1918,41 +1908,26 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
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
@@ -2245,16 +2220,40 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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

