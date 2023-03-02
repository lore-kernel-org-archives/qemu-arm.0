Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp100909ejc;
        Thu, 2 Mar 2023 11:11:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+ImNbrUMdXJgOyfJ9BIOo3lwlbCJW06DVAoHDqhc1/EbOdfCHR/9YdUK8BP9D5PmHLUDI4
X-Received: by 2002:a5d:5141:0:b0:2c7:1a96:efcd with SMTP id u1-20020a5d5141000000b002c71a96efcdmr8230180wrt.1.1677784318657;
        Thu, 02 Mar 2023 11:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677784318; cv=none;
        d=google.com; s=arc-20160816;
        b=rizP8c9uJyp2vD4rAx9rN/eotlF7PgNYnoaE7knGjgPn+KKD5SN5iA4ZSKpZjsF4Za
         NVFRnDaYbzfWAMUO0QbMq11577FmK9OZv9ogD6qI53Yb2+rdm2T1sf4pzGuyQ5kvj+or
         30/hPBHJ/xsoPtEtDzKEALdrM/np8FZau4qfCTR6NjSrwx0IEf0kNo0Z635vbNoR5tLe
         lfGREpBLqvugx24m4Y4R36B2s5+g0/0yeuwWoWXKhjnfetHChD02wRyAAmCAL2DNjiGp
         iI+x156BKdo/JjVj46iMa3gtOh6lHUNX2w2ICxV8lwrpPMSR62wiOC9jnEWQt072n06c
         QZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ADkt6+asEqaAt6jraUKUwdFs055AbPsdyjeTB2kLXFQ=;
        b=eXWz/2g7vPgu4DFqmdo5/Rxzkv8t2sb5ijpMnQjZrDWNOFawabK8eLEg0wVCqJK2NV
         TG/dlUfUvEv/MVYkeuaCvZrwTPXoexkQ7+0kjIcZy0jvTjlh+m75g6SEkWFjJGw1aWqm
         MS7AAmv4LfT5OaKrUy6cNfhD/oWKW5nCWNxge7yQ7bMDa7mJqSwu6p+5Lsi2Xl8FIi+R
         MqcK1pNaokXaqbepUcKm1/VEFDjKnJQxKDj0RS/v6S3ie2DOWtpiBdzunk9Caan8SUND
         78q4M77bQc7PfEu+jdBjP+3H76QNvbzuSa6SaRF37u9C095Y1grB6SjN4jUjWEVergeD
         5eCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from muminek.juszkiewicz.com.pl (muminek.juszkiewicz.com.pl. [213.251.184.221])
        by mx.google.com with ESMTPS id a14-20020a5d53ce000000b002c55304b9b4si106778wrw.742.2023.03.02.11.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:11:58 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) client-ip=213.251.184.221;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 65546260167;
	Thu,  2 Mar 2023 20:11:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
	by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRogIvaknRxn; Thu,  2 Mar 2023 20:11:52 +0100 (CET)
Received: from puchatek.lan (83.11.36.13.ipv4.supernova.orange.pl [83.11.36.13])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A40DA260729;
	Thu,  2 Mar 2023 20:11:51 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 2/3] tests/avocado: Add set of boot tests on SBSA-ref
Date: Thu,  2 Mar 2023 20:11:45 +0100
Message-Id: <20230302191146.1790560-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /bElb5C9DBoJ

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This change adds set of boot tests on SBSA-ref machine:

1. boot TF-A up to the EDK2 banner
2. boot Linux kernel/initrd up to Busybox shell

Prebuilt flash volumes are included, built using upstream documentation.
EDK2 and TF-A are updated to have SVE/SME properly enabled for 'max'
cpu.

Linux kernel/initrd are from Debian 'bookworm' installer with
"init=/bin/sh" kernel argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 MAINTAINERS                              |   1 +
 tests/avocado/machine_aarch64_sbsaref.py | 150 +++++++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 76662969d7..df0dfd4bc3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -916,6 +916,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
 F: docs/system/arm/sbsa.rst
