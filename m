Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1468303ejb;
        Tue, 14 Feb 2023 09:21:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8nUDbFctTUwX34kKTMiM0sww752Vbc2nuBkCB/G0jM2bIAQhN9agJj6pQV1/bXNmLJt+7d
X-Received: by 2002:a05:622a:1386:b0:3a7:ef31:a07b with SMTP id o6-20020a05622a138600b003a7ef31a07bmr4885650qtk.11.1676395302832;
        Tue, 14 Feb 2023 09:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676395302; cv=none;
        d=google.com; s=arc-20160816;
        b=xaGXtjBUVdsEy0tQFJehdt738UfYJmRohWZE2xwSuJSje4qPT1YC0G0Zj51m6x9/EP
         5BwouILTyQIQWhWNMiSrBf4p8Ps9HLN5QKzd+DoNEusejjTFauK967436sXeW7xpkmRy
         Appghg+6CM4GeODNw69PAfSmo7I5ay2QlxBS7NBSg3j+sm3qo1LyI89mhVJ1ueCkHKfW
         4/bnqECSefUQJlX5djzpE7S5P1z/6YLceGY4Z+/ebf3z5SlJ8tZ3dqcUgAZlLtAchoUk
         y1KwYnHhO3dxi0XGoMiS2Cry4iN7Dp2pvBxCnu2YN/VtFalPBHcY8iq2eWX+uFP5YbIm
         3EYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R1o7dkQJ+2Jq4AnP/hQ+CdLt1UTgBQpw0WHFXcyfQhY=;
        b=YdYGwjIU/xt0pVxJ29WQ6AYk7bbk8IPQYMwueIGBd1eBNrg2lHxgCgjK84OL9C3Ltg
         Mv72YM4ArGYOhp/Oeh5ekgM3TjJBVF0hlYE/cFFsohdVb/BqDaxLf/g6eNdClomTqgF4
         9ox3m1mAuDll5GgikcXf4ElKqkPmH3opelAMnZ1VOhK6zuQlpEsykwIvzMfOOzTfgeHJ
         sxAmPNAbHhf19jgD9jkd/p7fgXjH6oj04W2FPjegCBuCfzxCZMYYekJZUL66Lds/56DP
         HQqa2C7xd/gm2Dx2D6jDHY2jyfM5/nLkZXlsyodtaOtLD56sFcA4QwYjO2CjuMApC875
         Ti5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nSgUDlDR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020a05620a410f00b007065023e44dsi13076489qko.433.2023.02.14.09.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 09:21:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nSgUDlDR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyzS-0006gN-Te; Tue, 14 Feb 2023 12:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzP-0006Nx-Ua
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 12:21:12 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzM-0005eE-Mg
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 12:21:11 -0500
Received: by mail-wm1-x331.google.com with SMTP id z13so11477613wmp.2
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 09:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1o7dkQJ+2Jq4AnP/hQ+CdLt1UTgBQpw0WHFXcyfQhY=;
 b=nSgUDlDRM3xvlhf/5+iRqnyoLzQAyMXYIiIhj3R9tK+u1ZuV0BS7ipE4Na/K6IjHAw
 43pIwC78NQomPdG9RrdR95xfzlXrqq8PnJjaYBLXfFf3xyyK6F0HOdHfiVF3yolExNxG
 Tvb0J6/cfuGKtGU0tHE5io4j7s7iBWlw/J9MtKLEVhHfXn81a/bcw3RXWAF5yb2DsA/6
 4j43vAdiKtIbV00/dKzYAki4Sjc1oGPSAigG6PsvQ0l23yaqX6n8EuECMStV7lyU1vqr
 wlYnBoWFTMg/7tHADP8XuEWaIDrfQuBtpBPGQUYftKBX8Upz8cTo0vqhXrCw13vjnjNI
 Jb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1o7dkQJ+2Jq4AnP/hQ+CdLt1UTgBQpw0WHFXcyfQhY=;
 b=6SK7b9mFa9WYeTViuMzWtmWIxtIIC9T0HlO3lqU1YotF0GqGhSELPSaxmgcMnJDoy8
 k+wFBsPtJ1LTeOOWXzCSaD8PJTAekojeSC6b/JLkyF/oFmproUIpBZQWB9Nv806n1DVh
 miHSDjtClX6oM8sjwbd+ebBhzfA70fHAevOLtPdui1twIxU4wxGggHMaYTizizyCL1Yv
 us32q9KWxERorACFylM8HUV10WLObyWHzJyKLmAxYZoOqMVRIG/+BHliQ5z38JRrG0XZ
 2r99LfrgZy+2j3bkWPPnNCBVjMP8rjJmnV8lin6/h8+KX6/dG0SxoUswYR5Q7yDXQ8Yo
 +LGA==
X-Gm-Message-State: AO0yUKWZLubT/Ajq7hJV8+qyjqD1XYyCpI77sgkfhNtlPdBk53e4cL/E
 Yo5xSm6q6iwei8jql8Q6qAgiwQ==
X-Received: by 2002:a05:600c:3492:b0:3dc:4313:fd1e with SMTP id
 a18-20020a05600c349200b003dc4313fd1emr2665434wmq.34.1676395267355; 
 Tue, 14 Feb 2023 09:21:07 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm20636570wms.22.2023.02.14.09.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:21:07 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, ola.hugosson@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 2/2] hw/arm/smmu-common: Fix TTB1 handling
Date: Tue, 14 Feb 2023 17:19:22 +0000
Message-Id: <20230214171921.1917916-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230214171921.1917916-1-jean-philippe@linaro.org>
References: <20230214171921.1917916-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: acEgAwGq3E5f

Addresses targeting the second translation table (TTB1) in the SMMU have
all upper bits set (except for the top byte when TBI is enabled). Fix
the TTB1 check.

Reported-by: Ola Hugosson <ola.hugosson@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 2b8c67b9a1..0a5a60ca1e 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -249,7 +249,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
         /* there is a ttbr0 region and we are in it (high bits all zero) */
         return &cfg->tt[0];
     } else if (cfg->tt[1].tsz &&
-           !extract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte)) {
+        sextract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte) == -1) {
         /* there is a ttbr1 region and we are in it (high bits all one) */
         return &cfg->tt[1];
     } else if (!cfg->tt[0].tsz) {
-- 
2.39.0

