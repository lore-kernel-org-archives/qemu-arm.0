Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp660407ejc;
        Thu, 12 Oct 2023 01:57:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhWISuFiTDOcyVFYQZO5VGFmf6Vu7w6VsXFzsR2/9zIzc1mV2ua4x9fW4jhv3SngSjHObo
X-Received: by 2002:a05:620a:461f:b0:775:934d:42eb with SMTP id br31-20020a05620a461f00b00775934d42ebmr28575097qkb.22.1697101074657;
        Thu, 12 Oct 2023 01:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697101074; cv=none;
        d=google.com; s=arc-20160816;
        b=pQG+Umwn35gGDRyoqlvB0D+043Wru36bNU0bfyuQUVtr0kyXO9D2Y9Z4Y+cK7xYVi6
         RyirAhAU2y75Vi3CUvXHgO6Ve97S8AY3ggmiaWm9xGx81gyFctk04DDjD3TQvHPi/D1G
         UwmMe2Wl/GK2Bh5/z6T0EVN9vMFJAXu3L3bn+wBipSqUzBQl1+4BgkCMDQwPIL5hslWl
         aP17jbwdUW3URRhRhScESYYzci2IWJipSA5stF8t7tQ0FHg+ABoKPYtz8gWx3ptUMvq6
         JTEboJDs+pMCLFsxSjdw8NEE8j5aZ6TgryTSjnOwiKgwFL4t0PeRwRE+G03l5LAc2xWX
         e/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=v1F7G4Xgq3SG0dF9KevTpmDA/YRF0ZDy9td3eHU5eJI=;
        fh=7rabEz/QNvg2g//TnVS6eBYGfbv29RNInEOawnw9ijw=;
        b=RFe/vh0mNJp1R/pDHMrI/R5yiL5PjtjJrhAJAu7qquVGlsz4J6AtfmK9JbfBcGB+c8
         HvgqFmgllxjJxQzmyydCo5hwZ+sA5wCTOoK9WZa4Vpb38aS0HmXiEMx4Q3dpbJ2D0Egs
         JY+yx0uPZQr64fa0GP88vJ4aqdIV6U80N1eAP8zWQ8jI4VLxleq1FbMj5mS6iAu4HOF3
         ZRp6GDmFK5AVJTeNfI5bOJ5A5g08K/DS0MEJ+BqN5gn02A3VgSV+ZXLYT9F0i2bVQt9O
         eUvr32uetDDIOlRlzlJnQTD5wx3RYh4YlC/e4nX69BFcQDflyjGoR6G4/H0IZaSY3F+v
         nGKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22-20020a05620a261600b00774182478b5si10569299qko.11.2023.10.12.01.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 01:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqrVY-0006D2-5I; Thu, 12 Oct 2023 04:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mironov@fintech.ru>)
 id 1qqrVV-0006Ca-IJ; Thu, 12 Oct 2023 04:57:25 -0400
Received: from exchange.fintech.ru ([195.54.195.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mironov@fintech.ru>)
 id 1qqrVU-00079K-2c; Thu, 12 Oct 2023 04:57:25 -0400
Received: from Ex16-02.fintech.ru (10.0.10.19) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 12 Oct
 2023 11:57:22 +0300
Received: from infra.fintech.ru (10.10.1.240) by Ex16-02.fintech.ru
 (10.0.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 12 Oct
 2023 11:57:22 +0300
From: Sergey Mironov <mironov@fintech.ru>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
CC: Sergey Mironov <mironov@fintech.ru>
Subject: [PATCH 1/1] target/arm: Adding a check for the result of calling the
 CPU information check function
Date: Thu, 12 Oct 2023 11:57:10 +0300
Message-ID: <20231012085710.880440-1-mironov@fintech.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.1.240]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-02.fintech.ru
 (10.0.10.19)
Received-SPF: pass client-ip=195.54.195.159; envelope-from=mironov@fintech.ru;
 helo=exchange.fintech.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jMnF3omAelKN

6 out of 7 calls to get_arm_cp_reginfo() are checked

Signed-off-by: Sergey Mironov <mironov@fintech.ru>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 74fbb6e1d7..cffbbaf571 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -198,6 +198,7 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
     uint32_t regidx = (uintptr_t)key;
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
+    assert(ri != NULL);
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
         /* The value array need not be initialized at this point */
-- 
2.31.1

