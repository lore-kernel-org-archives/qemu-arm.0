Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2813741ejb;
        Tue, 28 Mar 2023 10:14:29 -0700 (PDT)
X-Received: by 2002:a7b:c398:0:b0:3ed:da87:3349 with SMTP id s24-20020a7bc398000000b003edda873349mr12272915wmj.1.1680023669552;
        Tue, 28 Mar 2023 10:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680023669; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5MyoQvNNn9u2bDJllk3UPyK0lNHLNtaY/cEPVZjUsz3j3yEPmOi2Mz2LJta0NmPtU
         zfry5YR+Qq1MJymP8clNCBXyIH6HMDoGQdmm47TdDVLzYWvK0aTG2KZOB7jYIbTRYJNS
         UD0OiZR7sx7TYYC8pn1fn1kxI6IAxDegXwdQdyKMlCYO6PDLO7KPPjvDdBpEi2EUEmBe
         GR9neTEV04+AfyNbtIWa3lRR7j+wt6Luat0OTjTMzVzMgu+L/d7ElKHN+PtnV6+/gheD
         xl16ioGXW+79l+mJ0VY5XO5jX4Jn6l3D22AFXyEdXmDtXy9y6eCaMBMy3EB7MEMkQNla
         LKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=8cNgbsSDC/UUm9AqLvK1cXOSgLg0mHlsYNdhy9K84Hc=;
        b=oJuejNH4oXCaHN3D40lgGtYbtwMfcZnpFW4dWzSJAAV9Q4plcDDIbgRFn9JLePW+ic
         XqN4eQEmXyGFuN2iPY5NFScyrK/9tsjG2ZaGsQHYqKDaI4THZiW0OdNwbH4nS7uYqaLa
         c0695AeOzwvOhclduCC9OM8lishr5xjI1TrdcfMwNpw64ZDdNjYSG+4JcISFnfutqCql
         faDa7XQtsyzvs2G8GfxyIcRqv0QWFDM94U36GrRuW11auKy7IETjZ4/IYm+6o//qfJf1
         3bKGNCEBs/q0wbWRwJc7g2ixs+j4Ey/NddvQbl5BDeUCUSjin0vwtkECDYl0/9qN8iq/
         Skfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SNAcpr/n";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k6-20020a7bc406000000b003e1faaaa3a1sor2782048wmi.2.2023.03.28.10.14.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 10:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SNAcpr/n";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680023669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8cNgbsSDC/UUm9AqLvK1cXOSgLg0mHlsYNdhy9K84Hc=;
        b=SNAcpr/nngva8aX9rgRYc9WsgbEBChE3SGDR3loVfQK5hZMexEcHyaOW0Hx0XDEE33
         QsMCfxl0LSLVvBhnusPqr/xv/CKlC8hMelqXx/+RXtRPURv9roW+XK4jsNT5BjgQ1YW0
         NNZhCPADuf1dAUi1nlox5+Zbnd2PtEH5N5K7g4lNGM37g0FUuhpVlBaJqUev1YFwjJQ2
         nXfD3v55HUbXmhJwU3/R18cosjwKYZawDLU4cyH1JbAKgI8sF+62Bq6HdyMYB++lt86a
         lbm0f2SZmHE95DvgO9XfqnQrjyd0b8USplOJ++nrJerfUEl7bK+uUFqXXIYgQYwH/N2a
         KfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680023669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cNgbsSDC/UUm9AqLvK1cXOSgLg0mHlsYNdhy9K84Hc=;
        b=rS7xB6wEehmUgAvtAQZtEiZhefUO8wNuXglbBs+dtPLwVaLLgKObZh9ptWN3Os69Kl
         DN2dyoNjtM1uLR7k8vpij23tKCSowbF7aaNAKI8YAtXI2yNWHvohEHA+WH0Bcv2oVoBY
         HcVIdtjQvqmlmVxGX0FqRwyRIlHvPlx3MxW+yGrxk1Lyv2tfXVGJnoYA7crl+YTAKzlN
         1UrCtzWGbsksIi/6NFRDrGsLFFhFaJqPJ6imk3/TIZBEoL/vOUyi0aV6VpUp3lZQBG/z
         r/GC5FsG2Wlr8WfFXf42NfsgvRgaBhwhifGQkdk+ZxqNMG0UQdBrAy8pTP4ZJ4zRaO3l
         fUMw==
X-Gm-Message-State: AO0yUKW0OVN3ikyc3CL1vdUSCIJiw5pLvUq/qxQiZH3vetgDCUhDy1zQ
	X3v+qeTyygflap2QhV4VJKWhz58x
X-Google-Smtp-Source: AK7set9Hrgl6YzKXwZ6MLeSmXn+nWUB4UNlAGspYMNM5xM9+AuxBAU3mG/IZBoF+RhtUtI5Q5rHivQ==
X-Received: by 2002:a05:600c:280e:b0:3ed:551b:b78f with SMTP id m14-20020a05600c280e00b003ed551bb78fmr12634709wmb.4.1680023669146;
        Tue, 28 Mar 2023 10:14:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c0a0600b003ee6aa4e6a9sm13425930wmp.5.2023.03.28.10.14.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 10:14:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3] tests/avocado: Add set of boot tests on SBSA-ref
Date: Tue, 28 Mar 2023 19:14:26 +0200
Message-Id: <20230328171426.14258-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oijOMdsNhPsI

This change adds set of boot tests on SBSA-ref machine:

