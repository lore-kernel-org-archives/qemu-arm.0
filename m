Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064026dyc;
        Fri, 4 Jul 2025 01:37:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW21PSM38vL0qmFfLbLxrnbkkuiBZp2bnvlaxtq/+OkxOJ1DyuUIHzplArt5wtilZCwLIDzipEsC34eXw==@linaro.org
X-Google-Smtp-Source: AGHT+IGZQYNIFgtYeDI24bEwyO7jVqIM+dxAUOnKwwfrlwS6CopP4apMKS5M5b9xMKq0KPqmWNzv
X-Received: by 2002:a05:620a:1a9f:b0:7d5:d3b0:6d48 with SMTP id af79cd13be357-7d5ddad7b64mr218346085a.22.1751618273523;
        Fri, 04 Jul 2025 01:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618273; cv=none;
        d=google.com; s=arc-20240605;
        b=ciu0PPORSgcD7j0KrA9E1cGBDMl3Msk0rZgnidjlyvyKfDVMr1hhMY4SPDuaUsRQGc
         O01T/fWPd4d8s16CSo0agLJVMstdXRuoWfJfhuGl67LuhxO0Wqie1MZ8FN3wIiddIBPC
         ad0r0iOKTp2NELw0G+DQgzOt8Rd1mZUQZhZ50atdU8AnE4YCYwr3S0hVOtKI7+QKGNsS
         bRr3SqQDcFddl1aM609OUwP6mLePLhLKP/cQUJHt4GDDQ4wPAoo2Ebz5P8e3sPtbncrP
         UD8kcpqFqJgq5/Tn1GBqDFKvI4ZJPTL/U+OpmG+FvQWC/YxiR3XY9Pmgx0hO3snlpz6r
         2Fxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yxaQ+EcmWinLO/Ba1OIN+3Db80U4EeXXX7CeZzYnTRc=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=HUX5WdsRrrUzbp4TXPmWRN7dUXUGt1raryNBTMybmlvyXaD1cDhrvRJUzHA4jsSwMm
         aSNcMaHBk2Ar/Ry4QW7TsqafD3A2JVgcK/4YMnfME0hekoVdj1XegKSo6LuC8e8ZE9uB
         GhHQRitjATuuWS7r2ihpmfC1WzvRb9W7fGbUOTp04XShm0fCrOfKJsRCZWkparEMJBJu
         oSokn+ePRSJN/+XPDVTnZu+j/UgEb0ZxXll+cbuW1b8kNKE7CXF2QwwSnlX2GRaFylun
         Unq6xBkF8dK6EVcca6dctjAcLqb0Ej6TqnYLPFQVRKaEtQyMhCVHwLlJO5+vV81/GlhG
         uajQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gyoP7lyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbdca2acsi163628985a.40.2025.07.04.01.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:37:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gyoP7lyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXbvM-0006VW-GR; Fri, 04 Jul 2025 04:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvL-0006V2-0S
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvI-0004Jy-6M
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yxaQ+EcmWinLO/Ba1OIN+3Db80U4EeXXX7CeZzYnTRc=;
 b=gyoP7lybkRoJVrmnbVL5Woow9dIFv+1BIzMqf8+/6EDSIkmJTxJBo9nl18fIhIfHTQE5sR
 PIGFPWoXN1T8L4UV0NMaN+qgV8/5sbRVtK4qNvxTMMuMOcIYkZ68rPAupiudGV7pkED4Pb
 qH5AAUjuVaxqB+jbK1P2sP0GpW97po8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-JxGyCDwIOx2sGYpCoJzwHA-1; Fri,
 04 Jul 2025 04:37:28 -0400
X-MC-Unique: JxGyCDwIOx2sGYpCoJzwHA-1
X-Mimecast-MFC-AGG-ID: JxGyCDwIOx2sGYpCoJzwHA_1751618248
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DC4461954215; Fri,  4 Jul 2025 08:37:27 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 233F8180045B; Fri,  4 Jul 2025 08:37:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/11] aspeed queue
Date: Fri,  4 Jul 2025 10:37:12 +0200
Message-ID: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cgvKrDF0WsAr

The following changes since commit c77283dd5d79149f4e7e9edd00f65416c648ee59:

  Merge tag 'pull-request-2025-07-02' of https://gitlab.com/thuth/qemu into staging (2025-07-03 06:01:41 -0400)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20250704

for you to fetch changes up to 3a34dad2c0d25cebafed40696bbbdeb7ff4b9c7d:

  tests/functional: Add gb200 tests (2025-07-03 17:36:45 +0200)

----------------------------------------------------------------
aspeed queue:

* Improved AST2700 SoC modeling (SDMC, SCU)
* Fixed hardware strapping of 'bletchley-bmc' machine
* Added new Meta 'catalina-bmc' machine and functional test using OpenBMC
* Improved AST2600 SCU protection key modeling
* Introduced AST2600 SCU unit tests
* Deprecated 'ast2700a0-evb' machine
* Added new NVIDIA 'gb200-bmc' machine and functional test using OpenBMC

----------------------------------------------------------------
Ed Tanous (4):
      hw/arm/aspeed: Add second SPI chip to Aspeed model
      docs: add support for gb200-bmc
      hw/arm/aspeed: Add GB200 BMC target
      tests/functional: Add gb200 tests

Jamin Lin (3):
      hw/misc/aspeed_sdmc: Skipping dram_init in u-boot for AST2700
      hw/misc/aspeed_scu: Support the Frequency Counter Control register for AST2700
      aspeed: Deprecate the ast2700a0-evb machine

Patrick Williams (2):
      hw/arm/aspeed: bletchley: update hw strap values
      hw/arm/aspeed: add Catalina machine type

Tan Siewert (2):
      hw/misc/aspeed_scu: Handle AST2600 protection key registers correctly
      tests/qtest: Add test for ASPEED SCU

 docs/about/deprecated.rst                        |   8 +
 docs/system/arm/aspeed.rst                       |   4 +-
 hw/arm/aspeed_eeprom.h                           |   3 +
 include/hw/arm/aspeed.h                          |   2 +
 hw/arm/aspeed.c                                  | 285 ++++++++++++++++++++++-
 hw/arm/aspeed_eeprom.c                           |  21 ++
 hw/misc/aspeed_scu.c                             |  22 +-
 hw/misc/aspeed_sdmc.c                            |   3 +
 tests/qtest/aspeed_scu-test.c                    | 231 ++++++++++++++++++
 hw/arm/Kconfig                                   |   1 +
 tests/functional/aspeed.py                       |   9 +-
 tests/functional/meson.build                     |   4 +
 tests/functional/test_arm_aspeed_catalina.py     |  25 ++
 tests/functional/test_arm_aspeed_gb200nvl_bmc.py |  26 +++
 tests/qtest/meson.build                          |   1 +
 15 files changed, 636 insertions(+), 9 deletions(-)
 create mode 100644 tests/qtest/aspeed_scu-test.c
 create mode 100755 tests/functional/test_arm_aspeed_catalina.py
 create mode 100644 tests/functional/test_arm_aspeed_gb200nvl_bmc.py

