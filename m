Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp374123lfu;
        Tue, 26 Apr 2022 10:00:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLxlylk+Juu4K9mIwD1KVZq71XJAvlC/ju26wvK+rhaK1w7p5OSr3snBvcLErgwyhMRRKa
X-Received: by 2002:a05:620a:2221:b0:69c:8cb9:937e with SMTP id n1-20020a05620a222100b0069c8cb9937emr13672806qkh.547.1650992430519;
        Tue, 26 Apr 2022 10:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650992430; cv=none;
        d=google.com; s=arc-20160816;
        b=GMzFZWXpdYC6jfed2/A9OHNOGYfq6TahN4qTq2K/UI+H0bj7ogF+ZFKMfSD7lU1PLX
         QSlhsAh1IIer0/697EnaNeubB71gPPKzkAyZWCh8shtBZQdd08R2+RMe5vTKGmK5ETO4
         34m05EeudeetOyivKSV8s77/8TAl7WmsPe/N4x+J0jHwWlmmlHrEZK/bCWWJHsK2K6L+
         pK/pX9A/qS8qTAWV1IuFkHORKV0nCKg3H0wIwB3+HxotgPsST11/JSmxYBRQh7pCMUHe
         3tV9adkqZaizTqEmlpdEa5Cg9QTBSnlLX3kkFd7LCUO5iMZdsMNQSzM+kqQBD636AwM8
         ZUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Gu1w/jO8eoHTj1LzEHCTAVluXbeXXyayJtWHm0r4IXU=;
        b=KoHUB9e3TRPcak5aujknpZelViRgOPRC1r9xXHRBd4zLXA/ek1Bhm3XJcUNi7jRBRo
         Ron/574PvNXoCKr/ARrqYoqq79eywNLLVPd/FJEbhzh64ueDO7NSh4SMqLNn4jShfsM0
         DoNv/Kh1oO52ZQgX9Yy7AXb0ymXs6xry/Rpd9pcouNI0EgwdSAfpF0SxkEpbdRd9twYz
         tBxakoCm7CztV/XXHpYC0UhFCWxGZLkXfHv2Zc/h61tUxUew51IJ44q/Yako9Ymdz0xT
         pCtvetA8ado5h9RTFEfSon24/kRkoAZnvYyZ4Pvnb3u6JS/hEnDJz4qxof5QW5jIsXJs
         Cv3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGvheP2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020ac85996000000b002f34f162ccfsi4594321qte.403.2022.04.26.10.00.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 10:00:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGvheP2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOY9-0000AH-TW
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 13:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8w-0002EP-Tq
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:34:26 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8v-0004Li-53
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:34:26 -0400
Received: by mail-pl1-x636.google.com with SMTP id d15so30715916pll.10
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gu1w/jO8eoHTj1LzEHCTAVluXbeXXyayJtWHm0r4IXU=;
 b=qGvheP2zI4iWipBg7NqOIpEoSeU7le9kW5tMi7Uul0X+9GyUmiBS6/le3nGmVqobjY
 hMda/8RULY9KDTcNbIWn8ZTwes+7jJKV8HnmMhIk1LS6yJYfPlJnv/Lpzn/uUInrKNrU
 O8LJu6ZCcUYvZLa5RiwvQQCoyjiPNfNJQLWTGyDNP+qSV3UFW2ntqgQqsiozwR1Pb7C9
 UjAPqBvB0F2LlPj9z+9mR0wX0LUuKLTlyLSVZ4ujwpAuEUjte9E4fPaeRbnFWGDvwoKj
 ieN16im0+dk6eZDU/Wsql9LfVsEPjKPMyaNmBAHhiYtv8zHFSJxOp9NxbDPgEpMA7kLd
 RT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gu1w/jO8eoHTj1LzEHCTAVluXbeXXyayJtWHm0r4IXU=;
 b=1smxWZjYN7aFbZwwJAvrpxrVwAsyR6adilQVsfiIWPqXqQbLjikATHvtkvM6z8kEMP
 VmCEHhuGBoiKhWOvbwDNB0fWHURkkDL4LfJBNIgBtvd4AbLoQZ+/CnGzqmnwPMe5zF87
 Pw0olSsED+lVxktYeaKHsCgLBSncDeLvS7EITUavuQVb5dVw2IOj0K098C5/6TU66006
 qY7O55fCwWm6KSC/vOTwg/TDGToktUUceVM1pI9BzTk3KD8eLBbuFHvBmpV+Gj+xpRK7
 YdKnGmW+cDg6bW0RE+CAm0nNEz6yQ/oVarIUIaiN4UUZA7396eYpLA6PVmhbFuiwtLKY
 vYBQ==
X-Gm-Message-State: AOAM531ZGxWOjo0pwKQpdDWrHR8Q0ANhk232+Aiu9vlzOhtHCwfYui2Z
 XHZ3XHHhNbFlC/N01V0+DnQnRw==
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr27748993pjb.232.1650990863845; 
 Tue, 26 Apr 2022 09:34:23 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/47] target/arm: Use tcg_constant in WHILE
Date: Tue, 26 Apr 2022 09:30:37 -0700
Message-Id: <20220426163043.100432-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: 5ve/dgq6LoeO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7a39ed0c06..727f5cca36 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3568,7 +3568,7 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
 static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 {
     TCGv_i64 op0, op1, t0, t1, tmax;
-    TCGv_i32 t2, t3;
+    TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
@@ -3624,7 +3624,7 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
         }
     }
 
-    tmax = tcg_const_i64(vsz >> a->esz);
+    tmax = tcg_constant_i64(vsz >> a->esz);
     if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
@@ -3644,7 +3644,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 
     /* Bound to the maximum.  */
     tcg_gen_umin_i64(t0, t0, tmax);
-    tcg_temp_free_i64(tmax);
 
     /* Set the count to zero if the condition is false.  */
     tcg_gen_movi_i64(t1, 0);
@@ -3661,28 +3660,26 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-    t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
     if (a->lt) {
-        gen_helper_sve_whilel(t2, ptr, t2, t3);
+        gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     } else {
-        gen_helper_sve_whileg(t2, ptr, t2, t3);
+        gen_helper_sve_whileg(t2, ptr, t2, tcg_constant_i32(desc));
     }
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     return true;
 }
 
 static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 {
     TCGv_i64 op0, op1, diff, t1, tmax;
-    TCGv_i32 t2, t3;
+    TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
@@ -3697,7 +3694,7 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     op0 = read_cpu_reg(s, a->rn, 1);
     op1 = read_cpu_reg(s, a->rm, 1);
 
-    tmax = tcg_const_i64(vsz);
+    tmax = tcg_constant_i64(vsz);
     diff = tcg_temp_new_i64();
 
     if (a->rw) {
@@ -3723,7 +3720,6 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     /* Bound to the maximum.  */
     tcg_gen_umin_i64(diff, diff, tmax);
-    tcg_temp_free_i64(tmax);
 
     /* Since we're bounded, pass as a 32-bit type.  */
     t2 = tcg_temp_new_i32();
@@ -3732,17 +3728,15 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-    t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
-    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     return true;
 }
 
-- 
2.34.1

