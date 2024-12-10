Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3444296njb;
        Tue, 10 Dec 2024 08:27:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXPSgXcfqaqUNAycb6TkSEwxFhQHAljswan+hpKjwOxCs05du/tbEduqX+8GarK9sjN2WV+w5fdJF9K+A==@linaro.org
X-Google-Smtp-Source: AGHT+IGBSuUimjxk5YMlHrKMe1UV2teTPRrmptFy2aSYe1Q+sc/TwZUMPd461b5ViQfIryzGL3Pj
X-Received: by 2002:a05:6102:945:b0:4af:edb4:7d55 with SMTP id ada2fe7eead31-4afedb47eb5mr9567835137.9.1733848059064;
        Tue, 10 Dec 2024 08:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733848059; cv=none;
        d=google.com; s=arc-20240605;
        b=JsZWvBU7Y4R/b9HqRDNgV+5ds2YqOcehSS5NzIf+d4l9zT+VhZfDlLH+CpKR/zFWO6
         uP1tBUYPnY5VqskxYR0XaZ2G83K2iyK9cl19Rzo/mBL9Eo22gFOozchkVyUAx//YP+Bj
         SBQ5N018+xH2WB+m1NwPbMWprBjjLh1tQvAw2xEPRaFVnPVWTqHLRwVwo6Ipqy/BfJ64
         6Nm8ZHm8JeeWhuINGWqUqRVwCail5Q7w+rZ91NQJ5o4PGKOyV5lGzcngvxfm+ctlfJSA
         Goe9NOEQFHfnwvgSanJVxnQ71HZPBC8YkKXdBKhnvELPGy9FQwIKv6y62rsXNVQ6cYzg
         Rd7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/lj9qTaRMEepyhNy18XDaVZRLAOfWJDrTDDoQoevOKs=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=XvsTcNoCEdtoli/I+T4bbVX3GH9Bq2TlgkSN6SNooxTW84/acWQeoFn00DsJd61NTK
         WaSs5m2hZeNQSH6N9Hq565teFkGJJ4l+ojfY9QxxO2NZWVwBQudR9F3t79yRdmswwCjV
         6kenlsSBy3DeN+elGS7Y4SQb8QDxxownoKeR8UraylELu2dcWnTmwxnpXublLzNOWCMT
         wgjPzFY2mP6pbjuYy3QZHOsP7iQw+iJKhoVjKxTkEh2DURNOxPZNs1Yw5KiLjtVkmbbR
         Z418AcRKxXdHXVfVHW0UDv9R1bdQRY1ha8eBaVNDsB10qiFrHDhA8gLIXJLDw0fvRAMS
         +3lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vF6JOrxs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aff611ed98si1115341137.219.2024.12.10.08.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vF6JOrxs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tL31q-00071g-7c; Tue, 10 Dec 2024 11:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL31l-0006ju-G5
 for qemu-devel@nongnu.org; Tue, 10 Dec 2024 11:24:01 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL31j-0007RH-IL
 for qemu-devel@nongnu.org; Tue, 10 Dec 2024 11:24:01 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso2540117e87.3
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2024 08:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847838; x=1734452638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lj9qTaRMEepyhNy18XDaVZRLAOfWJDrTDDoQoevOKs=;
 b=vF6JOrxsaT7R25JwtHS38K31huR5juDfD06IKny63NubmcLjsIoSBa43WRzLNibhv1
 0op1++bU86EGoUfBYMOA76+JMHyRK9uOUc2DcLf/wjZAS7pBL5QXaANvIlpR19HkzjsJ
 bN0lF+68XY4+PNRtCkYk737Guinl+pgPUVhqAThu0HI5QrSbdUHxc9TIcmAsGGppeECK
 Wj5GSlPUdt7vAOXp9/jUmXkK/il0wbHJGa3+1/FMtFHPqyiBjq6vQtgnRWbpeaDlMRNg
 ZHZwkAoNIAAEch5Y5xmcfXov8qG3I8XcdD3UL09V+luslAYGWatqGl7MY2GANN+yKwme
 bBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847838; x=1734452638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lj9qTaRMEepyhNy18XDaVZRLAOfWJDrTDDoQoevOKs=;
 b=j6lOlRRruODUs7+RiD5xyvGbKh4YkFvTgk6UYWoLy3JxGZCzcFLCOWTYWO2mRtmfT6
 itB2vB09mEAlEKE2NsLS+A3mYKVU1GYKEUjm5FjeNSfXNRhxusV1Y0GZZ3kLAoDfmCnD
 4NEHV1k9dFeFpbF0hNDzbH5RhnDnM+yrSMMhHxlq6QLMe2MRAfdqAm1Iz06ibNlt25Wb
 FnEVY1twh6oExhEh+QgCFtKc4cKVmI57WHHnd9uogxWRW853WS9k9dSchzIETQ+PlFgh
 CaUNnEZgd1tRIcT7n1SjfXL1ldaRA6X9LCvgFYC2tH5qW/EpoqqP+LT70ab4ArigKS/1
 lsrQ==
