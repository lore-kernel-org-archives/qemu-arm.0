Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1387308njm;
        Thu, 6 Mar 2025 02:41:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUx9lhCI5Vsbt+icC02IjzNgpEHkXAgIg3iRZjLWuMq5UGElCG9NlrYCRtzGkff3akUl2dvxWzrCLmw0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEqu97LRBPw+wd1+EPfkmQX2RwZ4IL6eP42GzjgLi0MMjZekw7sKFIhGaQl3A5SbJ+uJ88c
X-Received: by 2002:a05:620a:8013:b0:7c3:d6c8:655d with SMTP id af79cd13be357-7c3d8bd40dbmr978453385a.4.1741257694680;
        Thu, 06 Mar 2025 02:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257694; cv=none;
        d=google.com; s=arc-20240605;
        b=IHq7iaKXrplXlE2sw3tM2GYOkhP8yYpmvcVhxPkjwWvo+Txlkz8JcHqnKx6N7efnoF
         Dd9gnHJlzqa3Sey4tATgd/+REMIB5NuoZ2JZN2S4/uCNDUE3KuIfSkr4f8CCPHggCqXh
         HiONxfFOqQcQGbMEHjuLQzWLhdvKmtwXz/aItrkDb2oCESxIs2PjvhwvULRrudTctXMj
         d21INah9GkdXXDK7f51xvKDGTwWomXLNzYyJwF5MF0FUjmHq45MTGLZHFyxibx3dmUsN
         //Ma1IkeyJkHZpl51s79T//p5YJPC60n4VmHnvFvTGJaSyE/vHXQGjIwgZOLFcDPRnl2
         zSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=+QQ6T1hPwhaMmSJNCD6fwJlids+fWSXTB13z0KmbGn0=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=ZUkS51Li008M8RK2TkRCQPE0LJ9PfhfqhUvtmSCbkfcOG1EJYj/Gp2IH/23ugzM6l5
         YbB+kDFeW/ZlB0dXGHan6IXlg5wreEWSohopnc0zDEUqJJpOY68KAx9tAv7whVXdxx4+
         ua6/0B4STubon2vFdJ5Begb93taEV9plE7wlbZT+lkvFcfhC2RDIq7YRw6sdcWHQa9qN
         9wIJ256cj2j6UTrc5dsAQrK81DdHYmd/dqDvOtm1cB5PW2mDkLD3x924nI2hofxdDoh5
         LZ/ijJ/lzap5/wGUR2Lq/tLoo662ad4pcBQCQnyq4ARYO7R34UQWSb0tZm9ktQz2GGkf
         ZF9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e550f419si96890685a.341.2025.03.06.02.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:41:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq8fS-0000al-Oq; Thu, 06 Mar 2025 05:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8f9-0008D5-Sl; Thu, 06 Mar 2025 05:41:12 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8f3-0000om-AF; Thu, 06 Mar 2025 05:41:11 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:55 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v5 24/29] hw/arm/aspeed_ast27x0: Sort the memmap table by
 mapping address
Date: Thu, 6 Mar 2025 18:38:32 +0800
Message-ID: <20250306103846.429221-25-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: RCXrn38sFy/u

To improve readability, sort the memmap table by mapping address

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 54 ++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 7439512b83..3330484bf5 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -24,16 +24,40 @@
 #include "qemu/log.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
