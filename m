Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1709248lfg;
        Sun, 1 Mar 2020 13:50:50 -0800 (PST)
X-Received: by 2002:a5d:4443:: with SMTP id x3mr17371668wrr.379.1583099450112;
        Sun, 01 Mar 2020 13:50:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583099450; cv=none;
        d=google.com; s=arc-20160816;
        b=FwcpPojbVOrjkYF7LJFO/fraHuiOvl/Ucm43cAtQ1mha2/TqEA1ObENLFlQDZHPk1d
         H0CPDv0NXD3fBmYSExKnld0+W8z65N+8Sce9ErmZ0luKiAVubWbVtD0wcSrIYUjOeomL
         c4KR53NZ17u/OsESE1GYXZyd07iaK6PVRWIpsg1v4J7iPS2Oa0fPxXpe+2q5aAwRZXau
         47iKBxQaRJsLVTRQjQyKYEoiyd4WvvWg+YYsyxPsA2B60i2TgKgyEDpGptPsx8KwiZic
         jZY6F4vuAv65rp16vZOnzluOvO0IFJbK6Q5OBlfBqdjjTbz/eRYLbkyaJ6XjWpYJeWYL
         KaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vR+19Al6A28NFlWsP/WCkkDCw4IWTkTu+AkaGrWBuwQ=;
        b=Mtlmy3Q7yk5eBCZBrv9ZFe2Qk1xB+E1iIuYJmwbWn8Z426cwB6oEfESbMv/ZXSIxJc
         gfNMVSHgMt1bKUo49/5be7Zm+we36xbdRM5+v/WobPk0+HE+q7AZW+EjrOTi15mV8sR5
         /2MM/njG0cdvx5P+JHg9gI3J3mTSBXE9fOC0rMBlxLnxF1GDjbgUHm5GXjOrgsG2+TP0
         TtlaHbDKdgS1lX8UHcJ62DtXfNBeNv0pWWiLokoC+zVUYnyrtk437hMD621wOpv4TbL+
         2R8dp/HRTdDOfpiy/RJQdVQKbRBG2l6hVQMOi7f8gb05YU5smAMhsKLIxpSdlQy+QKvV
         tLSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rUaY0DpF;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 19sor4474026wmo.7.2020.03.01.13.50.49
        (Google Transport Security);
        Sun, 01 Mar 2020 13:50:50 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rUaY0DpF;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vR+19Al6A28NFlWsP/WCkkDCw4IWTkTu+AkaGrWBuwQ=;
        b=rUaY0DpFPjcxBlJjKdeSIG5hsvzMi4ryEsLxYtPqyMhSNcs02a4vnZw8+EEQUB2zsg
         TIk3GFgtJwFxP4jx8udiYl91oCFJTJIPznCak+Y9ND5BUA8DlVrhdlygKYyPOBncwifr
         +OiO4Kcf1warhu2r2IrwPj7nfp7zkH4Trcd+FKbPosSaeBGAfOnUG8jLX7tbB/M07ud4
         Kwr120VRLk3iVgRxF80D+CoNPckaSAgTHomeyI6/s99G2CX3lxqRPsBdzNgUpJrlM+Mw
         GMeZPXY9QQXvTgYMDGQMzWJlSABrLyEjL7y7KEBgR6mLwXA8XlckgIdX/HtytDe4BQgL
         DkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vR+19Al6A28NFlWsP/WCkkDCw4IWTkTu+AkaGrWBuwQ=;
        b=sNFxgP+vjFAlsirRy3gExHrko96r9wduggMMFV9jGUH6YM4n6biCrlMzU0dxD//dW1
         V+DFbBNn9vvtMAjd0GaEJO6pE+CMj7D+rBPqxp4mPxkMTBy2ElVtHZpgr/WQQYnl0i26
         +7ZMzffkFgiriIKGuDAkLxzf2IpxPmh/Ady1Xrt8RlPH9UeFF0Orxz5VOMWHQ2Ner2/0
         El8z2wPDUpPIS1Zn8wOL/Sw6IbmbI/eqLmxVT0FYGaI5cToPkwmEHIriKacIHpwNH+Ic
         sxaWyTnWGOl/BL3ulxXMJIvqIZOP4iRH5cg2V44Uck7LlaBFUaXnJADvq4lX9wQ4XHFO
         c5Mg==
X-Gm-Message-State: APjAAAUDNRSOwqkff/EAIkfignrhXD3ESAv3KQDkzl4Jo9F7qkyR2uop
	apZgLIlmUd1wEvqCY+KqknOzq09g
X-Google-Smtp-Source: APXvYqyUZeGIXaJV7VbRdETVwlsu8XVvnfhjVADh+qyztX4xq0Tt6BEe0qLDfn1UZ/uV6oGrBCtEdw==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr15562793wmk.46.1583099449626;
        Sun, 01 Mar 2020 13:50:49 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id e8sm25033124wrr.69.2020.03.01.13.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 13:50:49 -0800 (PST)
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
Subject: [PATCH v6 16/18] tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi PC
Date: Sun,  1 Mar 2020 22:50:27 +0100
Message-Id: <20200301215029.15196-17-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301215029.15196-1-nieklinnenbank@gmail.com>
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FUK/DWWvugMc

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
index 7ef69c7bac..a70ac4a6cc 100644
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
@@ -613,6 +619,48 @@ class BootLinuxConsole(Test):
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
