Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp715201njb;
        Wed, 8 Jan 2025 01:26:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9/OWFdZ2htxfPcb6EMVN90jYOCW3dJgk+b1xP7tYujSqu95T5ZNnWn5ZwAdznyIIwkpNjz71APcJq4w==@linaro.org
X-Google-Smtp-Source: AGHT+IG6RjgLVGfp+cGqP9lCE/JFuNBh+gdfzOekFRw8+FNbersR1FUIyVvhfNFFQaB/xGEP04F7
X-Received: by 2002:a05:622a:188f:b0:461:313e:8865 with SMTP id d75a77b69052e-46c710056a6mr30169671cf.21.1736328400761;
        Wed, 08 Jan 2025 01:26:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736328400; cv=none;
        d=google.com; s=arc-20240605;
        b=iGtoksdudYtpXk7OT4TgJUwlGZKFvNghbR0PIrunjz7s1qHvN8tCyX2an3QVS2r4oJ
         vWWKN03uaFrBYWtRvyOBnJ3cMmthC2/DTr75seRELlNxHkXgZ3h9zoRn5FTYrfubmQ1S
         qpxzpOFkGEwx3/WwIEop3s6ZClhu9dWNAg3raaZenzLS5eXQT7ehqLif6MrNs/0X7reM
         O6kAqQlMFZmeCafXxGqb8vrsz1hQ2qQLHgE6jxJJErsBRqDdCLB7uOvQgDAKUmf/7OAG
         XxpL4E/qL77i5vc1jyFyDs80hr9egSX7s8RX7mVxM7CJ7/vdLtfaULChLBEa1pW3ynCe
         BT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EbJAmmOYxoc1nbf2SceZRGqKmTWWmiM1s08mEm2FVGw=;
        fh=VNMM8itq1ZcX4v+LlbRGfctxqrD2Ru3NKwkgj/88YF0=;
        b=ER5GXNU1jtmyjtWou+WsRW4DHAOXMMpGvGG0CjtYkEeInQe1BXJrCGiGTxksLlhvwm
         yHTSq/f6rFed8ToZQqoeMVkhC3xYE9o2/3GUA33keaHS/Ye7k7orul/Q73qnTZ5quuhZ
         K5sMtzjlYnhhSL517N9i+Pk/9YsLW4mibxoJcjeiSZtHp6t5St/f+MwuRZgeX1wHJ+/T
         dCpgAF7xzuUfe6K3JGTpt2t5LnFTO+fb25n1KqRh/yHX7ekDI+CtCJ0rtmokQAwIJR2X
         8Ilvk7KBCw/Wj6fl+lZl6fyjwlwQdhY5Tk8IKkDqtX+i2w5guWtq7kKRaHwr3IRTI2sA
         BY/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Po1Idh/W";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebc60d3si454701591cf.481.2025.01.08.01.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 01:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Po1Idh/W";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tVSK9-0003vW-TU; Wed, 08 Jan 2025 04:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSK3-0003uW-9Y; Wed, 08 Jan 2025 04:25:56 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSK1-0004la-5G; Wed, 08 Jan 2025 04:25:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so4485218a12.1; 
 Wed, 08 Jan 2025 01:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736328350; x=1736933150; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EbJAmmOYxoc1nbf2SceZRGqKmTWWmiM1s08mEm2FVGw=;
 b=Po1Idh/WIe8hYog05Yuppf8iBeYyktoWEn1TRehlWDL1ZlvH+O0Pbn0ISgG9XHgD5j
 f5HzvmbwkhxUU8MFplmxJlsD09l12YOoLm2z4KxSv48v3+D/ax+M1LOTYbQ51+WGR91e
 SljDo+OKFzeRxa3GzKF+vrThvXavxlwRHL6O0rVv4EhyK8E6BrUhWpweGOIwfxGlmkfY
 NJtCF1e9IPaLA+Bc+2KCZU1O0AHRLE9lwTcKzkzqpLrvYJ7CzC/y2oMY14GEV8HO6c+D
 8TpOBWwAEQfCbPQdwShXWc/u/ZPM+OKba87AproRUjtVqc2nqpdOc+La6BtZeRbSE8ZQ
 ebxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736328350; x=1736933150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EbJAmmOYxoc1nbf2SceZRGqKmTWWmiM1s08mEm2FVGw=;
 b=kA8T/Y/caOQkhnVb/thyn376C0YXunUAaO1bXRux2FhxkKDXFFJBKVZXh2GhpiXMXG
 8+DgtAp+QneHrSqkkrH5tMpNvqzxHEZhpLmGZr6kDpQhsxq80248zcg5Pp8crIGVHJSx
 qV2dzsJ/l7GU2EfBl1vR0JogSXU8WOXw0zF0Ivm/06CGuYzjg2rbrVzUQAu4Sbf1QAIZ
 /RvV8SgdYbj5KisbQcHVo53/cTDtDvKLGjNY1n37g0LT62yeL3L1ssEYDmC56WgkTAnm
 HQJj2eQrfBp4vV2GAJyVhg/9H0T6BPJwoPyt6wugxxu4ou2KFeMOj9VBZ04kP8xNqMs+
 MczQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuUP6q/WKxIYtgzTzuGgtJ/514Slehnz/UOvLkladlksBkqO9aShW0iJb0/MQNJgif/mQIsXZWglNqYA==@nongnu.org,
 AJvYcCXrZThTowNU4KhEJinghhISSgCG/qFpu1/OE5WpBiao26VAs3ROlxk+kJW1L8g0WGxG1dUX+OARGg==@nongnu.org
