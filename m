Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1884572ejq;
        Mon, 8 May 2023 01:00:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ78PruaA2sLpc8Ou8cmUT2PJhn2K85X/x8+y39naspmgj8F2BybNv8j5mMdiqIUaEGYyn8j
X-Received: by 2002:ad4:5764:0:b0:5e6:8e03:994e with SMTP id r4-20020ad45764000000b005e68e03994emr14904157qvx.38.1683532857035;
        Mon, 08 May 2023 01:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532857; cv=none;
        d=google.com; s=arc-20160816;
        b=fnHqgUQ+0YkxHYQb/NRWANQvVZQ6sFHJxDZENrWem0bJJYrZVgErUrz/QTaYmQ958O
         FnQtGmhZI7gm6aixcZ/pYToBsZ8Kq3i0uPsXZIokLRWb4BvIiuJU4Fref1nScYleD3c2
         7ZmZZSRyLdSBZm9OVWt3m4aDf0hXy+nixtvZKTacBUdv2MvFBKuJSZPtXEneSvC9CfHg
         shAKUZqdOVLaQFQ7OBB9E/TGTiZ+DhBKV+5W7LeEHYpSnx7b43oUTUr3kh7B4prHdUia
         XOAcA1rFcuehxg4djeRNgUJ5gGq+QAyUQkbnIexBM9wwWc7u74ZkoOa4X3n3i8Ai7m3i
         7BMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=nwRnvpJqStIIknuv50a4o+41BVgj73i3bJsxlOF/xmI=;
        b=tXB6aAf1JDdiBpL8QMBTDf4lt5Kn+D2ZfkGfuRtnh06XCBPnu94t41b1r0pOPVwsIQ
         510bxijHW01YBx+GzhCfSOLOn1arvIzv/6QgzpCxvBm+vcfQ9MpDMcNUcSRJ6EWPBTu2
         pQdjuYWC7S84hnKaFy/59bwAtc+CsNrz7lHhCe2viZ5og5+o06IVM/J5e1uwUOlDoLok
         MONvRsLe/yZl+js8dBRKAA+jPm1YsD5AOo5j4f+zRvfOY9OQROk5m1LkxYID8c7iYuIT
         +Vr/64WbJcAEatNd6VZOP6rAF9tfCgY2BMFj25LC9+iXSvyrtOObm8MO9OtURUEqbxEJ
         W+Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im6-20020a056214246600b005ef55f9e058si2707815qvb.535.2023.05.08.01.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvvmJ-0007zZ-AH; Mon, 08 May 2023 03:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmF-0007xa-72; Mon, 08 May 2023 03:59:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmD-000151-7O; Mon, 08 May 2023 03:59:22 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDFm5TJsz4x49;
 Mon,  8 May 2023 17:59:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDFk2V7cz4x44;
 Mon,  8 May 2023 17:59:06 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 00/12] aspeed: fixes and extensions
Date: Mon,  8 May 2023 09:58:47 +0200
Message-Id: <20230508075859.3326566-1-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4L2ugBguC181

Hello,

This series fixes issues spotted by Coverity and adds a couple of
improvements for the machine definition.

The first is to offer the capability to define all CS of all SPI
controllers without introducing new machine types, using a blockdev on
the command line :

    -blockdev node-name=fmc0,driver=file,filename=./flash.img
    -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0

instead of using drives which relies on the command line order.
Ultimately, we will get rid of drive_get(IF_MTD, ...) but we are not
there yet. For this, SSIPeripheral is extended with an "addr"
property.

A second extension is the introduction of a "uart" machine option to
let the user define the default UART device of the machine from the
QEMU command line :

    -M ast2500-evb,uart=uart3

Last, a new "vfp-d32" CPU property is added to ARM CPUs to model FPUs
implementing VFPv4 without NEON support and with 16 64-bit FPU
registers (and not 32 registers). This is the case for the Cortex A7
of the Aspeed AST2600 SoC. I hope I got it right this time.

Thanks,

C.

Cédric Le Goater (12):
  aspeed/hace: Initialize g_autofree pointer
  aspeed: Introduce a boot_rom region at the machine level
  aspeed: Use the boot_rom region of the fby35 machine
  hw/ssi: Add an "addr" property to SSIPeripheral
  hw/ssi: Introduce a ssi_get_cs() helper
  aspeed/smc: Wire CS lines at reset
  hw/ssi: Check for duplicate addresses
  aspeed: Create flash devices only when defaults are enabled
  m25p80: Introduce an helper to retrieve the BlockBackend of a device
  aspeed: Get the BlockBackend of FMC0 from the flash device
  aspeed: Introduce a "uart" machine option
  target/arm: Allow users to set the number of VFP registers

 docs/system/arm/aspeed.rst          | 10 +++++
 include/hw/block/flash.h            |  4 ++
 include/hw/ssi/ssi.h                |  5 +++
 target/arm/cpu.h                    |  2 +
 hw/arm/aspeed.c                     | 68 ++++++++++++++++++++++-------
 hw/arm/aspeed_ast2600.c             |  2 +
 hw/arm/fby35.c                      | 29 ++++++------
 hw/arm/stellaris.c                  |  4 +-
 hw/arm/xilinx_zynq.c                |  1 +
 hw/arm/xlnx-versal-virt.c           |  1 +
 hw/arm/xlnx-zcu102.c                |  2 +
 hw/block/m25p80.c                   |  6 +++
 hw/microblaze/petalogix_ml605_mmu.c |  1 +
 hw/misc/aspeed_hace.c               |  2 +-
 hw/ssi/aspeed_smc.c                 |  8 ++++
 hw/ssi/ssi.c                        | 42 ++++++++++++++++++
 target/arm/cpu.c                    | 32 ++++++++++++++
 17 files changed, 187 insertions(+), 32 deletions(-)

-- 
2.40.0

