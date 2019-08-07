Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6072122wrv;
        Tue, 6 Aug 2019 21:54:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzo5UkAOTWRjOlD2Qk+KzNSt4+4mvREr47HhHrwKYV5xQ1vhk0Cz4YRPylnrsGbcabsMKYO
X-Received: by 2002:ae9:f209:: with SMTP id m9mr6368647qkg.251.1565153654185;
        Tue, 06 Aug 2019 21:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153654; cv=none;
        d=google.com; s=arc-20160816;
        b=BVla9KeXuVVNM0G1C48aHNm7vRZNYoyVU8fQ3/Y6tLOCnpJqMyeFhDFp25PMzZjstC
         VQaZWPkAdn2XzT+u49Ikj/j5AwXjOtuqrdyXr3Q//mL+p1+E8h1P6xUZ7rp0l/7OhKJw
         r3IEwCSY5Uw7i/WlDDQuVEIBoR1bGWTH+wB++mOCUiNn2dxOpHpEFjnYggwBa+zHJUPm
         z8AmKCDKTkaF4P0V3lm7S3aAhnl/JvGV679+thNA344cuLjfBE+g4VN5hs7ttfdmStJg
         SZlC9yoOT4kviVm4YteoPkAD+inScKIbKklAhx+7tWN1dEWOSHykE6p1JdYwatH4OaXg
         PymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=S3x0I1syk+FpjUOME51Sa5kikQHI1eNJn5aK0q1qog4=;
        b=bnbBuCsmWxj/HhK77PJ7RsPYQ1VHxlnmDT4dayPYXYo81i0OoUUAsi5QsvVe22uev5
         XtkvD1d2hwHOBmz718OYfRlaLSKOHI8jw4n+oUf74BXbjcCRANrlm3Rpv2LZQpo6qX/n
         8GT0H5SXfw/c6aRuwUDwW1LAH/6iXAwdT5IElqJJgq5n5XFKS8e1b0g9WhckAwISKmmP
         LxkAwRpRxxvnW6NHvzflz/apTh55U1bVZZHh3oGp/IIhTV9Gkp7v7nnNx3J/j0ZlbfrZ
         MTfCEo8d1M5q67uFRHcQiqG9IRgiGnifGmbxsvBttTigVnWsd+ih0jVkjh2Zcl/ly0XT
         dr1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mTR4UeG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si6437372qkk.378.2019.08.06.21.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mTR4UeG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvDxl-00023E-NT
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40821)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxX-0001Yj-Az
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:54:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxW-0004vp-8V
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:59 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40891)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxW-0004vT-2f
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:58 -0400
Received: by mail-pl1-x644.google.com with SMTP id a93so38721289pla.7
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S3x0I1syk+FpjUOME51Sa5kikQHI1eNJn5aK0q1qog4=;
 b=mTR4UeG7b76CFYD3I7WgV0qeo73dQZRYHu9XVs893lIFwhdZf4GADDX0WNwRFdT424
 0JyCDnNk9Nvotd7uo3z6yyYNp5ikuETD1mFFCC9nCnCxj7K7LrMTtCuWyj7F2zBSXyeX
 drvs4t5v8+5m1PSkHSF3+6cRiAuyNUjrsPDo/Y7bLeSL8fVEON0ItlIboRTpsuTXDLE7
 gBvXgvHp3PNpdxyarqAnMsFYrwosedT0Q/q1YhnMG4jOdsDQhMfQF/UG3Mi6CNl7yB/b
 0xpkCFHyvGMh1OYgLZzCm3DGYOa9O2x/YyARbxkVq+7xzxKBB5kUmL/Y1zp0g1guLZ5i
 CMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S3x0I1syk+FpjUOME51Sa5kikQHI1eNJn5aK0q1qog4=;
 b=XK+LBGg5zQyZMIYf8jsgYtMJakVIevMGdWs0XyXml5AsLuoKTv7EUGvamIpsnPeO59
 TfzVMMUiipC1mJiv/1yx1QOfe7t/vdPIs4st574Hh2M9j+HpKJr3ZVNYI4Mtnmv4cWnb
 16L/LD+4nYdFJ2NI4zLS39qouvgadX/D4GHGAwd4RoPQul6D7IzHzAS2cc8pSqJcP4OI
 11fXlDBUA1GYSNRhDUbMgrKNjHu9SatU3n+EkAcCVH5nyL/yq0MGXjWcBQS1zllsGx4J
 eDQDEdUDEOPJAssjmKtBSiQZwj6AhsfFXNacfEx2PQqalbKz4WsxZDezvUG6CbfjWK5W
 kbkg==
