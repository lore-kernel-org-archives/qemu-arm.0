Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6270137njn;
        Mon, 20 Jan 2025 12:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVi8QU9WJImjMc30EUSpIxgpHqu+VjjK6gvg401hjPMzRmx3u5+9IE/zE7kA/nR1V0WlfbyH2rylWy/Xw==@linaro.org
X-Google-Smtp-Source: AGHT+IFO2E2T0Ya9JxjEfalMePwmSBC6CRdVdAdjYcAta7rLGOSkWkox6AhUZ+kq+pxJ4f4OP080
X-Received: by 2002:a05:622a:1482:b0:461:5571:5cc6 with SMTP id d75a77b69052e-46e12bdc810mr207946151cf.46.1737405504410;
        Mon, 20 Jan 2025 12:38:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737405504; cv=none;
        d=google.com; s=arc-20240605;
        b=e+q+J0s1F65ZLJX1sfvKG5WUVl2xcWu0YQ8hAb2rmKUSpZRyRNa1odjHhjDSIfRVK5
         o6lN8/03o0uPJpSQXcVIL99f/yfRHmqRl3cyTqZbYmp6m1TmZqV1L86A10ElTEFe5nV4
         hwVVQ/zh9ArCRdoathEbOV0z5MQt451MYl7UuOE+6ttazu2kjWBP4z/SwzPEnYEszilM
         OzyUu1VDbW8/go+N9JSwoaKO3pA7K023j1nae4bpCUtSoFQE2GkwQdBQ/jexS00M2D9C
         VhNP/g8EH3W1UcgrUu8fNmccyWlnPJqhiAVwdgI9MNSRQnH47OBiVSFNCwgMqEgb9hrE
         YJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yHdnso2wKLhJGy39niHBwSXyUymP5Vhg8CXLuihKfbI=;
        fh=M0HUSMsJRd8ijFLA/Ob1g9qmHHCrR7idUN14aDlkxMg=;
        b=FGXDsTOuLACZNoHaAhm3PjTezcQXLz/KXvGLPKgIj42WxDQu3kCCFzlY9GUtxE2i//
         GogjI4OTsBA1XehU/euL1WEOtT1w441yFi5DlUSTqFTIpoHju5dabeWrOOf7bPTbnJdU
         EXhsDiz/MfvB9B7Yko2tEEU5yrdrzOTV+W/WkxeOYs8KAx+OBUur85SObwG21qdI1mER
         7aOBytGNgywtwRWI3CemZgL6U5qVazUcfGkyS56azW5t+URRLm+yCXzyZ1nRNhkoFCbt
         N4uqh2SBHo9H8yhM5tLYidKBaaByIHuRSAcZLiGXQUOs/0Lfv7FStG0H4qX8y/QsmXm0
         g8ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lk6U+vO7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e10458daesi108870681cf.414.2025.01.20.12.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 12:38:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lk6U+vO7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tZyX9-0003r2-8S; Mon, 20 Jan 2025 15:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tZyX5-0003pT-67; Mon, 20 Jan 2025 15:38:03 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tZyX3-0002Td-6A; Mon, 20 Jan 2025 15:38:02 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so740016a12.0; 
 Mon, 20 Jan 2025 12:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737405478; x=1738010278; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yHdnso2wKLhJGy39niHBwSXyUymP5Vhg8CXLuihKfbI=;
 b=Lk6U+vO7mAB9HDiZONUyHfh2GljoQQo0KrS4OWrsk4P9pNwHESwl0FZVeNh5fUhkBI
 sue/v0YOOQHa04/fFG16deAYF5W/66S/5QTz4Q9ZaZcMst7PNw+S+EEdyUl49x9BA5wo
 Ll8DBdMFlsNp+61vNB+Ebv3RRjmXuUMLyGSlfiRishO2Jp8FIe4mEX/WH66mXYDQWuN6
 dPtHcj6z9rQ8pwcqkPedOiVmTSRBhr7P8snuac3NGsdzd06I6HmjxFZYai0zbDicA7sD
 CzXAoYlAyB+4izCMzkU6sbBQSfbxGidNJFTJ+1lKuujHTT2RCfQPJfP+9KHyg8JmoMmw
 OCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737405478; x=1738010278;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yHdnso2wKLhJGy39niHBwSXyUymP5Vhg8CXLuihKfbI=;
 b=i1gXp0O7++5rpD9YKhRQOfWdaF5QZD1lN+UiH8T3p+yJULtVQWZahXriDR5aBbIN7C
 IJihRCELvdl94auZlEVezIOIW4ehpDapAd2pSLtaNmHtyBDQKsmUGCSX46wH/jp16hoO
 UVpvJrh2JJgfAUkdjB747X5YHzUu6na+DzBbmZuKbtop2I96UqN5s5gAiwG9MzhORGsv
 WEDo/IBaAddu7c+I6HTaO7naAvLjsIhccxnUZ4A9hbFG4nDqczjf24MedezYfGFK1AAo
 2tr5SFw68Krf6BRdJSFzzHLid4TAki68cw6wPVk2LRwqzvnP5hK0fDWm//wFbOdi01tc
 uK+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfBjEiO9VdDHs78sCryehSd687Z5vA+eNStqtN3ta/9LkWaVFHMecEfesuB13ZuK26F0Rl+/rgmA==@nongnu.org
