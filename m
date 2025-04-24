Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3532622njd;
        Thu, 24 Apr 2025 00:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUziBD3ggcPd4HjssWWK36j1vz0QPadRUeJx9ns6D08NZFq9AquzIeo9X9/B3VDaQlortK0Nz9hwKDGaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE9G1A1koMJi8USrChQMLyE4QwuLNfw8mmcWmSv8o51GDkByT2gAMP+UeDyRrzhOvYlRCHd
X-Received: by 2002:ac8:7d47:0:b0:47a:e803:d7f with SMTP id d75a77b69052e-47eb27921abmr21263831cf.4.1745481124223;
        Thu, 24 Apr 2025 00:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745481124; cv=none;
        d=google.com; s=arc-20240605;
        b=NhleRwAil/wCRng7+GNAy/Oq3hbNRAOE0+dxkeWUjOuGzBZC9Z5ezp9INE/hAjkzyp
         mN77DZ7gTptFuuHe3iXBAVTUoI0QBvnwbl+d4RRVGuek+/ROUbAajKCdfI6tpZPnZDLt
         MITbl9BYJnFtnkwXDmgMEhLEUOFm0S139D3oFGNnIrlPy42tD3JkpiMFrVD8YW7zrhoE
         xb1EDhY9g8P0+o9rGIZ2gXbQzt9HzfoBoVUtMrRh8Pv+essQZWu0IVkiWbhRwxCbCbB/
         LsRtGzdJTEbI3nL0KOypqJZNuBO3mHek/K27XsIGuW3IccUoBu62hxItx/POKLd49zvC
         L2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=4XDmhS8dMpdz4AgzMU9KCsUIxtN57OGRi35MAJf7k+4=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=NrgabO4HExAudq1uWUeBmWzqg19kI5ESSD/8/+/Wx0uTbwHsqADA7C6aCvr97hYQoq
         7VepzBf5c13EZlOSIc7xPeqpCNUy2CVcuhICPAweOSTKcrt5AA6z7wM2CYFuYXq0gB72
         Pe+77U4K5flHgyIbqP7MRnq74ZzGnsCE7xb6hhn7D3eBvTCUwPkp9nnKWU/jAknKDVAE
         GDKIal+khP06Ai5l0dZ0J73YxniJaQDgtBCGlfhpU1vhkmEgfSAWM6IE2oVuCiOnuKd0
         qqmNfvFbFEUhGzMjbcb3L/p3nxjfDYoIAisw/3QSzajPhicvnoke3N4TlVCWalFRWNUH
         JBqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9f1d5823si11863681cf.44.2025.04.24.00.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Apr 2025 00:52:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7rN5-0001Gv-Sv; Thu, 24 Apr 2025 03:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7rN3-0001GP-L7; Thu, 24 Apr 2025 03:51:45 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7rN1-0006ez-8D; Thu, 24 Apr 2025 03:51:45 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Apr
 2025 15:51:36 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 24 Apr 2025 15:51:36 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v6 0/6] Support vbootrom for AST2700
Date: Thu, 24 Apr 2025 15:51:28 +0800
Message-ID: <20250424075135.3715128-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: L8burHeO/pXv

v1:
  Add initial support for AST27x0
  The purpose of vbootrom here is to simulate the work of BootMCU SPL (riscv)
  in AST2700, because QEMU doesn't support heterogenous architecture yet.

  ast27x0_bootrom.bin is a simplified, free (Apache 2.0) boot ROM for
  ASPEED AST27x0 BMC SOC. It currently implements the bare minimum to
  load, parse, initialize and run boot images stored in SPI flash, but may grow
  more features over time as needed. The source code is available at:
  https://github.com/google/vbootrom

v2:
  Add "Introduced ASPEED_DEV_VBOOTROM in the device enumeration" patch to fix
  build failed.

v3:
  1. Supports both vbootrom and device loader boot methods, with vbootrom used as
  the default.
  2. Fix review and QTEST test failed issues. 

v4: 
  Adjust the patch order.
  
v5:
  fix review issue and remove unnecessary class attribure.
  doc: create a new section for AST2700.
  
v6:
  fix review issue.
  Add google/vbootrom commit id for ast27x0
  split to patch to update documentataion for ast27x0

Jamin Lin (6):
  hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
  pc-bios: Add AST27x0 vBootrom
  hw/arm/aspeed: Add support for loading vbootrom image via "-bios"
  tests/functional/aspeed: Add to test vbootrom for AST2700
  docs/system/arm/aspeed: move AST2700 content to new section
  docs/system/arm/aspeed: Support vbootrom for AST2700

 MAINTAINERS                             |   1 +
 docs/system/arm/aspeed.rst              |  99 ++++++++++++++++++++++--
 include/hw/arm/aspeed.h                 |   1 +
 include/hw/arm/aspeed_soc.h             |   2 +
 hw/arm/aspeed.c                         |  36 +++++++++
 hw/arm/aspeed_ast27x0.c                 |   9 +++
 pc-bios/README                          |   6 ++
 pc-bios/ast27x0_bootrom.bin             | Bin 0 -> 15424 bytes
 pc-bios/meson.build                     |   1 +
 tests/functional/test_aarch64_aspeed.py |  26 +++++++
 10 files changed, 173 insertions(+), 8 deletions(-)
 create mode 100644 pc-bios/ast27x0_bootrom.bin

-- 
2.43.0

