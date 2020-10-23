Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp853064lfa;
        Fri, 23 Oct 2020 14:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZEEqYUsEtx3Ukc69L/FZ84k6ZlV0Sw+cWn+LiInN9+c0dTNMmZdJB9nqwqY5JamkyseaM
X-Received: by 2002:ac8:4684:: with SMTP id g4mr4439606qto.140.1603487223498;
        Fri, 23 Oct 2020 14:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603487223; cv=none;
        d=google.com; s=arc-20160816;
        b=Wdf7nfl4jWOehA0CC7IkuxANp16+VvK0hTci5H8HO//CWiVfhXAcKWX3z591ntyL+n
         ouPRsObX+NtKezWqeIaB2p6XFiG2IZ8L5c6SRgppOBe/ZWRodWCuj2OyoLp3ysGIxXEe
         dlomJBuR0iyXqLT+DfsN3dahAxiFTVEm1fyqI3ZuNmkWNKat/WyNc7iPss6y8H7ZtCGS
         aRzzfAmcZOW/+EaiaFRmGterY7hvnl0NKSCWXBabO9H/zZeKv1lt4ov9XFvde54jCjLS
         ag1gGVWITMA1thFVGYiyte8gmLby+n2sWiVzxkocDGGJqTty0b3gTiIbNemXSLQrOEAh
         AF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :mime-version:message-id:date:dkim-signature;
        bh=BcWlM65XM0AJmQPnrbCqbi2frM12dvXHvxEJRRIHk+8=;
        b=LWooxZIq+vzC6GqtXndqWv1hWWT1ZYYfZK8TyuvyKCrPjmSKtYji3SW9ZAh96lx9Sr
         fNQpuPFY9xmbLFJFUHpXJh4uT/ZW32NmdnsBB205BR3XePpgi/CMgCsT+iiE6UWMnMQY
         J7vY9XbzizB2DJHzkcIr0E4Z175clyp1thR64zt0GyG1HKN/b88eLQ+8EgYSImWqzBrO
         zGLCxND+ilIPBd/3jgIeDH5KR+f4IsKMjQ2GeL2dkK4ls5Lc+nEIOD9zilPE2ZbfUaAz
         jIDJB8AmT5yUO3IZTPXhjB7b/Jh3CDz61W5phVhrdoYzQK7TfgkNftZnR1ejOEkvgPVB
         Ylgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=JZ8jWW5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si1354294qtq.4.2020.10.23.14.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 14:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=JZ8jWW5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kW4H8-0000cP-Ut
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 17:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34UWTXwsKCLwjumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com>)
 id 1kW4Gv-0000XQ-K6
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 17:06:49 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:53530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34UWTXwsKCLwjumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com>)
 id 1kW4Gq-0002CS-IV
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 17:06:49 -0400
Received: by mail-pl1-x649.google.com with SMTP id c4so2613300pll.20
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2020 14:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=BcWlM65XM0AJmQPnrbCqbi2frM12dvXHvxEJRRIHk+8=;
 b=JZ8jWW5W4XarKCgbfvEA4hbRO4uwMdFIV0HouWaz52ZIPRLmFIcwSqmFcaU5wf9Y/o
 TYVF7J+8kaTHn2hcK+Vj91F96QeWk4mbjQbdEE7yMeNWI6Ha9WJEku7fo93gZQiOjCA6
 yJc+yFMrCCOK8JtXUsPicg5e+EkHYGraitmR/3F0bUIa1Lv/nW9AA2iMl2ltlyuRt96D
 LWOynzOqwGOxRwpI7YCWGEdZEdhyE84MvNP7BbNuDqcAXxrqOKtdaUcdZ8FsnWTG9Ril
 bVC7pYUZ26bxV2pDeIWjx6N64GOXgRbXb7k2M86isBWqIcf0XtA2IUfCnLU9DTWTsl9d
 i5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=BcWlM65XM0AJmQPnrbCqbi2frM12dvXHvxEJRRIHk+8=;
 b=bLUxbclGMjrpM8uOfGayPjbF9T48mQFF4CurpV3bBBThipgNrpXJtBvJjeQxq8xtdi
 xyOeNdf/K3e8d2Da0gP1i6iF3QDe70cLo+wxzNQBAoBfmkaOXWkfxJJjaLNQboKQlkOq
 H/QxYYL+VjUmCP9FYAmTpJzvHCIFJ6HWfyOEC4oDBRXiamMAk4eELI8ccuNY4t0gSAPo
 hAFLbKNz0fN+ph5lK96ESO+owvku6UfruvinHtExQ84QpDcN7LK0CpetsZ/6QLT7I9oJ
 0hxpQsgq5MOZAQ2N2Gpg2IMm+xuJbAkIZjUPF/b8jpgrbAo5G/YYTqXXK/zFVlzHSWWm
 uMBQ==
