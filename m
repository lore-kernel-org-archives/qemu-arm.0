Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp515600lfg;
        Thu, 11 Mar 2021 10:09:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycHVgEPUqVFS6KQccp9o9b701O7ZTg39JM1pKuvAqScwqdu8s7JVFgyHtViOUKdSe7zW1o
X-Received: by 2002:a05:6e02:ca1:: with SMTP id 1mr7598821ilg.242.1615486174152;
        Thu, 11 Mar 2021 10:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615486174; cv=none;
        d=google.com; s=arc-20160816;
        b=adtr44u4xdHsP9m7f0I3vXHBpUbKOh04xT82eBPse4FmLa6n0Nt2jq1r7eZI1Hr01u
         y37cwY7BOCxHVAs57Cq+C33711FEd80d28K36bKnnZevrkPoER1V4jqj1E3/TDJMcLKK
         wLWbb9gGHjBAjZUS5hFrKupCgvlGM2Bzl8fSaklJ8MOow+3gtNBUkDkDFBly6ggjBdY0
         ezJ1JdkX9S/iRFfvrWF0zzPFISFNUdSsi2RBnF0giQoWng5K1ZAMlFh2geddzWXkguuO
         XI4IuVILYZ7XYirYRnGGEa2plztM1HHRkjZ2vms6RdMEKePCHAnV3OA4aWoORBlgqbzq
         5lOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=4HbhmuBPeJFPt9NDBoP2ION/NHr/UUnClVCqpOydOEs=;
        b=dCZqEjw9P01zl+l0DlmkaQEpeBKWjlHKffjOHPAj9Phjfb8AjRjFEIbUd9Qd6615PM
         YD3q6MYyVk2azOcBfuX+LkTze/WrGOMV5GEiRuYKXTSY1iz9GBmQwvnjfUn3kqXDhBhM
         hMJQ4bnZ8DKGQyXSaKjH7o07g4rQgV1aPut+g2Dp9UE0JZBZsy1CCevmwricYIEgw+1U
         uWnXfRuo7VJSV8TP6a7VmnfmvXZb/Yqav1mNCVwVl6LZWK8H5UmvnwGa2IEB0fY9FwCT
         p86kh7fvipHmfTK7xypLcjp6k6mXcySfieB1h3uPDUY7hQ7/Hs3M+5jvJqRaxGAkczif
         H/Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="J/ZmDugZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si3143795ilu.162.2021.03.11.10.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 10:09:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="J/ZmDugZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKPkb-00074m-Df
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 13:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uVxKYAgKCKQaYLESXWLKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--wuhaotsh.bounces.google.com>)
 id 1lKPk6-00074C-D4
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 13:09:02 -0500
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:50958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uVxKYAgKCKQaYLESXWLKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--wuhaotsh.bounces.google.com>)
 id 1lKPk3-0000Yl-UE
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 13:09:02 -0500
Received: by mail-qv1-xf49.google.com with SMTP id e10so15687787qvr.17
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 10:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=4HbhmuBPeJFPt9NDBoP2ION/NHr/UUnClVCqpOydOEs=;
 b=J/ZmDugZzYO47GeNXT9j6SMiZ6ILg3+uF3BqldhYAnmWmiEL/SLNYjotpRnjeGTURh
 nLTWPKIfk8v+Ptp6nUtP/zTitg2KV6hTvMkwdaV7r45a9U0gdKtKoVKCjddCZkrXwvXp
 +xLs893KDeLyW68X1lIXZPRK+c75WXCDqUYbxnGAITHB5jLbbGJgOzGwLL4BoZmEpHI/
 iZHMnny4/QDRYhgwomYU4RQyTAaNRTaQwf9VsB9wCl5jqapZgMQzJFA4zkkXjBe68iMw
 y2skJMyDWbOTBTI2Z5jVEQKmPV7lTVXtAu/u94tda0Bw5Wx64VwF2YMcI9p15J8dLvrX
 zf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=4HbhmuBPeJFPt9NDBoP2ION/NHr/UUnClVCqpOydOEs=;
 b=gLrpZ2+EPlgriUSx01qR1+fyUZmKWlTtBkKg7CiSueebAJb5p3qZ+1NZm51ujg/VQG
 Le/AOzgGoTL0cw3y5gL6sshAub8+mLI85Wvk/TsWf1TfeUDQxREg0ciBh/zpniMsee2u
 mHFM6V2a7b21FveZMlvRCnqdousyikdywebvckytj9MIEIoAAm46Bd/dHGKVPk+IvnQ2
 e1Fh2haWyEhWNBqH8fOMXo9HVj/iaq3JzQWj7y8wFQDsZZfOeYbxFUFU6Uh1XSFH74JQ
 kQhWbYx7UymAucqJFyMvdPz4bgYHTQtX5/ZQbCB/MxKRrFMogbVdagG6gZK+4iLmsWBZ
 gRqw==
X-Gm-Message-State: AOAM531qLvdCVayFV7flhtQvHpiKpX7kVUuEALYHm34hk4QYUAYcwjPt
 MaFrqZ1nfg2ySKXxlYE+ymqJdKuLdBCh8A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:a425:: with SMTP id
 w34mr8374442qvw.2.1615486137661; Thu, 11 Mar 2021 10:08:57 -0800 (PST)
Date: Thu, 11 Mar 2021 10:08:50 -0800
Message-Id: <20210311180855.149764-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3uVxKYAgKCKQaYLESXWLKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--wuhaotsh.bounces.google.com;
 helo=mail-qv1-xf49.google.com
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
X-TUID: pW/3OikJHcrq

This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
the RPM of PWM fans.

To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
into the MFT module.

The connection of PWM modules and fan modules are derived from their specific
Linux device trees and coded in hw/arm/npcm7xx_boards.c.

We amend the QTest for the PWM module to include verifying the reading from
the Tachometer is correct.

Changes since v1:
- Split implementation of device and addition to board file to separate patches
- Adapt to new Clock API and address conflicts
- Use the new clock_ns_to_ticks API to calculate tachometer counts

Hao Wu (5):
  hw/misc: Add GPIOs for duty in NPCM7xx PWM
  hw/misc: Add NPCM7XX MFT Module
  hw/arm: Add MFT device to NPCM7xx Soc
  hw/arm: Connect PWM fans in NPCM7XX boards
  tests/qtest: Test PWM fan RPM using MFT in PWM test

 docs/system/arm/nuvoton.rst    |   2 +-
 hw/arm/npcm7xx.c               |  45 ++-
 hw/arm/npcm7xx_boards.c        |  99 ++++++
 hw/misc/meson.build            |   1 +
 hw/misc/npcm7xx_mft.c          | 540 +++++++++++++++++++++++++++++++++
 hw/misc/npcm7xx_pwm.c          |   4 +
 hw/misc/trace-events           |   8 +
 include/hw/arm/npcm7xx.h       |  13 +-
 include/hw/misc/npcm7xx_mft.h  |  70 +++++
 include/hw/misc/npcm7xx_pwm.h  |   4 +-
 tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-
 11 files changed, 974 insertions(+), 17 deletions(-)
 create mode 100644 hw/misc/npcm7xx_mft.c
 create mode 100644 include/hw/misc/npcm7xx_mft.h

-- 
2.31.0.rc2.261.g7f71774620-goog

