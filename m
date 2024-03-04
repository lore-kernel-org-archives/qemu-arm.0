Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2477170eja;
        Mon, 4 Mar 2024 01:30:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFCKZg5ExpH3PtqgARRlA8SSm248ELH72PmRu1FVp4PWNOy//1LFMBfDl5nvgnQGPFmNkXozxhp2kpR9/oiugXyjv+W9vh
X-Google-Smtp-Source: AGHT+IFfJADBwQymK4kDVpD/NxTSvjsAIS2dQczWFM3Bqbpoh5HlN3aQceeKJIX6X0Qkw8ElAR9T
X-Received: by 2002:a05:620a:5644:b0:787:dea8:c25c with SMTP id vw4-20020a05620a564400b00787dea8c25cmr7331239qkn.70.1709544659295;
        Mon, 04 Mar 2024 01:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709544659; cv=none;
        d=google.com; s=arc-20160816;
        b=lHcFWCY6s8E+Vd2J9ehPykss4Fv4LX9tBnvGokMMLv6LylGvyopmPogxz9t76Glai3
         PeO1eBrUwkpQjGfVf+n54VBm2DiHxVnJd/sNllDXbRa+dYAco/EvGCw+1XzqW1Pk8OTn
         g1bpGdFJKwRJfVWhB9h1PPrmYum02Zx2i00LECggXGM3Tp4xOU1pVT/AFjWPeSX59a9X
         iD9YXUGA767bcP1OoHhZ0UXMImXGwLAt/yyB5FUAhphW+npMCxo0Ujim+gornTtbkknO
         TwqVa273zUELfXvyceKFWGIW2OSV/QuUkt6K93mK3gk8yCOiFRTxhgLJ9CUGkE9P0sko
         Ss6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=qCj6t9i0W3sb2ln0b96wAfXWo/73GqR5rc/beByGUac=;
        fh=MGNs5MsPfS8GULtQe2qMcYQbAiZJSQuMQcVfuHK1z7k=;
        b=uabiyN4MwJHlbR8xMaro3l5ilII7dn0KrDJPmD5DqSlFNJSYgxfThgjruGatGF3Krz
         gk/LIxyyAlKKHiD0gAWIrr9R9OCbLnXiVNl8HWFbWiSJyfWXVgeEe8UQTcJjDQpH3zi2
         TVHQGyiUeqERlZqbVO25DwfWiKMY/adXiAPV9YSJVMh1//T0F4B290xkd1hDEchptWth
         PZBx5851rI4HDO3Q5GF9hkSx1nl38mfU5hq9kdnI/MNoHq4o7AWmS9oCIdqfZh8D8jg+
         g+eMVEWfyjbHkVrLlPRbDFL0XDaSMtDQ+tHAecbb5QDLHWfTHIaeB8wu2Gq/z2DKFRdT
         QsNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a05620a0cee00b00788220ec8a5si3194230qkj.47.2024.03.04.01.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 01:30:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rh4dm-0007v6-8s; Mon, 04 Mar 2024 04:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rh4dj-0007uc-My; Mon, 04 Mar 2024 04:29:43 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rh4dg-0005bh-P6; Mon, 04 Mar 2024 04:29:43 -0500
Received: from TWMBX03.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 4 Mar
 2024 17:29:37 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 4 Mar
 2024 17:30:36 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Mar 2024 17:29:36 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 0/9] Add AST2700 support
Date: Mon, 4 Mar 2024 17:29:25 +0800
Message-ID: <20240304092934.1953198-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 58naPqkUos01

Changes from v1:
The patch series supports WDT, SDMC, SMC, SCU, SLI and INTC for AST2700 SoC.

Changes from v2:
- replace is_aarch64 with is_bus64bit for sdmc patch review.
- fix incorrect dram size for AST2700

Test steps:
1. Download openbmc image for AST2700 from
   https://github.com/AspeedTech-BMC/openbmc/releases/tag/v09.00
   https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.00/
   ast2700-default-obmc.tar.gz