X-Gm-Message-State: APjAAAXPyXzda6q1DMyV/DLoKuYJz186ofaXOJMrTgXKCJ6dmpVdrzaN
 f7L699iQQ1XaXlsCT69y/uMwBb9nXdU=
X-Received: by 2002:a17:902:24c:: with SMTP id 70mr6452993plc.2.1565153637091; 
 Tue, 06 Aug 2019 21:53:57 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:35 -0700
Message-Id: <20190807045335.1361-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH 11/11] target/arm: Remove helper_double_saturate
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
X-TUID: vU4lZql/bbWc

Replace x = double_saturate(y) with x = add_saturate(y, y).
There is no need for a separate more specialized helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h    |  1 -
 target/arm/op_helper.c | 15 ---------------
 target/arm/translate.c |  4 ++--
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 132aa1682e..1fb2cb5a77 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -6,7 +6,6 @@ DEF_HELPER_3(add_saturate, i32, env, i32, i32)
 DEF_HELPER_3(sub_saturate, i32, env, i32, i32)
 DEF_HELPER_3(add_usaturate, i32, env, i32, i32)
 DEF_HELPER_3(sub_usaturate, i32, env, i32, i32)
-DEF_HELPER_2(double_saturate, i32, env, s32)
 DEF_HELPER_FLAGS_2(sdiv, TCG_CALL_NO_RWG_SE, s32, s32, s32)
 DEF_HELPER_FLAGS_2(udiv, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 DEF_HELPER_FLAGS_1(rbit, TCG_CALL_NO_RWG_SE, i32, i32)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 5e1625a1c8..0fd4bd0238 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -135,21 +135,6 @@ uint32_t HELPER(sub_saturate)(CPUARMState *env, uint32_t a, uint32_t b)
     return res;
 }
 
-uint32_t HELPER(double_saturate)(CPUARMState *env, int32_t val)
-{
-    uint32_t res;
-    if (val >= 0x40000000) {
-        res = ~SIGNBIT;
-        env->QF = 1;
-    } else if (val <= (int32_t)0xc0000000) {
-        res = SIGNBIT;
-        env->QF = 1;
-    } else {
-        res = val << 1;
-    }
-    return res;
-}
-
 uint32_t HELPER(add_usaturate)(CPUARMState *env, uint32_t a, uint32_t b)
 {
     uint32_t res = a + b;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2d447d4b90..846052acea 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8122,7 +8122,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             tmp = load_reg(s, rm);
             tmp2 = load_reg(s, rn);
             if (op1 & 2)
-                gen_helper_double_saturate(tmp2, cpu_env, tmp2);
+                gen_helper_add_saturate(tmp2, cpu_env, tmp2, tmp2);
             if (op1 & 1)
                 gen_helper_sub_saturate(tmp, cpu_env, tmp, tmp2);
             else
@@ -9965,7 +9965,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 tmp = load_reg(s, rn);
                 tmp2 = load_reg(s, rm);
                 if (op & 1)
-                    gen_helper_double_saturate(tmp, cpu_env, tmp);
+                    gen_helper_add_saturate(tmp, cpu_env, tmp, tmp);
                 if (op & 2)
                     gen_helper_sub_saturate(tmp, cpu_env, tmp2, tmp);
                 else
-- 
2.17.1