X-Gm-Message-State: AOJu0YxBfcqHYz+UMuh/nkFQjRy3k9wSAZICf8fTW92M160pZ9n66eTJ
 e4MshvOgBbZfFA6TeXu5FQN33x6sXx9mxHg9Pb3LVxdnp+rrs155S1Fg6+sC
X-Gm-Gg: ASbGncuTMrRtk7s84BGEj/enPYUcdUuGxJnkQQg+Gly9y2s1STNZFtstzn18IrD5lmf
 gVvmm5VIqyXVrIik6Bsc9LyyoraSWiuFDKIfuv8v1IdD5lN37nWY/q8UcxPlauLKMSI/kcv0sp+
 zCdh+ud9INgXnC/sxxtR8hdwzt5K5oL6uAdpiSK9iFDvjJnaOCIKY8wF7Er294UYuQBM7dsqgKq
 082p9+nJAX/wDObSu65h9A/vENBg6iFy1nowWP70ZLgNXFEpCANzIAa/1dmpCfP2/ptuNxwQkMN
 2Pd82Xmg6ZctDVzdCmGsRc2UVkOmSR3qMnQl0WwidsB5C91o4+8DRh1sDCij
X-Received: by 2002:a05:6402:3c7:b0:5d9:f402:16a0 with SMTP id
 4fb4d7f45d1cf-5db7d354846mr11432507a12.22.1737405477969; 
 Mon, 20 Jan 2025 12:37:57 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-181-102.77.183.pool.telefonica.de. [77.183.181.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db7364258csm6021077a12.1.2025.01.20.12.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 12:37:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/21] Add i.MX 8M Plus EVK machine
Date: Mon, 20 Jan 2025 21:37:27 +0100
Message-ID: <20250120203748.4687-1-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UOOiZdpb9YFD

This series adds a new aarch64 machine to QEMU: i.MX 8M Plus EVK [1]. It al=
lows=0D
for running Linux distributions such as Buildroot=0D
(freescale_imx8mpevk_defconfig) and Arch Linux [2] via direct kernel boot.=
=0D
U-Boot does not work yet. I plan to use this machine myself and I also want=
 to=0D
make it available to a bigger audience, so I propose to add it to QEMU. My =
goal=0D
would be to have it added for 10.0.=0D
=0D
The series includes the unreviewed patches of [3] and is structured as foll=
ows:=0D
The first four patches fix some issues in device models reused by the new=0D
machine. Patches 5-18 add the machine step by step which includes documenta=
tion.=0D
Patches 19 and 20 add some further device models that I'd like to use with =
the=0D
new machine. The last patch is a fix I created during debugging but I don't=
 rely=0D
on it.=0D
=0D
I've based some code on existing one (see "Based on" in file headers) and I=
'm=0D
unsure how to handle the licensing and attribution correctly -- advice welc=
ome.=0D
The TCA6416 emulation is taken from the Xilinx fork where it is used in som=
e=0D
cadence machines. Would the respective upstream maintainers be willing to=0D
maintain the device model upstream instead?=0D
=0D
[1] https://www.nxp.com/design/design-center/development-boards-and-designs=
/8MPLUSLPD4-EVK=0D
[2] https://archlinuxarm.org/platforms/armv8/generic=0D
[3] https://patchew.org/QEMU/20250111183711.2338-1-shentey@gmail.com/=0D
=0D
Supersedes: 20250111183711.2338-1-shentey@gmail.com=0D
=0D
Bernhard Beschow (21):=0D
  hw/char/imx_serial: Fix reset value of UFCR register=0D
  hw/char/imx_serial: Update all state before restarting ageing timer=0D
  hw/pci-host/designware: Expose MSI IRQ=0D
  hw/usb/hcd-dwc3: Align global registers size with Linux=0D
  hw/arm: Add i.MX 8M Plus EVK board=0D
  hw/arm/fsl-imx8mp: Implement clock tree=0D
  hw/arm/fsl-imx8mp: Add SNVS=0D
  hw/arm/fsl-imx8mp: Add USDHC storage controllers=0D
  hw/arm/fsl-imx8mp: Add PCIe support=0D
  hw/arm/fsl-imx8mp: Add GPIO controllers=0D
  hw/arm/fsl-imx8mp: Add I2C controllers=0D
  hw/arm/fsl-imx8mp: Add SPI controllers=0D
  hw/arm/fsl-imx8mp: Add watchdog support=0D
  hw/arm/fsl-imx8mp: Implement gneral purpose timers=0D
  hw/arm/fsl-imx8mp: Add Ethernet controller=0D
  hw/arm/fsl-imx8mp: Add USB support=0D
  hw/arm/fsl-imx8mp: Add boot ROM=0D
  hw/arm/fsl-imx8mp: Add on-chip RAM=0D
  hw/rtc: Add Ricoh RS5C372 RTC emulation=0D
  hw/i2c: Import TCA6416 emulation from Xilinx=0D
  hw/gpio/imx_gpio: Don't clear input GPIO values upon reset=0D
