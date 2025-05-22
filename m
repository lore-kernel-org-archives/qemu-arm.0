Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1602987njc;
        Wed, 21 May 2025 20:38:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOKsjCgPB8VHyILVj1UmUvCExMVa81FRh+tS/8gjXeun6j3X61RIcG4pKVD2Y9cBj/1dmB3g4z7OGbDg==@linaro.org
X-Google-Smtp-Source: AGHT+IFmt4OFPu6TyusAnwM2cOPT2dE7CeGr2tkiPOWPib/hFQ9kEgQBuqiVTfcoNG1GKTXRlk06
X-Received: by 2002:a05:6e02:1848:b0:3dc:7d4a:be08 with SMTP id e9e14a558f8ab-3dc7d4ac100mr88160975ab.16.1747885093358;
        Wed, 21 May 2025 20:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747885093; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoWzFu8lDsLI+juTm0Zb09plnYoxe+cK0ut2WuW7EaQ8qF3UlYLTv5tmmp8UnAn8um
         GJEn/xOQLvz/bVWdkW0zz0sAl3Zf4PBnUivCmjOEZNWJdKmLBJS4JcWBe7mJbY2Tqb2u
         dil2HySWIucdnQGEbj3/qQJDrhFoIUbbycmk87M/Cv8tzLHVJBaWyqzdxpMZULexH3l3
         718FR6guBU5TjE42UNeoWSnZxxTv0y22N1xleSmhK9pklZMiGLdd+Tol53ofJFzax3JY
         GtcSFShcYnX3cbyOAprE9qehThxDGtKxlg5533O8Pg2lGpN48A9un26ritVF3YcA4XnA
         IRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JerVMHOn3I6OReTB6Gjtce0vkgmuhngOxQesv0Wh21A=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=Zb7YylcpURWq+mVqv1g+kFvrU218h0gRXwghYtSjWw2q0Dx5p8OLML0FcUf4ss5fJT
         D5ipJQTam7gzbjawQTAVssvzLOj3b+O/QyVnFjNIe5FQ6hTY3i2qfOzn0mO9XL/gxZKm
         DfgIsWVY0I4jcJjTJp3GEnYbQAusGXEIcN5jqgW+MtPVbd/Ih62ForbSqJNzIxguBXZu
         1I60jliBZuDykD/AyBTuMZ4ccf2+SXCHWVGdSGnRyezTjBHX7dColrMk6S4E2aTr3V4c
         mDWve0VicC35TXyb60+V33GnmFFnDO2Xh8P2Rss9PE25AvrVdWoeUH+0z8RA4lCmpYsy
         0tCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc38dd33si14144240173.1.2025.05.21.20.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 20:38:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHwjy-0005o0-18; Wed, 21 May 2025 23:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjq-0005mh-SO; Wed, 21 May 2025 23:37:00 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjp-00047S-6e; Wed, 21 May 2025 23:36:58 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 11:36:29 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 11:36:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v3 2/5] hw/arm/aspeed_ast27x0: Remove unused iomem region
 overlapping VBootROM
Date: Thu, 22 May 2025 11:36:25 +0800
Message-ID: <20250522033628.3752086-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
References: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-TUID: BTpUWtPEmzID

The iomem region at 0x00000000 is unused and overlaps with VBootROM.
Removing it avoids incorrect memory layout.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 1974a25766..328897ded0 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -23,13 +23,11 @@
 #include "qobject/qlist.h"
 #include "qemu/log.h"
 
-#define AST2700_SOC_IO_SIZE          0x01000000
 #define AST2700_SOC_IOMEM_SIZE       0x01000000
 #define AST2700_SOC_DPMCU_SIZE       0x00040000
 #define AST2700_SOC_LTPI_SIZE        0x01000000
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
-    [ASPEED_DEV_IOMEM]     =  0x00000000,
     [ASPEED_DEV_VBOOTROM]  =  0x00000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
     [ASPEED_DEV_DPMCU]     =  0x11000000,
@@ -521,8 +519,6 @@ static void aspeed_soc_ast2700_init(Object *obj)
                             TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "ltpi", &s->ltpi,
                             TYPE_UNIMPLEMENTED_DEVICE);
-    object_initialize_child(obj, "iomem", &s->iomem,
-                            TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "iomem0", &s->iomem0,
                             TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "iomem1", &s->iomem1,
@@ -942,10 +938,6 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
                                   "aspeed.ltpi",
                                   sc->memmap[ASPEED_DEV_LTPI],
                                   AST2700_SOC_LTPI_SIZE);
-    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem),
-                                  "aspeed.io",
-                                  sc->memmap[ASPEED_DEV_IOMEM],
-                                  AST2700_SOC_IO_SIZE);
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem0),
                                   "aspeed.iomem0",
                                   sc->memmap[ASPEED_DEV_IOMEM0],
-- 
2.43.0

