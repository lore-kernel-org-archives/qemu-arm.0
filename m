Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1722170njc;
        Thu, 22 May 2025 02:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1xois73dL52626wXTYYztKfczwb7fm7tDHeJTJdBfACHkMkRb/cLfu9l/5m53YysOfoT6oOhLUGy2jA==@linaro.org
X-Google-Smtp-Source: AGHT+IHAxJ+oVYwvjYVmjjNFNngImWkX4qS6He0tE0tUFolHoxwA6Rrk5+TcjkU3b4UjkTHrDnSS
X-Received: by 2002:a05:620a:268d:b0:7c5:6a40:6a7a with SMTP id af79cd13be357-7cd39db74e7mr4787090485a.6.1747905492387;
        Thu, 22 May 2025 02:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747905492; cv=none;
        d=google.com; s=arc-20240605;
        b=bBCisNFtELfhPn7FhA1phCWbl3ej6ViSa5hFx5IYqLxiCuX2s1C0ewNra80wivb7Ii
         LjkrvQBeZiA5Xz1lw/QIb4y9Yu3foULrmF0LBqu8/5+mJhlB4uOD04ZvbJ75rkbb6LKi
         w7671N/PrvvqofxvNU8VgCtjuYbNHVb3SxVGcdgoyJnzFzUTyRG9vK5mWAXc2liRlxYp
         AsggnVBn+UzsQF0KNtYn3jcal73sIl87nqG21VCEI9A5AzJ5bmSlosvv1q3hlRSkk91E
         EcpHeVHzeJXpVqHzyh8vY7W/5SM8eB7hWGSWuHSB6z5O1IlkGFhbikHkHc3MNEJBrG01
         UQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=3wrgkZygoU5UFOAheJ8bScxjyJWi7qZjds7l7aiY8bc=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=AGoE1sXR6Cpl7AswkECCCz+9mlArZrgdnfmUD76orqtewvQMPs6Wwa2Q/2DcNamr73
         nLqXfNXAbt9EGcWmBz01dnrvaQ2FVZB84CStD4i3RUku4D0n3uraLfxu5zruz4/RWdZo
         D1BFHntMzYlshOz34Ghm5rWiVHC40xmT/rL42+4iDjyrqdwrmAL1rbmLny0P5elFKxKH
         JKFRGprceTkYK/nS9+62TfsjRyBQHad0fpp+L8nmNBLzoHJfwGF2ymm77hKw/0ItQpmt
         2UeOPza11hIozc22/o+JB4GTzIMB1DX+T1D1rnMkrNeumsGi+T7ZPmoMX8Pa7AqMYqNs
         Xg5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467cf648si1622351785a.2.2025.05.22.02.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 May 2025 02:18:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uI23N-0006dn-29; Thu, 22 May 2025 05:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23C-0006bS-MM; Thu, 22 May 2025 05:17:19 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23B-0003Jw-2C; Thu, 22 May 2025 05:17:18 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 17:17:02 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 17:17:02 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v4 3/6] hw/arm/aspeed_ast27x0: Fix unimplemented region
 overlap with vbootrom
Date: Thu, 22 May 2025 17:16:57 +0800
Message-ID: <20250522091701.354185-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522091701.354185-1-steven_lee@aspeedtech.com>
References: <20250522091701.354185-1-steven_lee@aspeedtech.com>
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
X-TUID: PNgJctqc51mw

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

