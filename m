Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1602743njc;
        Wed, 21 May 2025 20:37:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoztubjUSc8gWxOle9RoBYwvRGB/q2ejvbilb/fZ2Cofy4+o4/0qg5t/kCJjaFMuIgrgskFqplCku2IA==@linaro.org
X-Google-Smtp-Source: AGHT+IGn4ImZC7TZcq/MHXTpZxgTbiedBPVwqNj3yLRbJrHvDTeW5labvT9W+g0rEtV7YSGuthus
X-Received: by 2002:a05:6e02:1949:b0:3dc:89e3:b882 with SMTP id e9e14a558f8ab-3dc89e3bcc3mr37499695ab.8.1747885043881;
        Wed, 21 May 2025 20:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747885043; cv=none;
        d=google.com; s=arc-20240605;
        b=fYs1WUFoyj5nR2Dv9x/+rhncTQxkJRVCwgU8mH8pqBKQOrXocSp0deW0uT6PNB54xd
         Uk+5KJ/hGsaIxqR1NBkkcVbU+1BEP3kCVNOwYKXNCzBUfgS2WVt4AqUpolpqzGLv7t1x
         I5IJgxL2jFvLM2XSAskuO12z11pARlDGQkFFYCOoEV6sto4s2IcukVLCJeLZzaF+fEZU
         2MqgELPGaws0OOnMyI0mcGPIPAVy1ghN3kXQJsNVt/RSJOhvJ/wlpwCcOXCHHZY+2r3E
         P5g9tonrMpE+knzMdl+6F+uOfiNWKr6KE2PiaiiJoVsoPVYukku/vjpC1dRXcj7lD/TP
         DyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=3wrgkZygoU5UFOAheJ8bScxjyJWi7qZjds7l7aiY8bc=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=RVkIxvxhOlJVsvLmHRmWuQCZfm/OYyEv07V9t8AX39+y4pz1A1UqDBDPdiArn5popo
         ankX1CwFjv5+Pg0fac29K3x5jUVlppGMMJN+nsQxhRcMNT6XkxFX71BtbEeySQEkjztS
         dLF0dkdaenJ852uz3w8rA3h/bWRktpqEWGPiPFtMJ1I2Pbw9sf/JhbCBQKu1TR9pN5UB
         jT80R0t/af1zJNw++9hZjEhyBaJZRDohRDGUg4Jw6MZf/Y9kdnsN3txObvvo8IRLP2vK
         HEPveleqWHc3axizzmFRrTt65hu2u3nYuTBu9lH+WCSCzfwG91cpZ13M+Lc9xX121/rG
         umMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc3e6a7asi10553766173.74.2025.05.21.20.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 20:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uHwjw-0005nt-7A; Wed, 21 May 2025 23:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjo-0005mI-1e; Wed, 21 May 2025 23:36:56 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjd-00047S-Bl; Wed, 21 May 2025 23:36:47 -0400
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
Subject: [PATCH v3 2/5] hw/arm/aspeed_ast27x0: Fix unimplemented region
 overlap with vbootrom
Date: Thu, 22 May 2025 11:36:24 +0800
Message-ID: <20250522033628.3752086-3-steven_lee@aspeedtech.com>
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fU+oRvvaQg9h

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

