Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1232596ejb;
        Fri, 2 Jun 2023 08:54:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zm8f77uINCknGjp7zBSIYwPLfg5uRbY0vvebCZHuq3ZM745m/ZjXVe9h7RWxiUWCRL4IQ
X-Received: by 2002:a05:620a:8f8a:b0:75b:23a1:3614 with SMTP id ri10-20020a05620a8f8a00b0075b23a13614mr11264312qkn.37.1685721259732;
        Fri, 02 Jun 2023 08:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685721259; cv=none;
        d=google.com; s=arc-20160816;
        b=EbNB/yeUEct4oEHvXIv4wadgCcPUWktY6FCoTiZe2oHyXD3h8rHi033fAXZYIyaitR
         KKiyXWiUD8qRTMmVLZ1HMb9bE2xEe88AvdDG67cKf+50jo/txiuVQP9RGqEJmMaYMvNs
         pZsQG6wI0zdA59twzLQH8A9ICoV6RWCzIYiW24vCYyQ1anqYpl5FGEitMmCl5bGr2FHG
         7l9Wr2N11j5gH35uZSO+MdFT0zUoRHRpdHDxcbu/eUmZ4dg7mExjEaNzrgtICqegN7mZ
         PtQtB08d0TaWyzqMyk98dugrEHrb/ELy3vfB/puJiN53GsAcTPgc2mfamlBzDhpnFkw/
         1W1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Onk7PmZ4RBQAtbMiPPN1lZWPtyNK/KqMsN/VDDn6saA=;
        b=XeAlRmbJaMJ73V4JzboC0a3f2WBqv/kemeL4t9wNE229q8f1OlaFuLFYtpYssNH7BQ
         NrOjSvUy/2Wtbb6F6/6PbDpM6GvLK+FiD4nZ/gf5L5tmNT4P45srOU1edpVEwmE3slml
         iBm5H7chmXMRjwKrBIqOueW3tR7jXq2+zKTGScYq3+xRmPwgqNIMLY3zZsk6sevMMmhe
         DsOwco+vcFIOI3mEoNKi1lE5beGalmCdo348PdpzWEzTURmhhViPSAa9BDA3/rhJdRYA
         6mc1ImUHPmEUK0sONQL53NojimCQrsVnvHwRZXYMxbje7ooqimW8T6TClduuHh0tJhMO
         g/+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SV17jwX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020ae9e70b000000b0074e3da5eec8si827494qka.626.2023.06.02.08.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 08:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SV17jwX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q574z-0003H3-OJ; Fri, 02 Jun 2023 11:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574x-0003FC-Ew
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:39 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574r-0003Wp-Tn
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f611ccd06eso21084445e9.0
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 08:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685721152; x=1688313152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Onk7PmZ4RBQAtbMiPPN1lZWPtyNK/KqMsN/VDDn6saA=;
 b=SV17jwX3+/BB7Y6y54mehkElp9jug4n2SlhFh5+eqwvkLtsxvcBXJkETkDalkxc/n1
 4PpE+Hua/GI4K6a/kjuzcEYEYwPO6h0fMntNQ5SILtJLzhxo39SHZ8510wAnwa2F3EC1
 JwgjpYCf9sjQfRHDT/YkayJq8HESTUmf0uWpCBlaANrPjCsYTIrNiHKPnVkWmk6S+rvJ
 FenxlSUIjAKT5I0cx7vCVeVwjRk16gdku7NEUUY49yDCXCQR5WI0B9fxH6mFQtQyBGuc
 7OU4hMWM6RXs7qg30Jx2QUeFipE/zlp2QJN+jDHT4ZhNFO4hPjhi3k6OMQh+oeGrlhRn
 G4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685721152; x=1688313152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Onk7PmZ4RBQAtbMiPPN1lZWPtyNK/KqMsN/VDDn6saA=;
 b=R/klkjcGgQxIDpdRBXNnn/QRrzVv3fNwV6Q1zHlRF1bHjeeALUK1SO9kh0/D+cdw/G
 kKEf2Q2mQlkG06oc0wKDQPe/H5Mg4xRSeGI/atv1Lc10O9Sz+nJ1/d7HZeCXMGrrJF4b
 imV14/eA/JG+gSwjHVnTHdXxCnzZYuouIqmp1kbwSshoqc+V57vYcTIGSX2giTGE1Lw8
 JuHEeCYNFhWkepQALN3mhRzne9erVk1IElZPHSOeitPRCFD4hP6uVS7pDZuzMNz7E7wX
 k0Y7aNvQVQcwvaglAAl0fwc43gnU+zshtz5oXsFLYuu1hE1P/BCDZdJB80S990JZdbgU
 H5LA==
