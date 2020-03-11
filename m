Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294548lfc;
        Wed, 11 Mar 2020 15:19:17 -0700 (PDT)
X-Received: by 2002:a05:600c:d3:: with SMTP id u19mr863949wmm.22.1583965157802;
        Wed, 11 Mar 2020 15:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965157; cv=none;
        d=google.com; s=arc-20160816;
        b=HqzMCFWcivuVdxY60PBv4Fyu4tiu1UEcayEsJThOM92IdpTbh23W+aBPRlQMmPmvrL
         LadTPxkokAMmSugf8sRHUJ+yuzzgoFqhkIwRePd0nQ8fctqhXexKCrE0hWYTv5oHXzMp
         Zw7vSApY0cn5see6qwnri5D1sN0CiZpkGmGRFyl7zzGPjmgIm8b4SCFXF4R+5qqbqCd0
         7ogTbs4FDlHHj1plF6K/9tEDeKwGzz2ZGR0jl7lk8UcNBEI/VInCUMNVUObJ4twjNBne
         fsKI22DqA5nNCzSZlwXkRZNTKAoZOQ2GyG10AHXFrDxIqiD6j1Zm9L7QbX6oSCT/TdOT
         TSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=G5wjrF/YkAUi/o2rwHfv8Ap4gQVbTnbSWvgNI4iZVKg=;
        b=A+UWkkIbO3IarIMMT7NUDKPebZvcUQX/ku9ArvaZW5/XV87/iAcSaEY0Aj5FdzoCgy
         PbTzJSAkwDIig8pnKydVKgqgqI8L2ca//yXSsklSvQy6LDDy1/F1rZHfBS2lo6NoXYeM
         Wo05ueRYlm8Z8XLVptmN75kCyULkwNj7WYbL+/+as30hKkuVil+lFJZu1iMe7W10EVKx
         Bw1HilHE2WpcqT6gmZ8RD+XTZeNOlEs+xwvtfX0ZPHR0kgSo8jBS1/JRafgxRXCsPVjm
         lo/vv9oSPCWc32lHYd3ayXF6mtMlI58kPqSHuNn4ymynSSnpyVuMMXaYi0XElQv9ggb2
         57Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LrobzSVP;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n12sor2068738wrm.57.2020.03.11.15.19.17
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LrobzSVP;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G5wjrF/YkAUi/o2rwHfv8Ap4gQVbTnbSWvgNI4iZVKg=;
        b=LrobzSVP/6aRkLqcjDZWn6cau6TJF3eRIB1rbsQK4dZ1m3OiK2ba3ybkI28Rs8wHN6
         WayVUq3YSbZewnucmZza0/GPATmGLmT0qcpVJUIRyB0rFpRGPbo2VItp0m1aqwNe8hGR
         ubJrFc9M05bbh4KJo5Xz5vjfDJTYYi99vC594PVkywr96s+/hapdYc35/aVuGX7CU8LA
         ng4f0WbIhiPSq/XdOMn63GDA25pfir6P3f0FrQRHbM18dXiQN07GsNKyzLdoZ0p9mt8W
         zrj4kRYZ6OzsWGB/o3H0TZeTEu1HYNhVtdgTkPWroNxcjjUaQNQ6gXavNsGwnx9O1LGL
         eFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G5wjrF/YkAUi/o2rwHfv8Ap4gQVbTnbSWvgNI4iZVKg=;
        b=DMCA/XprxpwLkTZkoU2Gel+NlGYp1FwZodAkFn0GRLNEgZCGfVmaguL3cHkxrX/Vy9
         2dpulQPkxNFLiEpxvFXwOVXgbW2OZy73xrLPq4danzh2RwFnfQs8XGZK9GKzYsuK4mJ7
         O/XRxi86JH5EWolp2FNAEp4ifrEzpTIVF66rdgRCU+sh0iwlkl3SdXGlLl0+3hQowRhE
         1N5qfgShl+TWxm7B49ygsxeOGPS96gKo76CMZsnR7TAaRfkvEDXquSN1wE3hNkMItOKT
         beSFfD1aYItNnZBmr34xDMHnCw6LLr38h0xYnrK+OywcUagzuGPC5A7rJMLX3NalmQjV
         uDCw==
X-Gm-Message-State: ANhLgQ2LsQSqTJd7RusG/eoASjX7kNsaJ/bQun2gL+MU3sX9AuijdHzC
	DBXGbFu3wRj+qkzbKyHvNDM=
