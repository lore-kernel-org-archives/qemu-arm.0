Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2932913lfq;
        Mon, 11 Jan 2021 11:23:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/PY0SALoSqSXsc6bVexdkgQcftkEpkjnrFVIA4RNyHD41LTxMcnSbzZ2kdCI7v0/oFNjI
X-Received: by 2002:a25:6ed7:: with SMTP id j206mr1840310ybc.312.1610393012434;
        Mon, 11 Jan 2021 11:23:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393012; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPtl2OuAR36A5EFJWMtll+WGwDiHKc5EAeU0JghJ/UPOygvL1qgRXA8OZwuKmK/ipc
         MR2is5dKcCclB3SifjW4JDk0OzWu5OaGxWBf6HdPsXmfmjQSp6QeiUDmxyQ/ptuCCwFm
         lSMZLD2bg9vqKkJp1Wdibg6TFpI+Q58/JSznQzGezO1nvie18Go6/7eSPBjDi1qiG+7k
         tN+uG0mZG+1EJoXOSWThX0Jkm+5ZdEz3IcP2DQGXo2QPwAWrjGiHLiTR/G6njjrygcCO
         je6IYxZgAm/1+2u+Wzc4al6uN28OyySkL+X2+q0WPJsXIg8+65IckiHrng8EqZRASsnp
         FR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kFpRdpzIBHPgybwqUXYjnSl/F8QbD35R7VDxiD3dIh0=;
        b=Q8RjKJ2vHQDOfsTNLtJ1HMOu3ynYiF3Ss9uFzFNrBVygELifCCAWWczge+mNw3TO6X
         /nd1ZtdtGnEpnjakzKSI5ODBDa5tcCeC3yUjXmtcOCEuE1L5jZSESDm5+EBEEoNNijnw
         A8GCR46weemchm0z+DIS8vanlUXMkKBiJCKTXhNx8DzWvZvsO1mRBzjL1q2r6ZX0t1s0
         OJ+e3uu7QYfv+Sf5lWv/I9zcwzx1Rzif0ml0H26sQZkzlBwlz1DiT39TEVSt019EgFqx
         4WigNLF7hDBxE1AjB8VK6DfJsr1iJSBH5BeKC8ngbGqa+eap4nqyji6IE8W550aAhsLd
         NWZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MYZ9+MhG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si641938ybp.372.2021.01.11.11.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:23:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MYZ9+MhG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2mp-00072e-RB
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S3-0006NE-7y
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:03 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rw-0006Ux-Dx
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:02 -0500
Received: by mail-pf1-x435.google.com with SMTP id d2so502694pfq.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFpRdpzIBHPgybwqUXYjnSl/F8QbD35R7VDxiD3dIh0=;
 b=MYZ9+MhGWMobvkDVemyZXDjKj1Jsr68pjUw78sab3TLLmoFXNv6vnNKtsh3TZX+b0/
 je+f3nUwJfiroClwEsju77HfNqmp0twG1/hIJFr4VxZASwOotEgUV2Kesioi+3dxj2hW
 pjpERwUdY0Cu1eigNpfLdZhCzgYHhy0PM37tpTEZPPlvBkdx7Bu5D0W4ZJqXx4ibelhB
 cNfPrIXNPiZBeWuFDixcDHFoCcPEpmy1JoXSAXFEbHjh81y9mWAjmDURg4Cejktj443M
 j4SE0Db15YdeeUAXaVimg83JQOhCUH/NdgYwjSTEDlYmSi0I3kUQNFr0rg0erLmHgMM9
 AB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFpRdpzIBHPgybwqUXYjnSl/F8QbD35R7VDxiD3dIh0=;
 b=RnU5W6K609YNPXJk2IStWH8eFRu3LjD25FsxxAf6jsNUOfC2KKb+NkIAvgXJUpztCE
 8pq7/az6h7Wm8R6bI0v2Ruh5OBBlHm+VyOhLZB9KFmIb5JYJBATeCuYN4lCM/jcYEpPo
 TvY1sofVo9Ba41VGzzwnTQ/V3W43aRfL2yGbTlhFFj6gxF2vYSMMV+jTI2v9jfaQEhpU
 izJRWSShyt1BPYK6WWt2FNWliJaSILa7Hagwvs6D7Bb1AEWvEvl57gdIvzThnArg/4ek
 jr88/OalWm/E0PdyBfqj7NdtJgEqrsH3fPZHfRKwOQkyJ5sPcij0wHNJQIIQcRsiQN+H
 JNYQ==
X-Gm-Message-State: AOAM533wBIiRGAj2XDv2zQZOrWfE4fZIX2jnl+rOHMMGhzielgO/YpvS
 JhiUf+78+B+ZomOKYZgenF5KiW4QmRbu6w==
X-Received: by 2002:a62:543:0:b029:19e:5627:1c4d with SMTP id
 64-20020a6205430000b029019e56271c4dmr801101pff.31.1610391714772; 
 Mon, 11 Jan 2021 11:01:54 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/30] target/arm: Enforce alignment for VLDn/VSTn
 (multiple)
Date: Mon, 11 Jan 2021 09:01:05 -1000
Message-Id: <20210111190113.303726-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: VF15CFznj9Xf

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 9c2b076027..e706c37c80 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -429,7 +429,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 {
     /* Neon load/store multiple structures */
     int nregs, interleave, spacing, reg, n;
-    MemOp endian = s->be_data;
+    MemOp mop, align, endian;
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
@@ -473,20 +473,36 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
+
+    /* Enforce alignment requested by the instruction */
+    if (a->align) {
+        align = pow2_align(a->align + 2); /* 4 ** a->align */
+    } else {
+        align = s->align_mem ? MO_ALIGN : 0;
+    }
+
     /*
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
     if (interleave == 1 && endian == MO_LE) {
+        /* Retain any natural alignment. */
+        if (align == MO_ALIGN) {
+            align = pow2_align(size);
+        }
         size = 3;
     }
+
     tmp64 = tcg_temp_new_i64();
     addr = tcg_temp_new_i32();
     tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
+
+    mop = endian | size | align;
     for (reg = 0; reg < nregs; reg++) {
         for (n = 0; n < 8 >> size; n++) {
             int xs;
@@ -494,15 +510,16 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx, mop);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx, mop);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
+
+                /* Subsequent memory operations inherit alignment */
+                mop &= ~MO_AMASK;
             }
         }
     }
-- 
2.25.1

