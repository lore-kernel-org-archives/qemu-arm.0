Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp3099456njb;
        Mon, 3 Mar 2025 22:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWP5vE/LxRwm2ZVom+CZzruQeluJE+f+z3VDsnUaWA4AAVpvcoAFxBpPOOKG7NTQMs7uJkiCXgZGi6GTw==@linaro.org
X-Google-Smtp-Source: AGHT+IEav5DapAdDU3hx2FNThG9TBhzwE6SMpaOGX+n8e5OeW/AcAE/zpxEVor3Maumbxf7q6L/+
X-Received: by 2002:ac8:5815:0:b0:474:f14a:c0 with SMTP id d75a77b69052e-474f14a0435mr55969841cf.7.1741070996800;
        Mon, 03 Mar 2025 22:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741070996; cv=none;
        d=google.com; s=arc-20240605;
        b=NLts03JvaTsFehmE6IJmZJTH5yNWkSpaGvAg5s2uEccDmL9DC4O+Wr82Gth5/AeFnR
         RorMdZQyrWy7W+IhE/VPQ+C+O/tRX6/mgVJLGLwyWtcID65q6Z3Wl3elkW8kHdSc7Abb
         MudGqgt2ZYWtxhOQTHdeyxhtLuyyk6yJFoQQIPBKGGV5hSxIhtPUqqetmpOgftNe6oUL
         lRQ3+0LVABI94Ig/l9x8oI+jWw9PSJsr3Lga4rBD5DuZsspJ9Gz9jwuDnefXwsuangxb
         9q2hchqaf6FUXbPPBPpU8t/cxaPmyL7JsXZKoh66mAkgI6ICMEq2UEhP2lR7chE8djUi
         5GEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=b11DEv9OMIuUlhW0E71NirxOWPNmYZsvkC2MOuAl5fA=;
        fh=no4a9QA/0zeIocEYrBrieE6XYIGB9KPekpO3W6wNjNE=;
        b=Xo43/L7zn6UHT9P6KIDiKXxknYl8oEnBLYzwRpOL/vplRmBUE4jDX3s5BgcCc980e1
         iRqIZ/WEdz6x+hD7V8bkyDxnptNvwWokGTJVGrTXVp2t/awW/EPfRuMj3bMsKSoGEC/w
         iEUPWukUrO5vSqgMOlRHvuZ/8UaWk5TP5Bnu91HNnCeEFbiMwBSgMhgLLKkgdxxYI7jY
         JieqwUBF7gFeLF4H/rfNSMMzmmTKJi51AwSj/GIE5cKycCwJtz7AaQ3ax9NKwZxRS2WS
         IJIdBO18f0K6wSyJflf9qaP7t4GZ+iiI1mbmhmpo4ENPT+aoUjyU1UB6Tioi3gJaxAIa
         740g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474723fe58fsi107094511cf.277.2025.03.03.22.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 22:49:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpM4U-0006cw-13; Tue, 04 Mar 2025 01:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4Q-0006br-TQ; Tue, 04 Mar 2025 01:48:02 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4P-0003IK-Dw; Tue, 04 Mar 2025 01:48:02 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Mar
 2025 14:47:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Mar 2025 14:47:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 6/6] hw/arm/aspeed_ast27x0.c Fix boot issue for AST2700
Date: Tue, 4 Mar 2025 14:47:08 +0800
Message-ID: <20250304064710.2128993-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
References: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EroRkC27crbV

Currently, ASPEED_DEV_SPI_BOOT is set to "0x400000000", which is the DRAM start
address, and the QEMU loader is used to load the U-Boot binary into this address.

However, if users want to install FMC flash contents as a boot ROM, the DRAM
address 0x400000000 would be overwritten with Boot ROM data. This causes the
AST2700 to fail to boot because the U-Boot data becomes incorrect.

To fix this, change the ASPEED_DEV_SPI_BOOT address to "0x100000000", which is
the FMC0 memory-mapped start address in the AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 92487bf229..10e1358166 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -24,7 +24,7 @@
 #include "qemu/log.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
-    [ASPEED_DEV_SPI_BOOT]  =  0x400000000,
+    [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
     [ASPEED_DEV_SDMC]      =  0x12C00000,
     [ASPEED_DEV_SCU]       =  0x12C02000,
-- 
2.34.1

