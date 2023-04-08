Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649972ejb;
        Fri, 7 Apr 2023 19:47:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z/k9EBbtqGATL1Xvaif+xeyP4EsqJFVwAzlXxqIm3ZW1vC0i78U6XiHn/fHEm1RjuNfYy0
X-Received: by 2002:a05:622a:1aa1:b0:3e0:b1cc:40e1 with SMTP id s33-20020a05622a1aa100b003e0b1cc40e1mr20207048qtc.34.1680922035518;
        Fri, 07 Apr 2023 19:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922035; cv=none;
        d=google.com; s=arc-20160816;
        b=RAbxIjCxGUUrHqE7K1om4O/NZVxhfaFZGJbqB0SRA0otCk4bakz8W13T3MwZ/xauiF
         z3mH9DtTpxYihpJfSDJaqq6Hv/BDDDRx72/OUbjN1qeO9HJrufeaxZUXRQd7k293OjaW
         uB139LeR53tIP7LLQ+wAdc4OO2UNFwiyC/fTET+KWeFkSDPdPI+c+bEJmdgqqbr+44ZQ
         gfKS9VGwUIr13/348blDRoEw0erVITI0TnHbukoCkk3wB3NoGUX46TT3Hf+Y/+bYrPb2
         j/mq4e9Gh0Cr4MoB8/SC74yqV9YdTgFfkhLaZwZSTy47k+aCCZ02ON3gJp+E76cKPN5T
         jXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=itgWaBLjY7YmpUAGU9DqCqqdDqlcaLKLhIh9EK1HPyA=;
        b=GBhN9+/e0wib0asa4UnMuUKAeNO8O0JgB4hPi/3t1Dj2Gv+i56XIqaHUMEVMQHcRWP
         vCu6AXYV5ssJIuJVvK3oYrM2rwXQjbn1P1em4d5SzlQ+1MECi/cfA7iYDXgefpg080HI
         lLsKQFXdGfqZfjyok33MBiBXJPQk5HjPy/x7csZ1YChMHBQSd/KskmoLR60lyQdqbxm3
         ZxfK5SJM7YjBJf4j+QALvh/vBHXr/XK3vRoJHnBc6VBILN/GmY1jCLZpmuCQnZKSbPWU
         yU4ghHcEVywBnBeyChJV3hoNOEIjQrp6gFq6NNZa/hyss20RYtg3Hv16X9Wv3jyYGfsg
         h7yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A3m5gDP/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20-20020a374414000000b0074a2b7c652csi3568868qka.113.2023.04.07.19.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A3m5gDP/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyYo-00081r-3N; Fri, 07 Apr 2023 22:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYm-0007yM-Aj
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:12 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYH-0005af-Ti
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pc4-20020a17090b3b8400b0024676052044so338489pjb.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itgWaBLjY7YmpUAGU9DqCqqdDqlcaLKLhIh9EK1HPyA=;
 b=A3m5gDP/fp4WQcYuGjaskJmDlmST40OikRcTFfrXBJDwXgP+Mifv7W0SrS20Zp1lfz
 X533Rlb81tvnqhLi9nEKrRPrJaGwdqbe/xJtpNbMJmye6rM4IZQc8jZ47H1Gu7kl0UuH
 vzKKOkC9nW8MIZTPmd3wy3bArqPOINnJhG909AqSE6PiPlz+XJTF9/AAWOm525pKTQd9
 2ykyfK9FDgjRyE2NdZdmJUs/yI+Bu81mdpjYLwWVq7UEdTD8cDgXRhPKs6n7sZLC5tGF
 qeTIc9qAHGpdeTFWNJvSAKIlHbEMZ6taZgnDdwHvhiY0kvpt10uuC9Ym2vrdJ1cmCb3p
 ABhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itgWaBLjY7YmpUAGU9DqCqqdDqlcaLKLhIh9EK1HPyA=;
 b=e+b8gv0C7oo2Y2SfA+MIJot24CZ81dp29PSGFfCU749HcK58oxDDbVGoLiu3aF3m/Q
 zjQ00HRTcAwVjUq/PrySK5HRKpR3b7JQHrCE7sXwGSWfniim7wIZtmcJ0Y324oSFMUW3
 3nLVwJ8wFD7GjbFDigcHit7pejbEYietRC/o/NghXZiqmTH2+wOhBkXZZW+APByZZyrJ
 QmM8ak2JfKWDF68G+ajr1btdlsaA/1th7SgvZ9uv51PWAsCkQ9VfDlcaxceUhw9PcYgq
 Sykn4g7zh8QNn3objlBP2znoMlYjJZdbVOl5jtvPv+kPjFSLqdIv/JQn74364AxqDVwl
 VKXw==
X-Gm-Message-State: AAQBX9fcmnpyIQloDlH9W7q+kufbMbGXTozDL8awMyTcKFUzlEdnpVKY
 tctXPZfftchU31nidDC9KwMahDBM1//WKM4oxCM=
X-Received: by 2002:a17:902:d50c:b0:1a5:254b:e85b with SMTP id
 b12-20020a170902d50c00b001a5254be85bmr1464760plg.34.1680921821117; 
 Fri, 07 Apr 2023 19:43:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 28/42] tcg/riscv: Expand arguments to tcg_out_qemu_{ld,st}
Date: Fri,  7 Apr 2023 19:43:00 -0700
Message-Id: <20230408024314.3357414-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: bwiswN7MFav0

Now that the host is always 64-bit, the address and
data operands are always one operand each.  In addition,
change to using TCGType to describe the data operand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 47 +++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1edc3b1c4d..6059802d9a 100644
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
@@ -1136,11 +1136,10 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType d_type)
 {
-    TCGReg addr_reg, data_reg;
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
 #else
@@ -1148,16 +1147,11 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
     TCGReg base;
 
-    data_reg = *args++;
-    addr_reg = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
 #if defined(CONFIG_SOFTMMU)
     base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
-    add_qemu_ldst_label(s, 1, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, d_type);
+    add_qemu_ldst_label(s, true, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
@@ -1172,7 +1166,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
         base = TCG_REG_TMP0;
     }
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, is_64);
+    tcg_out_qemu_ld_direct(s, data_reg, base, opc, d_type);
 #endif
 }
 
@@ -1200,11 +1194,10 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType d_type)
 {
-    TCGReg addr_reg, data_reg;
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
 #else
@@ -1212,16 +1205,12 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 #endif
     TCGReg base;
 
-    data_reg = *args++;
-    addr_reg = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
 
 #if defined(CONFIG_SOFTMMU)
     base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
     tcg_out_qemu_st_direct(s, data_reg, base, opc);
-    add_qemu_ldst_label(s, 0, oi, (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
     if (a_bits) {
@@ -1528,16 +1517,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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

