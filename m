Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2597754ejm;
        Sun, 23 Apr 2023 22:47:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350aIxtVPwp3J4lIvuH1F/psc+mArisP19DrE0l8l+l2jaKI5A34p6BNZo2btGNYauGgHMc5I
X-Received: by 2002:a05:6214:20e2:b0:5ca:83ed:12be with SMTP id 2-20020a05621420e200b005ca83ed12bemr23313990qvk.21.1682315221858;
        Sun, 23 Apr 2023 22:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315221; cv=none;
        d=google.com; s=arc-20160816;
        b=ayPjZyWC4d5mnbd0sXDklc9rEk/tm3IxmX5VDlJCScpFwpBK/w1+3ObVx7vxyMFeBo
         tfJKVM9D23JYy8l/KpO7BHrf3vJGB1XCXrSLPhdLIQy18n34RZ7F9h1X9vjl4xpKUwoQ
         kFAlopByRt5Gi97NErfCnI3H/VQAZpEi6Sktfg3akK9gq7WQ8QDU0YGLGjdcdM84G6e1
         klbKndknW/hxBtftJmMlBOmm0ixIIdWOPQMzbzjkTdSV1YM/7LbK7N//4DZOayoSxP9N
         PI6ZHtmdfLEtgPxIarkYbv68kue6DcAvPFqgFpQFPPjyQf0P2I2EBnY82gfBoqx6qVov
         /VKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PCb5/pWQaLjZZ2RDI9ILyX7XKLBQiXMqZTnOPo1b490=;
        b=FZCtOHsNJdT3omDnLtBZ2/g3f6DfyQ+mkqQPdz5IG3Sn1og0jlj0ocnVhy/XRnEqym
         8RLzeoCn8astB0L1SebE6I7g2FFWB6eQw2lG4/eFXk9F0gVfHzkrG7Mzap9rTTmC7ymQ
         r+sKR2tMxhdwd0lKFNhXHPgR9j9daMALgB5vqy+Q7vInNi7YdFX6lq3rhDEG5lQItzFb
         bOwEjUX2C5xXI/Ah2QwJgiYLwDRClV85jRdONOffrh1oMoNOsm0Ewg8T5/eni1jqa2fP
         jsJSip/okT3WllD5EiE2fl8RneURjzAxPXilynnwNFjuFexhcjlozQ+/4OCQRCxizXH5
         aBQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nBlK/Y3e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm2-20020a056214268200b005a1900ab5e4si6751044qvb.223.2023.04.23.22.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:47:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nBlK/Y3e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqozV-0001Gp-30; Mon, 24 Apr 2023 01:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxT-0005aL-7s
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowx-0004LZ-2f
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so3816476f8f.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314877; x=1684906877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCb5/pWQaLjZZ2RDI9ILyX7XKLBQiXMqZTnOPo1b490=;
 b=nBlK/Y3e6OrLbvmmBZK+Ck3zqoF5xRg4eJw3PAWaoB3bt09Ui/wmGRXZUDqHHUyB0i
 czgGBt8O3flbbrqS2Hp4N2oUzChqbfQFsXzGtya72AkRzotoaeLIzG/zEOAbXvbYE/Go
 K19Hy275fP1e5m3wGjEMgWDTUP4n/bYVdM2HdxACCHdhwcB0tU8jwMmmw+1I8F/+3Ucb
 /WhATI0bZguxziHqIjXjimIcnUQpRFzoh5nDK4Brtqhrx/EN/jhHjeq6L1PFofa3oTVs
 sgUkDSkCOt3wfxynDfq1iLoomH5FmmNG/MM8GFaGOhq4Ym/eoH9wzEMu1UD8G1G6qJ0i
 1orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314877; x=1684906877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PCb5/pWQaLjZZ2RDI9ILyX7XKLBQiXMqZTnOPo1b490=;
 b=JnXyUtRWiRGW7L3Zg9phoa+Mq36HShGwh88zRRHhdhF2RzaGDJwKeHSlk810LY9uq1
 cG9Hg4QC/iVMZUqjku7nkDojYYU03KmPT/eF+y6QSTyw8X9KEgU/spbePOa4OJUSfJ1i
 156j8JdAJxO7wLtQp8kFEDGZIyrVCMcACYyea2B2att7ONH7V7+QSg7V6RscsE2nUOii
 KDTBh7VpvzTrVUjAU0KKgIlIYnL1tZjw4skT9GKc8nJNOkQ4Hj4Dy/GHifMg3SBrlEaG
 is0o+bc/4q1r+dTifwcBywrRiO6gaj80UAXSyhvOQpxIJ33fHuWlO7P1QnN/A/k3+GNM
 5SYw==
