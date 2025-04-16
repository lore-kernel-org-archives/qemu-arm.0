Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3088050njc;
        Tue, 15 Apr 2025 20:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDmBJYOz0etnZSYIcgbd/DLc1UD0zFy1ySAuNajdGF8CyJV1HW2K7+WkQg7lkjfmP/5UNVGfTI8Z0Gzw==@linaro.org
X-Google-Smtp-Source: AGHT+IGOTD3Rh0CECQHuUUGV7MIO3ANxuQHhNEnHIrUFLVdBP+QPu/Q8fr9f7ZOiAmgDjedgm5/y
X-Received: by 2002:a05:622a:28f:b0:479:52b9:c936 with SMTP id d75a77b69052e-47ad80b9d97mr1663271cf.22.1744775140006;
        Tue, 15 Apr 2025 20:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775139; cv=none;
        d=google.com; s=arc-20240605;
        b=frIT0oFKeS1GRJzn3qVIBa5fdoVaLdRgRP9wnUyxh4cR7DuMFFAeANE8sqoszGIe96
         yNnYiCPnO/lnKSccIKizcu+HkrUbuMc+3HfLwJXDdIphCph12rrRrnf0YP1MQK5/pK40
         ZpVrIR2fSE1rrPaYme8cV7hOolY4FZycLZC+X4USktmAoxx0eiOKYOuFfY6NULJd9yRM
         Tsr3lQLHox9bZxanIW/edTt+KnugSPdz9QDUkQRszprPkAcKQGEy2WNn3cu/IUHx29Ib
         6dXuFYTWW/l3BAd5TwBBKrDbgDOipWRRSmLRX/n6KC8SQsCCcaxarJfcE8L/PouVbFNJ
         1unA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=hGvTyJcQnzSW8nGVq3DG6sxV9RLQTKexknZAW09LBzk=;
        fh=mYa7DW7+LcAerod9KMiSdtH0/D1NqzuZXE0uoAi0+1E=;
        b=JMhveeqLKrY4vrsMg65vEANp53PoWmYAtKgKFIkxJQ/XNo0S5mmfvEQcKgf7LmwGs7
         eZuDnjytEbmqu3mkcpfXwoKUvHqVxCbsiqKtTECka0C8scy0vDpnNyrRJhqQaV7PZp1i
         sCdjagepjBwIctCPCFhrni+WCUu3/Ig3nUQa5F8FB0O0DimhgrMiEfp133xF+AMe4xa6
         grB5fy4wQWc7GZAmenkU7jtC+6nvR4sSQaHij1pmAz2z2RaJfUBee1HU8CumMkHmNnvY
         1oO4f94GkSsHqomW91AD3tbNqBMtXEkmW7W+ifWx5/pCqHDT6Yer/Lk29GYQ2FJKl/vQ
         cbGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edd3942si123010531cf.344.2025.04.15.20.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4th9-0001tl-Dw; Tue, 15 Apr 2025 23:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4th0-0001qe-EX; Tue, 15 Apr 2025 23:44:08 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4tgy-0006uD-0X; Tue, 15 Apr 2025 23:44:05 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Apr
 2025 11:43:28 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Apr 2025 11:43:28 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 04/10] hw/arm/aspeed: Reuse rom_size variable for vbootrom
 setup
Date: Wed, 16 Apr 2025 11:43:19 +0800
Message-ID: <20250416034327.315714-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: O8mq5iZouAq/

Move the declaration of `rom_size` to an outer scope in aspeed_machine_init()
so it can be reused for setting up the vbootrom region as well.

This avoids introducing a redundant local variable and ensures consistent
ROM sizing logic when both SPI boot and vbootrom are used.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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

