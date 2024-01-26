Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp877153ejc;
        Fri, 26 Jan 2024 05:33:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6yhuaalXG26i/s+0vmG6KwezfV6xRFF5inDufp9gDS5KxGNovg0nEBZF5nxtB8akSvUzl
X-Received: by 2002:a05:620a:4104:b0:783:d0da:d290 with SMTP id j4-20020a05620a410400b00783d0dad290mr1281770qko.80.1706276016132;
        Fri, 26 Jan 2024 05:33:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706276016; cv=none;
        d=google.com; s=arc-20160816;
        b=ukOgxhAmi0ywy8/+7CPPBqg1HNiJYyOa8lzljwCzH5JeVq2NPUtZKLPLH3W7XKnbes
         5ZWiqo9p5jG0fP1QwNwBdrtDi4sNjiuwbAgSvwUdZFb8CkrGYrc1EsGNfmGuVgSVQ5Ir
         XS/OolPejWwA2GXqStC1KVf/bXFrMtvDdQC+0luTezX2SmZDWAL2v0+Q+nT/OGB/tnmQ
         jCijh3Q2LuGVndEbSvC2BrDLp0P7IikeF+8n1j441mlhLNQPhgVYV0J5lXvPyULBp2lK
         RLIt6yHIophzfT5LtB56v2iDI247sOEyeGU8O1bdkT3gB4LZBqNhqTANHPPxGvzQVQd5
         SgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=5ivVu+qDemquMKRZkyI/8fUs2nf1zlh5//E7nWLRVU0=;
        fh=U/0C24lFKzzomuy67bTtM+LZKjwyWOJtFrkAZXiyaww=;
        b=uXAiUwEFB/XcvxTRx6hdRDyCDCYq0un9p4nBiqzhShENC8aehI4eHyDFW+S58XsuEW
         yUZXDtficlIPiD9R/7n97JdiNyS6uYo1na5LKTo1hFdETHns74eTvAue2pR22uaddtK/
         Izra9uTMlWbgsXE9c8EctSjYcj3sZHKch/dSd59pm5oqK9sh2WP9YgRtFYxuJDUz8cTg
         07R3Ue2+S8sjeRlIL7TmJtm6Yd5Vu6LLUMF0xympCRs3XlQt7+oRFXeYEhlJZr/o3sUf
         76D6WIRhemwPkrnVNj1iUhyQoKozIiqGq8GZLDJkY+QQkRHzo56TTUogPC4xBc50wUbq
         cjYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qp3-20020a05620a388300b00783587fc53csi1280296qkn.484.2024.01.26.05.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:33:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTMJy-0002rS-TC; Fri, 26 Jan 2024 08:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMJu-0002Xg-2R; Fri, 26 Jan 2024 08:32:34 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMJr-0007wu-Cm; Fri, 26 Jan 2024 08:32:33 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLzBx2XL4z4wc3;
 Sat, 27 Jan 2024 00:32:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLzBw0bzVz4wbp;
 Sat, 27 Jan 2024 00:32:23 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/17] aspeed queue
Date: Fri, 26 Jan 2024 14:31:59 +0100
Message-ID: <20240126133217.996306-1-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Mffx9+83WX6M

The following changes since commit e029fe22caad9b75c7ab69bd4e84853c11fb71e0:

  Merge tag 'pull-qapi-2024-01-26' of https://repo.or.cz/qemu/armbru into staging (2024-01-26 10:21:27 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20240126

for you to fetch changes up to b40769f4b49d15485ffaaa7acade3e3593ee6daa:

  hw/fsi: Update MAINTAINER list (2024-01-26 14:22:08 +0100)

----------------------------------------------------------------
aspeed queue:

* Update of buildroot images to 2023.11 (6.6.3 kernel)
* Check of the valid CPU type supported by aspeed machines
* Simplified models for the IBM's FSI bus and the Aspeed
  controller bridge

----------------------------------------------------------------
Cédric Le Goater (1):
      tests/avocado/machine_aspeed.py: Update buildroot images to 2023.11

Ninad Palsule (11):
      hw/fsi: Introduce IBM's Local bus
      hw/fsi: Introduce IBM's scratchpad device
      hw/fsi: Introduce IBM's FSI Bus
      hw/fsi: Introduce IBM's fsi-slave model
      hw/fsi: Introduce IBM's cfam
      hw/fsi: Introduce IBM's FSI master
      hw/fsi: Aspeed APB2OPB & On-chip peripheral bus
      hw/arm: Hook up FSI module in AST2600
      hw/fsi: Added qtest
      hw/fsi: Added FSI documentation
      hw/fsi: Update MAINTAINER list

Philippe Mathieu-Daudé (5):
      hw/arm/aspeed: Remove dead code
      hw/arm/aspeed: Set default CPU count using aspeed_soc_num_cpus()
      hw/arm/aspeed: Init CPU defaults in a common helper
      hw/arm/aspeed: Introduce aspeed_soc_cpu_type() helper
      hw/arm/aspeed: Check for CPU types in machine_run_board_init()

 MAINTAINERS                     |   9 ++
 docs/specs/fsi.rst              | 122 +++++++++++++++
 docs/specs/index.rst            |   1 +
 meson.build                     |   1 +
 hw/fsi/trace.h                  |   1 +
 include/hw/arm/aspeed_soc.h     |   8 +-
 include/hw/fsi/aspeed_apb2opb.h |  46 ++++++
 include/hw/fsi/cfam.h           |  34 +++++
 include/hw/fsi/fsi-master.h     |  32 ++++
 include/hw/fsi/fsi.h            |  37 +++++
 include/hw/fsi/lbus.h           |  43 ++++++
 hw/arm/aspeed.c                 |  70 ++++-----
 hw/arm/aspeed_ast10x0.c         |   8 +-
 hw/arm/aspeed_ast2400.c         |  15 +-
 hw/arm/aspeed_ast2600.c         |  28 +++-
 hw/arm/aspeed_soc_common.c      |   8 +
 hw/fsi/aspeed_apb2opb.c         | 329 ++++++++++++++++++++++++++++++++++++++++
 hw/fsi/cfam.c                   | 168 ++++++++++++++++++++
 hw/fsi/fsi-master.c             | 170 +++++++++++++++++++++
 hw/fsi/fsi.c                    | 102 +++++++++++++
 hw/fsi/lbus.c                   | 117 ++++++++++++++
 tests/qtest/aspeed-fsi-test.c   | 205 +++++++++++++++++++++++++
 hw/Kconfig                      |   1 +
 hw/arm/Kconfig                  |   1 +
 hw/fsi/Kconfig                  |   7 +
 hw/fsi/meson.build              |   2 +
 hw/fsi/trace-events             |  13 ++
 hw/meson.build                  |   1 +
 tests/avocado/machine_aspeed.py |  18 +--
 tests/qtest/meson.build         |   1 +
 30 files changed, 1540 insertions(+), 58 deletions(-)
 create mode 100644 docs/specs/fsi.rst
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/aspeed_apb2opb.h
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 include/hw/fsi/fsi-master.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 hw/fsi/aspeed_apb2opb.c
 create mode 100644 hw/fsi/cfam.c
 create mode 100644 hw/fsi/fsi-master.c
 create mode 100644 hw/fsi/fsi.c
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 tests/qtest/aspeed-fsi-test.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/trace-events
