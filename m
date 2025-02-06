Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1777059njb;
        Thu, 6 Feb 2025 11:57:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZz5RFZbzTcPbnqrDcNDhhiZmAFODu1z3r6q0kTBcwmCoq6ZJsenM1SqccYY8y0OpSTr+nViHeZWCqKw==@linaro.org
X-Google-Smtp-Source: AGHT+IFvhKF4ssNMgX7ebpG8qx0HaZ2gcGLThTXdE0/iBsQY9fPjZ9UvTSk25+jQDIMQv4xY48mC
X-Received: by 2002:a05:620a:2403:b0:7b7:342:a0a5 with SMTP id af79cd13be357-7c047ca805emr79204985a.55.1738871869485;
        Thu, 06 Feb 2025 11:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738871869; cv=none;
        d=google.com; s=arc-20240605;
        b=kYl+gicD94l09ca2GnyANdaqmBnTpZW9GgOrkfMmS6dSi3ap0N2h6dAiZLaJwLmSxO
         wPM9oG7ISsQT07ohVJBx9ASMR4T4j0SVNalDeKplsseatgYJQyRnKwSZmw3eOGKQ6EWK
         P9kJPTvnV19aLeFfYSjGXlTrtyyYQXGAtXykv2LedscZwku2spa+h/DjbCiQ1tWTb8fD
         7b4PganZ7X2pTQoXbBnlWFc7xws4REyxr8Cc2v2Mr3+leIRrEmagF8t6gDI2iapEafQH
         0gKjJADSjiWQBR0STcd/dicouANe4yPg1XHqCKXIbidEXOt1VRIuen9Wj4mZpfxSBNBN
         8usQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PdvwNl7JiFORoJKfG82WHoJWKQvzz977qK5CdHrmdQk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Dt8d9MJOenbaiizqaEEJAqhcGqWSpvbIelhjLKKjG9r6ei6SRSoUhVcl1/TQj5xnyg
         cwqmD4ZjYKq4kFAMp4iTPzFNIiJUoEwjbT8YqzMxUD7ALBPiT92uRYFhlH5I/2amRSrY
         jY+j72YoRz/5Ve3M7yytNcj9w+9104TEsq0hDdNT0Yg1y9vrPYCIwyDN75AK3+RC66QT
         oeymXoZcAENFAUJmCX2DX1C7h60vwK1gQ+IzUM0qnjYYMagXWYtegiaW6SB6bboINJ8A
         fvkxkeXi7dEd7G+4elIN1Ob3hyeBEPCysbcn1Iw7qv7dMGi+ZI+svprLiQSNJP+iAPrF
         xsFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYNmus+A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ed0f10si174363785a.500.2025.02.06.11.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 11:57:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYNmus+A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg809-0007Bl-UO; Thu, 06 Feb 2025 14:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg802-00076Q-HZ
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:22 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg7zz-0000RC-OY
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:22 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21f20666e72so28699425ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871838; x=1739476638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdvwNl7JiFORoJKfG82WHoJWKQvzz977qK5CdHrmdQk=;
 b=bYNmus+A/tGnDLhFYxZglXmMieUUR14Fkg2KZ+LjsYl6rDs46iB1O44+6ugKlDlWss
 ijadoSO3AvLGCHLx3sZY06PRs2pDlfr+7Zi2YoS/abz/sCdIdIfDCOKBMWjNKEW3+bhV
 wAMOauCNLsnE9nYsjbpgJwZDivdJYPbk5ekeh3jV1RyrPEQUf70ZsJNbM/NSaBJNQl1P
 nwXGErettlmykLtMyceR3x5R78BFQUFwdmtr+zo6V2kJDhqXuqE0bj05baF3KEfqjLCh
 RBfC0RUSu0L8wZS2Zc89XRduM4Lp1tZED7IPOOVv2aL5JvEBXVL4OkWqB45O28szCUyp
 nvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871838; x=1739476638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PdvwNl7JiFORoJKfG82WHoJWKQvzz977qK5CdHrmdQk=;
 b=oBIjcGVnyUTRHjylyQq4k6jfZll4CpuFaqFXAj5F9x/E/ef8Vr7CfuflbIvejfxUod
 WkbBVL5hhmJTmZYytN9wsYfKd91yJIRA+SMDHjw3Xb+pz0uxCbV2CWp3R8zUWTjn9tvl
 VbmdVkfzZCmVQuo44w3KxdtJLnQjzEwjE6N0rttSVmxOaksZ5aPLdDBlh+u5LI82dNfH
 6SeP4P1etW1sJOxd/PGD3gmfur14CgnSMd7NpzX2WJ+nc8yf+9Ck/vRFMWZ3D9HSxLP4
 UQCHfB9wQ/EhenZFsmLGFe3hlY6lLJ20uFPB1dfTWuOiZNean+QdzvMROgiuZm0SawiI
 G8iQ==
