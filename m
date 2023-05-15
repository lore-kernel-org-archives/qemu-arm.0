Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6574814ejq;
        Mon, 15 May 2023 08:03:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5LmfewUchiQ+BDDz9ufHKdHMUrpNnzBYJ+qIiokm55RzOt4i7Qm62l2gi8iFiDe9rP3DEA
X-Received: by 2002:a5d:6885:0:b0:306:373e:7b14 with SMTP id h5-20020a5d6885000000b00306373e7b14mr26487361wru.63.1684163034601;
        Mon, 15 May 2023 08:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163034; cv=none;
        d=google.com; s=arc-20160816;
        b=EZOFKCiD6JZhWy6G+lanbde/2g7phzpw/x685fd60cujeoOod6eDSgz1+W99d9cnNu
         0uS3j4BaE4v7GUtFxmpkczn5rTbd4zOhYW+AiJyjoBGFehSqKLhXF0W/NsaM8bkGVkSn
         rg7BqKiOQphifIu1bsqgk8qxJq4K0BoZB3xYvjIT0rxN7TYp493CYpwNlsE2zUZlhc8H
         MKdP3QP3/70TZt8DncCiQkYpW+9YUUL749g0awLdXxNcjPdol4f10MPj+q5Fg070BaMo
         98pqz71bUElZPnuMg6TL1AjmXa8bCLsXL/JJQAXTTQYUJADBldLfwbXC2bgJpq1mG797
         wQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RcueoQ7mogTzwxRR1biig20yNfysNgxqkYSawavzYAo=;
        b=jj0UzSjzOt8odDyRyml46vBtMr7Zdo9X+BDHPxrbCPcBTNB8mIKez9BdkotyJDf7Pv
         NQVmOT9KjtUQEJjvBKPPDHcHpuitM0rByZ6JUMHNKsrq8LAL2ZO278kUIMs1mRaTbmHW
         V9Mbq9lH06sTtjh/pQbYtK3JCpeJ2NjYXQ9T4fIcVIWv2TsLCITKYu6748rmCwoEcRQs
         mBPUeQ9RXTh+N6lFjVwj/hiaiGqNT9CsrEICKaPPEOClEz/1y+vGnZnUwhObO/TrW1B8
         SxjYhm50WP1YUbiUMnJuwwN/hhelijEKN+7Kcw3WY9r6Dw9haTuH2Iq7+9FkAxKWYV2o
         HYOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZZ9BTpD6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a5d49cc000000b0030633951e93si13501wrs.508.2023.05.15.08.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZZ9BTpD6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZJS-0003KL-KS; Mon, 15 May 2023 10:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHh-00079p-54
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHa-0004sJ-3L
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:43 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ab05018381so118665145ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161223; x=1686753223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RcueoQ7mogTzwxRR1biig20yNfysNgxqkYSawavzYAo=;
 b=ZZ9BTpD69lKmUJLOZGgT+fUwwlkRO7Q8KlzqvE7E66V5RcJsnMgpex4J0b+xF37yex
 N1OmRfIPGD5PxmtgNAX718e/cUG4a8DOm5jWetYRPuO6PutWEPLAgiGTitSAN6J5ICxE
 HwCU6kb3yJ3CuNWr9qc/RK/qebrPOZKzUjWl752dapPMHoiE3Bv5NbJN8HBNF6unepbZ
 2kvOOg30yKhONpODMPKGapqe8dMJSY22UgsuVRMhGt/RVq6qwfIpS+fuQbm0YUMReQ5y
 o0OYJ04jD8M6tPK7r47iRhR7YHzI44C89Zw8APREQ9GP/gM97qdPGQOQv9bw/PEiWHwZ
 5nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161223; x=1686753223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcueoQ7mogTzwxRR1biig20yNfysNgxqkYSawavzYAo=;
 b=Hy7gGjPI+CFC4tXXI5bfI2WQPlYmvS5YLQXfu/giIkIq1xqOPVvi11Or2p2Iuf0YYE
 RNzxfCvpJkQsvQIu1kfu81svZeHzrt+vPidGxKM10RJanFtT/I1ysKDfK6HxQO3mTDUk
 Oel2w9KcV5A1SJkJAug3r/CynnCw10y2OC1n1Oy3MvhlaLO8hphTlnrjFF3XH13WZWE0
 iHe9vVAQxnUYx208Ku52jRVTnSTAE/AnCpbannDTKiabJp0A/LOumxlycLntGg5hot6/
 zWtkcSJmsGaiT8W5rathaaOjhH//uZGsbOtDujEK2wrmhzMosG3/hX1Do1sZcKeuHNx6
 /xJw==
X-Gm-Message-State: AC+VfDziBVrZpPSImEcPSYT0fMl2IWPraDLVUSHzQMW5HcjkuQK/j20K
 asUQdAwreXdg+iFmkCMg2Isq2N9YoP85SUco7sg=
X-Received: by 2002:a17:903:244d:b0:1a5:2540:729 with SMTP id
 l13-20020a170903244d00b001a525400729mr44025420pls.56.1684161223150; 
 Mon, 15 May 2023 07:33:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v5 33/54] tcg/riscv: Support softmmu unaligned accesses
Date: Mon, 15 May 2023 07:32:52 -0700
Message-Id: <20230515143313.734053-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 04jAKEvSpQY4

The system is required to emulate unaligned accesses, even if the
hardware does not support it.  The resulting trap may or may not
be more efficient than the qemu slow path.  There are linux kernel
patches in flight to allow userspace to query hardware support;
we can re-evaluate whether to enable this by default after that.

In the meantime, softmmu now matches useronly, where we already
assumed that unaligned accesses are supported.

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 48 ++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 19cd4507fb..415e6c6e15 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -910,12 +910,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
+    unsigned s_mask = (1u << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
     int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
     int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
-    tcg_target_long compare_mask;
+    int compare_mask;
+    TCGReg addr_adj;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -924,14 +925,33 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
     QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
 
     tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr_reg,
                     TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
     tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
 
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
+    addr_adj = addr_reg;
+    if (a_bits < s_bits) {
+        addr_adj = TCG_REG_TMP0;
+        tcg_out_opc_imm(s, TARGET_LONG_BITS == 32 ? OPC_ADDIW : OPC_ADDI,
+                        addr_adj, addr_reg, s_mask - a_mask);
+    }
+    compare_mask = TARGET_PAGE_MASK | a_mask;
+    if (compare_mask == sextreg(compare_mask, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_adj, compare_mask);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_adj);
+    }
+
     /* Load the tlb comparator and the addend.  */
     tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
                is_ld ? offsetof(CPUTLBEntry, addr_read)
@@ -939,29 +959,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
                offsetof(CPUTLBEntry, addend));
 
-    /* We don't support unaligned accesses. */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | a_mask;
-    if (compare_mask == sextreg(compare_mask, 0, 12)) {
-        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, compare_mask);
-    } else {
-        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
-    }
-
     /* Compare masked address with the TLB entry. */
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
 
     /* TLB Hit - translate address using addend.  */
+    addr_adj = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addr_reg);
-        addr_reg = TCG_REG_TMP0;
+        addr_adj = TCG_REG_TMP0;
+        tcg_out_ext32u(s, addr_adj, addr_reg);
     }
-    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_reg);
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_adj);
     *pbase = TCG_REG_TMP0;
 #else
     if (a_mask) {
-- 
2.34.1

