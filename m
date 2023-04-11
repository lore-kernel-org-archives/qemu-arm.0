Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp183977ejc;
        Mon, 10 Apr 2023 18:08:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350YqsqMFzr5VZnGUQDqnpljk7CShdqe1wLqps9BpdKr8y2AVk+EnlBUdBq5ABLB+0F9rXAn6
X-Received: by 2002:a05:6214:1d0b:b0:5ac:daf1:1ac1 with SMTP id e11-20020a0562141d0b00b005acdaf11ac1mr17942142qvd.27.1681175319809;
        Mon, 10 Apr 2023 18:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175319; cv=none;
        d=google.com; s=arc-20160816;
        b=mjFRRSlItrmPFCLZW5xXOYo2cnBFa145yyj8DRJThbZC5/vvmCO9I5/jUWoNYgqXbJ
         7snEuGExWNSRoDhPmnRv3X2+Ew0Mg8BuHfU81vB0KsyK5ffMjVog/axomXWnEdqbeN0a
         jyJJpBgatL+CwEoRolWssQPXXmoFZDRopzF6OM+8cEqn3Kx1KNu2F+JJYJB4apHvDCOw
         iufcGBFzRaoDP+VdKq3nVLqy89/KW7OKbLS/JPbI3r/jVjIUxB5xZeiRIfu+J4U+iJTm
         ZOX6c3JnM4Raxfb9q63N2+TF3UPbTJat9ozFGUT99V0jXWxdYlDaEb+EVhUsn8x27JKp
         6x4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CKis80chZUaL+QCeBY/st3bpNxzPB2hybijcnSgD+kY=;
        b=Dtu+EpHKbm1dAZF8YLDzLdkIAgBMg59EVZ5L6qb3ZxOW7EXzl0VPDJl7fuYx/iWYux
         SvOwPcmnUyApUZ0lFgJRjkXF9QpAPo3fh14ZOipVF971tMiPLk1AZmEU1p+zkAPMvSXO
         9k9zBUFTFPLylrD7j6E0NgT1/+UwpRZ4lAf6IkhEMhLJZgXwAcNmXHPgR7+ILbxftxV4
         MTYgMryDT4wfPSjVxXe/vsbQv3zfEMjkqK78ATEVXwEd6jCRjg0v2UjwzrPcUiZhiJuP
         ISlPOcQp4KdztTiSiHJSToZGqK3w240r2/sV9f1Jomg8ktEZwVe0n6uO5+TlROMjDvUl
         Ux7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SMkr67+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a37b904000000b0074a6c265465si8126425qkf.40.2023.04.10.18.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SMkr67+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2T6-00061H-LU; Mon, 10 Apr 2023 21:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sr-0005LD-M4
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:29 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sn-0000V7-Ml
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:29 -0400
Received: by mail-pl1-x629.google.com with SMTP id o2so6255324plg.4
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKis80chZUaL+QCeBY/st3bpNxzPB2hybijcnSgD+kY=;
 b=SMkr67+2j4j9auD4OV8bJ1VCiaww0bcrZscbQiljSaJdr9BHdhMvhh/m+eEJbjuMCI
 VVkoH/Ouoae6183aGrViXqtCKfb1bjWqZMHqRoDnYCQG9PDTNCzCxU4/DxHUlPX47Wwr
 rKBZ6rkY06tcF3P42Pt5XSc/VBMZzVG1irx4bZQxJJa/XNQm/kYXc25WKoLA0F0mvsS9
 i7ksDvOWEMLfCg5rv3Ad/3Bwqrxpr4yzXXNt20Wm1Xxtx4EtznMSLJGRmUa/Ct+hR5XG
 jVm7o90UibRTGyYqeh+uyKHU0BjWCysywkiXm89zPvzlRx7aCplaBhyx1d37jp4s4XXV
 npMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CKis80chZUaL+QCeBY/st3bpNxzPB2hybijcnSgD+kY=;
 b=y0/yleedlZASF5LE9tbQzqvQEI9pbX2vhB2tkE3bMAHn+U9w2Lz67oy9x3087Vot6A
 BlY9DY14J1DaCwavqo6JQqt93RtjKEyvMrbFY84SQ/9wksYoEDqnrwZZ+785M9zl7KTb
 l1gHmddzc1nGSdS+cHgInjxpYE726RogGrKXfFrhdkh6BLggbr4Y/dm5i1WGh72QROAc
 J14LTtlz/pSa1XzHWFDd7NzsF6oe4ZA4+Rhiikseuwi87ciEe3QbbkfjuF53LsVhhhJK
 38sP+aCVj9vPLG7pVXrIviyOT4CCjXBVYxaofQ1T2rb5cN65MZrA/mDmB4y2Naf+o2B/
 w1LA==
