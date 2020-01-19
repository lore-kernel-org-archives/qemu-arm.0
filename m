Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969940lff;
        Sat, 18 Jan 2020 16:51:25 -0800 (PST)
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr11055747wrm.324.1579395085842;
        Sat, 18 Jan 2020 16:51:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395085; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6ojIfIcdP6tHspRT+5Prc+fmcxSpGzt9arDwC/YOjm8SA75IIw9+oO21p/lwFT5kz
         kx+4HD/o97of1nugKpT2bB2z+wivGTmS73xrjIOJpo5nxnCRjU9JcNiBbBuHHO/NLBr7
         hcNx91bnmPijMIvGCkekvxV5RuB6XjL5/K50rucBvJibSEGtMNhU+wssW/UH4qz74dIa
         Z44P//Qmj+Yx2vcqt6/yZjdWMvqMIw6cN9KAJkp3c8jJDCpoldnhFjvs8reBGDNZWQa+
         YHQzZV8u1rRqPItOlBRU+jjR46z4pHNIEKupektBtupLfo+6rpdGjs9Pb9JH1UpRB1yY
         UQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gj9MfqQ4g0gxrMGRurIqnd3B7kueuamwPhIZEZilveQ=;
        b=miM86mwzmbphMB8CEWREZSmfXAs5VHWeab63XlfPHBdU9zII23GcuS3eT70Bx+02mV
         hxDttk/wZtrtRnDcKew9CzYIJUBJ/goQMeO68PnHdYCjov6H4anwXS7BjpdrlATd02Sx
         9+GZfdZw9x9G9oOvc0A/qSC/bs16idDkXcpFeldKZWc7IMXjab+Kz94FqYyUpfTmL8P+
         JHGx0+T75l1PuJHH83E9MOaMIilD7ctSWz2LEvK5J4nV54FFl+q0a9ejt1+TKacZWeqQ
         mwqV/YAk35smH/ibf2xFS2HaTOhVAWy8CnraKbJbmSSZdRYvM3E7SlzIu733GMwA3e8J
         XaSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZZf5lPnH;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n18sor6322606wmk.29.2020.01.18.16.51.25
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:25 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZZf5lPnH;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gj9MfqQ4g0gxrMGRurIqnd3B7kueuamwPhIZEZilveQ=;
        b=ZZf5lPnHOqXxlkK/28C3P6xBRxW+KtQ4UThtUm6xYtaMedu03b88hGWK6IZfzLj2np
         hCcvvDNEgcDQzN2iJun0cu4pyNx8ldeM081O6BdYKJVBSC6CscolZiC3d4bJvfRutyKy
         QKcVlJgUDZ8zrGf6MO0lPK6frRMtAtDdbaAnYkxsIOohfHwoRSq7ytZIWLlMTmboy24F
         svrZgGNjKxp9CQKXfefaAKiqoVyc6nZgw6PdczjwmNuCQcuPIO9gGJyqNRUdSr8HVOuR
         aNAfjygCwPRTwTQKWYFnE3GtA715uDKrwt118Of5OxIYRo2O404B/pGLJScQKGKnFdDc
         msAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gj9MfqQ4g0gxrMGRurIqnd3B7kueuamwPhIZEZilveQ=;
        b=ivNkOT5aER4COD5Yjx+SFd0ZxYrrM/uCDmJBnnurxCVgq9OrfSKnt0vqFa6womLkay
         jVLt3R07UtLfkRIvjH7w5jbs6CkttjBZ6y5MK9CAm7sm+VB5EAYcFWGDdH9iWWcEI+Vf
         kfLWeGZaRcVqFszL7zy1jIuTs6X5iLeOeGMVNZeBM1dka1lsG2GSD/1CTWLQSK3o5Mct
         QuyH25L6ktifp07fZvt0vurYPZ2PHNN4ViDhVpNr8ly2MFGWQDAU234DNQlq0jaUMJIQ
         W50QbavvF92ID+A/6xrRbrYrVz0C3MtPJ5DafMaA7iw1zQ6pGhUG/l6dohQZXE36IT3s
         5KEw==
X-Gm-Message-State: APjAAAXcDn3/OXomxwhnPjRng6JDNlqMWBgoV/y9OAxb5yXNDiDlemb8
	MATlkEEZRP9Y4Wj0txJ9D/s=
X-Google-Smtp-Source: APXvYqxfFw4go6bu7u01wtQ3Lupp0kBVkK0p4eJbYcQPnBrskweh3ZxXddvE6raeiL/N12zFmzoJUg==
X-Received: by 2002:a1c:964f:: with SMTP id y76mr11546355wmd.62.1579395085470;
        Sat, 18 Jan 2020 16:51:25 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:24 -0800 (PST)
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
Subject: [PATCH v4 13/20] tests/boot_linux_console: Add a quick test for the OrangePi PC board
Date: Sun, 19 Jan 2020 01:50:55 +0100
Message-Id: <20200119005102.3847-14-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 80bxDnCHb/VS

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
index e40b84651b..7b4e400511 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -485,6 +485,31 @@ class BootLinuxConsole(Test):
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
