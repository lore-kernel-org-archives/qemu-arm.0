Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3017393lfq;
        Mon, 14 Dec 2020 16:13:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2ydvyOaCVr3TneoKDOJf2EQfpuouT8PxaJW22QetQ1Ms4RADP72yty1lus5WyHKFeAZ+s
X-Received: by 2002:a25:497:: with SMTP id 145mr36799403ybe.275.1607991218389;
        Mon, 14 Dec 2020 16:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607991218; cv=none;
        d=google.com; s=arc-20160816;
        b=rrfdma6u4P2x0xghO67ZjirbejPaFcv/mJP4ZdIiNvt8xG4vL14QioQZy0bii831Wh
         LbaNq8yiUXccYiEQW07NEVqeO4f9cL+xbCozxehuO0a7nJbS8/7PJcVIrqep/+DiRsTY
         nayPbBdYKUKmN/v0ebJ+s2nJHbblB9RpBSzY/8D4PuXJryMryCcwIFDo/P95y/YCipkN
         EIFS9OdHIN7vtLaXaLaoeLlTW+tOr9ikarJty9tG+vIouoPZ6t2899uUDZTaTa0jR20X
         EfCWXm5JsYGkVJr2GS10ULDgD13Cz+DCTckrEIxQdJqcU8DeZdsxnYxrVoh19S4m/aYS
         rYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:mime-version:message-id:date:dkim-signature;
        bh=S4tbciDLXdHnTTms2a/xfml3e34Cth0kvYsqk3Pk5rc=;
        b=KyqVGUhgWFu1tlHZsPknpGi9PyTrC36ISNPlpfQO3oPZ8I3js6EsCYFl/2YMWiC/HZ
         /VxCVk97yfBpGAZEPOgFAz21ESW7zqqtcNZnQ7BgnAppZndhhi8XhjwUHRtU6Z5ZO7Q4
         me6SZjeJ2v+tED4Zgqeg/6ELv7CWWF8S3QTpND6ATPe3Nvq3PUE++cgv679nRTbJaabM
         7bsDbQ/9gupZfRMHdQ2e8oSrHhaqncc8KwFZwwxXcdguHODeRV9rxD9fKKdMarnoAynn
         dhci41p1qj2sGudELIXoSGsQdJTZG+eFxrb5srn5fRRX9/12WrqRGJnvUsi2zpN5F7rM
         N/+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=mqrXxcqv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si13107334ybf.237.2020.12.14.16.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 16:13:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=mqrXxcqv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1koxyD-0000SC-LJ
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 19:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pP_XXwgKCAk53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1koxy3-0000S1-Ni
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 19:13:27 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:50738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pP_XXwgKCAk53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1koxy2-00036Q-7z
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 19:13:27 -0500
Received: by mail-yb1-xb49.google.com with SMTP id b123so6161488ybh.17
 for <qemu-arm@nongnu.org>; Mon, 14 Dec 2020 16:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=S4tbciDLXdHnTTms2a/xfml3e34Cth0kvYsqk3Pk5rc=;
 b=mqrXxcqv//E7MFcmfSkcGPEf7kI3/jmJVtCD57JtqiiUYzBKcbGcKnC1molhvlpOB5
 77hZVJ+dbHiy5cu+W/w5nnHRST0Xg1fZ2beuXiGRyilu75f4gcT5EZ6Gbi08FJlMByo0
 bwkrl8AVzHMDHRJ+SClQEywKC/58LJh2iEWi1AWN4Gxk1Xy7vMEBUXYKCK7KlQeHgu5R
 3DFFUyfxer1W6TAHeL6+KJ1h/oLkL9jvaMDEtZDYXBLU6K29SdcRZy7E50o2MmpBrtCn
 JRuRIHg+etxIXFk7JZYbBCJLTKcJLNFZh5RksfSCjHhZvk3qideA8J2K2vxLOxAMPfkj
 oukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=S4tbciDLXdHnTTms2a/xfml3e34Cth0kvYsqk3Pk5rc=;
 b=mJqB1agNgwjnMWCHp452wEMpl9KRZ7ITRQJcjUV0aiDktPltXP/eYBh+SNt6+/3xiG
 ZVn+LuRzp4WnDMweEIDpWygsOTbTCCOV+2lufOLdPUZuJrIddOshz9zBC8oIh07SYwiB
 JSgo2Ol2SP5iCMd5T1yr4p1xKYA1pAFRMBJhMSPnQZ5/4OUo/hkucnVyHBLdJdN2KgOt
 hcHJdTq6jnSWCIN3fqy/BfUSxaAfNp2D4ihUtStdkFPzhCczuZa5YyspQ7ZC5uCL1sEy
 w1ad8xWijdKt0b+JkXFZnJa9tv72AGjtitUw0dSkZ3pCTsrLblmjuBGhev8ZZAcs/50z
 bt2g==
