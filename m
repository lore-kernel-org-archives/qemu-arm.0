Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp731803lff;
        Thu, 17 Jun 2021 09:57:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNJ55hPEveckVSh+rZGnD890gfFjsL/qe03ET9znF/RmSadh+urltiCJo5366VtZgOs8+i
X-Received: by 2002:a05:6102:5c2:: with SMTP id v2mr1248130vsf.53.1623949044851;
        Thu, 17 Jun 2021 09:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623949044; cv=none;
        d=google.com; s=arc-20160816;
        b=tJvom7yDXIYTwJyszG4XrhIb/M9TTxKtLfZotYTNPY6bmQDDGdZui7hz0UMAQhc8JF
         dFitFiXWXa2RJGkpan8H9NNwhcel8HF6SfaEE80h2sFRDVUznKHobfBVRYMJo+BkqxME
         des9Wjp8y9SvLbGsLt573PrQuWeoJSDX/w40TXBU1t8rK8NQv6K9J2HVF9oYVhDsmzpi
         aOedx9GEHpfhF5gfEdCEM6PZVJHZvGDm940zq77A7/xP5zi3/OyJqhYnMWljuHNX4Qar
         tNeLtJ7SS0iRKn3Wu5j3IcRbe6Htt8LQJaOi0NnI2XIQaLx6RTA5txSckPcJhkqQ6w31
         so4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=LBdeW7cEFJIn9MTR0vimJbEp7UBkuuVsWvEWeKdqw0g=;
        b=z/b0rbcaHUfl4od6kXY94C23n1TYHUVUlM01RwM9QSjLDMf6kdaWkYKiLaBu61E84T
         O1LjXQOI4Fm9+qZOTumerCMLbuPHB1QiSZtAsHdp0CdIgQ9jR8TU1ARUD/kKLLR5F3v+
         H5eVmHeZNsr/ubINYP1C31CuBGjDmHTVB/jDei70Gt20Oo2ovLRHCiRL2LQieeVX82DS
         jo8kYUiMFf+yWc3njDDZGqU8AFi9OGYgYApJwnLimoUpSQcBysTaEMV2oIAAd6NSt/IG
         add/TZyYqPUKWAlaueJHzHDNgBLGpHY+q0loWrmO8mp2pzjY16s9MHBfDEJXwUTuWQ71
         Vnxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23si4177185vsn.43.2021.06.17.09.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 09:57:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltvKW-0000sn-4K
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 12:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltvKK-0000s1-UW; Thu, 17 Jun 2021 12:57:12 -0400
Received: from zamok.crans.org ([185.230.79.1]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltvKG-0005tz-1z; Thu, 17 Jun 2021 12:57:12 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 2F449E0154; Thu, 17 Jun 2021 18:56:56 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/4] STM32VLDISCOVERY Machine Model
Date: Thu, 17 Jun 2021 18:56:43 +0200
Message-Id: <20210617165647.2575955-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.230.79.1; envelope-from=erdnaxe@crans.org;
 helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k+DASEmZg2jp

This patch series adds the STM32VLDISCOVERY Machine to QEMU

Information on the board is available at:
https://www.st.com/en/evaluation-tools/stm32vldiscovery.html

v3:
 - Add test for STM32VLDISCOVERY USART1

v2:
 - Add documentation of STM32 boards
 - Fixed number of interrupts
 - Fixed Cortex-M3 name

Alexandre Iooss (4):
  stm32f100: Add the stm32f100 SoC
  stm32vldiscovery: Add the STM32VLDISCOVERY Machine
  docs/system: arm: Add stm32 boards description
  tests/boot-serial-test: Add STM32VLDISCOVERY board testcase

 MAINTAINERS                             |  13 ++
 default-configs/devices/arm-softmmu.mak |   1 +
 docs/system/arm/stm32.rst               |  66 +++++++++
 docs/system/target-arm.rst              |   1 +
 hw/arm/Kconfig                          |  10 ++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32f100_soc.c                  | 182 ++++++++++++++++++++++++
 hw/arm/stm32vldiscovery.c               |  66 +++++++++
 include/hw/arm/stm32f100_soc.h          |  57 ++++++++
 tests/qtest/boot-serial-test.c          |  37 +++++
 10 files changed, 435 insertions(+)
 create mode 100644 docs/system/arm/stm32.rst
 create mode 100644 hw/arm/stm32f100_soc.c
 create mode 100644 hw/arm/stm32vldiscovery.c
 create mode 100644 include/hw/arm/stm32f100_soc.h

-- 
2.25.1

