Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2718716ejs;
        Mon, 3 Jun 2024 22:49:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW77As9NTACYq7nkm7GVfvdJF6cCfK4bLAaOKPDPkvdalUJm/13SkAluR7/26cmxI0pB0MUiH87yemqVZbCa6AD5l7F9o5I
X-Google-Smtp-Source: AGHT+IHnwuhYByXfcv140wpI4jkrQgPyqiTSZvut7smtk0SJpcVWee6Cv/B+8G4zOq/TS8uVf5mz
X-Received: by 2002:a05:6102:2413:b0:47c:122b:a3bd with SMTP id ada2fe7eead31-48bc1f6f30cmr10839369137.2.1717480168818;
        Mon, 03 Jun 2024 22:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717480168; cv=none;
        d=google.com; s=arc-20160816;
        b=zvrPc6hAN0vPRUlB8eKBUETdWZiFTnFXgJxpLin8FuqL8Vx+XnzFV/I+PDegu0fVpO
         DL4sifUY6Dkl9tZ8tvBi9yVMmFFkJtd8VDpngyeMxRTIg/s1kaEvlPsqPyRRtTKC/lye
         mHqsC9TMllIQOXyO+3kqwmbZLhj7j0DDDnq5h5mqACpLf4bO4hqJYCDIPUsFqqOpFpwH
         9VNIZ94i2nvzlY14/29lgWj1Kcavz/I5/Wd4IN53CGDuzEn5La7/yr1c4MZ4vhx3dlou
         wyPlLpvpnOPJeV5CpjqDZeQQ7IkEYtFRwPh7shsMsNd+PITsXiTyIqcDqI73WYlpKMo/
         PkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=pmLQr0XGLquIG7LaF5YOOHqRsWO59bGm1ZN5AQopaWU=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=jz3wz1b+ExlrSTaJ+FnpjVfHaArAP55Bm3kUkzzGmU99f2LkTqUBt1gd6KHGf3+Zq+
         EIaCAsVXc96qN6Qbl7CzrYRJDXbbfa7G8BwsLMmGr8d/Sbm8clm16rU+QJuwAnk6FQ6y
         LGsRH/MKfw37mVz5aI201XaSq4TbpuntYErlEU7kaPBxgCjLuWUa+h3ZX3qo0r0wBy78
         puwJT0td/Z6mo5yT3KW3Q4YgdBkdIIHCSdlRSsYLOxnMrpVMROh8GPXww/fKpzpYh8v8
         MQRbXuzAZQHn39usApz+yMhO3n1cPjIo6MpqE4MeY+ZmkqGO8FFjdYXTFML65QyeqfVd
         HdHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f32a7f54si988905485a.689.2024.06.03.22.49.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:49:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sEMyb-0005XM-Q0; Tue, 04 Jun 2024 01:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyZ-0005X7-RM; Tue, 04 Jun 2024 01:44:51 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyW-0008TH-L6; Tue, 04 Jun 2024 01:44:51 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:39 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 Jun
 2024 13:44:39 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:38 +0800
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
Subject: [PATCH v5 00/17] Add AST2700 support
Date: Tue, 4 Jun 2024 13:44:21 +0800
Message-ID: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
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
X-TUID: lmjYdkqYjbBz

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

Changes from v5:
- sdmc: incrementing the version of vmstate to 2.
- smc: support different memory region ops for SMC flash region
       introduce a new "const MemoryRegionOps *" attribute in AspeedSMCClass and
       use it in aspeed_smc_flash_realize function.
- intc: fix associated with review issues
- dram size detect: change to use address space API and simplify with write
                    transaction on the DRAM memory region of the SoC.
- ast27x0_soc: update aspeed_soc_ast2700_gic function associated with review issues
               and rename to aspeed_soc_ast2700_gic_realize

Test Version:
qemu commit:
https://github.com/qemu/qemu/commit/74abb45dac6979e7ff76172b7f0a24e869405184
applied patch:
https://patchew.org/QEMU/20240527124315.35356-1-clg@redhat.com/

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

Jamin Lin (17):
  aspeed/wdt: Add AST2700 support
  aspeed/sli: Add AST2700 support
  aspeed/sdmc: remove redundant macros
  aspeed/sdmc: fix coding style
  aspeed/sdmc: Add AST2700 support
  aspeed/smc: correct device description
  aspeed/smc: support dma start length and 1 byte length unit
  aspeed/smc: support 64 bits dma dram address
  aspeed/smc: support different memory region ops for SMC flash region
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
 hw/arm/aspeed_ast27x0.c          | 648 +++++++++++++++++++++++++++++++
 hw/arm/meson.build               |   1 +
 hw/intc/aspeed_intc.c            | 360 +++++++++++++++++
 hw/intc/meson.build              |   1 +
 hw/intc/trace-events             |  13 +
 hw/misc/aspeed_scu.c             | 306 ++++++++++++++-
 hw/misc/aspeed_sdmc.c            | 220 +++++++++--
 hw/misc/aspeed_sli.c             | 177 +++++++++
 hw/misc/meson.build              |   3 +-
 hw/misc/trace-events             |  11 +
 hw/ssi/aspeed_smc.c              | 346 ++++++++++++++++-
 hw/ssi/trace-events              |   2 +-
 hw/watchdog/wdt_aspeed.c         |  24 ++
 include/hw/arm/aspeed_soc.h      |  30 +-
 include/hw/intc/aspeed_intc.h    |  44 +++
 include/hw/misc/aspeed_scu.h     |  47 ++-
 include/hw/misc/aspeed_sdmc.h    |   5 +-
 include/hw/misc/aspeed_sli.h     |  27 ++
 include/hw/ssi/aspeed_smc.h      |   2 +
 include/hw/watchdog/wdt_aspeed.h |   3 +-
 tests/avocado/machine_aspeed.py  |  62 +++
 23 files changed, 2345 insertions(+), 58 deletions(-)
 create mode 100644 hw/arm/aspeed_ast27x0.c
 create mode 100644 hw/intc/aspeed_intc.c
 create mode 100644 hw/misc/aspeed_sli.c
 create mode 100644 include/hw/intc/aspeed_intc.h
 create mode 100644 include/hw/misc/aspeed_sli.h

-- 
2.25.1

