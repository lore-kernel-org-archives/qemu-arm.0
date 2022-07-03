Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2453404lft;
        Sun, 3 Jul 2022 02:16:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tc7P1CPk6qEf/ukQpg91GepqzhAIx9kZWx9VZT/JfbRtHOd3ER0Hg7aycb2S+M9yQOwb4Q
X-Received: by 2002:a81:5a82:0:b0:318:52ce:8f7b with SMTP id o124-20020a815a82000000b0031852ce8f7bmr26849060ywb.228.1656839792076;
        Sun, 03 Jul 2022 02:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839792; cv=none;
        d=google.com; s=arc-20160816;
        b=Yx4rO/LBgzv5bjDduwx7tbgwTiypkTVlXthWe89akUKPs4TsHKuPMmbDDq62Lo6fNI
         9N1OFIF3vZKDLYxihOluY6ZrL09XApqPmWqqVn8jCorvZ0RPyR2RIvCrerXz3BXbaaQ7
         mowdMqighGR8tMiqecvXld7YQpaoA0xOC94whXcecAKjTb9xuERJ6DZ2B2znTwEG5PUK
         uO2EdpiMISyfocIu7FW3kiUxepX8cVl6XS0FcL3gg0G04jG4hr1El58GGktQeu9H3QWN
         q8yESHFLhzmty1DQIw9R1XemWLUAZYkillS5UuShpVkTr8kvxMPhv5i0JNwjjg4EtAGJ
         UZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UbIrVuD695ihfGEi7s3Q8RXV9zhlhUlzREnUxvNfINo=;
        b=teWOOVgqZBBqMCc5G3kUJ3zZa6bVzC3JgTB/TgQYBJXSlolwcoxYZ2RLSqm3gNiJP8
         i1Lp+Obn/IfrxOmMz9srL6JMEuTzxxnbVnAwJhQ6bU/7l+p7MFneq2Gb/roGDjF9x4Np
         uPSWo1LRkgNzPu0sZP7M6Q1StzOzibiSG1PXFm7QooEfWTk4N7F3VVohZ86rUDtYHqAk
         BQdSx0qV1aTeZge7Gh3MdCwzhjx6O8oVqfqFowIaGO+CpxmNy7KavePuZQ8Ln6i0goZ6
         T4+IbSL6tRdSHDOJjeQamBAMgdqtD8YabycU/0cdv5bmb40Au3o/cnEjZjxu6DS60LbI
         1sFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIWcNY28;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k202-20020a8124d3000000b002f4db507828si35918476ywk.378.2022.07.03.02.16.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:16:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIWcNY28;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7viR-0006W8-DS
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzS-0001O1-OK
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:02 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzR-0006it-4h
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y141so6343913pfb.7
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UbIrVuD695ihfGEi7s3Q8RXV9zhlhUlzREnUxvNfINo=;
 b=KIWcNY28+3vKor2IVOk2aqpth0VSI+bnjY2HxJ+/8WhEPB7mSOPTdpWv8LWUjBfIc2
 GeQclk9nWaVZc1OPV9maH9GTBYR9Cf+o218g1SmVDAgO0nRVyexs4Vu0rM0lgDgT4lPJ
 n4FT46PigOq2Q4VrsEHgGKwfX4P9Va6bpCDDj6HCIvKOw5XcNLHHBlO2YWUoDXHdT9C2
 tfF2q2PC8eC13PzB0FTBi9sTYIDtsdtCMTirS5AR9BxJrS714/xWrd/u/Y9AWVY4MDix
 Br+u1Io3Wj/c8zDxanx5lqv9psqEd67yjuAMPCHS0itj0CyqXk7nDgf226/Z9p41QZUE
 0vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UbIrVuD695ihfGEi7s3Q8RXV9zhlhUlzREnUxvNfINo=;
 b=uGRaixYqNo73CqnGE0FnqO1422hOAk0jApml2uGoTJyAfgP5do40YOCVujhVdI2+yP
 VJM3A2cv9xEzgXnxiOmiB3GCvVzCUuGf+vjdo0FY09UsGsg/nGtfDIEJkZhDqZq8OsSz
 HyVkMdRviB52mcsz27ISDEk25d4vdi5KQwe5juOOoaqApo/eLDGMkw+FCypwnO07TZm5
 9U1wvKt6iiK7DUZKEo2y9LUov3W/qX589BHyPTDaHyUBagh0Is2OFTm34r4NpvtyxcLY
 zMPMxlsiluatRfsIsLV5VTcg1MNLDya7pCdCZrgvib+7EsJ/2IhFTxXtzcwhAoUoAsL8
 hXUg==
X-Gm-Message-State: AJIora89yAYtqDL+fcJqIKkGlZGzBMrikGc1UzQG7kkdZERE0uwJlWJc
 OsVzGuEOlLQCPTcU4vDQgOWTmL0p2WHGoZy3
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id
 b11-20020a056a000a8b00b004cd60304df3mr29033198pfl.40.1656836999819; 
 Sun, 03 Jul 2022 01:29:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 50/62] target/arm: Only use ARMMMUIdx_Stage1* for two-stage
 translation
Date: Sun,  3 Jul 2022 13:54:07 +0530
Message-Id: <20220703082419.770989-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vEV22YP6DAPi

If stage2 is disabled, we do not need to adjust mmu_idx.
Below, we'll use get_phys_addr_lpae and not recurse.
Adjust regime_is_user so that it can be used for E10_0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a2c441d947..e42286b4c1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -90,6 +90,7 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
@@ -99,10 +100,6 @@ static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     default:
         return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
     }
 }
 
@@ -2530,10 +2527,6 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                           s1_mmu_idx, is_secure,
                                           result, fi);
         }
-        /*
-         * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-         */
-        mmu_idx = s1_mmu_idx;
     }
 
     /*
-- 
2.34.1