=0D
 MAINTAINERS                         |  16 +=0D
 docs/system/arm/imx8mp-evk.rst      |  84 ++++=0D
 docs/system/target-arm.rst          |   1 +=0D
 include/hw/arm/fsl-imx6.h           |   4 +-=0D
 include/hw/arm/fsl-imx7.h           |   4 +-=0D
 include/hw/arm/fsl-imx8mp.h         | 284 +++++++++++=0D
 include/hw/char/imx_serial.h        |   2 +-=0D
 include/hw/misc/imx8mp_ccm.h        |  97 ++++=0D
 include/hw/pci-host/designware.h    |   1 +=0D
 include/hw/pci-host/fsl_imx8m_phy.h |  27 +=0D
 include/hw/timer/imx_gpt.h          |   1 +=0D
 include/hw/usb/hcd-dwc3.h           |   2 +-=0D
 hw/arm/fsl-imx6.c                   |  13 +-=0D
 hw/arm/fsl-imx7.c                   |  13 +-=0D
 hw/arm/fsl-imx8mp.c                 | 736 ++++++++++++++++++++++++++++=0D
 hw/arm/imx8mp-evk.c                 |  74 +++=0D
 hw/char/imx_serial.c                |   7 +-=0D
 hw/gpio/imx_gpio.c                  |   1 -=0D
 hw/gpio/tca6416.c                   | 122 +++++=0D
 hw/misc/imx8mp_ccm.c                | 315 ++++++++++++=0D
 hw/pci-host/designware.c            |   7 +-=0D
 hw/pci-host/fsl_imx8m_phy.c         |  88 ++++=0D
 hw/rtc/rs5c372.c                    | 227 +++++++++=0D
 hw/timer/imx_gpt.c                  |  25 +=0D
 hw/usb/hcd-dwc3.c                   |   5 +=0D
 hw/arm/Kconfig                      |  25 +=0D
 hw/arm/meson.build                  |   2 +=0D
 hw/gpio/Kconfig                     |   5 +=0D
 hw/gpio/meson.build                 |   1 +=0D
 hw/gpio/trace-events                |   4 +=0D
 hw/misc/meson.build                 |   1 +=0D
 hw/pci-host/Kconfig                 |   3 +=0D
 hw/pci-host/meson.build             |   1 +=0D
 hw/rtc/Kconfig                      |   5 +=0D
 hw/rtc/meson.build                  |   1 +=0D
 hw/rtc/trace-events                 |   4 +=0D
 pc-bios/imx8mp-boot.rom             | Bin 0 -> 258048 bytes=0D
 pc-bios/meson.build                 |   1 +=0D
 38 files changed, 2195 insertions(+), 14 deletions(-)=0D
 create mode 100644 docs/system/arm/imx8mp-evk.rst=0D
 create mode 100644 include/hw/arm/fsl-imx8mp.h=0D
 create mode 100644 include/hw/misc/imx8mp_ccm.h=0D
 create mode 100644 include/hw/pci-host/fsl_imx8m_phy.h=0D
 create mode 100644 hw/arm/fsl-imx8mp.c=0D
 create mode 100644 hw/arm/imx8mp-evk.c=0D
 create mode 100644 hw/gpio/tca6416.c=0D
 create mode 100644 hw/misc/imx8mp_ccm.c=0D
 create mode 100644 hw/pci-host/fsl_imx8m_phy.c=0D
 create mode 100644 hw/rtc/rs5c372.c=0D
 create mode 100644 pc-bios/imx8mp-boot.rom=0D
=0D
-- =0D
2.48.1=0D
=0D