2. untar ast2700-default-obmc.tar.gz
   ```
   tar -xf ast2700-default-obmc.tar.gz
   ```
3. Run and the contents of scripts as following
IMGDIR=ast2700-default
UBOOT_SIZE=$(stat --format=%s -L ${IMGDIR}/u-boot-nodtb.bin)
UBOOT_DTB_ADDR=$((0x400000000 + ${UBOOT_SIZE}))

qemu-system-aarch64 -M ast2700-evb -nographic\
 -device loader,addr=0x400000000,file=${IMGDIR}/u-boot-nodtb.bin,force-raw=on\
 -device loader,addr=${UBOOT_DTB_ADDR},file=${IMGDIR}/u-boot.dtb,force-raw=on\
 -device loader,addr=0x430000000,file=${IMGDIR}/bl31.bin,force-raw=on\
 -device loader,addr=0x430080000,file=${IMGDIR}/optee/tee-raw.bin,force-raw=on\
 -device loader,addr=0x430000000,cpu-num=0\
 -device loader,addr=0x430000000,cpu-num=1\
 -device loader,addr=0x430000000,cpu-num=2\
 -device loader,addr=0x430000000,cpu-num=3\
 -smp 4\
 -drive file=${IMGDIR}/image-bmc,format=raw,if=mtd\
 -serial mon:stdio\
 -snapshot

Known Issue:
1. QEMU supports ARM Generic Interrupt Controller, version 3(GICv3)
but not support Shared Peripheral Interrupt (SPI), yet.
Added work around in INTC patch to set GICINT132[18]
which was BMC UART interrupt if it received GICINT132, so users are
able to type any key from keyboard to trigger GICINT132 interrupt
until AST2700 boot into login prompt. It is a temporary solution.
If users encounter boot stck and no booting log,
please type any key from keyboard.

Jamin Lin (9):
  aspeed/wdt: Add AST2700 support
  aspeed/sli: Add AST2700 support
  aspeed/sdmc: Add AST2700 support
  aspeed/smc: Add AST2700 support
  aspeed/scu: Add AST2700 support
  aspeed/intc: Add AST2700 support
  aspeed/soc: Add AST2700 support
  aspeed: Add an AST2700 eval board
  aspeed/soc: fix incorrect dram size for AST2700

 hw/arm/aspeed.c                  |  32 ++
 hw/arm/aspeed_ast27x0.c          | 554 +++++++++++++++++++++++++++++++
 hw/arm/meson.build               |   1 +
 hw/intc/aspeed_intc.c            | 135 ++++++++
 hw/intc/meson.build              |   1 +
 hw/misc/aspeed_scu.c             | 306 ++++++++++++++++-
 hw/misc/aspeed_sdmc.c            | 215 ++++++++++--
 hw/misc/aspeed_sli.c             | 179 ++++++++++
 hw/misc/meson.build              |   3 +-
 hw/misc/trace-events             |  11 +
 hw/ssi/aspeed_smc.c              | 326 ++++++++++++++++--
 hw/ssi/trace-events              |   2 +-
 hw/watchdog/wdt_aspeed.c         |  24 ++
 include/hw/arm/aspeed_soc.h      |  27 +-
 include/hw/intc/aspeed_vic.h     |  29 ++
 include/hw/misc/aspeed_scu.h     |  47 ++-
 include/hw/misc/aspeed_sdmc.h    |   4 +-
 include/hw/misc/aspeed_sli.h     |  32 ++
 include/hw/ssi/aspeed_smc.h      |   1 +
 include/hw/watchdog/wdt_aspeed.h |   3 +-
 20 files changed, 1880 insertions(+), 52 deletions(-)
 create mode 100644 hw/arm/aspeed_ast27x0.c
 create mode 100644 hw/intc/aspeed_intc.c
 create mode 100644 hw/misc/aspeed_sli.c
 create mode 100644 include/hw/misc/aspeed_sli.h

-- 
2.25.1

