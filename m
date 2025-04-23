Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2858218njd;
        Wed, 23 Apr 2025 00:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWj/JBRIVpzCEd4xfw+nOS5bodk56bUlRLQh0wq82HMV111JkAx5jlo2caHZrLDTMQ1o8iFAxC2tlr/EA==@linaro.org
X-Google-Smtp-Source: AGHT+IEZP+pdlDnsMOzXcB/lZIZoGZwWOI4sSC7mZ3Sp3RjZuY/cp/383vkYRA4DaWKf93F93oeY
X-Received: by 2002:a05:622a:64f:b0:476:87f6:3ce4 with SMTP id d75a77b69052e-47aec4b433dmr333134421cf.39.1745393085510;
        Wed, 23 Apr 2025 00:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745393085; cv=none;
        d=google.com; s=arc-20240605;
        b=kQZQwIrGlc7225yp4RHWveB8h5Re8lQRc1xOaUap6S+u+OyI26HTzB1LlISpxdKSR4
         IVIsvm11ADtJjk6KZzVluZyzjFn7KidCHjUdQqPya9AHzHVOXhNAhBjh1mikpgxhVfMF
         ncylSUlAKl2lz9+xc538n5VM05HcBxKNxhFwze8cbos7omrN3RcFIqxTXqVeqbcmZcB6
         R8rECGIGwo3V9/wrwmhw9sGwRBlHB6D76fluwC9MjyEb69u5sEjve8LSyxAiRIepvtfu
         5z+VxA4MTuTeJvdIJd5pwcEbcCd1oWjXnmKY5yhwkwpWUUjwHBMmRsTmtyG8d6Q8hqi6
         sPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=HvqijRJXrOAExp9/FhyQPeQ3tOBO8SNbvqzYmtkxZN8=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=UfMUT2wtujcUqZQIXzWzWO9f13PlSQLw3CaWu9sH4hmSPx4OCnuMV7RdOCzKNi5x4U
         qA00lxl+Afc2LHVAAUe7XtgW1yNQFeGJGXmheGdpt5CshiQEXpeqN6p4UeFTOSXiOKRn
         Jmvgt20HhIjT61qkgt7ZJmJptH/XAe3CvdQmfFa3x+tslm/D0q0n4fBMGdGEIUnXReh/
         VJD716yxx0yXj1V8VTVYoMJ3fy/T3UZsT6ExAviyqB6gafMDfl5RgCZccIeZpMFJpphH
         OrUhp0ZIZyi7R5+FdRzbfUc1DDg8PbJcdtuSYUGiTwwDAtwni1VVQTnu/1dEyiP0/HbP
         J6cA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47af9d45e80si107565291cf.546.2025.04.23.00.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 00:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7USi-0002Zc-Nx; Wed, 23 Apr 2025 03:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7USg-0002ZK-IJ; Wed, 23 Apr 2025 03:24:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7USd-0001IR-Uv; Wed, 23 Apr 2025 03:24:02 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Apr
 2025 15:23:50 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 23 Apr 2025 15:23:50 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v5 00/11] Support vbootrom for AST2700
Date: Wed, 23 Apr 2025 15:23:36 +0800
Message-ID: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
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
X-TUID: v2Hcx1dJ2jCh

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

Jamin Lin (11):
  hw/arm/aspeed_ast27x0: Rename variable sram_name to name in ast2700
    realize
  hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
  hw/arm/aspeed: Add vbootrom support on AST2700 EVB machines
  hw/arm/aspeed: Reuse rom_size variable for vbootrom setup
  pc-bios: Add AST27x0 vBootrom
  hw/arm/aspeed: Add support for loading vbootrom image via "-bios"
  tests/functional/aspeed: Move I2C test into shared helper for AST2700
    reuse
  tests/functional/aspeed: Update test ASPEED SDK v09.06
  tests/functional/aspeed: extract boot and login sequence into helper
    function
  tests/functional/aspeed: Add to test vbootrom for AST2700
  docs/system/arm/aspeed: Support vbootrom for AST2700

 MAINTAINERS                             |   1 +
 docs/system/arm/aspeed.rst              |  96 ++++++++++++++++++++++--
 include/hw/arm/aspeed.h                 |   1 +
 include/hw/arm/aspeed_soc.h             |   2 +
 hw/arm/aspeed.c                         |  40 +++++++++-
 hw/arm/aspeed_ast27x0.c                 |  17 ++++-
 pc-bios/README                          |   6 ++
 pc-bios/ast27x0_bootrom.bin             | Bin 0 -> 15424 bytes
 pc-bios/meson.build                     |   1 +
 tests/functional/test_aarch64_aspeed.py |  82 +++++++++++++-------
 10 files changed, 209 insertions(+), 37 deletions(-)
 create mode 100644 pc-bios/ast27x0_bootrom.bin

-- 
2.43.0

