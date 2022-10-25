Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4200207ejn;
        Tue, 25 Oct 2022 08:30:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5jpvcLp2MUCJhRI96/IwpPIzVBic1zWal1hJFmScEUUq9GLH9LqRkWjF/Q5Qk9R3dQZafB
X-Received: by 2002:a05:622a:1016:b0:39c:e3d2:735e with SMTP id d22-20020a05622a101600b0039ce3d2735emr31622624qte.114.1666711812408;
        Tue, 25 Oct 2022 08:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711812; cv=none;
        d=google.com; s=arc-20160816;
        b=xaE4fcXUI8snka7qHrxO6Fkl6iedG660apL5kYdgLcwUutr6JT8h4ccY5l3xSHaROY
         xzVQDHGJE+gf+5IhWn1lqyvOXpzGER8uGDNJsMBtk8N7dTgW21nb1kk+n/0vYPUse/0W
         xhT4+SBOhbxttbNMkrur3GYfk9O13VD0Jc4b3mWfL7VJ8lTCk/RbKp8GYjerG9bRO2G4
         LiBJ0N89vnk3ZOO6QvVPq0fmEGc2RTAc4O1F1hi/1A56JW3FoamnnAmjKG8KqAfW085p
         mAjGS2SbAZlGGyvUpa82hGJIog/+7wICHMyIJYHQ9UJphRMCvZnEU7bw6CDmU/swbVWs
         hk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=Y4t3HivOMLSrUS/KQhctHBTxg6p02CnerGkvilkVxl4=;
        b=upIf/IkuiR5RFTV8DIMwpHhhYZVEeGa2AcwtA/W1hp892cNCoA+IOWYe4Y/RUxRqRq
         yNPF+jmzEy8aedFiNEoOBUnpm8z22SSFOVyExLqyv4tgg69IE5rvcmLG/DzrIB0eYk15
         WXQ0FRDScH+OJyyprBveyoLd5ujk56ZrOwOESZCQHoZ9ntRi48osfNRKyoiMAHqT6bgw
         WHalcapgPXnhvAEsbwGj+u1HmbGLmYOlKk0YptdHBcAz1WqaS56nerzTEOfJhWlzvj/B
         mjhEs1AIl0G/63q6j1jH/qtpv2ZHp+9VPKgM4IAhZ3f11AlT5BCy0W5XqoLCPnl4CU/w
         +tgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm10-20020ad45eca000000b004738a5034c5si2048824qvb.528.2022.10.25.08.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLjt-0006fL-Rx; Tue, 25 Oct 2022 11:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLjm-0006M8-TU; Tue, 25 Oct 2022 11:21:07 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLji-0004jo-G0; Tue, 25 Oct 2022 11:21:06 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbHR21xxz4xGk;
 Wed, 26 Oct 2022 02:20:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbHN4rcXz4x1F;
 Wed, 26 Oct 2022 02:20:48 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/16] aspeed queue
Date: Tue, 25 Oct 2022 17:20:26 +0200
Message-Id: <20221025152042.278287-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WCsubDmv/41t

The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:

  Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20221025

for you to fetch changes up to 703229132bb05327044368fc6d19f6acf7dde848:

  arm/aspeed: Replace mx25l25635e chip model (2022-10-24 11:20:16 +0200)

----------------------------------------------------------------
aspeed queue :

* Performance improvement with Object class caching
* Serial Flash Discovery Parameters support for m25p80 device
* Various small adjustments on intructions and models

----------------------------------------------------------------
Alex Bennée (1):
      ssi: cache SSIPeripheralClass to avoid GET_CLASS()

Cédric Le Goater (12):
      tests/avocado/machine_aspeed.py: Fix typos on buildroot
      aspeed/smc: Cache AspeedSMCClass
      ast2600: Drop NEON from the CPU features
      m25p80: Add basic support for the SFDP command
      m25p80: Add the n25q256a SFDP table
      m25p80: Add erase size for mx25l25635e
      m25p80: Add the mx25l25635e SFPD table
      m25p80: Add the mx25l25635f SFPD table
      m25p80: Add the mx66l1g45g SFDP table
      m25p80: Add the w25q256 SFPD table
      m25p80: Add the w25q512jv SFPD table
      arm/aspeed: Replace mx25l25635e chip model

Patrick Williams (2):
      hw/arm/aspeed: increase Bletchley memory size
      m25p80: Add the w25q01jvq SFPD table

Peter Delevoryas (1):
      hw/i2c/aspeed: Fix old reg slave receive

 hw/block/m25p80_sfdp.h          |  29 ++++
 include/hw/i2c/aspeed_i2c.h     |   1 +
 include/hw/ssi/aspeed_smc.h     |   2 +
 include/hw/ssi/ssi.h            |   3 +
 hw/arm/aspeed.c                 |  15 +-
 hw/arm/aspeed_ast2600.c         |   2 +
 hw/block/m25p80.c               |  52 ++++++-
 hw/block/m25p80_sfdp.c          | 332 ++++++++++++++++++++++++++++++++++++++++
 hw/i2c/aspeed_i2c.c             |   8 +-
 hw/ssi/aspeed_smc.c             |   9 +-
 hw/ssi/ssi.c                    |  18 +--
 MAINTAINERS                     |   2 +-
 hw/block/meson.build            |   1 +
 hw/block/trace-events           |   1 +
 tests/avocado/machine_aspeed.py |  16 +-
 15 files changed, 452 insertions(+), 39 deletions(-)
 create mode 100644 hw/block/m25p80_sfdp.h
 create mode 100644 hw/block/m25p80_sfdp.c
