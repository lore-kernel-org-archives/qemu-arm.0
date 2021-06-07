Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3678061lfa;
        Mon, 7 Jun 2021 10:04:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa5yPE8KltzBYwDpcSPpNL/uT3egqQiR07CDf68ON1SROcySKryS8FHWNwoSJwQjfStsby
X-Received: by 2002:a05:6402:22f7:: with SMTP id dn23mr21333166edb.136.1623085460794;
        Mon, 07 Jun 2021 10:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085460; cv=none;
        d=google.com; s=arc-20160816;
        b=LH61kxnDK9ksT9uuk2NbEdysooZxbh9LDCn6HNft/NlorNOg64TqFro0y90c/lu5QU
         6oezHmLOFvPr9u1oVabBYqMypL8JFpA6nZmSK4ejy+eOOKGgK0SVWs6V/1S5I17+0fy+
         Ftzn5QG8GLNVKy//9G+GrQw2tzVGgU5N62exna7Q18wUbjC6S9tUS//AgD7wMEMjkko2
         i9PfQp83qgU2qvdvY9rHC7egVn+0oXf5yLOhmTo8npmgB9BTIBxi6S+0rrNIN3z70qya
         Rfa4vekdr4fw8xuDI+w89BIWFaUB8a2y3l694eVvdgDpXXKM/jvIYZLhpi1NWvKd6Tth
         tOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=67M3g+mTaDGBPPPiAyLgANuoYcm+1J1sPesRc7OWVmw=;
        b=DzLFTlnUHbs5W9AKIG3KeJiYDVkr8EW0lGcwkf0JGo54Wp05HxuUDDhBYZE3AxCYiO
         6wVToliMqzibzZDfGKMwKeJQA+8by0gLJ7ozLIC3ihMH9XLSoqvrOxzXMf1rQXS+/Th2
         9Fn3JF0EP2cD2zotaa6vhflHX4jN9nvstkwaljWPquAk1v2+Ix2IYOLee4+SoQZHHTqr
         OfFdOwW3pDxicf5yx3nHSxkJPjNkDBzDKDzfqrSRGXp01oy/qED9NjENWJnB/6+z+tpA
         v9goJtrh081dV5Jdj3IaSBwZwUZGVPYuIRQIzim4JF88c7FF1PUFdXvmWLlnLZV2S9kD
         8lcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aZVveoi0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si5502911eds.229.2021.06.07.10.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:04:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aZVveoi0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIfj-0004S8-SS
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaC-0007GK-5y
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:36 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa7-0007tU-Ri
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:35 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso53747wmj.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67M3g+mTaDGBPPPiAyLgANuoYcm+1J1sPesRc7OWVmw=;
 b=aZVveoi0p073kvWK8ecixYWnttRPFU746VWzUUNoKEbi4zkz1XDXoSwVlwE533SjoX
 AWZgiy7jantPu1znHj1P3KkTNvse5mrViZpGiPiVo3Zdi5y+kMsrjD856pYCGbxBGqc8
 EEaAkAimlSWAsLevhT4h/8iNmcnmkMSKyLI6hFjEW4+GAm8PHPBOw9dKuol5XvzkbGuM
 5m7XxckIGXUeAW9ZZ3NgUd3WZfUFOPLeTbsQn5CP+/YZ++6UYnXZVhBgSAqg2UGaVTKE
 qPskvzW+/dHhsvw/WQynK5OXjDTHBeCE00N/gqvwsZaKY8RCOGlDQyoadvkuQAxf3X7Q
 1Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67M3g+mTaDGBPPPiAyLgANuoYcm+1J1sPesRc7OWVmw=;
 b=rYDTBjlYclv0kz/bN7JdjGmfElNDnwj8QJd/iEiGYQT/Buk9r+5oJbyiTtnJ7h5AxU
 16WDc9mGcU08e8pU97OfBp5wItYIuCJBYgHAPisSiiR9F/WNOCx5dNLcQb+frR5m4kzT
 NpuTzQMIeeg1YlcZ6OaMk6f5jRCjXWIhhaF68y2dCsKoVrmL4V8ybW7GgHV+NHQUKUlM
 CeqcDlM8SJc+HUuRI75k1SgZ1z0vfjmjLxKXahkGiiI1k3ckysE/qaDwCd2xKjY2o6Mo
 u/nerpLvs4QTmO1UNIcucoF83N7PFLnu/QaIkfHzbpaQT0UxqWaQYA+E/s1rRwH+RPpP
 gCfQ==
X-Gm-Message-State: AOAM530hzxoe1xIXeFH69FZNwXrpSZRqA7fVhwDJYrinREZ5r2zq2MFx
 saDRTH5ePPcGoO1EJRBgCMyK8x17xnZCju73
X-Received: by 2002:a05:600c:1ca2:: with SMTP id
 k34mr9727601wms.145.1623085110664; 
 Mon, 07 Jun 2021 09:58:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/55] target/arm: Implement MVE DLSTP
Date: Mon,  7 Jun 2021 17:57:34 +0100
Message-Id: <20210607165821.9892-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1kdf58aaCy9+

Implement the MVE DLSTP insn; this is like the existing DLS
insn, except that it must do an FPU access check and it
sets LTPSIZE to the value specified in the insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  |  9 ++++++---
 target/arm/translate.c | 23 +++++++++++++++++++++--
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 4f0c686a3c3..8e1ca7d64a9 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -671,14 +671,17 @@ BL               1111 0. .......... 11.1 ............         @branch24
     # LE and WLS immediate
     %lob_imm 1:10 11:1 !function=times_2
 
-    DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
+    DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001 size=4
     WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
     {
       # This is WLSTP
       WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
       LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
     }
-
-    LCTP         1111 0 0000 000     1111 1110 0000 0000 0001
+    {
+      # This is DLSTP
+      DLS        1111 0 0000 0 size:2 rn:4 1110 0000 0000 0001
+      LCTP       1111 0 0000 000     1111 1110 0000 0000 0001
+    }
   ]
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 79ec185dd83..976c665be9c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8115,13 +8115,32 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
         return false;
     }
     if (a->rn == 13 || a->rn == 15) {
-        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+        /*
+         * For DLSTP rn == 15 is a related encoding (LCTP); the
+         * other cases caught by this condition are all
+         * CONSTRAINED UNPREDICTABLE: we choose to UNDEF
+         */
         return false;
     }
 
-    /* Not a while loop, no tail predication: just set LR to the count */
+    if (a->size != 4) {
+        /* DLSTP */
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return false;
+        }
+        if (!vfp_access_check(s)) {
+            return true;
+        }
+    }
+
+    /* Not a while loop: set LR to the count, and set LTPSIZE for DLSTP */
     tmp = load_reg(s, a->rn);
     store_reg(s, 14, tmp);
+    if (a->size != 4) {
+        /* DLSTP: set FPSCR.LTPSIZE */
+        tmp = tcg_const_i32(a->size);
+        store_cpu_field(tmp, v7m.ltpsize);
+    }
     return true;
 }
 
-- 
2.20.1

