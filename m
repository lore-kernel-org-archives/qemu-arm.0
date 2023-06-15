Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp891030ejt;
        Thu, 15 Jun 2023 10:36:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+u2ootrln/RtykV7yJzOscXSkCGtdnOnCxJDXLsH39IIQQj/FAdObbXizvwXugUFb4UtL
X-Received: by 2002:a05:622a:38a:b0:3f8:4905:9532 with SMTP id j10-20020a05622a038a00b003f849059532mr6546864qtx.65.1686850560472;
        Thu, 15 Jun 2023 10:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686850560; cv=none;
        d=google.com; s=arc-20160816;
        b=qY62LSASPb7Wn1sRycNyTeFHOwuz8MySASva10p/lesCvbSzE1ln5qAZpoodZojKwT
         W+1mZh4bSE2kOyazK0Rzfuzeh204jTdxHQULj6Kcqn1KNKywLE992WYTqwMT7SQTrByg
         HtSKTFzB7oaB36jK3yuAdNfxa5Yl/sezVbpdm5ITfX4AWactv2zqNTPdiUwLzu0cC9oQ
         p7oKCh8H6LOuVAfPwiVCIpy52Ap5rc9o8VUJNB+pU2nJjpBnt5dt/5ns20ARA3GQ5yff
         o3YpPK+bz9orlp6cKhRa2Y6pGWEUJrhM4nelY0+lGPrtfPDeNcwas5RLEM3tGioA+k0A
         C1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=M30K5SvCNQ1CWThcd35I8K69JNDS0uf6k6RKf/bZemQ=;
        b=iEPbHPEGXWZqZyWa5fO2j5uviBIQWcCZ5JamnC3Sg9j9cBpQyCvsMibr/XYw1veubn
         XqFS6jmPWfyscecXfrxPZlCaXmU49zVanGHgoF8TGSEPs0QqlPnRPw+uFPwRIOrs0JvU
         xyyKs0RN98/R3Kdo5WeA1sj06kWd7TMC2uER2MgeUVsbWEgadYjNuExVg8r7o37PP97R
         eU+pSIuOPwi2crBQrNquaPW3t5Ldrq49QsWzH69fbaCKLmJoMvfc8O1h4nJjLO9REQS9
         794tdxm3lJ3azsIekMeAHsNgLAjfa4sb5oHtv52OmUhtNXXLpnaMp4ixKZzSjAb5RHfV
         0HrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05622a054b00b003f507800686si9792124qtx.623.2023.06.15.10.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 10:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9qsz-0000bT-OH; Thu, 15 Jun 2023 13:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>)
 id 1q9qsu-0000Zp-RO; Thu, 15 Jun 2023 13:35:48 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>)
 id 1q9qsq-0007g9-6P; Thu, 15 Jun 2023 13:35:48 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QhqFM0bsCz4x0D;
 Fri, 16 Jun 2023 03:35:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhqFK2nQDz4x0B;
 Fri, 16 Jun 2023 03:35:33 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 0/6] aspeed queue
Date: Thu, 15 Jun 2023 19:35:19 +0200
Message-Id: <20230615173525.428831-1-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=xCJj=CD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: 5YLkea88FvPr

The following changes since commit 7efd65423ab22e6f5890ca08ae40c84d6660242f:

  Merge tag 'pull-riscv-to-apply-20230614' of https://github.com/alistair23/qemu into staging (2023-06-14 05:28:51 +0200)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20230615

for you to fetch changes up to 42bea956f6f7477c06186c7add62fa0107a27a9c:

  target/arm: Allow users to set the number of VFP registers (2023-06-15 18:35:58 +0200)

----------------------------------------------------------------
aspeed queue:

* extension of the rainier machine with VPD contents
* fixes for Coverity issues
* new "bmc-console" machine option
* new "vfp-d32" ARM CPU property

----------------------------------------------------------------
Cédric Le Goater (5):
      aspeed/hace: Initialize g_autofree pointer
      aspeed: Introduce a boot_rom region at the machine level
      aspeed: Use the boot_rom region of the fby35 machine
      aspeed: Introduce a "bmc-console" machine option
      target/arm: Allow users to set the number of VFP registers

Ninad Palsule (1):
      hw/arm/aspeed: Add VPD data for Rainier machine

 docs/system/arm/aspeed.rst | 11 +++++++++
 hw/arm/aspeed_eeprom.h     |  5 ++++
 target/arm/cpu.h           |  2 ++
 hw/arm/aspeed.c            | 58 ++++++++++++++++++++++++++++++++++++++--------
 hw/arm/aspeed_ast2600.c    |  2 ++
 hw/arm/aspeed_eeprom.c     | 45 ++++++++++++++++++++++++++++++++++-
 hw/arm/fby35.c             | 29 ++++++++++++-----------
 hw/misc/aspeed_hace.c      |  2 +-
 target/arm/cpu.c           | 32 +++++++++++++++++++++++++
 9 files changed, 160 insertions(+), 26 deletions(-)
