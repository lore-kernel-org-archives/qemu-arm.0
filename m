Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2154650njk;
        Sun, 1 Dec 2024 07:17:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEfFmG4DB8OL3uTI0OTfPM5uqOpjrrWFUi3WQcE0QwLYzHTFRxoOq+KUTtcSckDPq8pmdW5EPDp5CZOA==@linaro.org
X-Google-Smtp-Source: AGHT+IHdwZCudrtu657qLzpd8RrSok2POKQglc+HgPS8eekoh/+yMd4FZ4q8sSwPKiFzhYEtAq6E
X-Received: by 2002:ac8:7c43:0:b0:466:940b:e218 with SMTP id d75a77b69052e-466b3554f0cmr280208571cf.9.1733066253355;
        Sun, 01 Dec 2024 07:17:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066253; cv=none;
        d=google.com; s=arc-20240605;
        b=WZnbfbxUmTlRNpwtfCdwxol8ExbaFXy2NsrjNcv2w2ua0kycBWxOAtc+RbXaTPD8wX
         l7NmFfkfDx+NEte7sMbJp/hSA9lgGHfJF7/sX2lbr8qZZSJI6jcBfPW4OJFz6OIQ3eNA
         m1gdVNPhI5/Y/LZWTvQuOHaeBuOLPt9I1cJrpdsvlqHGDs+F8TuXJutNcLYdj9zxJXQ6
         QCK4WotvQwOMRhGdpn1Gsvts/pYjndbgDPXJpPA4vpyDN6mz0xGfftmRanAtOmH+mQq1
         h/MDAoiNsKTl5uCpA6xUFrkQRW++k3261pt9QLBESIdkGnKo6z/l+Y3dIl7VyU4Ijdj0
         am8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ANy8s04QP4LdBdFbRQmXIcaAM1HVWTxLlWDdO7P3Ibo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=CEtgd8EEz/kMsUekYxyHaWvW05mEukcQrop697V+87+TqfdwPqV55IDa8F0ZhiuPcw
         vLHElNLtRYKUGCvNK3zsTKRNPuCH0Bm53lVrG475MShvw2C0eZcTFbhjGFjBf2ZCHUdX
         QaOE6b7p25IBtv9EzyUtiEA+++148UwViXloHbR5Ry2Fl2npyVn647hPIS7h25UusMrv
         bVGG20ncBGPfjuzOYWLB3pJbi2dZKOmZz6rGrJunDAQ8Xo906P5UnR7X2zaPoXrGTh+z
         lbiF8/c6WbA9SHP+dmxHggx+eX1vhr7MLhg2Zh0o3mEBoGmB158OTOZ21a4H4qJi+bno
         VWzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFR63GqV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156d16bfdcsi3068324e0c.270.2024.12.01.07.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:17:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFR63GqV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlWy-0001Ro-C7; Sun, 01 Dec 2024 10:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWt-0001Oa-E1
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:35 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWr-0004Eu-QX
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:35 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5f1dfb0b44dso998659eaf.2
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065592; x=1733670392; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANy8s04QP4LdBdFbRQmXIcaAM1HVWTxLlWDdO7P3Ibo=;
 b=zFR63GqVNdMd7j0A5kSU8wPchJAPojbX6ley9jlnh9wGf70uYUUcD9Td3y6RlT0SvD
 mWCgGkeNLlKu9I39BNuDZVk0JAld4ty3jvOlQjBvV2ZjxCyNJhfjc3DcPMXFxBGwe/Kp
 /0ixaotFh7WrsrSZr/7SEHM9mPY0R3AUygwF1zl08p4KZgtaexciIsZxvZ5+4aUgrC88
 jUFOJ5QpZ3h8zoKZ31/V63Z4xCov9vGXVwvQHwmJ3KQlTwlkIs2fKUbBhurnmHP+bTRB
 ZOYS0hil8x2ipskoZAflsd4YV93i3Hl1sHxarwI3v11LiumbtUzVnsirLxYrdvdgEv3o
 MPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065592; x=1733670392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANy8s04QP4LdBdFbRQmXIcaAM1HVWTxLlWDdO7P3Ibo=;
 b=ruippHXhAiatxXR8YmxD+8mtUIZlNla0SO6qYHgH8RQQzIYkHaZ2/+oAMmzaGWNwuA
 /B7S1+hxwN4kH5v3M/gsZQR7boUztCncjJUM9jacA/mFASwuGhQIFpwp1KB4EUiT+4F1
 R5q2xgn3Ik6wjtNSm0zC9WKk0dBWCx4tggTs5/G4XPJzHh0l4biMzZXaBf+8Risizyr7
 nA5aRjdNqhBBxd262wrp3lvJv8Y+yb+SxstcubokbkJ0iTQN1VPV3H5JrNnjZVHmpbZ0
 fTB0i0WHii+1AA439rQGs2itY8jRpLSFdBXMCclQdNZUVY/PjnXVk11moE/nzWar75qt
 e9Zw==
