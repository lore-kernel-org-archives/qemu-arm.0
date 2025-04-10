Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8125498njd;
        Wed, 9 Apr 2025 19:41:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6P4WEhk978AZgzRSWMbCstatZO7vSGNqx5MX1I3tVRMWc73T956Ng4cz6kSAE+xSw9gPfLpX+Z+U+ag==@linaro.org
X-Google-Smtp-Source: AGHT+IGHRxpq6AFk1rWemzjKm/h0D/wh8K7eMy+lp9ywvZ6RfBNAo24owE1ASdvzgAyWt9+HqXJh
X-Received: by 2002:a05:622a:1195:b0:477:6f2c:4a07 with SMTP id d75a77b69052e-4796cba4e5amr18788971cf.4.1744252859803;
        Wed, 09 Apr 2025 19:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744252859; cv=none;
        d=google.com; s=arc-20240605;
        b=IXoCZ9bDlEJCsgIFJOmnJQp/LNd9Tah/oQayLFBdiFnqTmbsmEC5tblpG/35ePvdZZ
         gVdv6fJrAWEb5cP/xM7J6aa9s75gYv2KcEd9rdTBJqH80GIPC/Xwt+oKAxbtmQX5T+Dc
         2/mYNZbjRrvMLLakfPLPrIYp4men/+J8TPX3eVizPy2KOpooSVrWf6KEVHD/PSoGgA37
         THfnFjkUsJwYYoljFJ+mxkMc6ts3nRApk8WfeYEEO8Hi5zg7ZN0qKnGGTtnjNtZ4PhGj
         ACx1OWXi467V2HC5jFnDJ9hErNhazOpPR81oNE0wzKQEtG/Oy+ehZOdJznfhAmnKgFTj
         VF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CLIFVfL/nitJqiJHHsKGiq0+8hWaRbOQrV4MP7ew1iU=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=fdDKGvCVJLT+0f/0r9ILfUPTLcgzltzUQKmuqPjsj46z+I8sLGaj0RMMc3YP0G3kP4
         4+oczr+Idbs72mFAqDAVVaZu63uyo1vs2bSi9g44yijrQiJuwRZGk+xN0CJT8L4a4FZH
         lm3O2anXO8KbdeiQIz6SxDYvWhGDWC0j3Bh4SOjJh4WUmERjV+QzB8w1Z4U/VSExZaG4
         TftyjxInDOvYDuOR/4STI7cEi0plCn0y/L8pGTfNgsq2m27KFMZuq8HIaPZ9TQ0b2Wgy
         KrRtIjePWcc6MaVFurYnOG03cInCT9d+dH7C7FES5YIqNUp93VVHFKVL/jjuldSvuMJg
         Ucew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edbd72asi2215781cf.224.2025.04.09.19.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 19:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2hpO-0001nH-EJ; Wed, 09 Apr 2025 22:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hp6-0001cM-Vp; Wed, 09 Apr 2025 22:39:26 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hp5-00033O-8x; Wed, 09 Apr 2025 22:39:24 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 10 Apr
 2025 10:38:58 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 10 Apr 2025 10:38:58 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v2 06/10] hw/arm/aspeed: Reuse rom_size variable for vbootrom
 setup
Date: Thu, 10 Apr 2025 10:38:50 +0800
Message-ID: <20250410023856.500258-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
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
X-TUID: Zyd5lRjaWlZ3

Move the declaration of `rom_size` to an outer scope in aspeed_machine_init()
so it can be reused for setting up the vbootrom region as well.

This avoids introducing a redundant local variable and ensures consistent
ROM sizing logic when both SPI boot and vbootrom are used.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e852bbc4cb..b70a120e62 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -381,6 +381,7 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedSoCClass *sc;
     int i;
     DriveInfo *emmc0 = NULL;
+    uint64_t rom_size;
     bool boot_emmc;
 
     bmc->soc = ASPEED_SOC(object_new(amc->soc_name));
@@ -475,7 +476,7 @@ static void aspeed_machine_init(MachineState *machine)
         BlockBackend *fmc0 = dev ? m25p80_get_blk(dev) : NULL;
 
         if (fmc0 && !boot_emmc) {
-            uint64_t rom_size = memory_region_size(&bmc->soc->spi_boot);
+            rom_size = memory_region_size(&bmc->soc->spi_boot);
             aspeed_install_boot_rom(bmc, fmc0, rom_size);
         } else if (emmc0) {
             aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(emmc0), 64 * KiB);
-- 
2.43.0

