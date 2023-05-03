Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2647644ejm;
        Tue, 2 May 2023 23:58:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4srnnWIGAnp/RY7KZUlUqn3ytiMA91/Wl4NXA7iwEyaOVC9+oHBbCBTCwI7UL6CgwrxUSD
X-Received: by 2002:a05:622a:34a:b0:3ed:86f6:6ecf with SMTP id r10-20020a05622a034a00b003ed86f66ecfmr32443139qtw.46.1683097106302;
        Tue, 02 May 2023 23:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097106; cv=none;
        d=google.com; s=arc-20160816;
        b=fEKtveX/m+T77blJVkoKrs9OcDKmz3q938Eq8JuWfrSOddS3dVNzMy6j3PkopIhoil
         W1rTRKpHkanvrqxaQINHkcwKEFrUx2Ft+8r2PunIYyQpiFZGik2wdNEFezLm8+7oDHYV
         tAtV3gOAyL3s4xBUfVXHCZiYU2raQLF+kZUGMJdzC/qSrxzQx4ICzLakKVVFD5UMPZyN
         sureVnLpMqyrZc14/wmmcP74cZu3auf+9m83BKYbF2zgpO1ZwSFqM64oe84jLaUo4YtG
         X2+cge27jXU3ckcbU5cLd8Oqvmcxen2tAJSwwR6XzAA/gSmewkqkcWaXB8SEN4QiYr9U
         DnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Wb60bEd1se1ur05309xVh3zsavyenSUVa4kDdGCo6us=;
        b=mvt89Fp8nppoYV7RE+w+ENwJnrTcNf8xkTtVD49bzk6pRUPkxzSwOqo6q5luRfvBzh
         FtFUJ3Ga4tVEJLnojH0zF4vgv5U8/NTkB1/rpFKsv2AoEinFH5qoUGo8kvK54DhbjTWd
         vKm0+pEawuMiZm+GvQlTT74x6UaoWv5mxuYVzhsAtVc8ckogE+YRXdxlnbuF3OK6qV6J
         2vc4/BPVkdzlhlTG/e74tETINnIMgLicMsQmqH4kun16qNMi8A1XyOpbygrZGyYHrNEC
         k4nJ95f8bDsH8XztmzQ4mI+Lbex+m4WT1HAcwZESMfswtWEdL3jxrCSIRdFyTR6iKc2R
         C4MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCpsWIL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br14-20020a05620a460e00b0074dedab5fd3si18379001qkb.713.2023.05.02.23.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 23:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCpsWIL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6RC-0007sv-BW; Wed, 03 May 2023 02:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R9-0007qB-Gw
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:58:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qr-0001lr-4N
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:58:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2fddb442d47so4414394f8f.2
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 23:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097064; x=1685689064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wb60bEd1se1ur05309xVh3zsavyenSUVa4kDdGCo6us=;
 b=UCpsWIL4UaLzXU5imp3tBS/voWbYLj2Pb4KiDviBQD0ZwOcktOaSK5Z4+8Q0VXOCko
 zqR2EiCEh7rN3TrqO2fEl5UMFG7Zsok1OSi3bNwS27XikrDLFvaJjjlx9Ec1V7eOFLEL
 4UdwP+XekvHSlkm92ZdfCXnbAgbMazuswyBey1yb3orrlLH8zwS6exIbv5hxuUQz5yzo
 +CNzu/afTgu2iHlKIPRl/R0hoLdJxA1prUMkxlolnAJIwLu2vQ8yCs8UuuLJjHpRwf+X
 oW8POb5tBNQWEOzLOBUP8be94Y7pzvfu45l6/4uHlj875OjvBUUDvqQ4Pp9iIzkl5TjI
 qHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097064; x=1685689064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wb60bEd1se1ur05309xVh3zsavyenSUVa4kDdGCo6us=;
 b=Tw7r7bkCFo7EURI0oDb6DcwQG3AERxCE9P8ZEdg8p04QoJ3c/CJ3SbdaOgMnPqPh6f
 zdZw+qePQs9SizKtDzjrdb8C/uW++T1QEDCybvqzm4yacVqhPemIyWhJJ6jWv6qNqYID
 l76+RbhAbKmVSbg1RBxjrXM5lwr4yPa2Q6eCztfNvnY15BXM1oXGvapPCiVqDbfj6gVN
 bboUUW7XlvZCr9+D+rKXYIA2bgAqFE+e4OoPnv+y4SyP/nVjdWx+lrdtQCH+36JbsI+3
 WnVqP74MqPuEkKWWF8leEK7cHMopQWMwjx1RmD7lL6E44+zPbEPB/WgyOrWsdGGm+PmN
 SyWw==
