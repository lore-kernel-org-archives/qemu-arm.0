Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp388080lfu;
        Tue, 26 Apr 2022 10:19:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoRevzyzKRknrj+xvs9Ropmp0JlidtjrSB+JcscHeJX2Ai5vLUxoTdYokue3jy5xT9zBxP
X-Received: by 2002:a25:848b:0:b0:648:4e74:bf92 with SMTP id v11-20020a25848b000000b006484e74bf92mr11743715ybk.364.1650993583806;
        Tue, 26 Apr 2022 10:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650993583; cv=none;
        d=google.com; s=arc-20160816;
        b=mDcLGmjyZzfLVpkkoJ/mtegShr6Mt0Tzzgfrh5w6RrteHoL+TriOK4YRXc30F3/QgA
         aqlkEmDy3NdfJXaWVI5K+QkUi8V99b5mK5to1NuR4HqvOQvi5lfSSKyr23f8+YJVuNxH
         QGtUwIoOjn1vqgpsV0D8UvAbRHAgAtKOKDWQ0pSqoAEhkBXzrUd8JwCfGKhs2/h6vMa/
         xmroTkfbCgJd8F1hr4Znwa+F55DSjOdsnWiJC+UOkL9zUIrI8ksq/YeaRmwldnEzDha4
         RzkVOx65NAjoNwDRxS9SyN7RMk8W0nXcHqZ1Vovtay/cdDScV5ZCOHJX/FEPAFyJCkuq
         JXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Afr+fFSTar2ikBbmWUyJU+wGoh0H9JIJV+912Nb1UHs=;
        b=j04OJ0snd8QvJKvG4H+IFgVkepkCSI6ZhnmC/Ihf+px+6ROLrRAeQs2Ntql82FjRii
         uNfxSMYacYq1PLa7LVP+YzItW0vWNrosb7lKBi9I3bjjIUVKuHWAokiA0FUZ6zasgwSB
         yqjGOZVQS+gT8G92em+AQ8xwQZpHLuY2vIepvUJ0WKIhxBjZ2YmSFLachQPadUmnxarN
         sgPwZTcYzdaxQOK7Yu0Cgp6et6UaHs/A5rx0pznzB00A8XNC9NH6keX7iiF3FJQxgFeS
         rRHINdnW9DZ9E+FsaHqmQpA1V4dC5jNxwWwtov9kZ2f1IRfNhWAdXYaHaRcw9BiZDFZT
         VlEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQACcMmh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s84-20020a254557000000b006485c35844dsi6283592yba.86.2022.04.26.10.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 10:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQACcMmh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOql-0000C1-8M
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 13:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO91-0002Sp-9w
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:34:31 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8z-0004NU-HY
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:34:30 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so2657314pjq.0
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Afr+fFSTar2ikBbmWUyJU+wGoh0H9JIJV+912Nb1UHs=;
 b=XQACcMmhJzmWZIGcg5Yp1vN0pLjo4DomsvhGBBNm/6Gl+e+eIhBX+hPF3PTk8HvFod
 9DjXX33CMjmciqHOUPEg3GSQTonAa0VWxez5YNM1QNYN6QGcDpBssMr/qHedC+U/JSLG
 qZLnXwJVJa9/fcO6Qc9x+6fCIrtObb8ksPi4I0Xj+Fdkzrt57AIwAoBBGU1/17dH8leX
 XY9wvNbB6IMs+OWL5KDQx1d9Y4mRoESAtL4zO1WS6+yQGu7x//E3RC4OTtzJsqpkgxyV
 cUieWuEVaL+guzowb0tQPvWu9/ScxiZl9UkW4jPswlcYcFn6BqsHVRVx+3UWDcT1G6Rt
 hnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Afr+fFSTar2ikBbmWUyJU+wGoh0H9JIJV+912Nb1UHs=;
 b=Bnc5QCYKcvPKGey3yRXdFjaFw0AFXAHLe8oJklsypYxu6Taw/1jJKTPd1xPp3XedFi
 11jVjEtVyjnIctrbUB0gn6dwKlH+jrkN/D3QrjodwWwPm2I09/bzu2j5qxR2Rg3gxujM
 IM8YKLfzYJK5jHaQxehwkmhgSg7tfTz0oprZVeXELZ6us6XrkH3dQXixtpSC/C/VLCFq
 5uyoonYOpVrCbdIIoUm9h+h3cDO8/D5VOo89OEGYmMUD5gfLp838CNKaE+UVG8hmdY34
 A4P+5miP2GsXo0gQIb/tYsHNsDA/m9W4xSJ0tnVKIM0YWUPftGDOij+BA9D5ycfvYzB/
 5Yow==
X-Gm-Message-State: AOAM533lfP2ieL+XOd4NVFIM0dQ9eVG9kI4WPoGl2JEOYHfHhadiciIv
 iLkz1ik/tg8aHmGXCATiZXMv009KtFK2wQ==
X-Received: by 2002:a17:90a:af98:b0:1d4:67d4:d122 with SMTP id
 w24-20020a17090aaf9800b001d467d4d122mr27750778pjq.166.1650990868180; 
 Tue, 26 Apr 2022 09:34:28 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 46/47] target/arm: Use tcg_constant for do_brk{2,3}
Date: Tue, 26 Apr 2022 09:30:42 -0700
Message-Id: <20220426163043.100432-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0rkWOa5lPkx5

In these cases, 't' did double-duty as zero source and
temporary destination.  Split the two uses and narrow
the scope of the temp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e812f910ce..82bf094447 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3322,7 +3322,7 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr m = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
+    TCGv_i32 desc = tcg_constant_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
@@ -3330,16 +3330,17 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
 
     if (a->s) {
-        fn_s(t, d, n, m, g, t);
+        TCGv_i32 t = tcg_temp_new_i32();
+        fn_s(t, d, n, m, g, desc);
         do_pred_flags(t);
+        tcg_temp_free_i32(t);
     } else {
-        fn(d, n, m, g, t);
+        fn(d, n, m, g, desc);
     }
     tcg_temp_free_ptr(d);
     tcg_temp_free_ptr(n);
     tcg_temp_free_ptr(m);
     tcg_temp_free_ptr(g);
-    tcg_temp_free_i32(t);
     return true;
 }
 
@@ -3356,22 +3357,23 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
     TCGv_ptr d = tcg_temp_new_ptr();
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
+    TCGv_i32 desc = tcg_constant_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
 
     if (a->s) {
-        fn_s(t, d, n, g, t);
+        TCGv_i32 t = tcg_temp_new_i32();
+        fn_s(t, d, n, g, desc);
         do_pred_flags(t);
+        tcg_temp_free_i32(t);
     } else {
-        fn(d, n, g, t);
+        fn(d, n, g, desc);
     }
     tcg_temp_free_ptr(d);
     tcg_temp_free_ptr(n);
     tcg_temp_free_ptr(g);
-    tcg_temp_free_i32(t);
     return true;
 }
 
-- 
2.34.1

