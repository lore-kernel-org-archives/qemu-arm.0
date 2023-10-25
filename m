Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2592914ejb;
        Wed, 25 Oct 2023 02:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWFrxpPoiDsz9EanS/kt9qx4iBLitLVD5vwssUC/bljnrwTFzh07mLeOpQIO1qModHa7lD
X-Received: by 2002:ac2:4287:0:b0:506:9c0a:17d9 with SMTP id m7-20020ac24287000000b005069c0a17d9mr10855408lfh.40.1698224477948;
        Wed, 25 Oct 2023 02:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698224477; cv=none;
        d=google.com; s=arc-20160816;
        b=IjstKmxxF+7lQke2O8hvO6JT54163iqjwj5N+gs0wxtohOQTg6JQoCwwIhrY2Bbs1D
         7tQfdR4l3Q6KdupqHo82323LC+uFLL65Ij42hzwU5i9ACP5hN0N7rYhmse5197QjJOA+
         tNpzPiKT/KrUvvhnpi4T+OM6u+/Kabi3fVzt7Q6hm9jB4rZpzj2guc0U9ijKxRPM/TB2
         /khwMwmZMiZaX2QXc5q1lT/xCQXWp6pURbVNU4sEY67YhbBGeEEJQJGu32ciz+bK8hiE
         pGvYodRbtOa8ULO0my8zXhJPAPhBRV0m4/G0R04NMMffPSPioUyewzqNy2I6cswrYHQz
         2PLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=pufTsne4izkDfCmeJ8f/v5ZjGxK5rUA95Ohn9mPgAho=;
        fh=U/0C24lFKzzomuy67bTtM+LZKjwyWOJtFrkAZXiyaww=;
        b=T9xDWJT51EvyatRWD8S9PMTDksj+uRLgjR+FiHE0gYsRxeEU3Bp5VTlye6CFm5AkUK
         OkiWJyKL20Ct0n8188bS4SUQDmgTBxscxfPXdK4RUfh0JrLByAQQ57c7j0767lKaWfAj
         spHrzEK+raCwIO6d9eglS98BNe/zRScQHUKxWxc0qmtY/lnQPem+bLoPJrlwvgGjJKur
         Oob6RA7zEjP8/TwtQJrCptkmohNsiMwvYDU4Iv9akSADJGhEAU2EL53FbmeMAA+5MLb6
         7ruJeoqoewWIR/MCXZbIue9ueE2nIbJZ9oGUpSYv4SLpt6xCHxk7fT0MAPWnNAvLWkj+
         QEog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15-20020adff8cf000000b0031989e1535bsi6901501wrq.13.2023.10.25.02.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 02:01:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvZjh-00081c-Qs; Wed, 25 Oct 2023 04:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZjg-000819-2u; Wed, 25 Oct 2023 04:59:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZje-0004Ma-7B; Wed, 25 Oct 2023 04:59:31 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFjXv62CLz4wwG;
 Wed, 25 Oct 2023 19:59:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFjXt4425z4wp0;
 Wed, 25 Oct 2023 19:59:26 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/12] aspeed queue
Date: Wed, 25 Oct 2023 10:59:09 +0200
Message-ID: <20231025085921.733686-1-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: 8aK3i3a3WmKt

The following changes since commit a95260486aa7e78d7c7194eba65cf03311ad94ad:

  Merge tag 'pull-tcg-20231023' of https://gitlab.com/rth7680/qemu into staging (2023-10-23 14:45:46 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20231025

for you to fetch changes up to dd41ce7a6f13ad4f45ebaf52b9fa91fe5fc961df:

  hw/arm/aspeed: Move AspeedSoCState::cpu/vic to Aspeed2400SoCState (2023-10-25 09:52:44 +0200)

----------------------------------------------------------------
aspeed queue:

* Update of Andrew's email
* Split of AspeedSoCState per 2400/2600/10x0

----------------------------------------------------------------
Andrew Jeffery (1):
      MAINTAINERS: aspeed: Update Andrew's email address

Philippe Mathieu-Daudé (11):
      hw/arm/aspeed: Extract code common to all boards to a common file
      hw/arm/aspeed: Rename aspeed_soc_init() as AST2400/2500 specific
      hw/arm/aspeed: Rename aspeed_soc_realize() as AST2400/2500 specific
      hw/arm/aspeed: Dynamically allocate AspeedMachineState::soc field
      hw/arm/aspeed: Introduce TYPE_ASPEED10X0_SOC
      hw/arm/aspeed: Introduce TYPE_ASPEED2600_SOC
      hw/arm/aspeed: Introduce TYPE_ASPEED2400_SOC
      hw/arm/aspeed: Check 'memory' link is set in common aspeed_soc_realize
      hw/arm/aspeed: Move AspeedSoCState::armv7m to Aspeed10x0SoCState
      hw/arm/aspeed: Move AspeedSoCState::a7mpcore to Aspeed2600SoCState
      hw/arm/aspeed: Move AspeedSoCState::cpu/vic to Aspeed2400SoCState

 MAINTAINERS                               |   2 +-
 include/hw/arm/aspeed_soc.h               |  35 +++++-
 hw/arm/aspeed.c                           | 101 +++++++--------
 hw/arm/aspeed_ast10x0.c                   |  53 ++++----
 hw/arm/{aspeed_soc.c => aspeed_ast2400.c} | 197 +++++++-----------------------
 hw/arm/aspeed_ast2600.c                   |  75 ++++++------
 hw/arm/aspeed_soc_common.c                | 154 +++++++++++++++++++++++
 hw/arm/fby35.c                            |  27 ++--
 hw/arm/meson.build                        |   3 +-
 9 files changed, 363 insertions(+), 284 deletions(-)
 rename hw/arm/{aspeed_soc.c => aspeed_ast2400.c} (76%)
 create mode 100644 hw/arm/aspeed_soc_common.c
