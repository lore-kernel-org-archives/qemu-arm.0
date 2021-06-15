Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3071061lff;
        Tue, 15 Jun 2021 08:38:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJHSRrj+Lb5xb/Ho3DqxqniEze4RSssc6TYl2Mf/coI6tM2mOy1vLA4rF+QR8jJSJQdi7F
X-Received: by 2002:a05:6402:53:: with SMTP id f19mr60606edu.200.1623771503795;
        Tue, 15 Jun 2021 08:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623771503; cv=none;
        d=google.com; s=arc-20160816;
        b=Wi+PzCxxdaTo2f++F9kpteByN6rp7EQRd+5I9ME9XZNqaaSC5WaAaevNtnjTTp3tSQ
         un0h/cKTfUzLw9Xm7WXcpsCur88fEQsL0NuGSwKdZ+3g8bSk2vau72j/McB/nP4Rgtm5
         iwXWVoWTbD/P5stAJ/qnI6RmN6fm3siCQesNM3daLiLMf0bZBjqNnYMbruQwjUDxxLAT
         l09D0sxeckgy8U7VOxoe33MvGQnKRytKHA0eTV8Ag7zHPZFUddGsuf96wPl5q4QKRF87
         a8e/QpG1C6RM4pjLnNzJxpzZ6J+5PAZYOAjN2adj6K+klqojAso962PZOttLqnU1v2XB
         wp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=41z16GzYH5yrHv4xG4p3T6N0rEJOUJ4vHUjimIj2R3I=;
        b=P42Zcv9URqqyPisfZqTaq5VoH0fXzCMmnW3HLCf08Qi1AScP7BgQu3ukm/OwtQBrHI
         H/PaYIVkdvJTI6e3Yn5B/ZUYjmU035lKoTABetKzZZi+IYKKvG/wfGylY8d5LjxNDmDB
         xhvW0XPypOMmtI9uKo8KJRl4J4wZjQ4YAOlTe0Ub8yd2qEyr7xtTLR/6jMi/uHL1c/Ke
         p2LQrzyTWHZudEx0fO9iadATM/mj/bm8LQRcGeuRYqJz7mnSaK6K4dBDK6IgjDFLXUM0
         XhCtPjqELbLLt/POLqpAErMIRA58lVA/K7S979jBStLLULButwXIAubAFnp0DBwLH9XX
         94bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si13733034edw.387.2021.06.15.08.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 08:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltB8w-0005yh-Qm
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 11:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltB6T-0001Ve-Hb; Tue, 15 Jun 2021 11:35:49 -0400
Received: from zamok.crans.org ([185.230.79.1]:60226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1ltB6I-0004kv-8x; Tue, 15 Jun 2021 11:35:49 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 7FBBBE008B; Tue, 15 Jun 2021 17:35:28 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2 0/3] STM32VLDISCOVERY Machine Model
Date: Tue, 15 Jun 2021 17:34:37 +0200
Message-Id: <20210615153440.1307729-1-erdnaxe@crans.org>
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
 "open list:STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cbVzM3Z+ClZH

This patch series adds the STM32VLDISCOVERY Machine to QEMU

Information on the board is available at:
https://www.st.com/en/evaluation-tools/stm32vldiscovery.html

Alexandre Iooss (3):
  stm32f100: Add the stm32f100 SoC
  stm32vldiscovery: Add the STM32VLDISCOVERY Machine
  docs/system: arm: Add stm32 boards description

 MAINTAINERS                             |  13 ++
 default-configs/devices/arm-softmmu.mak |   1 +
 docs/system/arm/stm32.rst               |  66 +++++++++
 docs/system/target-arm.rst              |   1 +
 hw/arm/Kconfig                          |  10 ++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32f100_soc.c                  | 182 ++++++++++++++++++++++++
 hw/arm/stm32vldiscovery.c               |  66 +++++++++
 include/hw/arm/stm32f100_soc.h          |  57 ++++++++
 9 files changed, 398 insertions(+)
 create mode 100644 docs/system/arm/stm32.rst
 create mode 100644 hw/arm/stm32f100_soc.c
 create mode 100644 hw/arm/stm32vldiscovery.c
 create mode 100644 include/hw/arm/stm32f100_soc.h

-- 
2.25.1

