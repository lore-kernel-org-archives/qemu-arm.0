Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1876309lfm;
        Sat, 20 Jun 2020 16:07:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytvOrMSp0qOZE9sZqR3ErIvioQ+FeQ7qTS7RLoFhc7AfBPgBfCbKOMEx90VWY226jXl6pX
X-Received: by 2002:a25:9c88:: with SMTP id y8mr16361966ybo.317.1592694456741;
        Sat, 20 Jun 2020 16:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592694456; cv=none;
        d=google.com; s=arc-20160816;
        b=zMnYKI3WXepPW8rs7p1jXybLg6GLmV2m/zCa2NhVzA9ITPmFY7wSgUuInKedz5jmLX
         ZbZduFniS1GdbhjAyUWIVNwGs2Sp48xkC27ZdvAlKmtDJY1R8YQctEAxqh8yYgwlP5Cn
         1fFHul9MP0i3+xXevFIRo9gSFwH+9emMrrS0irS69K6uhknrhO6xNHV9LcyvvPrgaM8T
         xctisqKz+EmQ0yEnDBxtZUFqLsAn7ECkQUTMWIPJ0nCq7COf+gipKVm0B5uNO7IzHPjB
         +q+UknfHCCu8c0sZjBjH/A444h5qTlaa3wB9kT5g4/DfeVh7UPkj4rao7GNEmeeVMW3u
         zoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=VGwkKeB6tl+dGrbm6jHQLUZ5L3WbmR4JBPloevQDRIU=;
        b=wBBe/F3Ji8KiwYU7Z10AFseJLhcMqca0yCr4uVC8y0HTbJ9OSvsT+hzuCyRebMXXan
         nM81mTnzCLs2YAdW6PrS5EpAfkToxrp+pauuu47pJ+Bo6h1bpxDibkbebR5/BasTDpI2
         IV6h7vS9CkzufXYs/GKOScO5ykRzfP3Ub8hySWusGCwD5X3Lxdep1rTUxtEwduGKvpUJ
         5VUwlKjTgwKk16y4G7yoSWlahPRkkHrOwCYZwjCtbIL7Ph61H636VCnjFe3jSgHba3z1
         ddNRqSNlxZy/dR7cojRkIX8DZ30FiXN5XCfzj6r0vmyVF2G/7GiY3pU9klxHDRIWPxzQ
         iYxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i3bMEs68;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si9322501ybo.146.2020.06.20.16.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 16:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i3bMEs68;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmmaG-0006y6-3T
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 19:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmma5-0006x7-BW; Sat, 20 Jun 2020 19:07:25 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmma3-0002Ly-NM; Sat, 20 Jun 2020 19:07:25 -0400
Received: by mail-wm1-x344.google.com with SMTP id p19so1787390wmg.1;
 Sat, 20 Jun 2020 16:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VGwkKeB6tl+dGrbm6jHQLUZ5L3WbmR4JBPloevQDRIU=;
 b=i3bMEs68t7hIxPLU8I8EPOyTAYoj+PPKepJA2J7T6EhchaG6BEVyjbhCZDUP9iwh7u
 tr2GXFH48tr4Xol2F5J4lNhL5NiBOM9ra9PWybEgXKzFCYbnNzVkk2QxfwyBG4tKOR8W
 SbxMkzP+sgbY1NyWCQtCx5dGniCtxRK8hBruqsuZWuRPo3/qea6W8XaoKkqqmTjdYEsA
 9UFXnGw8ah3V5q0Ec4FpDr041NioxAelPTRKqvD7hhNJT4Kr2uTW2R9Dshqb+pyHMkmn
 HcaWqxhYia518QQzCb9rjKLrXC4C3UVvlrNdz0J2TN/usuGSP8lxYOFoua5nzM/snRlU
 mqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VGwkKeB6tl+dGrbm6jHQLUZ5L3WbmR4JBPloevQDRIU=;
 b=Hc2bj7/Km5BprXASbV7CXg/bIa7SiRVRhztuUiL0cGdkAenzm0eFuULJJuC6sP1els
 S665W4E5f2zp4Lgx2NzRutAIOtN6/2Z/Sot7VeUQomLdZ9nc2hSvaeggnK6lpQ+5unZU
 lu3cUS6U08LjzjH9wauwPYCionk5QASaseCL3eVGJYvKFCKv8m2x4Y1vrQyTSyy93jTB
 D1LnKv0HBiPSVwBbpl59YZZdZbv6yUNOZwxOConcie4OlwvGh93ti7MRFLUCEGXjvxqY
 k1aisUTxH/phy+9FXFHO9yyF6Jl84C66B5lMPe1AsLkl/XMgEyk6m9OAcPqOXsyY91Q9
 pUQg==
X-Gm-Message-State: AOAM5330K7fMlf/jZk04gLFOcxSNOde/8R8HOlowgMgO/7SuUDh+zQd7
 1S9qOlzuvC6PyB5lFNogXX3GAYlv
X-Received: by 2002:a7b:c441:: with SMTP id l1mr10041426wmi.7.1592694441819;
 Sat, 20 Jun 2020 16:07:21 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id o82sm11455037wmo.40.2020.06.20.16.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 16:07:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] hw/misc: Add LED device
Date: Sun, 21 Jun 2020 01:07:12 +0200
Message-Id: <20200620230719.32139-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtBlalq8u3kh

Hello,

These patches are part of the GSoC unselected 'QEMU visualizer'
project.  As the AVR port is not merged, I switched to microbit
to keep working on it.

This series presents a proof of concept of LED device that can
be easily connected to a GPIO.

Since v2:
- Rebased on PCA9552
- Model intensity to be ready for PWM use (Dave)
- Remove QMP events until we get a UI visualizer (Peter)
- Remove microbit patch (Peter)

Since v1: addressed Eric Blake review comments
- Added QMP rate limit

Next steps planned:

- PoC visualizer...
- look at using a dbus backend (elmarco)
- look at LED array/matrix such 7segments.

Regards,

Phil.

Based-on: <20200620225854.31160-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (7):
  hw/misc: Add a LED device
  hw/misc/led: Add helper to connect LED to GPIO output
  hw/misc/led: Emit a trace event when LED intensity has changed
  hw/arm/aspeed: Add the 3 front LEDs drived by the PCA9552 #1
  hw/misc/mps2-fpgaio: Use the LED device
  hw/misc/mps2-scc: Use the LED device
  hw/arm/tosa: Replace fprintf() calls by LED devices

 include/hw/misc/led.h         | 100 ++++++++++++++++++++++
 include/hw/misc/mps2-fpgaio.h |   1 +
 include/hw/misc/mps2-scc.h    |   1 +
 hw/arm/aspeed.c               |  17 ++++
 hw/arm/tosa.c                 |  40 +++------
 hw/misc/led.c                 | 151 ++++++++++++++++++++++++++++++++++
 hw/misc/mps2-fpgaio.c         |  13 +--
 hw/misc/mps2-scc.c            |  23 +++---
 MAINTAINERS                   |   6 ++
 hw/arm/Kconfig                |   2 +
 hw/misc/Kconfig               |   5 ++
 hw/misc/Makefile.objs         |   1 +
 hw/misc/trace-events          |   6 +-
 13 files changed, 321 insertions(+), 45 deletions(-)
 create mode 100644 include/hw/misc/led.h
 create mode 100644 hw/misc/led.c

-- 
2.21.3

