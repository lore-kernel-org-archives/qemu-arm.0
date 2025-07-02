Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3797422dye;
        Wed, 2 Jul 2025 06:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtXr6i/p7knSKMyZw4yHdrZN/m2TecOdoLxhcyu3hfZMy7oI4btFpZZUs5yD+IAH8Cu7T6ZNnt0/tOdw==@linaro.org
X-Google-Smtp-Source: AGHT+IFsgxPNNOQU/Jz2/eXQRU8YuzaeVvPFyQuHXlFAmVlUcnfvLTyua1aAGcdWWQuhm263LLfA
X-Received: by 2002:a17:907:3e0c:b0:ae3:a4a6:a32e with SMTP id a640c23a62f3a-ae3c3c5be7emr249840266b.29.1751461498860;
        Wed, 02 Jul 2025 06:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461498; cv=none;
        d=google.com; s=arc-20240605;
        b=M4RPfYrFvQqRGPh1yLJvrAMZ5SYxT0OnQMlF8aMT1agaVQ9a+iAMTSgS/AhkM10/6c
         6PkOAXkHsJTiD44T8eWpNe6RV8J3eoS4n+7+LW2IJR87W9Us74IC6SVwI4Dah3sYE+25
         biALWL/DQiA01LoQqrTWR4OCMpFGtD5kLSjOvgE8EY2CT30FstaVuKeW37WH2uAtHoau
         tkT2sPD+FtQlPu3STYm6TIsV7CGTQOEZqIvf1KtTJw8Aw/vLc6syhVYww3kaGp+9p69a
         9SXiLSygIyagz7G8paeD3r0ZBxUQ3AZr1HvrKzpQ+o2sfRm4/w0ai6hY1WpA4NP5CLpc
         OCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wjp82vp6ijQJbUmrwBtHmhT7qLVtBn5OECQncgwB3SQ=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=hLKcXe6p7Oc4l3CVf/4+9aQj3fN7LNp/tiwArd278KfTWHcOPFq3X0id8uxde5wGhh
         vomhQwetMZpk2NV3+HkC2CwY6ae8Rp7xSsRy3MaMngF9qLBciqqrxMkkEV2cj0kgzP1R
         FhWLaCFuUMFEZorVY+i5BSbuaZS2BpeD1iK2QuazwyBybx55CpZYjIBbE0F3JMG7ofFl
         2mV2YguM65AthJrVQuoW4awsgdafbOYqWxkBRVwyPe7kOgtqTPVz/Vfyw4PaCpkS1GyN
         DQ2PRXaGo+dy+YC4KhMb6istDGEw1fOMTsggeSXpkCPCTJ6pLqNNlm4D4r0asNhV5fdi
         BvBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xblMqzfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a640c23a62f3a-ae353c7db5fsi919108666b.687.2025.07.02.06.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xblMqzfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwoY-0002PE-Ef; Wed, 02 Jul 2025 08:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjn-0004g1-QF
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:59 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjZ-0002BL-Au
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:55 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2ef891cd058so3418008fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459916; x=1752064716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjp82vp6ijQJbUmrwBtHmhT7qLVtBn5OECQncgwB3SQ=;
 b=xblMqzfbMWFGzyF/LZS3gmyRTT//Jo2hmOAj3ukYzTPcNSqrURZd1F9xG8cDl53M/f
 1CvFww9QeE3YqPh85WMffbybClZy/cC3Zyw9wb3FOYcfnpJ1AI3ZupT3uRoeDCjQLIXD
 1pxXj2aeELUC64TrdHtRLOTmjdlKiT97xwGqCCX2LhpYprUvej6KKq60s8ZH1K8zOkGb
 IA0BFPA+Zqe+8gzAVXNWFjVvVMqu5CTki9994Eu2B2mTp+DWrTtPiOX8UPo+INe02eMH
 pmIFVPH8pHQ07b7tJehUElVe/ROspL5bg4UAnpqxLbnRg3SWeo6O4IGVJR3peFV3jizi
 r5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459916; x=1752064716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjp82vp6ijQJbUmrwBtHmhT7qLVtBn5OECQncgwB3SQ=;
 b=j2mJ5uhslDEKnnNJcNGIIqIJX5kQ413KMflJtL7flCxVQi3fgrQ8tJu8jFrmGHbBPZ
 UyOH3xvHhLL8ovztnk6iYK8RVc3AwMPSMQ6DjEauR86+Ci3Xb7b7vJnB0UUce1kqxO/G
 OahXnDfOv53jKTP/eUl6BzMO/sdNFwGtZ6+9/h1JJ4XjY/1k5+ErgXnB7+WXGLIo0h7Q
 oHBUIjI21ZE/h+TRpjBi9CnA8D/sa4xk8uNIi86DAl7CrRSZb7UeFcMrOONYLau8fLP3
 J6u1I081K1mRxDnxidqLnjKHq4+usmHGZ74gzWTsAgD0aLodylcMjd1TLTKiyimk/fMa
 XVPg==