+F: tests/avocado/machine_aarch64_sbsaref.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
new file mode 100644
index 0000000000..e36e53d4d5
--- /dev/null
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -0,0 +1,150 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-FileCopyrightText: 2023 Linaro Ltd.
+# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import shutil
+
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
+    def fetch_firmware(self):
+        """
+        Flash volumes generated using:
+
+        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12.2.1-2)
+
+        - Trusted Firmware-A
+          https://github.com/ARM-software/arm-trusted-firmware/tree/6264643a
+
+        - Tianocore EDK II
+          https://github.com/tianocore/edk2/tree/f6ce1a5c
+          https://github.com/tianocore/edk2-non-osi/tree/74d4da60
+          https://github.com/tianocore/edk2-platforms/tree/0540e1a2
+        """
+
+        # Secure BootRom (TF-A code)
+        fs0_xz_url = ('https://fileserver.linaro.org/s/sZay4ZCCfHSXPKj/'
+                      'download/SBSA_FLASH0.fd.xz')
+        fs0_xz_hash = 'e74778cbb8e1aa0b77f8883565b9a18db638f6bb'
+        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs0_path = os.path.join(self.workdir, 'SBSA_FLASH0.fd')
+
+        # Non-secure rom (UEFI and EFI variables)
+        fs1_xz_url = ('https://fileserver.linaro.org/s/osHNaypByLa9xDK/'
+                      'download/SBSA_FLASH1.fd.xz')
+        fs1_xz_hash = '7d9f1a6b8964b8b99144f7e905a4083f31e31ad3'
+        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs1_path = os.path.join(self.workdir, 'SBSA_FLASH1.fd')
+
+        for path in [fs0_path, fs1_path]:
+            with open(path, 'ab+') as fd:
+                fd.truncate(256 << 20)  # Expand volumes to 256MiB
+
+        self.vm.set_console()
+        self.vm.add_args('-drive', f'if=pflash,file={fs0_path},format=raw',
+                         '-drive', f'if=pflash,file={fs1_path},format=raw')
+
+    def test_sbsaref_tfa_v2_8(self):
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
+        wait_for_console_pattern(self, 'Booting Trusted Firmware')
+        wait_for_console_pattern(self, 'BL1: v2.8(release):v2.8')
+        wait_for_console_pattern(self, 'BL1: Booting BL2')
+
+        # Trusted Boot Firmware
+        wait_for_console_pattern(self, 'BL2: v2.8(release)')
+        wait_for_console_pattern(self, 'Booting BL31')
+
+        # EL3 Runtime Software
+        wait_for_console_pattern(self, 'BL31: v2.8(release)')
+
+        # Non-trusted Firmware
+        wait_for_console_pattern(self, 'UEFI firmware (version 1.0')
+        interrupt_interactive_console_until_pattern(self,
+                                                    'QEMU SBSA-REF Machine')
+
+    def boot_linux(self, cpu='cortex-a57'):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.fetch_firmware()
+
+        os.makedirs(f'{self.workdir}/vfat/efi/boot')
+
+        # UEFI shell binary
+        shell_url = ('https://fileserver.linaro.org/s/SGoyRrEzkmW8C8Y/'
+                     'download/bootaa64.efi')
+        shell_sha1 = '5a8791eb130406d1a659e538b1a194a604a29a78'
+        shell_path = self.fetch_asset(shell_url, shell_sha1)
+        shutil.copyfile(shell_path,
+                        f'{self.workdir}/vfat/efi/boot/bootaa64.efi')
+
+        # Debian 'bookworm' d-i kernel from 8th Feb 2023
+        linux_url = ('https://fileserver.linaro.org/s/L8JMwEZQK8SDR39/'
+                     'download/linux')
+        linux_sha1 = '39a75284783ab63626642228fbac1863492d30b5'
+        linux_path = self.fetch_asset(linux_url, linux_sha1)
+        shutil.copyfile(linux_path, f'{self.workdir}/vfat/linux')
+
+        # Debian 'bookworm' d-i initrd.gz from 8th Feb 2023
+        initrd_url = ('https://fileserver.linaro.org/s/NmYTxezZNKGF5P4/'
+                      'download/initrd.gz')
+        initrd_sha1 = '1404d0129cbd0bff7aaa589ddbea3cdb7c0d4c1d'
+        initrd_path = self.fetch_asset(initrd_url, initrd_sha1)
+        shutil.copyfile(initrd_path, f'{self.workdir}/vfat/initrd.gz')
+
+        with open(f'{self.workdir}/vfat/startup.nsh', 'w') as script:
+            script.write('fs0:\\linux initrd=\\initrd.gz init=/bin/sh')
+
+        self.vm.add_args('-cpu', cpu,
+                         '-drive',
+                         f'file=fat:rw:{self.workdir}/vfat/,format=raw')
+        self.vm.launch()
+
+        # Exit UEFI
+        wait_for_console_pattern(self, 'EFI stub: Exiting boot services...')
+
+        # init=/bin/sh started
+        wait_for_console_pattern(self, 'BusyBox v1.35.0 (Debian')
+
+    def test_sbsaref_linux_a57(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.boot_linux('cortex-a57')
+
+    def test_sbsaref_linux_max(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_linux('max')
-- 
2.39.2
