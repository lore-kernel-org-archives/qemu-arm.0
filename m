Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp217000eja;
        Wed, 28 Feb 2024 23:23:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYfrJ1TnVhK2wHnfhQuf9bPhxp8l2YBiPwWC2a4MvHurEQzT/8kzM6Ako6Y/Suad+eiggZiqTnQDo8aJyMaktxO9UkhYSp
X-Google-Smtp-Source: AGHT+IGBYUzakxlcXb35Ul8QBK6N3szo57/WIKvKLE5d3ZbIrOmkrEG0yjCEcAT251YL/J7Riucy
X-Received: by 2002:ad4:46c7:0:b0:68f:3f89:b302 with SMTP id pm7-20020ad446c7000000b0068f3f89b302mr1574749qvb.0.1709191419377;
        Wed, 28 Feb 2024 23:23:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709191419; cv=none;
        d=google.com; s=arc-20160816;
        b=ecVMgcGedXPd/Y7xWVlmKlAYpi9Nu8LnRIqgZ3opIGDUjKg7aGPQ53OFCsqP+oaP/q
         VLmkp0wqNb+ZDPEt3oIHRB/21R1XScwUdzwWZXuz+lltzs++9uWxwQYuHV3R37HGfCpV
         GHR0rL9SG3a7psfjmLTvHFCRNCyhozlvhQTg/SvlrdqCrKNgv3l4wZaJRQAQQrXbDio8
         IKzZjF1/WoSc2ITFoqTfdYV1/GtbY+w28INR4xpJahVW7UDf8fOgKV35RnXwjd8lAj7X
         Z2lepVQQuiRi6GAD29EmR4fabokqdmfBnl/iQoKQwW+k3pE2NdT15cB4DiHApqYcmC8N
         1zPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=FcvMDv76OcDGlLOqM/h891oml/WS03pjHw5o/BfpYPc=;
        fh=PdtwIDHs/tPxejUvGNuNc+OfbOLCj28QtuyfcdtzgXw=;
        b=Pkk93Yt4XDLxeTFdET0VY666oQ4d8ufNm4nsV+SYpwTFaEKnPoHbxUSzc/IK9D59iV
         3IB7w5Uc3hGBQaSqUoy/mWmRsIMLQsH/NDiKAQI5gClYZ92+6E75KbZzk/oz4sG9g01P
         s89kJ0ftRx6PxNLE6XA0E9wAiLIREkduOaE5ahtmH3Wl/WP+D+Lfr0f0GfMNwuTlZHcH
         vcMjJ/ZMcmzAz2rP/gMotU8OUCdplLz155TCI3W4OBAOtkyEG4MsAkWAm3ujP96KzhPm
         uAanZ+m3WVAPxvP+h2ambMHwYnX4Lrm4bz1b8iRjjCAZZwwp83JFmWw4VHuLSoHj1knY
         g6Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0562140da200b0068f6a21487fsi802116qvh.15.2024.02.28.23.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 23:23:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfalN-0003gO-UQ; Thu, 29 Feb 2024 02:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rfalL-0003bu-Hp; Thu, 29 Feb 2024 02:23:27 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rfalG-0008LL-D5; Thu, 29 Feb 2024 02:23:26 -0500
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Feb
 2024 15:23:16 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Feb 2024 15:23:16 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 0/8] Add AST2700 support
Date: Thu, 29 Feb 2024 15:23:07 +0800
Message-ID: <20240229072315.743963-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: I4wRB9lKkIAm

Changes from v1:
The patch series supports WDT, SDMC, SMC, SCU, SLI and INTC for AST2700 SoC.

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

qemu-system-aarch64 -M ast2700-evb -nographic -m 8G\
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

2. It is required to add "-m 8G" to set the dram size 8G.
AST2700 dram size calculation is not compatible AST2600.
According to the DDR hardware capacity behavior, if users write the
data at address which is over than the supported size, it would set
the data at address 0.
For example:
a. sdram base address "0x4 00000000"
b. sdram size is 1GiB
The available address range is from "0x4 00000000" to "0x4 40000000".
If users write 0xdeadbeef at address "0x6 00000000", the value of
DRAM address 0 (base address 0x4 00000000) should be 0xdeadbeef.
Please see ast2700_sdrammc_calc_size in
https://github.com/AspeedTech-BMC/u-boot/blob/v00.05.00/drivers/ram/aspeed/
sdram_ast2700.c

It seems we should create a new function instead of aspeed_soc_dram_init
to support AST2700.
https://github.com/qemu/qemu/blob/master/hw/arm/aspeed_soc_common.c

Jamin Lin (8):
  aspeed/wdt: Add AST2700 support
  aspeed/sli: Add AST2700 support
  aspeed/sdmc: Add AST2700 support
  aspeed/smc: Add AST2700 support
  aspeed/scu: Add AST2700 support
  aspeed/intc: Add AST2700 support
  aspeed/soc: Add AST2700 support
  aspeed: Add an AST2700 eval board

 hw/arm/aspeed.c                  |  32 +++
 hw/arm/aspeed_ast27x0.c          | 462 +++++++++++++++++++++++++++++++
 hw/arm/meson.build               |   1 +
 hw/intc/aspeed_intc.c            | 135 +++++++++
 hw/intc/meson.build              |   1 +
 hw/misc/aspeed_scu.c             | 306 +++++++++++++++++++-
 hw/misc/aspeed_sdmc.c            | 215 ++++++++++++--
 hw/misc/aspeed_sli.c             | 179 ++++++++++++
 hw/misc/meson.build              |   3 +-
 hw/misc/trace-events             |  11 +
 hw/ssi/aspeed_smc.c              | 326 ++++++++++++++++++++--
 hw/ssi/trace-events              |   2 +-
 hw/watchdog/wdt_aspeed.c         |  24 ++
 include/hw/arm/aspeed_soc.h      |  26 +-
 include/hw/intc/aspeed_vic.h     |  29 ++
 include/hw/misc/aspeed_scu.h     |  47 +++-
 include/hw/misc/aspeed_sdmc.h    |   4 +-
 include/hw/misc/aspeed_sli.h     |  32 +++
 include/hw/ssi/aspeed_smc.h      |   1 +
 include/hw/watchdog/wdt_aspeed.h |   3 +-
 20 files changed, 1787 insertions(+), 52 deletions(-)
 create mode 100644 hw/arm/aspeed_ast27x0.c
 create mode 100644 hw/intc/aspeed_intc.c
 create mode 100644 hw/misc/aspeed_sli.c
 create mode 100644 include/hw/misc/aspeed_sli.h

-- 
2.25.1

