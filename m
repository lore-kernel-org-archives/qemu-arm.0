Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650798ejb;
        Fri, 7 Apr 2023 19:50:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350bLqwbY6u5Bu1o6Aa1/Tg24NRBAgTPN5/Cnoo2S6DNKbrmS/pptxkJg9FKbYTe7lL0QCKWh
X-Received: by 2002:a05:6214:260d:b0:5b4:ccc0:4f60 with SMTP id gu13-20020a056214260d00b005b4ccc04f60mr8631555qvb.37.1680922222160;
        Fri, 07 Apr 2023 19:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922222; cv=none;
        d=google.com; s=arc-20160816;
        b=hkptdZ6FNARw6Iqb81hK5rc8ZGRddmFg+89jADm/6hKvbGf0chOo3zzQoAMg9m2B9/
         udfXXE5LBLvxg0nbtCi5dXNdXEfhvHwAH5XsGrTDmNxN6jc4injsPPL+N113r5/+a1uq
         jXW9+5KecAPEY00d9elG/SijzvAlux/A4ttRby3OfZd3+B2HC9OwdKoQ29BYix2RhNYt
         9Cpblr1a+u/rIUGPkRJeKjHstgJ7IUNVuTIIbcMAfFg+oEaXi4EydmXYiO5yzRn7K3cs
         MCH9e/QLa0GUbI0ca1od72zXNeuO5KWn0mtzYc8K9OS7TfMAOhewNbSbDHW1gNkf99JS
         nSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HILSA4FGaRdNKn9uDo5A96FpFkUHaWEI+nrm0ay0YIU=;
        b=TjCs+uOTan86ACxGR46OSH9LN8RFs5vhZa82XFXnIpvKkWIlshsNGFoEVlZ31RR6Ds
         oJIT5p7Nvl1/fzJaeVps7ye2FkOhULnGbChcBM3QbQvQW4J8G4kvmFxjG8zGHy/mOfrG
         x/IkOBW6vhc+tTrBOMCS/mOJ3wA2KChkLHJhbI+hPUUe5keeQW2PuXMv2PrUg/s09Pvu
         /YiuaDb6RzuRnWN2UKL0bss72+5g4Ql3Wh4oNb8ZsUo6aIKkmRh87nwUv0OzpNJGpia+
         xIymsV3fslBiISCFoWTwHka2bap1MaiK210sdzba2O3kLAdZGivKw6CgxBtCHSuBnliU
         zWIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T8Sfhn0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a05621419e200b0056bfba05976si3870854qvc.342.2023.04.07.19.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T8Sfhn0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYe-0007nG-4s; Fri, 07 Apr 2023 22:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYd-0007lt-2y
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:03 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYE-0005k1-1R
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:02 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q2so5250977pll.7
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HILSA4FGaRdNKn9uDo5A96FpFkUHaWEI+nrm0ay0YIU=;
 b=T8Sfhn0B336VqWRI8Cj7nE2BiBs7knfZv18eWruZ5znf0s5mJ2WLjMrbraAjXi8Pxd
 y9lmdTvPxNCui/aN3MGkzR9Ovs6GSsx/7dJpXlCWEUJ06AW2eTHVw0C8FcSgNF3cGUAB
 uWRLtjFkBysuUBswyru4Jj3/k/WBSpo356U77eM0gCfxB5FcRUg659zhTxasKp0ktLbb
 aeC2HReS2c8VF3NO9j7F7/ByGegNBIDGkIRqxvE/i+V5j6uHrIeE+CVZ5QCmHjVqjAYa
 MBs+5fnXHnnmQM1orRxEsfSIRs54wP9GD1314IeHViMcWCpaC/pPja50CfWOq0LvO1Zn
 BMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HILSA4FGaRdNKn9uDo5A96FpFkUHaWEI+nrm0ay0YIU=;
 b=D+VgsEony5ijrc03Xslq+pTtzcWBpIjAt5aqKXXbiiWcMqCYAh6d7sfGpTegn8avDE
 vdnMIahOlgHxNDYszSDb5qpbG5RhoE0WjiNrFmB0y/Q37dZtTDAJaOh6LxHycSaA0e3R
 xnuSxFdj/KKpmr5Y6rq6E4XG1MiO5D5cl3wyR/gCqo/S2DFaxIIeGeag6gKI76Dv7/IP
 nMB/ILPkVRK9EzOla1X8vnczDrKxMVTBKwmkRjgkKOfvaX+E5GaPUeVrkts4u+7W9kW+
 BQqMnouAaCLHila5GlPIRE9XhRg2RAph6/Ntyiylnn8UtlCloowxyqb1xzl1mUfNJ7Xa
 jSjQ==
X-Gm-Message-State: AAQBX9dcHOWJ+lest0PdWSGHQoP3w8XS1NbsjsEvxSix9KzfBr/9Yihc
 93BiOqr7WFGn2zISaEgfSFn46A==
X-Received: by 2002:a17:903:230b:b0:1a1:b5e3:7db4 with SMTP id
 d11-20020a170903230b00b001a1b5e37db4mr5202003plh.18.1680921816698; 
 Fri, 07 Apr 2023 19:43:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 23/42] tcg/arm: Use TCGType not bool is_64 in tcg_out_qemu_{ld, st}
Date: Fri,  7 Apr 2023 19:42:55 -0700
Message-Id: <20230408024314.3357414-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: S5cJFEkXwqrn

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index bad1e6d399..9bf831223a 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1526,15 +1526,17 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGReg datalo, TCGReg datahi, TCGReg addrlo,
-                                TCGReg addrhi, tcg_insn_unit *raddr,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGType type,
+                                MemOpIdx oi, TCGReg datalo, TCGReg datahi,
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
@@ -1788,7 +1790,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
     MemOpIdx oi;
@@ -1802,7 +1804,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
+    datahi = (d_type == TCG_TYPE_I32 ? 0 : *args++);
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
     oi = *args++;
@@ -1819,7 +1821,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 
     tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
 
-    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, true, oi, d_type, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     a_bits = get_alignment_bits(opc);
@@ -1910,7 +1912,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
     MemOpIdx oi;
@@ -1924,7 +1926,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
+    datahi = (d_type == TCG_TYPE_I32 ? 0 : *args++);
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
     oi = *args++;
@@ -1941,7 +1943,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, false, oi, d_type, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     a_bits = get_alignment_bits(opc);
@@ -2237,16 +2239,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, 0);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
 
     case INDEX_op_bswap16_i32:
-- 
2.34.1

