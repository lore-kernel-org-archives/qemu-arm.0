Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7601746njd;
        Wed, 9 Apr 2025 03:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWND74LhvBVZnunFk116CtR1RSl/Y9fI4tEj89o5xceYUI8ZQGZ5fFswWjnF17k6sl3hGDSbmKew3RMIg==@linaro.org
X-Google-Smtp-Source: AGHT+IF/GSk4RpkigMPdJAH89oQfMT4X4+LYYU6DRoI6F55X96TveDhMOavb7rnguNSJpwFiaXfW
X-Received: by 2002:a05:6102:2ad3:b0:4c4:dead:59a3 with SMTP id ada2fe7eead31-4c9c6a5025bmr823435137.2.1744192927091;
        Wed, 09 Apr 2025 03:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744192927; cv=none;
        d=google.com; s=arc-20240605;
        b=c6JCrA1SM8om0u3jFn+CEBNv/LuAUgV3W1XA1ICti7vqAq/1rebmzuGxaP4dUR7Fnu
         AdCcCdX04iYenbiQTQdExcv3UIwU9pLhf+v0duQdpXh2oK/gd786YSn2Lygax2v3kgTA
         UM1rgUuoKpcUD5AWLnA4qUujX5WuZ/01+UiVodqm4nhlY8TV/Tk7VU4wwe/dSKFDNpCD
         nX7pw4i7mFDLJ+M3A/i3gGgjkjRSv/1QTiQ2jTGbDFCMWMgO0y7SvZXWVrs80nO0Xqen
         NuHsrtPNGI2CVs7WHdkgj3e9fvxkQfaMiscoQHJCoQw2mdPODiEZeTIqfi90/6VuJaW8
         9nfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CLIFVfL/nitJqiJHHsKGiq0+8hWaRbOQrV4MP7ew1iU=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=Ng3A2VfX+wdUZ5wFVsqp4pA9wN4PbsJHfoeC1yy740tVXrX9yyQOyQiuj+fiBfzDky
         982LBWi7F7i8UsHZQkE9Rll2xA2XTiHM98UPiJ3d/tu4gccZDHnsJOSqe1/iVJgvL51Q
         F9dibj6ls6a42U5+nJ3QSP/4ETf8IZ5+br68aOrQiytoJFBUGyYe8slm9hE4332331gH
         IqEyIHWQtQwMDC8akecXrvy9Z5cdeDcPDJ9f1Bz66KH/zNkyp1jjL010qNnVRWnf/ON2
         ckYe9Gmaom8BJC/ILXI7SKueKxIEEv1zlPEfpslVfLQSrTmBaGD3iHpGUAicca6+5nts
         qkEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c9c977986csi96196137.154.2025.04.09.03.02.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 03:02:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2SF1-0006px-RX; Wed, 09 Apr 2025 06:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEz-0006jW-2b; Wed, 09 Apr 2025 06:01:05 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEx-0006jO-Ar; Wed, 09 Apr 2025 06:01:04 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 9 Apr
 2025 18:00:40 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 9 Apr 2025 18:00:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v1 5/9] hw/arm/aspeed: Reuse rom_size variable for vbootrom
 setup
Date: Wed, 9 Apr 2025 18:00:33 +0800
Message-ID: <20250409100039.2391847-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
References: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
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
X-TUID: 6SV/J0Fu//Ht

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

