Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6105405ejc;
        Tue, 7 Mar 2023 07:56:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8sW4IhxsLvzOT6WuhyrFxY8OpthJqACsQEMPeWteXYGZuwOrqQhhmG5TSR9bcTLmX+KZZG
X-Received: by 2002:a05:6214:40f:b0:56e:a07b:f4df with SMTP id z15-20020a056214040f00b0056ea07bf4dfmr494757qvx.13.1678204568659;
        Tue, 07 Mar 2023 07:56:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678204568; cv=none;
        d=google.com; s=arc-20160816;
        b=PqC2W+5/c/UKFIPFgjh7A23Zl0tzps3kwbaZD1R19Q4k/wNeKTP4Vquf6+riVUYtKA
         YPaJdttmlBRlBVZwtUDuakHhgp0hcAzUhQRhNjl9Lp0GFKG7SM9Gah3aflzs7AaQs6yT
         b+8Ap9j7hTYJH6bEWZWfR94WQEe03I6RgwcNGr6dam4X9grVDZDEji3mWfuJfR0inA6m
         VoFxmMsoNqlG29Gl269btC3/kr6tRfje2WHqkwHDSkxeIkRunQX5r+6GZxu/8fbRdyLE
         q4YBJkwo9d6z/bcIQecjpMxcRCNS1AowtCe/QUxMCOiYqmZZHDpJ1z3zXhfwX0VpTQxT
         j0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=rY81EAy4WKBfnLoiEBmFoFhzSMMzsGkGRAIkLdnLlhU=;
        b=x55ZTfsieWAC2eMhRl6W5ZZ/InZPMOpCg4iFf/eSXhpCcWzrsN1taNMIk0bTrIKZDm
         kyP2jKLC9eiCXUQa9fzof3tfYzYnpavFpFc8CHOr958DBJFZw1c9wVpjFc0Axx/2R+XP
         pm7ifvHj+yEZtuZRusO8z3tRZjXjeoog9N7zZFpjRF09fobmQZnPZDe0nONaCCgfMTHO
         qatQ9p+TOGKg/gTDJnVIe9+pRIp2Eysd1n91T9dNMincAmBo4b4+phamp/azQIQ99tDD
         tvEa7Oj31zxrbNCYp58OvPMzKO1F6hd8LE2xuTiLji4J8mU+KCp42icLnA4cnt2zDfV7
         F3IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a0ca952000000b0056ecfe1e0c1si9675774qva.466.2023.03.07.07.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 07:56:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZZfY-0006MP-Rk; Tue, 07 Mar 2023 10:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfT-0006Iu-7B; Tue, 07 Mar 2023 10:55:59 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rbq/=67=kaod.org=clg@ozlabs.org>)
 id 1pZZfP-0000Qr-CQ; Tue, 07 Mar 2023 10:55:58 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PWKm66S2Zz4xDp;
 Wed,  8 Mar 2023 02:55:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PWKm51Sxxz4xDh;
 Wed,  8 Mar 2023 02:55:32 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 0/5] aspeed queue
Date: Tue,  7 Mar 2023 16:55:23 +0100
Message-Id: <20230307155528.3655534-1-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=rbq/=67=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /63+40q9cdVv

The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:

  Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20230307

for you to fetch changes up to 7840ba985a7c0fcf90a7318ff1f827f89571cb3c:

  hw/arm/aspeed: Modified BMC FRU byte data in yosemitev2 (2023-03-07 16:53:18 +0100)

----------------------------------------------------------------
aspeed queue:

* Small adjustments for the newest Meta machines
* blk_pread_nonzeroes() fix required for pflash and m25p80 devices
* Improve error reporting on file size for m25p80 devices

----------------------------------------------------------------
Cédric Le Goater (1):
      m25p80: Improve error when the backend file size does not match the device

Karthikeyan Pasupathi (3):
      hw/arm/aspeed: Added TMP421 type sensor's support in yosemitev2
      hw/arm/aspeed: Added TMP421 type sensor's support in tiogapass
      hw/arm/aspeed: Modified BMC FRU byte data in yosemitev2

Kevin Wolf (1):
      pflash: Fix blk_pread_nonzeroes()

 hw/arm/aspeed.c        |  9 +++++++++
 hw/arm/aspeed_eeprom.c | 10 +++++-----
 hw/block/block.c       |  3 +--
 hw/block/m25p80.c      |  4 ++--
 4 files changed, 17 insertions(+), 9 deletions(-)