X-Gm-Message-State: AOJu0YzWszc47qCgLbpaw5NpQGLTE806B1PqvnoJeYRineSc//UUhcJt
 npYa80dIQdwFj/wKf8o2l1WHyiY6ga2IzEwhhA6gDKmbmqjB0sUa0Dmx4pLBSXTg9e4RCSiAgqi
 kWnI=
X-Gm-Gg: ASbGncsUGx30O2cUTHSaixFUL3uOua/mG3Vbs6aWb4Fbo2JpM/Vzrb9u+wpoJblSnd2
 MbBCkGNWnNuRa13//ndg9JTOeObl8mgHEKkRZsk1ZXBWQAl2ASq71LpUjNAkdI0h+Idoxv7duyo
 LdrAvxKkEuqDO/3cTc9mXvtCCmNlXR6dlCt8BQLr03iPP51jw64cA79mzp1W6aX9axPwnv3Jkv5
 gLTa66+8WTNP6a2OrImMsLwMuLVQz0i4+RuDOOzeA0Bh7617Bb4ilCeJW+M10dsmwIrogULvs+H
 tIz9DVtFDIK1J7Tlq2JNFZl+t9cVQCU/6f4K
X-Received: by 2002:a05:6820:3094:b0:5f2:485:32f4 with SMTP id
 006d021491bc7-5f20a227572mr13685197eaf.4.1733065592503; 
 Sun, 01 Dec 2024 07:06:32 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/67] target/arm: Introduce fp_access_check_scalar_hsd
Date: Sun,  1 Dec 2024 09:05:19 -0600
Message-ID: <20241201150607.12812-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ydKSnc5iil2M

Provide a simple way to check for float64, float32,
and float16 support, as well as the fpu enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 62 ++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9c6365f5ef..4e47b8a804 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1239,6 +1239,27 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
+/*
+ * Return <0 for non-supported element sizes, with MO_16 controlled by
+ * FEAT_FP16; return 0 for fp disabled; otherwise return >0 for success.
+ */
+static int fp_access_check_scalar_hsd(DisasContext *s, MemOp esz)
+{
+    switch (esz) {
+    case MO_64:
+    case MO_32:
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return -1;
+        }
+        break;
+    default:
+        return -1;
+    }
+    return fp_access_check(s);
+}
+
 /*
  * Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
@@ -6628,22 +6649,10 @@ static bool trans_FCSEL(DisasContext *s, arg_FCSEL *a)
 {
     TCGv_i64 t_true, t_false;
     DisasCompare64 c;
+    int check = fp_access_check_scalar_hsd(s, a->esz);
 
-    switch (a->esz) {
-    case MO_32:
-    case MO_64:
-        break;
-    case MO_16:
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            return false;
-        }
-        break;
-    default:
-        return false;
-    }
-
-    if (!fp_access_check(s)) {
-        return true;
+    if (check <= 0) {
+        return check == 0;
     }
 
     /* Zero extend sreg & hreg inputs to 64 bits now.  */
@@ -6894,22 +6903,15 @@ TRANS(FMINV_s, do_fp_reduction, a, gen_helper_vfp_mins)
 
 static bool trans_FMOVI_s(DisasContext *s, arg_FMOVI_s *a)
 {
-    switch (a->esz) {
-    case MO_32:
-    case MO_64:
-        break;
-    case MO_16:
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            return false;
-        }
-        break;
-    default:
-        return false;
-    }
-    if (fp_access_check(s)) {
-        uint64_t imm = vfp_expand_imm(a->esz, a->imm);
-        write_fp_dreg(s, a->rd, tcg_constant_i64(imm));
+    int check = fp_access_check_scalar_hsd(s, a->esz);
+    uint64_t imm;
+
+    if (check <= 0) {
+        return check == 0;
     }
+
+    imm = vfp_expand_imm(a->esz, a->imm);
+    write_fp_dreg(s, a->rd, tcg_constant_i64(imm));
     return true;
 }
 
-- 
2.43.0

