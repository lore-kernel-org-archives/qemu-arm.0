Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2599840ejm;
        Sun, 23 Apr 2023 22:52:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350YOk+mcQ91aUvX9cE1Ca3013A0sQvRBfBd+SVPDhaR4LFr6UqLKsTMwj5zmXolVrztQRC2w
X-Received: by 2002:a05:6214:1c0f:b0:5f4:4e3d:2bde with SMTP id u15-20020a0562141c0f00b005f44e3d2bdemr24445109qvc.48.1682315519931;
        Sun, 23 Apr 2023 22:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315519; cv=none;
        d=google.com; s=arc-20160816;
        b=zHPLTmC/6l1fz+4IvQFb5Ar2nyrh2wHcvw0QOfE4ZSsL2lmDQ/pud+m6Vk5hlTDjHc
         FDtC1IHQOFzGQJMKGt6c4icDNXiQtA+MRN4ShYthxmWah7bF7w5uxGYL+XC/iZB4GSCj
         pEQgeyQUb6whsjkMoy30Sf6tVxnuM2manZk+LE8KnPzYnQO/170OLJaPINhV4Ykw9tUu
         5N4nMNdJ8JSumK5uyMFcKXCoal+m/ie6f7OV/VAel17P+CLKpx/yhIWzMec3Dd7zohm3
         WWuLGDZb3oWzJSQpb9n2spGVfHQhxbm0RWqB96SCjTRj18uhOgHhMzs11jz1ryCrsMIK
         P7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=64H1HdxJ2Vo9fMDDBGxTfjpGZYN3L1dEu1eUYP7zZpo=;
        b=ZD43a0GefL6RWgAtr5dovZoPp0KZt99azLYVHXm0pGnrC0mUCX14/h6reMr/1P6l89
         tQHT3jKqAwiSLgJrytTd6e+vmlTdEwUTKm62jQ2OBphEcMBZ0SsWvdsDGLzKumsdmQNN
         2+LPN2gm9bNFlNS2JDV9GCSDFfEgtLiJT8vO4TEe0BKSOdf2p0KbrYI0GAzAzXDEfENo
         Lbg+OOgo/F39uzqLABjZ7jOhRWuWgBKLn1e7uaIqxjKhv0raMBV6kjBwjBdAgjV/aiiF
         I0r2ncDMP68DGi+RNiuwZ5jIpSG/ncZpXe4/g5xd77uYf2o9Ze0UnFdjJHW1i1g6RLEL
         ATzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jW+j/ruR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ad45baa000000b00571b08178e4si6397268qvq.385.2023.04.23.22.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jW+j/ruR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp2o-0002hX-5v; Mon, 24 Apr 2023 01:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0K-00060T-6L
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:44:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0A-0005KI-Fb
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:44:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso2305188f8f.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315075; x=1684907075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64H1HdxJ2Vo9fMDDBGxTfjpGZYN3L1dEu1eUYP7zZpo=;
 b=jW+j/ruRCg+N/1a11czPzEPC2rYJvzloAUY9AtbAuCTRTBuI6JN2rFR4YyiMC9Ow/y
 nmmHjD/uaUXCkaatLY8mH52268drwwZTPmhfzJk+HRzllso5DGbat/anPqqdg9DSBG03
 pj6BwUfLay6zc6yotD6Y/66U9FWLYS+0u9/fNN8qhGi/WwlTqe1aXWyzixQ5sTm3K1PS
 eO6nu/CRYv884N9h8lWw5V/W3hD0xCJW4STE4gmvXAmEwQlh33L6fCoCOpZz89y9AMmz
 9ZzVzqEhfwDvm7+n5sVTP+d7wlw8RVV+I+aOPpHlW7jThkrP3iEYe4rSDGfdWhv4Ull5
 YgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315075; x=1684907075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64H1HdxJ2Vo9fMDDBGxTfjpGZYN3L1dEu1eUYP7zZpo=;
 b=iKSB6KurZaM1X3N5UJOnYne3a9KOlwIdT8XHmi0/PetnufgaOEEaTzIh0/2/T4wS9+
 0XpKX6Lme/jefofgyA4FTNYDOE1vKMaLfvzBAT0/MzXPBAgWWkEmefU41wbvR6wNJ4p2
 K7CsFAA24NnI7Eysuaaxten1ZktL5PSyh49PLxRU/o85v2x0z1EY0onE7Vps8Y4vWtnq
 KkokxalmUEe2bEyd91DOT1C2xVy5sZRcXNOcoRJ8ZtoOb4+xpUuR80kHa5fO4rb8HbZX
 LEc0hjsiKI8ETPb6XLS+MxwBoT3R2yV4Nml47DisuBnzWPqzDhQ3mWxYVli3u0GU1+vv
 +fWg==
