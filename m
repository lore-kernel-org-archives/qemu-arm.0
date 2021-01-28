Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp144326lfo;
        Thu, 28 Jan 2021 03:42:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMsX2g8iOhzo/KLUtHfEyqmZQ/EHfyGvLwHo90iOsgiO1V4bIx3Djp3XJimaYh3I1tZZdY
X-Received: by 2002:a25:b683:: with SMTP id s3mr3975531ybj.442.1611834134679;
        Thu, 28 Jan 2021 03:42:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611834134; cv=none;
        d=google.com; s=arc-20160816;
        b=grPahswR6KdCBLLV+U5tf4iESX4kHJk4u/tbqTg1s2vRr1f5G59W4hIRNxIkoKWfBN
         mLp8JmUlCojORZDgpPxol7nr7IQQKIMNMfvICWKZhlfT8tcmx7GMOfujtAkPwOvA6HGY
         ucutTRLKGEK2tDtBCG0MB8MeeALMKl4FdqmGEmxrY1zvmvVoFKUE0hYYjOkjxOrPVeEM
         ucznHKsKc7Wqgegtf741ZJNv7YmlPcPaTjdL9hsKGL9s+YyUw4dEzrHYlQ6utfUrdYhs
         G4ZGTldhiztR67IAni+9rqQREGoh1brAWBgvdlf5HzJF/iyfBNmuaKL+gq2HDPTXMcKw
         3lTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=tTX7d0wTHyfDb3yHSiQLS5kIC816/PRSPI9pggN9uSQ=;
        b=n67Hk8Ul7dig53SltDEUe+pGq7uq9JKfOb88kWiVJR9OdzrsY1KRjvvPfgNuH5qdVk
         Z3LD9mc9DFBVkhElvoysbG5cWl4r2rIfyYaCYPeAKeoYFLM4RFM2oWjn8mh2J2ZnkPCx
         heWKcR6QGcVK42N3h/zzXq8Dak9s1PcoTuVxsVDsYCFy+m5a7S1IRmitH6pQrTvI58nu
         6bQ7utlTKqQ1taSiyrDQJi5GOiEBrHXm7CBNHUMi8CjzuBY7MOy+8pR+i1e2krBC3e6H
         VQu3h+ZhFugnzZIiMhA/gADsSYWHQbDZU78DpYHuo1yMs51BdWBwG6f4ueu9lQw1Om9X
         29Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U6h9mXlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e82si5805192ybb.115.2021.01.28.03.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 03:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U6h9mXlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55gj-00018E-R2
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 06:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gR-000186-E9
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:41:55 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gM-00064q-KY
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 06:41:54 -0500
Received: by mail-wm1-x334.google.com with SMTP id j18so4039509wmi.3
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 03:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTX7d0wTHyfDb3yHSiQLS5kIC816/PRSPI9pggN9uSQ=;
 b=U6h9mXlvHEa6Quw7+J/PAGFrFcbNXNCd6Pe+D1pOJAZ2r741RuJRmCRGM4I/tO15ve
 /1g1cN0l13+owNXOB+K/+dLAgTw/jljxnGQOOhCw/Ntuf/6bFQ3ATnDqNhrFqE5zkQLi
 63bcxtEZ5bC4uqv6WkHD29Z5MFb0WGdylyodKzj/MXynOVoMrQ2pR0g9sU/cV3AZtWwB
 buTPfsG4h37RxLqNP9JUR0EVHY/RNG4BI6zgvmTl/+qbbT0JwHOQ/nMVsZDGyLoO6LcL
 0KFG3e4j6qYV9/M6pGZQh3ZVkMtbBm4JxmIRY3ugi9Xboxl5lqVXnVfUAgUGW3h9KYJx
 ORxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTX7d0wTHyfDb3yHSiQLS5kIC816/PRSPI9pggN9uSQ=;
 b=R2d8pMJl/4VDPyvyAM9ogStfI0GKX91OaUIb/yYsBDmkyBNjPY0Kzg0UuKfWrXp5K8
 pJ4yUT05ZOG3NXdyA2+R16Yq2i7p4FDjCykSp276o49Ik/XYUm1hv4pg9R3NyA2M3iyO
 JlsNMbPeQn34MXn31l6oXjvFmBFqMHadO4YMidd+5wDfXNkYIqLB8jlQSlQBgQKmt17h
 E2+RCT7f6RReRtgs9bW0jc1MtDVsAQQ8gEUAm2QkBFiVe7LljIsMDZ4koD54g3PXx+hR
 VXjnGNTkSbqVDdYobl4+6LKQcH51s1V3jER+heVq4MYc8HwtQ6v43EOUMF0fbZZr4/ZJ
 1bPg==
X-Gm-Message-State: AOAM530lFnLe4CHHHbtrGxaBuj+sIWqsjFtvtyT5OrtUAqvfwxppdnuY
 1jLoDFRGsuhSO/V9THuRd73FBE0W5E4b8Q==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr8237331wmk.72.1611834108522;
 Thu, 28 Jan 2021 03:41:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/25] Convert CMSDK timer, watchdog,
 dualtimer to Clock framework
