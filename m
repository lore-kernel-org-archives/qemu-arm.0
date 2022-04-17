Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1270054lfk;
        Sun, 17 Apr 2022 10:59:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5fSQ9ZtBnRSMv9UOPsHltOF/uWvkR/aGtwtB1QwGwCVelVPsHr7vHBhSUFo+Pgr6q+ppG
X-Received: by 2002:a05:6214:21a9:b0:446:3c84:a188 with SMTP id t9-20020a05621421a900b004463c84a188mr5760115qvc.55.1650218368038;
        Sun, 17 Apr 2022 10:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650218368; cv=none;
        d=google.com; s=arc-20160816;
        b=0JN1D2ugW+/k7k8WB2585XUS5lPMUfl88yTPW8aRu1HEejmEZwIasdkOfJaEwBsMZK
         Xyg9XbT6sCC8Ts74LI9Juu1v9GZIeg+T9U942sN9kgvtn0plGnI23KUklvvtqwOEz/gF
         kHcHXnhbhPnPA9OOxQWFdwxAeVU9aTypI86VRMaMqhnKkIJlD8UbUom7ldf1bcVSnoIn
         kIkij8lNzKHN9hJYuGkIvaULPdZrF8/6JHq3NlWpSW2bl1/Ile9UYIgYHEhoGd5vUCsl
         Xp2EmSau/8B08LQey9GbrZoiCy+gfFWQekxeknPiz+eEB6kh1pzmJPB9u9LKHZKYStI9
         bKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=z284YO2l+zNv3weW3jS6RSJVzTJCNg6AbcZ1VqRFtfo=;
        b=VgcxUSH8891VwO9VXPSkQN/MPkc83FVWjGadrTnD+PYZ8uk7OD3pK+3fkMPFvCftyf
         eLgsYNijZOX1k8JYHCx9+k4VREPzMwpONIrYCzBtl4yVYUVDw45HailpvzZ/p6g35j9k
         cbl8BQ27gwOZ4rl2gVdsKzoxrjyzaE1cYaf2FS13A5tWfoUYK4DuFLWE2JjrK846p57V
         EftZvpEjZFZcZZcSL3VhZtbTEoYRoQfnqX/Lmxo62Js0mQJO0XroZhHVe32tIQlIen5i
         xPZeypJF4EfBjJ1Bugb1vUOWz1/FyWmJSeSWa7CWJzSP1y5Uy75qBfWkYgzLcVrNMdFp
         hkIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEMyygvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib11-20020a0562141c8b00b004462093ad9dsi2367359qvb.394.2022.04.17.10.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 10:59:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEMyygvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9BG-0004f8-Ay
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 13:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x5-0000iu-97
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:48 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x3-0003JT-3K
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id bg24so11337303pjb.1
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z284YO2l+zNv3weW3jS6RSJVzTJCNg6AbcZ1VqRFtfo=;
 b=xEMyygvUXN6bfDFI+qFB8xYg7Yc899cQXWUScaoDeYT+iLdPSDz52Sgrww4GTluvJx
 8kjEMBDub64QOMrG/1QjBZtH7ttYlfPbveFMpYMjxp2HwoMtfUWjbSVtamU3J2WZKWkv
 epZNeylcWT88FK2bANnV8JAoCtp5vnLKXm2K7ha7NQsR2JexI+MOkjvaM9shDgaxSrbp
 ytLWELUpKTVHbJl+bhVRhYFb0oOpkrg9brLBeTmMRcQOjP3xz7iNfO4QWhBVoD8fSFlx
 NUC6L/j8h7a7Li+1TqPUaEi2p+9jUbInQiPWIFk1LSF64jFtY0VXzQ0parAv4K6wn8Gy
 Wydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z284YO2l+zNv3weW3jS6RSJVzTJCNg6AbcZ1VqRFtfo=;
 b=H/W++T3WaZyHqJij0SvdBNYgQmLl+Q4vXq0x/wqAGgcPvaZxcS721hsRh8AoLheLlB
 WMm4XC+EOi1OxHkBq2KBUy1Tdfq77mOwnJCAozuHgLy0QrOABZpifvy9UXz1h+6LSb2A
 Gbt6mIYho6xQU8O/o2Gsu9WmIfn2pIp5vHQdkn2R9UOTGSTnPmksoLrUENKNdFJmCTKW
 24ZOYhqEqvmHabcxlzMYkYOeWW4w4xQLysDDZrdyHFP6BjG3wNkiNP3wB0HvK/brwZBe
 1tGG9pDpX72Zl7Oj2nV9xnEdsUu+mBQy3gRP1AT5WZe9wHrpSDgdablLlIjrlX9NoxbW
 B+Bg==
X-Gm-Message-State: AOAM533gOCdaRgyDOofOr3cUNU/79n0oU2H8HYBtHvzuUWVR4BppRo+Z
 NPRL43/7DEq/Ead9DMUNybnXCw==
X-Received: by 2002:a17:902:ce0f:b0:156:5a4:926c with SMTP id
 k15-20020a170902ce0f00b0015605a4926cmr7557717plg.3.1650217482752; 
 Sun, 17 Apr 2022 10:44:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/60] target/arm: Simplify gen_sar
Date: Sun, 17 Apr 2022 10:43:41 -0700
Message-Id: <20220417174426.711829-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: owuaMKYeEyHW

Use tcg_gen_umin_i32 instead of tcg_gen_movcond_i32.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 57631c9fa1..8d6534f9a5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -568,12 +568,10 @@ GEN_SHIFT(shr)
 
 static void gen_sar(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
 {
-    TCGv_i32 tmp1, tmp2;
-    tmp1 = tcg_temp_new_i32();
+    TCGv_i32 tmp1 = tcg_temp_new_i32();
+
     tcg_gen_andi_i32(tmp1, t1, 0xff);
-    tmp2 = tcg_const_i32(0x1f);
-    tcg_gen_movcond_i32(TCG_COND_GTU, tmp1, tmp1, tmp2, tmp2, tmp1);
-    tcg_temp_free_i32(tmp2);
+    tcg_gen_umin_i32(tmp1, tmp1, tcg_constant_i32(31));
     tcg_gen_sar_i32(dest, t0, tmp1);
     tcg_temp_free_i32(tmp1);
 }
-- 
2.25.1

