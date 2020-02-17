Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518696lfp;
        Mon, 17 Feb 2020 15:24:39 -0800 (PST)
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr24089505wrp.167.1581981879350;
        Mon, 17 Feb 2020 15:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981879; cv=none;
        d=google.com; s=arc-20160816;
        b=oK8V7dgRi7uOyH9FUQumtPUfOBB2Ph0ZTvNDouf61D2OrVecp1qBxT1000PZPj4L2Q
         vGobFcTrjg3nl+w1BnmrODFsyEwdDlkVub+gbESAVlHtQiRJSD3Pyc+3km88cYsZdKCU
         6rTyB/OqlwWS3ZIhQcjkSVU+f56wlGu1Y6d1HRT1ZCk5kOBclYLizLrWFwfZOAz+OVsY
         9NakJ5Hj0s4tv42P/C3KmhZLxQ+uskkIxzboSgTg/AMb8v5e+pzvP/f/sEj/950ri1Ee
         pq4wxS57+wvZTSrQJ8YPYNBqxkNcrMoMcnaFmI+FJgUEbHtJ4i7k4625ZfCHOY8+6/Zg
         zuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vR+19Al6A28NFlWsP/WCkkDCw4IWTkTu+AkaGrWBuwQ=;
        b=l+IRM2xu6OaaKXESkdPPW3SvUTVoY86uPzTcLP4uiWaOnlpeRxkxZCBsq9VZUNsG0y
         UN0Qer/QT3jzR050LBg0rhLmj7/1Lspzaan6SIff3b18pMXCGYnfLvw6wbRWj0yu1yc+
         OVlSmmilrXvhb4EzLfTJTLSViZy8449fMEAip0edDufyy9jPiJCXo/Gc70r6R8ntZVXT
         k7HWLzxCWkptqk6OF1BNZRY2SLuDM6AaHd9ntf4sPBgNOji4GrhMBxpS7fQVVMNflpIw
         KTOh52nPuxBWOU7QnjpSAEzykt2tdU0HEZCTTdFDhJ42ks+qJpLKOX4qMLRJXyDpK0a1
         uR7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LSXg1RSn;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a17sor1380223wrv.12.2020.02.17.15.24.39
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:39 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LSXg1RSn;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vR+19Al6A28NFlWsP/WCkkDCw4IWTkTu+AkaGrWBuwQ=;
        b=LSXg1RSnmKUMixEv133lsMZOwgk3d8hcVJmzYdzQjiDbyObSnM0BAXEFpMFgumc2oX
         A3gvPouyaqvO9G232GPV/UuqhoECRpkj8gcDVHZkNTdkEqvfMdEiZ0NX8N4LF11sqPV7
         iX3WohVxxQCIQxkG6HRrDsUUUMy096dT9TuQ0X50q4T6hlNzrytmszlf9107OMshlZJy
         5GhNNQjQ43746YLHBQVb8FGZC+Py+C00L6LFhgwVaEnu1hzHMNpq/m8nbqKYue47qPu9
         ipGJmUpsTolBWA9kawHiJrbH3Qb4vTyirWJQ7nOgQK1d9BpcVbwRD6Wdiv3lSKxqKkoO
         sBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vR+19Al6A28NFlWsP/WCkkDCw4IWTkTu+AkaGrWBuwQ=;
        b=ZDS8igAovoXJUmo7lgHevziSFJdCZzC/vEE+bY++4d0FlAJGaFL3frztY3hTlUErVI
         hVUpsfFg2ZjCiGu+t8iso7jT5LX2MJp5ZTR17KZL5rZsPO1fWnbEn2RTugXGHGcTXo1j
         61+VRrDP8KzLF3wBsrbWmWKFMe/NTKPjJtzmQduoCkOEv0sTOUMVTlobxpAP2jfOYtTW
         ingCSASfn8IqLRFljWJN8e+6BOdVpnB2E8osC1qoZxMhtRKgYFRPWTvc65zLqhQw11tA
         Zd+VnTwzBOymxkWcLHLYm4n6losMAk88iETP/p1ro1Zx9jsjoyPrystDpdTe3fBnZXyq
         Y4WA==
X-Gm-Message-State: APjAAAUREHJ9TyrGLyxjQnBzar7LnVkFpw58XOhmcVmwEc6GHJCwpx9A
	KshA4vkPVf9M259Qj9jQeO4=
X-Google-Smtp-Source: APXvYqwtCNVOSPIayvxzSAzHsseYjSezsf12OssSvOvmgsJ2A08FkKe2y3nMlYf2AJL4kCUVJsMDyQ==
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr23601627wrs.424.1581981878981;
        Mon, 17 Feb 2020 15:24:38 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:38 -0800 (PST)
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
Subject: [PATCH v5 16/18] tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi PC
Date: Tue, 18 Feb 2020 00:24:09 +0100
Message-Id: <20200217232411.30096-17-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bKZaw00pZpff

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
