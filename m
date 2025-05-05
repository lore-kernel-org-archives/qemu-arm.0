Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2304743njj;
        Mon, 5 May 2025 02:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrhN1bEr3f9zTCLu/gLCiyL9ys0vElgvP+kPOLDWikyxn7IY0Gln28C5dPrZPe4sGQ59NBcfx72hLi4g==@linaro.org
X-Google-Smtp-Source: AGHT+IHbcLDDnaumAk2qSE9aCuvdokPFctzSIyGU+WQ3rKHzIbA5/s1WwogFtbK3m/rMeauN79TN
X-Received: by 2002:a05:6000:4313:b0:397:3900:ef80 with SMTP id ffacd0b85a97d-3a09fd7aaedmr4572255f8f.22.1746436034750;
        Mon, 05 May 2025 02:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436034; cv=none;
        d=google.com; s=arc-20240605;
        b=ZV0N4UxVjiSOVyGDltHngctnOlqlbGUyOjUvfGhragEwopssOsyuUs+PNqg2MVB/YF
         VT3IJwaVgQ8rojUy/ZyDq89maDMmQdK4VKusUb3nj+8l6WgXdefVlsTyYvgI1/4XPPX7
         6QaPNwzL9/NVyhLB6k6YtGMSaVePRkhm4MRND/7UiKCkb7/4invWDlbXJXDVUHc0kT7w
         Ytl57hr5IcPfHTL8ZOy/WE+68/NVgZOh4UkEvi8Dwnv493hGBvHRpr6eHb1xIMA6Qit6
         dlPfchqdAazACGjfp9ZjoWC4rwgtCMyQR+a41RTvRP6GM2Ecio91szQnFESLddrv20V/
         yFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=VCWvBzr0qKl7YiCXoP9jLX4Trdzp/81+Yq7mX33KfDo=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=Oq/unmNlhGz7xNCf6QG/z5Agj3bMV0M2NNfzANpwftKJs4G0M9MurwBLU8TLtHvn3M
         ShH3CTBku+p7gqncM4U7nc2ePfMvUWyRolAERRM3Lq+3KBMB4mqr+2JNlzMY9boIg+S6
         5IqY3OWgp0hlrnyQmgLmZJZBg7I+pipDnoCjwHHtSeKR/lqxRaU7bkhigRsXVyFNjPTd
         FentUdUqLVuq4hWMG+AgAMzoF2V/Kzrbcrc9yelb8mv723zu6a3Fla9z2iHAbJDi3H/d
         I9jEDoxJq2sOHNX//ByeZDskrqndGDzBuFG0K0TUjnO9jnbc7tH5ndENcYN45pXHhDhI
         Y7Lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hrdm2ubV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b00e42si5014361f8f.591.2025.05.05.02.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hrdm2ubV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrmy-0006K6-FR; Mon, 05 May 2025 05:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrmj-0005vL-BQ
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:06:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrmg-0006BM-V7
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VCWvBzr0qKl7YiCXoP9jLX4Trdzp/81+Yq7mX33KfDo=;
 b=Hrdm2ubV5Jd4pt8hdjJX4am6fxDajNV01aoB0TPvXYbMpojOBKS5pK3CRrbrju0v7Cbh5T
 OwMxsOcWRX9NRz3A8SB5YnOymuck8pfO3AjCTa5RPUEWt8dnymjNxuxbhOvtJYsAzSgDAa
 q7yzg+iPCOyTxvnNovFfHOUfn9LqINo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-g9Y4MgxfPM2cwPZoXfkjwQ-1; Mon,
 05 May 2025 05:06:41 -0400
X-MC-Unique: g9Y4MgxfPM2cwPZoXfkjwQ-1
X-Mimecast-MFC-AGG-ID: g9Y4MgxfPM2cwPZoXfkjwQ_1746436000
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1194B1800992; Mon,  5 May 2025 09:06:40 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6366C30001A2; Mon,  5 May 2025 09:06:38 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/23] aspeed queue
Date: Mon,  5 May 2025 11:06:12 +0200
Message-ID: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 302BRxbIqwu6