-    [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
+    [ASPEED_DEV_HACE]      =  0x12070000,
+    [ASPEED_DEV_EMMC]      =  0x12090000,
+    [ASPEED_DEV_INTC]      =  0x12100000,
+    [ASPEED_GIC_DIST]      =  0x12200000,
+    [ASPEED_GIC_REDIST]    =  0x12280000,
     [ASPEED_DEV_SDMC]      =  0x12C00000,
     [ASPEED_DEV_SCU]       =  0x12C02000,
+    [ASPEED_DEV_RTC]       =  0x12C0F000,
+    [ASPEED_DEV_TIMER1]    =  0x12C10000,
+    [ASPEED_DEV_SLI]       =  0x12C17000,
+    [ASPEED_DEV_UART4]     =  0X12C1A000,
+    [ASPEED_DEV_FMC]       =  0x14000000,
+    [ASPEED_DEV_SPI0]      =  0x14010000,
+    [ASPEED_DEV_SPI1]      =  0x14020000,
+    [ASPEED_DEV_SPI2]      =  0x14030000,
+    [ASPEED_DEV_MII1]      =  0x14040000,
+    [ASPEED_DEV_MII2]      =  0x14040008,
+    [ASPEED_DEV_MII3]      =  0x14040010,
+    [ASPEED_DEV_ETH1]      =  0x14050000,
+    [ASPEED_DEV_ETH2]      =  0x14060000,
+    [ASPEED_DEV_ETH3]      =  0x14070000,
+    [ASPEED_DEV_SDHCI]     =  0x14080000,
+    [ASPEED_DEV_ADC]       =  0x14C00000,
     [ASPEED_DEV_SCUIO]     =  0x14C02000,
+    [ASPEED_DEV_GPIO]      =  0x14C0B000,
+    [ASPEED_DEV_I2C]       =  0x14C0F000,
+    [ASPEED_DEV_INTCIO]    =  0x14C18000,
+    [ASPEED_DEV_SLIIO]     =  0x14C1E000,
+    [ASPEED_DEV_VUART]     =  0X14C30000,
     [ASPEED_DEV_UART0]     =  0X14C33000,
     [ASPEED_DEV_UART1]     =  0X14C33100,
     [ASPEED_DEV_UART2]     =  0X14C33200,
     [ASPEED_DEV_UART3]     =  0X14C33300,
-    [ASPEED_DEV_UART4]     =  0X12C1A000,
     [ASPEED_DEV_UART5]     =  0X14C33400,
     [ASPEED_DEV_UART6]     =  0X14C33500,
     [ASPEED_DEV_UART7]     =  0X14C33600,
@@ -43,32 +67,8 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_UART11]    =  0X14C33A00,
     [ASPEED_DEV_UART12]    =  0X14C33B00,
     [ASPEED_DEV_WDT]       =  0x14C37000,
-    [ASPEED_DEV_VUART]     =  0X14C30000,
-    [ASPEED_DEV_FMC]       =  0x14000000,
-    [ASPEED_DEV_SPI0]      =  0x14010000,
-    [ASPEED_DEV_SPI1]      =  0x14020000,
-    [ASPEED_DEV_SPI2]      =  0x14030000,
+    [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
     [ASPEED_DEV_SDRAM]     =  0x400000000,
-    [ASPEED_DEV_MII1]      =  0x14040000,
-    [ASPEED_DEV_MII2]      =  0x14040008,
-    [ASPEED_DEV_MII3]      =  0x14040010,
-    [ASPEED_DEV_ETH1]      =  0x14050000,
-    [ASPEED_DEV_ETH2]      =  0x14060000,
-    [ASPEED_DEV_ETH3]      =  0x14070000,
-    [ASPEED_DEV_EMMC]      =  0x12090000,
-    [ASPEED_DEV_INTC]      =  0x12100000,
-    [ASPEED_DEV_INTCIO]    =  0x14C18000,
-    [ASPEED_DEV_SLI]       =  0x12C17000,
-    [ASPEED_DEV_SLIIO]     =  0x14C1E000,
-    [ASPEED_GIC_DIST]      =  0x12200000,
-    [ASPEED_GIC_REDIST]    =  0x12280000,
-    [ASPEED_DEV_ADC]       =  0x14C00000,
-    [ASPEED_DEV_I2C]       =  0x14C0F000,
-    [ASPEED_DEV_GPIO]      =  0x14C0B000,
-    [ASPEED_DEV_RTC]       =  0x12C0F000,
-    [ASPEED_DEV_SDHCI]     =  0x14080000,
-    [ASPEED_DEV_TIMER1]    =  0x12C10000,
-    [ASPEED_DEV_HACE]      =  0x12070000,
 };
 
 #define AST2700_MAX_IRQ 256
-- 
2.43.0

