Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29640CCFA04
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Nov 2025 23:38:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGQb5-00020o-SY; Tue, 04 Nov 2025 18:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SY4KaQwKCN4NABIHESTEFANGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--nabihestefan.bounces.google.com>)
 id 1vGQb1-00020G-PC
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 18:37:51 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SY4KaQwKCN4NABIHESTEFANGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--nabihestefan.bounces.google.com>)
 id 1vGQay-0005BS-Cs
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 18:37:50 -0500
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-7a9a8e76543so5349016b3a.3
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 15:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762299465; x=1762904265; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YU0uSHcPrYiF3ZdbzJ9P1EwGSlz9hc7xoEWUvhDGKI0=;
 b=whzed4/7eOicvSGAXqiwecX7RFR1Yj7oghnlu6bjFnBXR+Sxs4DIs1FG9WYOwcQNIh
 X3fXxbAs/e3NXoZpJZcFfVylP6a5at7DeJy0grhQaF7bMa+/5UEfiSGacVObfobw7GOR
 +gu2o1Hcp6iwS92P5ed3nieOHfj0G1K6SnObnJIERendmLTMK8fn7MTW81e/ImLuyh81
 MiVTV39OyxFIkC4Radp+VoWc5+LG8gqxXr7tRiBQkBM7p7+4bBKvLyzz4sHErll/CX9F
 tdmsth/8yJHdwaE4fMY+RNCpRvj/YDUjRgkUK8KLSEDa/xdLJNAfSH/mLtvTJQSgIPIY
 IKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762299465; x=1762904265;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YU0uSHcPrYiF3ZdbzJ9P1EwGSlz9hc7xoEWUvhDGKI0=;
 b=mEJZrFrQXq9iIJhsjC7ULulY6gOhXZccXMHJXW1Kre15r1X/NWctlEThC1OoYI7GD9
 z3rRI4XSa3lUCLkDjJPJrq4/0sOty/9qU3WK0PJYG2RIBKgOtCroyxLt0DykXQAWRsMb
 pCM6aaDmRtvzcWu+CxzytQ9JgaLY2izcl7yONaRgMWBTAQ+bIWTaYYvm8cdcj3SQHF0I
 ZaK/MX4eyyOXCtHSyKsu1ErJV8JmARpCelj4/ZjyGFHkLRQwN0hdeHxqDaWI8dVSu+7C
 f66yc70lw6LIpfZtJHG6iaHQNqzCLN8k5zKmcIMOoIJrryOd4e2d6iPOfsDPioYpGhiX
 uugQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpmd14orpSpuVMATdmCoswmv/b6D4ftmnHJ9RwAAzFOzuIsJwY+lNJJPbYL/WCA2iTVLAQwmyDew==@nongnu.org
X-Gm-Message-State: AOJu0YwibHqJY1KybK5zTxVxSyH8e+zC94o3baB/qSNtfbI7nd4WxZcO
 i1kHSYIksjoHic7Zc9NuQ/u03E220kkUWOcD/e2XRTH1EkOR1B+XRLy8RIDtYM1PQKJ0bFw+pdR
 H/NzI7ORK54THWXDH9V0L4uNJUQnvng==
X-Google-Smtp-Source: AGHT+IFRS6jXbhIVJDOyrmhvgadCce/I3QfLB0EvF7tGNGWKSHhPhczRtLKLUw3QFLqSzq48zYVY++CpubReCWhFg/s=
X-Received: from dlbsw2.prod.google.com ([2002:a05:7022:3a82:b0:119:49ca:6bae])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:338c:b0:343:70a2:bca9 with SMTP id
 adf61e73a8af0-34f863015bcmr1292965637.53.1762299465369; 
 Tue, 04 Nov 2025 15:37:45 -0800 (PST)
Date: Tue,  4 Nov 2025 23:37:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1006.ga50a493c49-goog
Message-ID: <20251104233742.2147367-1-nabihestefan@google.com>
Subject: [PATCH] hw/arm/ast27x0: Fix typo in LTPI address
From: Nabih Estefan <nabihestefan@google.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, peter.maydell@linaro.org, steven_lee@aspeedtech.com, 
 leetroy@gmail.com, jamin_lin@aspeedtech.com, qemu-arm@nongnu.org, 
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3SY4KaQwKCN4NABIHESTEFANGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--nabihestefan.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The address for LTPI has one more 0 that it should, bug introduced in
commit 91064bea6b2d747a981cb3bd2904e56f443e6c67.

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/arm/aspeed_ast27x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index c484bcd4e2..1e6f469538 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -87,11 +87,11 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_UART11]    =  0x14C33A00,
     [ASPEED_DEV_UART12]    =  0x14C33B00,
     [ASPEED_DEV_WDT]       =  0x14C37000,
+    [ASPEED_DEV_LTPI]      =  0x30000000,
     [ASPEED_DEV_PCIE_MMIO0] = 0x60000000,
     [ASPEED_DEV_PCIE_MMIO1] = 0x80000000,
     [ASPEED_DEV_PCIE_MMIO2] = 0xA0000000,
     [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
-    [ASPEED_DEV_LTPI]      =  0x300000000,
     [ASPEED_DEV_SDRAM]     =  0x400000000,
 };
 
-- 
2.51.2.1006.ga50a493c49-goog


