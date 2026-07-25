Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A92C531FC
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 01:01:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnQlR-0000jw-Bh; Fri, 24 Jul 2026 21:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnQTA-0006u9-Lt
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 20:42:24 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnQT8-0000li-Rc
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 20:42:24 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-5bf9466867cso313566e0c.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 17:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784940141; x=1785544941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GpP6K6XOW9VZewhGJQUbvmeL3eS+Fysiy0kTg3a2AfI=;
 b=T/wPmECOhg7WNtKjZ/Ep60U7M5AKTILtsPxmLHVKyyObTO93C+x38/eekIJVdd3w2N
 bA8MCTcuS4gfNIPKYerzueLh8g9sSzyCkYdUyCBN9YTGwjYep/WESMCEZY+B9ZnzwiUo
 I70W3ySjrXfkMQwnPbCWn3u4fyqgPeXov5NvAF1GpDWdE+6uF0Z2PA2a7o9r0irBIlbl
 P2vfJDl5fbPJLh22QswZjAKG5vMoRwvtVckRw/JuZugazNQhg5u34tdSK6YInd0Nss3L
 kIjj0lUVrwJBKI4plSeaEGW4IXG1JtWDo5sqXk3zuGX83SHW7o7T+Eg9L63eBSvFFi5F
 Ar/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784940141; x=1785544941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GpP6K6XOW9VZewhGJQUbvmeL3eS+Fysiy0kTg3a2AfI=;
 b=UUTK0fF0/hJnVVTnhESrUmPe4l+09DlVPeEUTvph6oYUShZF2+++GFXPWDc5UUFnsA
 fuzprOAGOocwtbb3UVK45O1qZh7VWpZJiKEDFSya0Wb+SQSgD5/ViBSpPxiPvvydh42+
 klzHlDT382wuhID92j5MCIrJNvgu+Bovr0WrESARovH66mFoJsvj/9Ly9Oqr/WEys13z
 DXZWGMG0sSi24aL2RRXd0Dmb+g/fjR7nWuje7FTa+WgiWWWi+fYP8eGhxm117zIQsOEO
 t3o+/Algb066E08r4iamnbMflDMfr+en2rgsadFa1hvniqjtkLDD3lEMu9xgKHW7gjll
 IuAw==
X-Gm-Message-State: AOJu0YyS2o3AWFTbBp/MJ+ZWk2EQi57n3HBCDoIMnYgzJlZ5poEZJmy9
 7tcqcPN4z7NID0zBXXVX5AYkxlQPPIMbPQluPVlhOtiBvZaHJlBjpy5y
X-Gm-Gg: AR+sD136dmQ9IwXDsFTddHHDRDTG6hHX+hf0PSN4bpi8Ot74xVYtbCWyKY6j9FhK49/
 ae8MEI8qO7LlAbpgBOpHViYZIi57IB5tmY+cog7zg/Knq7jcK9QDXGfcqon3gyjw0q18OseLAOh
 gcVFHff1aPGZ5Wpt2jl1b4ku+H0tdW2MFdrLBx0UfAXaraVjafqxoFPerrLpPe91k7NYHRGy6PH
 dyBvEVkbgjFO5ViB9FQfOtquOXFlMp+S5Xl8mnm1M+cTvH/phtYfILUaMhyQvQpFmLKKrrRC2xz
 NXz/yU7GMUT1B9VyP/MfdwzFA/e/IbmR/e6Z7Sg8Xk5KqI0bnES6W02/nDmplGUc7AtjapynAua
 1xyhkU9r4q6VVBaD2nCLiSZdZUL3ICIbOm9oAFUu0aINLXh7MhmnU7Vrn5KoZDmni/RcVl/RCsd
 9TQceLCESGQVN/wJSfefg4yESPxJ7wFg2W
X-Received: by 2002:a05:6102:15a1:b0:720:7e04:b306 with SMTP id
 ada2fe7eead31-7503e06a7d6mr791658137.5.1784940141061; 
 Fri, 24 Jul 2026 17:42:21 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-97774f12690sm930591241.12.2026.07.24.17.42.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jul 2026 17:42:20 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jason Wang <jasowangio@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 00/19] hw/arm/raspi4b: working PCIe and GENET (real networking)
Date: Fri, 24 Jul 2026 20:41:59 -0400
Message-ID: <20260725004219.66222-1-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 21:00:26 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This series finishes and fixes up Sergey Kambalin's "Raspberry Pi 4B
machine" series from 2024 (patchwork series 829638, [1]), giving
raspi4b a working PCIe Root Complex and GENET Ethernet controller.
Right now raspi4b has no working networking at all: it has no genet
and no PCIe, and while the guest's dwc_otg USB driver loads, it
never actually enumerates a device, so usb-net -- the path that
works on raspi3b -- doesn't work here either. raspi4b guests are
stuck without a network device out of the box.

Kambalin's series added the missing PCIe/GENET scaffolding (patches
13-15 and 19-29 of 41), but only the earlier base-SoC patches ever
landed; the PCIe/GENET/RNG/thermal patches were never merged and the
series went quiet after v6. This series carries forward just the
PCIe and GENET parts (RNG/thermal are out of scope here).

