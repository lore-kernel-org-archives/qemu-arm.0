Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1644812lfd;
        Tue, 26 Jan 2021 11:33:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVr9jYk6cvJqZpud1/rnLx13qtXDewLW8/7LHxcfO9mcT2lpXMZycHFbBV7huCLoU1cPK4
X-Received: by 2002:a25:8307:: with SMTP id s7mr11808185ybk.219.1611689627152;
        Tue, 26 Jan 2021 11:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611689627; cv=none;
        d=google.com; s=arc-20160816;
        b=PqGq32UBxT12ICLYVtxeSOEOOjAIqnRvaCr/qnFcnrTQmVHfkP+oKuZUeT3PzHtanq
         rOrRBA33tezHt8V7hy9H8ozx0pHOpnDJZwxNz3VHJ8xrGssv76o/57DN5cvo4Cz9zIeH
         Du2gypJQ9Jy/CI7vfRQlQebgRd/DAkwCRsWSbpo+t6GPZn4zz1S1AMUdvPLAIlnJLFTw
         8AxqepvFoadQZQrBS8lFwZLahEeqj6DYR0Hvqeg1e47PoyQY2ZOH/Wc6iAROlzrYVz8K
         SEYVGHqwpLnhChplf47thdh0s7Ygm0V+8ULe9GWUzog/aGWjx7L1ZqwhTDddphq8Jj0P
         M4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:mime-version:message-id:date:dkim-signature;
        bh=/JN1lLN3S8bni2bQFj3ryjv5Yrpf4V6ED6Yz/THzn/I=;
        b=Tfd4YIiONlYEON0OQCo3sxVtMDlO/5N0bwVLuOWl1VkI9NHZKR0c2s2KraJThcGlrl
         GkzJLuFe4CGRq2PlgmczTG9Exm2ehlBLLSj/vbVZWfeamAsZYW8PMavriCAeARFQa9jz
         nUWoyQVnermpE9JRNE2YG+luSnMC2TUZf4PmAYAC0y2VZtFZ+wXCP5m7C7fNbA8IODIu
         j6H6943ouvQ1y40383EWk5AHovAqGhU8aR6e7npEinOwlhYDw6o+UCeg60OflJlos6rE
         qV8BImHhpOXDACy6RR58weeQZbotstKJPH7Um5ezxHv3eFVr/hBwbX1W/qOXCGPl9Pyw
         G6Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b="S/h35lyg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w143si22934660ybg.455.2021.01.26.11.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 11:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b="S/h35lyg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4U5y-0004WU-HF
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 14:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZG4QYAgKCIk97un165ut11tyr.p1z3rz7-n4z010t07.14t@flex--wuhaotsh.bounces.google.com>)
 id 1l4U5C-0004Uk-TV
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 14:33:00 -0500
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:34658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZG4QYAgKCIk97un165ut11tyr.p1z3rz7-n4z010t07.14t@flex--wuhaotsh.bounces.google.com>)
 id 1l4U59-00045z-M3
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 14:32:58 -0500
Received: by mail-qk1-x749.google.com with SMTP id v82so13237247qka.1
 for <qemu-arm@nongnu.org>; Tue, 26 Jan 2021 11:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=/JN1lLN3S8bni2bQFj3ryjv5Yrpf4V6ED6Yz/THzn/I=;
 b=S/h35lygBa8LOjiZFqhtQYoAExcr9YMxB/0ZxMAHF+umcEUt0SqPXOfJJZ5apslxBi
 aDZDK8K6aHB0waTBqJtUgv3GCG/KjAlI6aRcEDGVmN++p6FViJJ8ue5X3fOikRHFqlOt
 uPoWO9KwGOFOrfFJBJ38oZ/sCvSYJ4oMo6DKyaLhkZpTiUjihw6WZnhwaia6LDM21Elu
 zqOl3X8rm/CqJDU+lFtlGUWxhxQq3fIoDnF5bgO70n4LuiQjE+JJwCrduiVWNQI55FO6
 D+qCRf72MAAaNc9auWhzWz8XlnABgh8pDkuBcOo0AZGsCaL7YoUQJY3N7iO71xxIDIFI
 JXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=/JN1lLN3S8bni2bQFj3ryjv5Yrpf4V6ED6Yz/THzn/I=;
 b=VFB7HtHnTJaYP2aWv8ZNLKz5zYdwjbklyM2k+lfKYF4r2eX4UyMExjEKyuknJcTaWw
 x2zNC2Bz+J3z1YlKDN9u5rVGGagyHfYN17SFVpObzJJwJo3Ca4vowx+h6qEBOHYY03bN
 56oIk0Wrq4p3OzWSmROJbUIzcy/WpxWtBWsk8anPNELTnn2+ls60v1ANzaA2WBH9Zog/
 sRqkN+86sSU0OO9Brq/ItKczYyhOnNu+PLt2EkmM48ZKSyiTdFIJU9humBf4kf1XjLPM
 ttUKorIBfhjJls1nX5yJiZ5Q2KFj/xcceBN2OIk3G2bxiRCuGTTVPvdsn0D3uU0DQhSP
 pnWg==
