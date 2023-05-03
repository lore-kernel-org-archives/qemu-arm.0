Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2651577ejm;
        Wed, 3 May 2023 00:06:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7BETz+/l/d1tGgwu4zgrb1750KTdOwqVmIO+EVXhKy9650KNYLhz63rCTrmbpmaB7LEn+r
X-Received: by 2002:ac8:5b87:0:b0:3e6:3929:e9bc with SMTP id a7-20020ac85b87000000b003e63929e9bcmr29933611qta.6.1683097601169;
        Wed, 03 May 2023 00:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097601; cv=none;
        d=google.com; s=arc-20160816;
        b=Js8EMqHnplExU2ptYaX7a9tWLwt3fGYJAk1E14mcz2wnGiPdBFtQXcCz/VvQ7ZhGgR
         AITG/t/S397ciCbPjiKDrgyXsuC6NSYvXarRm6GVygk0/HhPt1PgM471x4PdSoDFjUhZ
         0BcTPWK8zYLXgQOP8OxFDmyeXQezVk/D4f+62QvNaLTqmNc0wbKQNjFYYkkI3e/7vXwu
         LubDuNNpIPJUK2CPtjp2LCRX0gL0crhmFuGsTYnZVNY7pKn+Sh/EXJPV5VOE14pL14Wz
         d2EqCBcq637NTC9nPIJ+1YKBdVYrXtCUKP7Q/HtEFcITcjoQsPy8ZLU+HnOuzzy+kwMh
         Gepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N3QoKqsv+R/CZvxHdMJxo06yfgQBTVK77OIFinD6LW0=;
        b=IohtfpiV9JD7HW70MJMcsKsQ7hIuY4N3V4THZdj2izEwv8E0c4BL0ee44H7SrnV8LQ
         zIHClZRRoiawURA/c3zVNUDGQvHSYPLGMkJ1whieqyyErrfl4QLvZgRjZkiPFnzwo1qb
         +2RmoQddxdsgGZNsMe3XSfeeA15zCTkBkZLqYhFBLmzOT9B4lOI2kEWdhNoO/+Z8GkW9
         Zbtj2UitjoG/zeAPbU+ehev962HE9ZaQ6MkS12FkdM87sI+iEw7KffsDr/t3Pfiffv/t
         fI/kdD1YWeNyNzg1a+/Ods1GIK+nxcfSKYsAIA9EXiP56H1s5oirTP529om3B0mX89XX
         009w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mH2U7/eW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020a378707000000b0073b64657ba9si17687350qkd.489.2023.05.03.00.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mH2U7/eW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6R7-0007nj-Ib; Wed, 03 May 2023 02:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R6-0007mX-0c
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:00 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qp-0001lA-CZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:59 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so46084315e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097062; x=1685689062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N3QoKqsv+R/CZvxHdMJxo06yfgQBTVK77OIFinD6LW0=;
 b=mH2U7/eWOoHkBLRrNCKqxG+jmnf5v7M7dBw410V3TxRDy31ElUphWWXUBlbVshw88X
 kUW7/OJ2Tm0NmS8Up4O9GctHL8lvSB+kv8bRrPXn5lCXB18rq75OyE8lf4qJyC8RCiHm
 tfMgEAkI8k/MCZThxcgRiyyXtc6c9p9UmUU4RViuNS7vZmoCwzJtPB7vQtFcBmspdHuT
 gakwAQyHz7wlN6Hi4I8fXP/+8pU9xx+G74wPn6uaIMp63+cGAJVhjar+gilDhu4XT4rz
 BGv10wj2GgNjnZ0DOQ76amwV8KAMGx04n0H9gazUVA9jdox7rbkXXqxhAlGeJhviI2up
 EeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097062; x=1685689062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N3QoKqsv+R/CZvxHdMJxo06yfgQBTVK77OIFinD6LW0=;
 b=Y69NhmRLkot55MAzKtwGKYW5WRnooiS492vMmrXOgYUPqERQm/NezOJyVWF90/oCSM
 3tceTDFyCZ8HX73/M0s+UJrcbVE+GYIHGgK28BmEC/wQBQC85+HVEP/VYBxsuQuH40Cr
 tkE9r0X2OZsw3CgAjaoViIvhpCw6mPxGVq3NNi+IQ9N1n5MNizg1gAxi3/8yuAGPB9yY
 iez7QXzVSOdGVUZ9em+oqEPXX7Zyk8Q4ULu6eJ+aNgyR2t2KdwNxrgOVpVw8Pyfwzhzo
 qaAEiqZ7Zg7+9xuVXbdClvK+LG2PtJ9NqeDXRbFW+Hxtlyw7iRqd9/u8W06Mobrht+nM
 LKWg==
X-Gm-Message-State: AC+VfDwVF+QTAsCPlq/f/kvKXqFdtkEOWPApYYNd9bN0VSKt8+jPTmeS
 XsfYuV+sP+dP3YgJBKvDGsfiOEj3TIiiJBAtpxuC2g==
X-Received: by 2002:a05:600c:24a:b0:3f2:51e7:f1f4 with SMTP id
 10-20020a05600c024a00b003f251e7f1f4mr14411206wmj.10.1683097061901; 
 Tue, 02 May 2023 23:57:41 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 15/54] tcg/loongarch64: Introduce HostAddress
Date: Wed,  3 May 2023 07:56:50 +0100
Message-Id: <20230503065729.1745843-16-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hgufHEZN4CzE

Collect the 2 parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

