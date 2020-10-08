Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1769614lfq;
        Thu, 8 Oct 2020 16:22:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQR6BBX2PCKnDGvhS0VkpteG5C9rBsIGo4hMS9H6a7aIUUBqheVcQdOCzMJRnGyhxdZq2C
X-Received: by 2002:a25:4688:: with SMTP id t130mr13573367yba.345.1602199375216;
        Thu, 08 Oct 2020 16:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602199375; cv=none;
        d=google.com; s=arc-20160816;
        b=VApE9BTF1/VpteEvC8xEHlxLTnocyW9/cRaLJ4v3zGXmiaxvcsI2BMLbnV8saW3VCa
         z6ObR/NInAzyDVyWN64BWo+LUapPouCMSsIqKCLCn4QGKTMSVYCLmO4qzxu283h96HVd
         Z39vYAZNAOA+eCvOArCYmyeglkZRBrj0Bc4OQ5SinAbwXd3O6+bRb4GCa9WlYEldyD7+
         4NOalBUMsQU2fxS3QgVYCUmjhtMiJyW9M9nfgDy5EHJ7Jx2qJzIgq25b6vK6+MT6QR3i
         R+0TGjrA1S8ZxYecCOTkBcftXqd24QFjxAWG5HuLbMFrWgOI25ULF6bD/vmMBE/UOAVi
         g5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :mime-version:message-id:date:dkim-signature;
        bh=58MsYfVPTykH+Uq+RyP2WGX8cjctL3dx/QC7x4Rsb40=;
        b=qjmH3UeJNLFlx53NqbpeWT9XHgut8rNmeq2IssR9F/TGlbK3xgwV3F3wsSqQXVxQnx
         56HFQlgY7lCB9dth30HTQ4jG8xVTdMoClncqXXLtUDwpLdNkzcziTpvKt4bTcvFdGuLm
         57K8m0dSQ/mfoDxyYhRaUMyB+MCXBLIc69OV1Kgoq8440jYXqbuFKHduxDal7kqEiV2T
         GOYMrtlfLyxk50pJuNdOicjPJe6nbei6+OPNIRJYUDPKic6rPCCmvqLjIjdQ43PJAJIm
         S9mCMTKbcBT8DTMvZMv2HC3mUY258+JK3Dekd2AYVfcj5NnTThQawPnoSBno/Nbpm3se
         iRsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=bFtF0F1l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h125si6292012yba.334.2020.10.08.16.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 16:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=bFtF0F1l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQfFO-0003pS-Jk
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 19:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ip9_XwsKCGEGRJHMMDLNDMFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--hskinnemoen.bounces.google.com>)
 id 1kQfEl-0003p2-MO
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 19:22:16 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:47300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ip9_XwsKCGEGRJHMMDLNDMFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--hskinnemoen.bounces.google.com>)
 id 1kQfEj-0002rs-5O
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 19:22:15 -0400
Received: by mail-pg1-x54a.google.com with SMTP id n8so4969443pgv.14
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 16:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=58MsYfVPTykH+Uq+RyP2WGX8cjctL3dx/QC7x4Rsb40=;
 b=bFtF0F1lKvfJF45AKX+rpDQ91xLvZGR673vb7ska+44jVKReysMF3hquAWseAvl2Ew
 bVlbdCr5SlPv8gxngZRRSmEz2xKX35f/GF/7YGtYiuKE7Uie19JomQcqJ8Ma/xCPw4uc
 hY1+NJtvx5abFVQPIvodITnxMpo+tbcdYzuA82qQxAOqn9kIQHkRJIcWswlbFAP13T8b
 q6lOKXrM6ZQ7mNP//qrB1ANkKdFI0/6AaxnmroVQaH5yFDovMf0zVwQkYj7/96dJHrPR
 3VvBN8l8qF3cUy3nUuQlXYKs4ggEZYTqSG1BohlVQnPVfLDYVT5WKwNK+Y/RwgIRpd50
 szqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=58MsYfVPTykH+Uq+RyP2WGX8cjctL3dx/QC7x4Rsb40=;
 b=Mbsix5JbG6IyGoB9OLdVGEJsztkrcrhisoRuDqTu113W6OJlxE1N3EG9JAV3PuThAK
 z9SFtBGj48O+M89OxMwYQcVqnyt08osHrfQ95Tu0ITYcdIjDIR7DtdpcrT/yHTtkQpe2
 s+cZXOqNOjBI2d2ignZ9JoHeE71hH9fWCK3gnm+4MW8cHcf2VGe4sGSQRA3gQ4z4NNGG
 YqH4hEbkLjx9QQpWvV9YPvxrpg4v8fTXD8fjfMpfeULqpLIwqU2UePcLKwptW6r3GQtc
 7InmFsF9Ppvz+jnKZ2oXwdJv3BLrbJQktaV895KwHhnlWRB0AUbnEG9WzigL+2bL9jQo
 MIPQ==
