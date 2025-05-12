Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2758306njb;
        Mon, 12 May 2025 07:23:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQYqhqMeSQs8hYm+m2s5w5m3DARyCzSiNquAXuwEYPKoLA7E0PZjU1IWVJeqlMXDM9Hd39ccglW7uJcg==@linaro.org
X-Received: by 2002:a05:6000:2dc4:b0:3a0:b1f7:c1e9 with SMTP id ffacd0b85a97d-3a0b98fcd85mr15625989f8f.1.1747059828945;
        Mon, 12 May 2025 07:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747059828; cv=none;
        d=google.com; s=arc-20240605;
        b=UmDE7OzEjmwvsuw5yKe86++eyniu7yDOHYfuxLrZRg/jaueFxjrJ4tODX0FFWNmzjw
         Q2W1eY90oh6vjbSKM15skOeEalKBc2afb24eahu2xnGzNWgWJ12Nl8uaZQxZ7UQxfOcz
         rHsRJFCbW4z7fEtdSL+Z9/acpxGVzOMKnbvgKNUuOOVH2mWAcUZI7mO1P552fAY0hA3D
         4TRTpGj4nTaInNG0D0px6xI2NnbwUuVEEDrRMb1OALUxss30KA4RvmtVTRwDFyu4M2in
         MHRYcqSWvFTnwZKsA0yNtZdeaUWQra16XbtQGmaD8azZMqlFYPl+dg886KCdSzFBXRH+
         BDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ZoyqA4/3ub1McfI/VtMSnnTsDusnutY8ftzaVytS2Ck=;
        fh=ahtsxHC71WPcZ9bMM+HoC+7mBbVpWE33lcf7Mn2nM40=;
        b=j83gMmjG3UOXuJm7d7yeY6EjNS6GmdjjiAeAauCKByZ8Uq7Z3sVuSSkYIGw9RwkNXX
         GnxlMuCwfliEeObfxBWdhpchDAdF4CbVIAbd40NEEc7qeDiwAOGxcYK3rd8qEQT2YB6H
         eiEAAaxy3z8wpJSUoZ+Z/wt1PDIfB6ULC2Od4z7jYbjddG+EoQooGVpAo1z4X/olt3ll
         uAIGJj+x0Y0JyLuAIZ5fC4kjJaglSMx8fyOVvvVnH/N1kZ1BKI52KmxxAX1TAmRo/7cx
         05v/YO0CEoTJHqwWM519uNwhC16LVsTUsA62AZWLDhZktEgOOp4LJ9rdi00/yhvCAIoz
         valw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RFthGxQq;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a2078deb16sor440399f8f.3.2025.05.12.07.23.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 07:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RFthGxQq;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747059828; x=1747664628; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoyqA4/3ub1McfI/VtMSnnTsDusnutY8ftzaVytS2Ck=;
        b=RFthGxQqrBnzgSb4Yxlx4SF0Xnk3rn6o2VnAsD18gfbmagWCMhW+0WJSFFrsDm7IFJ
         KI4vvZMHCRfJO+5CgPnQpySCxDv6UO5G78UHev702jncYH/QCzmOLxkImEBVuQM3DxVh
         X53LDnVgLSYukC1Sb+6epA9vUTaabNGKmeSKTNwPWeSHxp1SlfOMDfeAOy6Bi3XC91l9
         OrvJQ64fqqTg3qviBdkFLJ8VQ/TZTTRpy4Rsb3VWGMjB+mXsfDMMaEuKIhpJcE+YkvXs
         pj+0bpE9UsqfXspoaYSbursT67H8IFvRy9AzC6UnbWzv0DpSPradPsl9ghDvn8KXZ4tv
         bTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059828; x=1747664628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoyqA4/3ub1McfI/VtMSnnTsDusnutY8ftzaVytS2Ck=;
        b=dmt2SLdMpHOTtI2sLqpN1cCGmmrs6i1/nbCYok9Md9M8AZGrrZVoIRkMeLUVu0Xwzm
         K66r+cUYcZSL9cXvReW/uyExI2x748RsDMq9Zq143mvyiFN0WU1RoUsBdvFxqzJ1xzhD
         XQ8y/XgoO1cARCH7Ufpv2h0I66o0pkhK6dQbnhvEaroX4aC01wXkvFoitD429LPv1v7w
         /jwHiqS3DTfmRvtAv2vPaXXI4zep4fJvT1ZoXX6Pz4vkV9qi/tkWBG+n78XdKLAUJTyd
         XLnOqPYZ0MDg2YhAXcblPH9vcngqGLbdlP67JIX/sacFXJgTQ6FqLw6gZonYC4BT5xBc
         u9FA==
X-Forwarded-Encrypted: i=1; AJvYcCUvOROWME5keHaS9FeNag2yf5rMdvYFSs8ehhVKzP7SAkPVDSi7nJhv52q/t7+Q5hzhUIdKZxp8kyk5hg==@linaro.org
X-Gm-Message-State: AOJu0YxsBMsLo40+odSd61kFaa2rUzGkWF86Cbsqq+KhYez7Pp5BYksz
	LdY8Vhr6jkvOB/FRXXLde6NMkXUT9U39bjKIh3o/VqeoMNVH5S4O9WQs3R7BgmKtmQ==
X-Gm-Gg: ASbGnctpSRVEWIuO3nfp79qQPIkzXWC/+Qd61ozFhD27TqnhxnyGuQYL6fjCyR7Oiqm
	rd9aZogPzyCZ5yL2/b0eXHmcj70Zb6STIG52nbYT3cR0CsTfKdBjA4+pH9ZUIB+1CoSX81wG9rt
	ca8XnW1+5Ofr4HLkYpQYV/njj3+MPGj7sGzppzKff3AlaJmE3DGwaG/W245p/fiYUHIxGXuVfkk
	eGwuf81rOolKIjrRiqDznpybi5r3v1gb1S/PQQ/wl1lsQ4F2qfyjLV8ZakWc+Is86cjKD4Q6n0L
	xMVRJJOw5wGgH4joYhMNMVJ1ay9vZu4J9eVl+WY3TStAZPgEZhpE0FhlQBlNLg5zq9F4L78w5wu
	jzBVl/uuMsb0A040SZ7SP18o9zhcg4GB9
X-Google-Smtp-Source: AGHT+IHGqCroQ3f4wU2wRmK1gSspBwzBJ7L9nIhkPWkDkHTsKZ1fvE+zD7CFJXEeKn3SRQgp09yexQ==
X-Received: by 2002:a05:6000:1888:b0:3a0:b8bd:608 with SMTP id ffacd0b85a97d-3a0b99076d7mr14483026f8f.7.1747059828354;
        Mon, 12 May 2025 07:23:48 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from xps13.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeb6esm172597005e9.25.2025.05.12.07.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:47 -0700 (PDT)
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
Subject: [PATCH v3] tests/functional: Add PCI hotplug test for aarch64
Date: Mon, 12 May 2025 15:23:25 +0100
Message-ID: <20250512142336.181080-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0l+C351mf+3T

Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
hot-unplug on arm64.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 MAINTAINERS                                  |  5 ++
 tests/functional/meson.build                 |  1 +
 tests/functional/test_aarch64_hotplug_pci.py | 72 ++++++++++++++++++++
 3 files changed, 78 insertions(+)
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
index 0000000000..f4a05de39e
--- /dev/null
+++ b/tests/functional/test_aarch64_hotplug_pci.py
@@ -0,0 +1,72 @@
+#!/usr/bin/env python3
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
