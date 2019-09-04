Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1118261wrp;
        Wed, 4 Sep 2019 12:36:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzykoDfCbsLjVBnGiKMs89vhGKLFHMt8mLIIqHpwb0eGMfZtQ7QRWM8ac0Yv/oDurLEOzkV
X-Received: by 2002:ac8:414b:: with SMTP id e11mr41160170qtm.174.1567625811258;
        Wed, 04 Sep 2019 12:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567625811; cv=none;
        d=google.com; s=arc-20160816;
        b=pWb26A1j20rjP7Z89t+FljrI3LRWX2xwrjwZ3dZ4ND02QxoQzA8QRvK+DIsu4hZEQP
         uCv6/521SRlsWqOa/zhgY1Ge8EOd4EZlpRxmtfDQmdivlFMUKwfEB1BqH1nk+is7QO5W
         F7KV4qFdA7TRybj/lXK4MNfv56sawDZDn2LWEQ4+zNoAqteuwnY1xEhj8PGuUNfFjKU1
         /7t5jXfpa/Jxyv9CMrV2fQi22VxwpZ9U51NBx9d8GDUuQShPyDNBdovzC4DjhIhf7NIu
         oKN/dYJNq6IzHAnoL6jpKUwq0NRQTF+naeePfNELvOeZg/fypD3Gwa5AVVGfhszF8gYk
         dxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=mUfMuu94nY9iTVUmT2HpXRX8/pvEI2tD109hkQpzr/w=;
        b=rWHDWo0vw6Sufa7WBm9udkP1TCRoe4q+tuoGfa0Ekgs1Dk549Cr46cR5Lstnv2n+YI
         pAOIPkaNHsseo/GyGfaGuCSpi+o5sxre2NjLUJpPLOECnwuLYmA1sF6+tehHaVeb3Od1
         qFSa8TKW4XaJJWniQXsbeFjfF8fIpImVwTQAl3wbSkSkYSmaPqJ/2R/t9n5sZAnWEvza
         /rLdlA1Mg0Bh/ooCjgHFv3kssc5B/Rl/CPIUqnEz/ZcghLaRcLTpi+EyYZwEeQbFsUUE
         prOi0CDL5A2XK+i43ResXZUHArAacOJHchYcnUX/dtaUryM9fX7L3pnsGg/+nrmO+sdI
         QIOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eTUNQP7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si11132302qtp.198.2019.09.04.12.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eTUNQP7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5b5G-0001DZ-4H
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azq-0004DC-8c
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azn-00029d-R9
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:14 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40826)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azn-00028P-HI
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:11 -0400
Received: by mail-pg1-x543.google.com with SMTP id w10so11779920pgj.7
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mUfMuu94nY9iTVUmT2HpXRX8/pvEI2tD109hkQpzr/w=;
 b=eTUNQP7nuw/1zXzNDy5hZ1YIGSvXVg8rujyUAG00PzwjJ3vzlL7jDdJeI9pE4q8dbh
 wCNZOn50+lnBnX1aXdMHrXtVdoIvy3v8rOoJMcLiOBBQoYT3WU+o3uwmMiw5h/NVi4/b
 IPtTBerwL7MkgFVN+BXAfrgO1Jmz8M8R04s9DcJOyhG8ReWUxe2pJu0nDa87qMlwHm5n
 weIQ9aat7rahADviAxFqNP9GC7LQ/7Fp7tCdbF7E/jQjvwkMyxUVp62VdQivWetcc3zq
 KCGMz6pYXRlJOtiFh9LxatENMrljJVVu03FfFAbR8uDP37+fzTlJeooBq1UwEtcjWvLB
 318A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mUfMuu94nY9iTVUmT2HpXRX8/pvEI2tD109hkQpzr/w=;
 b=YH9hpm05kPWIcBQI6J12b1/+0Fy4LZoK4v2pxTAwKBqSpPX1k9+TT/7phkQ/r08jKu
 br5T3qwHYw5HrWrhgC8jSEJPGW3QDrJVSFFtY3B+f0X+m7uX51h0Q6U1faQH+eK8S947
 nkgyggczAw+KtjsddnC1k4Tt5AbIXD29K2WKYa6pwLRw3rvup8Tzu7khbu78Ken27Bk7
 pgdqZmWo+QbyZPCde9XitxwUkUTR5InXLZbro5OHN8TcE5tS23itKIOnKF1EYhHocdYr
 4BGCZ8vLpSDlK7bJzJ4VcTyt0X4QJ9t+UHDdM8wkHHpyVHnU5O4KUrqO4mKc6uLb7inW
 qQ5Q==
X-Gm-Message-State: APjAAAUkwRUNT4ZKHkwSoPn00oDd3cZ8akBjJGHocyecicpNT4Husu7B
 CEU6Teu2ucIjd09wVsgiSHKa/g==
X-Received: by 2002:a17:90a:db0e:: with SMTP id
 g14mr4882317pjv.54.1567625469925; 
 Wed, 04 Sep 2019 12:31:09 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:29:57 -0700
Message-Id: <20190904193059.26202-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v4 07/69] target/arm: Simplify UMAAL
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oCFipuOPr9/n

Since all of the inputs and outputs are i32, dispense with
the intermediate promotion to i64 and use tcg_gen_mulu2_i32
and tcg_gen_add2_i32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9bcf1e0964..8d70f15a4f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7346,21 +7346,6 @@ static void gen_storeq_reg(DisasContext *s, int rlow, int rhigh, TCGv_i64 val)
     store_reg(s, rhigh, tmp);
 }
 
-/* load a 32-bit value from a register and perform a 64-bit accumulate.  */
-static void gen_addq_lo(DisasContext *s, TCGv_i64 val, int rlow)
-{
-    TCGv_i64 tmp;
-    TCGv_i32 tmp2;
-
-    /* Load value and extend to 64 bits.  */
-    tmp = tcg_temp_new_i64();
-    tmp2 = load_reg(s, rlow);
-    tcg_gen_extu_i32_i64(tmp, tmp2);
-    tcg_temp_free_i32(tmp2);
-    tcg_gen_add_i64(val, val, tmp);
-    tcg_temp_free_i64(tmp);
-}
-
 /* load and add a 64-bit value from a register pair.  */
 static void gen_addq(DisasContext *s, TCGv_i64 val, int rlow, int rhigh)
 {
@@ -8119,8 +8104,7 @@ static bool trans_SMLAL(DisasContext *s, arg_SMLAL *a)
 
 static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
 {
-    TCGv_i32 t0, t1;
-    TCGv_i64 t64;
+    TCGv_i32 t0, t1, t2, zero;
 
     if (s->thumb
         ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
@@ -8130,11 +8114,17 @@ static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
 
     t0 = load_reg(s, a->rm);
     t1 = load_reg(s, a->rn);
-    t64 = gen_mulu_i64_i32(t0, t1);
-    gen_addq_lo(s, t64, a->ra);
-    gen_addq_lo(s, t64, a->rd);
-    gen_storeq_reg(s, a->ra, a->rd, t64);
-    tcg_temp_free_i64(t64);
+    tcg_gen_mulu2_i32(t0, t1, t0, t1);
+    zero = tcg_const_i32(0);
+    t2 = load_reg(s, a->ra);
+    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
+    tcg_temp_free_i32(t2);
+    t2 = load_reg(s, a->rd);
+    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(zero);
+    store_reg(s, a->ra, t0);
+    store_reg(s, a->rd, t1);
     return true;
 }
 
-- 
2.17.1

