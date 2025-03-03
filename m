Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2451663njb;
        Sun, 2 Mar 2025 23:37:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaWmKIEMwC1Xq5/PoCwAYs1TWuA2E2BFfwiYvpB2ppKXxW7VGihVw62Y085Svt/yBd/FFX5W/Utnscvg==@linaro.org
X-Google-Smtp-Source: AGHT+IHgNE45tTUx1qo2SnjYJaSTrGfpjlu5k9cDXHWVlArMyAeuZb8emQYvBMztRNCiC3fHKf0f
X-Received: by 2002:a05:622a:50d:b0:471:cdcb:78cf with SMTP id d75a77b69052e-474bc069f3amr199914441cf.13.1740987458684;
        Sun, 02 Mar 2025 23:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740987458; cv=none;
        d=google.com; s=arc-20240605;
        b=LvSkfDwdFWiEmRs8rE+LwAaeKlsfwRYo+wiWqd0QEyfvt6i8VAsNUXzKH/clfieYYT
         0ok9kKj+ld4wCUBBUEftNydZ1xOd4B1jdTD+RaCCI18eI0Hb0emGwaDKJz6zi7/zqI7O
         SUEH146WU7NQbcQxBRAHEIHcRQzm+gTpRQQ7bPYkA2RQXIEXPLOb6gm74l3lbYOgWKaa
         9MRKiB9zc0P99SkAqZ2JXX7rDHazxe7uaS3P5unNY3HLMW1z/MvkCT6Hho4MffrqWWXz
         qS8zuqrW51AzmKH88FCET6KvfcgoHRGQGS9JC0sVA3GqoHRsbpCKb21cH8RCuMWbyV7p
         gyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=G42sN5VzCXeVYfkLY91E8bU3NuiaWUzhh9HJB6MT8uM=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=hp+94gJ1pI6yCs+8zXJhVECC+GTNUoiTvoHrsfX5fxtfA0oNrWjY+w3KzygrjmIBgz
         zxY19Eypy1CBPqElAfUrnnt0E1XhhaWTA1B4fTwwTEQNplRvChZev+HRZRJQNGdaCAmR
         6R7wLxvMY1FRwEO/YrNSA+ZoWvWKFeGgL1pNyEXsRubhdvhCk11UIHZfSJ41aTpo1SMl
         eIlXLwU8dgPj+AChGzOPgg9qF8JyBaJs7GWgW2/SeDbO1t/WUaRk3rmwG4DTPy1VcllR
         2HV30NNWfqm8VKEhPV6whbPyhS2h2Ebs9IwTLMjx2j7uQ54nQKeL12WvWKcl/nqGK+GB
         W3xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474bb767b93si67579171cf.140.2025.03.02.23.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 23:37:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp0MB-0001N6-8b; Mon, 03 Mar 2025 02:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0Lb-0000oI-G7; Mon, 03 Mar 2025 02:36:20 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp0LZ-0001xL-UJ; Mon, 03 Mar 2025 02:36:19 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 15:35:48 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 15:35:48 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 6/6] hw/arm/aspeed_ast27x0.c Fix boot issue for AST2700
Date: Mon, 3 Mar 2025 15:35:46 +0800
Message-ID: <20250303073547.1145080-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303073547.1145080-1-jamin_lin@aspeedtech.com>
References: <20250303073547.1145080-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-TUID: /RrcD7+xGBBp

Currently, ASPEED_DEV_SPI_BOOT is set to "0x400000000", which is the DRAM start
address, and the QEMU loader is used to load the U-Boot binary into this address.

However, if users want to install FMC flash contents as a boot ROM, the DRAM
address 0x400000000 would be overwritten with Boot ROM data. This causes the
AST2700 to fail to boot because the U-Boot data becomes incorrect.

To fix this, change the ASPEED_DEV_SPI_BOOT address to "0x100000000", which is
the FMC0 memory-mapped start address in the AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 8c225d4f90..527a5f8245 100644
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

