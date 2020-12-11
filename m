Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp237367lfb;
        Thu, 10 Dec 2020 17:54:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVBNBk/ed3w8noO1H3vMMsbOgGU8qjMt2hB9l6Kak8aeToFiBmn/0tplUD4ExVhXlv3v5m
X-Received: by 2002:a25:2054:: with SMTP id g81mr15717263ybg.178.1607651650620;
        Thu, 10 Dec 2020 17:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607651650; cv=none;
        d=google.com; s=arc-20160816;
        b=LoPSwaCSxV7cT1lObRPyU0Q09ouTVAmqB2SeVdedzrR3V6UK31VwXBZ3w9MoolSJOI
         zIpKk5R0GB1JnXFGx6dPIBk85pzXwSUJwCuWKHp/u5B3rKUUL0hEZpWIB6Px3cF+FBK9
         HJtIxYXKHk1CZVwG/E8oj/GRSE3O0laIjVhwvSG58Mv/NohlgsnMRH5ZTr2drr8Q0+gf
         aQsBgMneY9XMJ/PA17+iZw3Iph6bYls/YnMsZRLEOGwdPNGyw59xcvfxxOybGuRsj2kS
         24SklTb3/DQ052/tHN79+9BWSWDXAof9g/x2rY09q4vk0yug5WK4PKbKhFGLi3hMpKHV
         zXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:mime-version:message-id:date:dkim-signature;
        bh=miPXtkgbpQeWBxviBgCSwuVR4yhJikku+T4Gtrjg3Hs=;
        b=Id83zObZisfJb/zJaHjKEa6cbsdUIfob17SQS3AAgB0Wnn8Ut07PMcPzIFAuJDIQT3
         sCbKKzKnMxTZb2t7N/vujMkfyfqStOSbtCHAzDrMUh3BtX1KiUju08DWm2OBPD6+ukNT
         QwPXbGstmDzZ6kF2+gjZDwVQoFj8o6uBcwEA/PvwaF9mz0uGBlicdkkz1gvvmS1lganC
         2OAfU3HrclMzwqB+zVxfHok1PNNzOuQV2SdGDmIIKw0HM5ozO/4RCB50fdbNbm6RUyu+
         +QZGZeaTGtHubbXNZvBN4F58OQeKRsygqRQF2e4ZBNjfN2AR8OSB/Ei6LGDhetKj/qAl
         2kQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=WPAuAdmW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m126si7699861ybb.17.2020.12.10.17.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 17:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=WPAuAdmW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knXdK-0002cW-1e
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 20:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3yNDSXwgKCrkvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1knXbR-0001LI-9z
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:52:13 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:46707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3yNDSXwgKCrkvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1knXbO-00075o-Kd
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:52:13 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id k7so9145655ybm.13
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=miPXtkgbpQeWBxviBgCSwuVR4yhJikku+T4Gtrjg3Hs=;
 b=WPAuAdmWSbV1XA3W0r+bQa9A82YfOcO+nR8kmO6rb58Q8VnrQ/pGPlE3jtEJYS4G/h
 6iiasxrTalMKW8TFl5yxQV8EU/3CdZEcPogQ9CSSBjD5vOmNcTMo2EcvGofjAIyyCDTa
 XPwJI8eZrHKtbS7CCyRJiVh9SXZc6IJwitWwm6aaTfEM5+u2sETvwKwbVWBnTZxm6Uql
 vkY5QE/aon7dcs6dstl0iATvdNUMFVVT7kE3H1u4ShmxVADxbKSzwz/msnyId4sKj0x9
 QcrxUYNgjtDQcI/LIp4e1b6k5KGCGKdCFAqB/NbvmGZDHFaSX3ywnMCnXW9GXFscPkYr
 XqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=miPXtkgbpQeWBxviBgCSwuVR4yhJikku+T4Gtrjg3Hs=;
 b=YVv/4UWuoqMXGWG4epMiafZcXSuVrnQLoY3adi7ePpRDAnycU22kbdrbEkvqJOLeTg
 p9SpbhWGGpDcw5tQ4/jsMGDVQFevI09ZZsVTTvnIQLUwXZp6ZmhywJXZdTMcIXxOXPtE
 Safn/XtBt+pA4AKV1VRf5/Np/LKf0dNt/0GLhs390PYC0fc+Dc/+9p8G6z8eRAuwXEem
 x1eh98VoXmsXd1J6Vl7PgwEj+iPBPBgVSM8bY9UerVkYhYhMGn7lLsgxC7kADRTsCp/o
 hqyVkvqzDSMtce9ppUAT7fxdX1A5YsuJppbEjIRVANCDlYo5GO9QvWHsq/uRNpATWz3I
 QeMQ==
