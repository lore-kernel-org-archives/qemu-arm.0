Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969973lff;
        Sat, 18 Jan 2020 16:51:28 -0800 (PST)
X-Received: by 2002:adf:fbc9:: with SMTP id d9mr10704671wrs.20.1579395088321;
        Sat, 18 Jan 2020 16:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395088; cv=none;
        d=google.com; s=arc-20160816;
        b=Nlkwi3zhZ5VSRjyt3l6ElqsvxQDji3YcJFlj9eXiYoxc/4X03UlOUOWu1YSYkwwRJx
         dhWFonG6MtXxxqitz4J530h+HlKjZfyk6e5doZNB11SWEmp5L+go+7aUZD3GxHBfM65Z
         LVUmMn+16GcJTVXA8218hD5F9/0F6ENhCI9aXqJSOwlh0Ss1Ca1s4gY1Co7RyxVwbXGm
         9ElT+hGEp0i6tx9xNF1M07XVNEMQFEoZp0yfgxnm5+C+cTip3QFjMk4PQJmtTNd8mlpQ
         HFENHhlnxjYZGHpuXV0BSiLlmidopSK8/x425X4d4wus4bOGPPujG96eVORfriLSedzd
         QWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VULQN3UBgBd5VnhIE53vuqYwbx1WLZtkqFzjaxFSeRE=;
        b=D8uiVbsvGXtLV2xLbMK2I5SxGn7TYSuLEWEoEFJTUdEI3MzI9Fu0CwQkm48L3/YwMb
         pHMfFjAVEHWHHQkfUn2+1oBZjMvC6l6t86e8tPPX6ggoS5tmzf8R89EjGsS8ksQZGGEi
         twxOg5ZtiXng3oIkggQ4+xd/Zh4SXlqxIFoGPCc0Ba3DcTWMqzoCKe7TiQ84R4gqBBjD
         VAIR59K+NyBWUZl/ABr/+F1Q5TEi1mtIGOgJDyffZD9K5sbDqSnVxCl0ORD6zowgJnHJ
         rRQhh8VaxCWh1D96b/fp3ZNOYvhvnjNKr4nitHzPr6G1KypLPzbicoO04eDkaoI5e0Xn
         1qSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=StXOEcSE;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n18sor6322635wmk.29.2020.01.18.16.51.28
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=StXOEcSE;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VULQN3UBgBd5VnhIE53vuqYwbx1WLZtkqFzjaxFSeRE=;
        b=StXOEcSES18w36R+ZzRULyl+z4z4/+RCMuWBHFt2C2Y/Bhpdf9czWSVMio/fBdfEFG
         6INYZR9oErpKqg6MZHwHXRCAaLpiXdUdTArAHT663xvSwnwS7zSPntslkUCOrtRCp1o0
         rUeDxg/fekhUhwSU9YS5eAXb+ilmM1rkuXcL/y+KLZ5XLz4KACB8KsSEMqLS/fxAc6AZ
         c3rYHyBUQOSM3/bJImEo5QzA7rTSHuEHawq5DNDtBDNAftidsIT/SFP1F8Ps+nnKteS5
         SgrT2gwPw1L6E1olx3jVLw5Mhdq5OMHwOxBRieHxTbEBwCE7QAjYGe1vnIeIP/xUzEv7
         mFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VULQN3UBgBd5VnhIE53vuqYwbx1WLZtkqFzjaxFSeRE=;
        b=O8CpWzSPCJ5kixC3o1WLxw67H0wnHQJZ+E4xzfcUz5XOBBF9WEFLEdt56TpAFS9Vvt
         JeTJZoJ+pEpvnNPaBtxLMMN8QokDd2Ql0BXTZ5AbXN/cwHgyeCUNSqNEOuaLsSdUxFGe
         vLGJegSO8nrjc2Iv/g0XayVHRsL0dQlvxLeJR3uZPA+2MMU3hT9/drVna2XtWcxJ4xAi
         3pmMyXN7PmXbJxhusswBJ/ghj/xbcpe8XA/gihfEXUX4+7W9xGxeAVWB26bZod2gjhNn
         LpWoxD8mEFkDHbM/lqMZdVFBz7iIEzAEI3B681GmRMg8B8IkH7X4v3Ygy83D67x/JvJm
         +yBw==
X-Gm-Message-State: APjAAAVo63O02ATzE+nTzXcmewRxHZjGPegQv3Soq07s4sEcbaENNMeA
	QbI/uiuuvAbnT0/SUPXIK4A=
X-Google-Smtp-Source: APXvYqx46TSmu3IwAwsguD4nQYPEF39FQ1Ilh2Vd4+mgSM+2U9C7EOG7b8DAZFl83Owc7MzEs/Qkmg==
X-Received: by 2002:a1c:1fd0:: with SMTP id f199mr11575244wmf.113.1579395087949;
        Sat, 18 Jan 2020 16:51:27 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:27 -0800 (PST)
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
Subject: [PATCH v4 16/20] tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi PC
Date: Sun, 19 Jan 2020 01:50:58 +0100
Message-Id: <20200119005102.3847-17-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: prRjKIfi/8/e

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
[NL: changed test to boot from SD card via BootROM]
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 50294e1675..399d5062db 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -591,6 +591,47 @@ class BootLinuxConsole(Test):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
 
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
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