X-Gm-Message-State: AOAM530nNM6do05DK2r8H2QpZ6ODQJJw9dlgXT9qZK+DPCCOl3K2YydY
 C9g1oQtIJ8PMJSdMvRN4nVumswmD821aYsup0g==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a17:90a:7f03:: with SMTP id
 k3mr528507pjl.1.1603487201189;
 Fri, 23 Oct 2020 14:06:41 -0700 (PDT)
Date: Fri, 23 Oct 2020 14:06:31 -0700
Message-Id: <20201023210637.351238-1-hskinnemoen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v3 0/6] Additional NPCM7xx features, devices and tests
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, venture@google.com, wuhaotsh@google.com, thuth@redhat.com, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=34UWTXwsKCLwjumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com;
 helo=mail-pl1-x649.google.com
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
X-TUID: GiIXYe1nv8am

This is an update to the initial NPCM7xx patch series adding

  - Watchdog timer support. This makes the reboot command work.
  - Random Number Generator device.
  - USB Host Controllers.
  - GPIO Controllers.

The watchdog was implemented by my new teammate Hao Wu. Expect to see more
patches from him in the near future.

This series has also been pushed to the npcm7xx-5.2-update branch of my github
repository at

  https://github.com/hskinnemoen/qemu

Changes since v2:

  - Watchdog timer test now uses libqos/libqtest.h API consistently instead of
    a mix of that and libqtest-single.h.
  - Made all npcm7xx-related tests conditional on CONFIG_NPCM7XX. An extra
    patch was added for the previously submitted timer test.

Changes since v1:

  - Dropped the timer test since it's already applied (thanks Peter).
  - Watchdog reset signaling is now using GPIOs instead of a custom API
    (thanks Peter for suggesting, and Hao for implementing it).
  - Various comment updates for the timer.
  - VMState added to GPIO device.
  - Missing VMstate terminator added to RNG device.
  - Include order in RNG test fixed.

Again, thanks a lot for reviewing!

Havard

Hao Wu (1):
  hw/timer: Adding watchdog for NPCM7XX Timer.

Havard Skinnemoen (5):
  tests/qtest: Make npcm7xx_timer-test conditional on CONFIG_NPCM7XX
  Move npcm7xx_timer_reached_zero call out of npcm7xx_timer_pause
  hw/misc: Add npcm7xx random number generator
  hw/arm/npcm7xx: Add EHCI and OHCI controllers
  hw/gpio: Add GPIO model for Nuvoton NPCM7xx

 docs/system/arm/nuvoton.rst               |   6 +-
 hw/usb/hcd-ehci.h                         |   1 +
 include/hw/arm/npcm7xx.h                  |   8 +
 include/hw/gpio/npcm7xx_gpio.h            |  55 +++
 include/hw/misc/npcm7xx_clk.h             |   2 +
 include/hw/misc/npcm7xx_rng.h             |  34 ++
 include/hw/timer/npcm7xx_timer.h          |  48 ++-
 hw/arm/npcm7xx.c                          | 126 ++++++-
 hw/gpio/npcm7xx_gpio.c                    | 424 ++++++++++++++++++++++
 hw/misc/npcm7xx_clk.c                     |  28 ++
 hw/misc/npcm7xx_rng.c                     | 180 +++++++++
 hw/timer/npcm7xx_timer.c                  | 270 +++++++++++---
 hw/usb/hcd-ehci-sysbus.c                  |  19 +
 tests/qtest/npcm7xx_gpio-test.c           | 385 ++++++++++++++++++++
 tests/qtest/npcm7xx_rng-test.c            | 278 ++++++++++++++
 tests/qtest/npcm7xx_watchdog_timer-test.c | 320 ++++++++++++++++
 MAINTAINERS                               |   1 +
 hw/gpio/meson.build                       |   1 +
 hw/gpio/trace-events                      |   7 +
 hw/misc/meson.build                       |   1 +
 hw/misc/trace-events                      |   4 +
 tests/qtest/meson.build                   |   7 +-
 22 files changed, 2143 insertions(+), 62 deletions(-)
 create mode 100644 include/hw/gpio/npcm7xx_gpio.h
 create mode 100644 include/hw/misc/npcm7xx_rng.h
 create mode 100644 hw/gpio/npcm7xx_gpio.c
 create mode 100644 hw/misc/npcm7xx_rng.c
 create mode 100644 tests/qtest/npcm7xx_gpio-test.c
 create mode 100644 tests/qtest/npcm7xx_rng-test.c
 create mode 100644 tests/qtest/npcm7xx_watchdog_timer-test.c

-- 
2.29.0.rc1.297.gfa9743e501-goog

