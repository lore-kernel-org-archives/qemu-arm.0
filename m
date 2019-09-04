Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1161918wrp;
        Wed, 4 Sep 2019 13:26:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMxpv72Bb0cEvDeOSA1ahHWJq6bfmBT+UvTX2QV5RaTkT0wa5UK+Exm7wFJALrjQzu4Bka
X-Received: by 2002:a50:ace1:: with SMTP id x88mr135055edc.300.1567628774735;
        Wed, 04 Sep 2019 13:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628774; cv=none;
        d=google.com; s=arc-20160816;
        b=Xvk7t+oyRN8uQxBBuh0JRHLaldBRuhwOadq8i5DJxtE3n2lhejqNoTxp00P4sGbBFj
         GWyRu4MP4TpEzQXCN6WfrC+bH+1kXMxDkGMuFnMR/dRGuJ6dqplUkHNaQj+tjQgq9wNx
         F2MuH5Jw6qOhHzg5E65Sr7pWWFE6Tt5vKAJaPUGOiifb/x9uIRI4toHlEwwqjuka6TnQ
         Ipt2VA21cwXYvuaVBrF9ddHUB5Z0xdY0vC79U6YrGrYLidxa10G28jduhTbWTQ7UwT3f
         KUWHq3GdGPkvJZ1msTDuF024Yc4nwktnK7phVOQW7U0j7F3xtkD45wrWvpZ1o8FZJwMY
         kZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=U5HqQQCoMgATbAeqUvsvbzJcESqlSaZ4tMjdZ5JSZUU=;
        b=lph6eDvfeUoscUM5V2s8yp5zRnBd0i3QvVdFJfdaMlZFJT1kr6pohcefJBDXfC0uQN
         w1KKrJHbAu9mmFXmNE6gAdA3bkXYm0usMrU3FrzxoZPWJajtZFusSAET0/JtaTU+FBKX
         2kZBERr78mYziie6c+JIuYviJKApbSqWfd+Rmcs6eFRYH31yOKH9jvnRkpUN/U4KC2jU
         eRtp4SFFWanCJIOCb7dR6X5f34FvJYD7agdPHaSfayUf0cHSqS1rYBEA9Q+Uq3Ba4NYY
         CLTwhMJfnCsDdwQNzf4rWY5ceGyDL+Wo5Tp1JYObyOJ+0wRdxhsfIzWv6MsgdPgC5B4M
         vhdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rg66FiXw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si74695ejn.192.2019.09.04.13.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rg66FiXw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5br3-0002hK-59
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b11-0005b3-6A
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0w-0003Fz-P3
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:26 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44954)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0w-0003E3-6P
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:22 -0400
Received: by mail-pg1-x536.google.com with SMTP id i18so11770437pgl.11
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U5HqQQCoMgATbAeqUvsvbzJcESqlSaZ4tMjdZ5JSZUU=;
 b=rg66FiXwzjtDftCtNFJ4YJDuBUc/6V3ZWoM2DefZWq0T9YmKlK6qzbxYRKt4hGvyJW
 wu7zalGol+sQqyFXQ8O56YuSNt9DXWNJK1IXzzdYPjBUcABZ71GZbYl4bs2klBvUel4I
 XX5WcA7CdqUWiUl5Mlss0U2KUM4uIdLH6vojI3iFeM5oJLaitsA6Jv9xkShER6Inw0oH
 lCRZ9JagDV5oetezCBS7Lz/8caiz/t5aVWHaTsRBjfoWm8SuBXfJk11FgCA+LacOcx/e
 1iEY8ATKg7+ZPUoNgEj73olSaULRh8w4GZ+GXKeHJNDmtfpmR+UfSJwGj1dfOKx7aknI
 zljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U5HqQQCoMgATbAeqUvsvbzJcESqlSaZ4tMjdZ5JSZUU=;
 b=ny/aRsUnbzTmY3CvvB15AC1CdTr/26SkOT9eK7dsydldI73zmHrxdj6lAF4TodCjPu
 Q47GOvkEdlQN+eyDy0PZTJZ+1oBS8WSgfNBR+RLWKWtuFsayRyG7IEu8r2RuNR4dWXJI
 iv+6ADZk+23Xb2n1VwSpdB5/DRpN4zejeJMVzESIg/3N2XaldroZ8jsjgB6DsiKzwe1u
 lNkDQlbsyRDKqjJcuazaJXVdj4wZYqB2l74R+ezzcHfb11GTy/7aWEKrcw6RKxnM1wJz
 wwkkAHrUPtiYDlt9DCvEdLeJKDEMiak0wgDeUuT2rcgzqu9rntlaXbqm/8J5L0c8BQUv
 sYwQ==
