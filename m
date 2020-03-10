Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226740lfc;
        Tue, 10 Mar 2020 14:32:23 -0700 (PDT)
X-Received: by 2002:a1c:a908:: with SMTP id s8mr4181154wme.133.1583875943544;
        Tue, 10 Mar 2020 14:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875943; cv=none;
        d=google.com; s=arc-20160816;
        b=jxS3ZcA6k1nZxzHKSIKHQRKwIqcLGybKBYMvXYHcoGdiwIswSA8MtzSqU0CZENWWPl
         DIEpUrkOUvHD2z3HoD7SpufM8JSihWldHTiq3q4qzJsMlCOeeMo7/zZXRZLE+Q2B/WOh
         cJg/TuRhq/nFmItdS1TzCT5ApUg1xT4fvPfu6/7YTEUmpfmME9dQWnlI4yu3x2hKNCeW
         AgJEDGY+ngcjaNj0rhGobkW8LBWii79IsqCu2DD60RZx/nvN1n6L+JIQovx0kUyq1uqu
         VNuDNIz4loo8H/hJBUq9UNptbVBRtJn1+kqiyGtqVM31nTyWOyxJgUcvXG/olla5nhy6
         3C8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=hecfvT6Mgm4u2XSE3OkT9A6PzGRbR0n/8kHnPrjOhB5Pqm59cT7fsPL1qtRt+698w+
         g/bro62Y6cELsmGmAq/gZT3SKdZ4K69t75H+IwqJifWHf/IxkHCpaGSiJsQNG4F4PDx7
         lXByEa3Yn4ls1zMfI0L6Ua4xK1PqjOEzCdpSE+5wVcnJxWMazbtN8CjxMehAD5lclyT9
         S0ugm4XtwQDUqaHm9yaV7WSEAJSqmH8+6Uc5IJ6p+Dp4tXYmYz3YT7ENRJOEDTVFHK9f
         Cvy5sRRkP5jXqHLQ+pA7+uMcsnpyodcnsu0/BWSz7hE0loDUjUlTOo/2EvnNlAEnXJqO
         3YZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JveSkupl;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3sor8567854wrm.3.2020.03.10.14.32.23
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JveSkupl;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=JveSkupl+5eNSDTOIvs1Vko1i3mKsOZ6amDPx6oe1HbWU/7C32h4JyGO3WkCRvv/16
         TqV+9cpI9cl19++g1ze+4IYAga+O2FL95t2OOFZpKOQnfA/TUQ/NLxAiopref4mezztb
         qHdvwR7hrhayqIqut899vwlhxNXqLG1XOFaWjeE4dy10Yxh0ULnDk82sWJHsaQEdTTyP
         TovZpRlKq33BNDFvJpkLk5tpCmuT8xmobIkMidLgsVaGKK0onCQJGaqT+kEWZ6hvmJ/2
         dkGcJFDewSjY+e9nlGuxxOhd+qZTkHNmRJTM5S+ETsCtbtFlYVijkb1v3vScpBUfjAh6
         Y3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=YDfsX73zmmkyqTUbcMSP9eQcPQ7fLxkHjwnEx7pOSOGMMdx0c4Itto2oGAJLjOPlUR
         F3WTIAtxMym21i55FB1t+Cpi32qY0Dgdb3ybXhMNC4ql0CqSp7cZ4G0yjYV32oBfbBes
         bswSZssHQyPzUnN6cTFkys733YhqzsEP1/qR4F8pNFhQzSRAhPmP0+nsrwT59dQiGJc1
         Mi3snBzt1t8riRwkNkEHNrt2FevPnerKkrfnBHWZQiws05CPHGMqiUtARcDAH6QBPWk4
         cDG7Au4P0HdsXAXvXPWf/wy1km8JGeYyXQ2fDegwxwY4ijM6Aod0k8INg4+9w8xOoAY1
         lClw==
X-Gm-Message-State: ANhLgQ3fqXxKA9cVyMyYmFq7mRvonrfXQi2zQnoIkKJRt7S68UP0aDlC
	HJaoJVEkYNnxdoFaoUU3M+o=
X-Google-Smtp-Source: ADFU+vvxwgH/KqZoiCrOIPjsRFVHRV6Tl6Ase3IamBRNx31BvNdPPDo/qXWFsBVt4S8Ch6hOHSDiSQ==
X-Received: by 2002:adf:c648:: with SMTP id u8mr21346509wrg.185.1583875943160;
        Tue, 10 Mar 2020 14:32:23 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:22 -0700 (PDT)
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
Subject: [PATCH v7 13/18] tests/boot_linux_console: Add a quick test for the OrangePi PC board
Date: Tue, 10 Mar 2020 22:31:58 +0100
Message-Id: <20200310213203.18730-14-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310213203.18730-1-nieklinnenbank@gmail.com>
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GZvLJq6ei6jF

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
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
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
