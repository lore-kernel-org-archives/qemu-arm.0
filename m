Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956324lfg;
        Tue, 9 Mar 2021 08:22:33 -0800 (PST)
X-Received: by 2002:a9d:4b83:: with SMTP id k3mr23920108otf.21.1615306953564;
        Tue, 09 Mar 2021 08:22:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306953; cv=none;
        d=google.com; s=arc-20160816;
        b=Rhh0LVFSqAezXEJuON9IBwQEakaJ7pxO/vHxaLf0pxO0hmjxUIZzUhctTKyjRsP31e
         qz708D07r5XiGcXrCBOC9K3gfuXVL9kK/ywRuQgCt6HRH9NZ/lD78PVav3YvxrZhv0Nw
         fz2toAfQwf5n5yHIw0gHBujlWy6pcFqO5tEmcDPwdBMI38x5I5bb4bVsCEba87x+mO2q
         MOk+fWRXkVwjBr6sS9LaZUycFqcX0l4drqaJ+lEaawC+Iu47aiWyISabBigRIHqap4XF
         IPl3Al7c7Nl0gFw1/oF3Bc1Gl7GtIeGePCqsoKyf0IMCSyDaxK6nqicN/GNMxrpFQn5l
         fP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eeIkjfuK4lIZhLLIPgTtWdu0JToAdaQwwLqvqAcG254=;
        b=FHYhzwaEWGQrpJKqM9KxpjGa3oc3XovEsPvjPZQ8zWnE27KbboTjWFeLAYz0qkclAI
         IULMqfRu2LE6TqnOaEXrRtgOJ6Dxzr8aybBAIUrxfTc/f64vTWY/hoH9fgLFbs0hu4fd
         GD6eZgoC7DPu1EzmcAKOgd339Rr/NVFSLyzI1xyXOWsd2po2wMBZBymTZ0KpRX2PF4hh
         wNyoOU5vfnjh6n/haeh/hrOIJXCu8VKGHna1t5eUBjSCxRgzeXVq1P2uTgtJStKepRqv
         S6VI/Kwyif8WB2kGL1SdnNqSoYd7ZxeWTiPhXSYenjfxv5hvNczPGLqZS2Owa0HAI5qV
         LCWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aJYF0Ek5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j23sor2457140oij.94.2021.03.09.08.22.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:33 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aJYF0Ek5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eeIkjfuK4lIZhLLIPgTtWdu0JToAdaQwwLqvqAcG254=;
        b=aJYF0Ek554kl/uUuyu83mgE6ixaCJIlo2YxwjmIm8dwjYKdOPL6IxvavdRv90amKhN
         nKUIfnttPNxv4PqYf5ov5gBFwMAi6+0Xm2sRjb62far8uqBl3qi4lY9+E/a/6fdvoKRG
         Xx1eHM233bpqqbDbEfZKk2vFg7OuhZ3UYmoBLMnVDGotqI7UDWsR84Gu1Bb7Sqj0OQUU
         HmQ3CMozI2c/r1HYqCO5qaDUTS3BXlWM1uxqQPgpZNVd112DkTN+G8QuVWRdZCUj57A5
         r4Ls/ZbJJtxu0SN7nlwd1HAQDO43xjjOyswbDAEqmQ0z5Jig81xNQgnksLO0A0lUbABp
         iCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eeIkjfuK4lIZhLLIPgTtWdu0JToAdaQwwLqvqAcG254=;
        b=SA8leLoIFlR6Q+NG9Q5mCa906baB7h5LE3iGbl8SACcLCgFcviudC/5HYSkE+lyAWR
         JGhdU5ykwc3e1mM98G7Xbl/T5xa1yXo/Uo66jsBSzRGiCdvHAkzb+Z9BsTO31oH4GmK4
         d1MYaWTuK8T6W/7++iSUNCtdAXzyytQe2PHRAiHWzUTjctNKed2cVYtP44cVv5ZwEFS+
         IN2UHO9ul/hIKn7kpOzK+J6PywA+6tYp2QPruZ4Mfr6KNJHWb23ARYjOTEG9fZEQwFIS
         vUQ5R7IKRiu6CmWSrnipebGtETUTgCMYgb9gIhvMby4W/gu3/3pgwYUA3G3geh2ZboLx
         DG4w==
X-Gm-Message-State: AOAM533IYullAYtVdbIeCMtEIJS9N9/GJGZ+A8X7QMgsWuct56RKRX2T
	ISkvfYdKBuN2uWsbWePXLtLNkXvH
X-Google-Smtp-Source: ABdhPJwcOlQ8nU2tnj0f8/na54UuO0s2jWlO7pG4DHzwAnJuanyHqh9i3GVXTLLW1UNTtElAquuu4w==
X-Received: by 2002:aca:2104:: with SMTP id 4mr3523575oiz.124.1615306953244;
        Tue, 09 Mar 2021 08:22:33 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 70/78] target/arm: Implement SVE2 FCVTXNT, FCVTX
Date: Tue,  9 Mar 2021 08:20:33 -0800
Message-Id: <20210309162041.23124-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eMjmqC21gPf5

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-4-steplong@quicinc.com>
[rth: Use do_frint_mode, which avoids a specific runtime helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 49 ++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d152193e89..4fcd1b43f7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1575,6 +1575,8 @@ SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
+FCVTXNT_ds      01100100 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTX_ds        01100101 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c29984d244..14a6a53320 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4765,11 +4765,9 @@ static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
 }
 
-static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
+static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
+                          int mode, gen_helper_gvec_3_ptr *fn)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         TCGv_i32 tmode = tcg_const_i32(mode);
@@ -4780,7 +4778,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, frint_fns[a->esz - 1]);
+                           status, vsz, vsz, 0, fn);
 
         gen_helper_set_rmode(tmode, tmode, status);
         tcg_temp_free_i32(tmode);
@@ -4791,27 +4789,42 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
 
 static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_nearest_even);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_up);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_down);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_to_zero);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_ties_away);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
@@ -8253,3 +8266,19 @@ static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
 }
+
+static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve_fcvt_ds);
+}
+
+static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1
