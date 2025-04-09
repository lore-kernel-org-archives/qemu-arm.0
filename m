Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7601248njd;
        Wed, 9 Apr 2025 03:01:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoi9VfSogoVCNiGwoeW6SeRAzppQn5RenOoYCxKjKa9cgpbpMcG1/1Dr8ltUzZx0ShDTzAUvu2paLxtg==@linaro.org
X-Google-Smtp-Source: AGHT+IHDai/y1REUwxuMgxNzyHZgeD4Ubg3Iu/boEGdC23VkdP4j2lNb14Tv6azCfckEXussed09
X-Received: by 2002:a05:6214:1142:b0:6ed:1637:442d with SMTP id 6a1803df08f44-6f0dbb98014mr33232056d6.10.1744192884041;
        Wed, 09 Apr 2025 03:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744192884; cv=none;
        d=google.com; s=arc-20240605;
        b=Zv9BWXhcwyMbZgMjurlZrB2VHu/EKYuDpQHRU5lAGQwSmXGu2Fk4OXZCZaw/gDBHQ6
         NhK7m9u8ppvwmutGB6IpQaX3zTK5eGyHBhcStp4Wsp1RczvAJQzPRjapGi1fLS2xPaBQ
         5SLFA2Wlrc71xCqvUdRv/ZLPB7KKRotOMP9ayKMvvUXWntI626QYJ/UOyUYtIz4s4K0h
         e7j1HB1IMIoXhehUuBjmgZn9J0XvPBTL5d+PVNoZ/StUY7ETW9E1LAJeiaagmIyLTWu6
         Ay3g4neZxoD14HYol/RiqBwcROPyC94yHtFHPDdVPrRG1/4MER7mtIGZ1Sq+MMSrfAtx
         7jQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=za0LPUIFYsdiVwbHx/GFT34XaoOwSPC/LBOVHChjMQU=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=VXilhjK3VjuW+Q61XYytHyVs7bBFFGV6Nulo+tb2je4j1hLVO70ipG/pcD6HhvdfRJ
         QJC8ziLP0GDsl3DYBaLfSAIpk5MKnM/dv4vauYSh5aR56Oq7qdF4j414Y907DEKMOw7L
         P64oTUBSCDpf86X7QHDlQtXjddXb+uWM0y/HJSvoRT55O+dVl3h3pn3cSrfxtcavs9hL
         K+VnAU30TCsd8sfbu/bLQ85lYlZoDbfOMb5+qJubBV6WtFbY7tqhn4o4WCg9Kz6GLbm7
         Qf8Z5DADc19YyoAvESefOL8S4GwVyIzlU2S60UsfeffkRVw3NVvJkIDpjiTfvkvHsxQX
         YzLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de95fb0csi7313576d6.52.2025.04.09.03.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 03:01:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u2SEs-0006Nn-3X; Wed, 09 Apr 2025 06:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEk-0006Mq-Rc; Wed, 09 Apr 2025 06:00:50 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEf-0006jO-JU; Wed, 09 Apr 2025 06:00:49 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 9 Apr
 2025 18:00:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 9 Apr 2025 18:00:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v1 0/9] Support vbootrom for AST2700
Date: Wed, 9 Apr 2025 18:00:28 +0800
Message-ID: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: murTeBZ6b7fp

v1: 
  Add initial support for AST27x0
  The purpose of vbootrom here is to simulate the work of BootMCU SPL (riscv)
  in AST2700, because QEMU doesn't support heterogenous architecture yet.

  ast27x0_bootrom.bin is a simplified, free (Apache 2.0) boot ROM for
  ASPEED AST27x0 BMC SOC. It currently implements the bare minimum to
  load, parse, initialize and run boot images stored in SPI flash, but may grow
  more features over time as needed. The source code is available at:
  https://github.com/google/vbootrom

Jamin Lin (9):
  hw/arm/aspeed_ast27x0: Add "vbootrom_size" field to AspeedSoCClass
  hw/arm/aspeed_ast27x0: Rename variable sram_name to name in ast2700
    realize
  hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
  hw/arm/aspeed: Enable vbootrom support by default on AST2700 EVB
    machines
  hw/arm/aspeed: Reuse rom_size variable for vbootrom setup
  hw/arm/aspeed: Add support for loading vbootrom image via "-bios"
  pc-bios: Add AST27x0 vBootrom
  tests/functional/aspeed: Update AST2700 functional test to use
    vbootrom
  docs/system/arm/aspeed: Support vbootrom for AST2700

 MAINTAINERS                             |   1 +
 docs/system/arm/aspeed.rst              |  18 +++--------
 include/hw/arm/aspeed.h                 |   1 +
 include/hw/arm/aspeed_soc.h             |   2 ++
 hw/arm/aspeed.c                         |  37 ++++++++++++++++++++++-
 hw/arm/aspeed_ast27x0.c                 |  20 ++++++++++---
 pc-bios/README                          |   6 ++++
 pc-bios/ast27x0_bootrom.bin             | Bin 0 -> 15464 bytes
 pc-bios/meson.build                     |   1 +
 tests/functional/test_aarch64_aspeed.py |  38 +-----------------------
 10 files changed, 68 insertions(+), 56 deletions(-)
 create mode 100644 pc-bios/ast27x0_bootrom.bin

-- 
2.43.0

