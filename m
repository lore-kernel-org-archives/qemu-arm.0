Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp70911njh;
        Wed, 28 May 2025 13:31:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWz0R2AiIzCQerWrM3oVPvGS00WLp3EwXXCSZ+kDrN9juLvnFSLt3pbHFNHOJjvC9cf/f7bmSsAC1VSA==@linaro.org
X-Received: by 2002:a05:6122:848e:b0:530:5226:a59e with SMTP id 71dfb90a1353d-5305226a64emr6035058e0c.6.1748464316155;
        Wed, 28 May 2025 13:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748464316; cv=none;
        d=google.com; s=arc-20240605;
        b=gDSqI51Gds6NzceQC0km8F2jZ6NT5+BdoQ6ieXFYAGQ/O991o4pudLRR1TH7wR5TXY
         UcD4HXSCTHKi9wusj60O2M0XIS1gMJ9NnhBCTHedHQKqAJ1CILdcBcmSCtFCoDb6WXnp
         BB+gB15d/9/Ob4qHEp1KrMM7es2nmVxbFT0/Y2CuPKPnWKf+VwDPlUBTC+geu3Y5c9MG
         MmjnTQc8zCVRZWHR7c2aKrtISnoUobpJerG0DWvMlEAU5WCoNmzN1LvFOdtiKt/yQWMp
         g26Ly90tJuNB/yyHvNnHN7vDX4PWYglfhdP4V51JiDpmQpwyDz4otG8MbUvCZrbm4tQL
         d4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=jXTDwR7pk9WsuiUd+vIU5n7dRKgQi6hQX7UWMGnJ2vY=;
        fh=e797D6GYGUmdXNdzzeolZjTw+G1qIYLKkca6WfpH6SI=;
        b=V4f9cPuxHRfiEdn/XKp9rDErdGidOLh0BJ0pRwsZCyUk1UJ5lsRR1X346oKzd0uNSl
         Q+R0jGWkIuiAB/4Xc7xYrC4kw84DSqSQOa3uRipl7FHf5wGu9bmHnYPS4dmA+Dmui3/l
         PaAEVW/mpDUAupoMLtaYFnYOw475Tbmf7t/6Oi2jufzmtZHwtXSlAiaxPtc4gcu3D3V0
         J2IBu0IPYuujzkIwcc7GVJmJFvD6WehOnZ7Uhwv5zXJHiLk6vVUT0sGmBClVsQkkRFKT
         FZUhj0s7yEtY7JIrorjf6jGwBh87tv/ZLWXipZfrzgVrLx+eqTOjPX1vyggsZDMt0A0D
         MUFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2dVeNzb;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 71dfb90a1353d-5306cf7aa0csor222273e0c.2.2025.05.28.13.31.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 May 2025 13:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2dVeNzb;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748464315; x=1749069115; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXTDwR7pk9WsuiUd+vIU5n7dRKgQi6hQX7UWMGnJ2vY=;
        b=O2dVeNzbYPHxKyOMmNu7XusBdoTpULuDmEIfD4RuP/PAeERCpzT5XFnKc3QXy0548A
         6mWVHZ3PgRUdnzDC69uHuflRL/DxI3M7q+IWLEuOl+5oAdRasAwA0A+rV/8YkvPhEiBd
         Ifq9fibTVJItUquzvgkQ+PzSATWBdCu8F8GUsLKSJHKEcUun7GPnYc+cMwEapz751pFX
         lRnq52hmw3ik0L6D1ur1kiqgmrUMlm+BmTUAgS1p5vw5UpCH0ar9FVCXIXlWf7NN2Axx
         4e4XXGCH6CayRgz/PDHs5ar5d+hs54oxWBqSjSTjQwtIM0CGr0pUsVJc+9V28fwzNS6v
         scmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748464315; x=1749069115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXTDwR7pk9WsuiUd+vIU5n7dRKgQi6hQX7UWMGnJ2vY=;
        b=kaky1dDt6IFMEml4G1FGIHFlK0RPRFYls1EUZPEFa4+pJpd2cwzgS52zfXgtBQ5BYC
         dQfER0VpT6rWPoVpvWT1mruT8e572xVIvVaKHhHVbUR58EzuTpFG2b+RhbQAIJC+ymKk
         g+XZL6eGY+wXPIsF1myUSNnKIJ1kCVb7kug/gauIAURO7E5ZAtjWizz8x2HczB3RhxbS
         owbkS525BosERVRmfRwgd7vr6YArahpL6EdJT7dC/xFwkRxLhvmbC9KGsmogwuBINbQX
         M6bEZu0LF01+Ew6gwfzKBB3d5Pz3563o/gWpHKTUG4W/eiND3ck5HB7aSFhHCw6S8y4m
         h8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXffksJxSMXZSg5pR0OZcEofUxz9gfNW/EW8F8j1mmJqL5R6MRBb3eKd/aK2lk2JfNqkf6AwbjVtL+Jxw==@linaro.org
X-Gm-Message-State: AOJu0Yzg7ihoAZsbLBnJ1TwAvMCG4VP7TLgL+cVeWFzPV8O8I4VPFGg3
	5US4m4ae0UOjrJ2xbqOtyrmEmkgjT+ztkUCY3U0GNYT+J3ltu76UeEZ6+ZvAfXieWoqZTg==
