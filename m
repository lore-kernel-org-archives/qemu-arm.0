Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3025693ejb;
        Mon, 27 May 2024 01:04:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4q0dBaf6lYNYkTo8NJTSM6hV5oONNAvJyC9NLsNGX+xrBTxureISyfVqTsnimBwn8qM1TDNbBFDALdvci5av0sQsR2mJS
X-Google-Smtp-Source: AGHT+IEykm44esLQ0Ngfx8MZcHAqVkhwVGt+K1Z0+VlWvZHuIB4EL6xk36XjmKcL4aLb+sHNESV1
X-Received: by 2002:a05:620a:2950:b0:794:b307:c69c with SMTP id af79cd13be357-794b307c708mr788198285a.62.1716797070964;
        Mon, 27 May 2024 01:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716797070; cv=none;
        d=google.com; s=arc-20160816;
        b=o4O44tn7tTyb4wItXqAkVYEZhxcuVthytNHH/g4nzHgjRvrPJrr9ATD3yT1oz6VfZd
         QKQN9g1KP0RLzMDRR1LctVfA888geBqH9/SVy/HQsq6y0xFtbt50W496LhfqYnYbD8Sy
         QofakI6GqhOP5L3zx7gNJ/0RzNzadPMUdCUF8KZcABfE66U3HOti6fVPWBjuKFaTJAeH
         FRt4VEOnCpGIjJyQpzo52wBmoUg8ACyAY6LZJ0Fzw/Ng9QkqlqBwBdEY8y2n/EwLZupY
         lI4NMK4roD+8D5KgC19SIMnPv+jjwB5OZn6lnYtjIOMhP5WprIaTte2zYkMSoPFepcsp
         XtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=+pTzuivupxQwrYFVqbrFb3b49T1JDtZ283ITxGDXWF4=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=nwKQcESQDWLOYOaJmcZ2w4G+qG1hwhkskiDnjt6NzULeDUX8pshwox0adsuSFwZZSR
         CN90lAj1tp1TaWGhnKnX/M9GrPTKPwaOAo2flboP5TZhUPzXPZ6Iq+AU9N+nVUPbyMLb
         S+pyfX4cVWxaQSCJXtdFViBBnzKRn9lDyIfC0v9nC7RJX724UU6yGTLuRg0kJp8EVuY1
         RuWWg98RZhVU9mewXfqAv86Kyt2E4D1imiMhJ/LdS6wTI92jd2acNOTOM8VMOQgd8FN3
         Jva0yGc0QgHrYmHiaXcWDCLrWjQkfonPWiquvY+He1F02Fk0YraDYqbinoC4WcPWK9nm
         XL1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd614bdsi718738085a.785.2024.05.27.01.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 01:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBVKa-0001WV-81; Mon, 27 May 2024 04:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sBVJd-0000AJ-Af; Mon, 27 May 2024 04:02:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sBVJX-0005H2-DE; Mon, 27 May 2024 04:02:44 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 27 May
 2024 16:02:31 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 27 May
 2024 16:02:33 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 27 May 2024 16:02:31 +0800
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
Subject: [PATCH v4 00/16] Add AST2700 support
Date: Mon, 27 May 2024 16:02:14 +0800
Message-ID: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
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
X-TUID: 0DkHIbpGfxA+

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

Changes from v4:
- support 64 bits dma dram address associated with review issues
- support dma start length and 1 byte length unit associated with review issues
- refactor intc model to fix serial console stuck issue and associated with review issues

Test Version:
https://github.com/qemu/qemu/commit/0c2a3807483b4ebe360cfa475dbfc9dfd2f6d16d

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
  aspeed/smc: support dma start length and 1 byte length unit
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
 hw/arm/aspeed_ast27x0.c          | 655 +++++++++++++++++++++++++++++++
 hw/arm/meson.build               |   1 +
 hw/intc/aspeed_intc.c            | 355 +++++++++++++++++
 hw/intc/meson.build              |   1 +
 hw/intc/trace-events             |   6 +
 hw/misc/aspeed_scu.c             | 306 ++++++++++++++-
 hw/misc/aspeed_sdmc.c            | 216 +++++++++-
 hw/misc/aspeed_sli.c             | 177 +++++++++
 hw/misc/meson.build              |   3 +-
 hw/misc/trace-events             |  11 +
 hw/ssi/aspeed_smc.c              | 321 ++++++++++++++-
 hw/ssi/trace-events              |   2 +-
 hw/watchdog/wdt_aspeed.c         |  24 ++
 include/hw/arm/aspeed_soc.h      |  27 +-
 include/hw/intc/aspeed_intc.h    |  46 +++
 include/hw/misc/aspeed_scu.h     |  47 ++-
 include/hw/misc/aspeed_sdmc.h    |   5 +-
 include/hw/misc/aspeed_sli.h     |  27 ++
 include/hw/ssi/aspeed_smc.h      |   2 +
 include/hw/watchdog/wdt_aspeed.h |   3 +-
 tests/avocado/machine_aspeed.py  |  62 +++
 23 files changed, 2312 insertions(+), 56 deletions(-)
 create mode 100644 hw/arm/aspeed_ast27x0.c
 create mode 100644 hw/intc/aspeed_intc.c
 create mode 100644 hw/misc/aspeed_sli.c
 create mode 100644 include/hw/intc/aspeed_intc.h
 create mode 100644 include/hw/misc/aspeed_sli.h

-- 
2.25.1

