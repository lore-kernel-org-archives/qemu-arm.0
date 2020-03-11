Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294493lfc;
        Wed, 11 Mar 2020 15:19:15 -0700 (PDT)
X-Received: by 2002:adf:ef92:: with SMTP id d18mr6416294wro.193.1583965155260;
        Wed, 11 Mar 2020 15:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965155; cv=none;
        d=google.com; s=arc-20160816;
        b=w7fE+FcW8tysV1SMv+h4LOZZAjupeTTFAf1zCW5TJeDPMAArDc9abM2nfqcfFTNvW+
         qY18CyO6mixV+cFZiPkNv2jGyFLaC3F6it4oGR/U5/C+GWsW0rsIcbxIfdNKdE7xw4Wk
         bUrmarO6DxXdM0Ww+xyH950F50YMcr1pvlYbn0Y3O50BL09E7Qy4QCoj3Xn3Y/dqxVjD
         xC0vsPev6uUhdyHKA1qBlHs7q7DAkglyqzsog1g/aK3UjgTBCSwqoTqyypt+sBeao5zw
         Q6j9ZnHf4sUbbliLhhdGYUoTZV5D02MATp85yfpYbtkgDU8jK6W/1ipP99zCphD0+AmT
         462w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BNmvso5x8nTOJnini/wgwMirZMhQdKYkX1ewKwcN6IY=;
        b=jpmkx9h3lEz/vezko4NMqlOmeAgaX61F39PU3mVTXOfvytEYHhMcLF00d40sUqpj+8
         8BXJGQVsWgH/ESRvNqPqx1lRrE8pyxEg/U+5vM9jK4lbASHVV/BFz/UbC16JFmdgnAD1
         kRKhcSzaFtXudJBPSCvVx6NyimUKFSX4eW3QKiioxgWhkrsyd6RTQEamQSCCNjl8V0sV
         RGwcNiqQyJG0GZdNgWgw8nqCfcxSSdrReKN5G0J/LM8yUsQ/Cx53cy6F4oKgzzKo7dHZ
         2f/MurIcT7Wv/WAfDcg3/WUkrOhuNRJh9dzhhmLoo6wU1CE57nzk383tyjr3MSeCrv5F
         ukjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GepmYt+u;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r12sor2087062wmh.3.2020.03.11.15.19.15
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GepmYt+u;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BNmvso5x8nTOJnini/wgwMirZMhQdKYkX1ewKwcN6IY=;
        b=GepmYt+uTmGHdZHfA7FEAFsQ7G4++PVDpkzPVToFsXKSTy2gmQXhVIQTSwUZCmtPZY
         syHnMjyoFbbpbMss5cXxjFDJXZYz2QE7MyZxeRuMUWCy/5eR0E53zcqZ8sW3S+9Lu18e
         sGI/Hg+nWUfEpI/wlkUMjNzNOhgU4oafMOxB16SH3abYoclNyf1gNJxghtTNeppaDnMd
         JAMMQ6BY8rIwVqLTTgmfmMDiFqZElZ8mAeGbS8bBAHQUofjn0D2Bo7TUkahWvja+485N
         ddquMYGE93svsI0wJadrluOE6/dHIu/fQlqAG9szXZW+2flPBGAvn9i/deFheQCYPxTY
         hFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BNmvso5x8nTOJnini/wgwMirZMhQdKYkX1ewKwcN6IY=;
        b=rfbazmLB63luOJLA7xI2qBHjnkXApaTWt+tzcfhTaphxDGpAUritdWS03pgekOfL3d
         3fkFmSUbEn/9enPVBuS7nCO85PAqEmliYUlfk4EnLx7VSCMXtZAkFVcnrAN3pg/ysB1X
         WLaQUq6duusnboge29USs2gWHPzkxv4uK4WaWkykWk6Avy7MVT8e9a8XPyQRpLFdQMdx
         JzesoRs1ZfhXdxthw0tiKEWJMliuLHjDXeyRQi6w0DSOWVZVNF7BJzrFLfleTDB2CSRy
         GaRMCTbvafaeWzUC7Kt+1zj7HKOzMu18Tkab+m12iTzsD00pI3F8Dm6KdLsnorIX0K6m
         FZLA==
X-Gm-Message-State: ANhLgQ1ewqz8HxZLmqrLsz02SHXjaTcbWZoR/PzSYN2dbiN/ztPHuMJG
	pJiQajADekQR55fT8j69Qb4=
X-Google-Smtp-Source: ADFU+vuLZHdGA45Fk04luHLmKh8k/Uaz1HtF9+Qa9B4XYzBHAlWUzpYl96lD8OF8aWFPYpORh06ZQQ==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr767026wmi.149.1583965154889;
        Wed, 11 Mar 2020 15:19:14 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:14 -0700 (PDT)
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
Subject: [PATCH v8 13/18] tests/boot_linux_console: Add a quick test for the OrangePi PC board
Date: Wed, 11 Mar 2020 23:18:49 +0100
Message-Id: <20200311221854.30370-14-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Nt2tzOCQYrEE

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This test boots a Linux kernel on a OrangePi PC board and verify
the serial output is working.

The kernel image and DeviceTree blob are built by the Armbian
project (based on Debian):
https://www.armbian.com/orange-pi-pc/

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

  $ make check-venv
  $ ./tests/venv/bin/avocado --show=console,app run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
  JOB ID     : 2e4d15eceb13c33672af406f08171e6e9de1414a
  JOB LOG    : ~/job-results/job-2019-12-17T05.46-2e4d15e/job.log
  (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
  console: Uncompressing Linux... done, booting the kernel.
  console: Booting Linux on physical CPU 0x0
  console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019
  console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=50c5387d
  console: CPU: div instructions available: patching division code
  console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
  console: OF: fdt: Machine model: Xunlong Orange Pi PC
  console: Memory policy: Data cache writealloc
  console: OF: reserved mem: failed to allocate memory for node 'cma@4a000000'
  console: cma: Failed to reserve 128 MiB
  console: psci: probing for conduit method from DT.
  console: psci: PSCIv0.2 detected in firmware.
  console: psci: Using standard PSCI v0.2 function IDs
  console: psci: Trusted OS migration not required
  console: random: get_random_bytes called from start_kernel+0x8d/0x3c2 with crng_init=0
  console: percpu: Embedded 18 pages/cpu @(ptrval) s41228 r8192 d24308 u73728
  console: Built 1 zonelists, mobility grouping on.  Total pages: 32480
  console: Kernel command line: printk.time=0 console=ttyS0,115200
  PASS (8.59 s)
  JOB TIME   : 8.81 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
---
 tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 34d37eba3b..6f5af582f3 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -507,6 +507,31 @@ class BootLinuxConsole(Test):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
 
+    def test_arm_orangepi(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:orangepi-pc
+        """
+        deb_url = ('https://apt.armbian.com/pool/main/l/'
+                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
+        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinuz-4.20.7-sunxi')
+        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
+        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0,115200n8 '
+                               'earlycon=uart,mmio32,0x1c28000')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.17.1
