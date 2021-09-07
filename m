Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5192363lfb;
        Tue, 7 Sep 2021 16:26:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXY2zjFJQVwmg+dZDTYWao+ciXVKo8aA5ZQ0nSne/iMva5iG2r0EcOlS0Zb2yxVCKrNrEz
X-Received: by 2002:a5d:9681:: with SMTP id m1mr578336ion.113.1631057212586;
        Tue, 07 Sep 2021 16:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631057212; cv=none;
        d=google.com; s=arc-20160816;
        b=f3/bwrafar3gl4fbeIa1sm7c4i2SJw32xPqMamneQTDgRrXZ1idQxOUf/I4lPtt78E
         2tAYjqDjTqygM/iQGUAEIqcd5aocHqad31aHPC+lPGtysfDu4dALCHkOPRom83HDtn/E
         K+yJFaSqgHjrt2N43IlrqjRm/ftFlDYZHLsaxhi5jp49xswkLIvSOSx6fsi3bbtP+fQA
         1C6//1J1lGv0wpQbaE6xPR/NxhQCHtVVHtvFj2Apx6Aazw/XjfXOE57McmYU1S7/scwB
         40NCH2cfjzLwNtD1U7eesjIsEUp48f3CKdn9kT2kGrQbcCWIkr4yykg8xpk106eMzUkB
         aNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=gcg2LCsrx72JmLSBueLTYl9KZ6RXoGSsUJdE5lrZ93A=;
        b=NEbc0CqJRiF0KZnKCdFPcIpYkNxnvN+H1ZuQxjP3PyHPsgIDkSUMoG+YP9cVnXRw+L
         2Qr5hZ1EBiCJo3oYX7xmkJImeD1Q+RrXhyhMDmV7rPqfXCH8Xbs+z43Ea9olMTgElIZe
         YTnvR9Cn3vSr7Z6iX4kF8Wc470j/YaYgApsBA22nTLdMxdZiYn9DVPq4Wu08jiGiTijG
         FuNiDCpr6ZuOryg8C07mo6XAqXrjB80Bfag/xF/Pd5xnfkOPpGKY89BD7hkaxNHBunCh
         FP59epDcyu976veNUT52QbEN0ZhC0v7ZHg9xbkkp2XgP4oNRWaUGmL5FzKYCttjSjfgQ
         qdpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=pq4pJ9Ab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si477991ilh.21.2021.09.07.16.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 16:26:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=pq4pJ9Ab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNkUN-0000J5-UT
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 19:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JPU3YQgKCP01zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU4-0000GS-A6
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 19:26:32 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:51028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JPU3YQgKCP01zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU2-0003zs-P2
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 19:26:32 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 u1-20020a25ab01000000b0059949024617so164306ybi.17
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 16:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=gcg2LCsrx72JmLSBueLTYl9KZ6RXoGSsUJdE5lrZ93A=;
 b=pq4pJ9AbqMNsDeApPEuGnnSEJgYqJqjgf+CGSGX9M5yi9PDWQieHuf/S441g85+tLT
 lEYkftVXiaKl8H+y8BJa8gT02DaYrpNy0k+4xoke9o8MV0Ov9SLJAC0HGzPsrXeKl4qf
 4QI9isWoOPvG4PDs6RaL+x4zy1mIcBVy35CDYe8W7wYChtXm4Zd7gz25thIbhLNdhpVy
 Kgu7VtXFHBcFhx4Dxk/y7+R/se73hB3znFtQ4PcEyHurMvLv49o6SdvOSYffTU0wapy4
 Jsi7xpIcqpcxhjJiMFSgeSQaEancLteQ3feclf+tueZc0XrcaWQ7mDGxmwrDwupkW85z
 iR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=gcg2LCsrx72JmLSBueLTYl9KZ6RXoGSsUJdE5lrZ93A=;
 b=lFXjbyKczop2Hl9nHfNBj2Xzzt0S/s/Ld6w1z8Eyv128JSWYmiZ4KK//n788zxYr3w
 fYKhlLDWpKTtqZJtadShJZ8VWcB2bz/2sj3PedTZuLGS027LXYZC43UE9+eJ3mDuYUJI
 sTueqTwMU4+QTRb+22h+Jz0RaxGAa3e4MZizWRcSLErDDvKe7A2gRivmwNuINOwsR9MQ
 DtlgaUQzmUt+V67qv4VbhCOra8Bf1FigdlcNZEh7OQBBSK3mBBuLXSlVNwjqFN8nQVBt
 iiOZ7TIBGtpNVEa+yLPop7BHYPcd8mfYkMjLQ9k6w23Sr3HuyHTLlkoq0jkyK7sXuMH4
 1t7Q==
X-Gm-Message-State: AOAM532e1WkH7G9y9U8gcYMIMdOzgSq/EgjD2GfahxBQ121JduPc90wT
 FulHJ9L6MiQex6dVQTRP2x1P2KaJeqARlg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:61c7:: with SMTP id
 v190mr1120210ybb.215.1631057188836; Tue, 07 Sep 2021 16:26:28 -0700 (PDT)
Date: Tue,  7 Sep 2021 16:25:51 -0700
Message-Id: <20210907232555.3268967-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH 0/4] hw/arm: Add MMC device for NPCM7XX boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3JPU3YQgKCP01zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pMwA6rXUo6g0

This patch set implements the Nuvoton MMC device
for NPCM7XX boards.

The MMC device is compatible with the SDHCI interface
in QEMU. It allows the user to attach an SD card image
to it.

Shengtan Mao (4):
  tests/qtest/libqos: add SDHCI commands
  hw/sd: add nuvoton MMC
  hw/arm: Attach MMC to quanta-gbs-bmc
  tests/qtest: add qtests for npcm7xx sdhci

 hw/arm/npcm7xx.c                 |  12 +-
 hw/arm/npcm7xx_boards.c          |  21 ++++
 hw/sd/meson.build                |   1 +
 hw/sd/npcm7xx_sdhci.c            | 131 ++++++++++++++++++++
 include/hw/arm/npcm7xx.h         |   2 +
 include/hw/sd/npcm7xx_sdhci.h    |  65 ++++++++++
 tests/qtest/libqos/meson.build   |   1 +
 tests/qtest/libqos/sdhci-cmd.c   | 116 ++++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.h   |  70 +++++++++++
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 201 +++++++++++++++++++++++++++++++
 11 files changed, 620 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

-- 
2.33.0.153.gba50c8fa24-goog

