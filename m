Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp561210ejh;
        Wed, 3 Jan 2024 07:54:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG39AmYb7NavimKSEDQtnSkjyUPnGvldRv9adVePQBaQNmRELfvBd7NX3QOT3oakx3IozKJ
X-Received: by 2002:a05:620a:198a:b0:781:5e28:3edf with SMTP id bm10-20020a05620a198a00b007815e283edfmr15239542qkb.123.1704297244665;
        Wed, 03 Jan 2024 07:54:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704297244; cv=none;
        d=google.com; s=arc-20160816;
        b=XIS4K7oBxjHJi5WXrfNFz+TJyT4q8+iYzuOCkQn6xHouLKG270mvsfoMKbj47K1r6m
         RJU/RyN5a5yavyIXdygZzPt1Bsj4Pg3AQoz695zYeXaiOkORR2f+3tvQDN7p0R/NiSM9
         c/SELzR+FdmuIWzT7Alp8W2sTp2xNc+Axtxf4F2cvxc+6CB4HS7DRTNDRgOTY9d8f2xs
         YjUtMoc8iAsbyxqm+39ppr2uYUKrFV8F05f9yraAaBNk/zHzv629TMm2E2NFrdj9gXcb
         FyV9ojVPMQvjOOOCh43H6Gm4Yo0eV194UtzS4gPX03xBNVHL664vCgDgckJEM3JPEKbP
         IOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=dyx+QZUu1cZi/JAuGNQGkddtlOwEGHnHjn7roZahdLU=;
        fh=HXATX5/62pMJVs80a2Hs0Qv0Y5F0Xlxx6Qu533NYerI=;
        b=zlOZq0fbmN6pN3aTKyqQ+I3EIPPuB+RcbPiJXF200HEPdjFi7C06QQ+coTxdF0eBBk
         tJZTg6sPcQ+JmV2ASE5svHSC6SFRFQ8D9endrHtxmnvzdm8lqUo8iTFBMNiWRRdOwLEW
         hvrIqAh5VdDDf4oQjYSemCTrLBckfcwmbywifEtDMwQsZZT5Nc7PI7t7cl2cRbPXrp+f
         I7ThEFX0KpzgNT/v9Z0BCV9t0l1iaN+G+jGbQN4v6Y1xbFd9Hz54Wt7vzPNnBdPg34SU
         P+8KUGX+MVfBsynSF4juig5tRtWJcwbeCtE3KVgrpXFsV1YfseDTXpARf3sghSadKGC7
         +sig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05620a255200b007817232fbf1si14117322qko.161.2024.01.03.07.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jan 2024 07:54:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rL3Z6-0004LX-Oi; Wed, 03 Jan 2024 10:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL3Z5-0004Ke-Pp; Wed, 03 Jan 2024 10:53:55 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL3Z2-00052C-Ko; Wed, 03 Jan 2024 10:53:55 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id 333A280024;
 Wed,  3 Jan 2024 16:53:43 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Anton Kochkov <anton.kochkov@proton.me>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alexandre Iooss <erdnaxe@crans.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH v2 0/3] Add "num-prio-bits" property for Cortex-M devices
Date: Wed,  3 Jan 2024 16:53:34 +0100
Message-ID: <20240103155337.2026946-1-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: NdDwk4/STtQu

This patch series builds on a discussion initiated by Anton Kochkov on
this list in 2022. It allows setting the appropriate number of priority
bits for Cortex-M devices. For example, FreeRTOS checks at startup that
the right number of priority bits is available in order to guarantee
its runtime structures safety. They have added a configuration option
to disable this check when running on QEMU because QEMU always use 2
bits for Cortex-M0/M0+/M1 and 8 bits for other devices.

While this change allows the number of priority bits to be properly
configured, it keeps the same default as before in order to preserve
backward compatibility unless the SoC configures the exact value.

Changes from v1:
- Add support for the STM32L4x5 SOC family (which is currently
  under review for integration) and fix the Based-on: trailer
  in the cover letter.
- Fix a typo in one of the commit messages ("compatibility")

Based-on: <20231221213838.54944-1-ines.varhol@telecom-paris.fr>
([PATCH v4 0/2] Add minimal support for the B-L475E-IOT01A board)

Samuel Tardieu (3):
  hw/intc/armv7m_nvic: add "num-prio-bits" property
  hw/arm/armv7m: alias the NVIC "num-prio-bits" property
  hw/arm/socs: configure priority bits for existing SOCs

 hw/arm/armv7m.c        |  2 ++
 hw/arm/stellaris.c     |  2 ++
 hw/arm/stm32f100_soc.c |  1 +
 hw/arm/stm32f205_soc.c |  1 +
 hw/arm/stm32f405_soc.c |  1 +
 hw/arm/stm32l4x5_soc.c |  1 +
 hw/intc/armv7m_nvic.c  | 23 ++++++++++++++++++++++-
 7 files changed, 30 insertions(+), 1 deletion(-)

-- 
2.42.0