X-Gm-Message-State: AAQBX9f8Vzd2uN8mcZahlv+KY81vLhvy6gllpJV5kUL5ixfGY/mAOwjQ
 P2+EJBI4L0o5cpKWHrpAVlC6/A==
X-Received: by 2002:a17:90b:1e09:b0:246:da2a:49be with SMTP id
 pg9-20020a17090b1e0900b00246da2a49bemr1374536pjb.20.1681175184820; 
 Mon, 10 Apr 2023 18:06:24 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 24/54] tcg/loongarch64: Rationalize args to
 tcg_out_qemu_{ld, st}
Date: Mon, 10 Apr 2023 18:04:42 -0700
Message-Id: <20230411010512.5375-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: hg64QIW0lwFg

Interpret the variable argument placement in the caller.
Mark the argument registers const, because they must be passed to
add_qemu_ldst_label unmodified.  Shift some code around slightly
to share more between softmmu and user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 102 +++++++++++++------------------
 1 file changed, 44 insertions(+), 58 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0940788c6f..0daefa18fc 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1049,39 +1049,32 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGReg data_reg,
+                            const TCGReg addr_reg, const MemOpIdx oi,
+                            TCGType data_type)
 {
-    TCGReg addr_regl;
-    TCGReg data_regl;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
+    MemOp opc = get_memop(oi);
+    TCGReg base, index;
+
+#ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
-    TCGReg base;
 
-    data_regl = *args++;
-    addr_regl = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 1);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, data_regl, base, TCG_REG_TMP2, opc, type);
-    add_qemu_ldst_label(s, 1, oi, type,
-                        data_regl, addr_regl,
-                        s->code_ptr, label_ptr);
+    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
+    index = TCG_REG_TMP2;
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+        tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-    tcg_out_qemu_ld_indexed(s, data_regl, base, guest_base_reg, opc, type);
+    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+#endif
+
+    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_ld_indexed(s, data_reg, base, index, opc, data_type);
+
+#ifdef CONFIG_SOFTMMU
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #endif
 }
 
@@ -1109,39 +1102,32 @@ static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
+static void tcg_out_qemu_st(TCGContext *s, const TCGReg data_reg,
+                            const TCGReg addr_reg, const MemOpIdx oi,
+                            TCGType data_type)
 {
-    TCGReg addr_regl;
-    TCGReg data_regl;
-    MemOpIdx oi;
-    MemOp opc;
-#if defined(CONFIG_SOFTMMU)
+    MemOp opc = get_memop(oi);
+    TCGReg base, index;
+
+#ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
-#else
-    unsigned a_bits;
-#endif
-    TCGReg base;
 
-    data_regl = *args++;
-    addr_regl = *args++;
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, data_regl, base, TCG_REG_TMP2, opc);
-    add_qemu_ldst_label(s, 0, oi, type,
-                        data_regl, addr_regl,
-                        s->code_ptr, label_ptr);
+    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
+    index = TCG_REG_TMP2;
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+        tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-    tcg_out_qemu_st_indexed(s, data_regl, base, guest_base_reg, opc);
+    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+#endif
+
+    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_st_indexed(s, data_reg, base, index, opc);
+
+#ifdef CONFIG_SOFTMMU
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #endif
 }
 
@@ -1564,16 +1550,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-- 
2.34.1