The following changes since commit e578dcc7e1590b20a84036afe5bdfa8d23a6048e:

  pc-bios: Add AST27x0 vBootrom (2025-05-02 09:47:14 +0200)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20250505

for you to fetch changes up to f32ef57f7de98ec36da52b0a13bd5d18ac4bd583:

  docs: Add support for ast2700fc machine (2025-05-05 09:42:16 +0200)

----------------------------------------------------------------
aspeed queue:

* Fixed AST2700 SPI model issues
* Updated SDK images
* Added FW support to the AST2700 EVB machines
* Introduced an AST27x0 multi-SoC machine

----------------------------------------------------------------
Jamin Lin (12):
      tests/functional/aspeed: Update test ASPEED SDK v09.06 for AST2500
      tests/functional/aspeed: Update test ASPEED SDK v09.06 for AST2600
      tests/functional/aspeed: Update test ASPEED SDK v03.00 for AST1030
      hw/arm/aspeed_ast27x0: Rename variable sram_name to name in ast2700 realize
      tests/functional/aspeed: Move I2C test into shared helper for AST2700 reuse
      tests/functional/aspeed: Update test ASPEED SDK v09.06
      tests/functional/aspeed: extract boot and login sequence into helper function
      hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
      hw/arm/aspeed: Add support for loading vbootrom image via "-bios"
      tests/functional/aspeed: Add to test vbootrom for AST2700
      docs/system/arm/aspeed: move AST2700 content to new section
      docs/system/arm/aspeed: Support vbootrom for AST2700

Joe Komlodi (1):
      hw/ssi/aspeed_smc: Allow 64-bit wide flash accesses

Steven Lee (9):
      aspeed: ast27x0: Map unimplemented devices in SoC memory
      aspeed: ast27x0: Correct hex notation for device addresses
      hw/intc/aspeed: Add support for AST2700 SSP INTC
      hw/intc/aspeed: Add support for AST2700 TSP INTC
      hw/arm/aspeed_ast27x0-ssp: Introduce AST27x0 A1 SSP SoC
      hw/arm/aspeed_ast27x0-tsp: Introduce AST27x0 A1 TSP SoC
      hw/arm: Introduce ASPEED AST2700 A1 full core machine
      tests/function/aspeed: Add functional test for ast2700fc
      docs: Add support for ast2700fc machine

Troy Lee (1):
      hw/arm: ast27x0: Wire up EHCI controllers

 docs/system/arm/aspeed.rst                         | 164 +++++++-
 include/hw/arm/aspeed.h                            |   1 +
 include/hw/arm/aspeed_soc.h                        |  38 +-
 include/hw/intc/aspeed_intc.h                      |   5 +
 hw/arm/aspeed.c                                    |  36 ++
 hw/arm/aspeed_ast27x0-fc.c                         | 192 ++++++++++
 hw/arm/aspeed_ast27x0-ssp.c                        | 294 +++++++++++++++
 hw/arm/aspeed_ast27x0-tsp.c                        | 294 +++++++++++++++
 hw/arm/aspeed_ast27x0.c                            | 125 +++++--
 hw/intc/aspeed_intc.c                              | 416 +++++++++++++++++++++
 hw/ssi/aspeed_smc.c                                |   4 +-
 hw/arm/meson.build                                 |   6 +-
 tests/functional/meson.build                       |   6 +-
 ...64_aspeed.py => test_aarch64_aspeed_ast2700.py} |  82 ++--
 tests/functional/test_aarch64_aspeed_ast2700fc.py  | 135 +++++++
 tests/functional/test_arm_aspeed_ast1030.py        |  10 +-
 tests/functional/test_arm_aspeed_ast2500.py        |   8 +-
 tests/functional/test_arm_aspeed_ast2600.py        |  15 +-
 18 files changed, 1749 insertions(+), 82 deletions(-)
 create mode 100644 hw/arm/aspeed_ast27x0-fc.c
 create mode 100644 hw/arm/aspeed_ast27x0-ssp.c
 create mode 100644 hw/arm/aspeed_ast27x0-tsp.c
 rename tests/functional/{test_aarch64_aspeed.py => test_aarch64_aspeed_ast2700.py} (64%)
 create mode 100755 tests/functional/test_aarch64_aspeed_ast2700fc.py

