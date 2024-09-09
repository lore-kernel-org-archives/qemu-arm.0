Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984030njb;
        Mon, 9 Sep 2024 09:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXihyxXqU6prMPQtNUJd5lUqwjwaNcU8iC9ioumlJ90LzvEGc2fnYU9OyVw9NiV1JB1sGmUTlm4t98qUA==@linaro.org
X-Google-Smtp-Source: AGHT+IFcqF9TbVLO1mjws3AIOJ/yhUOGpoRo4vNhQsf4p4HC1BQgkkWgMKXZ96aI1iYEJTnHW+NI
X-Received: by 2002:a05:620a:46ab:b0:7a7:fe96:880a with SMTP id af79cd13be357-7a9bf9caff8mr26572885a.31.1725899009559;
        Mon, 09 Sep 2024 09:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899009; cv=none;
        d=google.com; s=arc-20240605;
        b=ivMhHXcw5Je/YBi1F8NTzenBSG2FiVhzuJ3VftAFbN90jZDK1ZXYOKeja88u+hbVEE
         Mz7wbME4XcECpniKS0bU4+VamWbvNMjPhxrvip7sGiAILb/uVuz3PSrtzUTipNegbabM
         mCclp0g8NjkV31AqH2lAQW48lzk7jOoItm+s3cKDDDGjZnCIpZoFiWk0nShbBvX0HSOc
         uHXEcRKGo/yH/RRmRYRs2e1KW95DfHEPehEgqEV7QZ9FyXTMAQySLZpVsQPeV5k33XCl
         3gLBNqSKIPoTakBPk07vz4/4ztXI7IvNT1LQNoPx73e3Kz2+BaANfaPWay4PjAbS1zQ3
         ozGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aMsNmM8UK83vzZ5+XKEPQyFKBDgwP0Ag1FI8s9jM8U0=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=WUo4SYIudIXIWMHOot+/SZBIY2QPGaI4OZqfqul2LBjAkHg4x7lkkDzSdko3XfoVQv
         26TL/fgfXTNHLV7rHiiDlIQtJatHiWV/oWJFRTWb12sjTiFUMQdWMiSVP6CaTd2tKu6h
         cC7Iao1coX+VEmW9QlJ29R6fdXhAt24u6Fz9g+6ZpaX05SI4icm0pZCYE9PO2TL1b2eb
         N9P3S4qfumCpZ2l/z6QfFzUjNAk9d1OCal6jo+D3Gq8KRLQNkIiTdna5+WAkZNdB6bW3
         WglhIHxaq+8DvZaaJdgZtxKa8VlFvRYyVPM9qFb/XH1wLuVHS+T62larYxh/MiV3mPm4
         Mtkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bt4SLfLq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a35a9csi616591785a.318.2024.09.09.09.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:23:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bt4SLfLq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snhA9-0002B2-Jt; Mon, 09 Sep 2024 12:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA7-00025P-HQ
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:22:48 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA5-0007g4-7X
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:22:47 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-20573eb852aso36874515ad.1
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898963; x=1726503763; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMsNmM8UK83vzZ5+XKEPQyFKBDgwP0Ag1FI8s9jM8U0=;
 b=Bt4SLfLq7qQw8/6E1nkgTTvEqtMn3ed/+7ZSCVWIowqHa3ozIJSBKaCLLF4oOLP5D7
 ll1g8bPlyerPG26Mtz7BXHK6fwyehl2kyRXHuJ9NgbPovpx5919hlTW4bl2mBcacli5V
 r/x7ITKPtopK3FTKQEdrcaTFhkhEJroYolL0qfTpg4OuVldPl2sN1ZrQRy5kyHBP+QCR
 nplMkgeyF7NtxEYXdy672ew/ZhcqUY+O84lB0/glWxbRWTdWjGpagGNjDN+QStwn8ac2
 PKwhd+smmZJMk9Uw2+wEGdATsolSwd3+FWiZ1a+aHtNtEyUF+ufivmL68sMDLXK6a5na
 12tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898963; x=1726503763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMsNmM8UK83vzZ5+XKEPQyFKBDgwP0Ag1FI8s9jM8U0=;
 b=isJ58feEOgBVUAFUwIvAtRNSJsTNGgSOYYTeblGBY2QP5nyMVv7paT0TI4XKT+DvX5
 HhBVZZgeSfpfnH0iLPwNWkBzDl1/C+JY/8X3TwieNNKODRO6/0N1f6w6K2LIVW3NII98
 joaFAIwSvxvAOheIurEykB2jpUMe/mqQ8OiJJjIfXgQRIMY9H4Zgwg4GVIYc/Ia4ohsr
 bBF7rO/thleJxl0UvWBiF//7+8BTzx1jRo5mLebHmnQzKSMOxOkKeTWZiYVuXCpj8vn8
 YDaWdyXyFBUW1NTFFTeF936laGPZBXu9sCqhb0Ge1e2P0eRVN2EKlutE2WrpOBjZ9XLT
 BYzw==