X-Gm-Message-State: AOJu0Ywzii1NIn0Gsx0YM2z9oMWszY+tU/iDQ9uMFVN0+SgukkIf7RfN
 Y+Hjaf+6vit44D2DRTUuJy9XR4oVuFtoaCb8Kqw7TY0Am3NzaOyG9V3AvOtYKdkybGuDvC0mgbZ
 8
X-Gm-Gg: ASbGncsYIYXuQ5zDPyMMP+H0y2bJR37lSv7pQMGQuvguDYs0q4Yw9STCIJP5HTLIIhm
 oMaQtqkqqaqFVNB5iUiT5b6ELCEkJ/TezdtWsHcOb/l71TovuR+mbHEavkgUw2ELFGaaNjLZ5Fw
 j4xl50VO9siGG5TXocebcmWeqg/fEotTE2YcN03mXcQDy/6Bc4ooxgranoLeQ7PLpzLNU71B2BL
 7YwS3W5Jk6Yceuq5pS1Y4TBZoPjC9742yXUnTh9Tk2CE7fbbnr4IcVBtdsJIxikIm7Deo7Tot5A
 1s63GA39OnNzbRSl52Z7oZV5qIrNpXCk98XFAvVkWst2KG4=
X-Received: by 2002:a05:6a00:1da9:b0:72a:bc6a:3a87 with SMTP id
 d2e1a72fcca58-7305d2d04f0mr986172b3a.0.1738871838254; 
 Thu, 06 Feb 2025 11:57:18 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/61] tcg: Add dbase argument to do_dup
Date: Thu,  6 Feb 2025 11:56:16 -0800
Message-ID: <20250206195715.2150758-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: ykI7MxCFkdsl

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 1aad7b0864..451091753d 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -534,9 +534,9 @@ static void do_dup_store(TCGType type, TCGv_ptr dbase, uint32_t dofs,
  * Only one of IN_32 or IN_64 may be set;
  * IN_C is used if IN_32 and IN_64 are unset.
  */
-static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
-                   uint32_t maxsz, TCGv_i32 in_32, TCGv_i64 in_64,
-                   uint64_t in_c)
+static void do_dup(unsigned vece, TCGv_ptr dbase, uint32_t dofs,
+                   uint32_t oprsz, uint32_t maxsz,
+                   TCGv_i32 in_32, TCGv_i64 in_64, uint64_t in_c)
 {
     TCGType type;
     TCGv_i64 t_64;
@@ -574,7 +574,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         } else {
             tcg_gen_dupi_vec(vece, t_vec, in_c);
         }
-        do_dup_store(type, tcg_env, dofs, oprsz, maxsz, t_vec);
+        do_dup_store(type, dbase, dofs, oprsz, maxsz, t_vec);
         return;
     }
 
