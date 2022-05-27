Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1229514lfh;
        Fri, 27 May 2022 12:06:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWr6l1BhDbbmXBz9dKwtSitSWLLGM1h82a6jWVcXwc7SrgYnMXgslSdsQlW8RQcK+qW3qn
X-Received: by 2002:a05:622a:4cd:b0:2f9:3fbd:722a with SMTP id q13-20020a05622a04cd00b002f93fbd722amr18133402qtx.158.1653678392257;
        Fri, 27 May 2022 12:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678392; cv=none;
        d=google.com; s=arc-20160816;
        b=QrAO7SXDD7BuRUMDy3LBrxHKwPRyHa+1fffixbDGnQnBemUHfch4EmckHLKEgAcweh
         lsxRxoLBn02uSM05slTMFPeffkDvtjhh8gvglHc89mGx6EgoCL2taWBQdPiwKumGrw3g
         LdQfo/1qh9ecPJsjtHQDRDPxTNcvfYDSIixvDH/amN0+fQfaz5pa98NwUWtX29XY03K5
         0NrJCv6TA9/SyLboSyesqNZw3ineDbq+3Kh+94iOEJhn7uMITbeSLPrasEwAes5W1jdq
         jUUqpA3qe8W9mmXzSqjBkispgwBLHWy/2XGfHQLvPvnfUShKHwTXo4dI89o34tXnjVxp
         1MRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mOVNnulMY9/cI7p7C/1byK8K0DnOS+U6K67oQeWaeLQ=;
        b=gt8hcsd8C9d10IkSPP6wsozv/AZdPzLuVNGaEVQRltJiq2J3yqdSrceQv63dwSEorz
         aBAAhoPDR1n7zAOlM1iHFu3qJu8c4+DMRzeMgBNBbmcAOgas/eCWNoSy0djLGOH4CoEV
         WhXjMf5gN3E4TccFysCSeh3rq6NG5DbJBhzE6SA7AAZ2r3ufb/5c7SNSXNKliI3H34wN
         tEKL4IT0Ym4QoPZgD9XvWfPrPToiqpEUJI4xSinccGTppjoeTAeOCCs99cqy53Imdy1G
         VKA6DAAm+dk9fBUSD7AbmEFyKCQhuPtnLmICdOZXqpLP4knkirVE1fq3bhLY2QXS4SWB
         CtNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ikO8/36A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a05622a039100b002f33ca0d708si3238917qtx.661.2022.05.27.12.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ikO8/36A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufI7-0002TC-P7
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecN-0003cG-0t
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:23 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004RM-Ga
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b135so4961573pfb.12
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOVNnulMY9/cI7p7C/1byK8K0DnOS+U6K67oQeWaeLQ=;
 b=ikO8/36AV7pPnNzZCIXZObumHQrq24CqYwtqsuNR5guYElIIBKyVT76YiiKnqazcaU
 odDJg4N9qseBzQb/JeA+SrZO3FkkQxBDKO0IFNik7PjTD9GeoouhSsiJMgwel+buANpM
 n5JsW82rwDy2NPgb2aAx+92vOaI/qZNWNc/Gw52OON5ONXHGiAvCQL6mgxbqqmYZh6Lc
 awH8/gf8eU18ATaK/WiCH0dk4AtSo5i75Zj5e5b1BsDwA4paPBZccQPd47MJPHN0dSr6
 Cb4YlGer0K9FcqFL0+bAkOPkxU2UzVwI5mkJsV+W21y6lnx5RqkHU8NwGQDc2ANCVh9k
 qPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOVNnulMY9/cI7p7C/1byK8K0DnOS+U6K67oQeWaeLQ=;
 b=eSOOIaGC4LFghEv+ZWcLzrU5x6yCeMxRA/LsBYjUZNkuZlmfjezcUH+V1IOIAosDhf
 szs02bpt+ieAOXeUAiBkTm1cdEj9gyfKAtbVNe4G+vMQLIvOnWcAVEQu8ERssLf7o2Uz
 Psj9ArSNgLDbI6DWYPKdYoYesISfadCd2wj0jggu1kPlLoKZTwfaHJQ96pEgdJgH2tt7
 bGQghAZs0jeSzO/wXERWrdF+ERamch4ps8ngwofU3OtY6IiZV+fpK7CfJmobN6y2xfaK
 u43v2sFv2Ou7L7pGntffFbVHqqfYWkbq2ugVkEcizHSpH9YUhULLuGT/iVbu2gfJ77dK
 d+AA==
X-Gm-Message-State: AOAM5313ocEBs04o/BOyU540nhqLdUAG5s+meu81WwsjQvaqvHSbpgNR
 lfswnmUpty926RUSnm/zWKGUGg==
X-Received: by 2002:a05:6a00:14c8:b0:518:7789:d33b with SMTP id
 w8-20020a056a0014c800b005187789d33bmr35640010pfu.36.1653675784707; 
 Fri, 27 May 2022 11:23:04 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 060/114] target/arm: Use TRANS_FEAT for do_clast_vector
Date: Fri, 27 May 2022 11:18:13 -0700
Message-Id: <20220527181907.189259-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: rw/zLMTZroIO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7c9deb267f..5135866798 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2492,15 +2492,8 @@ static bool do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_z(DisasContext *s, arg_rprr_esz *a)
-{
-    return do_clast_vector(s, a, false);
-}
-
-static bool trans_CLASTB_z(DisasContext *s, arg_rprr_esz *a)
-{
-    return do_clast_vector(s, a, true);
-}
+TRANS_FEAT(CLASTA_z, aa64_sve, do_clast_vector, a, false)
+TRANS_FEAT(CLASTB_z, aa64_sve, do_clast_vector, a, true)
 
 /* Compute CLAST for a scalar.  */
 static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
-- 
2.34.1

