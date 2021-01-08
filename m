Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp749880lfq;
        Fri, 8 Jan 2021 11:10:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRr/F1rdJdlqmC5Zqn/3gW3WBx8PvjpM/IZtc+7srBY1fZvRdI1KXJbOWSd2pWQcrO1gK6
X-Received: by 2002:a25:2fc3:: with SMTP id v186mr7952399ybv.113.1610133052038;
        Fri, 08 Jan 2021 11:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610133052; cv=none;
        d=google.com; s=arc-20160816;
        b=xxZFHCj9n5sn7IpkajMr6bhuhizbWB7GWFeHBqCA+LCtG0FG68h4r41ZlShCqmAwQ2
         dAdNCLenCR6g+8nx632iQihKwr7og2azoqEfTRB6qUKQE9J/7dLvmsxCCiRfoineve3r
         Jms4kCkb+7J/Plol4iZXRQoIQM8YcP2Sfu1+ac43I3vmpRrM4uSYCEnnf4G6iph+491I
         cxEvRxoFJZbWf4ihH/Al+W/mpzvsgP8sFg+wG3vr/nYGmTdZJIfcXkQE79MS3sZ/Ts4i
         Jr4vd5+JWkV8FgEEMY67fpervbjAfKk8o+VrQyhCAQQIloD4kYp9sCZilFOl6OTPX9Aw
         AntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:mime-version:message-id:date:dkim-signature;
        bh=nHvdj59Ch2nmxrN2pE7SpwLDq8+oyR7alTPwtuKq8zk=;
        b=SzCqgS3y0WVJENolm6hXlsjXvb4kfibkPtccrQQsOLtgaD+xc2HWxMM4M3PttQ4Iyv
         /zOV62lbAsZjI7j6FjORX/xoOtP7vbVzoRLXXFYL0GRiAuzFY7E2quhlb9/HGGJHEzYV
         uZHG5rirDdyGfQrsxM7Pu/9E+1MFm3RKqCEMNO03V7lWDj9FnGwcZZN35zZimsJeGCj1
         VPog14DG421vbXVMEYNeBMyEoH+wBbZuv8ywqeOCEHefHZu6Ewu07ZoR/DcUWUM9k5W+
         RsJJT9j2eyDeFnv8ZKE10tU4vHMW6qkPOFUEF1rlzijAVd3nW57rZjrogks3MYEG4Qfh
         Ga3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=ICYEggsk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si9812357ybq.232.2021.01.08.11.10.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 11:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=ICYEggsk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:45686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxx9v-0000v4-F5
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 14:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Cq74XwgKCE8DByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9E-0000uj-2J
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:10:08 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:39922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Cq74XwgKCE8DByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9B-00078y-Kx
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:10:07 -0500
Received: by mail-qt1-x84a.google.com with SMTP id m21so4926305qtp.6
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=nHvdj59Ch2nmxrN2pE7SpwLDq8+oyR7alTPwtuKq8zk=;
 b=ICYEggskogiqhQPO+dRrONig2qf/wuOO6Hyfc5e8i0kweIMWAyMN4K7qkWN8hJj7gq
 Utk7DmX+Z3/0/BhjdzR08b0I2xtzySjRqJTB8leb6mosku6ON2QQkujw8LX7Ifr7mc4c
 YZ4FlatTebmWeSGZigPCzMJ0pINeKDpL8aedcYEqAyTSdy89Evq0/Vfgy+4NneDmmPgF
 YwRAgRDKVYr/vq+BBhctEK13SKVQxH6JVm0lQ/VNGKfySnlRBzJDLpIDYRR6AmFoS9Ry
 IpDd3u+ktPFmii23T/oFPCHc5UImQTalqHHXODzOVrCIyhkZF0NjDFMTWz0UlUj/4exh
 hjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=nHvdj59Ch2nmxrN2pE7SpwLDq8+oyR7alTPwtuKq8zk=;
 b=qiU9hg9bYL6zukV8Kwb5ukjbDYT4qXVpbG/hjWA8y+rgUnT1TPamwCiZ4hCxcNyqyw
 Ts9mSB2QS9xwuxjL36hMeawBlWYUJFLTwdGP82YNi7M64Eq6Aav2uz0oAtCG23/57KbH
 7TfsQhRrqqr8d4lqWtZNe3yQXdYfZw6L77AKlzoQ0eb812/I95jBvxMOEcBTCb/Z1kgs
 SP893BYE/pN/qUi1cWJo8MjiKkpLxx/GtO/UD+cG6ozX5Df4Uz1UlXCWVArtCgboYezs
 DzeFfuF9YZd4tXVMjpuMThLUVdOyaE5aYl6v+Prinu1UOthsC7LA6LZU6LqgLNgZvcub
 xwlw==