X-Gm-Message-State: AOJu0YzTWFlrkiTB3ooPji/ljkikxqX6FVt4+qOCC0V89E2xsj+B36wn
 fpk9Hz30BpSAVDVbAP09wdtXznH1waiXyiCwsLFP8WRQh+RwvqxkCjsFV8RF+aiya8RofbxC/Jb
 emntG2yQ=
X-Gm-Gg: ASbGncsGqQ5h3zUD6L9k+qCWfO/JnfXLSk7AMcWZ5HO6at3KKBZP8JH5/IAQ8jcp+1i
 KK7UhCGMXjD0/xaBTQhhuJoYgTUBCe4A6c5hyDYZMo8aHWAwltTW3gQz0fW6Pd+e+n76y6wFIIk
 h7+zyU4g35slDrdf8Dt5rr1vMqkCvRKxtSM5426gqO08fmgk9yyzazeujiNDpP61RPAxpQsIQil
 vQUc5pm8pasUrZFuHgJpGuBxIrvyoOSVng3SlABHGqU8QgOFxdkj5vnpjdYsrR31HV079114kfu
 yD9m+BKmYdNcipEEvibl2SSClgQzzMVopENIrhe71c7/HAyFas/seKddG4pspxW1qi1UoQ==
X-Received: by 2002:a05:6870:ec87:b0:2c2:b85b:71ff with SMTP id
 586e51a60fabf-2f5a631ad1emr2063891fac.8.1751459916276; 
 Wed, 02 Jul 2025 05:38:36 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 65/97] target/arm: Split trans_WHILE to lt and gt
Date: Wed,  2 Jul 2025 06:33:38 -0600
Message-ID: <20250702123410.761208-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mxf4T6jTRXgH

Use TRANS_FEAT to select the correct predicate.
Pass the helper and a boolean to do_WHILE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 23 +++++++++--------------
 target/arm/tcg/sve.decode      |  4 +++-
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index f74f2bb1b3..62d3e2efd6 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3108,7 +3108,8 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
     return true;
 }
 
-static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
+typedef void gen_while_fn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
+static bool do_WHILE(DisasContext *s, arg_while *a, bool lt, gen_while_fn *fn)
 {
     TCGv_i64 op0, op1, t0, t1, tmax;
     TCGv_i32 t2;
@@ -3118,14 +3119,8 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     TCGCond cond;
     uint64_t maxval;
     /* Note that GE/HS has a->eq == 0 and GT/HI has a->eq == 1. */
-    bool eq = a->eq == a->lt;
+    bool eq = a->eq == lt;
 
-    /* The greater-than conditions are all SVE2. */
-    if (a->lt
-        ? !dc_isar_feature(aa64_sve, s)
-        : !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -3149,7 +3144,7 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
 
-    if (a->lt) {
+    if (lt) {
         tcg_gen_sub_i64(t0, op1, op0);
         if (a->u) {
             maxval = a->sf ? UINT64_MAX : UINT32_MAX;
@@ -3204,15 +3199,15 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, tcg_env, pred_full_reg_offset(s, a->rd));
 
-    if (a->lt) {
-        gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
-    } else {
-        gen_helper_sve_whileg(t2, ptr, t2, tcg_constant_i32(desc));
-    }
+    fn(t2, ptr, t2, tcg_constant_i32(desc));
+
     do_pred_flags(t2);
     return true;
 }
 
+TRANS_FEAT(WHILE_lt, aa64_sve, do_WHILE, a, true, gen_helper_sve_whilel)
+TRANS_FEAT(WHILE_gt, aa64_sve2, do_WHILE, a, false, gen_helper_sve_whileg)
+
 static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 {
     TCGv_i64 op0, op1, diff, t1, tmax;
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index dcfc40ef44..c90d975ebf 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -789,7 +789,9 @@ SINCDECP_z      00100101 .. 1010 d:1 u:1 10000 00 .... .....    @incdec2_pred
 CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 
 # SVE integer compare scalar count and limit
-WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
+&while          esz rd rn rm sf u eq
+WHILE_lt        00100101 esz:2 1 rm:5 000 sf:1 u:1 1 rn:5 eq:1 rd:4  &while
+WHILE_gt        00100101 esz:2 1 rm:5 000 sf:1 u:1 0 rn:5 eq:1 rd:4  &while
 
 # SVE2 pointer conflict compare
 WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
-- 
2.43.0

