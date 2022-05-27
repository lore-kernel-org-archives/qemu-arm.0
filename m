Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1223530lfh;
        Fri, 27 May 2022 11:56:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9FdIRd0mB5vK1nLBMZBYFpg/86MsCchw7qbZ39zSEEA5jfMjdHwEBbqs7HLlJnuOuyomP
X-Received: by 2002:ad4:4ea9:0:b0:45e:5dee:fa48 with SMTP id ed9-20020ad44ea9000000b0045e5deefa48mr36517353qvb.66.1653677810328;
        Fri, 27 May 2022 11:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653677810; cv=none;
        d=google.com; s=arc-20160816;
        b=hXaaeW5Yl3xAxp6LKmRtNhTq5XCJlECPK499BU6KrdLK3s+Noj7WpHXg14rmJTud2w
         ot684c6vQqzNeI7UmfYTjBeBLjx+LEJbZRYxxssZhyK8yU0CZdO2OLNDe++K6NTy0imp
         tY8lcvbE/KPPkvzAmC2MxCo6tqz8xRqTeBkghD0+127Z3aXInOGt5KUJZWSG6LFpNJLy
         ycIVBn5WcyOJInJlFChZ06tLCVkeIgwwsQAzlgrYor0QpVWLUf9dN0Iiav3WOvtxcs09
         1mxbYESCoUX07+Ev5nVpxKw44JerZFWYNn7OYNsb8sRBXA1zLh/SmonCqoEggQyLVj//
         KFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v0dbHEjrygu3dRjGRgtDOzl0m+0syasJU1U4At/8xUU=;
        b=CaP1QtJ6wGDnGfBu8i6ZX0mpGTXcLYU2eieEge6b8SgucPnBzDrivDPPP1GnJm+gbk
         PuytiqkhCaEmhYDrJDmN+5lYjzWJfNtNhopRM4emnV1dS8npo9hrgUXo5qdvqAglAHE9
         5WnaIFXm9t2FYOz+Dcm1Zu5WFCpUwnyd5b7Vv4eFLAxfYeecuxQ1hMZL06r9uTbMKgaH
         ImCk3B/DjGpETTBivdMgz7jVG0cJrxIL67aHHuudU7iciz4nIGRwbB3Y4XbtstLJFWBK
         MBQNM8Ahml200nCYpnZxnhdVjA8CHE3870q+bx/Sj12GGWTJtjgjLWEzFlKJZCqMlt5r
         HHzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jKhiu7gc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed12-20020ad44eac000000b004563029c775si3208448qvb.133.2022.05.27.11.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jKhiu7gc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuf8j-0001jU-R2
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003at-4s
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebz-0004LW-01
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id f18so4850326plg.0
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0dbHEjrygu3dRjGRgtDOzl0m+0syasJU1U4At/8xUU=;
 b=jKhiu7gcaX7MkCcy2gy3AuIgaM8F3XZW4MuQAq+v9kHcHNNGXWM36S07PdYL5oYxAk
 x3cTnIevPdiYP4lktEvR8VhbaJQXlyM5nPlC+trrK+eTXsJm+yaEFNs7jKQzto4GAjJk
 7/zw3BmvbzY96VefcNo23EFuux8ThGTPX6kHUqNBiUpNMMqtGR12H47ejdm8yjTr67Vm
 irs9B447Gp4jzQ6UQ0RtCk1FugJamtrwf/8afYVFxiiNbTfZpVeIEtO1EzaoGXfNU9ff
 u1ggilCCxKmXeavWl7aXZV/oiVTt6G9+KWl4z6esl7wPZrJHHL6cV6EgUmbLKA/2Grpt
 FGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0dbHEjrygu3dRjGRgtDOzl0m+0syasJU1U4At/8xUU=;
 b=kzQ0uDpNMFAt4Bir+NBj+iLuv0LuvgjdBfpzos0G84WqoLm5yktDNksOz/wZywXDvZ
 50YYyfLi1RtFXK4Fplion1NU30Bu6rrpRm5hkpSoQblDsdnrscgNBJErKO87Dw3CF5P/
 aA2XvNnzk6I8eS52mF85DIZ5uLeQX32IG/9Idt83HLWw38ju0i+gmUd2mDqvLJgXT+Vp
 Ki8N489jVbHGCmD7OYOIIGhjjRnkYoWlbJyYtu1+YqX09N5ODlcV4a08Gfvk1J+ETSHr
 g2cYIpQkzqmWGCmRJpOv/53E4838C6ShR2gE1R3wJ1jGs2A4tdRtgoXP3cEbu2vzbf38
 Cr3g==
X-Gm-Message-State: AOAM531l+xIhe68WX07qBDcPmKMJTNTjqCWxA9cDeEW7wui5GcE5zvDL
 4unCLAc0FTeIalCzmXD46PXzBRMzgAUGVw==
X-Received: by 2002:a17:90b:4a90:b0:1df:e3af:c6ad with SMTP id
 lp16-20020a17090b4a9000b001dfe3afc6admr9593450pjb.41.1653675773242; 
 Fri, 27 May 2022 11:22:53 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 048/114] target/arm: Move sve check into do_index
Date: Fri, 27 May 2022 11:18:01 -0700
Message-Id: <20220527181907.189259-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vBYYBcNoDx6/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 53 ++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 52bbd1a4fa..44c2342923 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1087,12 +1087,20 @@ TRANS_FEAT(MLS, aa64_sve, do_zpzzz_ool, a, mls_fns[a->esz])
  *** SVE Index Generation Group
  */
 
-static void do_index(DisasContext *s, int esz, int rd,
+static bool do_index(DisasContext *s, int esz, int rd,
                      TCGv_i64 start, TCGv_i64 incr)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
-    TCGv_ptr t_zd = tcg_temp_new_ptr();
+    unsigned vsz;
+    TCGv_i32 desc;
+    TCGv_ptr t_zd;
+
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
+    t_zd = tcg_temp_new_ptr();
 
     tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, rd));
     if (esz == 3) {
@@ -1115,46 +1123,35 @@ static void do_index(DisasContext *s, int esz, int rd,
         tcg_temp_free_i32(i32);
     }
     tcg_temp_free_ptr(t_zd);
+    return true;
 }
 
 static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_constant_i64(a->imm1);
-        TCGv_i64 incr = tcg_constant_i64(a->imm2);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = tcg_constant_i64(a->imm1);
+    TCGv_i64 incr = tcg_constant_i64(a->imm2);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_constant_i64(a->imm);
-        TCGv_i64 incr = cpu_reg(s, a->rm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = tcg_constant_i64(a->imm);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = tcg_constant_i64(a->imm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = tcg_constant_i64(a->imm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a)
 {
-    if (sve_access_check(s)) {
-        TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = cpu_reg(s, a->rm);
-        do_index(s, a->esz, a->rd, start, incr);
-    }
-    return true;
+    TCGv_i64 start = cpu_reg(s, a->rn);
+    TCGv_i64 incr = cpu_reg(s, a->rm);
+    return do_index(s, a->esz, a->rd, start, incr);
 }
 
 /*
-- 
2.34.1

