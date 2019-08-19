Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3177776wrs;
        Mon, 19 Aug 2019 14:48:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoPd/F+Fvnaoc41QhiDsDZNxHQw7pX6HXLbjnbThc4UEa0sxJt+7hbsWxIuv3sGCJrneoK
X-Received: by 2002:a37:a20f:: with SMTP id l15mr23459653qke.212.1566251310215;
        Mon, 19 Aug 2019 14:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251310; cv=none;
        d=google.com; s=arc-20160816;
        b=NtM4sIfjDULBypsX4j2Moe4vDrYj2qsoqrWHan5lAAErC+mIUCdvGzFXFmYj4YbcWI
         B2TWYv0RNl2phK1EvKa6SE5J0xvw0TWGv3TB8VLT7BOM8+Tzj+fNQ/80rOCH6c8gARDJ
         LtvT/Vwpjer4lZmXdvk0LYbxqHT+BlP9RX4NXv2JoPl2N+rw+R3OkpVzkSu/u2RQXGyu
         sy+HSuIXLEHV7w3cvTL1Vp6cwrWpo1jXOSE0nWnF+8zHS6LY8BwO+iq3wE4ZRIWG1tS3
         VaPjMbyw/fE0Gng4vCOcGArh9XF+paYy/p9Le7zBvGNA+DCbfcy48//JK3rSPAQyH06c
         B6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=z6bTZIJUuD2Rb2udZZO8tN325lpohcam+cQYkXY7q0k=;
        b=k2dL5Rh7URc9f1YvO36N2bAw9Z5J8bY+KDNEtFIl5YJpH3LWvR1KY3+0kMZoFmwL8/
         mKFmRFRjamZWZygWM23Jp6kjTCnuauGa+0yuYpIPcOmBKTenvEY7452lJfrMkuhUdsus
         pNV3iiLUC5iHRIihgyX3HCRbyQ6oj09Bgpl2S0kJZksHXAzzXico0bEzK2eCbZ+Z9HD+
         gCd3zzcqUwv+lE8GBb+XiEcsWY7KLDLqp1D1yLT0I0X6ERBOu1TvqCvAtJsp/yVAHhLn
         w/u+2HOsEPFAYI9whesUb2+1s5eXyLfYZNedsIqylUy37uQscWGw+R3kLCO2Y7KiIgfZ
         M/QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YZ0YyngK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si9349827qkk.194.2019.08.19.14.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YZ0YyngK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpVt-0005FM-MR
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLx-0001S2-A7
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLw-00065F-8M
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:13 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38311)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLw-00064Y-2Y
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:12 -0400
Received: by mail-pl1-x642.google.com with SMTP id m12so1590222plt.5
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z6bTZIJUuD2Rb2udZZO8tN325lpohcam+cQYkXY7q0k=;
 b=YZ0YyngK2P7R9z4uAceUFNeutCFwqq8i7vHldiAteQsa2asCHVcg48IqB0ep869q68
 WLkmJMH3d9AIM/6t3LdqVsLoNan6DkrZ5bP5w0oWMU9dNJPzn0NceZRiJkn4fA0W7t9O
 VqGnq6tJFsJS8yAZTutn/9id0o2UvV7gLg5w24eEoXo/Jaw2B3RUlETz/b3mgkiUIkxg
 Pv5V2nc0CJZfig4FPjVa19zF7nxIaNayil+c2ucKqFf2SsqmklGyNSqj/u31Vw2DtjFt
 /YBMIXkSMJbhGIqqXP9cCMh7cdqcTG+K4swU2m2hb3JeyKUGvsFG18f0v96DbKCu8d0d
 DOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z6bTZIJUuD2Rb2udZZO8tN325lpohcam+cQYkXY7q0k=;
 b=hv4kfn3aZb3gHDaIIPzORGBGg4gNh1uDDD800i1cwXbMMr/YwFsKgjLyz/fHFfmPGD
 rCjRoQF+7zcviUzyID84xjJnn65R82gbMWoF2hWLGVWaafHzulyWaPfauBnI/yL2h6/y
 WzVe/RzFMh9peWbBVjMePa++dOKbo0EOByzsNI2/KuMXVKEZz7hnkFpJ6L7VAu0UKD9Y
 /Lz4yIKecNniE5cCfVxzD6brWN7sE8t8YclzEMXmQ/svIHGXjXyek9M7OYOWRgA2D7AE
 KaOJ0KplDnTDaiwuryIytoiNONa+OCn43AKn7csE0nnFgJmE09JJ4tE5HX072nHYbuWo
 cjeA==
X-Gm-Message-State: APjAAAVJ9mArPkxnlau4WJeMZU7m4u3J+CX+aY0fIx6AxpyOjXMPbBcM
 lzcTLow5vbf4PqZNXyysaptgGQ==
X-Received: by 2002:a17:902:3003:: with SMTP id
 u3mr10413251plb.161.1566250691131; 
 Mon, 19 Aug 2019 14:38:11 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:58 -0700
Message-Id: <20190819213755.26175-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v2 11/68] target/arm: Simplify op_smlawx for
 SMLAW*
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
X-TUID: CtWFc8lK0Hip

By shifting the 16-bit input left by 16, we can align the desired
portion of the 48-bit product and use tcg_gen_muls2_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8557ef831f..9a2fb7d3aa 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8213,7 +8213,6 @@ DO_SMLAX(SMLALTT, 2, 1, 1)
 static bool op_smlawx(DisasContext *s, arg_rrrr *a, bool add, bool mt)
 {
     TCGv_i32 t0, t1;
-    TCGv_i64 t64;
 
     if (!ENABLE_ARCH_5TE) {
         return false;
@@ -8221,16 +8220,17 @@ static bool op_smlawx(DisasContext *s, arg_rrrr *a, bool add, bool mt)
 
     t0 = load_reg(s, a->rn);
     t1 = load_reg(s, a->rm);
+    /*
+     * Since the nominal result is product<47:16>, shift the 16-bit
+     * input up by 16 bits, so that the result is at product<63:32>.
+     */
     if (mt) {
-        tcg_gen_sari_i32(t1, t1, 16);
+        tcg_gen_andi_i32(t1, t1, 0xffff0000);
     } else {
-        gen_sxth(t1);
+        tcg_gen_shli_i32(t1, t1, 16);
     }
-    t64 = gen_muls_i64_i32(t0, t1);
-    tcg_gen_shri_i64(t64, t64, 16);
-    t1 = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(t1, t64);
-    tcg_temp_free_i64(t64);
+    tcg_gen_muls2_i32(t0, t1, t0, t1);
+    tcg_temp_free_i32(t0);
     if (add) {
         t0 = load_reg(s, a->ra);
         gen_helper_add_setq(t1, cpu_env, t1, t0);
-- 
2.17.1

