Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3136656lfm;
        Sun, 12 Apr 2020 15:37:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypJZDT7Ccjvm2HxNln4bOvmWqll3k6Ym/5jldXcNQJjaQccX1gakebT3C0aVhyhiyKbhVrdA
X-Received: by 2002:ad4:45ae:: with SMTP id y14mr586725qvu.145.1586731023090;
        Sun, 12 Apr 2020 15:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586731023; cv=none;
        d=google.com; s=arc-20160816;
        b=f3/zgmH9KHvGTpPxq4IFIRwhwwlVsZ28vmDvY6hHy0nl1sB4E4BlKEK3B81bn+Cw2e
         27jjWaskZS4QetBwXPkkmNbW2D3q0ze3QrCnQvGaa7B8tTSvn6Eh51fEzjXe3PPGWbdk
         vCWUDrXc4CAB39J23B/kOEuE233NxIBxL41iYm0G49bKqOsCrkN4kDz92VTAz7XceJvs
         SKZUnkPP3iazHPhoFSU8uioSxBEiUxBsaT2eMwPa9XgEqPHEsgmZCewJmzf6GQh0VBRn
         yAWiubQPrzBnFoAEoJA6FO242uSFbuvMg+4bvk6Pf0NaMfbJX0df2gcSV7ALMgz8VZmW
         3MmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=O9DVxnJIdTKjCwxywR9qxji3Q0BtyKw5Rq6FDdEjMX4=;
        b=K9KKf82tG8mSmiBmDDeSu7JaGZIsj9RZbE3hnLbg/+0eAI+HIRsA/uQMZq88ybhtSZ
         mXfvamCC9YK2g+sQj2xRVeefZgj2ZnGoW7wTlgmRSSxt5/5205SBG5KSim/kRfepqNh0
         2Or78+POvnWhFcaQjr6+7/e22Ww5uQsiFhc2sFhkmirEB5piiwj1qQvkZP2DHblzzObD
         jwZuX/ac76sSR1XNyIROE6j/1xuz00KvBDWKVNB2YExH9k59kYvChvNkFUbkVYn8KMCm
         5zFK2xYNSvLR39dRCXy7/8QQWbSV6Qdf9uchqOhxABpmYmJit8+tS7pESsr2mNPiPKcO
         CRjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bcKgdj2G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23si5029232qkb.380.2020.04.12.15.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:37:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bcKgdj2G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlDq-0004ta-ED
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDK-0004tM-6U
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDI-0001mG-5u
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:36:30 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36397)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDH-0001l8-J0; Sun, 12 Apr 2020 18:36:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id a201so8009293wme.1;
 Sun, 12 Apr 2020 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9DVxnJIdTKjCwxywR9qxji3Q0BtyKw5Rq6FDdEjMX4=;
 b=bcKgdj2G5dcGHI/taGqt6SJmDDHYp8NjlA/n51/kci3Ejs50CU02jtQQmxvBUHJ5Xy
 g1r5E+oSMSNlwg/9QWbuZwE/lY5KgAv1FINYhiKFl5f0Kclg0hZnYUtJAk7PhL4uLeo5
 5NuKeq9oUQ5hVjSqcOQn7wjVbqpTViGYAOI3PempLhSif4hlNORocx08xlbtnLEzv8Iy
 xhqV2DPXcbrA3f1rTs32egW8cMGqhBgrx17c/nOHDLFjTlXH2sVhpFpVCxHlOUSB8fZJ
 pbKqoETm/J5XUHsCsLHihpsRS05/a01GS10LUxJ+9xp7A+yJ10yabcgUlm4AGm2PgA+y
 pkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=O9DVxnJIdTKjCwxywR9qxji3Q0BtyKw5Rq6FDdEjMX4=;
 b=G4UG8nEYoprHURVLWz79ezlAq2TAQUSRpXilI9BjdVKp6ZEmBw+C3SgeEYJwm7w612
 jgVt9BCyJrmVC2iGepNW/2qp1TaFB9bRS5lBfFBJUzmpizoBEbAFqlKofGqWE2chTj0Z
 oAsnDlqeLlckjfqL6mrIgRoXkJVvychG04+tkXp6Zi2jGkMUh7rSx01fAPLwT0BuKdvI
 IIcIXxOdVvXbmXFcpmud92s7ME8dLUOcETNnGXnYvj2drokfQZfWLeHZYUKcZsaKQ+sX
 8aw3W0/Mg1nTTBBuSGHSMfF8bf7Qb6CppKq2RlkCXHoDSy7Qwi6qKMoxO8POpcji0krY
 2wlw==
