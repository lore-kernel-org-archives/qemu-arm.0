Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937F1C53219
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 12:43:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnbiA-0001hN-37; Sat, 25 Jul 2026 08:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnbi7-0001g9-WE
 for qemu-arm@nongnu.org; Sat, 25 Jul 2026 08:42:36 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnbi6-0003fy-3W
 for qemu-arm@nongnu.org; Sat, 25 Jul 2026 08:42:35 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-5c2c46a428eso679591e0c.2
 for <qemu-arm@nongnu.org>; Sat, 25 Jul 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784983353; x=1785588153; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZB555McfnQPFCXMbzltUOSbJRXRLt+utNLXm0g8P3Lk=;
 b=BZqiPCF5LPkkBn4cXL4flMBPSxJBZgBWHYoL2V+qyhjkGMFG2l4CGzvxvsmQOSJbMt
 HoizG28b8y+DmxQT5vIB7twhdCCkUZpszY0exQfat3ceqkI/1aGts7FxeR9X4xGK1TVO
 S1H2xQK+hQF/ihxV+li/tNAKBHzyv45+yApJkqXfWgsd3S0XiDrTxqsr9b6zCMfAxPIC
 216XgbZ6Vp9Ejm+VXrXkTl4uk62jOTMQEe1a2defW700/GI1jVYoMbUtQGjCqCSKNZBg
 xfOb3rWr2/fCfvdqtRKPgs3zS8hsaZkAggliFLwrSCUI6AjtNwUyOVOfr52Mkz7T6CKi
 yphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784983353; x=1785588153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZB555McfnQPFCXMbzltUOSbJRXRLt+utNLXm0g8P3Lk=;
 b=ITDrm29BzJ/P5rHKs35ZzsLXykXHrCfEQfefpZcgJ/gjpvpz2l2lFkRd09SQXURDrB
 5IBJPyn0eUQbHfdcBDdAQkVBGGbowVY74oJSwXuI0BEljyXI5oP2HFrqgwFf54X0J3lk
 RR9Km7xNPwirh6ZwnaqZPcd34hw7Zi6habi+TpNHOr8thQarXTpsvuHapKKKrkRpjWae
 P0QCwJPelJZ0RXeK/v6Y/FxfdJQjjJVzx481R0hCIgESJOX1ojrBMeVwXZXDnoZpQway
 4JWr284Q9PPYpcSzxAWc9P9z8YRq9YqZlgi34i8co1zZFE7UhnLNv5hip2Xi/NiXiguS
 zJ0Q==
X-Gm-Message-State: AOJu0YxrqZxe9mLk4bIm3p1juWxB+1/MVJaeCIup5QBqZUjVwFiVqamL
 AJNK+TnZZzE7gcPCk+hrj4IkjLi/Hxcwz7mkTpvXxmBlFwV5sMbvTtir
X-Gm-Gg: AR+sD11z1idRDQh/u1wGMCjBacgcowKIVjt6XdxS3SYePYaJwEAI3BkSTiGJPQOZVAe
 K4GhqO0OH+W61FllmDP1acc5uiY+z3u1k+Pi+n+iJcbabABpiaiHGaz2SIysiF22q3bOBMt7257
 SAHn53/pLgQtQu8vOGBKWht2cirIDMn4/w8J5QYIAOU7fedvfLPCmiKBKGUF1Uiw+RC4Z1Nl7db
 oRPc0RIs1MCer7HO3Ub05UUJmwIW95jLC9jE0+7JoenMm6l6AlR+TO9Ip87922EMd1dV/SRaQ7S
 5+gEYamFpPuYDI9LSgZhFfUaTx/CZbva2yddF3z8MNNbJs1ODDW3WeoHTck3enbOisx3O19uIog
 BXNsDnsnjPLtUHEcKUVxWCD1LBcBWUrPuZxB9BzweKCADqQO3HMAyeUnKXdnk5ZLeGSCqYbkY20
 0uj9qm0FqLbalsFVepQdFVFdS8QsTNTg/F
X-Received: by 2002:a05:6122:4b13:b0:5bd:a810:b090 with SMTP id
 71dfb90a1353d-5c306c14f37mr1085947e0c.5.1784983352915; 
 Sat, 25 Jul 2026 05:42:32 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c305734410sm1457106e0c.16.2026.07.25.05.42.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jul 2026 05:42:32 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 0/2] hw/arm/bcm2838_pcie: make PCI device enumeration work
