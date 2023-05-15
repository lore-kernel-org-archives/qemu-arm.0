Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6568572ejq;
        Mon, 15 May 2023 07:54:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4jP088icZlRUsVuMk8xGa+jZ5UNZwErnL/LncZ5c9LvtyDG0i1jdTvSWaLK7MK4bcVIWwc
X-Received: by 2002:ad4:5b8d:0:b0:5ed:fa66:bf6a with SMTP id 13-20020ad45b8d000000b005edfa66bf6amr45730707qvp.52.1684162479223;
        Mon, 15 May 2023 07:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162479; cv=none;
        d=google.com; s=arc-20160816;
        b=Bw9wkoh3ddyzXtibL/2Fx6bTJ/K86Gvvmk/AV3SDUyVJUpHVXhkVMsHP6gVSMu8Jt9
         H6gug9R28CZJtBBCWZvCq2dbpVXStFNJ9j1QFgn3JUMgg/LZIYB5RkojgiJKoYZgUuGp
         5/FYs8H5LfUi7Idj6fdwgufxqbiSQiWTggqCp9kwz67gH60QrQNLPNsQw6j5Feda8Fqk
         lHIG8Z6iZzhPKdjwgDNw35/iMK/NErwu5uwOTbOSL5R1ocpBIMUyaiZRv3S90CiJV+6K
         9mkBoIE8+bLIlyhjG3q01p+9xKyL18u2C5+65gMDS4kbpwqsIXMAemxPtbwptton0fo1
         P+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LPhN/AVmZfqDEN0zKKnHjQGokKYF75xLV5YHB0OEaoc=;
        b=WOhpnV7wtqIybEmKj+be6HiS75yAXFf+RKEWUGXqs+RKwwNvCfuA2kSAIfCNSgx74e
         Vp8x7z497H1Vg/UCU0mlC6JJ6r7+fqW88r/AJ+z+0+JZGqrBYdsVoOPEtQH9LCgrwskb
         grydcPw7RVl19+KbNUEF6ggvE95pt+fRdvBUm/Z9Bm+9ov/L63kOplnSPZn+wzO9iJEx
         Cl9sE4tZRjizr99C4kC3rXKPjPFCts9fW/y/VFK7UGD47qMXzayh9gOuBB8j0kpbX/hI
         NGEN1VNT0Rr6iytg2C96Hx4wcD5T1cvdwT4R2Vejlkz8cQ05MNUgu3xkx8qok7xH3hft
         NsPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvTdIKjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a05620a254a00b0074a89451431si14020122qko.779.2023.05.15.07.54.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:54:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvTdIKjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZKG-00060h-Fg; Mon, 15 May 2023 10:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJz-0005Py-A8
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:08 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJj-0005yW-GG
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:07 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aaf91ae451so120284045ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161410; x=1686753410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPhN/AVmZfqDEN0zKKnHjQGokKYF75xLV5YHB0OEaoc=;
 b=mvTdIKjvnkSuz2lCQmiB3DZC9JiVefPaeGnuFgM8g4fZDrKjEezR4UwAYTDhLytCU3
 j8KMmFY4koHmQ86YyRTe/zNcE5ozl2fOJUE/4nbtFwblEIE360XBuJEWmdo73qb1bBGT
 dzOnXjRdfQ/xjPd2jXkfMCeWN6qMDC+f0q0+a3RkOdPpIou5XhL8e/ZB30sF3izZ58yP
 vmP+Tuu3G/hvcI3XRx9PNa0ngD3bmLLswf7rEzSEJL/gs2pbSwr3/epcrkN8dY9Ldogz
 mtUu1jCBfplAAv7X+pz4oPBtfvfsqQVJ5aPf6EJbKm9hCxCPayI6ZFIrbkdzUdeekGFz
 e+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161410; x=1686753410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPhN/AVmZfqDEN0zKKnHjQGokKYF75xLV5YHB0OEaoc=;
 b=PeIjIVAKEf0LVmxNc+sU3gCpuZkNgTZAl2WVtHw4/1xaGrH1ntTTVANMLh3bII5Jhi
 FPaVrUxNVf71fXjutynpC3hNlCnddhZJkxNdSg5cemGTj2v9wIDKl1T+pFvfl21Bmiel
 H4Ad47t9ajm3d4ziOv5N1hFT41dM2Kifj+4vvHImzJo39ISj18Ou1X4j5Sg3vH++jtMP
 Jl1cwhglMeCRNMJOHgO/dK/x9Ha4wHBlh7fIaQWRhLjig1M7aKGKK8jdYWJUjbzO+nYR
 fdr/8LRZ/XPsi5rGlL3AZwqJkn++0cu7BBfAoDFkd3+Jcinwmc2Z39aLmn2n6p2V2KSo
 lexg==
X-Gm-Message-State: AC+VfDz1PxBxsiGJqK2/vGPHIia+UEDmtXY1uX7YalDsGVh09N+Ke9hh
 uWjpgDMpqd8cQdHp7/Y4VCSUoQ==
X-Received: by 2002:a17:902:efc5:b0:19c:f096:bbef with SMTP id
 ja5-20020a170902efc500b0019cf096bbefmr31630039plb.49.1684161410241; 
 Mon, 15 May 2023 07:36:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 41/54] tcg/aarch64: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:00 -0700
Message-Id: <20230515143313.734053-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: q5OrDpSMAm8p

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 0cc719d799..ea4108d59c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1593,6 +1593,7 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     TCGType index_ext;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1646,8 +1647,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    unsigned a_mask;
+
+    h->aa = atom_and_align_for_opc(s, opc,
+                                   have_lse2 ? MO_ATOM_WITHIN16
+                                             : MO_ATOM_IFALIGN,
+                                   false);
+    a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1693,7 +1699,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    if (a_bits >= s_bits) {
+    if (a_mask >= s_mask) {
         x3 = addr_reg;
     } else {
         tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
@@ -1713,11 +1719,9 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
 
-    *h = (HostAddress){
-        .base = TCG_REG_X1,
-        .index = addr_reg,
-        .index_ext = addr_type
-    };
+    h->base = TCG_REG_X1,
+    h->index = addr_reg;
+    h->index_ext = addr_type;
 #else
     if (a_mask) {
         ldst = new_ldst_label(s);
@@ -1735,17 +1739,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     if (USE_GUEST_BASE) {
-        *h = (HostAddress){
-            .base = TCG_REG_GUEST_BASE,
-            .index = addr_reg,
-            .index_ext = addr_type
-        };
+        h->base = TCG_REG_GUEST_BASE;
+        h->index = addr_reg;
+        h->index_ext = addr_type;
     } else {
-        *h = (HostAddress){
-            .base = addr_reg,
-            .index = TCG_REG_XZR,
-            .index_ext = TCG_TYPE_I64
-        };
+        h->base = addr_reg;
+        h->index = TCG_REG_XZR;
+        h->index_ext = TCG_TYPE_I64;
     }
 #endif
 
-- 
2.34.1