X-Gm-Message-State: AOJu0YzuvxM8DiT3Ynzcgs8vSkvPOkNg53YWyNS3XjacEEIAeh964tf7
 bLzu1txX52u+jLBsaKvAF34T5lB95FJywzCm1sc+s9X060F3++BNFwW/9A==
X-Gm-Gg: ASbGncs66Eag4FKgtPgBTA7gj50aJ/sNnoIMLgeIeNtsDOyyXi7ujn7fgbqfqDnoNdp
 VTS/gHYMzILVnsrrwkGxjftDnZTqlTB3MZZEGZ8pHc+jTau2WkmEe3y25bneuQpUTrLEzC9aS91
 LBGjQJafOwV7CSRWwf727fnlWxp55CdG9O0b6S1SSE2tw/Eg8Xve6zSx0245g2trbTfpamtoRWn
 PyzoNW/KKqMwjtgMnVsqjl0sYoHMbCU7M/tLcBQPlelYJts9UKUj12qcC9SGJ5jPV/oIX04GUNE
 VKUy56ngC3AzvqJugrRnfBtPDjIkLfZLsDf8nc+xwFEYtWY=
X-Received: by 2002:a05:6402:518f:b0:5d0:abb8:79d with SMTP id
 4fb4d7f45d1cf-5d972e083f8mr1631901a12.14.1736328349533; 
 Wed, 08 Jan 2025 01:25:49 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-188-106-228.77.188.pool.telefonica.de. [77.188.106.228])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806feddfasm26116096a12.58.2025.01.08.01.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:25:49 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/14] i.MX and SDHCI improvements
Date: Wed,  8 Jan 2025 10:25:24 +0100
Message-ID: <20250108092538.11474-1-shentey@gmail.com>
X-Mailer: git-send-email 2.47.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NdBCgZogk5Z6

