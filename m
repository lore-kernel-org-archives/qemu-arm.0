Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518659lfp;
        Mon, 17 Feb 2020 15:24:36 -0800 (PST)
X-Received: by 2002:a5d:4a89:: with SMTP id o9mr23540082wrq.32.1581981876669;
        Mon, 17 Feb 2020 15:24:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981876; cv=none;
        d=google.com; s=arc-20160816;
        b=dNK18Zoyq0R46SH5pvTXSX9+CpvLqrVDCuML12dVRYonL7ILiwq/0GphNinknlJcb1
         PnZ8AN+eb+kMg825YKOCduFW9qoq9HqAOGBN0x81zu/LO8qetfvmEBz2MO0SEUI68IfL
         MDz3tpS2U0OLT/cEechPl+H7cuT9fGnlU8/6kxbQ3SLtJInbYkInDbE5Yec6ki+Xebci
         UuNcSpJYjkKKakOVjg7mhXF3+VFNs0THvQdbFm9u7M+6+41+mhQ1CoSVet5Vif141slT
         +MnZgmiMGw4yFZNgehZEt6R/5LIBUMP+1gk8HK8SwkvDIABAPVyQVqU3sOn1tImYybSs
         Ewsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=KAU9La2ZURZOomuIAfJBufQfW6YtEEXAz8Yomxe91+mbWAaJS/sRSQkmg2kiy6uVyY
         OWwN+DOy3t7ukrEtKWRjCP9AmtA/VGr4b6o1tghp/GbVuc7YLFt0pqh8bZWj7BLhDh5j
         Lm5b6gwxS16OrPNnDaAn+Xm2vrQLGiSeteV03FNiJEP52/YHrZdqk83i5cnsxiLcHztz
         L++jnYnAl0N17wjlZF6V4lq9MMgVAQ+RHkPV4y80qcY5BGix0eDHPUZw6zcE4CkXppj0
         4jLhN0iAqaTSNxLw2cagPo5QMQCa3fhPDzWnCPX+xRTqT7S3DCcxAJ9SJ8ESeY41ixN3
         XYDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="X0A/2N6y";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i132sor568095wmi.10.2020.02.17.15.24.36
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:36 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="X0A/2N6y";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=X0A/2N6yCToeh7aIWE5W76oXQilz2bvCZQLV284HSj+VDA3TV+wHJgFVsKZ2Jflkjz
         8JHL+PlWd3ABCuXHd3vREkxXqPigc0AbfU+TheUvYJ2I3caGtrd7e2c6d+hbJRGVql+L
         Y+WLBSLkBOlLqJ0pr1W0xZQh0fFg2xuYhqMk2h/b3VT/1dGmozdVxkqAjoqeaJ3A4Hkk
         fVba7U/J9gDxTM21+s4RW0YBgMmIa/fcPauz1jDMj6i7em7EhTe9+PTV5yZnmnqYXn2A
         f4ThabQM54s4HWFOeSAPdUn8KWHzdxg5vvRt6vKEKHj/EyYO09IKofMG9Tj0E1e/KMTL
         9dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=E3SKFWkZc7m257ZYBO22+ugbyFD+65Bl6+Ltbw9oqYJPSXfj3ZaSPk06NOdP1TD88H
         AYynjOYjjAR3WQ6HpGwXFdHMCutMTPtVjV0cXDtJpveVYOmDHPJf5qt0RaGP0ByJd6hN
         dq4oy5T0bPuTSqxFg7v1PdLkjrgko1RUaasagBtuVxp8QZB9Umsj5Hj9NN8jKsy0hQOO
         1Uqnhe261hiiXrPhfESI16tCaulI3Aa8W3yuHOUqeoB4PY8qmFBW2w/DaVWV+FviDWqI
         ciK1T8uLy/vT0nrtXfqPKC6bH/uuqGTapBGSwivq+QObmu6y7QtBSH1uJC5j4NB/ua9C
         oICg==
X-Gm-Message-State: APjAAAVufSHWFy9Ci9z2DIFmApR7J/4W5vX9x7kCKfQDYdUSOKIldfYt
	DLXX+WaX7lk3mrVUGi5vOYg=
X-Google-Smtp-Source: APXvYqw3bPN3rkgwSiMyVMETa2MYG+V8ExDuaYv2mRqGRavTHP3S2hKQdEM+auNSVyS5+Vu2luRqkQ==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr1173854wma.159.1581981876286;
        Mon, 17 Feb 2020 15:24:36 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:35 -0800 (PST)
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
Subject: [PATCH v5 13/18] tests/boot_linux_console: Add a quick test for the OrangePi PC board
Date: Tue, 18 Feb 2020 00:24:06 +0100
Message-Id: <20200217232411.30096-14-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1DBK81jJ0MIF

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
