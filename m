Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp884506ejq;
        Sat, 6 May 2023 00:25:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4V2bCgECywszLB9wbmTbuz4gXMZfRhMmjeRTPsBVvjbQs0JqBRpe0PPCYcFybKTWC4xhKW
X-Received: by 2002:a05:622a:510:b0:3ef:2eab:3451 with SMTP id l16-20020a05622a051000b003ef2eab3451mr15595636qtx.20.1683357932871;
        Sat, 06 May 2023 00:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357932; cv=none;
        d=google.com; s=arc-20160816;
        b=IBn0xdpisNw0mvU1dx+qQ8WcenBLxE0CKWKq0nuA+KxYo/XUzYL9o4Cpu9OORTI6Sr
         opTlVs84tfyxft9q2xQLijBkKVZyWPIK4ZP2UCNlz8dd7VzMEavfhmTPwxnbFvuuwLzd
         3J8Vl++PMoxxErHwXoJCAGRgIoQ3s2trkXEm18Eup1Ff6bsoI5fHZMFUunmOMbDg2c8c
         PBjwqPgrvYs69asGI6o2WYF8CxQm3KQPYZo/JiCLwL1l3vpajeakClHX5yCrGsVCfOFT
         2o8HLyjapz09ksF0uhB66nr8ML9JCMN5CnnpWRVkcxZMXqNFqi4KXsUMTCKI6xNe6T2S
         74IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
        b=t2MLwACZn8YHcu1MN6Q3UpxVPzzfhb37JYqR1yb6+A3xWgUNKdXpQAlyXhVGrKbyDJ
         Di1VAVjaoRexN2h5qWmifU/9XHc+QFAvw43mH2a2PvVWrTRKjiX62xbKpKMZ6GUL3PRy
         VeaA7wsn7b6KqvUZhzqlrRyKZmXt2QcVha48fyBSwyv0FkzVLf56BYtyNZ+jIaVy0G6c
         xwCaFZ6qWG6szuQlH9DJ2xZfz4WYEq+dws5Ocy7QhZvZjENRVYQ3pHOHS96VW8goXQCc
         au4VvPDXQ7SHtfOvzrXC1qcbbcCcyXZk2bpRg3J5dEY1pRBqspxciaXPFbGG0kB/Akvz
         Gieg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuPpVsg6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020ae9e70c000000b0074ae1273f52si1273743qka.228.2023.05.06.00.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RuPpVsg6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCGA-0004n6-Lf; Sat, 06 May 2023 03:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCG4-0004U6-Np
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFm-0004Rg-Nc
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so2473119f8f.1
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357769; x=1685949769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
 b=RuPpVsg69wZKOXhZJXZGvrel3vwJkeiLbWsRHRKNhkuAVbXkWi/RgCI01gLVQw/u1e
 2DjT0R/gJruizoYHzqLILaiebnpsRYb9DM1+O5oFA2z+RQOktgCKkyb2tEiVriTgdH2s
 dN8OqSmdt+bBOJ+ipT5XYmgxihdGLyVOe9ghbHmPvJEmGFc1BVDXC3NAita07AifBvIH
 Ym+aHnwVSp3eYKhyolzQIHbHGtG4Livy+E/XP/u8VCz/GrYrZVhr/b9dj9AGWvTAFisc
 BLX2kDT0OYENsd5wcJynbznpZ9q4A4wfSojUCoUhG+52N0GVQ2Sok9CPXilexURwR3fJ
 iC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357769; x=1685949769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
 b=Y5/xbM8kPk/r8ojzTC+quFvyiLIxs8tI32t8AhVZaeuAYamuAkdnU8pFz81H6qu+Km
 EgSXIm+z0HP2JKuFzwKOXdB64kcF5Cf46bhr1kWDxHX2hJKPACHvdvWzsOUUUChoF50I
 kLaJOJp2jHf9R1br6eFs/YXT+Bt2JUj7lNyfI1PTKOW1s8gjQ13tyIvO+Wk8HUu8lgco
 gANwN6C92ne8Rc+he6YbIDaj1GfdryQLrBRKB8/dJzYnPyMDco6OYYKQKBJAs0+A4Or+
 JbyJI37rn1f+l/nsZ0QJIXt38ez3eNXIjfi4AYpFthhzVTEj5FQqoVkMhv2Pci6UQItT
 NFDg==
X-Gm-Message-State: AC+VfDwUf82+rBpWs7vZE+SceUiOLiWquRxlz+2vL7BLLyEUIQ9y75YJ
 +HbC088b0AuYbBx3QBUmptcPAg==
X-Received: by 2002:a05:6000:12c9:b0:2d0:bba8:3901 with SMTP id
 l9-20020a05600012c900b002d0bba83901mr2702707wrx.62.1683357769412; 
 Sat, 06 May 2023 00:22:49 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 17/30] tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Sat,  6 May 2023 08:22:22 +0100
Message-Id: <20230506072235.597467-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: xDCOCbL2ThRC

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 88 ++++++++++++----------------------------
 1 file changed, 26 insertions(+), 62 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 7239335bdf..042136fee7 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2003,44 +2003,38 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
+{
+    if (arg < 0) {
+        arg = TCG_REG_TMP1;
+    }
+    tcg_out32(s, MFSPR | RT(arg) | LR);
+    return arg;
+}
+
+/*
+ * For the purposes of ppc32 sorting 4 input registers into 4 argument
+ * registers, there is an outside chance we would require 3 temps.
+ * Because of constraints, no inputs are in r3, and env will not be
+ * placed into r3 until after the sorting is done, and is thus free.
+ */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen,
+    .ntmp = 3,
+    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
-
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_REG_R4);
-        tcg_out_mov(s, TCG_TYPE_I32, hi, TCG_REG_R3);
-    } else {
-        tcg_out_movext(s, lb->type, lo,
-                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_R3);
-    }
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tcg_out_b(s, 0, lb->raddr);
     return true;
@@ -2048,43 +2042,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                       arg++, lb->type, s_bits, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
-
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tcg_out_b(s, 0, lb->raddr);
-- 
2.34.1