X-Gm-Message-State: AOAM533a+6mSxUUlvBScv335MDOOm8JSYnAkehmSY7H2D+MXh8u8biWG
 FywlOZ43uVscMyGJKXIG3KQtKMUp8rAskA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:9204:: with SMTP id
 b4mr15375502ybo.98.1607651528672; Thu, 10 Dec 2020 17:52:08 -0800 (PST)
Date: Thu, 10 Dec 2020 17:51:49 -0800
Message-Id: <20201211015156.2053372-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 0/7] Additional NPCM7xx devices and IPMI BMC emulation support
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3yNDSXwgKCrkvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>
X-TUID: xJhwSo/NPZJU

This patch series include a few more NPCM7XX devices including

- Analog Digital Converter (ADC)
- Pulse Width Modulation (PWM)
- Keyboard Style Controller (KSC)

To utilize these modules we also add two extra functionalities:

1. We modified the CLK module to generate clock values using qdev_clock.
   These clocks are used to determine various clocks in NPCM7XX devices.
2. We added support for emulating IPMI responder devices in BMC machines,
   similar to the existing IPMI device support for CPU emulation. This allows
   a qemu instance running BMC firmware to serve as an external BMC for a qemu
   instance running server software. It utilizes the KCS module we implemented.

Hao Wu (7):
  hw/misc: Add clock converter in NPCM7XX CLK module
  hw/timer: Refactor NPCM7XX Timer to use CLK clock
  hw/adc: Add an ADC module for NPCM7XX
  hw/misc: Add a PWM module for NPCM7XX
  hw/ipmi: Add an IPMI host interface
  hw/ipmi: Add a KCS Module for NPCM7XX
  hw/ipmi: Add an IPMI external host device

 default-configs/devices/arm-softmmu.mak |   2 +
 docs/system/arm/nuvoton.rst             |   6 +-
 hw/adc/meson.build                      |   1 +
 hw/adc/npcm7xx_adc.c                    | 318 ++++++++++
 hw/arm/npcm7xx.c                        |  65 +-
 hw/ipmi/Kconfig                         |   5 +
 hw/ipmi/ipmi_host.c                     |  40 ++
 hw/ipmi/ipmi_host_extern.c              | 435 +++++++++++++
 hw/ipmi/meson.build                     |   3 +
 hw/ipmi/npcm7xx_kcs.c                   | 570 +++++++++++++++++
 hw/misc/meson.build                     |   1 +
 hw/misc/npcm7xx_clk.c                   | 795 +++++++++++++++++++++++-
 hw/misc/npcm7xx_pwm.c                   | 535 ++++++++++++++++
 hw/timer/npcm7xx_timer.c                |  25 +-
 include/hw/adc/npcm7xx_adc.h            |  72 +++
 include/hw/arm/npcm7xx.h                |   6 +
 include/hw/ipmi/ipmi_host.h             |  56 ++
 include/hw/ipmi/ipmi_responder.h        |  66 ++
 include/hw/ipmi/npcm7xx_kcs.h           | 105 ++++
 include/hw/misc/npcm7xx_clk.h           | 146 ++++-
 include/hw/misc/npcm7xx_pwm.h           | 106 ++++
 include/hw/timer/npcm7xx_timer.h        |   1 +
 tests/qtest/meson.build                 |   4 +-
 tests/qtest/npcm7xx_adc-test.c          | 400 ++++++++++++
 tests/qtest/npcm7xx_pwm-test.c          | 490 +++++++++++++++
 25 files changed, 4221 insertions(+), 32 deletions(-)
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/ipmi/ipmi_host.c
 create mode 100644 hw/ipmi/ipmi_host_extern.c
 create mode 100644 hw/ipmi/npcm7xx_kcs.c
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/ipmi/ipmi_host.h
 create mode 100644 include/hw/ipmi/ipmi_responder.h
 create mode 100644 include/hw/ipmi/npcm7xx_kcs.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

-- 
2.29.2.684.gfbc64c5ab5-goog