This series:

 - Rebases patches 13-15 (PCIe Root Complex + host) and 19-29
   (GENET stub through RX/TX/MDIO) against current master, adapting
   them to API changes since 2024: header paths moved under
   hw/core/, class_init()'s void *data became const void *data, the
   Resettable phases API replaced the plain DeviceClass::reset hook,
   and Property[] lost its DEFINE_PROP_END_OF_LIST() sentinel. This
   adaptation is confined to the patches that needed it (the "add"/
   "enable"/"stub"/"register ops" patches below) -- no functional
   change, just API updates to make the existing logic build again.

 - Fixes three real bugs found while getting an actual guest to
   boot and get a DHCP lease end to end (patches 15-17):

    1. A PHY autonegotiation-restart deadlock: the guest driver
       requests a restart and polls forever for an acknowledgment
       that a discarded FIELD_DP16() return value meant it would
       never get. This alone was enough to make the link never come
       up.

    2. RX checksum reporting stored the wrong value in the wrong
       byte order, making the guest reject valid inbound packets
       ("hw csum failure").

    3. TX ring activation checked the wrong register field
       (1-bit-wide GENET_DMA_CTRL.EN instead of the 17-bit-wide
       per-ring GENET_DMA_RING_CFG.EN), so only ring 0 could ever be
       seen as active; traffic hashed onto any other ring silently
       dropped, eventually tripping the guest's TX watchdog.

 - Updates docs/system/arm/raspi.rst (PCIe/GENET move from "missing"
   to "implemented") and adds a functional test
   (test_arm_raspi4_genet) that boots with the GENET NIC, confirms
   the driver probes it, and confirms the link actually comes up --
   which serves as a regression test for bug #1 above.

Testing: built and boot-tested repeatedly against both a vanilla
Raspberry Pi OS (Bullseye) image and a third-party product image
(SimRacingStudio's magicbox-os), and against the exact kernel/initrd
assets tests/functional/aarch64/test_raspi4.py already pins.
`scripts/checkpatch.pl` is clean (0 errors) across the whole series;
`tests/functional/aarch64/test_raspi3.py` and `test_raspi4.py`
(all three tests, including the new one) pass.

Sergey, I've CC'd you as the original author -- happy to fold in any
feedback you have on how the PCIe/GENET adaptation or the bug fixes
were done, and to give you a spot in this series' history however
you'd prefer if you'd like to be more actively involved in getting
it landed.

[1] https://patchwork.kernel.org/project/qemu-devel/cover/20240226000259.2752893-1-sergey.kambalin@auriga.com/

Marcelo Manzo (9):
  hw/arm/bcm2838_pcie: add BCM2838 PCIe Root Complex
  hw/arm/bcm2838: enable BCM2838 PCIe host bridge
  hw/net/bcm2838_genet: add GENET stub device
  hw/arm/bcm2838: enable BCM2838 GENET controller
  hw/net/bcm2838_genet: fix PHY autonegotiation-restart deadlock
  hw/net/bcm2838_genet: fix bogus RX checksum reporting
  hw/net/bcm2838_genet: fix TX ring activation check
  docs/system/arm/raspi: move PCIe/GENET from missing to implemented
  tests/functional/aarch64: add raspi4b GENET networking test

Sergey Kambalin (10):
  hw/arm/bcm2838_pcie: add BCM2838 PCIe host
  hw/net/bcm2838_genet: add GENET register structs, part 1/4
  hw/net/bcm2838_genet: add GENET register structs, part 2/4
  hw/net/bcm2838_genet: add GENET register structs, part 3/4
  hw/net/bcm2838_genet: add GENET register structs, part 4/4
  hw/net/bcm2838_genet: add GENET register access macros
  hw/net/bcm2838_genet: implement GENET register ops
  hw/net/bcm2838_genet: implement GENET MDIO
  hw/net/bcm2838_genet: implement GENET TX path
  hw/net/bcm2838_genet: implement GENET RX path

 docs/system/arm/raspi.rst               |    4 +-
 hw/arm/bcm2838.c                        |   15 +
 hw/arm/bcm2838_pcie.c                   |  297 ++++++
 hw/arm/bcm2838_peripherals.c            |   34 +
 hw/arm/meson.build                      |    4 +-
 hw/arm/raspi4b.c                        |    2 -
 hw/arm/trace-events                     |    4 +
 hw/net/bcm2838_genet.c                  | 1101 +++++++++++++++++++++++
 hw/net/meson.build                      |    2 +
 hw/net/trace-events                     |   16 +
 include/hw/arm/bcm2838_pcie.h           |   75 ++
 include/hw/arm/bcm2838_peripherals.h    |    6 +
 include/hw/net/bcm2838_genet.h          |  426 +++++++++
 tests/functional/aarch64/test_raspi4.py |   30 +
 14 files changed, 2011 insertions(+), 5 deletions(-)
 create mode 100644 hw/arm/bcm2838_pcie.c
 create mode 100644 hw/net/bcm2838_genet.c
 create mode 100644 include/hw/arm/bcm2838_pcie.h
 create mode 100644 include/hw/net/bcm2838_genet.h

-- 
2.47.1


