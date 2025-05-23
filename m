Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2414063njc;
        Fri, 23 May 2025 02:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpiZhI6V71d3mG81l/031H31s9A7EuiWDmeiL6y8TEhbSPnnOhx4nlqbJgeCWBCQk2WTiz1rjANwMBRg==@linaro.org
X-Google-Smtp-Source: AGHT+IH4Fi8Vx9MUZSmu18yfQQ5+k0yx5Oz/dxQuDNzomP3H/6FmAlz/Lw5x6xGPOjP1BaeT788v
X-Received: by 2002:a05:6602:3a08:b0:861:7d39:d4d3 with SMTP id ca18e2360f4ac-86a2316d84cmr3922897739f.3.1747992785709;
        Fri, 23 May 2025 02:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747992785; cv=none;
        d=google.com; s=arc-20240605;
        b=hEutagio5aDVBgPw6XUTc2JfMkzSSo47V4aXxXWsDwOYQsr9jFTtLc4r4Oj2ssyPvj
         8ojWIZFb2EUONnqoFE8gS3bKD2QvObNrdIRUJkS4QEoFb9YKlNX9ugaJh8hVw3v1E79Q
         //WirXu4qN35gMW8WsCHxc57DvwoB5pPyLAHCRgH/3gGxuZZ2Wda2qiQwO+9ysq2BBr/
         ZgFULrvk7NKZTob79zhT6Cqrrs8q3bzB4c6tZc255n1HlFp+k3OjBnVE2PH0WST4YkD9
         LArQW5nWFrKGeWY3qci4RVul2VGSbfKXN8TMEfgeW/8GY4E6mPJqTVy4LVrn5lVJUIs9
         lo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=nhQxNSF2LOK8LA3By6KpHTfMoxw2F7OIDQopKgwxQwE=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=hYdaxmPj7/VcW0Bw5Dk6vErNS4HgNMirzhJ3L974jgbWAI5uflplZn/JBe4q3zqPu9
         d7mCcJiGuGls6+aCzSFnqHLVz6cyr9oaR/ebIJSJol/t8Z7A2WX9elcrLK5sPcgvL5KO
         4gkDaJBS5Hcy138sFm8PqQVZJoCW6LsWWvFOU0/HyGGLvakg6MoQKq2BSqugRXgt7FNq
         dPW4SHuJec1nfhhKvskjMGWLSpKqnMFDWvEiKSZBtciDIfvo98WMjdkXHqceEHktYxI/
         yWofSrj8UEqqQYDJjzwSKG9YhUexAHI+GqeWJPws70lG0Wwe+Fjj/+6r+1jzeD0oVsla
         U/7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86a23736eabsi1293681339f.97.2025.05.23.02.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 May 2025 02:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uIOl2-0005Fb-1V; Fri, 23 May 2025 05:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uIOkz-0005Ep-UT; Fri, 23 May 2025 05:32:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uIOky-0005Md-Cc; Fri, 23 May 2025 05:32:01 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 May
 2025 17:31:45 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 May 2025 17:31:45 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 3/6] hw/arm/aspeed_ast27x0: Fix unimplemented region
 overlap with vbootrom
Date: Fri, 23 May 2025 17:31:40 +0800
Message-ID: <20250523093144.991408-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523093144.991408-1-steven_lee@aspeedtech.com>
References: <20250523093144.991408-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yaSUcdHhiN3E

The unimplemented memory region overlaps with the VBootROM address
range, causing incorrect memory layout.

This patch adjusts the size and start address of the unimplemented
region to avoid collision. The IO memory region (ASPEED_DEV_IOMEM) is
now moved to 0x20000 to reserve space for VBootROM at 0x0.

Although the memory range 0x20000 - 0x10000000 is undefined in the
datasheet and should not be required, further testing shows OP-TEE
or U-Boot may access 0x400000 during early boot.
Removing the unimplemented region causes firmware hangs.

To prevent unexpected accesses, retain the region as a safeguard.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 1974a25766..bb61c30cf4 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -23,14 +23,14 @@
 #include "qobject/qlist.h"
 #include "qemu/log.h"
 
-#define AST2700_SOC_IO_SIZE          0x01000000
+#define AST2700_SOC_IO_SIZE          0x00FE0000
 #define AST2700_SOC_IOMEM_SIZE       0x01000000
 #define AST2700_SOC_DPMCU_SIZE       0x00040000
 #define AST2700_SOC_LTPI_SIZE        0x01000000
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
-    [ASPEED_DEV_IOMEM]     =  0x00000000,
     [ASPEED_DEV_VBOOTROM]  =  0x00000000,
+    [ASPEED_DEV_IOMEM]     =  0x00020000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
     [ASPEED_DEV_DPMCU]     =  0x11000000,
     [ASPEED_DEV_IOMEM0]    =  0x12000000,
-- 
2.43.0

