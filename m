Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1044299njb;
        Wed, 14 May 2025 02:04:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIH5GBu8kkz6NFUUfMS5fjF9i/rLvAT4ZhCf5ESEY2BaYG1MjF08oDZaAhUTYmZTvOyh9pDHkTwflUKA==@linaro.org
X-Google-Smtp-Source: AGHT+IGOfA8LQNAmkTXgMRmuRWfCMtmWOmBjSL5kvGY8G0vg+PqmC9bVObfPQAdS1hUDkSgZklRP
X-Received: by 2002:a05:620a:4443:b0:7c7:b59d:a6f2 with SMTP id af79cd13be357-7cd287c4af1mr306078485a.10.1747213490134;
        Wed, 14 May 2025 02:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747213490; cv=none;
        d=google.com; s=arc-20240605;
        b=lko3aOHqQpMX9hxDe2YddPw46ykeygNphl5n8ZfP1yuXD7k2BT8rZODrA1lV9QB0l/
         VBzgn5VPdDRFd4UymM4KVA96FdGv9Jbx5j/T34euhYo1mTFQLB+FvQrLrgcSSqO0dYJR
         1Qp78ZdB8EvAXQTKUGIm3vgdo/m9et0U/ZpmaybwZlwU/MA2auC64C8c8rLtb3Z9fM7K
         F1En2HJ01v3DAfiRmAcOhYI7HqYqd+YTEpSczlCSPfGmpKEKFETzvIrdTrLxIPoabovb
         6Ach1275kyO03/5IzU+71pgYKyVKnyXk3oRx+9dmLL+mvbUoNllnWVyikDSGDBwbo+eS
         3JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=1GLmdVtqprN7H0E9MnarkRnjuuMh3kf7KMveTYHyxi0=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=Va9ietbCcEjT7JDDzojlQrliV+fbCMvRWNOlZuoecLsWZPoH2GjSIGJYrBsub7eVlz
         cdx1Hy1M27VfyICFD4iLYXw/Yshr2HXIOfk4bp0Y3POpsBTwawFGIuPAjhTNYxPli7nQ
         nKdA3fEaoOiKDKRRWQLyb2hBzZ05oFff0lt1ng2UZ8wTDjGcX/uxIDjQeaPPzu4Hx8q6
         jid2NXmWz74mX3OFbOFz0LSIKL2g8xOT5030EJMJRuPEKqTsIgo+xxMVGbTqNWs9NcVE
         k/TKdBkrCwhZElY6HTjqkz0edPOAlG+/xXcrfivy9T3aZzWrnub1zKNvIT1zolVbCwPL
         JA6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fedc54si1226405585a.487.2025.05.14.02.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 02:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uF82A-0006fM-Ot; Wed, 14 May 2025 05:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uF828-0006es-FR; Wed, 14 May 2025 05:04:12 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uF826-0002Ei-OC; Wed, 14 May 2025 05:04:12 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 14 May
 2025 17:03:55 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 14 May 2025 17:03:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v2 2/5] hw/arm/aspeed_ast27x0: Fix unimplemented region
 overlap with vbootrom
Date: Wed, 14 May 2025 17:03:50 +0800
Message-ID: <20250514090354.1461717-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
References: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cN89dKr3dxkO

The unimplemented memory region overlaps with the VBootROM address
range, causing incorrect memory layout and potential behavior issues.

This patch adjusts the size and start address of the unimplemented
region to avoid collision. The IO memory region (ASPEED_DEV_IOMEM) is
now moved to 0x20000 to reserve space for VBootROM at 0x0.

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

