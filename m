Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1499468lfb;
        Mon, 19 Apr 2021 13:48:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCiJghzYMP5OouDkmfNZnpJDO6qF8kvujyRNVzIiTXPDySbJgNoA7ynZUAgJSUfoWeaHTv
X-Received: by 2002:a05:6e02:b24:: with SMTP id e4mr19585939ilu.30.1618865295709;
        Mon, 19 Apr 2021 13:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618865295; cv=none;
        d=google.com; s=arc-20160816;
        b=vS3oF5AYJTZ5KOdarahgomG/H7Jq7as2r7TATieq49iu54GiyhihfRSXwxW1m41Nxi
         FGsb8dY1tywRCVM7rhVl9ExZbgBN7CKz1gEo0p5F/UUbkVyuJEeTnnRhLpq8CC0E8+Db
         5aYlXGHK/ubdBR2jbG+tnGOQqLK0LIMTpCX2k4JXLIFspLrTpmyGiWGn8URt3AEhCFSo
         WhQ9Jd2CkIlJrONAdgGJvmc+40rlEgEm0WJw/KlO0S9vqSFTmt5mtznrfm5QKoKlm8Dk
         k2kU12/VGwrYJimfljGw+E4kcrq5Dwe9aLLIQ0CMdBatHqUYIaTseSICBdkidDMnvIDm
         0slQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oROkq8j4qfMtXcJP6tdXRKN1rqEpL50c3TD7tut7lv8=;
        b=KJnrhVeW/7cTfGxahIC5Sk6fzI9XP98SDvG5vG0qixKJxskR3o9gvhyfNjHACeOzET
         +6GIqEBbqRCmkFCfoc6a/A4M2etpJby5McSxhpSiO4t/Zfgu6mAB45YQXMGFla87lEPO
         2bn+iz2nD5CKqbY0QZ6k/8VvVMiqkbUymf4KV/w6qaVi5BcQwAyp4yoEmjec16f0IFxG
         91CBNV/lLR1yyn/Ghti+G7fsRauwLZ6R1+ZAKiSVqzX2AGKEUYlZ+EKDhWJPZTkHq440
         K8LBcV6HKedqoac4eJSnGPX0XzfPd4NaAbOCZBKGC9ovg7l/iKiZDNopVHmW+c7OAxD4
         MlwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iz+/xBzL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si16603665ilp.47.2021.04.19.13.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iz+/xBzL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYaoZ-0000v4-0L
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR1-00087E-Q1
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:55 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:41857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQy-0002ol-Nw
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:55 -0400
Received: by mail-qt1-x836.google.com with SMTP id z25so4396982qtn.8
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oROkq8j4qfMtXcJP6tdXRKN1rqEpL50c3TD7tut7lv8=;
 b=iz+/xBzL0gxiLMfctUdsKP/t7Di+m1KxYxoNLsNsqKsQZj5QopV9G2gVNzyiw5s/fO
 M6zGLTK9vchy872BXVyCcNWdhtMBcPbJYCx6HcQfQUvocNGonC1GwvijNbeFEdtJalX/
 uoS5/ui/H0tB+B9NVRO+D6p7UiQ7k7ty9ZikymRHRlofQaveD25Rf54ju8ZTw+yCoAWX
 YdH7llB+Hnh3CnGB37+KoYOVChbs7k8Ru43C3s9F20/WzBeqjT1A34nNYRogSmuujIAm
 JDYIbeYV8ohilyCkfodi/NJaSRs9J+LRjVKFyDT3F3wTPs4AOFhSv3ikyoCD/3iemQae
 ywBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oROkq8j4qfMtXcJP6tdXRKN1rqEpL50c3TD7tut7lv8=;
 b=rp92OYDUh3laTHbvligMHo2J6HTQT5L8D7YoGdVopMXrVDOzrqI9XjGgA0Duoxy5LY
 0L5u+jFnbgNBNkA+Rs48HOPUyaXZdCoigQiVPye7IYWn4/V0tgnjojd4/r88sGnC4Fkc
 w+gTzLzi7BR6VcqUpy/ogAgGNm7xDR5gngKN3nJFJksZ+5TC2eztzPtXNZfIn33I8g/P
 30NKOe2Avr8I4xLKdQlkhX6MC/r6r27/PKCLlfufyRCIeaRwrqC9tMHejwiwz2+OQtbc
 JCoVZt1xhPklkj2ouWpVZZ6TB0+20qTYrMvqydNGKS2noVazO0HlFStqRq1dI0Nq39N+
 mWJQ==
X-Gm-Message-State: AOAM5320DGkbyn5tnoUPs8DMmn6NUIgfy7EZ5jcZC/ohZNHMotSIBiNi
 JnB0llalTUSDIeyV54BMBW4z2g==
X-Received: by 2002:a05:622a:52:: with SMTP id
 y18mr13387646qtw.216.1618863831812; 
 Mon, 19 Apr 2021 13:23:51 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/31] target/arm: Enforce alignment for aa64 vector
 LDn/STn (multiple)
Date: Mon, 19 Apr 2021 13:22:55 -0700
Message-Id: <20210419202257.161730-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QJWbBmS+5W+3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3bda16ecd..2a82dbbd6d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3635,7 +3635,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     bool is_postidx = extract32(insn, 23, 1);
     bool is_q = extract32(insn, 30, 1);
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
-    MemOp endian = s->be_data;
+    MemOp endian, align, mop;
 
     int total;    /* total bytes */
     int elements; /* elements per vector */
@@ -3703,6 +3703,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
@@ -3721,11 +3722,17 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
+    align = MO_ALIGN;
     if (selem == 1 && endian == MO_LE) {
+        align = pow2_align(size);
         size = 3;
     }
-    elements = (is_q ? 16 : 8) >> size;
+    if (!s->align_mem) {
+        align = 0;
+    }
+    mop = endian | size | align;
 
+    elements = (is_q ? 16 : 8) >> size;
     tcg_ebytes = tcg_const_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
@@ -3734,9 +3741,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size | endian);
+                    do_vec_st(s, tt, e, clean_addr, mop);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size | endian);
+                    do_vec_ld(s, tt, e, clean_addr, mop);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
-- 
2.25.1