X-Google-Smtp-Source: ADFU+vsgnY4brf1zhYZTqy6xsI/SWMOr2GeT+I88Xf9H7FGTPg3HwrYPtqWbDy9sol1cOPxpcakGdQ==
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr6968966wrt.271.1583965157371;
        Wed, 11 Mar 2020 15:19:17 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:16 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v8 16/18] tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi PC
Date: Wed, 11 Mar 2020 23:18:52 +0100
Message-Id: <20200311221854.30370-17-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FhQTedplTC1A

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This test boots Ubuntu Bionic on a OrangePi PC board.

As it requires 1GB of storage, and is slow, this test is disabled
on automatic CI testing.

It is useful for workstation testing. Currently Avocado timeouts too
quickly, so we can't run userland commands.

The kernel image and DeviceTree blob are built by the Armbian
project (based on Debian):
https://www.armbian.com/orange-pi-pc/

The Ubuntu image is downloaded from:
https://dl.armbian.com/orangepipc/Bionic_current

This test can be run using:

  $ AVOCADO_ALLOW_LARGE_STORAGE=yes \
    avocado --show=app,console run -t machine:orangepi-pc \
      tests/acceptance/boot_linux_console.py
  console: U-Boot SPL 2019.04-armbian (Nov 18 2019 - 23:08:35 +0100)
  console: DRAM: 1024 MiB
  console: Failed to set core voltage! Can't set CPU frequency
  console: Trying to boot from MMC1
  console: U-Boot 2019.04-armbian (Nov 18 2019 - 23:08:35 +0100) Allwinner Technology
  console: CPU:   Allwinner H3 (SUN8I 0000)
  console: Model: Xunlong Orange Pi PC
  console: DRAM:  1 GiB
  console: MMC:   mmc@1c0f000: 0
  [...]
  console: Uncompressing Linux... done, booting the kernel.
  console: Booting Linux on physical CPU 0x0
  console: Linux version 5.3.9-sunxi (root@builder) (gcc version 8.3.0 (GNU Toolchain for the A-profile Architecture 8.3-2019.03 (arm-rel-8.36))) #19.11.3 SMP Mon Nov 18 18:49:43 CET 2019
  console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=50c5387d
  console: CPU: div instructions available: patching division code
  console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
  console: OF: fdt: Machine model: Xunlong Orange Pi PC
  [...]
  console: EXT4-fs (mmcblk0p1): mounted filesystem with writeback data mode. Opts: (null)
  console: done.
  console: Begin: Running /scripts/local-bottom ... done.
  console: Begin: Running /scripts/init-bottom ... done.
  console: systemd[1]: systemd 237 running in system mode. (...)
  console: systemd[1]: Detected architecture arm.
  console: Welcome to Ubuntu 18.04.3 LTS!
  console: systemd[1]: Set hostname to <orangepipc>.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
[NL: changed test to boot from SD card via BootROM, added check for 7z]
---
 tests/acceptance/boot_linux_console.py | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0762dbe83a..e035c88b07 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -19,7 +19,13 @@ from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
+from avocado.utils.path import find_command, CmdNotFoundError
 
+P7ZIP_AVAILABLE = True
+try:
+    find_command('7z')
+except CmdNotFoundError:
+    P7ZIP_AVAILABLE = False
 
 class BootLinuxConsole(Test):
     """
@@ -619,6 +625,48 @@ class BootLinuxConsole(Test):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
 
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
+    @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
+    def test_arm_orangepi_bionic(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:orangepi-pc
+        """
+
+        # This test download a 196MB compressed image and expand it to 932MB...
+        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
+        image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
+        image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
+        image_name = 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img'
+        image_path = os.path.join(self.workdir, image_name)
+        process.run("7z e -o%s %s" % (self.workdir, image_path_7z))
+
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image_path + ',if=sd,format=raw',
+                         '-nic', 'user',
+                         '-no-reboot')
+        self.vm.launch()
+
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0,115200 '
+                               'loglevel=7 '
+                               'nosmp '
+                               'systemd.default_timeout_start_sec=9000 '
+                               'systemd.mask=armbian-zram-config.service '
+                               'systemd.mask=armbian-ramlog.service')
+
+        self.wait_for_console_pattern('U-Boot SPL')
+        self.wait_for_console_pattern('Autoboot in ')
+        exec_command_and_wait_for_pattern(self, ' ', '=>')
+        exec_command_and_wait_for_pattern(self, "setenv extraargs '" +
+                                                kernel_command_line + "'", '=>')
+        exec_command_and_wait_for_pattern(self, 'boot', 'Starting kernel ...');
+
+        self.wait_for_console_pattern('systemd[1]: Set hostname ' +
+                                      'to <orangepipc>')
+        self.wait_for_console_pattern('Starting Load Kernel Modules...')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.17.1