X-Gm-Message-State: AAQBX9cNxvVhvWW+ZYhPxOA5goqz8nNSKsiPBpHi115NGXPBLLyZSd4j
 DNbkOpULYMbWg7AeVrXp7GTZCr04VfSJaZoWBS4bsA==
X-Received: by 2002:a05:6000:1290:b0:2f9:1224:2474 with SMTP id
 f16-20020a056000129000b002f912242474mr8489859wrx.23.1682315075672; 
 Sun, 23 Apr 2023 22:44:35 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 50/57] tcg/mips: Reorg tlb load within prepare_host_addr
Date: Mon, 24 Apr 2023 06:40:58 +0100
Message-Id: <20230424054105.1579315-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: 4ZTRwJITjy66

Compare the address vs the tlb entry with sign-extended values.
This simplifies the page+alignment mask constant, and the
generation of the last byte address for the misaligned test.

Move the tlb addend load up, and the zero-extension down.

This frees up a register, which allows us use TMP3 as the returned base
address register instead of A0, which we were using as a 5th temporary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 31d58e1977..695c137023 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -370,6 +370,8 @@ typedef enum {
     ALIAS_PADDI    = sizeof(void *) == 4 ? OPC_ADDIU : OPC_DADDIU,
     ALIAS_TSRL     = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
                      ? OPC_SRL : OPC_DSRL,
+    ALIAS_TADDI    = TARGET_LONG_BITS == 32 || TCG_TARGET_REG_BITS == 32
+                     ? OPC_ADDIU : OPC_DADDIU,
 } MIPSInsn;
 
 /*
@@ -1263,14 +1265,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int add_off = offsetof(CPUTLBEntry, addend);
     int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
                         : offsetof(CPUTLBEntry, addr_write);
-    target_ulong tlb_mask;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
     ldst->oi = oi;
     ldst->addrlo_reg = addrlo;
     ldst->addrhi_reg = addrhi;
-    base = TCG_REG_A0;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
@@ -1290,15 +1290,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
     } else {
-        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
-                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
-                     TCG_TMP0, TCG_TMP3, cmp_off);
+        tcg_out_ld(s, TCG_TYPE_TL, TCG_TMP0, TCG_TMP3, cmp_off);
     }
 
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrlo);
-        addrlo = base;
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
     }
 
     /*
@@ -1306,18 +1303,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * For unaligned accesses, compare against the end of the access to
      * verify that it does not cross a page boundary.
      */
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
-    if (a_mask >= s_mask) {
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
-    } else {
-        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrlo, s_mask - a_mask);
+    tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, TARGET_PAGE_MASK | a_mask);
+    if (a_mask < s_mask) {
+        tcg_out_opc_imm(s, ALIAS_TADDI, TCG_TMP2, addrlo, s_mask - a_mask);
         tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
+    } else {
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
     }
 
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+    /* Zero extend a 32-bit guest address for a 64-bit host. */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_TMP2, addrlo);
+        addrlo = TCG_TMP2;
     }
 
     ldst->label_ptr[0] = s->code_ptr;
@@ -1329,14 +1326,15 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
 
         /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP3, TCG_TMP3, add_off);
 
         ldst->label_ptr[1] = s->code_ptr;
         tcg_out_opc_br(s, OPC_BNE, addrhi, TCG_TMP0);
     }
 
     /* delay slot */
-    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrlo);
+    base = TCG_TMP3;
+    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP3, addrlo);
 #else
     if (a_mask && (use_mips32r6_instructions || a_bits != s_bits)) {
         ldst = new_ldst_label(s);
-- 
2.34.1

