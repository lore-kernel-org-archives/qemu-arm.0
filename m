Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5012195njk;
        Tue, 24 Dec 2024 18:09:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzUq+ONFmmG3pGITE4h6V27hMFY9gyAV561l+aR6SdL7SYq/V4VspfD04yDMwCIB9ylF1EXhXZuqK+tQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGVv+CJCoP5i6BPuMlQ3DRgHovv6Du2eKNOyTPvE8fGM30zXZu24k9s/luen3tu4sQGNYRp
X-Received: by 2002:a05:620a:44c3:b0:7ac:b1fb:27d3 with SMTP id af79cd13be357-7b9ba7f72fcmr2504978385a.40.1735092559251;
        Tue, 24 Dec 2024 18:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735092559; cv=none;
        d=google.com; s=arc-20240605;
        b=GzhGU1xRyP2RnIZ6AzGQfIBkRJ6DRSjBTqb3UONYEkSSy68R0r/lyK2VyFdVHoced1
         jik9TT/j3Qn1U+p4Go87PSEH9UkWHj4IikloOzumxtlGRose0ClVJTXcugdn51NHK1mo
         yxfbLkshOqDQT/6Ocsq57Q/MvvLmNDtKSXMLVFxXaVJa6bcv7QFwBfkehxGmW/AeYRrp
         QNe+j0JobnU3zYw+sYIxGrXtYzStohQSY92EI+ZYEVDp5m1ej8vHk+KT20kzNzZKzS6a
         FDbftLtr1sT4L0CX4gf3kBkWYtz13Pkh17Sb+BrUlV4+0cg7UffXSr4S8eA6pHf7y3A7
         Uggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=W4SYMZj+/ygUyiZc6jul6ICHVLoHFtk7pZAADxfGfjM=;
        fh=6s1QC7yDVMwxtLiXCOqIXsaBZ0NU8/0BFNqJIfybTQk=;
        b=KlrYbcTofl5jWvA0wktrAVFXvcflgEfLHg2LsWfMEQ67qlsrEwKTUfFQMG2d2viJl6
         pZwV6o0Xg5g9JAOiTQcVHxUa9RWMYuIB1GnUQa1lm+l/HiGfWF00uYFYMm0qhtQn9vSq
         SaDAiJCaTIQC+EvX/RSEXLwvT0m4zBE6Hxu1sAEWE+eH8O1bAUiDbCJSU2niIg94oI98
         IcWA7NchR4Bxdth5SKgi+vthtuvWdVQk2kB0PGuh5WlKVA/JO81xwP2UrHr/KipnrNVl
         pMXbXE+PVRURIMsgdLvh1zff2SB74hvx3ufT917LkJJLpHpSF08936syZkKCfjtKZLZi
         nCew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4cc7acsi1491217885a.394.2024.12.24.18.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Dec 2024 18:09:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tQGp8-00080s-Qb; Tue, 24 Dec 2024 21:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tQGp4-0007zM-GB; Tue, 24 Dec 2024 21:08:30 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tQGp3-0002ew-6C; Tue, 24 Dec 2024 21:08:30 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 25 Dec
 2024 10:03:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 25 Dec 2024 10:03:13 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH 1/5] aspeed: Make sdhci_attach_drive and write_boot_rom public
Date: Wed, 25 Dec 2024 10:03:07 +0800
Message-ID: <20241225020311.3718080-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241225020311.3718080-1-steven_lee@aspeedtech.com>
References: <20241225020311.3718080-1-steven_lee@aspeedtech.com>
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
X-TUID: o71LKPQS8f5J

sdhci_attach_drive and write_boot_rom functions may be used by
the aspeed machine supporting co-processors.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed.c         | 4 ++--
 include/hw/arm/aspeed.h | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a18d4ed1fb..62ac8b7206 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -256,7 +256,7 @@ static void aspeed_reset_secondary(ARMCPU *cpu,
     cpu_set_pc(cs, info->smp_loader_start);
 }
 
-static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
+void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
                            Error **errp)
 {
     g_autofree void *storage = NULL;
@@ -325,7 +325,7 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
     }
 }
 
-static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
+void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
                                bool boot_emmc)
 {
         DeviceState *card;
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index cbeacb214c..bba224c357 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -10,7 +10,9 @@
 #define ARM_ASPEED_H
 
 #include "hw/boards.h"
+#include "hw/sd/sdhci.h"
 #include "qom/object.h"
+#include "system/blockdev.h"
 
 typedef struct AspeedMachineState AspeedMachineState;
 
@@ -41,5 +43,9 @@ struct AspeedMachineClass {
     uint32_t uart_default;
 };
 
+void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
+                               bool boot_emmc);
+void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
+                           Error **errp);
 
 #endif
-- 
2.34.1