@@ -618,14 +618,14 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         /* Implement inline if we picked an implementation size above.  */
         if (t_32) {
             for (i = 0; i < oprsz; i += 4) {
-                tcg_gen_st_i32(t_32, tcg_env, dofs + i);
+                tcg_gen_st_i32(t_32, dbase, dofs + i);
             }
             tcg_temp_free_i32(t_32);
             goto done;
         }
         if (t_64) {
             for (i = 0; i < oprsz; i += 8) {
-                tcg_gen_st_i64(t_64, tcg_env, dofs + i);
+                tcg_gen_st_i64(t_64, dbase, dofs + i);
             }
             tcg_temp_free_i64(t_64);
             goto done;
@@ -634,7 +634,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
 
     /* Otherwise implement out of line.  */
     t_ptr = tcg_temp_ebb_new_ptr();
-    tcg_gen_addi_ptr(t_ptr, tcg_env, dofs);
+    tcg_gen_addi_ptr(t_ptr, dbase, dofs);
 
     /*
      * This may be expand_clr for the tail of an operation, e.g.
@@ -710,7 +710,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
 /* Likewise, but with zero.  */
 static void expand_clr(uint32_t dofs, uint32_t maxsz)
 {
-    do_dup(MO_8, dofs, maxsz, maxsz, NULL, NULL, 0);
+    do_dup(MO_8, tcg_env, dofs, maxsz, maxsz, NULL, NULL, 0);
 }
 
 /* Expand OPSZ bytes worth of two-operand operations using i32 elements.  */
@@ -1711,7 +1711,7 @@ void tcg_gen_gvec_dup_i32(unsigned vece, uint32_t dofs, uint32_t oprsz,
 {
     check_size_align(oprsz, maxsz, dofs);
     tcg_debug_assert(vece <= MO_32);
-    do_dup(vece, dofs, oprsz, maxsz, in, NULL, 0);
+    do_dup(vece, tcg_env, dofs, oprsz, maxsz, in, NULL, 0);
 }
 
 void tcg_gen_gvec_dup_i64(unsigned vece, uint32_t dofs, uint32_t oprsz,
@@ -1719,7 +1719,7 @@ void tcg_gen_gvec_dup_i64(unsigned vece, uint32_t dofs, uint32_t oprsz,
 {
     check_size_align(oprsz, maxsz, dofs);
     tcg_debug_assert(vece <= MO_64);
-    do_dup(vece, dofs, oprsz, maxsz, NULL, in, 0);
+    do_dup(vece, tcg_env, dofs, oprsz, maxsz, NULL, in, 0);
 }
 
 void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -1745,12 +1745,12 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
                 tcg_gen_ld_i32(in, tcg_env, aofs);
                 break;
             }
-            do_dup(vece, dofs, oprsz, maxsz, in, NULL, 0);
+            do_dup(vece, tcg_env, dofs, oprsz, maxsz, in, NULL, 0);
             tcg_temp_free_i32(in);
         } else {
             TCGv_i64 in = tcg_temp_ebb_new_i64();
             tcg_gen_ld_i64(in, tcg_env, aofs);
-            do_dup(vece, dofs, oprsz, maxsz, NULL, in, 0);
+            do_dup(vece, tcg_env, dofs, oprsz, maxsz, NULL, in, 0);
             tcg_temp_free_i64(in);
         }
     } else if (vece == 4) {
@@ -1833,7 +1833,7 @@ void tcg_gen_gvec_dup_imm(unsigned vece, uint32_t dofs, uint32_t oprsz,
                           uint32_t maxsz, uint64_t x)
 {
     check_size_align(oprsz, maxsz, dofs);
-    do_dup(vece, dofs, oprsz, maxsz, NULL, NULL, x);
+    do_dup(vece, tcg_env, dofs, oprsz, maxsz, NULL, NULL, x);
 }
 
 void tcg_gen_gvec_not(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -3772,7 +3772,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned vece, uint32_t dofs,
     check_overlap_3(dofs, aofs, bofs, maxsz);
 
     if (cond == TCG_COND_NEVER || cond == TCG_COND_ALWAYS) {
-        do_dup(MO_8, dofs, oprsz, maxsz,
+        do_dup(MO_8, tcg_env, dofs, oprsz, maxsz,
                NULL, NULL, -(cond == TCG_COND_ALWAYS));
         return;
     }
@@ -3892,7 +3892,7 @@ void tcg_gen_gvec_cmps(TCGCond cond, unsigned vece, uint32_t dofs,
     check_overlap_2(dofs, aofs, maxsz);
 
     if (cond == TCG_COND_NEVER || cond == TCG_COND_ALWAYS) {
-        do_dup(MO_8, dofs, oprsz, maxsz,
+        do_dup(MO_8, tcg_env, dofs, oprsz, maxsz,
                NULL, NULL, -(cond == TCG_COND_ALWAYS));
         return;
     }
-- 
2.43.0