X-Gm-Message-State: AOJu0YyH4Mo6Q05zZ+728mxqZ+rQAReJfvYMw4DgFuV063ECP9JfU0nI
 aii8Nlu6qrqVd90Xf8LHD3YbZk0LNiH90OX/+JliYm1TsGgOMC1G2gnluXt1Tcw1D8CuMSIO+Wh
 Cclabbbt8
X-Gm-Gg: ASbGncuXlv0dO2diGiW9gTe0BPQY1jh82MWNwAs5FPLnVkACogwBwgba817cwxA7O8g
 ARiy83zUaz3EEJp1QWD+4IX7QUPvhbXo2QWHjobc59BfDIcZZn3/L5LSgU1t9zrkChKFiG02Hcj
 5XMMFpdGgL/vldU7lbUrK4zn6nv4nShbQLZX9v+xrSA9qInj+TY8P24iM569OwD7Fw8+qF5xEia
 Vjq0mxt4lSNA1VP5tTMZCk5tRREufTtZBfdvifBBO4PPhM3qCeYBDHIOtk=
X-Received: by 2002:a19:f00c:0:b0:540:255d:b2f with SMTP id
 2adb3069b0e04-540255d158emr1173071e87.6.1733847837849; 
 Tue, 10 Dec 2024 08:23:57 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:23:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 47/69] target/arm: Remove helper_neon_{add,sub}l_u{16,32}
Date: Tue, 10 Dec 2024 10:17:11 -0600
Message-ID: <20241210161733.1830573-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sGgQ3gG9Jx62

These have generic equivalents: tcg_gen_vec_{add,sub}{16,32}_i64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  4 ----
 target/arm/tcg/neon_helper.c    | 36 ---------------------------------
 target/arm/tcg/translate-neon.c | 22 ++++++++++----------
 3 files changed, 11 insertions(+), 51 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 6369d07d05..04e422ab08 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -395,12 +395,8 @@ DEF_HELPER_1(neon_widen_s8, i64, i32)
 DEF_HELPER_1(neon_widen_u16, i64, i32)
 DEF_HELPER_1(neon_widen_s16, i64, i32)
 
-DEF_HELPER_2(neon_addl_u16, i64, i64, i64)
-DEF_HELPER_2(neon_addl_u32, i64, i64, i64)
 DEF_HELPER_FLAGS_1(neon_addlp_s8, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_1(neon_addlp_s16, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_2(neon_subl_u16, i64, i64, i64)
-DEF_HELPER_2(neon_subl_u32, i64, i64, i64)
 DEF_HELPER_3(neon_addl_saturate_s32, i64, env, i64, i64)
 DEF_HELPER_3(neon_addl_saturate_s64, i64, env, i64, i64)
 DEF_HELPER_2(neon_abdl_u16, i64, i32, i32)
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index 1a22857b5e..c687e882ad 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -826,24 +826,6 @@ uint64_t HELPER(neon_widen_s16)(uint32_t x)
     return ((uint32_t)(int16_t)x) | (high << 32);
 }
 
-uint64_t HELPER(neon_addl_u16)(uint64_t a, uint64_t b)
-{
-    uint64_t mask;
-    mask = (a ^ b) & 0x8000800080008000ull;
-    a &= ~0x8000800080008000ull;
-    b &= ~0x8000800080008000ull;
-    return (a + b) ^ mask;
-}
-
-uint64_t HELPER(neon_addl_u32)(uint64_t a, uint64_t b)
-{
-    uint64_t mask;
-    mask = (a ^ b) & 0x8000000080000000ull;
-    a &= ~0x8000000080000000ull;
-    b &= ~0x8000000080000000ull;
-    return (a + b) ^ mask;
-}
-
 /* Pairwise long add: add pairs of adjacent elements into
  * double-width elements in the result (eg _s8 is an 8x8->16 op)
  */
@@ -887,24 +869,6 @@ uint64_t HELPER(neon_addlp_s16)(uint64_t a)
     return (uint32_t)reslo | (((uint64_t)reshi) << 32);
 }
 