X-Gm-Message-State: AOJu0Yyfgad2omjmojaPV6iKgEIQ685wTDiGCNSrM++ThImu7IBUoB6I
 6lzi6ApY15nqVNrmCMOfvMiYz5ZPoBvfjAConljTIDnolvuEZNs4ZOCwjrMkcdWOCZcqYgK3z6C
 3
X-Received: by 2002:a17:903:41cd:b0:1fd:6033:f94e with SMTP id
 d9443c01a7336-20743c482d7mr2201565ad.27.1725898963376; 
 Mon, 09 Sep 2024 09:22:43 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/29] target/arm: Replace tcg_gen_dupi_vec with constants
 in translate-sve.c
Date: Mon,  9 Sep 2024 09:22:12 -0700
Message-ID: <20240909162240.647173-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xw2yUcAV0S+S

Instead of copying a constant into a temporary with dupi,
use a vector constant directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 128 +++++++++++++--------------------
 1 file changed, 49 insertions(+), 79 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 9e2536dfe9..49d32fabc9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -6081,9 +6081,9 @@ static void gen_sshll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
 
     if (top) {
         if (shl == halfbits) {
-            TCGv_vec t = tcg_temp_new_vec_matching(d);
-            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
-            tcg_gen_and_vec(vece, d, n, t);
+            tcg_gen_and_vec(vece, d, n,
+                            tcg_constant_vec_matching(d, vece,
+                                MAKE_64BIT_MASK(halfbits, halfbits)));
         } else {
             tcg_gen_sari_vec(vece, d, n, halfbits);
             tcg_gen_shli_vec(vece, d, d, shl);
@@ -6138,18 +6138,18 @@ static void gen_ushll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
 
     if (top) {
         if (shl == halfbits) {
-            TCGv_vec t = tcg_temp_new_vec_matching(d);
-            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
-            tcg_gen_and_vec(vece, d, n, t);
+            tcg_gen_and_vec(vece, d, n,
+                            tcg_constant_vec_matching(d, vece,
+                                MAKE_64BIT_MASK(halfbits, halfbits)));
         } else {
             tcg_gen_shri_vec(vece, d, n, halfbits);
             tcg_gen_shli_vec(vece, d, d, shl);
         }
     } else {
         if (shl == 0) {
-            TCGv_vec t = tcg_temp_new_vec_matching(d);
-            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
-            tcg_gen_and_vec(vece, d, n, t);
+            tcg_gen_and_vec(vece, d, n,
+                            tcg_constant_vec_matching(d, vece,
+                                MAKE_64BIT_MASK(0, halfbits)));
         } else {
             tcg_gen_shli_vec(vece, d, n, halfbits);
             tcg_gen_shri_vec(vece, d, d, halfbits - shl);
@@ -6317,18 +6317,14 @@ static const TCGOpcode sqxtn_list[] = {
 
 static void gen_sqxtnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     int64_t mask = (1ull << halfbits) - 1;
     int64_t min = -1ull << (halfbits - 1);
     int64_t max = -min - 1;
 
-    tcg_gen_dupi_vec(vece, t, min);
-    tcg_gen_smax_vec(vece, d, n, t);
-    tcg_gen_dupi_vec(vece, t, max);
-    tcg_gen_smin_vec(vece, d, d, t);
-    tcg_gen_dupi_vec(vece, t, mask);
-    tcg_gen_and_vec(vece, d, d, t);
+    tcg_gen_smax_vec(vece, d, n, tcg_constant_vec_matching(d, vece, min));
+    tcg_gen_smin_vec(vece, d, d, tcg_constant_vec_matching(d, vece, max));
+    tcg_gen_and_vec(vece, d, d, tcg_constant_vec_matching(d, vece, mask));
 }
 
 static const GVecGen2 sqxtnb_ops[3] = {
@@ -6349,19 +6345,15 @@ TRANS_FEAT(SQXTNB, aa64_sve2, do_narrow_extract, a, sqxtnb_ops)
 
 static void gen_sqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     int64_t mask = (1ull << halfbits) - 1;
     int64_t min = -1ull << (halfbits - 1);
     int64_t max = -min - 1;
 
-    tcg_gen_dupi_vec(vece, t, min);
-    tcg_gen_smax_vec(vece, n, n, t);
-    tcg_gen_dupi_vec(vece, t, max);
-    tcg_gen_smin_vec(vece, n, n, t);
+    tcg_gen_smax_vec(vece, n, n, tcg_constant_vec_matching(d, vece, min));
+    tcg_gen_smin_vec(vece, n, n, tcg_constant_vec_matching(d, vece, max));
     tcg_gen_shli_vec(vece, n, n, halfbits);
-    tcg_gen_dupi_vec(vece, t, mask);
-    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_gen_bitsel_vec(vece, d, tcg_constant_vec_matching(d, vece, mask), d, n);
 }
 
 static const GVecGen2 sqxtnt_ops[3] = {
@@ -6389,12 +6381,10 @@ static const TCGOpcode uqxtn_list[] = {
 
 static void gen_uqxtnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     int64_t max = (1ull << halfbits) - 1;
 
-    tcg_gen_dupi_vec(vece, t, max);
-    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_gen_umin_vec(vece, d, n, tcg_constant_vec_matching(d, vece, max));
 }
 
 static const GVecGen2 uqxtnb_ops[3] = {
@@ -6415,14 +6405,13 @@ TRANS_FEAT(UQXTNB, aa64_sve2, do_narrow_extract, a, uqxtnb_ops)
 
 static void gen_uqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     int64_t max = (1ull << halfbits) - 1;
+    TCGv_vec maxv = tcg_constant_vec_matching(d, vece, max);
 
-    tcg_gen_dupi_vec(vece, t, max);
-    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_umin_vec(vece, n, n, maxv);
     tcg_gen_shli_vec(vece, n, n, halfbits);
-    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_gen_bitsel_vec(vece, d, maxv, d, n);
 }
 
 static const GVecGen2 uqxtnt_ops[3] = {
@@ -6450,14 +6439,11 @@ static const TCGOpcode sqxtun_list[] = {
 
 static void gen_sqxtunb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     int64_t max = (1ull << halfbits) - 1;
 
-    tcg_gen_dupi_vec(vece, t, 0);
-    tcg_gen_smax_vec(vece, d, n, t);
-    tcg_gen_dupi_vec(vece, t, max);
-    tcg_gen_umin_vec(vece, d, d, t);
+    tcg_gen_smax_vec(vece, d, n, tcg_constant_vec_matching(d, vece, 0));
+    tcg_gen_umin_vec(vece, d, d, tcg_constant_vec_matching(d, vece, max));
 }
 
 static const GVecGen2 sqxtunb_ops[3] = {
@@ -6478,16 +6464,14 @@ TRANS_FEAT(SQXTUNB, aa64_sve2, do_narrow_extract, a, sqxtunb_ops)
 
 static void gen_sqxtunt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     int64_t max = (1ull << halfbits) - 1;
+    TCGv_vec maxv = tcg_constant_vec_matching(d, vece, max);
 
-    tcg_gen_dupi_vec(vece, t, 0);
-    tcg_gen_smax_vec(vece, n, n, t);
-    tcg_gen_dupi_vec(vece, t, max);
-    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_smax_vec(vece, n, n, tcg_constant_vec_matching(d, vece, 0));
+    tcg_gen_umin_vec(vece, n, n, maxv);
     tcg_gen_shli_vec(vece, n, n, halfbits);
-    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_gen_bitsel_vec(vece, d, maxv, d, n);
 }
 
 static const GVecGen2 sqxtunt_ops[3] = {
@@ -6551,13 +6535,11 @@ static void gen_shrnb64_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
 
 static void gen_shrnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     uint64_t mask = MAKE_64BIT_MASK(0, halfbits);
 
     tcg_gen_shri_vec(vece, n, n, shr);
-    tcg_gen_dupi_vec(vece, t, mask);
-    tcg_gen_and_vec(vece, d, n, t);
+    tcg_gen_and_vec(vece, d, n, tcg_constant_vec_matching(d, vece, mask));
 }
 
 static const TCGOpcode shrnb_vec_list[] = { INDEX_op_shri_vec, 0 };
@@ -6609,13 +6591,11 @@ static void gen_shrnt64_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
 
 static void gen_shrnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     uint64_t mask = MAKE_64BIT_MASK(0, halfbits);
 
     tcg_gen_shli_vec(vece, n, n, halfbits - shr);
-    tcg_gen_dupi_vec(vece, t, mask);
-    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_gen_bitsel_vec(vece, d, tcg_constant_vec_matching(d, vece, mask), d, n);
 }
 
 static const TCGOpcode shrnt_vec_list[] = { INDEX_op_shli_vec, 0 };
@@ -6658,14 +6638,12 @@ TRANS_FEAT(RSHRNT, aa64_sve2, do_shr_narrow, a, rshrnt_ops)
 static void gen_sqshrunb_vec(unsigned vece, TCGv_vec d,
                              TCGv_vec n, int64_t shr)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
+    uint64_t max = MAKE_64BIT_MASK(0, halfbits);
 
     tcg_gen_sari_vec(vece, n, n, shr);
-    tcg_gen_dupi_vec(vece, t, 0);
-    tcg_gen_smax_vec(vece, n, n, t);
-    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
-    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_gen_smax_vec(vece, n, n, tcg_constant_vec_matching(d, vece, 0));
+    tcg_gen_umin_vec(vece, d, n, tcg_constant_vec_matching(d, vece, max));
 }
 
 static const TCGOpcode sqshrunb_vec_list[] = {
@@ -6690,16 +6668,15 @@ TRANS_FEAT(SQSHRUNB, aa64_sve2, do_shr_narrow, a, sqshrunb_ops)
 static void gen_sqshrunt_vec(unsigned vece, TCGv_vec d,
                              TCGv_vec n, int64_t shr)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
+    uint64_t max = MAKE_64BIT_MASK(0, halfbits);
+    TCGv_vec maxv = tcg_constant_vec_matching(d, vece, max);
 
     tcg_gen_sari_vec(vece, n, n, shr);
-    tcg_gen_dupi_vec(vece, t, 0);
-    tcg_gen_smax_vec(vece, n, n, t);
-    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
-    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_smax_vec(vece, n, n, tcg_constant_vec_matching(d, vece, 0));
+    tcg_gen_umin_vec(vece, n, n, maxv);
     tcg_gen_shli_vec(vece, n, n, halfbits);
-    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_gen_bitsel_vec(vece, d, maxv, d, n);
 }
 
 static const TCGOpcode sqshrunt_vec_list[] = {
@@ -6742,18 +6719,15 @@ TRANS_FEAT(SQRSHRUNT, aa64_sve2, do_shr_narrow, a, sqrshrunt_ops)
 static void gen_sqshrnb_vec(unsigned vece, TCGv_vec d,
                             TCGv_vec n, int64_t shr)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     int64_t max = MAKE_64BIT_MASK(0, halfbits - 1);
     int64_t min = -max - 1;
+    int64_t mask = MAKE_64BIT_MASK(0, halfbits);
 
     tcg_gen_sari_vec(vece, n, n, shr);
-    tcg_gen_dupi_vec(vece, t, min);
-    tcg_gen_smax_vec(vece, n, n, t);
-    tcg_gen_dupi_vec(vece, t, max);
-    tcg_gen_smin_vec(vece, n, n, t);
-    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
-    tcg_gen_and_vec(vece, d, n, t);
+    tcg_gen_smax_vec(vece, n, n, tcg_constant_vec_matching(d, vece, min));
+    tcg_gen_smin_vec(vece, n, n, tcg_constant_vec_matching(d, vece, max));
+    tcg_gen_and_vec(vece, d, n, tcg_constant_vec_matching(d, vece, mask));
 }
 
 static const TCGOpcode sqshrnb_vec_list[] = {
@@ -6778,19 +6752,16 @@ TRANS_FEAT(SQSHRNB, aa64_sve2, do_shr_narrow, a, sqshrnb_ops)
 static void gen_sqshrnt_vec(unsigned vece, TCGv_vec d,
                              TCGv_vec n, int64_t shr)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
     int64_t max = MAKE_64BIT_MASK(0, halfbits - 1);
     int64_t min = -max - 1;
+    int64_t mask = MAKE_64BIT_MASK(0, halfbits);
 
     tcg_gen_sari_vec(vece, n, n, shr);
-    tcg_gen_dupi_vec(vece, t, min);
-    tcg_gen_smax_vec(vece, n, n, t);
-    tcg_gen_dupi_vec(vece, t, max);
-    tcg_gen_smin_vec(vece, n, n, t);
+    tcg_gen_smax_vec(vece, n, n, tcg_constant_vec_matching(d, vece, min));
+    tcg_gen_smin_vec(vece, n, n, tcg_constant_vec_matching(d, vece, max));
     tcg_gen_shli_vec(vece, n, n, halfbits);
-    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
-    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_gen_bitsel_vec(vece, d, tcg_constant_vec_matching(d, vece, mask), d, n);
 }
 
 static const TCGOpcode sqshrnt_vec_list[] = {
@@ -6833,12 +6804,11 @@ TRANS_FEAT(SQRSHRNT, aa64_sve2, do_shr_narrow, a, sqrshrnt_ops)
 static void gen_uqshrnb_vec(unsigned vece, TCGv_vec d,
                             TCGv_vec n, int64_t shr)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
+    int64_t max = MAKE_64BIT_MASK(0, halfbits);
 
     tcg_gen_shri_vec(vece, n, n, shr);
-    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
-    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_gen_umin_vec(vece, d, n, tcg_constant_vec_matching(d, vece, max));
 }
 
 static const TCGOpcode uqshrnb_vec_list[] = {
@@ -6863,14 +6833,14 @@ TRANS_FEAT(UQSHRNB, aa64_sve2, do_shr_narrow, a, uqshrnb_ops)
 static void gen_uqshrnt_vec(unsigned vece, TCGv_vec d,
                             TCGv_vec n, int64_t shr)
 {
-    TCGv_vec t = tcg_temp_new_vec_matching(d);
     int halfbits = 4 << vece;
+    int64_t max = MAKE_64BIT_MASK(0, halfbits);
+    TCGv_vec maxv = tcg_constant_vec_matching(d, vece, max);
 
     tcg_gen_shri_vec(vece, n, n, shr);
-    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
-    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_umin_vec(vece, n, n, maxv);
     tcg_gen_shli_vec(vece, n, n, halfbits);
-    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_gen_bitsel_vec(vece, d, maxv, d, n);
 }
 
 static const TCGOpcode uqshrnt_vec_list[] = {
-- 
2.43.0