X-Gm-Message-State: AC+VfDzSbsQL40OoCW7SqbpqCK2tLWFFPF32H/3hpEuWjHsZO7d/OtF+
 hdzK7G/hYRSniXwTp+1nk9oVTg==
X-Received: by 2002:a5d:56cb:0:b0:2cd:bc79:5444 with SMTP id
 m11-20020a5d56cb000000b002cdbc795444mr13802496wrw.2.1683097063817; 
 Tue, 02 May 2023 23:57:43 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 17/54] tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
Date: Wed,  3 May 2023 07:56:52 +0100
Message-Id: <20230503065729.1745843-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: 5gGfA5jsyzw+

Interpret the variable argument placement in the caller.  There are
several places where we already convert back from bool to type.
Clean things up by using type throughout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 186 +++++++++++++++++++-------------------
 1 file changed, 95 insertions(+), 91 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a83ebe8729..ef8350e9cd 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1479,7 +1479,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, MemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, TCGType type)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
@@ -1503,7 +1503,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
         break;
     case MO_UL | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
                 tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
@@ -1528,7 +1528,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
     case MO_UL:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
             break;
         }
@@ -1583,7 +1583,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 }
 
 static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
-                                    TCGReg base, MemOp opc, bool is_64)
+                                    TCGReg base, MemOp opc, TCGType type)
 {
     const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
     const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
@@ -1623,7 +1623,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_UL:
         tcg_out_opc_imm(s, lw1, lo, base, 0);
         tcg_out_opc_imm(s, lw2, lo, base, 3);
-        if (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn) {
             tcg_out_ext32u(s, lo, lo);
         }
         break;
@@ -1634,18 +1634,18 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, lw1, lo, base, 0);
             tcg_out_opc_imm(s, lw2, lo, base, 3);
             tcg_out_bswap32(s, lo, lo,
-                            TCG_TARGET_REG_BITS == 64 && is_64
+                            TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64
                             ? (sgn ? TCG_BSWAP_OS : TCG_BSWAP_OZ) : 0);
         } else {
             const tcg_insn_unit *subr =
-                (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn
+                (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn
                  ? bswap32u_addr : bswap32_addr);
 
             tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0);
             tcg_out_bswap_subr(s, subr);
             /* delay slot */
             tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 3);
-            tcg_out_mov(s, is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, lo, TCG_TMP3);
+            tcg_out_mov(s, type, lo, TCG_TMP3);
         }
         break;
 
@@ -1702,68 +1702,59 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
-#else
-#endif
-    unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
-
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    TCGReg base;
 
     /*
      * R6 removes the left/right instructions but requires the
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
+    tcg_insn_unit *label_ptr[2];
+
+    base = TCG_REG_A0;
+    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 1);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
-        tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
     }
-    add_qemu_ldst_label(s, 1, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
+    base = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
     }
-    if (guest_base == 0 && data_regl != addr_regl) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
     } else {
         if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
         } else {
-            tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
         }
     }
 #endif
@@ -1902,67 +1893,60 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         g_assert_not_reached();
     }
 }
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
-{
-    TCGReg addr_regl, addr_regh __attribute__((unused));
-    TCGReg data_regl, data_regh;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
-#endif
-    unsigned a_bits, s_bits;
-    TCGReg base = TCG_REG_A0;
 
-    data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
-    addr_regl = *args++;
-    addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
+{
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    TCGReg base;
 
     /*
      * R6 removes the left/right instructions but requires the
      * system to support misaligned memory accesses.
      */
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 0);
+    tcg_insn_unit *label_ptr[2];
+
+    base = TCG_REG_A0;
+    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 0);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
-        tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
     }
-    add_qemu_ldst_label(s, 0, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
+    base = addrlo;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl = base;
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
     }
-    if (guest_base == 0) {
-        base = addr_regl;
-    } else if (guest_base == (int16_t)guest_base) {
-        tcg_out_opc_imm(s, ALIAS_PADDI, base, addr_regl, guest_base);
-    } else {
-        tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
     }
     if (use_mips32r6_instructions) {
         if (a_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
-        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
     } else {
         if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+            tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
         } else {
-            tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+            tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
         }
     }
 #endif
@@ -2425,16 +2409,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
 
     case INDEX_op_add2_i32:
-- 
2.34.1