X-Gm-Message-State: AOAM532Z2X6f+Kg4JdB7elZ9SZMVv152Q/6e4DLeV0d4Aqnt7/r6m2ot
 X3ViT3WQGR9Oxq5FUBhAQkikmyiy6QJ9Eg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6902:6d4:: with SMTP id
 m20mr12622634ybt.434.1607991204270; Mon, 14 Dec 2020 16:13:24 -0800 (PST)
Date: Mon, 14 Dec 2020 16:13:07 -0800
Message-Id: <20201215001312.3120777-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 0/5] Additional NPCM7xx devices
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3pP_XXwgKCAk53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 f4bug@armsat.org, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: szi+kzYfxSi0

This patch series include a few more NPCM7XX devices including

- Analog Digital Converter (ADC)
- Pulse Width Modulation (PWM)

We also modified the CLK module to generate clock values using qdev_clock.
These clocks are used to determine various clocks in NPCM7XX devices.

Thank you for your review.

Changes since v2:
- Split PWM test into a separate patch in the patch set
- Add trace events for PWM's update_freq/update_duty
- Add trace events for ioread/iowrite in ADC and PWM
- Use timer_get_ns in hw/timer/npcm7xx_timer.c
- Update commit message in ADC/PWM to mention qom-get/set method for usage
- Fix typos

Changes since v1:
- We removed the IPMI and KCS related code from this patch set.

Hao Wu (5):
  hw/misc: Add clock converter in NPCM7XX CLK module
  hw/timer: Refactor NPCM7XX Timer to use CLK clock
  hw/adc: Add an ADC module for NPCM7XX
  hw/misc: Add a PWM module for NPCM7XX
  hw/misc: Add QTest for NPCM7XX PWM Module

 docs/system/arm/nuvoton.rst      |   4 +-
 hw/adc/meson.build               |   1 +
 hw/adc/npcm7xx_adc.c             | 321 +++++++++++++
 hw/adc/trace-events              |   5 +
 hw/arm/npcm7xx.c                 |  55 ++-
 hw/misc/meson.build              |   1 +
 hw/misc/npcm7xx_clk.c            | 795 ++++++++++++++++++++++++++++++-
 hw/misc/npcm7xx_pwm.c            | 559 ++++++++++++++++++++++
 hw/misc/trace-events             |   6 +
 hw/timer/npcm7xx_timer.c         |  23 +-
 include/hw/adc/npcm7xx_adc.h     |  72 +++
 include/hw/arm/npcm7xx.h         |   4 +
 include/hw/misc/npcm7xx_clk.h    | 146 +++++-
 include/hw/misc/npcm7xx_pwm.h    | 106 +++++
 include/hw/timer/npcm7xx_timer.h |   1 +
 meson.build                      |   1 +
 tests/qtest/meson.build          |   4 +-
 tests/qtest/npcm7xx_adc-test.c   | 400 ++++++++++++++++
 tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
 19 files changed, 2964 insertions(+), 30 deletions(-)
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/adc/trace-events
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

-- 
2.29.2.684.gfbc64c5ab5-goog