X-Gm-Message-State: APjAAAU47wsPc1Qr9Mwn67PjyU1NECQmjs1TFqcFcqm++dHoC/tsYuP4
 d7pd+I16W9tGFWADexlodXXiVE6j9Rc=
X-Received: by 2002:aa7:9a84:: with SMTP id w4mr21243579pfi.244.1567625540736; 
 Wed, 04 Sep 2019 12:32:20 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:53 -0700
Message-Id: <20190904193059.26202-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::536
Subject: [Qemu-devel] [PATCH v4 63/69] target/arm: Convert T16,
 Miscellaneous 16-bit instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fAMrx9iHmlED

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Split firstcond & mask within trans_IT.
---
 target/arm/translate.c | 111 +++++++++++++----------------------------
 target/arm/t16.decode  |  29 +++++++----
 2 files changed, 54 insertions(+), 86 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a4844992d5..48ed6f6b5d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10196,6 +10196,18 @@ static bool trans_TBH(DisasContext *s, arg_tbranch *a)
     return op_tbranch(s, a, true);
 }
 
+static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
+{
+    TCGv_i32 tmp = load_reg(s, a->rn);
+
+    arm_gen_condlabel(s);
+    tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
+                        tmp, 0, s->condlabel);
+    tcg_temp_free_i32(tmp);
+    gen_jmp(s, read_pc(s) + a->imm);
+    return true;
+}
+
 /*
  * Supervisor call
  */
@@ -10417,6 +10429,27 @@ static bool trans_PLI(DisasContext *s, arg_PLD *a)
     return ENABLE_ARCH_7;
 }
 
