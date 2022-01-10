Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 3sm2676990ejq.159.2022.01.10.09.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 09:51:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4AEF41FFB7;
	Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  0/6] Basic skeleton of RP2040 Raspbery Pi Pico
Date: Mon, 10 Jan 2022 17:50:58 +0000
Message-Id: <20220110175104.2908956-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2DhvpvUO6TKw

Hi,

This is a rather incomplete and basic model of the Pico Pi that I
hacked up over the Christmas break. It took me a bit of faffing about
to get it up and running but as it stands it will now run the first
few hundred instructions of the RP2040 mask ROM before looping waiting
for CLK_SYS_SELECTED to update (which it never will as it is currently
unimplemented).

I don't know when I'll next get a chance to hack on it but I thought
it was worth posting as a reference. If anyone has an inclination to
take it further then at least the initial baby steps are done for you.

There is no rush to review this although I am curious if anyone has
comments about how the model is put together.

It uses -kernel to load the user program (although it never gets there
at the moment):

 qemu-system-arm -d unimp,guest_errors -M raspi-pico \
   --kernel ~/mysrc/pico-air.rust/pico-air.git/target/thumbv6m-none-eabi/debug/rp2040-project-template \
   -display none -serial mon:stdio 

Alex Bennée (6):
  hw/arm: arm initial boilerplate for RP2040 SoC
  hw/arm: add boilerplate for machines based on the RP2040
  hw/arm: wire-up memory from the Pico board and the SoC
  pc-bios: add pipico mask rom (!upstream)
  hw/arm: add mask boot ROM logic
  docs/devel: add some clarifying text for aliases

 docs/devel/memory.rst                   |  14 +-
 configs/devices/arm-softmmu/default.mak |   2 +
 include/hw/arm/rp2040.h                 |  39 +++++
 hw/arm/raspi_pico.c                     |  97 ++++++++++++
 hw/arm/rp2040.c                         | 201 ++++++++++++++++++++++++
 hw/arm/Kconfig                          |   6 +
 hw/arm/meson.build                      |   2 +
 pc-bios/pipico.rom                      | Bin 0 -> 16384 bytes
 8 files changed, 356 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/arm/rp2040.h
 create mode 100644 hw/arm/raspi_pico.c
 create mode 100644 hw/arm/rp2040.c
 create mode 100644 pc-bios/pipico.rom

-- 
2.30.2