X-Gm-Message-State: AAQBX9dm5PYixvcZkHOY1drGPW7gt9bjRcmN0vBHbzMCydErJuhDDkUZ
 O0b6cPgWj+NTUhdy239brYsv4A==
X-Received: by 2002:a5d:5145:0:b0:2cf:f01f:ed89 with SMTP id
 u5-20020a5d5145000000b002cff01fed89mr8405255wrt.24.1682314877060; 
 Sun, 23 Apr 2023 22:41:17 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 19/57] tcg/loongarch64: Introduce HostAddress
Date: Mon, 24 Apr 2023 06:40:27 +0100
Message-Id: <20230424054105.1579315-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: CYiCfo9NXjeL

Collect the 2 parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 55 +++++++++++++++++---------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 2e3c67054b..6a87a5e5a3 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1013,36 +1013,41 @@ static TCGReg tcg_out_zext_addr_if_32_bit(TCGContext *s,
     return addr;
 }
 
-static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
-                                   TCGReg rk, MemOp opc, TCGType type)
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+} HostAddress;
+
+static void tcg_out_qemu_ld_indexed(TCGContext *s, MemOp opc, TCGType type,
+                                    TCGReg rd, HostAddress h)
 {
     /* Byte swapping is left to middle-end expansion.  */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
-        tcg_out_opc_ldx_bu(s, rd, rj, rk);
+        tcg_out_opc_ldx_bu(s, rd, h.base, h.index);
         break;
     case MO_SB:
-        tcg_out_opc_ldx_b(s, rd, rj, rk);
+        tcg_out_opc_ldx_b(s, rd, h.base, h.index);
         break;
     case MO_UW:
-        tcg_out_opc_ldx_hu(s, rd, rj, rk);
+        tcg_out_opc_ldx_hu(s, rd, h.base, h.index);
         break;
     case MO_SW:
-        tcg_out_opc_ldx_h(s, rd, rj, rk);
+        tcg_out_opc_ldx_h(s, rd, h.base, h.index);
         break;
     case MO_UL:
         if (type == TCG_TYPE_I64) {
-            tcg_out_opc_ldx_wu(s, rd, rj, rk);
+            tcg_out_opc_ldx_wu(s, rd, h.base, h.index);
             break;
         }
         /* fallthrough */
     case MO_SL:
-        tcg_out_opc_ldx_w(s, rd, rj, rk);
+        tcg_out_opc_ldx_w(s, rd, h.base, h.index);
         break;
     case MO_UQ:
-        tcg_out_opc_ldx_d(s, rd, rj, rk);
+        tcg_out_opc_ldx_d(s, rd, h.base, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1053,23 +1058,23 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    TCGReg base, index;
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
 
     tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    index = TCG_REG_TMP2;
+    h.index = TCG_REG_TMP2;
 #else
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+    h.index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
 #endif
 
-    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, data_reg, base, index, opc, data_type);
+    h.base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_ld_indexed(s, opc, data_type, data_reg, h);
 
 #ifdef CONFIG_SOFTMMU
     add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
@@ -1077,24 +1082,24 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 #endif
 }
 
-static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
-                                   TCGReg rj, TCGReg rk, MemOp opc)
+static void tcg_out_qemu_st_indexed(TCGContext *s, MemOp opc,
+                                    TCGReg rd, HostAddress h)
 {
     /* Byte swapping is left to middle-end expansion.  */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SIZE) {
     case MO_8:
-        tcg_out_opc_stx_b(s, data, rj, rk);
+        tcg_out_opc_stx_b(s, rd, h.base, h.index);
         break;
     case MO_16:
-        tcg_out_opc_stx_h(s, data, rj, rk);
+        tcg_out_opc_stx_h(s, rd, h.base, h.index);
         break;
     case MO_32:
-        tcg_out_opc_stx_w(s, data, rj, rk);
+        tcg_out_opc_stx_w(s, rd, h.base, h.index);
         break;
     case MO_64:
-        tcg_out_opc_stx_d(s, data, rj, rk);
+        tcg_out_opc_stx_d(s, rd, h.base, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1105,23 +1110,23 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    TCGReg base, index;
+    HostAddress h;
 
 #ifdef CONFIG_SOFTMMU
     tcg_insn_unit *label_ptr[1];
 
     tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
-    index = TCG_REG_TMP2;
+    h.index = TCG_REG_TMP2;
 #else
     unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+    h.index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
 #endif
 
-    base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, data_reg, base, index, opc);
+    h.base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
+    tcg_out_qemu_st_indexed(s, opc, data_reg, h);
 
 #ifdef CONFIG_SOFTMMU
     add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-- 
2.34.1

