Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2772398njb;
        Mon, 12 May 2025 07:46:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGD/QRWUGYPK6QoGuXwdjfAdVZE3J+SBnhj7cTfTqsIjtNnc8JJeTpe30qvTP7gdxOoCZRvcd7yrztHg==@linaro.org
X-Received: by 2002:a05:600c:1c26:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-442ea0a09c8mr8384535e9.24.1747061204850;
        Mon, 12 May 2025 07:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747061204; cv=none;
        d=google.com; s=arc-20240605;
        b=iXe85Jqz7Bv1UJaGYjJ5oksj/GJP12nDPfpCFDtXcyN6A+/pSep89oTfYfqfQRKmJs
         1yXHhrRg7gVYKuEzHqiZ2LyK4ZwNoMumKRHHRKoLjUynLpfHmE9YH0OVVsKQUx31mtoY
         tLhkvDbFJvNgeL6kkHTM0r6loKdGCT91Rm0aVB+RIWWJhGnFyHsQxNentUmguavyotCx
         C7kQ+/JduGImNI+T66/SX6pAgmM5CmKrEqL5QpkfGcBXjDvC/2JiRccW93gz2yNwMQZ9
         sia+QfKOT5Jf0uKK9cWx6yH4T8eSIR8Pr3kIBRjHN5AmOa6A+fC+O6o6j56as3twHnoN
         K7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=YdI+i4zev0OQ7/OBo6IO5PLh4ziQxP2ot1AsLf6mhbc=;
        fh=SVU9LrTKGaX1V9eUZIJYvi6L/52NKANANAFFkyVjnnM=;
        b=llxQBrCTSQqdn5WpZs39VTZfb6Gtc/jmAikz26eWs9IH9xqYlNx2l+zN0SH7VDBNOs
         hhQBpTkeuBWQftRyyt4vOl9U9dhYm1ilEl2mvgdK3ibQlonTC13Hm0+eyHUfFP1aaIl+
         9uiMIopHa9yEleKZrWnNpqvNKhUL/uxv+CZ/GnGaf1TYEM0de/mlTx7RwhmdU6lGyUZC
         Is7No27NbCDRQmmpiG/ggwUQFi6TQbyZHL0MBS5/eREqcz540vox4eB4Vf/PsEkRtu62
         XgXQNCmrlKN5sU1ul9s4LSgALbLzoSwwiHSP7TVppHjn1XmNlGynmqT4KbuCpWypEQIp
         +CEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i3gueVM/";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d67d9a73sor29190805e9.1.2025.05.12.07.46.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 07:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i3gueVM/";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747061204; x=1747666004; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdI+i4zev0OQ7/OBo6IO5PLh4ziQxP2ot1AsLf6mhbc=;
        b=i3gueVM/AB/S2o+2+0WDdH+b/XESuZ4YkQ9TVObj8jOk8wbrp0UTex3os4uAQZT1Ij
         MVkc8TWmXgRAkBMwi+MkddMPBnRuSjBGlT1TD1xACdB+tFSKMZplJT+mPyjYTq8IIq73
         z8r1HC6rfCmvLSXCIQDJH9sipck0GEeWSJJ3DkUguaKgFc1elFNlyo+lSJcGCXjMjAW/
         B+kt6FRA5ZRMU7XhnBMbRShezSnaloeiyw5NRFPRzuVJLvbxoH7xLSeIxv1tLeTFKZJf
         o/xq7C9MGOWms5WsvkmsuCxsQn0uisk+p2H6LRmkRe8CpGhuWPi+cmk0D8YkojkH/9pj
         ywAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061204; x=1747666004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdI+i4zev0OQ7/OBo6IO5PLh4ziQxP2ot1AsLf6mhbc=;
        b=Aix/HEosNdfE8CmFCvP5faFyGJU+eufDOPeQlW+dPCSbZkApIIdxOwHnU/aHyNEnly
         hNa3SSPExuClce0AlQA6fMKG8fa+KVpgPYV3WHkXG26tPDfx7xhQ0MKyeHANngnyqrit
         NpCXtbJYpouMSrMyeJIDDML/vX+ILB+ABdlDCM7olF5gUH+Dqsp+xnLsUkt1Z+yJAaJ+
         SezPGTepe/mz35sR3RmMGavmiqS//GNJ/MU6WGMd9C/zIrfBuN07K0yb+zTbFQfmCrjs
         PHhkq6o9UfEtccoY+gY7ckdUcYHgj4O2S3IU2Z9Lh2yVTXF05yH8adVL0Gy03yHtiow6
         X2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa2b6XW13FiimhagQRRcg2+0VKgNsjszXQkm4yyXYpBkE7j0zuIel4QOd6NRaKMOZoqpY0TtFuENDpqg==@linaro.org
