Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2170673ejy;
        Mon, 3 Jul 2023 03:06:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5eJES78hjCm17JQ1+75yP8wA+2dS0f9UAYoaTFrI956OrWLEXfHxm7D4JaAaPdJh1I7+J+
X-Received: by 2002:a05:622a:24b:b0:3f5:2549:3355 with SMTP id c11-20020a05622a024b00b003f525493355mr14069155qtx.43.1688378776418;
        Mon, 03 Jul 2023 03:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688378776; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAn9MbwOoHFrk6FqOrOxTIwmEs/gKiJEz2mC7Ami43WaVt1bPMmAPQ1SUXwalipNnU
         4iR/oc7DBtBoXweJB4sL8ttNoJip+au7JBhZiNju7vYgmb8F2miIpbN2vxTh5kOcq+/V
         W7418xoQUxHhGk6GHPzue2fmIApMTyHAbieH/tOhd0iLInKMTUlU2ZFpjq4eZiP3jsOK
         1p11/GrJtldQXVzYzjhPA/+sRPB7/skCYNxq+090pNkbgNmtMVy2crpTi8V88565XOR0
         EUdQaoh+rO6h3hi+54pw7dmB95J7dsQKC64gcwut1NQJpPk8Wad3EKEP5n6Q/sbdez5g
         EO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=yWyXvS70poAiI7EHV9QZjCTCVqkBBA9u5IF3rkrcm2a/Uz8b9rCsGeXMcx+KrihIq5
         LmZDuXXaIjQEHTgm9+QjzBoERV0lkAKHJE/3/znED2SfpyViRP+t3DZPuBrMDuzLz45/
         G8+EENHlbYlnS2KwWLMs/nJ/kQS1sH5rRr6tLQDzVoswSzrMf8hjXHQC9FfqmQwH76+j
         5z0F0p2THDmkb2KeXxzmCUf6aBI0YyjGrvry732zqbe28PSrMVTQn0k4Uwh8R65J19Po
         snu6TG9UK6tduGD6yxJo3hxkVXwtXNLt8lHELBAOZ0WaaF4sqosTxGWspzMAd0E3jWUq
         P5/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="joR4m/Cl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05622a014800b0040359e354besi1556816qtw.768.2023.07.03.03.06.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:06:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="joR4m/Cl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRc-00033H-R8; Mon, 03 Jul 2023 06:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRS-0002qX-5j
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRG-0005rS-FS
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:57 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3112f5ab0b1so4700638f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378741; x=1690970741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
 b=joR4m/ClJeRpoob+t5+QnStkdNFoxeTqfQX2yViVC46KO8kYWovTf89P8V7IYr+Oos
 EvFwMsu2XhPCpfSYyOyj197LvUN+uyCBja2AyU9fy3uoIrlrnS4KRBC0izuUzOzHYgbm
 smVoL85LinnLzkiXD+MISmbYxQWwCe6bjaY81jTj2uBWzQXqHnorTvcc7i4CS7qx5iQx
 OoQ2GqgjtBUrJwRByW8dE1iDFMOBnuZcNz4kaO2RiClgTvzKykzFAEnfgWrJbFR2mg5t
 12oVanW9YC6tUBLRtS4MOWkZOPJTlweeCB+/D7QSfC/GHQi/rciO8hVKTc0Nx5POIjV4
 JuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378741; x=1690970741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
 b=GABJb9KhmbrceaQ48cInsoF561uX6ZRddOAdkjkd9ACbPO3FMm9lALpDnouc+0szDV
 XfHn7t12SdtRFORQFa09SEHUGoo35k7lq659qAdNedUsFtSRAq3SQv3i5vntckGwyA62
 s+/tnOGRUTH6BtIsjb5Fo3bkebvpW1cegJuTmOlPZYIb20MH1WXd8gY7FjHpu/xP/IYt
 AbyF7Q4Nj/mWWDEWWZmSWvKmORwxkJm1mVL16NQg0Q5K733H1uguqblJNb0ovpMdqs+z
 wcYrn9hMwlreDRORo4MoQNedW+FFLhSqnUJKVl3uNWFOOituVqtdM3FN6NmLU8ORrotC
 9OXQ==
X-Gm-Message-State: ABy/qLaoL60Rz9ZEqhSswCQayal+QfM31uJ1zXrzchG8aMIJhk8dd5+9
 D0bwqtwML98kCnMjdT+8+IQc42tcxCLqN6hRJs6Upg==
X-Received: by 2002:adf:fd43:0:b0:313:f5f8:a331 with SMTP id
 h3-20020adffd43000000b00313f5f8a331mr8284810wrs.34.1688378740035; 
 Mon, 03 Jul 2023 03:05:40 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 17/37] target/ppc: Use aesenc_SB_SR_MC_AK
Date: Mon,  3 Jul 2023 12:05:00 +0200
Message-Id: <20230703100520.68224-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Nvi1BSaxSc8W

This implements the VCIPHER instruction.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 15f07fca2b..1e477924b7 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2933,17 +2933,11 @@ void helper_vsbox(ppc_avr_t *r, ppc_avr_t *a)
 
 void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u32) {
-        result.VsrW(i) = b->VsrW(i) ^
-            (AES_Te0[a->VsrB(AES_shifts[4 * i + 0])] ^
-             AES_Te1[a->VsrB(AES_shifts[4 * i + 1])] ^
-             AES_Te2[a->VsrB(AES_shifts[4 * i + 2])] ^
-             AES_Te3[a->VsrB(AES_shifts[4 * i + 3])]);
-    }
-    *r = result;
+    aesenc_SB_SR_MC_AK(ad, st, rk, true);
 }
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1