X-Gm-Message-State: AOAM533uj+XKSY+0rCRLY1qa/6acWTH5D6M5xQAiDt89Rv+hU1mJt+E5
 XvKfcqx8pgXUBQRrcrf/hiAi/9KJxRJKfg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:ad4:46cb:: with SMTP id
 g11mr4883888qvw.42.1610133002990; Fri, 08 Jan 2021 11:10:02 -0800 (PST)
Date: Fri,  8 Jan 2021 11:09:39 -0800
Message-Id: <20210108190945.949196-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 0/6] Additional NPCM7xx devices
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3Cq74XwgKCE8DByr5A9yx55x2v.t537v3B-r83454x4B.58x@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
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
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: dPmo/mx5Y0iz

This patch series include a few more NPCM7XX devices including

- Analog Digital Converter (ADC)
- Pulse Width Modulation (PWM)

We also modified the CLK module to generate clock values using qdev_clock.
These clocks are used to determine various clocks in NPCM7XX devices.

Thank you for your review.

Changes since v4:
- Use clock_ticks_to_ns to compute clock time in nanoseconds.
    (Didn't apply to PWM patch since it requires a frequency as output.)
- Removed reset_timer and resets immediately in ADC patch.
- Removed "qemu/osdep.h" from headers and include them in .c files.
- Use REG32 for register fields.
- Fix a g_assert that a guest can trigger with incorrect input.

Changes since v3:
- Use type casting instead of accessing parent object in all devices.

Changes since v2:
- Split PWM test into a separate patch in the patch set
- Add trace events for PWM's update_freq/update_duty
- Add trace events for ioread/iowrite in ADC and PWM
- Use timer_get_ns in hw/timer/npcm7xx_timer.c
- Update commit message in ADC/PWM to mention qom-get/set method for usage
- Fix typos

Changes since v1:
- We removed the IPMI and KCS related code from this patch set.

Hao Wu (6):
  hw/misc: Add clock converter in NPCM7XX CLK module
  hw/timer: Refactor NPCM7XX Timer to use CLK clock
  hw/adc: Add an ADC module for NPCM7XX
  hw/misc: Add a PWM module for NPCM7XX
  hw/misc: Add QTest for NPCM7XX PWM Module
  hw/*: Use type casting for SysBusDevice in NPCM7XX

 docs/system/arm/nuvoton.rst      |   4 +-
 hw/adc/meson.build               |   1 +
 hw/adc/npcm7xx_adc.c             | 301 ++++++++++++
 hw/adc/trace-events              |   5 +
 hw/arm/npcm7xx.c                 |  55 ++-
 hw/arm/npcm7xx_boards.c          |   2 +-
 hw/mem/npcm7xx_mc.c              |   2 +-
 hw/misc/meson.build              |   1 +
 hw/misc/npcm7xx_clk.c            | 797 ++++++++++++++++++++++++++++++-
 hw/misc/npcm7xx_gcr.c            |   2 +-
 hw/misc/npcm7xx_pwm.c            | 550 +++++++++++++++++++++
 hw/misc/npcm7xx_rng.c            |   2 +-
 hw/misc/trace-events             |   6 +
 hw/nvram/npcm7xx_otp.c           |   2 +-
 hw/ssi/npcm7xx_fiu.c             |   2 +-
 hw/timer/npcm7xx_timer.c         |  39 +-
 include/hw/adc/npcm7xx_adc.h     |  69 +++
 include/hw/arm/npcm7xx.h         |   4 +
 include/hw/misc/npcm7xx_clk.h    | 146 +++++-
 include/hw/misc/npcm7xx_pwm.h    | 105 ++++
 include/hw/timer/npcm7xx_timer.h |   1 +
 meson.build                      |   1 +
 tests/qtest/meson.build          |   4 +-
 tests/qtest/npcm7xx_adc-test.c   | 377 +++++++++++++++
 tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
 25 files changed, 2920 insertions(+), 48 deletions(-)
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/adc/trace-events
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

-- 
2.29.2.729.g45daf8777d-goog

