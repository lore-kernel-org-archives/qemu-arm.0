Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3087598njc;
        Tue, 15 Apr 2025 20:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwqjEsyZImb3mDPUte9u0D9UX5wfrni2qQCc65ZgeHcjFrb/77DyTSbYlCo3OE2BE8aQdUFE8IBltLcA==@linaro.org
X-Google-Smtp-Source: AGHT+IEY9J+s7rQZqfXE04BtkbiKLfS/vlVNfM/8poZnff4/ssSFF8DVpvXvi58JxZiHVWJX5QpG
X-Received: by 2002:a05:6214:19ce:b0:6eb:1c42:a14b with SMTP id 6a1803df08f44-6f2b3d76afbmr2173696d6.1.1744775036014;
        Tue, 15 Apr 2025 20:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775036; cv=none;
        d=google.com; s=arc-20240605;
        b=b3u21eH/O70iLvq6TZZP5G+xflMBDuhTEZFdwhFPY1kEaYTr2psY1OxQHJbSAV1V8V
         O0IXeMheqwhOC0nHd9H2quZrKQzmXANXnleE9KEOWm6C27s0WRrCUmNwSHqkq1siPp4D
         u44hdlf732Ved1V2jLMAWC6L23CakS9jiCkgcYepntt2+akv/LynCS1NJHnJPS61NEl7
         JCf9kTAfJ2NEVNWSZncRGkFcvcUdkiAwechQTqutZMS7830nvXkvUfDDlveibndueG5B
         ZcB3ml3tI3VCIpsGAzi4HpLweFhG7z3PSs6D9EDuz+U4Tiw6k3E/VIAypGo2kTcCTuQA
         75QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=XGJiqLs3ykEu0uxfjBkKe6X+uHdj5u/I/gQH0wau/ZA=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=M3taOYN30iSc82vqPcTfPvlEFEjfPhIrMi+F2EGG3r5MYPbu+yg8WksoAZQHRzYVsg
         zENGfXY3jwYx79UW4tuo9yy/FzJv8c7C2SnZsvF6x5Fxkvy+J2UUc3WW0KF/wAXXO659
         njJTozJEOqkCMREWc7eVB7HTu+LZXaY9AFkWCNpVo3TMXQjOpbzhas5o9njY5AWWvFIf
         0PXL1p5YUGqAL3wVEQVRQV5ioWXVpUsf5yxq1gCPzVhfeDy8x8qGLrDd85JNxvCyv8i8
         ZlGx5RayuSJPTO1oLYt0Gk+5HIglxMdEesO4y3uGCF8LZmDI1mw3Mbfa1pNfBBmoAIoK
         IwJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de95f90csi139037056d6.12.2025.04.15.20.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4tge-0001lu-0e; Tue, 15 Apr 2025 23:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4tgb-0001l2-6Y; Tue, 15 Apr 2025 23:43:41 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4tgY-0006uD-5L; Tue, 15 Apr 2025 23:43:40 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Apr
 2025 11:43:27 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Apr 2025 11:43:27 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v3 00/10] Support vbootrom for AST2700
Date: Wed, 16 Apr 2025 11:43:15 +0800
Message-ID: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
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
X-TUID: R27ZzmeqVW7g

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

Jamin Lin (10):
  hw/arm/aspeed_ast27x0: Rename variable sram_name to name in ast2700
    realize
  hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
  hw/arm/aspeed: Add vbootrom support on AST2700 EVB machines
  hw/arm/aspeed: Reuse rom_size variable for vbootrom setup
  hw/arm/aspeed: Add support for loading vbootrom image via "-bios"
  pc-bios: Add AST27x0 vBootrom
  tests/functional/aspeed: Move I2C test into shared helper for AST2700
    reuse
  tests/functional/aspeed: Update test ASPEED SDK v09.06
  tests/functional/aspeed: Add to test vbootrom for AST2700
  docs/system/arm/aspeed: Support vbootrom for AST2700

 MAINTAINERS                             |   1 +
 docs/system/arm/aspeed.rst              |  29 +++++++++++-
 include/hw/arm/aspeed.h                 |   2 +
 include/hw/arm/aspeed_soc.h             |   3 ++
 hw/arm/aspeed.c                         |  41 +++++++++++++++-
 hw/arm/aspeed_ast27x0.c                 |  20 ++++++--
 pc-bios/README                          |   6 +++
 pc-bios/ast27x0_bootrom.bin             | Bin 0 -> 15464 bytes
 pc-bios/meson.build                     |   1 +
 tests/functional/test_aarch64_aspeed.py |  59 +++++++++++++++---------
 10 files changed, 135 insertions(+), 27 deletions(-)
 create mode 100644 pc-bios/ast27x0_bootrom.bin

-- 
2.43.0

