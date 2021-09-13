Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3518450lfb;
        Mon, 13 Sep 2021 03:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz59jM7JTvOq6X75QBwam8SZl/JwHsCnChlZmyt1vp1XRzIWWLFCA78arwm2snvzXTcoUv1
X-Received: by 2002:a67:67c1:: with SMTP id b184mr1088987vsc.59.1631527543554;
        Mon, 13 Sep 2021 03:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527543; cv=none;
        d=google.com; s=arc-20160816;
        b=Uki+Mf3+8Q/NEWrIByrZu5yC9xipDjdcMYgaJbUbgICQPaHwPt04JCQ7vxu9E1tRFY
         vxPI/lK03PNmfxtPD/AOFz/7H4xIsIi5aQK0hWJT+0HwTYFH8EDofot9+GvldPzGzCCp
         ANCeCe0h8wlUbI35SXKzFweGBHKXdZlc6qTXpRGSO6DaMIXnhe8UB72Ehb8zadlm1jrD
         8/orK84xeGvT0Z8F9NZwXeAGT8UKBpqnxMXW+npD0Atbc2HHAWgTzM9cnK3m4vkyWE/G
         K33jaJlRL8Yus66Y+U7iBWuZbyVhMrGKbWlXkhQOlOA9+Y/SQixtFN7M6koys8O5FJYK
         4szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PsqyvwVa655omQdFIHqiDmLC7YzT5aRUDOlK0c8rs+c=;
        b=QYDev4rhh72KME9ZbmLt+1ULItH4PJg+ndjoNE6kQQN0BxablOn3iTnktqrwb9zhRn
         pVqHW4Rd7yW5PGkQJeuvkuzXm2eLfjQVnaVYUCfEJ5Fwu1EcNKDOvt6pFrhR5pPGy7JM
         XGqoeOECYZEpnlTwlmenm19NlKKv6ph0sDVkRG0ud50ut6wrRPPYqrFc+4+AjgZEFJyp
         VsX3sZVzS9BFACuTaeyPeUkBzSbo27hyUSs6RLqIzwwKEvopLWTcPSbsJ+H6ZKFvMY2g
         C/pyQYd6qVC0JafwX7EcwqU3XN8myB14BxyAkTGRe5CQxXOCNc077fxE63kOQI9pHrGj
         p/Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cEEkTQd2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb23si1286265vkb.17.2021.09.13.03.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cEEkTQd2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPiqM-0006EJ-Pp
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifr-0007FM-IR
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifo-0001uR-Lo
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so6149897wms.2
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PsqyvwVa655omQdFIHqiDmLC7YzT5aRUDOlK0c8rs+c=;
 b=cEEkTQd2laaceVcbDBsnMVz7KuOGiVK1Z+EN0pjb6S4xob5tUd36jqka/iwdlyGqRa
 jUmvMG72mcLBGdlRwwFcOuHTUZCmnj3oCrLYhZ5Yihm9zpj/c3fMDOAWreV9GBMz87wP
 k1w5Hp4wqkczGpBRnjDvesErT0GNOr1Unmdc8dyYK5TVpCHwJ38PCerNRz/hESIu6a4n
 dnINQztDhO96iK63wDXeR8f1xcoiiW1klqSS/LzEbMzmJADgEfz7yU1q0Xwu2UrXVFL0
 N9r5/1SF76LvnSAya4INQcLzTmpxP0UEm/nRJ8CC8pmPsHPjjQnNm6mQH9lgPr2gfH8R
 Owhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PsqyvwVa655omQdFIHqiDmLC7YzT5aRUDOlK0c8rs+c=;
 b=h7k/VIxmRp2LnyIebeGxczdhoq+POBSpZEjW0jtyfy0qEFdOo8mXZkcZXGcS9o7Sic
 VRxT5aPSdUMsCqVnk1lmR7CXkE8FosYmw9tpopHq0uNAYBvGoP/jwhoTiH98CsWrInk8
 HDOc29BABs4NOwrfbxTXS0fTPoeWxz5S+mSBkFbBE8Q1SN5R6+JrwFZA38b2BqBPXkkV
 KUwJ+8n9tVlCQyDHh9tkjJa0Evm/yEmj7saRYY+mZkkfkSCgAf/8RCQ4qdrI2S4JzvnB
 GrE+t4lI5KKS5XRg3lCMCbn/xIWPWlH4S92xj7yoJakkIGiAU801/Pqm5oS2B6BphpmK
 ICMA==
X-Gm-Message-State: AOAM532/nxAbKQ9TpHyfF5EZq5ulBtBr+7ahAVmaqwlspqJ/PhOKxx/u
 TFPvdPLsq4TpKXk+8vou+M96hMDM24ARYg==
X-Received: by 2002:a05:600c:3392:: with SMTP id
 o18mr9259153wmp.92.1631526887472; 
 Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] target/arm: Optimize MVE VDUP
Date: Mon, 13 Sep 2021 10:54:35 +0100
Message-Id: <20210913095440.13462-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 86Dhf3wP+fWM

Optimize the MVE VDUP insns by using TCG vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d30c7e57ea3..13de55242e2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -500,11 +500,15 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
     rt = load_reg(s, a->rt);
-    tcg_gen_dup_i32(a->size, rt, rt);
-    gen_helper_mve_vdup(cpu_env, qd, rt);
-    tcg_temp_free_ptr(qd);
+    if (mve_no_predication(s)) {
+        tcg_gen_gvec_dup_i32(a->size, mve_qreg_offset(a->qd), 16, 16, rt);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        tcg_gen_dup_i32(a->size, rt, rt);
+        gen_helper_mve_vdup(cpu_env, qd, rt);
+        tcg_temp_free_ptr(qd);
+    }
     tcg_temp_free_i32(rt);
     mve_update_eci(s);
     return true;
-- 
2.20.1

