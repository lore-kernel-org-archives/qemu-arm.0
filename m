Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600364ejm;
        Sun, 23 Apr 2023 22:53:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z7rdwBBw7RLpZENI4Hus46JCNGsR3KzR/SPQMw8HsYcBGuZiunCMlvulakdxbHIBlHnncn
X-Received: by 2002:a05:6214:411:b0:5e9:2d8c:9a00 with SMTP id z17-20020a056214041100b005e92d8c9a00mr20183446qvx.36.1682315585434;
        Sun, 23 Apr 2023 22:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315585; cv=none;
        d=google.com; s=arc-20160816;
        b=BrmdtHyBy51YLLqiAOiaz7vj5HQ4yRWEvPhCoJMrGijkRAOfPDKOUHEZc/PtZY5Rm8
         0F4AEQ5R0JiBLzbQUQB2cKx5LVkCOMbzJZ+YRtn6gxMXLXMQ9jenfmNWCicK109bNu2H
         u3wQdglnDoz/h7KSvAL5Pw92wJ51levuk1TKApYooW1SHIaM4Ra/0l+5UIWzKvL/bVm3
         fIG82SZ+OqhISBz9uMdoolhtIHKVcbtf+NNM4bhYngMxSJ2Cu9D5Pzm30FeoknV8XE9e
         nsjWe0QhAyh6PQSbQ8h7bPLl8anMAATZiOmTcPi5YUQvmiqAQ9545JS7iMcn11OmHCN1
         ZnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8x8nNgwxVzWwlXkH7TC04g8D23cjiNxwy3VmZPjq5To=;
        b=XGH/yC09lZoDIpgcpGvNJXxQqeTTSyHlSYHifc/440ArXdMqjHGiWAPpbwSLB1W74Y
         VMjUzuldm6tizM5FMngMJLb6Uv25XLoI3MZeeC18mlWt0Hiz4AsvXUvulQulFMnUpjUk
         OoW/PWZNYfhgr1nC/+RJcHXWKS3VqC6/Z/yOWO46OyweAsWpIctPTwMCrXYqBI+XN8fd
         bjmaSvqOlyLXMBel+N6iHgIgDxC4UpSpNQ+AA8dbqVL32N35Hfmlq5AA/4mMedCn6lUI
         beG8mB4eWsTiYj3I/yJTz7Z+gvoDKvfsDbkcjeLDGu6ZTQqpNbsovEZq0i2JUeE/c1Qa
         EfMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cB+RHpr/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw11-20020a0562140f0b00b005f60101ef60si7039643qvb.29.2023.04.23.22.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cB+RHpr/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqoya-0006gF-Dm; Mon, 24 Apr 2023 01:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxI-0005TN-5p
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowv-0004II-3i
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so3824940f8f.0
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314873; x=1684906873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8x8nNgwxVzWwlXkH7TC04g8D23cjiNxwy3VmZPjq5To=;
 b=cB+RHpr/LDyxIxMlu0TXtnZkfa5eXUHILYMzOPwSYUdcr8pRs/iOvdTrW8F+AiYtX5
 ZRraEFd9voWPzLtRjoR0uDv+sNzg6VIRZDv2DVAAHmx96yuy63+PVAuFRomu+mCfIC1+
 QDowVhC/cEYGg/e73ZyUe6c6UO22W5F2INWe7rNrL42a8jkVAtgF5vK26NUvEucbgHiN
 wV4TVDUQ5DhpX/L8rPPZdiMAKiB9lExSd0J5w8YfRQXt0Xzuk/u/sy22NpO9QVzQYxHL
 17UQ41j8ezSVMIrRkN4cc9P0qHd+VwY17DJyPs4Lux6j9ePcJEsx8wdZ+U8H0BMHwCQS
 3rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314873; x=1684906873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8x8nNgwxVzWwlXkH7TC04g8D23cjiNxwy3VmZPjq5To=;
 b=FTur31cmsphRe9R4YvDFrSIYRaXefg9jNlpMqSDxK5dNw+//mHzxo46lZWxIEtvfwp
 eY45c5drvHJ430u/f70du1EE9atgG0MMGsmlDKMLlPUygEONsQraSh/+5XnWnhsbfEvf
 Z6TF9ZJaatwBsUPMy5ZL7eFWYodTf4OMYSaNi/0rNxdHyRWKEzzrnwXdpgmk3H1dgPAN
 vnELb3YORrE0bs8nvLmlUyeydXe4Hqs3Bu/yZNJiKjiciof0gbV/Qyl1HVJTH/TfvQOy
 4xmU8Z/JtVsftp+WtzX/W4NhefItWi8NvDE3v3j9WVbPGEOeelNA8KlvY78R8uVaITZr
 yl8w==
X-Gm-Message-State: AAQBX9cvowRbxpXGKog61nw/Lc/guX/5QO8CR9pj5iM88S5/XZlLaw/y
 B6VExxyqbZdJRb3WtvcC3IJSQA==
X-Received: by 2002:adf:f68b:0:b0:2ce:a34b:2b0b with SMTP id
 v11-20020adff68b000000b002cea34b2b0bmr8473202wrp.28.1682314873260; 
 Sun, 23 Apr 2023 22:41:13 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/57] tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,
 st}
Date: Mon, 24 Apr 2023 06:40:20 +0100
Message-Id: <20230424054105.1579315-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: 962QqIT8e+HI

Rename the 'ext' parameter 'data_type' to make the use clearer;
pass it to tcg_out_qemu_st as well to even out the interfaces.
Rename the 'otype' local 'addr_type' to make the use clearer.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4ec3cf3172..ecbf6564fc 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1851,22 +1851,21 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 }
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi, TCGType ext)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
 
 #ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
 
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
-    tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
+    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 1);
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
+                           TCG_REG_X1, addr_type, addr_reg);
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
@@ -1874,33 +1873,32 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
+                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
     } else {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
-    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
 
 #ifdef CONFIG_SOFTMMU
-    unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
 
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
+    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 0);
     tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+                           TCG_REG_X1, addr_type, addr_reg);
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
     if (a_bits) {
@@ -1908,7 +1906,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
     if (USE_GUEST_BASE) {
         tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, otype, addr_reg);
+                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
     } else {
         tcg_out_qemu_st_direct(s, memop, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
@@ -2249,7 +2247,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, REG0(0), a1, a2);
+        tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.34.1

