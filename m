Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3721115ejm;
        Tue, 25 Apr 2023 12:43:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YqVpCS9sNnOanksyFCjd0d2QULQzHevrtIp4IY+Wsnk2P3ye9XzVM2k18Tk0AQTjPNQ54q
X-Received: by 2002:a05:622a:606:b0:3ef:2db1:6e67 with SMTP id z6-20020a05622a060600b003ef2db16e67mr28080159qta.17.1682451830464;
        Tue, 25 Apr 2023 12:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451830; cv=none;
        d=google.com; s=arc-20160816;
        b=mPgSzGEj1u4XhBL1Ijd0r5LRZf8D7N+bybAsfxfJtrBHe7bBf3xaQ+gPglsMquzK06
         BY1ZchTa/jeo/3/EGerQrpLz/ctr0q01B7h6qbGqR7QkQEpx9G9WslO6GwsYiohLM3Ka
         dn3zXwEZXqyjzzTKKDD/NB7jgGIilDvUUB6YsF9WTQqXxSvO3zScs+Xw5MGqbjnPoQkT
         7/YtyLcZYlxqkOhoxUaJehGWu5tOfNSRgbEI2DEmOUNc6Eo1D9dH9d8sWEQHFGU+oQPA
         fwBi1kjQTFvRoy5T785QMkNFKFujmSKIvc6CUTJzfcXJ8nianTc6NSrooSDJou7Ze8hQ
         HG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wJE2oDaT5cp3o+g8E/nTmfAiwp2gC4b5DU7t513n6oA=;
        b=QT9QPamSei5WQmxovMf/KXBAr17D6Z71OZPksPI8gSDCLp3o44NFGsdWHUL1UCGDn2
         WrtqLeTDpTGoAdOrUpT58SLCSb8mqZ40xwlBJI0gP6o02N2cjJyJY6hos4LP0nGoJAZJ
         02m/jI8OUBERzHG8UrTOxJNRTrt+foO0QL1cemftu4+xuEooHtlkHy9wfHFz2KOrzsee
         X0Wm/jLVBCx85MWjCLxQMVVp+5LbzjgZokXk6ykwxBt3K5aP5bGGAZlbcd1JHXztocgB
         fgvV4DJ21rvoQOvtv26tpZBI5TnuBzsrKTObTGUSBqgOsMZN8mkhYIGstnZ29+yIBqOu
         LOkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nEtG+TTl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm17-20020a05620a199100b00745f6c539fbsi9105920qkb.705.2023.04.25.12.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nEtG+TTl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOS5-00061W-LI; Tue, 25 Apr 2023 15:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORt-0005jb-Ls
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:35:39 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORd-0005TN-U5
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:35:37 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4efea4569f5so4051331e87.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451319; x=1685043319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJE2oDaT5cp3o+g8E/nTmfAiwp2gC4b5DU7t513n6oA=;
 b=nEtG+TTlTB48f/Ku4NCQYtKMl9hMJW2oN9HGP3yQkmBO/Yw3BirZ1KqZW91X1wYYqT
 cCMjDlrydoFC1PUd1XHiNU8cntKzXBs1OF6LFj2ykTiuATZuWfjDHoj/ZRSzC9VKK/fk
 jBTxHiHf413uRCarHIM7yD6d3R4jQtsz0Pm0ut7OkPYTykpIWbAT0v/qwy2TMO7jbgFL
 qW4SzWMHOmKGWKKRucY0LJXyFFUY/bDRQVqhsNk9WPFsipDXcehtRz8ty75R7h7EVt3t
 t2p7a5MgIxyW0G31CVTn8wPT5+QDuUZKsrm9BpC/axHs00DOtgiMZPAha3bxKM06K/In
 jA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451319; x=1685043319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJE2oDaT5cp3o+g8E/nTmfAiwp2gC4b5DU7t513n6oA=;
 b=k02B6cL7Whw4oYjFQ0GBzbTrMNgtUboO0bShg9+T6fjgRufpgNOPxz4Xz1+w3pE4d0
 rU92G3EtdaCqdwfw/n9RedJkIKHxuxO989Ti6W1aDuqlMmmHtDVkyY1CCgzGtvXhFc3+
 BjyTYIlgm+ZT78wx5g1f2dTnnvXQs9Mt7Q8bjzd2gu9nFt1g8OvXDRcq9I5WMzdtrpgf
 2XCbOKeReLw0pO9KHlXAMgolwUgC9SApzU/hHI5oeuOK2qbDzpgPpRBiStzIm/F/sRsL
 i//bVEYb21GY0zg98XgTGeLq2qKCw83OYDQGpG2GBK1KdY1OWwGtAEH0SqHaccL27ybd
 6wfA==
X-Gm-Message-State: AAQBX9fLynktG0IVpP0jwAoz6J5Rmr6XEwzAd/UtpRzaEq0KE8EGimpb
 IVQUGLGxlb/QthkGSybda7skJKXdSN49moG7fAlIdQ==
X-Received: by 2002:a19:c510:0:b0:4eb:20e:6aec with SMTP id
 w16-20020a19c510000000b004eb020e6aecmr4878062lfe.40.1682451318844; 
 Tue, 25 Apr 2023 12:35:18 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 38/57] tcg/riscv: Support softmmu unaligned accesses
Date: Tue, 25 Apr 2023 20:31:27 +0100
Message-Id: <20230425193146.2106111-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: Jm+EFj72YrsY

The system is required to emulate unaligned accesses, even if the
hardware does not support it.  The resulting trap may or may not
be more efficient than the qemu slow path.  There are linux kernel
patches in flight to allow userspace to query hardware support;
we can re-evaluate whether to enable this by default after that.

In the meantime, softmmu now matches useronly, where we already
assumed that unaligned accesses are supported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 48 ++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 8522561a28..3e4c91cce7 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -924,12 +924,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
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
@@ -938,14 +939,33 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
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
@@ -953,29 +973,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
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

