Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496024ejc;
        Fri, 1 Sep 2023 02:43:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKRys+9N0SkMC8pY0rd9b+F3Ra7Ioi2bgZtKovht7zmQSHH+1YuFhlLRhoVL+J8stfeT5J
X-Received: by 2002:a05:622a:2c6:b0:410:a9dd:bd07 with SMTP id a6-20020a05622a02c600b00410a9ddbd07mr2292040qtx.10.1693561424452;
        Fri, 01 Sep 2023 02:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561424; cv=none;
        d=google.com; s=arc-20160816;
        b=QtkN1l7jvzJjmptVaKlqWOh8YUT3puALh/w+iJZ2WaBw//haNL0YMXIMkoI1SzszWC
         QGWYmwlE2lKloe5y/ML4FuVcH5wqFVDwc1IjOuZbauddjWk7QU4hf36otzjzuPm3hjPW
         ziJJwHQ9qLNPV1jwj8Q3mNUfVVgKz4DagENWw+/fN5198YAYuITZ7VWX+NKbrxw3w5B/
         989PBUKk8NGKkkFgJNGofRnH03Hvm2rOKBCvijDXppgBu3dmPqBLP68Ab11H7f2QfbXj
         QDzRvPFcNllJHPXcoy+O4dyO9DWeCFIlcwUfZnfu1lHNwLOQJuJFkJGzX0wNmK8/bx0T
         G0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=nvZyA6vviSCTSVyQ3qTI7gov4WehwjaMOkWj8Hrlw6w=;
        fh=U/0C24lFKzzomuy67bTtM+LZKjwyWOJtFrkAZXiyaww=;
        b=HwiI1pq5cmnN806PRpN6R/x2RkX66TMSP8ohO1nDkV4Q86oeRmkIw18EOEx6TL/zRs
         Jf2qrDsdvMS8aIkpq88EwcdouXZvnSiYP35ZT1vX4MpYgTAdREKfoNnOdvoAoVjILMU8
         0U90EFGwMnk+7jSK951QMJDoISRW0o0Y5Jyejl5nPRk2c8oow0wnK3r1EWTkNE40/zI/
         yhmmAK10acm9WcQnKrJilN2WhbvBMda4wQOsWt8m9IX9HZ7Q9vFUFci52nlTK4L7uwl2
         tX3ss+GacoLTdpnbb7M2Vu7u3ugZ3AOsSEbitlpv89v5HqrHuzhhXlHzw+U5tfxciNws
         0PIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020a05622a134900b00403e963cbdcsi2087688qtk.169.2023.09.01.02.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qc0fr-0001Wt-1h; Fri, 01 Sep 2023 05:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fo-0001TW-Pg; Fri, 01 Sep 2023 05:42:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fa-0002pI-KP; Fri, 01 Sep 2023 05:42:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3K2GJtz4wy6;
 Fri,  1 Sep 2023 19:42:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3J0MPmz4wxW;
 Fri,  1 Sep 2023 19:42:19 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/26] aspeed queue
Date: Fri,  1 Sep 2023 11:41:48 +0200
Message-ID: <20230901094214.296918-1-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: yIgf5YpBsvho

The following changes since commit 17780edd81d27fcfdb7a802efc870a99788bd2fc:

  Merge tag 'quick-fix-pull-request' of https://gitlab.com/bsdimp/qemu into staging (2023-08-31 10:06:29 -0400)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20230901

for you to fetch changes up to c3287c0f70dae07dd12322c5c8663f7b878826e7:

  hw/sd: Introduce a "sd-card" SPI variant model (2023-09-01 11:40:04 +0200)

----------------------------------------------------------------
aspeed queue:

* Fixes for the Aspeed I2C model
* New SDK image for avocado tests
* blockdev support for flash device definition
* SD refactoring preparing ground for eMMC support

----------------------------------------------------------------
Cédric Le Goater (10):
      aspeed: Introduce helper for 32-bit hosts limitation
      tests/avocado/machine_aspeed.py: Update SDK images
      hw/ssi: Add a "cs" property to SSIPeripheral
      hw/ssi: Introduce a ssi_get_cs() helper
      aspeed/smc: Wire CS lines at reset
      hw/ssi: Check for duplicate CS indexes
      aspeed: Create flash devices only when defaults are enabled
      m25p80: Introduce an helper to retrieve the BlockBackend of a device
      aspeed: Get the BlockBackend of FMC0 from the flash device
      hw/sd: Introduce a "sd-card" SPI variant model

Hang Yu (3):
      hw/i2c/aspeed: Fix Tx count and Rx size error in buffer pool mode
      hw/i2c/aspeed: Fix TXBUF transmission start position error
      hw/i2c/aspeed: Add support for buffer organization

Joel Stanley (1):
      hw/sd: Add sd_cmd_SEND_TUNING_BLOCK() handler

Philippe Mathieu-Daudé (12):
      hw/sd/sdcard: Return ILLEGAL for CMD19/CMD23 prior SD spec v3.01
      hw/sd: When card is in wrong state, log which state it is
      hw/sd: When card is in wrong state, log which spec version is used
      hw/sd: Move proto_name to SDProto structure
      hw/sd: Introduce sd_cmd_handler type
      hw/sd: Add sd_cmd_illegal() handler
      hw/sd: Add sd_cmd_unimplemented() handler
      hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
      hw/sd: Add sd_cmd_SEND_OP_CMD() handler
      hw/sd: Add sd_cmd_ALL_SEND_CID() handler
      hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler
      hw/sd: Add sd_cmd_SET_BLOCK_COUNT() handler

 docs/system/arm/aspeed.rst          |  35 +++-
 include/hw/block/flash.h            |   4 +
 include/hw/i2c/aspeed_i2c.h         |   5 +-
 include/hw/sd/sd.h                  |   5 +
 include/hw/ssi/ssi.h                |   5 +
 hw/arm/aspeed.c                     |  40 ++---
 hw/arm/stellaris.c                  |   7 +-
 hw/arm/xilinx_zynq.c                |   1 +
 hw/arm/xlnx-versal-virt.c           |   1 +
 hw/arm/xlnx-zcu102.c                |   2 +
 hw/block/m25p80.c                   |   6 +
 hw/i2c/aspeed_i2c.c                 |  40 ++---
 hw/microblaze/petalogix_ml605_mmu.c |   1 +
 hw/riscv/sifive_u.c                 |   3 +-
 hw/sd/sd.c                          | 348 ++++++++++++++++++++++--------------
 hw/sd/sdmmc-internal.c              |   2 +-
 hw/ssi/aspeed_smc.c                 |   8 +
 hw/ssi/ssi.c                        |  43 +++++
 tests/avocado/machine_aspeed.py     |  12 +-
 19 files changed, 367 insertions(+), 201 deletions(-)
