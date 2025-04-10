Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8125013njd;
        Wed, 9 Apr 2025 19:39:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8gcX/+Z7BVT4d3YwYgu8CfrreS81VfmF2tjegxlxY6oZ4MNFMO1FC6eKsCJZi6NUDs6qKF852YzcKLA==@linaro.org
X-Google-Smtp-Source: AGHT+IGiX1bIaijl6y5z39W4JW8K6KDQQPm0wQfoL9gsrpHmmnHEQCyNMLCXzWahO89iE7CpgGip
X-Received: by 2002:ac8:578a:0:b0:476:78a8:4356 with SMTP id d75a77b69052e-4796e309a46mr9617161cf.26.1744252772211;
        Wed, 09 Apr 2025 19:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744252772; cv=none;
        d=google.com; s=arc-20240605;
        b=hkOs9XEPcqxn75/kC3vDfQhBSKL9zbD7okOj5eMVzeHhEVDeOC0oRGSVawE25eq/U1
         A8uz2+HeN+58uLxcpfxxo925I49jhyMcdzGjVrT3YcsxnQ7Cih7Im6ry5L8/XxmYoQh/
         xpIr6ruZkXD83EUE1xzcAMJDdHf5j8jHrivA4JcFYPa14TN6wFYjeZF+kCDlJX24NqOn
         OVNMAWyVc4cWVM7jAHnp+DqwO92etnZ5e3nZoqMqmtc4Dr2XzpQ/XrM2OpOtGT6Fd/xG
         dXfwDQ3NbP0wjskpTh3weYh69iusVpiGB6Cl8ORAEzb9g1GQU6kzzuHr+yBIQ9zQDMP1
         1kFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=SlTRtJcPbgsVfgiIbf3Kw2VOHZdHVkxio/Jbzit4jvA=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=Pe20T2wukPqpNf4JPe8Ve3lVg7jSooDXqh06UIWU9ArESvKXQZnj6dfoK5664sbjdE
         GxN6acqtQF9H/4Gflq6fCX5mSf0raSemd8DkJfPtk+MTxQLosP/I9cu5kyKBi0JC6Elk
         xJhmqejp12FJvQxzMyiHZ6zsx6Kor72WOizNsBnsZdeSZKASlYWrzlZp1VirqYyI6amc
         VDF7jnpWiUKWfvZVJZ/iJ1o+oQNpAQC64xsXbIDV1Xe+YtGfGjQKjZZH2C+4BUoz78DB
         Xr5uCE6vsh9z5dCYBOC2DkuhsxyCXt/j3DcGGlGWdivGSWWfpvtISF+SCYxQskW9jRhf
         Ljyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edea959si2248581cf.534.2025.04.09.19.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 19:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u2hos-0001Xh-99; Wed, 09 Apr 2025 22:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hop-0001XQ-Fn; Wed, 09 Apr 2025 22:39:07 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hom-00033O-Pu; Wed, 09 Apr 2025 22:39:07 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 10 Apr
 2025 10:38:56 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 10 Apr 2025 10:38:56 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v2 00/10] Support vbootrom for AST2700
Date: Thu, 10 Apr 2025 10:38:44 +0800
Message-ID: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
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
X-TUID: 5fMZSMF1jCMG

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

Jamin Lin (10):
  hw/arm/aspeed: Introduced ASPEED_DEV_VBOOTROM in the device
    enumeration
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
 include/hw/arm/aspeed_soc.h             |   3 ++
 hw/arm/aspeed.c                         |  37 ++++++++++++++++++++++-
 hw/arm/aspeed_ast27x0.c                 |  20 ++++++++++---
 pc-bios/README                          |   6 ++++
 pc-bios/ast27x0_bootrom.bin             | Bin 0 -> 15464 bytes
 pc-bios/meson.build                     |   1 +
 tests/functional/test_aarch64_aspeed.py |  38 +-----------------------
 10 files changed, 69 insertions(+), 56 deletions(-)
 create mode 100644 pc-bios/ast27x0_bootrom.bin

-- 
2.43.0