X-Gm-Message-State: AGi0PuaR10BpGOaoPs4JLjgvx4z57PK+1c0dQzdtlSsS6ipZokEa2D8z
 3xLuVLc912nHJPp/T29IxlPG/qUvIuogUQ==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr14925481wmc.64.1586730984452; 
 Sun, 12 Apr 2020 15:36:24 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:36:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 00/24] various: Fix error-propagation with
 Coccinelle scripts (part 1)
Date: Mon, 13 Apr 2020 00:35:55 +0200
Message-Id: <20200412223619.11284-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K2NxmAHw1LBM

This series is inspired of Peter Maydell fix [1]:
"hw/arm/xlnx-zynqmp.c: fix some error-handling code",
but grew after v1 [2] review :/

Markus: I added the cocci patches to your Error section, I hope
that's fine :)

Part 1: Simplify error propagation by moving some code from
        DeviceClass::realize() to DeviceClass:initfn().

Regards,

Phil.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg692155.html
Supersedes: <20200406174743.16956-1-f4bug@amsat.org>

Philippe Mathieu-Daud=C3=A9 (24):
  various: Remove suspicious '\' character outside of #define in C code
  scripts/coccinelle: Script to simplify DeviceClass error propagation
  hw/arm/allwinner-a10: Move some code from realize() to init()
  hw/arm/aspeed_ast2600: Simplify use of Error*
  hw/arm/aspeed_ast2600: Move some code from realize() to init()
  hw/arm/aspeed_soc: Move some code from realize() to init()
  hw/arm/aspeed_soc: Simplify use of Error*
  hw/arm/fsl-imx6: Simplify checks on 'smp_cpus' count
  hw/arm/fsl-imx6: Move some code from realize() to init()
  hw/arm/fsl-imx31: Move some code from realize() to init()
  hw/arm/msf2-soc: Store MemoryRegion in MSF2State
  hw/arm/stm32f205_soc: Store MemoryRegion in STM32F205State
  hw/arm/stm32f205_soc: Move some code from realize() to init()
  hw/arm/xlnx-zynqmp: Use single propagate_error() call
  hw/arm/xlnx-zynqmp: Split xlnx_zynqmp_create_rpu() as init + realize
  hw/arm/xlnx-zynqmp: Move some code from realize() to init()
  hw/microblaze/xlnx-zynqmp-pmu: Move some code from realize() to init()
  hw/pci-host/pnv_phb3: Move some code from realize() to init()
  hw/riscv/sifive_e: Move some code from realize() to init()
  hw/riscv/sifive_u: Use single type_init()
  hw/riscv/sifive_u: Move some code from realize() to init()
  hw/riscv/sifive_u: Store MemoryRegion in SiFiveUSoCState
  hw/riscv/sifive_u: Move some code from realize() to init()
  hw/riscv/sifive_u: Rename MachineClass::init()

 ...implify-init-realize-error_propagate.cocci |  69 ++++++++++
 include/hw/arm/msf2-soc.h                     |   4 +
 include/hw/arm/stm32f205_soc.h                |   4 +
 include/hw/riscv/sifive_u.h                   |   2 +
 block/replication.c                           |   4 +-
 block/vhdx.c                                  |   8 +-
 dump/dump.c                                   |   2 +-
 hw/arm/allwinner-a10.c                        |  26 ++--
 hw/arm/aspeed_ast2600.c                       |  61 +++++----
 hw/arm/aspeed_soc.c                           |  19 +--
 hw/arm/fsl-imx31.c                            |   4 +-
 hw/arm/fsl-imx6.c                             |  55 ++++----
 hw/arm/msf2-soc.c                             |  18 +--
 hw/arm/stm32f205_soc.c                        |  28 ++--
 hw/arm/xlnx-zynqmp.c                          | 126 +++++++++---------
 hw/microblaze/xlnx-zynqmp-pmu.c               |  46 +++----
 hw/net/virtio-net.c                           |   2 +-
 hw/pci-host/pnv_phb3.c                        |   8 +-
 hw/riscv/sifive_e.c                           |  26 ++--
 hw/riscv/sifive_u.c                           |  66 +++++----
 hw/scsi/scsi-disk.c                           |   2 +-
 hw/sd/sdhci.c                                 |   2 +-
 target/i386/cpu.c                             |  18 +--
 target/microblaze/cpu.c                       |  14 +-
 target/ppc/translate_init.inc.c               |   4 +-
 MAINTAINERS                                   |   1 +
 26 files changed, 342 insertions(+), 277 deletions(-)
 create mode 100644 scripts/coccinelle/simplify-init-realize-error_propagate.=
cocci

--=20
2.21.1

