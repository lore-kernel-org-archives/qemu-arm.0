Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF285CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 12:22:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHKTI-0004sn-VO; Thu, 15 Oct 2026 08:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1xHKTG-0004oF-12
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1xHKTD-0005Wy-UW
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792066923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S2IP2aqQQDJyWi3NypjJ8FuJbHaWcBgOlMXPHlKNPiU=;
 b=B2ir7MiO3FANT0zGmNVGZNrT2sMNchQ78ND7yKsO0tAj86C18WvvInqDpO4w4E8oIH0N4D
 QFI65k2R1XOe8IygTBgQZDk4D4Exu250u2FGAQmeYpWeWdlCTPc8ed2vYWOj58bCHEEAnq
 MmlGjZj2GIxtJAgMm2FvjOh00LtVGJA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-1kkW3j4lOve2gFiIuxjvXA-1; Thu,
 15 Oct 2026 12:21:55 +0000
X-MC-Unique: 1kkW3j4lOve2gFiIuxjvXA-1
X-Mimecast-MFC-AGG-ID: 1kkW3j4lOve2gFiIuxjvXA_1792066914
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8DCF91800755; Thu, 15 Oct 2026 12:21:54 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.48.67])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2A3FC7D5; Thu, 15 Oct 2026 12:21:52 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/21] aspeed queue
Date: Thu, 15 Oct 2026 14:21:30 +0200
Message-ID: <20261015122151.889017-1-clg@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: rFQSpBPyp8SqujCF_-HARMQupODyl7hWMlRNK5lRTvg_1792066914
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The following changes since commit d5b5083cb783c447001e862c2b525e59f48ad78c:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2026-10-15 11:53:41 +0200)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20261015

for you to fetch changes up to 4cf1f0e37d9491eb8b0c8be8dd9dab9260b8fa36:

  tests/functional: give the set_machine probe VM the test workdir (2026-10-15 13:14:09 +0200)

----------------------------------------------------------------
aspeed queue:

* Fix OOB read in HACE has_padding() when padding_size is zero
* Allocate ACRY RSA qtest SRAM buffers on the heap to reduce stack usage
* Consolidate OTP layout definitions between aspeed_otp and aspeed_sbc
* Derive ABR and secure boot state from OTP config straps, removing
  the "emmc-abr" and "signing-settings" machine properties
* Sort device IDs alphabetically
* Add I2C test for IO expander 1 on the AST2700A2
* Update ASPEED BMCs reviewer list
* Add a create_unimplemented_devices() helper and convert all Aspeed
  SoCs and coprocessors to table-driven unimplemented devices
* Fix the set_machine probe VM to use the test workdir

----------------------------------------------------------------
Cédric Le Goater (1):
      hw/misc/aspeed_hace: Fix OOB read in has_padding()

Emmanuel Blot (1):
      tests/functional: give the set_machine probe VM the test workdir

Jamin Lin (16):
      tests/qtest/aspeed-acry: Allocate SRAM buffers on the heap
      hw/arm/aspeed: Sort device IDs alphabetically
      tests/functional/aarch64/test_aspeed_ast2700a2: Add I2C test for IO expander 1
      MAINTAINERS: Update ASPEED BMCs reviewers
      hw/misc/unimp: Add create_unimplemented_devices() helper
      hw/arm/aspeed_ast2400: Use a table for unimplemented devices
      hw/arm/aspeed_ast2600: Use a table for unimplemented devices
      hw/arm/aspeed_ast27x0: Use a table for unimplemented devices
      hw/arm/aspeed_ast10x0: Use a table for unimplemented devices
      hw/arm/aspeed_ast1040: Use a table for unimplemented devices
      hw/arm/aspeed: Remove unused unimplemented device fields
      hw/arm/aspeed_ast27x0: Use a table for unimplemented devices for SSP/TSP
      hw/arm/aspeed_coprocessor: Remove unused unimplemented device fields
      hw/arm/aspeed_ast1700: Use a table for unimplemented devices
      hw/arm/aspeed_ast1700: Remove unused unimplemented device field
      hw/arm/aspeed: Remove unused aspeed_mmio_map_unimplemented()

Kane Chen (3):
      hw/nvram/aspeed_otp, hw/misc/aspeed_sbc: Consolidate OTP layout definitions
      hw/misc/aspeed_sbc: Derive ABR state from OTP config straps
      hw/misc/aspeed_sbc: Derive secure boot state from OTP config

 MAINTAINERS                                       |   4 -
 include/hw/arm/aspeed_ast1700.h                   |   2 -
 include/hw/arm/aspeed_coprocessor.h               |   5 +-
 include/hw/arm/aspeed_soc.h                       | 190 ++++++++++------------
 include/hw/misc/aspeed_sbc.h                      |   3 -
 include/hw/misc/unimp.h                           |  21 +++
 include/hw/nvram/aspeed_otp.h                     |  32 ++++
 hw/arm/aspeed_ast1040.c                           |  40 ++---
 hw/arm/aspeed_ast10x0.c                           |  55 ++-----
 hw/arm/aspeed_ast1700.c                           |  21 +--
 hw/arm/aspeed_ast2400.c                           |  25 ++-
 hw/arm/aspeed_ast2600.c                           |  44 ++---
 hw/arm/aspeed_ast27x0-ssp.c                       |  44 ++---
 hw/arm/aspeed_ast27x0-tsp.c                       |  44 ++---
 hw/arm/aspeed_ast27x0.c                           |  41 ++---
 hw/arm/aspeed_soc_common.c                        |  11 --
 hw/misc/aspeed_hace.c                             |   2 +-
 hw/misc/aspeed_sbc.c                              |  97 ++++++-----
 hw/misc/unimp.c                                   |  20 +++
 hw/nvram/aspeed_otp.c                             |  63 +++++++
 tests/qtest/aspeed-acry-test.c                    |   8 +-
 tests/functional/aarch64/test_aspeed_ast2700a2.py |   3 +
 tests/functional/qemu_test/testcase.py            |   2 +-
 23 files changed, 378 insertions(+), 399 deletions(-)