X-Gm-Message-State: AOAM530NMihkEJJZaJupUgArb27xQ7GJ0uhbI9GjH4q1gLsrme8v6m+F
 U0OoV+Es/mFFZgIo0X33zPFt4kxzrbbj5w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:bf12:: with SMTP id
 m18mr7138242qvi.40.1611689572143; Tue, 26 Jan 2021 11:32:52 -0800 (PST)
Date: Tue, 26 Jan 2021 11:32:31 -0800
Message-Id: <20210126193237.1534208-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 0/6] hw/i2c: Add NPCM7XX SMBus Device
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3ZG4QYAgKCIk97un165ut11tyr.p1z3rz7-n4z010t07.14t@flex--wuhaotsh.bounces.google.com;
 helo=mail-qk1-x749.google.com
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 wuhaotsh@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: X78bw8uRYpuj

This patch set implements the System manager bus (SMBus) module in NPCM7XX
SoC. Basically, it emulates the data transactions of the module, not the
SDA/SCL levels. We have also added a QTest which contains read and write
operations for both single-byte and FIFO mode, and added basic I2C device
trees for npcm750-evb and quanta-gsj boards.

We also cleaned up the unimplemented GPIO devices in npcm7xx.c since they
are already implemented.

Hao Wu (6):
  hw/arm: Remove GPIO from unimplemented NPCM7XX
  hw/i2c: Implement NPCM7XX SMBus Module Single Mode
  hw/arm: Add I2C device tree for NPCM750 eval board
  hw/arm: Add I2C device tree for Quanta GSJ
  hw/i2c: Add a QTest for NPCM7XX SMBus Device
  hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode

 docs/system/arm/nuvoton.rst      |    2 +-
 hw/arm/npcm7xx.c                 |   76 ++-
 hw/arm/npcm7xx_boards.c          |   32 +
 hw/i2c/meson.build               |    1 +
 hw/i2c/npcm7xx_smbus.c           | 1071 ++++++++++++++++++++++++++++++
 hw/i2c/trace-events              |   12 +
 include/hw/arm/npcm7xx.h         |    2 +
 include/hw/i2c/npcm7xx_smbus.h   |  113 ++++
 tests/qtest/meson.build          |    1 +
 tests/qtest/npcm7xx_smbus-test.c |  495 ++++++++++++++
 10 files changed, 1780 insertions(+), 25 deletions(-)
 create mode 100644 hw/i2c/npcm7xx_smbus.c
 create mode 100644 include/hw/i2c/npcm7xx_smbus.h
 create mode 100644 tests/qtest/npcm7xx_smbus-test.c

-- 
2.30.0.365.g02bc693789-goog