X-Gm-Message-State: AOJu0Yw+5w/HO9zRaKa4Rrw+VuMVERtwOIYRTcjT8SWPNyhVDhDa/zLq
	2Y27N/6yuXA6EmYmZYjKoi5RtGceo/6t5G+fm1p1hJaHHKP83BuO9W+JJCWjk2taBQ==
X-Gm-Gg: ASbGncuPgL/1TdIE8BPlGBopHX6QZyBsMP1oRCZ22zQ+eaVdaj1tlxmU6dHRIjsOXHw
	UQEnCFqhl9SAiYN7927GLS20Wae66kDXgHD2RS5DFuQT1RQVW99U+T/IUYIEkCwqORvDS4Gh7Gm
	GTd5cP60kktFU7Qvl5XWCe762PiPpsyxvROUKDXeYJxl+O6Op7uL6obpMqkZn7V0MUbL5YnBUl5
	qvJ1+kftf9WynBFjh3LFeZKrMkb2Qg4z/ntqHFm82PRBgwaBaIFl3kBvolLxRvMrcA5vbYp8DuH
	bHgSF/Yo9wSzQWmZ+Pv6c6LjDDSV+VLoaln47hEm6AJVN1H+06kUCqgFb9wqMhGAQwK+PWSpFTw
	MlIzDaseIkRPZQe+cmKkL09OsFrsvPcUq
X-Google-Smtp-Source: AGHT+IEJcNtepBTtSyidNPWfopTkNDkFWovfT5ZLmLhkGXOvIk00cQ0ltg5PYK7+UFqsTiggrnU14w==
X-Received: by 2002:a05:600c:3b84:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-442d6d44b30mr120675365e9.14.1747061204308;
        Mon, 12 May 2025 07:46:44 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from xps13.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d68585d1sm129173445e9.31.2025.05.12.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:46:43 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	thuth@redhat.com,
	berrange@redhat.com
Cc: gustavo.romero@linaro.org,
	eric.auger@redhat.com,
	alex.bennee@linaro.org,
	philmd@linaro.org,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4] tests/functional: Add PCI hotplug test for aarch64
Date: Mon, 12 May 2025 15:45:45 +0100
Message-ID: <20250512144629.182340-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: l5nGIpHp+gbA

Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
hot-unplug on arm64.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 MAINTAINERS                                  |  5 ++
 tests/functional/meson.build                 |  1 +
 tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100755 tests/functional/test_aarch64_hotplug_pci.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 23174b4ca7..9ebb768214 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2065,6 +2065,11 @@ S: Supported
 F: include/hw/pci/pcie_doe.h
 F: hw/pci/pcie_doe.c
 
+ARM PCI Hotplug
+M: Gustavo Romero <gustavo.romero@linaro.org>
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
index 0000000000..fa1bb62c8f
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
+         'current/images/netboot/debian-installer/arm64/linux'),
+        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
+
+    ASSET_INITRD = Asset(
+        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
+         'current/images/netboot/debian-installer/arm64/initrd.gz'),
+        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
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
2.43.0