-uint64_t HELPER(neon_subl_u16)(uint64_t a, uint64_t b)
-{
-    uint64_t mask;
-    mask = (a ^ ~b) & 0x8000800080008000ull;
-    a |= 0x8000800080008000ull;
-    b &= ~0x8000800080008000ull;
-    return (a - b) ^ mask;
-}
-
-uint64_t HELPER(neon_subl_u32)(uint64_t a, uint64_t b)
-{
-    uint64_t mask;
-    mask = (a ^ ~b) & 0x8000000080000000ull;
-    a |= 0x8000000080000000ull;
-    b &= ~0x8000000080000000ull;
-    return (a - b) ^ mask;
-}
-
 uint64_t HELPER(neon_addl_saturate_s32)(CPUARMState *env, uint64_t a, uint64_t b)
 {
     uint32_t x, y;
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 19a18018f1..0821f10fad 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -1560,8 +1560,8 @@ static bool do_prewiden_3d(DisasContext *s, arg_3diff *a,
             NULL, NULL,                                                 \
         };                                                              \
         static NeonGenTwo64OpFn * const addfn[] = {                     \
-            gen_helper_neon_##OP##l_u16,                                \
-            gen_helper_neon_##OP##l_u32,                                \
+            tcg_gen_vec_##OP##16_i64,                                   \
+            tcg_gen_vec_##OP##32_i64,                                   \
             tcg_gen_##OP##_i64,                                         \
             NULL,                                                       \
         };                                                              \
@@ -1639,8 +1639,8 @@ static bool do_narrow_3d(DisasContext *s, arg_3diff *a,
     static bool trans_##INSN##_3d(DisasContext *s, arg_3diff *a)        \
     {                                                                   \
         static NeonGenTwo64OpFn * const addfn[] = {                     \
-            gen_helper_neon_##OP##l_u16,                                \
-            gen_helper_neon_##OP##l_u32,                                \
+            tcg_gen_vec_##OP##16_i64,                                   \
+            tcg_gen_vec_##OP##32_i64,                                   \
             tcg_gen_##OP##_i64,                                         \
             NULL,                                                       \
         };                                                              \
@@ -1761,8 +1761,8 @@ static bool trans_VABAL_S_3d(DisasContext *s, arg_3diff *a)
         NULL,
     };
     static NeonGenTwo64OpFn * const addfn[] = {
-        gen_helper_neon_addl_u16,
-        gen_helper_neon_addl_u32,
+        tcg_gen_vec_add16_i64,
+        tcg_gen_vec_add32_i64,
         tcg_gen_add_i64,
         NULL,
     };
@@ -1779,8 +1779,8 @@ static bool trans_VABAL_U_3d(DisasContext *s, arg_3diff *a)
         NULL,
     };
     static NeonGenTwo64OpFn * const addfn[] = {
-        gen_helper_neon_addl_u16,
-        gen_helper_neon_addl_u32,
+        tcg_gen_vec_add16_i64,
+        tcg_gen_vec_add32_i64,
         tcg_gen_add_i64,
         NULL,
     };
@@ -1840,8 +1840,8 @@ static bool trans_VMULL_U_3d(DisasContext *s, arg_3diff *a)
             NULL,                                                       \
         };                                                              \
         static NeonGenTwo64OpFn * const accfn[] = {                     \
-            gen_helper_neon_##ACC##l_u16,                               \
-            gen_helper_neon_##ACC##l_u32,                               \
+            tcg_gen_vec_##ACC##16_i64,                                  \
+            tcg_gen_vec_##ACC##32_i64,                                  \
             tcg_gen_##ACC##_i64,                                        \
             NULL,                                                       \
         };                                                              \
@@ -2371,7 +2371,7 @@ static bool trans_VMULL_U_2sc(DisasContext *s, arg_2scalar *a)
         };                                                              \
         static NeonGenTwo64OpFn * const accfn[] = {                     \
             NULL,                                                       \
-            gen_helper_neon_##ACC##l_u32,                               \
+            tcg_gen_vec_##ACC##32_i64,                                  \
             tcg_gen_##ACC##_i64,                                        \
             NULL,                                                       \
         };                                                              \
-- 
2.43.0