X-Gm-Message-State: AC+VfDzu+NRYZPqXNfKEypCcDgfePVC5/81a5kITdzAvZIIn1EJQXl/E
 warTXClml7s/HuIrsVJh/M//LIf2GG8eOW0Xw7g=
X-Received: by 2002:a05:600c:21d0:b0:3f6:389:73b1 with SMTP id
 x16-20020a05600c21d000b003f6038973b1mr2328167wmj.6.1685721152531; 
 Fri, 02 Jun 2023 08:52:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003f72a15301csm594952wml.2.2023.06.02.08.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 08:52:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/20] target/arm: Convert LDR/STR with 12-bit immediate to
 decodetree
Date: Fri,  2 Jun 2023 16:52:16 +0100
Message-Id: <20230602155223.2040685-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602155223.2040685-1-peter.maydell@linaro.org>
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: qLSjjSatfsbG

Convert the LDR and STR instructions which use a 12-bit immediate
offset to decodetree. We can reuse the existing LDR and STR
trans functions for these.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  25 ++++++++
 target/arm/tcg/translate-a64.c | 103 +++++----------------------------
 2 files changed, 41 insertions(+), 87 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4dfb7bbdc2e..c3a6d0b740a 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -395,3 +395,28 @@ STR_v_i         sz:2 111 1 00 00 0 ......... 11 ..... ..... @ldst_imm_pre sign=0
 STR_v_i         00 111 1 00 10 0 ......... 11 ..... ..... @ldst_imm_pre sign=0 ext=0 sz=4
 LDR_v_i         sz:2 111 1 00 01 0 ......... 11 ..... ..... @ldst_imm_pre sign=0 ext=0
 LDR_v_i         00 111 1 00 11 0 ......... 11 ..... ..... @ldst_imm_pre sign=0 ext=0 sz=4
+
+# Load/store with an unsigned 12 bit immediate, which is scaled by the
+# element size. The function gets the sz:imm and returns the scaled immediate.
+%uimm_scaled   10:12 sz:3 !function=uimm_scaled
+
+@ldst_uimm      .. ... . .. .. ............ rn:5 rt:5 &ldst_imm unpriv=0 p=0 w=0 imm=%uimm_scaled
+
+STR_i           sz:2 111 0 01 00 ............ ..... ..... @ldst_uimm sign=0 ext=0
+LDR_i           00 111 0 01 01 ............ ..... ..... @ldst_uimm sign=0 ext=1 sz=0
+LDR_i           01 111 0 01 01 ............ ..... ..... @ldst_uimm sign=0 ext=1 sz=1
+LDR_i           10 111 0 01 01 ............ ..... ..... @ldst_uimm sign=0 ext=1 sz=2
+LDR_i           11 111 0 01 01 ............ ..... ..... @ldst_uimm sign=0 ext=0 sz=3
+LDR_i           00 111 0 01 10 ............ ..... ..... @ldst_uimm sign=1 ext=0 sz=0
+LDR_i           01 111 0 01 10 ............ ..... ..... @ldst_uimm sign=1 ext=0 sz=1
+LDR_i           10 111 0 01 10 ............ ..... ..... @ldst_uimm sign=1 ext=0 sz=2
+LDR_i           00 111 0 01 11 ............ ..... ..... @ldst_uimm sign=1 ext=1 sz=0
+LDR_i           01 111 0 01 11 ............ ..... ..... @ldst_uimm sign=1 ext=1 sz=1
+
+# PRFM
+NOP             11 111 0 01 10 ------------ ----- -----
+
+STR_v_i         sz:2 111 1 01 00 ............ ..... ..... @ldst_uimm sign=0 ext=0
+STR_v_i         00 111 1 01 10 ............ ..... ..... @ldst_uimm sign=0 ext=0 sz=4
+LDR_v_i         sz:2 111 1 01 01 ............ ..... ..... @ldst_uimm sign=0 ext=0
+LDR_v_i         00 111 1 01 11 ............ ..... ..... @ldst_uimm sign=0 ext=0 sz=4
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 76e3e7b13bf..9607e55cc59 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -56,6 +56,22 @@ enum a64_shift_type {
     A64_SHIFT_TYPE_ROR = 3
 };
 
