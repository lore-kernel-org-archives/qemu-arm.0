Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1709219lfg;
        Sun, 1 Mar 2020 13:50:47 -0800 (PST)
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr8826149wmg.148.1583099447418;
        Sun, 01 Mar 2020 13:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583099447; cv=none;
        d=google.com; s=arc-20160816;
        b=ea/h0m94O9asaybsh4JKN1l1+x2zGnq0Yk/JBclfkrU31xk0DqL8lHKyQZdrU+DcU5
         q6fFCeWK2Dn3qunV2XtT251RgLBxHNKiAHg2Mn+d5HiEwYGeplJkkIMsisjp1EmmdkIp
         3gDj79wFNzRyq+jkJA20XYJsjbhUWAUE7L8dS3icrgM7o/QaFGZFUwtHlAdSJcDiJGwF
         e9SXNi+80NUJiiOyxf5PQ/dSrStLDblKysicK3ACH11wNBXbZDQLxK/DxU2zJnyelRlO
         zrTsEs7lc5aarWLEjU6rC303xiCWhxh9r4QgnN1Y0UC7xR3tQ8nvkR7v+vWPxuun6Oiz
         +mGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=H9favgECBAcSaIuOk1VIojxjQ7ZC++Ymy7IxIDqhro4dOuFpjSpZ4KcBrSlhVF1AjF
         drXb0ORqCss9e0lx9CilJ7qvT0PcvdC3QTy0alXkKgpAa1A5HRONDGiYIihmTvln3TaO
         zJQf1dP5FiNS+v+5HAZB2Rb8Hdmgj9YV2cMTew5pr6bHMpKfvW56M8lZ6/RHY8AlhN/x
         olpqPA0ab5wCPrkKurtGpi5YjLayBq8lvlZF/mvPu6DdVKRb/HFAXZe3isgDHy66M9b3
         Te08OP5hseDAT5RxIvZ6amNk+GIflS7CLpTUQwH5oc4uNHewZwn5e2iGuk3tJBxJrR1F
         8aEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NEBtVBhX;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v5sor4731473wrf.56.2020.03.01.13.50.47
        (Google Transport Security);
        Sun, 01 Mar 2020 13:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NEBtVBhX;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=NEBtVBhXTfWDMEoAjbpV8UtaScp8dRnlIUnzPdrpZN4ydZ+HflhDrY4kXq3pNJzXup
         xvpxnQRcJ8AkiogTOr9JMTdpzyW9ZIZlGi/RSJx7uR628pDlkfce0ewrZFM/V/Xx2NI0
         ronlMONHZ28d81qyI9cxFaWscpVNIjFfY0oY+nFP7PL0yS9SoKis4HD9i7CkKAM77KBF
         W55z1NU2FvsqAasObd9Utuu9b3zP/4RDGxm9Czkx45cgiY7B5sMfHkjzkSzxhqNAv7xC
         EbrrtdgecRe4iVz6fmCfPnZDG/E1PwZP0wRqzuiOvXqerGTaGkEBbal9A2E2cVWoW7XI
         H1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zay2CMCI6rS/TelvVAzMjELUkYNv61sz+75/jzgsL7Q=;
        b=miEF2lHceEG/WpWXkZQ7iHlOVQSbWWOwg7hKn+n7p6asjhqYRO+9sxHebWW+OOCuF8
         hzhR/jRUU746ZQgfu5sD6Ny8xNDnSOHklsiEr7to6uooaC27j3WeWbxaWarQrQehXgVz
         HNdpo6WikAsduScFoarJxTUu6sYmi4HBiKkf9BorjJuftC7hyzBXV60tUF1kLQQL60a4
         8D5aU0eOXlPk6O4eGKcY+aUBm1iWdlpCHUG0ee6e0bncocwTus/EOuDI50KW3zFF8Bdo
         0dmzooVNhqyoswzRP0E9Oo3g1fog9kV7qILCYW+4Io0arIwwQ0D+/5nRr3W1o4h7zeeh
         C05g==
X-Gm-Message-State: APjAAAUZyPmKzHzj5Qxq1XpuYkf6pDmbb16ftqfBixj5KmpBtICz7vCz
	4/zHFJQfZQ70pCoXH8zidDE=
X-Google-Smtp-Source: APXvYqwH5BcDxs2y7NdbmpF7EMBVovY7VZr5WgxSl6BbMABG9Eyrtm2us0KQBCAXKW7Vq78HVgmLWw==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr17043352wrp.97.1583099446913;
        Sun, 01 Mar 2020 13:50:46 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id e8sm25033124wrr.69.2020.03.01.13.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 13:50:46 -0800 (PST)
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
Subject: [PATCH v6 13/18] tests/boot_linux_console: Add a quick test for the OrangePi PC board
Date: Sun,  1 Mar 2020 22:50:24 +0100
Message-Id: <20200301215029.15196-14-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301215029.15196-1-nieklinnenbank@gmail.com>
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dzsaac7DnJ8C

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
