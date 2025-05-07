Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3695231njj;
        Wed, 7 May 2025 03:10:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPL42EibtHCi5mlTPEmrB0n9AtWXFij5C+ougureqneXdb6sMizA+vDeDSlCJwqtwaWvv/2joY/jpxSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH4VdvmEyYuunfBdIPEIYVshJYrM3Br3zJDfsrtIbBOXWHpjqph2thBLbYW64rx8pIR5/7u
X-Received: by 2002:a05:6214:2243:b0:6e8:fa33:2965 with SMTP id 6a1803df08f44-6f5429eccdfmr49514616d6.14.1746612632276;
        Wed, 07 May 2025 03:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746612632; cv=none;
        d=google.com; s=arc-20240605;
        b=Co8fEYv1gPGrWX688IfeZ23Grs9E0Fkbj2tZoP120q1MiJvtmkBqi1m81DhiGmYy1n
         zlPe3osNCZ6z7cV4kW+gaKgIytjw7kJAhvAlWLk3ADZgA+8xq9R8aYahGMyR3UFFfHdr
         GJmFnALVHK0BqrnPyAnyv9iM+yDf2kVdcVjamFRUD5BUrknzekuYE4PpvavkBErDbDDV
         jijcyyswI7tDQKdsc/A79QTFMX6HAmplDtQdQVyfCBKqTYbJ/S7swavuvaEu81X0q43t
         Rz0/1GODdpCuDFj7iByrygcb3jez1+49/SwnK8EwtMCgl6IjomXnCxDnC7pE+tkHBrIk
         djpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=69hmZTueU4Mk9OaCahEdd5h9Ej0wxIPStRGSKPHhsdE=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=CE3SOFCYZSwxPp0iCWiRFr5VtKftBo2v/p6aMcPdzXHvRN7aTQibKbR+Fbn86Ffudt
         GUNoA3/4mkFbo1cbZk3OtIg7qmKBu88l8H7h+D5SJCbXMHid3/osiDIpBmieOOo1wJUN
         aGYVh83hN8HeS4HHLOHcLy+l6D1J5B5XXk6C2WQ4wRCyW/G40ebf1rv76eOVCymiSf9W
         0xFLk6W/9x3A4oMH4ZG6UwQcX+ecWh5e30Y7IbYS3RMrG3xIXpC+ls9CksZhfs/QjD3J
         k9Jf+lF7Bd6a+Z32S2e0hsxREmKnOk9hjG1ESoWdtEKr+QSV7Gq4NrjqpjMUI8nqrIaK
         UxPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f5426517f9si16132346d6.132.2025.05.07.03.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 03:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCbjJ-0005le-Si; Wed, 07 May 2025 06:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uCbjI-0005gy-25; Wed, 07 May 2025 06:10:20 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uCbjG-0004CR-HB; Wed, 07 May 2025 06:10:19 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 May
 2025 18:10:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 May 2025 18:10:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v1 2/3] hw/arm/aspeed_ast27x0: Fix unimplemented region
 overlap with vbootrom
Date: Wed, 7 May 2025 18:10:04 +0800
Message-ID: <20250507101005.1474823-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507101005.1474823-1-steven_lee@aspeedtech.com>
References: <20250507101005.1474823-1-steven_lee@aspeedtech.com>
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
X-TUID: OFIkbc44Rrcc

The unimplemented memory region overlaps with the VBootROM address
range, causing incorrect memory layout and potential behavior issues.

This patch adjusts the size and start address of the unimplemented
region to avoid collision. The IO memory region (ASPEED_DEV_IOMEM) is
now moved to 0x20000 to reserve space for VBootROM at 0x0.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I1d775577816b1e93bb54c899ac3722eb6902c577
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
2.34.1

