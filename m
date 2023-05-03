Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2647891ejm;
        Tue, 2 May 2023 23:59:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FxS2WxovIeu9yGkJs3PcnnCQfsNKFoZJRrWNW+eErgOHbT4dCFVVJiPM6N9msAvfY/b8r
X-Received: by 2002:a05:622a:1449:b0:3ef:33da:e25 with SMTP id v9-20020a05622a144900b003ef33da0e25mr1346182qtx.22.1683097150046;
        Tue, 02 May 2023 23:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097150; cv=none;
        d=google.com; s=arc-20160816;
        b=mbvKchzz2okq2IAakBhmOOp639rjOMsHYh0hgBPbPg+IjLH0o6GGMTvgVPgRUlEZiW
         4+Qy5uJJ/mD8cRrsoWviXCWONHAFLZ6MwNRyWGABlNVzHqBXHT1eMybTUHY3aCc9o+72
         qlzPObwV193scqG8LQDgO5Gs7sEt6/DgzhlInwl8Knjegb8Lnq78YYXHl60CW1M8RldG
         ImY6mNGRlu/OFOsurA7V/ekp541rhl1NBZ8j1Szg+rKNPz1LzGu1N+vnK+khuRGIWSl5
         bZk7rgMUjQ79SgK91TsuHJCKbs/bgSy7t4anb9vjJfaRHSgUX06aEVhfJJ2gd7LUebyT
         CNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PC+Gw/9P+2wBG7ELo5n/093Z6DPtUA9B8lGYDE8K0ac=;
        b=jymjoMIihyfoNMenzTuGYs5gdgkuGLtTUQhoU45QcwN0qrdNy6lNx/KegiZnh2oeS5
         RSI7tvC9/mhN7mZCd96sBF8bIGs9VHLnBzj+3RdP04BskCrbLBc2epZ2KEMlTGmCTMui
         u7YbtofQyzQu7UKmM47W2psY7dtWNwwW70z0Db+oTOnPUKCK12KdMhLSO5U236vUTyeP
         395AjjuZKQmvfAJealD2mDNoBkjvl+RaF+3BhG9Qc2H0IdnPVz9V9DUGF8/5DU2VGM1i
         1a3o8QAWws/XmHOuZ/YFHZ4TKeDyM58U0ik/29z8bD9IFSDE9qguvOQSp0h6e6GaIIMK
         U9cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tIj6iY1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192-20020a3708c9000000b00747a2434dbesi18136718qki.778.2023.05.02.23.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 23:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tIj6iY1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6R9-0007pX-3V; Wed, 03 May 2023 02:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R5-0007m1-KJ
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:57:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qo-0001kX-Gs
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:57:58 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so48961975e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 23:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097061; x=1685689061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PC+Gw/9P+2wBG7ELo5n/093Z6DPtUA9B8lGYDE8K0ac=;
 b=tIj6iY1ZtdTtwOkdR5f4rcOR85von0qLqLVbbO/6qkwzKbgdW2uaYvmdP31S7F0AOm
 hRFKoUHHTFhOBt9Ek5RtoaG5/Mp6VznWyHD/i4mM9kBokyLHH2QD/85baC0adkg7N2ZA
 wVH0fx2k1sUJDiawlQUSxsS0JSS6iNEJ6VeU/dCZFTK4FOHJ9JX2p06jYKfqO/CRRZNb
 OBJirCKjqwMniiFdHJEmjInlKTo8ipxaMTMqbzd8IWzceQw5kPDDrnpSccceNjsaiuwM
 GdIHgAGB6I4oWSW9jU9HOFPsHKAyZdua8MZ8vNTXlk5+HLTo6eE2jSx+zrUMk600Bq93
 Z+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097061; x=1685689061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PC+Gw/9P+2wBG7ELo5n/093Z6DPtUA9B8lGYDE8K0ac=;
 b=XREXHKozlhZPapW8JqWeiE3zqH5Fykj01vMr34MHeezlZYnIOedeNXAUOywQti364d
 UDDTJjXSNO5cYAWZPLUvlqO4jyMJrlr2Zmdu1JVoIffb2awHSqXFBlwvDVjY/HpkJWjH
 cuJ/t7/2e3xEQMQY7U5GcmABb6SIVVxM3xvyVfaZQ2bjyebY05Owr0ozQTS+M3M55bU2
 Tsza9ysoxMyx73dYkZlxFEwUGaCsXkAw1A8+B3tAZ0vBT2qSSHOEGtYJ1/Nqfz9riLLX
 8jP+uACpWYCc1+mskRX+0lqjVaFPmMtHxi13Slt+BaCheDQuwb7EAbDijcCQfReeITMI
 QZMg==
X-Gm-Message-State: AC+VfDzw8ouSiJ7REdLA1RkyXE2bqFJ/ULqwmPP4fP0z1aL4XFsb2iP7
 92kKa7bkwYGA8YUIgXqgzU7sog==
X-Received: by 2002:a1c:7c18:0:b0:3f1:789d:ad32 with SMTP id
 x24-20020a1c7c18000000b003f1789dad32mr14272670wmc.11.1683097061023; 
 Tue, 02 May 2023 23:57:41 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 14/54] tcg/loongarch64: Rationalize args to
 tcg_out_qemu_{ld, st}
Date: Wed,  3 May 2023 07:56:49 +0100
Message-Id: <20230503065729.1745843-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: L0ljq7QxwT/i

Interpret the variable argument placement in the caller.  Shift some
code around slightly to share more between softmmu and user-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 100 +++++++++++++------------------
 1 file changed, 42 insertions(+), 58 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0940788c6f..2e3c67054b 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1049,39 +1049,31 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType data_type)
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
 
@@ -1109,39 +1101,31 @@ static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
+                            MemOpIdx oi, TCGType data_type)
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
 
@@ -1564,16 +1548,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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