X-Gm-Message-State: AOAM530nfB7woGkdDNkCOnBvxqPO4IohRMlz01KniqDZoLjmdXm/ngFu
 e1Yd2p0DRuzVMz48VZJJd3G8HFcWL4xWRxls1A==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a63:7d8:: with SMTP id
 207mr1027106pgh.173.1602199330154; Thu, 08 Oct 2020 16:22:10 -0700 (PDT)
Date: Thu,  8 Oct 2020 16:21:48 -0700
Message-Id: <20201008232154.94221-1-hskinnemoen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH 0/6] Additional NPCM7xx features, devices and tests
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, f4bug@amsat.org, clg@kaod.org, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3Ip9_XwsKCGEGRJHMMDLNDMFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: bScSBgK88uQI

This is an update to the initial NPCM7xx patch series adding

  - A timer test that found several issues that were fixed in the final version
    of the series (see
    https://www.mail-archive.com/qemu-devel@nongnu.org/msg739516.html).
  - Watchdog timer support. This makes the reboot command work.
  - Random Number Generator device.
  - USB Host Controllers.
  - GPIO Controllers.

The watchdog was implemented by my new teammate Hao Wu. Expect to see more
patches from him in the near future.

This series has also been pushed to the npcm7xx-5.2-update branch of my github
repository at

  https://github.com/hskinnemoen/qemu

Again, thanks a lot for reviewing!

Havard

Hao Wu (1):
  hw/timer: Adding watchdog for NPCM7XX Timer.

Havard Skinnemoen (5):
  tests/qtest: Add npcm7xx timer test
  Move npcm7xx_timer_reached_zero call out of npcm7xx_timer_pause
  hw/misc: Add npcm7xx random number generator
  hw/arm/npcm7xx: Add EHCI and OHCI controllers
  hw/gpio: Add GPIO model for Nuvoton NPCM7xx

 docs/system/arm/nuvoton.rst               |   6 +-
 hw/usb/hcd-ehci.h                         |   1 +
 include/hw/arm/npcm7xx.h                  |   8 +
 include/hw/gpio/npcm7xx_gpio.h            |  55 +++
 include/hw/misc/npcm7xx_clk.h             |   9 +
 include/hw/misc/npcm7xx_rng.h             |  34 ++
 include/hw/timer/npcm7xx_timer.h          |  43 +-
 hw/arm/npcm7xx.c                          | 125 ++++-
 hw/gpio/npcm7xx_gpio.c                    | 409 ++++++++++++++++
 hw/misc/npcm7xx_clk.c                     |  20 +
 hw/misc/npcm7xx_rng.c                     | 179 +++++++
 hw/timer/npcm7xx_timer.c                  | 279 +++++++++--
 hw/usb/hcd-ehci-sysbus.c                  |  19 +
 tests/qtest/npcm7xx_gpio-test.c           | 385 +++++++++++++++
 tests/qtest/npcm7xx_rng-test.c            | 278 +++++++++++
 tests/qtest/npcm7xx_timer-test.c          | 562 ++++++++++++++++++++++
 tests/qtest/npcm7xx_watchdog_timer-test.c | 313 ++++++++++++
 MAINTAINERS                               |   1 +
 hw/gpio/meson.build                       |   1 +
 hw/gpio/trace-events                      |   7 +
 hw/misc/meson.build                       |   1 +
 hw/misc/trace-events                      |   4 +
 tests/qtest/meson.build                   |   4 +
 23 files changed, 2682 insertions(+), 61 deletions(-)
 create mode 100644 include/hw/gpio/npcm7xx_gpio.h
 create mode 100644 include/hw/misc/npcm7xx_rng.h
 create mode 100644 hw/gpio/npcm7xx_gpio.c
 create mode 100644 hw/misc/npcm7xx_rng.c
 create mode 100644 tests/qtest/npcm7xx_gpio-test.c
 create mode 100644 tests/qtest/npcm7xx_rng-test.c
 create mode 100644 tests/qtest/npcm7xx_timer-test.c
 create mode 100644 tests/qtest/npcm7xx_watchdog_timer-test.c

-- 
2.28.0.1011.ga647a8990f-goog

