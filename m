Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp367374lft;
        Fri, 8 Jul 2022 09:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vD+s5VkkFgmcMyj83gBRejxyQj9LM1Gsl+W89317o6als5nbbzsr1tr8X/P9WrmE71/YRF
X-Received: by 2002:a05:622a:54e:b0:31d:c3da:fdcd with SMTP id m14-20020a05622a054e00b0031dc3dafdcdmr3637373qtx.417.1657296886276;
        Fri, 08 Jul 2022 09:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657296886; cv=none;
        d=google.com; s=arc-20160816;
        b=ao7GfALFDnuE36R+PYVq9pLLP7+LjU9gpV50so9yYGfigXtEyQwbYqFvAL1o0zcF+p
         tCxmVL//d/sBdpqZ25tYewCu7X7MVUD45IaE6f7SqmJm0J0D7+YL+0c0j3jm+9WjsyHg
         1Ke1ryt7uQ28mfphyTohk23W8hGZol8tp/HDf/cN/C4FmIsNb0J0UKRC8xvIwQlqQyrV
         RxXOkVnNcdNKgzeai2H1iP71VGN0R8HaPLlDeDbws6yh8LSGZGa5lW4ORGY4iX4iImwn
         12rcZSIizchGa93XXNpYEcdkns552GoSeksb3vYz6JVxE68lpuL06JsWN3cNYb9KEKdD
         PiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MRrXY542sxSC6HnNhvHgU6gcthc4iZQb6z5fd5sN5yQ=;
        b=VyxNwZ6KLGJo/vLLGD+oJeQc6ui4HdbwK6nQVwt9JU/wr9AwOWFLnFQXYfl3xkJiLq
         WI3iwNIXkmMVzajIkS/DvCcVwRxl42OIk1AWt2Dmr9wPvYxsAGy4aHwlHehFPYb9cabE
         Oryj03baAuyqzk6ZjHGP+pFdzOGamPXkQClR1AfrtZHVhMGLepaUKuvZF9xRc1jHoIdh
         cFIjn0DWxflXFp1ecRBecuVtUek523hukrV2kFvPyi0YzdANTGLDIQObyxcsFcxNcknm
         wsRhzv1Bops9k9SI9SnR+trIMzqJoXha0yg8ZiNxgRIm1HjSpYPB1DzAlVu8I8vrkaBy
         AfpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oy9P6QLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bz8-20020a05622a1e8800b002f3ed475c2dsi14726731qtb.491.2022.07.08.09.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 09:14:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oy9P6QLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qcv-0006gU-N1
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 12:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDV-0006ec-D8
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDT-0002WB-QS
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:48:29 -0400
Received: by mail-pj1-x1032.google.com with SMTP id a15so11637437pjs.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRrXY542sxSC6HnNhvHgU6gcthc4iZQb6z5fd5sN5yQ=;
 b=oy9P6QLJFpVzQfPTl+1dkA12XPxWvQEkFRK3GHArgM+CAdseCpBg5wOuJY0x6Bnx8T
 Y+oejF7vkJAI7qVs6lbeMy94tEb2BbkHkZyZrzkqbJUzftPAdCRtAaOrhQ08IWjvxBf8
 xS7Z/57NA0/q/HOF8b4N2qgtZVzy7ZZBPt9W8yfdQs2oQUVJ0pDzxtk+YBE7aOO5plWA
 Z0mrBhrBHb4MGxJJA3G7YpKoXc1sOZEtzT8GkdjhHfnJFcUI9+HaCKV+MjdnwRoJ9pmW
 FmKJgHAbfm35PN9ssYUFjoxo7s/Gj97QWbrLk1WuEGLK/1aKzglosxRN8IBYmEDcKU/H
 B95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRrXY542sxSC6HnNhvHgU6gcthc4iZQb6z5fd5sN5yQ=;
 b=CFxEshA5xEaV8/UHKT7rLEP0gEJTgOXy6jkLfFLGKBRkQAm9eOMPiYG66RhjWXUsxK
 IT6Y8oiTZVc5MeTiwJfuQ2yMXE+cxQDizyLOKPEb0BQENKgKrGvx/NXul6YJzKnq+xRj
 V7YSBwtkSFfDazXQKF9nmdLEPuGlURDPbBYkCmHjqtzBpETZUArErsRD6WjSA6L4E22B
 mUiLGFMgeheJFFtKNx49ohV3PR2VVL5glkRLps7Hr/MxmWOhKJE6iEWS0W0SNZ89rnSd
 vbd/lcWMIvqw66z9L1k3+22dXKCcL1r/LBhTOQKA8r9BLwmXC2vreabznhdHrulG9ZdG
 3cDw==