Date: Thu, 28 Jan 2021 11:41:20 +0000
Message-Id: <20210128114145.20536-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aeBtz9oNkyfx

This patchset converts the CMSDK timer, watchdog and dualtimer devices
to use the Clock framework instead of an integer property specifying
a frequency in Hz. The series is quito a lot of patches but they
should be mostly small and I hope easy to review.

The motivation here is the upcoming Arm SSE-300 model: this has a
new kind of timer device, which I wanted to write in the modern style
with a Clock input. That meant the ARMSSE container object needed
to know about Clocks, so converting the existing devices it used
to Clocks seemed like a good first step.

The series as a whole is a migration compat break for the machines
involved: mps2-an385, mps2-an386, mps2-an500, mps2-an511, mps2-an505,
mps2-an521, musca-a, musca-b1, lm3s811evb, lm3s6965evb.

v1->v2 changes (all very minor so I have left r-by tags in place):
 * in test cases, remove set-but-never-used QTestState* variables; gcc
   warns about these (I did my development with clang, which does not...)
   (patches 3, 4, 5)
 * in test cases, consistently phrase clock_step() arguments as calculations
   based on tick counts and the ns-per-tick value rather than just the final
   numbers (eg '500 * 40 + 1' instead of '20001') (patches 3, 5)
 * correct the forward-step amount when looking for periodic timer reload
   of the dualtimer (patch 5)
 * actually wire up the ARMSSE MAINCLK callback function (patch 22)

The only patch still unreviewed is 5 ("tests: Add a simple test of the
CMSDK APB dual timer").

thanks
-- PMM

Peter Maydell (25):
  ptimer: Add new ptimer_set_period_from_clock() function
  clock: Add new clock_has_source() function
  tests: Add a simple test of the CMSDK APB timer
  tests: Add a simple test of the CMSDK APB watchdog
  tests: Add a simple test of the CMSDK APB dual timer
  hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER struct to CMSDKAPBTimer
  hw/timer/cmsdk-apb-timer: Add Clock input
  hw/timer/cmsdk-apb-dualtimer: Add Clock input
  hw/watchdog/cmsdk-apb-watchdog: Add Clock input
  hw/arm/armsse: Rename "MAINCLK" property to "MAINCLK_FRQ"
  hw/arm/armsse: Wire up clocks
  hw/arm/mps2: Inline CMSDK_APB_TIMER creation
  hw/arm/mps2: Create and connect SYSCLK Clock
  hw/arm/mps2-tz: Create and connect ARMSSE Clocks
  hw/arm/musca: Create and connect ARMSSE Clocks
  hw/arm/stellaris: Convert SSYS to QOM device
  hw/arm/stellaris: Create Clock input for watchdog
  hw/timer/cmsdk-apb-timer: Convert to use Clock input
  hw/timer/cmsdk-apb-dualtimer: Convert to use Clock input
  hw/watchdog/cmsdk-apb-watchdog: Convert to use Clock input
  tests/qtest/cmsdk-apb-watchdog-test: Test clock changes
  hw/arm/armsse: Use Clock to set system_clock_scale
  arm: Don't set freq properties on CMSDK timer, dualtimer, watchdog,
    ARMSSE
  arm: Remove frq properties on CMSDK timer, dualtimer, watchdog, ARMSSE
  hw/arm/stellaris: Remove board-creation reset of STELLARIS_SYS

 docs/devel/clocks.rst                    |  16 +++
 include/hw/arm/armsse.h                  |  14 +-
 include/hw/clock.h                       |  15 ++
 include/hw/ptimer.h                      |  22 +++
 include/hw/timer/cmsdk-apb-dualtimer.h   |   5 +-
 include/hw/timer/cmsdk-apb-timer.h       |  34 ++---
 include/hw/watchdog/cmsdk-apb-watchdog.h |   5 +-
 include/qemu/typedefs.h                  |   1 +
 hw/arm/armsse.c                          |  48 +++++--
 hw/arm/mps2-tz.c                         |  14 +-
 hw/arm/mps2.c                            |  28 +++-
 hw/arm/musca.c                           |  13 +-
 hw/arm/stellaris.c                       | 170 +++++++++++++++++------
 hw/core/ptimer.c                         |  34 +++++
 hw/timer/cmsdk-apb-dualtimer.c           |  53 +++++--
 hw/timer/cmsdk-apb-timer.c               |  55 ++++----
 hw/watchdog/cmsdk-apb-watchdog.c         |  29 ++--
 tests/qtest/cmsdk-apb-dualtimer-test.c   | 130 +++++++++++++++++
 tests/qtest/cmsdk-apb-timer-test.c       |  75 ++++++++++
 tests/qtest/cmsdk-apb-watchdog-test.c    | 131 +++++++++++++++++
 MAINTAINERS                              |   3 +
 tests/qtest/meson.build                  |   3 +
 22 files changed, 756 insertions(+), 142 deletions(-)
 create mode 100644 tests/qtest/cmsdk-apb-dualtimer-test.c
 create mode 100644 tests/qtest/cmsdk-apb-timer-test.c
 create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c

-- 
2.20.1