1. boot firmware up to the EDK2 banner
2. boot Alpine Linux

Prebuilt flash volumes are included, built using upstream documentation.

To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
the same Alpine Linux image on both.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>
---
Since v2:
- Use Alpine sha256
- Use @skip* decorators
- Run black indenter

$ AVOCADO_TIMEOUT_EXPECTED=1 avocado --show=app run -t machine:sbsa-ref tests/avocado/machine_aarch64_sbsaref.py
JOB ID     : b6682352323bc601f49a2b247cfe388b4b09047f
JOB LOG    : /home/philippe.mathieu-daude/avocado/job-results/job-2023-03-28T15.29-b668235/job.log
 (1/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_edk2_firmware: PASS (5.85 s)
 (2/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_cortex_a57: PASS (118.45 s)
 (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_neoverse_n1: PASS (119.22 s)
 (4/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max: SKIP: requires TF-A update to handle FEAT_FGT
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 244.32 s
---
 MAINTAINERS                              |   1 +
 tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

diff --git a/MAINTAINERS b/MAINTAINERS
index ef45b5e71e..ee4bd28205 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -928,6 +928,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
 F: docs/system/arm/sbsa.rst
+F: tests/avocado/machine_aarch64_sbsaref.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
new file mode 100644
index 0000000000..0a79fa7ab6
--- /dev/null
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -0,0 +1,158 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-FileCopyrightText: 2023 Linaro Ltd.
+# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+from avocado import skip
+from avocado import skipUnless
+from avocado.utils import archive
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
+
+
+class Aarch64SbsarefMachine(QemuSystemTest):
+    """
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:sbsa-ref
+    """
+
+    timeout = 180
+
+    def fetch_firmware(self):
+        """
+        Flash volumes generated using:
+
+        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12.2.1-2)
+
+        - Trusted Firmware-A
+          https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
+
+        - Tianocore EDK II
+          https://github.com/tianocore/edk2/tree/494127613b
+          https://github.com/tianocore/edk2-non-osi/tree/41876073
+          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
+        """
+
+        # Secure BootRom (TF-A code)
+        fs0_xz_url = (
+            "https://fileserver.linaro.org/s/ATnSmq6k8SoXgbH/"
+            "download/SBSA_FLASH0.fd.xz"
+        )
+        fs0_xz_hash = "a210a09692bcbe0a3743ffd0df44e80e0c7ad8ab"
+        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
+
+        # Non-secure rom (UEFI and EFI variables)
+        fs1_xz_url = (
+            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
+            "download/SBSA_FLASH1.fd.xz"
+        )
+        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
+        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
+
+        for path in [fs0_path, fs1_path]:
+            with open(path, "ab+") as fd:
+                fd.truncate(256 << 20)  # Expand volumes to 256MiB
+
+        self.vm.set_console()
+        self.vm.add_args(
+            "-drive",
+            f"if=pflash,file={fs0_path},format=raw",
+            "-drive",
+            f"if=pflash,file={fs1_path},format=raw",
+            "-smp",
+            "1",
+            "-machine",
+            "sbsa-ref",
+        )
+
+    def test_sbsaref_edk2_firmware(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+
+        self.fetch_firmware()
+        self.vm.launch()
+
+        # TF-A boot sequence:
+        #
+        # https://github.com/ARM-software/arm-trusted-firmware/blob/v2.8.0/\
+        #     docs/design/trusted-board-boot.rst#trusted-board-boot-sequence
+        # https://trustedfirmware-a.readthedocs.io/en/v2.8/\
+        #     design/firmware-design.html#cold-boot
+
+        # AP Trusted ROM
+        wait_for_console_pattern(self, "Booting Trusted Firmware")
+        wait_for_console_pattern(self, "BL1: v2.8(release):v2.8")
+        wait_for_console_pattern(self, "BL1: Booting BL2")
+
+        # Trusted Boot Firmware
+        wait_for_console_pattern(self, "BL2: v2.8(release)")
+        wait_for_console_pattern(self, "Booting BL31")
+
+        # EL3 Runtime Software
+        wait_for_console_pattern(self, "BL31: v2.8(release)")
+
+        # Non-trusted Firmware
+        wait_for_console_pattern(self, "UEFI firmware (version 1.0")
+        interrupt_interactive_console_until_pattern(self, "QEMU SBSA-REF Machine")
+
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def boot_alpine_linux(self, cpu):
+        self.fetch_firmware()
+
+        iso_url = (
+            "https://dl-cdn.alpinelinux.org/"
+            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso"
+        )
+
+        iso_hash = "5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027"
+        iso_path = self.fetch_asset(iso_url, algorithm="sha256", asset_hash=iso_hash)
+
+        self.vm.set_console()
+        self.vm.add_args(
+            "-cpu",
+            cpu,
+            "-drive",
+            f"file={iso_path},format=raw",
+            "-device",
+            "virtio-rng-pci,rng=rng0",
+            "-object",
+            "rng-random,id=rng0,filename=/dev/urandom",
+        )
+
+        self.vm.launch()
+        wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
+
+    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
+    def test_sbsaref_alpine_linux_cortex_a57(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.boot_alpine_linux("cortex-a57")
+
+    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
+    def test_sbsaref_alpine_linux_neoverse_n1(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_alpine_linux("neoverse-n1")
+
+    @skip("requires TF-A update to handle FEAT_FGT")
+    def test_sbsaref_alpine_linux_max(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_alpine_linux("max,pauth-impdef=on")
-- 
2.38.1
