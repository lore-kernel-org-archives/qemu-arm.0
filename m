Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2318798njk;
        Mon, 27 Jan 2025 01:43:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXG2pzXzoGVcloUs9k+2PvbwGwE34awUKhMz3h9vw8cOv4lcxJLLmmCAFJSn5ADriODslMRZS/ZBvRGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEE7Ew1XPSphGZZ2LWqqYt6EIwN7KyhyP1bcIfGQmG/e3NY32rwwLh3H2tAfdZWm9T02Sno
X-Received: by 2002:a05:622a:354:b0:467:5587:7c9a with SMTP id d75a77b69052e-46e12b7f5e9mr646118011cf.41.1737970994029;
        Mon, 27 Jan 2025 01:43:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737970994; cv=none;
        d=google.com; s=arc-20240605;
        b=BDXG22H0H4IKrN0yYm6jvE15XzSLwl1kFNh9CSeMIE67H2Pa0JGBXdRarSZN1D3cL8
         Ls87C5Y/8QK5lwxK+q25PZTaWTn84sCYKODiWRg2uOWDCN49jHhvvN4kkw6NBXqtd3ma
         0DE97FPoCmx+Pu420oI/7IEPYlDvSgOCRP3bRSGnEUWsu1nlKCe7SQB1w3BHIeMUdr2h
         WYWK4yY1/6FQedzTJl777t5yDDemsqriaN98o0cTF0kl5NqYCEGO6axp0eYj+Rk2dacx
         sch8t/dqzR9cKOoP6rL0T9Kf+h5YzIxWk0AvIYA0UJGZFyIO5zT+ZRStoAtuRICeacY2
         a4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3uGmDiR8fg8DQdIQ7c/BFdCQ7aKzlzLCwkOx8syialo=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=ASfWes6apxNAr0b3Gc16tRK1hQytTu3rL9jxDiGuPsgZ9ewuJoNWC6e7Qb67tSrYWe
         tTti2Mm38pOg3H2LKOeM1kpZfQTtJYDFXRilt9NgaCt7yHTMU1FyzL4RrWy4ie/hn+c4
         uZsBGlXwcXpW1tGLnHXNLEIOYH5rhZKf2rpMBo5sV8dbFAVn7b3K4Rp+MXRWSgkvxGYQ
         Dpe2+8HoQJcrj2ietn0OzFHnTNYkwUNmW63USLXPzrEtQ4BAmGEE+R2VNo9Xrw59aymU
         JtVYBAMypFtkMn7G2ksN/04k+cVLqOS9S+dmzf9xZ76Q1Uc4Ibs5h1nvum3DPfey8zBY
         Q8Gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SNceyzvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba5b29si99362031cf.495.2025.01.27.01.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:43:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SNceyzvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcLdv-00069z-Si; Mon, 27 Jan 2025 04:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLdu-00069Y-8b
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:42:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLds-0005PM-5I
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3uGmDiR8fg8DQdIQ7c/BFdCQ7aKzlzLCwkOx8syialo=;
 b=SNceyzvGa3OOoWcmT51qWUV9USeaxlej/3STdCMAIgMzOvdNOuT/GHge2zDx3DhSyCciqo
 FypHUgmOIUIF0EMXDzh6Z+2GuutlmZ0Wr+7uyytSDYnHdMA9mCMb/yimEoqXNHDcsoxfoU
 LUD3crl36t/NpbCT9R++tWQAkwgaHHM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-WgWW20FGNhChGXzAS-cOmQ-1; Mon,
 27 Jan 2025 04:42:47 -0500
X-MC-Unique: WgWW20FGNhChGXzAS-cOmQ-1
X-Mimecast-MFC-AGG-ID: WgWW20FGNhChGXzAS-cOmQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C62671801F1F; Mon, 27 Jan 2025 09:42:46 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2C09718008C0; Mon, 27 Jan 2025 09:42:44 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/12] aspeed queue
Date: Mon, 27 Jan 2025 10:42:27 +0100
Message-ID: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xbu8p23QPJht

The following changes since commit ed734377ab3f3f3cc15d7aa301a87ab6370f2eed:

  Merge tag 'linux-user-fix-gupnp-pull-request' of https://github.com/hdeller/qemu-hppa into staging (2025-01-24 14:43:07 -0500)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20250127

for you to fetch changes up to 8b7ccc6ad10cd4a107b4627e9a5606d757607ff2:

  docs/system/arm/aspeed: Remove tacoma-bmc from the documentation (2025-01-27 09:38:15 +0100)

----------------------------------------------------------------
aspeed queue:

* Fixed serial definitions on the command line
* Fixed sdhci write protected pin on AST2600 EVB machine
* Added timer support on AST2700 SoC
* Updated buildroot and SDK images of functional tests
* Removed sd devices creation when -nodefaults is used
* Added software reset mode support on AST2600 SoC

----------------------------------------------------------------
Cédric Le Goater (3):
      test/functional: Update the Aspeed aarch64 test
      test/functional: Update buildroot images to 2024.11
      aspeed: Create sd devices only when defaults are enabled

Jamin Lin (7):
      hw/sd/sdhci: Introduce a new Write Protected pin inverted property
      hw/arm/aspeed: Invert sdhci write protected pin for AST2600 EVB
      hw/timer/aspeed: Refactor Timer Callbacks for SoC-Specific Implementations
      hw/timer/aspeed: Add AST2700 Support
      aspeed/soc: Support Timer for AST2700
      aspeed/wdt: Fix coding style
      aspeed/wdt: Support software reset mode for AST2600

Kenneth Jia (1):
      hw/arm/aspeed: fix connect_serial_hds_to_uarts

Thomas Huth (1):
      docs/system/arm/aspeed: Remove tacoma-bmc from the documentation

 docs/system/arm/aspeed.rst                  |   4 +-
 include/hw/arm/aspeed.h                     |   1 +
 include/hw/sd/sdhci.h                       |   5 +
 include/hw/timer/aspeed_timer.h             |   1 +
 hw/arm/aspeed.c                             |  15 +-
 hw/arm/aspeed_ast27x0.c                     |  17 ++
 hw/sd/sdhci.c                               |   6 +
 hw/timer/aspeed_timer.c                     | 263 ++++++++++++++++++++++++++--
 hw/watchdog/wdt_aspeed.c                    |  19 +-
 hw/timer/trace-events                       |   2 +-
 tests/functional/aspeed.py                  |   2 +-
 tests/functional/test_aarch64_aspeed.py     |  10 +-
 tests/functional/test_arm_aspeed_ast2500.py |   8 +-
 tests/functional/test_arm_aspeed_ast2600.py |   8 +-
 14 files changed, 323 insertions(+), 38 deletions(-)

