Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp245251ejd;
        Tue, 16 Apr 2024 02:19:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUf4MLO67Kjz88zi2fOCm1ALDplhVKA70rylH4dozC9EMhI/tNwoLTRMOXYDM1MMBaIWnfLGGxFhnIR6p0X+okX8myePIkZ
X-Google-Smtp-Source: AGHT+IHMatWXLCOcoVWYwEvued7JB9mql0bJ3ckGYjfLt9gVdyfA8WQLJbQWBWQC899xbO+1CjDp
X-Received: by 2002:a05:620a:cd2:b0:789:ec18:6996 with SMTP id b18-20020a05620a0cd200b00789ec186996mr12225388qkj.26.1713259175347;
        Tue, 16 Apr 2024 02:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713259175; cv=none;
        d=google.com; s=arc-20160816;
        b=UWVYfXgEuFBDLf0ob1RlfyBBVsGln01gGcSAZdEScs7W3ner/FJ4mD9R62a1QLQjm7
         KTzKJXPSTZvlqyOwELjKUpVe2dRjhAm78A5r01sI3oNf0N3joMLMcPIIwW/OJUXSA4+t
         K4mulLnPP9fswZtMLNqr+b9KWVzBxp8j+y8QoSUW/x4zU8e5V4yvbZsXaD63ZgCvVw9r
         wq0C76H5LmjZbEXlTivbzS5sSw8CnSPtgl6DfDqkqasC2yzP0xCBy2x/Dg1TVZwDQ8nd
         xVBwTC5j06QD9G3KSrZGYx+RbkXTGFzqq3CxNI808lq0k7PZgQhgz/m+hLyAM9qEKPWR
         hKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=hhfNaOJjxecL8Pm4E3R9XaHoN32w2oDfobGLiTd7sn4=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=WP6hR86TAP1Es026lEs76X53hB6O2Cxj0JsHyrESDe6f0WqxxiwizgR0Lg0v677FT/
         078BU0k0zmYeT9bOEFrILprUY0dNVB74QxiZdWdmQMhReCb9Hv3iIPxDuDku+8bnn3As
         mFwJk7jg/z/DomyquDsrB1zuDTsWVd7No0sRNIPI3Zeom9idrgGkpJNt228jHv7ubVnK
         AfqSElfF4SDPdOfk6K3xpXL9JpvYAq8b2p8LDkwvXAaeNs7IlTvyfXvXSKngJfQYPM+l
         iej8dvwuOzH4M2ZXW9Vx6A5/x0aSFT7VsRYQZJzdfBUmCCKuCqKOHuHHbuEjG7rM4GAs
         tQcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr5-20020a05620a390500b0078d64333e0csi13976645qkn.24.2024.04.16.02.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 02:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rweyP-0002YM-PM; Tue, 16 Apr 2024 05:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweyL-0002Xn-2D; Tue, 16 Apr 2024 05:19:25 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweyA-0007Zt-Cf; Tue, 16 Apr 2024 05:19:17 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 17:19:04 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 16 Apr 2024 17:19:04 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 00/16] Add AST2700 support
Date: Tue, 16 Apr 2024 17:18:47 +0800
Message-ID: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: N8LWTefdL4JZ

Changes from v1:
The patch series supports WDT, SDMC, SMC, SCU, SLI and INTC for AST2700 SoC.

Changes from v2:
- replace is_aarch64 with is_bus64bit for sdmc patch review.
- fix incorrect dram size for AST2700

Changes from v3:
- Add AST2700 Evaluation board in ASPEED document
- Add avocado test cases for AST2700 Evaluation board
- Fix reviewers review issues and add reviewers suggestions
- Implement INTC model GICINT 128 to GICINT136 for AST2700

Test steps:
1. Download the latest openbmc image for AST2700 from AspeedTech-BMC/openbmc
   repository, https://github.com/AspeedTech-BMC/openbmc/releases/tag/v09.01
   link: https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.01/ast2700-default-obmc.tar.gz
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

Jamin Lin (16):
  aspeed/wdt: Add AST2700 support
  aspeed/sli: Add AST2700 support
  aspeed/sdmc: remove redundant macros
  aspeed/sdmc: fix coding style
  aspeed/sdmc: Add AST2700 support
  aspeed/smc: correct device description
  aspeed/smc: fix dma moving incorrect data length issue
  aspeed/smc: support 64 bits dma dram address
  aspeed/smc: Add AST2700 support
  aspeed/scu: Add AST2700 support
  aspeed/intc: Add AST2700 support
  aspeed/soc: Add AST2700 support
  aspeed: Add an AST2700 eval board
  aspeed/soc: fix incorrect dram size for AST2700
  test/avocado/machine_aspeed.py: Add AST2700 test case
  docs:aspeed: Add AST2700 Evaluation board

 docs/system/arm/aspeed.rst       |  39 +-
 hw/arm/aspeed.c                  |  32 ++
 hw/arm/aspeed_ast27x0.c          | 646 +++++++++++++++++++++++++++++++
 hw/arm/meson.build               |   1 +
 hw/intc/aspeed_intc.c            | 269 +++++++++++++
 hw/intc/meson.build              |   1 +
 hw/intc/trace-events             |   6 +
 hw/misc/aspeed_scu.c             | 306 ++++++++++++++-
 hw/misc/aspeed_sdmc.c            | 216 ++++++++++-
 hw/misc/aspeed_sli.c             | 178 +++++++++
 hw/misc/meson.build              |   3 +-
 hw/misc/trace-events             |  11 +
 hw/ssi/aspeed_smc.c              | 344 +++++++++++++++-
 hw/ssi/trace-events              |   2 +-
 hw/watchdog/wdt_aspeed.c         |  24 ++
 include/hw/arm/aspeed_soc.h      |  27 +-
 include/hw/intc/aspeed_intc.h    |  35 ++
 include/hw/misc/aspeed_scu.h     |  47 ++-
 include/hw/misc/aspeed_sdmc.h    |   5 +-
 include/hw/misc/aspeed_sli.h     |  31 ++
 include/hw/ssi/aspeed_smc.h      |   1 +
 include/hw/watchdog/wdt_aspeed.h |   3 +-
 tests/avocado/machine_aspeed.py  |  62 +++
 23 files changed, 2234 insertions(+), 55 deletions(-)
 create mode 100644 hw/arm/aspeed_ast27x0.c
 create mode 100644 hw/intc/aspeed_intc.c
 create mode 100644 hw/misc/aspeed_sli.c
 create mode 100644 include/hw/intc/aspeed_intc.h
 create mode 100644 include/hw/misc/aspeed_sli.h

-- 
2.25.1