+/*
+ * If-then
+ */
+
+static bool trans_IT(DisasContext *s, arg_IT *a)
+{
+    int cond_mask = a->cond_mask;
+
+    /*
+     * No actual code generated for this insn, just setup state.
+     *
+     * Combinations of firstcond and mask which set up an 0b1111
+     * condition are UNPREDICTABLE; we take the CONSTRAINED
+     * UNPREDICTABLE choice to treat 0b1111 the same as 0b1110,
+     * i.e. both meaning "execute always".
+     */
+    s->condexec_cond = (cond_mask >> 4) & 0xe;
+    s->condexec_mask = cond_mask & 0x1f;
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10783,83 +10816,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 8: /* load/store halfword immediate offset, in decodetree */
     case 9: /* load/store from stack, in decodetree */
     case 10: /* add PC/SP (immediate), in decodetree */
+    case 11: /* misc, in decodetree */
     case 12: /* load/store multiple, in decodetree */
-        goto illegal_op;
-
-    case 11:
-        /* misc */
-        op = (insn >> 8) & 0xf;
-        switch (op) {
-        case 0: /* add/sub (sp, immediate), in decodetree */
-        case 2: /* sign/zero extend, in decodetree */
-            goto illegal_op;
-
-        case 4: case 5: case 0xc: case 0xd:
-            /* push/pop, in decodetree */
-            goto illegal_op;
-
-        case 1: case 3: case 9: case 11: /* czb */
-            rm = insn & 7;
-            tmp = load_reg(s, rm);
-            arm_gen_condlabel(s);
-            if (insn & (1 << 11))
-                tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, s->condlabel);
-            else
-                tcg_gen_brcondi_i32(TCG_COND_NE, tmp, 0, s->condlabel);
-            tcg_temp_free_i32(tmp);
-            offset = ((insn & 0xf8) >> 2) | (insn & 0x200) >> 3;
-            gen_jmp(s, read_pc(s) + offset);
-            break;
-
-        case 15: /* IT, nop-hint.  */
-            if ((insn & 0xf) == 0) {
-                goto illegal_op; /* nop hint, in decodetree */
-            }
-            /*
-             * IT (If-Then)
-             *
-             * Combinations of firstcond and mask which set up an 0b1111
-             * condition are UNPREDICTABLE; we take the CONSTRAINED
-             * UNPREDICTABLE choice to treat 0b1111 the same as 0b1110,
-             * i.e. both meaning "execute always".
-             */
-            s->condexec_cond = (insn >> 4) & 0xe;
-            s->condexec_mask = insn & 0x1f;
-            /* No actual code generated for this insn, just setup state.  */
-            break;
-
-        case 0xe: /* bkpt */
-        {
-            int imm8 = extract32(insn, 0, 8);
-            ARCH(5);
-            gen_exception_bkpt_insn(s, syn_aa32_bkpt(imm8, true));
-            break;
-        }
-
-        case 0xa: /* rev, and hlt */
-        {
-            int op1 = extract32(insn, 6, 2);
-
-            if (op1 == 2) {
-                /* HLT */
-                int imm6 = extract32(insn, 0, 6);
-
-                gen_hlt(s, imm6);
-                break;
-            }
-
-            /* Otherwise this is rev, in decodetree */
-            goto illegal_op;
-        }
-
-        case 6: /* setend, cps; in decodetree */
-            goto illegal_op;
-
-        default:
-            goto undef;
-        }
-        break;
-
     case 13: /* conditional branch or swi, in decodetree */
         goto illegal_op;
 
@@ -10915,7 +10873,6 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     }
     return;
 illegal_op:
-undef:
     unallocated_encoding(s);
 }
 
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index cbc64f4e48..f128110dee 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -211,19 +211,30 @@ REVSH           1011 1010 11 ... ...            @rdm
 # Hints
 
 {
-  YIELD         1011 1111 0001 0000
-  WFE           1011 1111 0010 0000
-  WFI           1011 1111 0011 0000
+  {
+    YIELD       1011 1111 0001 0000
+    WFE         1011 1111 0010 0000
+    WFI         1011 1111 0011 0000
 
-  # TODO: Implement SEV, SEVL; may help SMP performance.
-  # SEV         1011 1111 0100 0000
-  # SEVL        1011 1111 0101 0000
+    # TODO: Implement SEV, SEVL; may help SMP performance.
+    # SEV       1011 1111 0100 0000
+    # SEVL      1011 1111 0101 0000
 
-  # The canonical nop has the second nibble as 0000, but the whole of the
-  # rest of the space is a reserved hint, behaves as nop.
-  NOP           1011 1111 ---- 0000
+    # The canonical nop has the second nibble as 0000, but the whole of the
+    # rest of the space is a reserved hint, behaves as nop.
+    NOP         1011 1111 ---- 0000
+  }
+  IT            1011 1111 cond_mask:8
 }
 
+# Miscellaneous 16-bit instructions
+
+%imm6_9_3       9:1 3:5 !function=times_2
+
+HLT             1011 1010 10 imm:6              &i
+BKPT            1011 1110 imm:8                 &i
+CBZ             1011 nz:1 0.1 ..... rn:3        imm=%imm6_9_3
+
 # Push and Pop
 
 %push_list      0:9 !function=t16_push_list
-- 
2.17.1

