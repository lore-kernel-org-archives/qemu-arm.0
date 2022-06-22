Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1873867lft;
        Wed, 22 Jun 2022 02:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uvltcYTVMWEmJ7c2Jzzty5MHFXw/ex7lkYylAfLdcaflv7v2vhBiD+aleovmRGMdU6wDwy
X-Received: by 2002:a05:6214:e6e:b0:470:35e1:5e1e with SMTP id jz14-20020a0562140e6e00b0047035e15e1emr15929352qvb.70.1655891901911;
        Wed, 22 Jun 2022 02:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655891901; cv=none;
        d=google.com; s=arc-20160816;
        b=qQbGxgakwbeeDG+V3QQTM1hDwMZLuXFRRPIZHZk+KsHCakskHDfOQqmFetBG0kmF4M
         BdredKCO3BCF5SAQZACCv74yhxMWE2q3ig6sbPMFV6Iv8bHyZ+Xot959gJm4bV5Hk9yN
         FyVn+znWroL4uPbPOgvgDVujegE9FQ/bjJVdTWIJyUHuhN0Xdt58opNc5Oy0GGGRGJBu
         DbMdoBtEU0++/a3UxMWUzYBEOdnK24Xmht4AA1St5M4N6ZL0fKeITluF+Ap7iva7ewXW
         2A+q/CXyea4OtqJ7M8IiQSaXPxkySjHuKHrDnjtBTdnjw2CoO+7Lvrtmc4IjvhZrNTJI
         R5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=QjY9dtj+LwSMu76x/ex70SFXn2cyWZ9SDSLvsJWx/9o=;
        b=UK5tHhdTLsWkOS5IgljiKLMU/hjc8N/5ljVFcKB5kKsofbhP4QJ8wfGWM7LQO/L7D+
         DgAJz2TMiZzWwVcpsgwNFMN4drxcnmVHIti9kla+RZJ/YIL3bZxC/Vjws2/tlzM9e9wk
         yfKvZhavK6dZCudTU3rDcmhO+OQkaf3NnW/VF/GkSRgV3qE2GVfWP5xy9yWN2TPBirn2
         algokimfJ034Lm1VL5q30Gvetlz9uhsMAD78FZTVdl/oP2w2Ypu2cU3EZ1o+VifxJjs4
         XZ+1itoOg8PRRTVnDHT5f/B+CkBJyy96hDHhYSR2hBpoOE3DcZ/X2qRFp6QDtNXFImJc
         gY6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey2-20020a0562140b6200b0047047e1010bsi4793513qvb.303.2022.06.22.02.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 02:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3x7t-000113-CC
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 05:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5K-0005gl-59; Wed, 22 Jun 2022 05:55:42 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:40549
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5G-0004il-Am; Wed, 22 Jun 2022 05:55:41 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdzh3V20z4xZg;
 Wed, 22 Jun 2022 19:55:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzf4xrgz4xD9;
 Wed, 22 Jun 2022 19:55:26 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/19] aspeed: Remove fake RTC device on ast2500-evb
Date: Wed, 22 Jun 2022 11:55:02 +0200
Message-Id: <20220622095520.3683321-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Bn+2Bfwkr94j

The board has no such device. It might have been useful for some tests
in the past, it's not anymore and the same can be achieved on the
command line.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 98dc185acd9a..c49772e2eb59 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -519,10 +519,6 @@ static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
                      TYPE_TMP105, 0x4d);
-
-    /* The AST2500 EVB does not have an RTC. Let's pretend that one is
-     * plugged on the I2C bus header */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
 static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
-- 
2.35.3

