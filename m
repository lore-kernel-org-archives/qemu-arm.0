Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2601608ejm;
        Sun, 23 Apr 2023 22:56:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350aJwprGcWV/d7I39ODp/AKsvQ3JVX2YqwsVMV7UmqYoRHtVKYrQA1oxn74Gj4DGSCwV8jZo
X-Received: by 2002:a05:622a:101:b0:3e4:e2ce:526f with SMTP id u1-20020a05622a010100b003e4e2ce526fmr21170454qtw.39.1682315769243;
        Sun, 23 Apr 2023 22:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315769; cv=none;
        d=google.com; s=arc-20160816;
        b=ix1XoKgIkqgjCUYAokzoepdNPZQrHeUF+sUr1rL6Ci1ET5pvVnWtNFyqcVmmAzx5Tm
         1Dl5GqQyemOHlUdnNpeFqOj07+pBW87Bnz4mTjjVQL77KdxfZwacBZVDpSLwf+tI1qHd
         ryZSsZwl+5xg8W33UADbicPYXc+hzqYI5kw1WW49zirPJZAG1vdCuUPRL+z0z9nbcwPo
         zV9/mQwwzrjW5DAw/LQZwuwy/MV94PKG0Xidw6Rda9Qgn9wEPJ2X6WFEjsFr8xl58sx2
         yhDy71ecXiYm5afbnAnsaMNRiWBIPMCL+VmY/d2BJ1HTtBQW30HBeH1qOqBCIrPmPoOG
         hvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JmuglVw1T6vmkIujcut/4t9lRSs3+xsqbhm0pfkrC4g=;
        b=z+CGKM6atDtfMkuDjYxaUkfCVLgyAEuF0csQF+7o0d9bbO4p612sdmLZ/Z0wV2SsU4
         kn//7Hxf/tSiFHmzqUpPhvOUNa63o089m0uj4ZyY9qAbzJ4HXC3BxsC7lRZoV5UmSKxX
         wUuApnUlz5XW/1a0l3R7XQhZMUKfA/nh5xKGSfFbxFwYXz/knLDanhGj1yITlfsPp9y1
         9yyqPa4HIlIPAVr3PY6ersvfHDA8Epr8ZiHeJJzNS2B+KQkJYMMLsr4Ar9wvTXXCdl29
         iSdy3qF4YLCFB6DABv4hllmlHRhxhjHHbehATT76NZKnIxQaVlp4fLhqoEGxrhYUJmv2
         xmsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UTGeOm/U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020ac87d95000000b003ef65189c80si3313560qtd.39.2023.04.23.22.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UTGeOm/U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp1A-0006bO-Pu; Mon, 24 Apr 2023 01:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoy0-00068i-5L
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox8-0004Ed-Rz
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso2400346f8f.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314889; x=1684906889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JmuglVw1T6vmkIujcut/4t9lRSs3+xsqbhm0pfkrC4g=;
 b=UTGeOm/UOzcskyC3HRvxpplPe4n8zjDYW1TtKT9yxEq/yK1oyz+MYfWpkvA2dwRejC
 xewaDifiPbDEaRUEHGk2fzNdu/zVVaKzJzMRMml08mEwqPs2QUztW9hhoM+hCu0jKiXM
 1rpcvXw+yTH0PmJzGJGAixZa4SIP0fsH2Z7WBQhrmisDAQ1YaEGpt1/4pY+sb0GbigZQ
 AYoCv7yHmY3xbtDJabdzTNYF/NqrSts9pIdEIkcxl79d3NbX3Hn2Vx87emuU1KMERv4P
 TEePJz6V6JcVjWKm7h9mdgPgYJs8pCQVlRkcW1of0HJFGbOHbvHnN6M8l2YiUZPS/AIq
 JvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314889; x=1684906889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JmuglVw1T6vmkIujcut/4t9lRSs3+xsqbhm0pfkrC4g=;
 b=N/0lhUXb1/V1wII+mMg/+w68c/rK66y+0Kl2r17mqiTYz5pIh9kgeEWgM5f6z90Q2L
 sIM7UmQeqmIwdywXRZQxR8EDgl45JzU4Q77bvx2WZJqS4giQpGysty6QjwPhtOi9sKzR
 a+TY0QnMBYIaupxaVS3mM4SMdJxdq1Jbu0srgSgyHShWvHTsUjw+rlBxjSMlgY44wVQ6
 0NeFi8Saqkd6CRSISBeSGybzsr7WMJPZlAjJRcgZAUNuB4KfPJwFD/QpUVWQysO7V3nm
 4E4b7EMdLqXpg9tVaJexuXVf6GGug3iGswNMoqERzSpVuC9SSDAyhjM1SFJcOTUtNpel
 zjjg==
X-Gm-Message-State: AAQBX9df1wbMXHFEsaZQLe+aBDwYOMTeGYVx7d+0sGxtXahIHIxWRqO2
 6ya6tAIQj19NWRkZ+jXYA9dqDK3LLUvWPspjP9xdRg==
X-Received: by 2002:a5d:6683:0:b0:2fd:e026:5738 with SMTP id
 l3-20020a5d6683000000b002fde0265738mr8943789wru.23.1682314889072; 
 Sun, 23 Apr 2023 22:41:29 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 39/57] tcg/i386: Convert tcg_out_qemu_ld_slow_path
Date: Mon, 24 Apr 2023 06:40:47 +0100
Message-Id: <20230424054105.1579315-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: efKYxXf8jrJG

Use tcg_out_ld_helper_args and tcg_out_ld_helper_ret.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 71 +++++++++++++++------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index fabb03cd74..4f3a7c7a6d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1804,13 +1804,37 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
+/*
+ * Because i686 has no register parameters and because x86_64 has xchg
+ * to handle addr/data register overlap, we have placed all input arguments
+ * before we need might need a scratch reg.
+ *
+ * Even then, a scratch is only needed for l->raddr.  Rather than expose
+ * a general-purpose scratch when we don't actually know it's available,
+ * use the ra_gen hook to load into RAX if needed.
+ */
+#if TCG_TARGET_REG_BITS == 64
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
+{
+    if (arg < 0) {
+        arg = TCG_REG_RAX;
+    }
+    tcg_out_movi(s, TCG_TYPE_PTR, arg, (uintptr_t)l->raddr);
+    return arg;
+}
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen
+};
+#else
+static const TCGLdstHelperParam ldst_helper_param = { };
+#endif
+
 /*
  * Generate code for the slow path for a load at the end of block
  */
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
 
     /* resolve label address */
@@ -1819,49 +1843,10 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
-
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_sti(s, TCG_TYPE_PTR, (uintptr_t)l->raddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], oi);
-        tcg_out_movi(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[3],
-                     (uintptr_t)l->raddr);
-    }
-
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
     tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_ld_helper_ret(s, l, false, &ldst_helper_param);
 
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        TCGMovExtend ext[2] = {
-            { .dst = l->datalo_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_EAX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = l->datahi_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_EDX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], -1);
-    } else {
-        tcg_out_movext(s, l->type, l->datalo_reg,
-                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
-    }
-
-    /* Jump to the code corresponding to next IR of qemu_st */
     tcg_out_jmp(s, l->raddr);
     return true;
 }
-- 
2.34.1