Date: Sat, 25 Jul 2026 08:42:29 -0400
Message-ID: <20260725124231.86233-1-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Follow-up to "hw/arm/raspi4b: working PCIe and GENET (real
networking)" [1]. That series got the PCIe Root Complex link up and
GENET (a plain sysbus device, not PCI) working, but nothing in it
actually required a guest to enumerate a device *on* the PCIe bus --
so a real gap went unnoticed until now: attach anything to
raspi4b's PCIe port and "lspci"/"/sys/bus/pci/devices/" come back
completely empty, even though the link itself is up.

Root causes, all on the same host-bridge config-space path in
hw/arm/bcm2838_pcie.c:

 1. bcm2838_pcie_host_read/write computed
    "offset - PCIE_CONFIG_SPACE_SIZE" on an unsigned hwaddr, which
    underflows for every offset below 4KB -- i.e. the root port's own
    config space, including vendor/device ID at offset 0. Every such
    access fell into the "out of range" branch and read back as
    all-ones ("no device present"), so the guest's PCI core gave up
    immediately.

 2. pcie_host_mmcfg_init() was never called, even though both
    accessors dereference the MemoryRegion it sets up to service
    EXT_CFG_DATA. Fixing (1) let the guest reach that path for the
    first time, which then dereferenced an uninitialised region.

 3. The root port overrode PCIDeviceClass::config_read/config_write
    with plain pci_default_*_config(), bypassing
    pci_bridge_write_config(). Bridge memory windows were therefore
    never actually programmed, so BARs behind the root port stayed
    unreachable however the guest wrote them.

 4. PCIE_MMIO_OFFSET (0xc0000000) was defined in
    hw/arm/bcm2838_peripherals.c for exactly this purpose and never
    used -- grep count of 1, the definition itself. The PCI MMIO
    window was mapped straight onto the ARM address with no
    translation, even though the DTB declares CPU 0x600000000 as
    mapping to PCI 0xc0000000. The guest ended up reading PCI address
    0 where a device's BAR should have been.

Patch 1 fixes all four. I want to flag why they're one patch rather
than four: I tried splitting them during development, and every
subset short of all four either changes nothing (dormant bug) or
produces a kernel panic that doesn't happen on unfixed master (wrong
BAR content, alignment fault in a driver's MMIO access) -- worse
than the current silent "no devices enumerated". None of the four
are a coherent, independently-safe change on their own.

With all four, a PCIe device is enumerated and its driver binds:

  xhci_hcd 0000:01:00.0: xHCI Host Controller
  xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
  xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed

This is not a complete PCIe implementation. The BCM2711's own MSI
controller is not implemented -- the guest driver programs it
correctly (visible as BRCM STB PCIe MSI vectors in
/proc/interrupts, permanently at 0 count) but QEMU never delivers
anything, so a device that only signals via MSI/MSI-X never actually
gets its interrupt. INTx works. Patch 1 documents this in
docs/system/arm/raspi.rst; patch 2's functional test attaches its
xHCI controller with "msi=off,msix=off" for the same reason. I
plan to look at the MSI controller separately; wanted this
enumeration fix to stand on its own rather than block on it, since it
already turns "no PCI device is usable at all" into "PCI devices
using INTx work".

Tested against real hardware, not just the emulated xHCI: with a USB
serial device passed through to the guest via QEMU's usb-serial
device pointed at the real /dev/cu.usbmodem* port, a real serial
peripheral connected to my Mac was reachable from inside the guest,
byte-for-byte identical to reading it directly on the host.

checkpatch.pl is clean (0 errors, 0 warnings) across both patches.
All 4 tests in tests/functional/aarch64/test_raspi4.py pass,
including the 3 pre-existing ones (no regression) and the new one
added here.

[1] https://patchwork.kernel.org/project/qemu-devel/cover/20260725004219.66222-1-marcelomanzo@gmail.com/

Marcelo Manzo (2):
  hw/arm/bcm2838_pcie: make PCI device enumeration actually work
  tests/functional/aarch64: add raspi4b PCIe enumeration test

 docs/system/arm/raspi.rst               |  2 ++
 hw/arm/bcm2838_pcie.c                   | 45 +++++++++++++++----------
 hw/arm/bcm2838_peripherals.c            | 16 +++++++--
 include/hw/arm/bcm2838_peripherals.h    |  1 +
 tests/functional/aarch64/test_raspi4.py | 37 ++++++++++++++++++++
 5 files changed, 82 insertions(+), 19 deletions(-)

-- 
2.47.1


