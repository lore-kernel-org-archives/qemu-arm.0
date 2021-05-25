Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4037613lfm;
        Mon, 24 May 2021 18:43:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzw3TeaTWneRrZCQJeiqxsaOwuDsnN/m+YsFsLe+xVk8JH7OmPrIEIkwW+QQ4NhttzN3bG
X-Received: by 2002:a05:6602:718:: with SMTP id f24mr15276986iox.59.1621907027265;
        Mon, 24 May 2021 18:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907027; cv=none;
        d=google.com; s=arc-20160816;
        b=1DCeC/+hEHdQiwnHLDXYWnLi1I3BjrmISLH89C41c8WQTtcR+wB1jlk+5eYA7uHU0k
         BdSS4OUD4eI4R02DiKiIJmOA/I1Wy8KKE4FLd16S/BAIHaKdo4E5lfQVPd2oDscAwfYg
         SLf8QSRm//gRzC6+Fkl11WwyM6IZYKEt2aE4slW0OSsSbVJQLsLqU5+mSpqVn+HNsHHQ
         3J69LG+MLaRNv+PuSO2qgHnBXS29vUq/Ls02+WnXGYXK3Z0g++krKoTOoAtMQAoBUByG
         +VzQknGkg0LkF5gMOC7b0Q7ureWiDcnsU/YMLbjoIi3YrrdQA1stVjyfNlxTpITB/yVf
         iHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NjRQE2G1APvNpsux7iWCMoF795+yU21m5CTY+GrRsi4=;
        b=vY1Ue29q653mTl8wxVABjAiC3IXLcRNc7FJbFddyhvjChakpbIS2wykuXNiz4jDXwv
         a6T60QdLKHBBNd15nVHhAyigFDj0X4sPJJi7g+0Ux5mtEZRmX17O2UUzxVdW4DYfFxu4
         Kcw1YFzJcUiw/4mbJ1sZfsq5eOfwP2vImKS8gVTM3SVwqNilggCY6vsoYPNkBEiQ3C1G
         JK4eL9+cBQVx7Iyc0NRWLD8kxvEcN5g+HxeeNJOuDKdeXN61iYeoAaSsj2PC5QDcc6yI
         8LfIFAynGurvtP6lXEVvG/yHULYWq1ngorkhzHj7TnCQ/cdDZmiPUc5mc2Llkl9JAkOI
         dnPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEo9dew3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i127si13593083iof.95.2021.05.24.18.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEo9dew3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llM6k-0006md-Lg
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXx-0007wk-Bx
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:49 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXg-00042M-Pk
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:49 -0400
Received: by mail-pf1-x42c.google.com with SMTP id p39so5932961pfw.8
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjRQE2G1APvNpsux7iWCMoF795+yU21m5CTY+GrRsi4=;
 b=eEo9dew3kfujtXVBJF/zu/C+5+FcjEjHkwdFQbYeOIccSuuEcwWLblMcGaQ9tzmUxY
 1iVpzEmZW8jj0PSgxiA9l+3s8J5fYLkLRkE7T0PDX5u+r9hu0oYzDPOGBFUjQO8hkdh/
 TeSJHLl9qwvDXurCKbrIQQvwhLSGzbaR/MwUnJ/hExfjVPc5j+gXw1WtI8fETaYJ0AhI
 Q5L+KGLXNMpPY8NUykoL2JKmFi2sfWgS2bf+tq8XP6DamRDLa85w6WyRngLznSgBpyhp
 DGq6K2DVy1ETzm6gC7xe1Zeg3/oJ2GUEvJ/QHX8fvEFg8w3rGWbIzvDfjMq1fsQ2NTWd
 ktAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjRQE2G1APvNpsux7iWCMoF795+yU21m5CTY+GrRsi4=;
 b=lCqke8bJaKz78I6mZaVUIvGfj2IbFNbEMK34g6mHJNVQ+IoVsh3xcmdwNBMNsazXDJ
 7xH2fuItc7T1nzT4+LnkQJZdONkDk0OODdDsJHckUNXeSL/31cjVDsYVauvzySj/CUR0
 DVEulPy3sePcn6BfhoFu28wNnWblPx7bgWIoFXxf9MGO4HsaYp2bljnb1KRHtlIgZGEW
 KVWbM5Rk2bJBi73J4dkk/NtY//1SJQxXH+e8bcjjoXz3jFjoaGyTnlR2vI/tzQ0kkfTo
 Po5fxgafH3XXjKpK96aLRtxWUm/5QkJ55aSPk5KBwkP40ow4r/PfEX4zZuPoReQ5m9k4
 9w2A==
X-Gm-Message-State: AOAM532NYfE5JbfAYoftUUpCBytSHmLunEaMhvj/5YVmm2Z7DVbJDgn6
 v+8ybAPM3MnL+ZuAesofVaanulrSOfERFA==
X-Received: by 2002:a63:4a4e:: with SMTP id j14mr15955640pgl.221.1621904849212; 
 Mon, 24 May 2021 18:07:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 48/92] target/arm: Use correct output type for gvec_sdot_*_b
Date: Mon, 24 May 2021 18:03:14 -0700
Message-Id: <20210525010358.152808-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yaQmeMAhrRpv

The signed dot product routines produce a signed result.
Since we use -fwrapv, there is no functional change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Split out of the next patch.
---
 target/arm/vec_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index a3d80ecad0..48e3addd81 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -378,7 +378,7 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
 void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd;
+    int32_t *d = vd;
     int8_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 4; ++i) {
@@ -408,7 +408,7 @@ void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, uint32_t desc)
 void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    uint64_t *d = vd;
+    int64_t *d = vd;
     int16_t *n = vn, *m = vm;
 
     for (i = 0; i < opr_sz / 8; ++i) {
@@ -439,7 +439,7 @@ void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
     intptr_t index = simd_data(desc);
-    uint32_t *d = vd;
+    int32_t *d = vd;
     int8_t *n = vn;
     int8_t *m_indexed = (int8_t *)vm + H4(index) * 4;
 
@@ -501,7 +501,7 @@ void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
     intptr_t index = simd_data(desc);
-    uint64_t *d = vd;
+    int64_t *d = vd;
     int16_t *n = vn;
     int16_t *m_indexed = (int16_t *)vm + index * 4;
 
-- 
2.25.1