This series fixes some details in i.MX platform devices, improves SDHCI=0D
compatibility with U-Boot and modernizes some code.=0D
=0D
The first 6 patches are bugfixes 1/ resolving infinite loop in U-Boot esdhc=
=0D
driver, 2/ fixing a character echoing issue in imx-serial, 3/ fixing IRQ sh=
aring=0D
issue in Designware PCIe emulation, and 4/ fixing GPIO level preservation a=
cross=0D
resets in imx-gpio. The IRQ sharing issue is fixed using a new device type=
=0D
"TYPE_SHARED_IRQ" which is inspired by TYPE_SPLIT_IRQ.=0D
=0D
Patches 7 and 8 modernize SD card emulation by turning presence and=0D
write-protect GPIOs into qdev GPIOs and then further allowing the GPIOs to =
be=0D
inverted, just like device tree allows.=0D
=0D
The rest of the series is cosmetics including turning DPRINTF() into trace=
=0D
events which eases debugging.=0D
=0D
Bernhard Beschow (14):=0D
  hw/sd/sdhci: Set SDHC_NIS_DMA bit when appropriate=0D
  hw/char/imx_serial: Fix reset value of UFCR register=0D
  hw/char/imx_serial: Update all state before restarting ageing timer=0D
  hw/core: Introduce TYPE_SHARED_IRQ=0D
  hw/pci-host/designware: Expose MSI IRQ=0D
  hw/gpio/imx_gpio: Don't clear input GPIO values upon reset=0D
  hw/sd/sd: Remove legacy sd_set_cb() in favor of GPIOs=0D
  hw/sd/sd: Allow for inverting polarities of presence and write-protect=0D
    GPIOs=0D
  hw/char/imx_serial: Turn some DPRINTF() statements into trace events=0D
  hw/timer/imx_gpt: Remove unused define=0D
  tests/qtest/libqos: Reuse TYPE_IMX_I2C define=0D
  hw/i2c/imx_i2c: Convert DPRINTF() to trace events=0D
  hw/misc/imx6_src: Convert DPRINTF() to trace events=0D
  hw/gpio/imx_gpio: Turn DPRINTF() into trace events=0D
=0D
 include/hw/arm/fsl-imx6.h                  |  4 +-=0D
 include/hw/arm/fsl-imx7.h                  |  4 +-=0D
 include/hw/char/imx_serial.h               |  2 +-=0D
 include/hw/core/shared-irq.h               | 39 ++++++++++=0D
 include/hw/pci-host/designware.h           |  1 +=0D
 include/hw/sd/sdcard_legacy.h              |  1 -=0D
 hw/arm/fsl-imx6.c                          | 13 +++-=0D
 hw/arm/fsl-imx7.c                          | 13 +++-=0D
 hw/char/imx_serial.c                       | 65 ++++++++++------=0D
 hw/core/shared-irq.c                       | 88 ++++++++++++++++++++++=0D
 hw/gpio/imx_gpio.c                         | 17 ++---=0D
 hw/i2c/imx_i2c.c                           | 21 ++----=0D
 hw/misc/imx6_src.c                         | 23 ++----=0D
 hw/pci-host/designware.c                   |  7 +-=0D
 hw/sd/sd.c                                 | 39 +++++-----=0D
 hw/sd/sdhci.c                              | 11 ++-=0D
 hw/timer/imx_gpt.c                         |  4 -=0D
 tests/qtest/libqos/arm-imx25-pdk-machine.c |  5 +-=0D
 tests/qtest/libqos/i2c-imx.c               |  4 +-=0D
 hw/arm/Kconfig                             |  2 +=0D
 hw/char/trace-events                       |  5 ++=0D
 hw/core/Kconfig                            |  3 +=0D
 hw/core/meson.build                        |  1 +=0D
 hw/gpio/trace-events                       |  5 ++=0D
 hw/i2c/trace-events                        |  5 ++=0D
 hw/misc/trace-events                       |  6 ++=0D
 26 files changed, 280 insertions(+), 108 deletions(-)=0D
 create mode 100644 include/hw/core/shared-irq.h=0D
 create mode 100644 hw/core/shared-irq.c=0D
=0D
-- =0D
2.47.1=0D
=0D