X-Gm-Message-State: AJIora8TQ7ZcUuL71nKBT2sdTFdOOeRrDwLyNf5FpifVcLKzKulgysBj
 SRFBiBzPGgLm4OQmANrKHx51J4YBzEd7rtQl
X-Received: by 2002:a17:90a:3e09:b0:1ef:8399:398b with SMTP id
 j9-20020a17090a3e0900b001ef8399398bmr487886pjc.39.1657295306991; 
 Fri, 08 Jul 2022 08:48:26 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 27/29] aarch64: Tidy reginfo dumping ahead of ZA state
Date: Fri,  8 Jul 2022 21:16:58 +0530
Message-Id: <20220708154700.18682-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TesVdTxMKPLT

A misalignment for sve_vl, plus add a bit more space
on the left for the ZA[n] field name.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_aarch64.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index b86864d..9ea0acf 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -183,6 +183,18 @@ static int sve_preg_is_eq(int vq, const void *p1, const void *p2)
     return memcmp(p1, p2, vq * 2) == 0;
 }
 
+static void sve_dump_zreg(FILE *f, int vq, const uint64_t *z)
+{
+    const char *pad = "";
+    int q;
+
+    for (q = 0; q < vq; q++) {
+        fprintf(f, "%s[%-2d] %016" PRIx64 "%016" PRIx64 "\n",
+                pad, q, z[2 * q + 1], z[2 * q]);
+        pad = "           "; /* 11 spaces */
+    }
+}
+
 static void sve_dump_preg(FILE *f, int vq, const uint16_t *p)
 {
     int q;
@@ -211,10 +223,10 @@ static void sve_dump_zreg_diff(FILE *f, int vq, const uint64_t *za,
         uint64_t zb0 = zb[2 * q], zb1 = zb[2 * q + 1];
 
         if (za0 != zb0 || za1 != zb1) {
-            fprintf(f, "%sq%-2d: %016" PRIx64 "%016" PRIx64
+            fprintf(f, "%s[%-2d]: %016" PRIx64 "%016" PRIx64
                     " vs %016" PRIx64 "%016" PRIx64"\n",
                     pad, q, za1, za0, zb1, zb0);
-            pad = "      ";
+            pad = "           "; /* 11 spaces */
         }
     }
 }
@@ -237,19 +249,14 @@ void reginfo_dump(struct reginfo *ri, FILE * f)
 
     if (ri->sve_vl) {
         int vq = sve_vq_from_vl(ri->sve_vl);
-        int q;
 
         fprintf(f, "  vl     : %d\n", ri->sve_vl);
 
         for (i = 0; i < SVE_NUM_ZREGS; i++) {
             uint64_t *z = reginfo_zreg(ri, vq, i);
 
-            fprintf(f, "  Z%-2d q%-2d: %016" PRIx64 "%016" PRIx64 "\n",
-                    i, 0, z[1], z[0]);
-            for (q = 1; q < vq; ++q) {
-                fprintf(f, "      q%-2d: %016" PRIx64 "%016" PRIx64 "\n",
-                        q, z[q * 2 + 1], z[q * 2]);
-            }
+            fprintf(f, "  Z%-2d    : ", i);
+            sve_dump_zreg(f, vq, z);
         }
 
         for (i = 0; i < SVE_NUM_PREGS + 1; i++) {
@@ -312,7 +319,7 @@ void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
     }
 
     if (m->sve_vl != a->sve_vl) {
-        fprintf(f, "  vl    : %d vs %d\n", m->sve_vl, a->sve_vl);
+        fprintf(f, "  vl     : %d vs %d\n", m->sve_vl, a->sve_vl);
     }
 
     if (m->sve_vl) {
@@ -323,7 +330,7 @@ void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
             uint64_t *za = reginfo_zreg(a, vq, i);
 
             if (!sve_zreg_is_eq(vq, zm, za)) {
-                fprintf(f, "  Z%-2d ", i);
+                fprintf(f, "  Z%-2d    : ", i);
                 sve_dump_zreg_diff(f, vq, zm, za);
             }
         }
-- 
2.34.1