X-Gm-Gg: ASbGncsZ+SSP7pkTNplVeE3T80C+bejnZZm70ESUHp774HfF3aa9NZdHZ/NNB0grPgL
	XeOueQaGxufUDwyrRW3Gz33npbFI2I/KZb/h5X4nVN4rmchIyynzlVQNDchRAWI5NozZ1uXCCAm
	C4z+qONO3uy/PSrWXpzQxXSjvZHYI5nsZQMBqwADzksyehfomxgVzWbSmx3cnwJ+4q3jGuBvHse
	mO5P2Ctvjx1oJMtCUURtUbjIsvkbdvgd1ZbWfCplH49cpRqpSRr97PfPQu0xifZZsDj2+WJ+olF
	WmvYMA5osfI18arz5Cv7NoRiIIg7qQVPxI5Hla+1K+RDXhYHD6l4GKoar/6b7rI0F3WiQ9xF0yG
	yAOI8LBicjuGJpt9JHZpcBf0ZbOwtLz4B
X-Google-Smtp-Source: AGHT+IH7+pdPVUVbM+DljZpA4XTau9zkPij4FNcTrJoI3xLHYDK2UX4Sn8A6fU+T0yZ4xBnk6pYiGA==
X-Received: by 2002:a05:6122:a23:b0:520:3536:feb5 with SMTP id 71dfb90a1353d-52f2c5ab85emr15703239e0c.11.1748464315489;
        Wed, 28 May 2025 13:31:55 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066864d8esm1773050e0c.20.2025.05.28.13.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:31:54 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	eric.auger@redhat.com,
	berrange@redhat.com
Subject: [PATCH v5] tests/functional: Add PCI hotplug test for aarch64
Date: Wed, 28 May 2025 20:31:37 +0000
Message-Id: <20250528203137.1654964-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cClIb1KAs/Is

Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
hot-unplug on arm64.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                                  |  6 ++
 tests/functional/meson.build                 |  1 +
 tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100755 tests/functional/test_aarch64_hotplug_pci.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 7060cf49b9..818d7b9d5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2078,6 +2078,12 @@ S: Supported
 F: include/hw/pci/pcie_doe.h
 F: hw/pci/pcie_doe.c
 
+ARM PCI Hotplug
+M: Gustavo Romero <gustavo.romero@linaro.org>
+L: qemu-arm@nongnu.org
+S: Supported
+F: tests/functional/test_aarch64_hotplug_pci.py
+
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 52b4706cfe..2d68840fa2 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -83,6 +83,7 @@ tests_aarch64_system_quick = [
 tests_aarch64_system_thorough = [
   'aarch64_aspeed_ast2700',
   'aarch64_aspeed_ast2700fc',
+  'aarch64_hotplug_pci',
   'aarch64_imx8mp_evk',
   'aarch64_raspi3',
   'aarch64_raspi4',
diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
new file mode 100755
index 0000000000..2cf5c28b9f
--- /dev/null
+++ b/tests/functional/test_aarch64_hotplug_pci.py
@@ -0,0 +1,74 @@
+#!/usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# The test hotplugs a PCI device and checks it on a Linux guest.
+#
+# Copyright (c) 2025 Linaro Ltd.
+#
+# Author:
+#  Gustavo Romero <gustavo.romero@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_pattern
+from qemu_test import BUILD_DIR
+
+class HotplugPCI(LinuxKernelTest):
+
+    ASSET_KERNEL = Asset(
+        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
+         '20230607+deb12u11/images/netboot/debian-installer/arm64/linux'),
+         'd92a60392ce1e379ca198a1a820899f8f0d39a62d047c41ab79492f81541a9d9')
+
+    ASSET_INITRD = Asset(
+        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
+         '20230607+deb12u11/images/netboot/debian-installer/arm64/initrd.gz'),
+         '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
+
+    def test_hotplug_pci(self):
+
+        self.set_machine('virt')
+        self.vm.add_args('-m', '512M')
+        self.vm.add_args('-cpu', 'cortex-a57')
+        self.vm.add_args('-append',
+                         'console=ttyAMA0,115200 init=/bin/sh')
+        self.vm.add_args('-device',
+                         'pcie-root-port,bus=pcie.0,chassis=1,slot=1,id=pcie.1')
+        self.vm.add_args('-bios', self.build_file('pc-bios',
+                                                  'edk2-aarch64-code.fd'))
+
+        # BusyBox prompt
+        prompt = "~ #"
+        self.launch_kernel(self.ASSET_KERNEL.fetch(),
+                           self.ASSET_INITRD.fetch(),
+                           wait_for=prompt)
+
+        # Check for initial state: 2 network adapters, lo and enp0s1.
+        exec_command_and_wait_for_pattern(self,
+                                          'ls -l /sys/class/net | wc -l',
+                                          '2')
+
+        # Hotplug one network adapter to the root port, i.e. pcie.1 bus.
+        self.vm.cmd('device_add',
+                    driver='virtio-net-pci',
+                    bus='pcie.1',
+                    addr=0,
+                    id='na')
+        # Wait for the kernel to recognize the new device.
+        self.wait_for_console_pattern('virtio-pci')
+        self.wait_for_console_pattern('virtio_net')
+
+        # Check if there is a new network adapter.
+        exec_command_and_wait_for_pattern(self,
+                                          'ls -l /sys/class/net | wc -l',
+                                          '3')
+
+        self.vm.cmd('device_del', id='na')
+        exec_command_and_wait_for_pattern(self,
+                                          'ls -l /sys/class/net | wc -l',
+                                          '2')
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.34.1
