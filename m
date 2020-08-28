Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1690231lfc;
        Fri, 28 Aug 2020 11:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNA8NEfFx+bbM1d9fKr8VVseCz6CcIJIzNtKYbo6jlTRP2FsmB50COUoihd4FFax/cwweI
X-Received: by 2002:a5b:904:: with SMTP id a4mr4284805ybq.397.1598639859839;
        Fri, 28 Aug 2020 11:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598639859; cv=none;
        d=google.com; s=arc-20160816;
        b=RwluOc/2y9x3QIRQFxKTEj8pkdCpwQhF4Fm5GzJsmsCT4/6UfY+xLgEt6NNafAvjxh
         CKSlg3dw+tPyZNegRI+uA3oD2bjkBigPwUhU4k7FVx1cp6VL+ClwOujW/SQA6PZmLPW1
         F9Od7wkhqOme01bNE/SFikTPVuuhmmZEn9+64K76+x1Xiii3UJPkhG0m683okBbtfof5
         pQ5ne3UteX2zXMmH2dqjVb4LOI5OdHPje3YLGv3fDLngZonmqKcfXDSGTLjNNC81AvrP
         NWNq8L9JZrCjyZD9JPBeJ/kAtcU5iqVMiR2UcRuXRArfPqobZ6wf53MzumQHuxeFtOla
         mekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+jA5lQWk27z4fN9b66lo0L+e7azK7DThocQahuWYwHI=;
        b=dt4WzfWEW2q6cDWw8yqTPaSGAzsZKDulml5fqqmrmtGzdzCxVA3YPwlh5WGwv8XomX
         4ynsKwjzwQbL1nnDhTCxSCwFPo5SDUztnMtgn7qYh0WLJp8X8r+coPyMyHixhKJWewB7
         XwvXZbcG/NVLnLV7X+yfMxhYIjkfcVxrtCpPVq4OYX9Whzm65PDxzOUqT6wdq6KHnGqx
         gLHH5YfA3SBiNSM5dKkqkiRCLw1BDC5gjv8DP7N+vkUywr695qrIh+BXvjECeJs11dPW
         b9KHA6ysjYSNncCsHs5uhkVpjB+5D7bURspRg+LCHaio8/9EHx6+iTaIAi1wiOn1WZWb
         pqxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=asKZH8a2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si79286ybt.339.2020.08.28.11.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=asKZH8a2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjFr-0007TL-68
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCe-0002LL-Ud
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:20 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCX-0005xJ-GY
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:20 -0400
Received: by mail-wr1-x443.google.com with SMTP id c18so42052wrm.9
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+jA5lQWk27z4fN9b66lo0L+e7azK7DThocQahuWYwHI=;
 b=asKZH8a2xkEPAOtK//+nFwbK8CLHytrF/xkl5ldFXEYzBxGP+JF2GIc1aJzt5mQrYG
 z2WYghV04vewxJFg1JIhjnGgCLkuCUOBtdXA+GiBW7Q+86GVb2b3cqjGG2eALUZWAwi6
 KZl7rmZNCnYdv7rug6UDgDBXSHXWE0hXvfHBg0v6lH+gqEbzzLJePHXkI9Qwe1/qXoOT
 +FLJYQNY5Gx/wEguhTeLM4f+pP2jFdkKQjkWzcGR+xR/v3TwmiRk+vpcuj1GJ6sLKd1c
 IYeBycZSQsinun2/5h3E6BS19RQUVvmgRR7EyDJiusZ2wHOWzLTeFSjsScfYTo2Dj8Es
 5vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+jA5lQWk27z4fN9b66lo0L+e7azK7DThocQahuWYwHI=;
 b=MMd8Lf+ep1QHa02JSQbUyfnnCQLQIBYLw0i8qSB9S87yYWyi/On3DH/4grJnpf5ZyY
 vdv+j1bC2xlZ+zuW6luXnZVisGV6i/heewjeFtJGl7uToVj/xC1OVkWmHfoWKI+FXI2D
 aJjqrmXOhOZIag5EF7oRdYfIlFTIshplbzQJCV1NDOsIEiPThqu/2b3GarhUZ/XTb/VP
 3K0nf6DxT6X258AOOC+JvySiQyYJgBiSX5VctzJTBwWZRLp2yN5dDK2SoIAu2TRrK6Ch
 dkrY+JKCla07dbPZZ7VsP9kj20qlw44TCrEPDgZaSAtwZbhmiELPQclBL4+qQ8NpbZqK
 dd/w==
X-Gm-Message-State: AOAM533jLVC2eciLvapdcI5MO1Bf6NkY9cRUnCCRP+30g2Vllj0qGitE
 QV74cCyJirSnMXO1JDXMVUql1E9890ANMoqS
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr281191wrq.162.1598639650004;
 Fri, 28 Aug 2020 11:34:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/45] target/arm: Implement VFP fp16 VLDR and VSTR
Date: Fri, 28 Aug 2020 19:33:20 +0100
Message-Id: <20200828183354.27913-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FkkV3OeHm45O

Implement the fp16 versions of the VFP VLDR/VSTR (immediate).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp.decode          |  3 +--
 target/arm/translate-vfp.c.inc | 35 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index b213da4b55d..37f96e2d261 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -79,8 +79,7 @@ VMOV_single  ---- 1110 000 l:1 .... rt:4 1010 . 001 0000    vn=%vn_sp
 VMOV_64_sp   ---- 1100 010 op:1 rt2:4 rt:4 1010 00.1 ....   vm=%vm_sp
 VMOV_64_dp   ---- 1100 010 op:1 rt2:4 rt:4 1011 00.1 ....   vm=%vm_dp
 
-# Note that the half-precision variants of VLDR and VSTR are
-# not part of this decodetree at all because they have bits [9:8] == 0b01
+VLDR_VSTR_hp ---- 1101 u:1 .0 l:1 rn:4 .... 1001 imm:8      vd=%vd_sp
 VLDR_VSTR_sp ---- 1101 u:1 .0 l:1 rn:4 .... 1010 imm:8      vd=%vd_sp
 VLDR_VSTR_dp ---- 1101 u:1 .0 l:1 rn:4 .... 1011 imm:8      vd=%vd_dp
 
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 00a6363e1e1..59ef4d4fbc3 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -886,6 +886,41 @@ static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_dp *a)
     return true;
 }
 
+static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
+{
+    uint32_t offset;
+    TCGv_i32 addr, tmp;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /* imm8 field is offset/2 for fp16, unlike fp32 and fp64 */
+    offset = a->imm << 1;
+    if (!a->u) {
+        offset = -offset;
+    }
+
+    /* For thumb, use of PC is UNPREDICTABLE.  */
+    addr = add_reg_for_lit(s, a->rn, offset);
+    tmp = tcg_temp_new_i32();
+    if (a->l) {
+        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        neon_store_reg32(tmp, a->vd);
+    } else {
+        neon_load_reg32(tmp, a->vd);
+        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+    }
+    tcg_temp_free_i32(tmp);
+    tcg_temp_free_i32(addr);
+
+    return true;
+}
+
 static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
 {
     uint32_t offset;
-- 
2.20.1

