Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600912ejm;
        Sun, 23 Apr 2023 22:54:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350b0tKvWX3uvB/uO07HPHhLKbF0omb6bCDWbaSFHhXc06VkF1fHHZj41sY+5eFUKNlSfklcu
X-Received: by 2002:a05:6214:628:b0:5f7:a9e1:bbbf with SMTP id a8-20020a056214062800b005f7a9e1bbbfmr19556938qvx.44.1682315648281;
        Sun, 23 Apr 2023 22:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315648; cv=none;
        d=google.com; s=arc-20160816;
        b=IYEbLugjQOqeVVD39BF+hihOmUxGncDBqdU3/CYUgr+4BQCZdBKgOOwwQtHnmJBof+
         B1TokP3C2BOdvTFO1KPqYLGAxeZK07gbjVFl2S1viIKCqWh3TyDCfsbooOr37uT8ZlvQ
         ndQKHHivSiSrkxQFIu7rn1CPqdramKschSJwOJNDZYX+f6OXHBOWPu09vDvXMW4FPNtX
         pv4hWEc7K+aJtAD3lZRiW/MINjGmqgPNqPJPMvqryAUd9hu2nSqDGd8oIkxf63MiVbbv
         AWQh4G6txod3YMyt9H1sAkb5RLRUkHYAH79AnJMIb/YhIc0WJzZwGAOhArGDbVuJ3b7c
         f5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
        b=CpuVu5qnkUdC8O/SvRsuW1FejlbqowFOQ5Avodv3GYWXkjm9sZw+c1PETQQAngCh4d
         HNK1h4GKqMWapI0eXZrN27J5W0KKGkjBcRSTTKWS6VukmzUGoAViD7x9RmzPc3x+8JVa
         VjsasRId/LqRl6kkBVRlkaNNeKZ2zoGvLEKENQiS8B7ObT/vesB03gHBGUqLAGyDPexo
         EPj7h7eoMUfYeR7NfmEAWGD0Bk5Bv0AiB0QHXuEQzziEyhtFloR5AfXctLfUwL9hKzKo
         9Erk+Asv/IjS6h/JJSoXmThF8KNKDh76RgI2yCxJ6b4p7rmPMW2fTFIks5Hh3KysBgm0
         xddg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7AxKqfd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020ad45769000000b005ef676dbf8dsi6755221qvx.96.2023.04.23.22.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7AxKqfd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp4l-0006OS-4U; Mon, 24 Apr 2023 01:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0k-0006O2-Fx
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:19 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0I-0005I7-2s
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so2314434f8f.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315073; x=1684907073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
 b=x7AxKqfdO4iYTa6OP2nvmJc8fqhEDPS3fcWahYVhsOAAvp0UdYZ6cYYBep8LhZtnq4
 0uDOdUqFjiGtVO/llLfvc2NAjWt7HLG1cOJvOEAnUFFDNEcBGJv95gXZjKtvQtgi+d9n
 dB2tR6iT1+2xIW1p9EJt3FGGPZtNf9RldGoaIEhdrbSBHXymk/YOg1sHg9iEd2SQClar
 DZQXafjW5hM2uyBhzTOAMcFBEGkSyojcaYtgAMOxxZS/9hLeEm/5mwwW93bYhISdUl0C
 RrGWa/osl76q/CMkHxhZh6p05UJdsGUZIUbpNkoJosGNLR49wXYGTjp45G7MzogrP4LR
 QO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315073; x=1684907073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
 b=PiNjN4gJuqKpYXjyz1QbLTYapPYcRrKewvMGXA8eEf3pQ9MeVJSvlquq+3lL6m9GF1
 fMKQadM+22qWXZBeWsD+21U4yi45HBormocj4jIrpJ1VwF/UEM7ZZdN3hHXSOZ0arfJp
 FeVxCbcWUzd9muGTV93teWu9mzGNPZAiCDi0+XnxhTGJ7HRZ43kdIWZx+ZCUIrpP+bgy
 HlNIlLHyN2hUiGC43wUBTDBfzjUmRL0zjz/a3Zrmj7ypipV7mOq4rydvBLxJIObHbjQN
 7scuoKcW06twzebzlhrzKst0SFfd1USTrXE6JnEZxpXbEbJJdkn2WguZZ6GYXZSiMAu1
 zmIw==
X-Gm-Message-State: AAQBX9ff1vF0B8+TYWLvCgFh+Ws5PKC7Qc+VS3Z4y5qQzdTirH3aZvZ1
 A3pWlb1cMcaEjfg0z8PSfe807g==
X-Received: by 2002:adf:f8ca:0:b0:302:df29:cf15 with SMTP id
 f10-20020adff8ca000000b00302df29cf15mr7035302wrq.46.1682315072805; 
 Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 45/57] tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 24 Apr 2023 06:40:53 +0100
Message-Id: <20230424054105.1579315-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: 0mJEOwjrblo1

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

