Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp184406ejc;
        Mon, 10 Apr 2023 18:09:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350b1tV42tzkbLvaRLQ0tlU2NMisLYT3EJ7Mrlqk1aNtkkQ8nQ6x7vchpebVPXyHvVk8WO4zW
X-Received: by 2002:a05:6214:23cd:b0:5e0:5ea6:69d1 with SMTP id hr13-20020a05621423cd00b005e05ea669d1mr2015919qvb.0.1681175384340;
        Mon, 10 Apr 2023 18:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175384; cv=none;
        d=google.com; s=arc-20160816;
        b=n31agvvjaldrEPDkR3P8jPRK02higU4+/kGKy413+Qn4P5lHdZ7zJ7kWArGIM7S0KS
         qztyMdXcx/X2dSAG0v1XufVzZ+pKsRtECQtUnUWVAUCnQnWE1q+vZOlskN6uWWo+u9c5
         hwTZbEZ8aCXOKI60/j4IvK2W/4ednDNscQhA5i8zAbpQznlOtHMv0kawfP0Gbi99dvpn
         o2J7zNct9VngVmm/e5/zU8iWZXgDhhEPC7gIgY41dxyX/kdHORl6UKr9ifjhlJGRY3V8
         BjUKAPI/qUTHwTnb05OcwQ6y8fUVJEvRIKx98+yw77FiKTyT0RlsGsFNbT/RCAeo/qgB
         8Hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a4BNCRZN5AKwamsHlqYnaohwz80p9xuy09nGxbOHXPU=;
        b=CbuMXSos7E8qFiD0o9ffHc/4fJLnf3oVDlXLtUlNFp/GZhDg3ppJv9uhNn+6zTUaWz
         35sHUEuCs5UXlHJPETB7n4pFGqwyEcR/d+52RLTW7vTnXluz2bcyFqzkKN9KiKptol1f
         XG1ulCHsvBrjMT2QTKhAXxielma19ZHQSB+/8Q1yiTnsMaA0KYjI4PJbxZNaNNawut6K
         NHT686z7FKPodc5Ou6grdr+CrBtOxWLWu6N6pXsSrfH3yVbvpmlLhrVW5/hn2hpR0yMY
         yXNUwB4TXAByvayQxLOQJukvFwibwsJ5pf/UpAmH4ad1YRqRMB9wNPUs8aTfYqqQxDxa
         CmRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jldmccfh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020ad4576b000000b005e760bdfa0fsi7672892qvx.283.2023.04.10.18.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jldmccfh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2TS-0008JM-B7; Mon, 10 Apr 2023 21:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TM-0007dz-9Y
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:07:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TJ-00014x-CR
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id la3so6098518plb.11
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4BNCRZN5AKwamsHlqYnaohwz80p9xuy09nGxbOHXPU=;
 b=Jldmccfhe7iH5wCxkS71ExbcEwtkjksV7D20k0rteFWupmBRas8tctJt2/mosHV0Au
 81M/o8yT3xLUgNbetkl+FJF55Ole/H2jqGl5y5YZ2ly4Xi7Ov/IvXk/lWrMjCEmAHtZS
 gpJ4p3IYwugg+zHIolSr3tv0Q3K2JrZXsgIl4VkW7+0woEeIieyixmHVtRv4S0Ph5wJJ
 KAu3shZmm6zgFSdegHhDvfADcyh2DP9Mgf1ZYz4SIga6ctO2oXaom11j2ZN9a56eGKn3
 +Zfb3H6/odwv4ywwTjA4RqusHA2TGYyv/Ow7gsHbfCIYwRwD6934QvR8qz8oiTh9p0Uu
 nWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4BNCRZN5AKwamsHlqYnaohwz80p9xuy09nGxbOHXPU=;
 b=hjAVhJHy053nR29z/MU96QJKFZr5zKX/WvuAdKyVJChvoGR8lJPZP7mWt2tYEyFp88
 wrzDINU6/lR0ipo9eBUSAzK7bXQ5alE+CEDxdr/GrTKHcvsZKtMa7aMQHV2wUNQrpk38
 mlyh+CqSEpqmHL4OMP7GBw9BfoA+6pLsis1XwX57i+yT1xq9bO3/BHtJtbfdTqUTkIRu
 6NdBn8NHPJSe8ue9Tj9sXCkfIjiHaXDGp+/4TOFw48bwmh5Lntu6iNDY+DLsLWFB0lXG
 XNnF/LpVzBG3k2XXzbO8Qnz984GcxNxNz4E7+XPSXFimfzqj9xo46NufAD9/1iyItOp3
 BvrA==
X-Gm-Message-State: AAQBX9fU833IrcKAn8B0yjf+68E55AM+zI9SZXjXex6gJfDL+nWM+fPU
 tN6FtBusLwsBzcnUYhHeFDoqLQ==
X-Received: by 2002:a17:903:1206:b0:1a6:3737:750d with SMTP id
 l6-20020a170903120600b001a63737750dmr968203plh.17.1681175215740; 
 Mon, 10 Apr 2023 18:06:55 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 38/54] tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:04:56 -0700
Message-Id: <20230411010512.5375-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: skiIJhbISeMv

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 40 +++++++++++++++---------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 251464ae6f..ed0968133c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1580,13 +1580,6 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
     }
 }
 
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
@@ -1621,42 +1614,34 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_REG_TMP }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-    tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
-    tcg_out_adr(s, TCG_REG_X3, lb->raddr);
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
-
-    tcg_out_movext(s, lb->type, lb->datalo_reg,
-                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_X0);
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc19(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-    tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
-    tcg_out_mov(s, size == MO_64, TCG_REG_X2, lb->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X3, oi);
-    tcg_out_adr(s, TCG_REG_X4, lb->raddr);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE]);
     tcg_out_goto(s, lb->raddr);
     return true;
@@ -1768,6 +1753,13 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
     label->raddr = tcg_splitwx_to_rx(s->code_ptr);
 }
 
+static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
+{
+    ptrdiff_t offset = tcg_pcrel_diff(s, target);
+    tcg_debug_assert(offset == sextract64(offset, 0, 21));
+    tcg_out_insn(s, 3406, ADR, rd, offset);
+}
+
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-- 
2.34.1

