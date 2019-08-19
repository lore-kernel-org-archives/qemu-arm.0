Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3207925wrs;
        Mon, 19 Aug 2019 15:27:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCdLeFU+2q2/Ceko/Ffs7fUp72QmaNxOLbTcivWjik2VufPckJlweY0eo403ShQ3FflyTg
X-Received: by 2002:ac8:661a:: with SMTP id c26mr23601576qtp.106.1566253654728;
        Mon, 19 Aug 2019 15:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253654; cv=none;
        d=google.com; s=arc-20160816;
        b=gB+U9PzK7CiwTNy4QO7YjPjLvJBofMmtCm9hHe5EM0rs786VgyWUPIcjxgvBn73J90
         avs+gqcaJllvCrE8WPyDLm74gwT/2HPExT5njvyn/a7h5S070RIIYIGVqb5qTQQyQ5fh
         ZggOW8G+SJSd/IEuI0J6Q817cFbP+Vhsua2TlR7mp9GTDesEHG+zdBFpe8bf++4LT2U9
         0Ak7Ky6r27yxgSQ2SrZaLNaK69dZvcppl/vsUZlRhSMIBzP2i6Eu1Fbpk0vZm42GRslc
         pxoWswJL1nBk9KvRg0oo3cyCXXGleVnsMO7lsR6wffSfdJ7nqCijuxM9symZ66IUdKkp
         j5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EJyW8b8UYEXRGkuf/Ca0ZoUaQassWgEv4Qo6kd6MUJ0=;
        b=qFPbgxA4nG2xQp/ixwgmle4EqObJwOo+UmacsML+rgeFB47mqOnJkeU6Y6UQuzTJF5
         Iyf964OMNUdsEMdpsugb7FLl59IbisTp6tXiYdhWKAItSsd0mdv46FzoFKABvIV7Wezl
         pkNdHePOIgekuew5N/GxB3DERBMyyX2mBNtPN7BaOcVz7qjij7Bt0A+mCgseXmCxnYWO
         dtNXI+gU376CCRYMUmInJTEXyvpSwtxXca9PsLmFdUXhxBZUDmCd5g9nCUS1jeS0rJva
         K7CsljCgHzNA7J5drmtZhi/GLytazQHNyNk27o2pLR7WtqI6UlL8qpYGfs9nApUiKMwQ
         bF6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwEdf4oS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w50si9666748qta.271.2019.08.19.15.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwEdf4oS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzq7i-0002Pk-3p
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60099)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMy-000309-Sj
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMx-0006wO-CH
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:16 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45818)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMx-0006vp-49
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:15 -0400
Received: by mail-pf1-x444.google.com with SMTP id w26so1937710pfq.12
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EJyW8b8UYEXRGkuf/Ca0ZoUaQassWgEv4Qo6kd6MUJ0=;
 b=IwEdf4oSIQqQ9y3AryNrTXW2nqqCNCbACpI3sBakPUG88LSyiaKgUZHHVORlZuhrDT
 ZUEccoHX8GCrcRkGBNKS86TT/RoxSgyf+p4H2g5NpRKag1xRK7lMDaSE2BxzffPUxnWW
 iNoPQRUImEKWhiplcLY6rzKK+/xPtb3pHl+0YbSvqjEviDUJEb4GgsHaMKvvAoYYR3Et
 JpatroF9iCIFtmSJaaZa6Ybr6n2YbOVQyh0RQhNWo0HJCcqSn3kS+StcjRJSwTtkEOo3
 Rkds6M24G2M/6Y49pqh0ebMm1TTeqfkLtwb7g5v6wEFxpMcZbOG3cMn/y52/n+vpMt7d
 JfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EJyW8b8UYEXRGkuf/Ca0ZoUaQassWgEv4Qo6kd6MUJ0=;
 b=NtKS0SRud2NqteNNyNU4HJF/HeKnt/ocs8umu+2n4gjzKFK4jtEUmicvCqT/3Mm2SG
 tSMGCNDgfcNpMcS3l8zY+lThaIPe5XNtiwmXcAgLksl8unGUy3IZ9JbZI4Ql3+61QvL5
 iWAB4rRSFax/hO7g0lb+ZMmKI4J7SrtY95gFIBRMfGThzGBeba+5EgUmRxO+5YSidSqi
 dPZifL56CKHsQgE+J8RLdWaBNgan/wtHNmLsDYZd/HQ4UeGx51a+95FNBwXf02fveThP
 yeA9x7Q/5SUFHtgOAjEyuyN++Y6Ij6IqiYXeZLn8pmSrUGxIIlCIBQZaktv+0iy8iHfs
 fiig==
X-Gm-Message-State: APjAAAUVvbiE6OI/9YEnEdOi0moXdTJis1/MYqmCQ5JXPedDXoVi/SHr
 6g9MwRfMn3coMlCWso6fF7apLtbzcy4=
X-Received: by 2002:a63:fe17:: with SMTP id p23mr21749379pgh.103.1566250753771; 
 Mon, 19 Aug 2019 14:39:13 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:49 -0700
Message-Id: <20190819213755.26175-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v2 62/68] target/arm: Convert T16,
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
X-TUID: XJlSaJfwyAIo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 109 ++++++++++++-----------------------------
 target/arm/t16.decode  |  31 ++++++++----
 2 files changed, 54 insertions(+), 86 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 941266df14..dc670c9724 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10074,6 +10074,18 @@ static bool trans_TBH(DisasContext *s, arg_tbranch *a)
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
@@ -10295,6 +10307,25 @@ static bool trans_PLI(DisasContext *s, arg_PLD *a)
     return ENABLE_ARCH_7;
 }
 
+/*
+ * If-then
+ */
+
+static bool trans_IT(DisasContext *s, arg_IT *a)
+{
+    /*
+     * No actual code generated for this insn, just setup state.
+     *
+     * Combinations of firstcond and mask which set up an 0b1111
+     * condition are UNPREDICTABLE; we take the CONSTRAINED
+     * UNPREDICTABLE choice to treat 0b1111 the same as 0b1110,
+     * i.e. both meaning "execute always".
+     */
+    s->condexec_cond = a->cond;
+    s->condexec_mask = a->imm;
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10661,83 +10692,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
 
@@ -10793,7 +10749,6 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     }
     return;
 illegal_op:
-undef:
     unallocated_encoding(s);
 }
 
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 98d60952a1..4ecbabd364 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -210,20 +210,33 @@ REVSH           1011 1010 11 ... ...            @rdm
 
 # Hints
 
+%it_cond        5:3 !function=times_2
+
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
+  IT            1011 1111 ... imm:5             &ci cond=%it_cond
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

