Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4195376njb;
        Wed, 11 Dec 2024 08:40:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXA2bVi4wGLSQ3zCIrFUQ8FQqoXduxOHBOJo4Upz/RHYBdtCrGQecX/8gJrbaoqQ0FDBcxr9ieOCoANow==@linaro.org
X-Google-Smtp-Source: AGHT+IEZXZN+EBHYMWKFrUXx60PhAIsz2C2mWvm3PxiRal7pZi3Slv/eGaFsFvTVzXy/du1Ih0e2
X-Received: by 2002:a05:620a:628e:b0:7b1:3f88:48ef with SMTP id af79cd13be357-7b6eb4fdb05mr512719785a.46.1733935217156;
        Wed, 11 Dec 2024 08:40:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935217; cv=none;
        d=google.com; s=arc-20240605;
        b=CWL3CSfmnq8/BTndSR6SkwdxK9ZtR617xb8IPHRE8GKv+vA2a7VT/gi2U2ppXBzE6x
         bIRQJvanthfOrNI7g3+LFx6BfhOZTMfbxP1sSpDyxxIjlrCI9HlVA7WeuTQHUgOEurdx
         jzFRGP9sP01AIQv6XErXWSz55R5mNgEbCyI3IilBMplcDeZ+9JGf33t14GIhZsk4fGTg
         DQMDheShk9apZGjPrQAYRH965J9H9Tm7rlPECA1Gt9zu9K2mdRMI/728octDIWwRSZqX
         xkXvnFHt0CwfGv66sn6rceRGAaqqwKQOn5XHLG8waMHo6JLoDG+EbFLAjOgcklkKRa2O
         gTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/lj9qTaRMEepyhNy18XDaVZRLAOfWJDrTDDoQoevOKs=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=H3v3f3zrKt0Rgi/8QQ6XDlo1276+Eq9C7xnKdVU8Q91jmSg3Uz0zy5TIE3whjcOg6z
         sLHOoQBIGJJjPPkhtimFXeOnbntbbJdWQ1NWfIvGaaOSU0AviFUC1GeSWQ0VgAjCEAoO
         Di4fjWMNv8TCncEJcpHOSz7KoH6/SSIvqsVOsCzOt9I0ZdSZf7zMPTN7d2KLK6wXMgzj
         /7fwt8YaT8ZeYizMd+kZ0OiLn0YP5zRYo/lzDtXNHn/jme30QIVV3Kc9WAoxJHcX2eEK
         mEwnQxe+6bnQQ3eR9SYrcxBKHLSku77F1mI4gySxulhajcgha/jSv7KBuY8ENOiAiFUh
         c49A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZEjR1ycx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6e7f19febsi406868985a.67.2024.12.11.08.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:40:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZEjR1ycx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLPhH-0007Ub-Rd; Wed, 11 Dec 2024 11:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgu-0006Cy-Hz
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:36:00 -0500
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgs-000255-H4
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:36:00 -0500
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6d87ceb58a0so55617486d6.0
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 08:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934957; x=1734539757; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lj9qTaRMEepyhNy18XDaVZRLAOfWJDrTDDoQoevOKs=;
 b=ZEjR1ycxvuyOv7SkNiUJC6rDVBwdZn9oSr13uewacQIp/+e6t+bfX8PP6HjV6o9fUV
 f1xXDzMeTB4jHjZYRGD73QqYhUNx2FFNXBGYQCoF6wVTKa/ufm78hFUWNsUDknZwdJVb
 jqIyClJZEyU/oQT1Cu6kC20XJGfjgZvTDCgdmScP7sPMz0bw8jX56ZigelVEBW7/Wr1A
 x6lSw/pWO9ZC+msKHAxoPwGF/xd3ZzDkmSxRHEYsoJwHPfjKFNEDpOHgwrt3GHLh3AnW
 BllSEQ1cFkMoculCBC8V1/JS0Qja+U1zoHHHHX8N1lzwHjoViuTS2aGuE1wZ7IJVCoCM
 +DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934957; x=1734539757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lj9qTaRMEepyhNy18XDaVZRLAOfWJDrTDDoQoevOKs=;
 b=Zup7YaZA+dKebfqktQ1WOKQhLCpr//TDAqKEZHMThoOd/n6To5ME/R0JFPs74w8nh6
 uG8iZNMxz3uM/0RsGmDZPF90wDeXAwkhQpb/xdE7j3UsrQu2iyLZ9iBpSidWPsQNJtFT
 j+gynB3CyzNuGIVu1swlPfR8jgZGfsoUvdi8FDC/KBQj+l+EPapHy6zQx3bAfrwR0ZUs
 cSbjMIkIdgzIgpU3CIRXBB+8d/OOX21DdbIQ69CmjArnzTBfgk2ZswEo9TdkqzVVTQZ2
 qGFyqYbFUlBObP0GiaQ+f5wqX4gfQfE+gs2Qx65FRphiK1mfDlwWXK+ol1PSDdUjLm19
 M3rA==
X-Gm-Message-State: AOJu0YyQ2i/Go6ACB413JGijf5TpebdlzhbRcU/laCP5/msQnhAcX+3Z
 w+UsyzrINk3pxXoAdMRTPURfFKsGLgUDyeXe53ldePROkMmFFpkHEQosbT/scXE1JejXHwjz24S
 wZHjhqZx+
X-Gm-Gg: ASbGncv51r6xG1HEjhPDPLpmsjuolK27WmbdpYOuehcP8u8QOHZivvxDq1caKRpfZ2l
 5YoT2tQRO1/eMLTBBgLx77XYF04SH9baaeu9f9Kg74ypJmxXk1I4trmBjMn7KeYcnkU5ZeShezs
 0ut1ZPX1xOx8iOX/U6FmFKNogdkkILJiBpwjvDPtxBsGlfGmxGunMCLq0uFckRCbhuB2CAITeqO
 4L4mwoyVQ0EPanHYV+eyewg5BIgvtA1xD1QXhtXWJNBcovQF0ATDRpSaDQlJQ==
X-Received: by 2002:a05:6214:246c:b0:6d8:a570:faee with SMTP id
 6a1803df08f44-6d934ae9705mr56011706d6.16.1733934957578; 
 Wed, 11 Dec 2024 08:35:57 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:35:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 47/69] target/arm: Remove helper_neon_{add,sub}l_u{16,32}
Date: Wed, 11 Dec 2024 10:30:14 -0600
Message-ID: <20241211163036.2297116-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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
X-TUID: izDZ/VVdxZPl

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

