Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226765lfc;
        Tue, 10 Mar 2020 14:32:26 -0700 (PDT)
X-Received: by 2002:adf:f505:: with SMTP id q5mr16567082wro.348.1583875946679;
        Tue, 10 Mar 2020 14:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875946; cv=none;
        d=google.com; s=arc-20160816;
        b=r65qB8NoCkT3wmUTFzotQXh3nvDMlYgndL4+PRMjBd+m8lcILaWtcAurS8UnOHhqKC
         ZgjBUOUl5CfQ/wGR9ZjK+Nd7+/brO5ld99berh7HK29SWdUboLUPBs80N8kSAXpTToIC
         2Gt80NjZ8Q9SqzZUaRAqjTX1MvNXm1XHNtbT42ClhcdC1UX4QzAOFWMYBtok8sf8afQV
         FEN6TRCOftcfWqIplyAtoWL52851iIix0buuXrmJN2gBC0zUuJW2yvhlFintfWw0ssbu
         vNsmDh1VoCEcV+yeUIwa1g3fRZkhhDeAk1uJH+4tr3D0D1Vj5OuXUoTntASDHyqE2/gU
         VmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0P/rWCOfhT9JnQcS9p3ZeVjot7/8P5V7SBIoIKAPhe4=;
        b=rOVZ2zEF9U0TliK8rvXShHSD6+6GKmi2VpK3ktkQsTvhMy7pL4oOcIAxaB89heqODQ
         aq/ZkD4jA1bAvShJuwAGTf1TpSqK26DicF0tuksdUadQXGr35qK7auTkvKwkKCEjsGea
         ReFbbsQiTpwh2q/UeOVo/PiZ7vidKegI7pAc+tQb7VO4E4gOZXAN/JaBSoxuggK8ML2q
         Hmdgmiw/ea5TDy2TlBtRJRg1d2dd6/MRgjruUEQjFxXA1m/1eV/jkNcLzFDCBuQgsPM7
         q5UDh39CqmWu9JPfglpQ/GU2GnJs0r4vPH7kHH1HQYp5Qyf9T9sl5j10fL0w7QLUIHoF
         L5mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RS+DxZ7j;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a78sor2673025wme.12.2020.03.10.14.32.26
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RS+DxZ7j;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0P/rWCOfhT9JnQcS9p3ZeVjot7/8P5V7SBIoIKAPhe4=;
        b=RS+DxZ7jklfglFBD/v2ZbODPW0sv6Upu4r580Zl+AAMCgDKN/T9ikeT2MM67c2MF2x
         SPYYVI+GdewWJTFnzEL+LhsS5Ox7GlyDkUcYwSxOBZWRlfo4+3mUl8AhsoKI3jxQ6JDY
         cMqgJ30PNnpvcvx9qMkhundR4aKrmdBASszGq/aMdLH+E1BHIxqu70+2+kPm0Rjag6RY
         AcbUpc+BFUJJfqGhjsifEC9rRKWHVRJmEGzsvsKhIXbqrF/fsq2B1L0aJLid0iIuEGaH
         2B40OH9Dyq9eH0hQAY+431K4tGnZqQtTxNkWT/IOQS7aZnE+s70qhMbTrPFiUk8fP9sK
         XAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0P/rWCOfhT9JnQcS9p3ZeVjot7/8P5V7SBIoIKAPhe4=;
        b=fohnDMrWS9l+wcrSHcPjZftWksI+5YRHSmIpqeiTjBsqlTxXQ74kY9MQqsrqrByW/D
         f3ySTJHc5DBelW60oA3/K6NDSHMiOCO40Mqw/af43/rEGDC1kntpgenYF0HuSU+wnZt3
         hFiTqgwv0e0//GQRAEuP7EkgBNWxQYB6lg+pm8goKhj6UOiL+EMzU3cmaoiRQyV5p2nK
         24CmtpaI+dqSUMtf0arGXnQhPp9Wl3TCsrRwD7paWMCw05anDGGQbhKHSGVk/AesQH7w
         CjBGs35n8VJwrso1+BK2oKSOIoU43awoSyEPwj+/o/l23eaWVmXD00ufbJf9K0qCzpc1
         U7tQ==
X-Gm-Message-State: ANhLgQ15iyls0tm7VGxVnd4MVLnch9zYDP0tuL12TJnZOdYytQuQaGjL
	POU/2OOUTzQnM8zBj34ZDwo=
X-Google-Smtp-Source: ADFU+vsjJh0ipLp63W2ZKJ1+aoJY/NjhXZgYH9/ozvG89JQ407ab4GyHt38zpw1PuiUziAP+syJh3A==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr4043761wmi.89.1583875946222;
        Tue, 10 Mar 2020 14:32:26 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:25 -0700 (PDT)
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
Subject: [PATCH v7 16/18] tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi PC
Date: Tue, 10 Mar 2020 22:32:01 +0100
Message-Id: <20200310213203.18730-17-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310213203.18730-1-nieklinnenbank@gmail.com>
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: y2V1vpauZXDx

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
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
[NL: changed test to boot from SD card via BootROM, added check for 7z]
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
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