+/*
+ * Helpers for extracting complex instruction fields
+ */
+
+/*
+ * For load/store with an unsigned 12 bit immediate scaled by the element
+ * size. The input has the immediate field in bits [14:3] and the element
+ * size in [2:0].
+ */
+static int uimm_scaled(DisasContext *s, int x)
+{
+    unsigned imm = x >> 3;
+    unsigned scale = extract32(x, 0, 3);
+    return imm << scale;
+}
+
 /*
  * Include the generated decoders.
  */
@@ -3067,90 +3083,6 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
     }
 }
 
-/*
- * Load/store (unsigned immediate)
- *
- * 31 30 29   27  26 25 24 23 22 21        10 9     5
- * +----+-------+---+-----+-----+------------+-------+------+
- * |size| 1 1 1 | V | 0 1 | opc |   imm12    |  Rn   |  Rt  |
- * +----+-------+---+-----+-----+------------+-------+------+
- *
- * For non-vector:
- *   size: 00-> byte, 01 -> 16 bit, 10 -> 32bit, 11 -> 64bit
- *   opc: 00 -> store, 01 -> loadu, 10 -> loads 64, 11 -> loads 32
- * For vector:
- *   size is opc<1>:size<1:0> so 100 -> 128 bit; 110 and 111 unallocated
- *   opc<0>: 0 -> store, 1 -> load
- * Rn: base address register (inc SP)
- * Rt: target register
- */
-static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
-                                        int opc,
-                                        int size,
-                                        int rt,
-                                        bool is_vector)
-{
-    int rn = extract32(insn, 5, 5);
-    unsigned int imm12 = extract32(insn, 10, 12);
-    unsigned int offset;
-
-    TCGv_i64 clean_addr, dirty_addr;
-
-    bool is_store;
-    bool is_signed = false;
-    bool is_extended = false;
-
-    if (is_vector) {
-        size |= (opc & 2) << 1;
-        if (size > 4) {
-            unallocated_encoding(s);
-            return;
-        }
-        is_store = !extract32(opc, 0, 1);
-        if (!fp_access_check(s)) {
-            return;
-        }
-    } else {
-        if (size == 3 && opc == 2) {
-            /* PRFM - prefetch */
-            return;
-        }
-        if (opc == 3 && size > 1) {
-            unallocated_encoding(s);
-            return;
-        }
-        is_store = (opc == 0);
-        is_signed = extract32(opc, 1, 1);
-        is_extended = (size < 3) && extract32(opc, 0, 1);
-    }
-
-    if (rn == 31) {
-        gen_check_sp_alignment(s);
-    }
-    dirty_addr = read_cpu_reg_sp(s, rn, 1);
-    offset = imm12 << size;
-    tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
-    clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, size);
-
-    if (is_vector) {
-        if (is_store) {
-            do_fp_st(s, rt, clean_addr, size);
-        } else {
-            do_fp_ld(s, rt, clean_addr, size);
-        }
-    } else {
-        TCGv_i64 tcg_rt = cpu_reg(s, rt);
-        bool iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
-        if (is_store) {
-            do_gpr_st(s, tcg_rt, clean_addr, size,
-                      true, rt, iss_sf, false);
-        } else {
-            do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
-                      is_extended, true, rt, iss_sf, false);
-        }
-    }
-}
-
 /* Atomic memory operations
  *
  *  31  30      27  26    24    22  21   16   15    12    10    5     0
@@ -3446,9 +3378,6 @@ static void disas_ldst_reg(DisasContext *s, uint32_t insn)
             return;
         }
         break;
-    case 1:
-        disas_ldst_reg_unsigned_imm(s, insn, opc, size, rt, is_vector);
-        return;
     }
     unallocated_encoding(s);
 }
-- 
2.34.1

