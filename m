Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4022617lfv;
        Tue, 2 Nov 2021 15:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4QiXnMiesub7B9bRqjmgCHGrAl0lLhNKViG01tYHTQxdL/8PNvLKtx0S/v1JnflcfZwcZ
X-Received: by 2002:aca:5c5:: with SMTP id 188mr7531508oif.154.1635893427029;
        Tue, 02 Nov 2021 15:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635893427; cv=none;
        d=google.com; s=arc-20160816;
        b=tP+gOQYI5/W0CFb6hJHrKZfYI2u6oBXmEo8XbYbOrFvsCO7C9r+pDvLm+Tvn20Wh7Z
         RGV2J6N/uxSkhVcVw/W3yEPYGdYxYh6MnUSnsRIV71SC3gE76GribfSE6HEz0m8Ek6Yv
         h/uCFM/ZzQHk3FLhm5P82vxu+6LEhTWo6q2l1Nt+N5l0sac2MzO7fSvCXo04G46eUJeT
         ZtmpPttyuTmUK+4Rd2dngyZ3EOsCACr3iG/lpOrUpFVMCsLBVgfrOiHrCt3Ua1d1Ls9u
         qDycGG5ddCR1MUoOQ4+zfNAWNbFdIcTvid1TfRPfWl441OchKXLsrUmK7YMv/9Zu306r
         E9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=HB9TzWrPr0bZl6VptBim/Wm/IzhVsNI0xW1PH18/wJ4=;
        b=Udtqi4gJ/LEaVnjaNiH+TaVZ3H7Aku1RDgc/b/NXz93tsrZ2o+NUOUyqMo4S+rANt8
         bvsY1GReUYAa/ldXDkkCnk7Gq4iHdXM7xhOLrSmvU9mD4j2lS4FXn7THEmVteETBsmbk
         JzXrXn+7MbMnB2o+vSkTU91MCpsug6uCIavnZjoTxI6RP0HX9jMpif5ENW9W5D+08nku
         MRQG4sNs/Pu3z4VlRegEMZxgKxDUFlLJHLWBiCOT/mMKgnMUa6RnI4DzRUpsbq1voZnp
         1CZUZ5+Y1jCPJumrjgM4l/zON9KaDey5A0HUy4BQ9ot1967t+Pq4LH8gqZxAcpiPTdCH
         O7Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=spLzW4rX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bd15si679304oib.214.2021.11.02.15.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 15:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=spLzW4rX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi2bq-0000k7-E4
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 18:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3fMCBYQgKCBcJH4xBGF43BB381.zB9D19H-xE9ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1mi2b4-0000cA-5k
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 18:49:41 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:48966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3fMCBYQgKCBcJH4xBGF43BB381.zB9D19H-xE9ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1mi2b1-0001FB-T1
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 18:49:37 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 m17-20020a170902db1100b001421cb34857so142971plx.15
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 15:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=HB9TzWrPr0bZl6VptBim/Wm/IzhVsNI0xW1PH18/wJ4=;
 b=spLzW4rXT2pk/jwKrQJW9fMPlFqwFb4Zr9YvX75wumSIj6H8TkcwQpoJQADi6GsJWD
 9Mu9TZ9gDzisPVLw+JX+zMf5tU4yUiZJT4IgfrRSkt1v7bw1a40rFzggUo+QozQhtD1z
 X1WFom5AJtzsF38FM0KTxkKLckGtmWMPLjIW7yrmfJZvP9TyuifoNVR79gVXGWto3qR+
 n5xIUkaMclsguu5ddM/9Knf0NMQSSJSkeVXLAG8UeMeds/ytjvevrm25i02Jkqbu7Yi8
 RnNLXA0e4IxUD4vuxKFpiWuTepbfMf4skGi2X2to52Au7EnZE8Lc1pNmFGNVcEhjNxQ1
 FQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=HB9TzWrPr0bZl6VptBim/Wm/IzhVsNI0xW1PH18/wJ4=;
 b=D6N9kTpF2GytiT9Vcvno3g2zAGOWWw+B2uYjWnftUxTyc004GDsfLS+1M/QlrO8ro+
 WUzHJ9Y2VhT+3NhUpltWbojd5rQuTMZkZ08dlODON9fKF8btvyJk/ff8vfPi1KzcXhTF
 S23/QptvU5yH4Clc1dCxNVnhlwld2ETNK48U+QZbIj2QZyDyus2+aenabQ6T86XT0YdG
 jpmCaZQSzIaooH+iejTDPrdTtniazoPDIaMValASdP1DJOZd0AfTWQpde5vyiADY5yGc
 faRfYrClwqD5Ut+a6HrOpxvORWxS+DKbdhJc4SjalprMoDTimAuslwN2m+dUj1PgSo91
 E7jw==
X-Gm-Message-State: AOAM532OYfp2JMVcieBgP3DE6XfKQLzna78h5dvO6vUZmRmNbycb/Hta
 XJMybFZvj0N5CZs8PmAsvNcABUgg2CL7oQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr257806pjh.1.1635893372935; Tue, 02 Nov 2021 15:49:32 -0700 (PDT)
Date: Tue,  2 Nov 2021 15:49:19 -0700
Message-Id: <20211102224924.1244946-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 0/5] hw/arm: Add MMC device for NPCM7XX boards
From: Hao Wu <wuhaotsh@google.com>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3fMCBYQgKCBcJH4xBGF43BB381.zB9D19H-xE9ABA3AH.BE3@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rsQj05xwQddT

This patch set implements the Nuvoton MMC device
for NPCM7XX boards.

The MMC device is compatible with the SDHCI interface
in QEMU. It allows the user to attach an SD card image
to it.

Changes since v2:
1. Fix an error use of strcmp in qtest.

Changes since v1:
1. Rearrange the "add SDHCI commands" to just before when it's
   actually used.
2. Add standrad SDHCI MMIO as subregion, similar to cadence_sdhci.
e. Add a vmstate for NPCM7XX SDHCI.
4. Address various minor fixes suggested by Peter Maydell.

Shengtan Mao (5):
  hw/sd: add nuvoton MMC
  hw/arm: Add Nuvoton SD module to board
  hw/arm: Attach MMC to quanta-gbs-bmc
  tests/qtest/libqos: add SDHCI commands
  tests/qtest: add qtests for npcm7xx sdhci

 hw/arm/npcm7xx.c                 |  12 +-
 hw/arm/npcm7xx_boards.c          |  20 +++
 hw/sd/meson.build                |   1 +
 hw/sd/npcm7xx_sdhci.c            | 182 +++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h         |   2 +
 include/hw/sd/npcm7xx_sdhci.h    |  65 ++++++++++
 tests/qtest/libqos/meson.build   |   1 +
 tests/qtest/libqos/sdhci-cmd.c   | 116 +++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.h   |  70 +++++++++++
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 209 +++++++++++++++++++++++++++++++
 11 files changed, 678 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

-- 
2.33.1.1089.g2158813163f-goog

