Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969947lff;
        Sat, 18 Jan 2020 16:51:26 -0800 (PST)
X-Received: by 2002:adf:fa12:: with SMTP id m18mr10646868wrr.309.1579395086566;
        Sat, 18 Jan 2020 16:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395086; cv=none;
        d=google.com; s=arc-20160816;
        b=WM9hNxWwLMoA90b1JlZ/pBsyJoZtEOP8q77cuB8YDQiE4QVtGSEpfASJHogJEhFpao
         Mj6baF/rg5oBraHppqE5cnV/z95xXFdiHNFG8XxT58TvUN7TBYrjro6jUCNiuWGkUD31
         FFiHQNcIwHTJ2EqdaiRcVwbrhchwEUhg/q8SyhBqBzaFD5o6vNbsaB//6pSpmIw6ZXOA
         tOLgRpE+mTdp+jeDutibUXPL/SEx1ovg4altkAYGQIPypU5eA1FecJNB+/EEcvehidnx
         i5J85FBiSCE1CAJJ6lO05hKqytAjLgVDD2/nv41u8BSM5dff41b1hNi3VY+ySuuyqmE/
         CnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A8sW+Qoxgu97jIcBzDnpnJYJBQZgztmcRm9/frnIpi4=;
        b=L+Y7l93U8vUpB6AaCrmRFnDvfyD0aln9Gbw7zMKOP8jCoZUc57WyTcNprhCEJYeWD1
         NzouE7Ukr/tMf22NgXtFxcevo4D2xVO2cRx6pg/xmheKKRPccbqeQvU445Ksx0BRblFn
         L7nrwnOvt0dQ0534rjjK6px8AgDUZ57Z8pzCThSWLmmJ3Dwlo+1wuKmPuzRtrK77Nwrq
         46cRofNQlrrrx3pKFBDgC/pvGxMaidEDrPAU9losCY9qeBQarI1EeF5klNIlN+JYv2vh
         dU8isZZEyzWzLECf+o+QQWymQZomrhrI6h8Yz56b1EWCc2YmYGNpNmlZXPFC/rRk+sF7
         dIdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qgS09amx;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o12sor13272610wrq.24.2020.01.18.16.51.26
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qgS09amx;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8sW+Qoxgu97jIcBzDnpnJYJBQZgztmcRm9/frnIpi4=;
        b=qgS09amxQJ1JePBX468oTS8Lzn9Zm2zY6pjaNPryWQGIhsivHOVrr6DLPNW6NP3K3V
         2MgNwfM47qFFamRAsVk+ocKARu7FVBIy7kKBeFd7r8UfFHaaECzigcchdq5d8de6CgyZ
         1I0IwU/14yp97yhKmYBTvzbfCKxZ7Ve3PDklPWndcKZawGB2v0TcpsiqlPhIbnIc1vBF
         pGfv4JO/2DHVc3ibyJBvO8YNSInThedvjeu2dL8EPozsJLct6wRytjSOnuYCodwt4cEh
         x+WveNKB8n0tKM5FvUEfUfjJkQbrtSq8mZXNqqLrfbud2kbP5Xdh+aLxS12pu+nfXnHn
         fvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8sW+Qoxgu97jIcBzDnpnJYJBQZgztmcRm9/frnIpi4=;
        b=gek0rkU4l+oUpPzC4YtM3HTgBbj45pFbDSgrxlERAgvJyVmM6n0tcP8UY5zOmA6T/h
         dDbqYzwiP5hvsdJGbj/0T6Ft/CrX30yTcRAmvVjkJ/7iPcZ6APnFlXkPmxhKfcuo2ZmG
         mr7mMYC+O4eJGeL2G60ZFNsAnsUjq5xSWbQbEQaUDr4DiEJ2d1Bn+gzyMqQyqllKWOks
         NIse0TBAliNliRVkd7GpgLhLKFaK/UdF2a8xi9YCQhPhyMSa3OxkrLMh4u73+Tf+ljfc
         GQkLtFbDWtBB1KNIGB12jdxLfBpPLh/n190YX1flniL09UjAcZ8zAWMjlJtkM6m0cm7X
         h/2w==
X-Gm-Message-State: APjAAAUVj+MfyQYYenGMa2jynm+kTNrbpfbg6V/tA0qWzQZuEiBchnf3
	SZz8u53AD+8eLzYWwXjj7R0=
X-Google-Smtp-Source: APXvYqzK2llSlI/v0D8w3M6+zOM53seO/mCEls8V4/uAodj37hquRd94hYvdpATYGIEBCkAWXNrs8Q==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr10668548wrq.196.1579395086185;
        Sat, 18 Jan 2020 16:51:26 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:25 -0800 (PST)
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
Subject: [PATCH v4 14/20] tests/boot_linux_console: Add initrd test for the Orange Pi PC board
Date: Sun, 19 Jan 2020 01:50:56 +0100
Message-Id: <20200119005102.3847-15-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J1zjp+mEHYzP

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This test boots a Linux kernel on a OrangePi PC board and verify
the serial output is working.

The kernel image and DeviceTree blob are built by the Armbian
project (based on Debian):
https://www.armbian.com/orange-pi-pc/

The cpio image used comes from the linux-build-test project:
https://github.com/groeck/linux-build-test

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

  $ avocado --show=console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
  console: Uncompressing Linux... done, booting the kernel.
  console: Booting Linux on physical CPU 0x0
  console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019
  console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=50c5387d
  console: CPU: div instructions available: patching division code
  console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
  console: OF: fdt: Machine model: Xunlong Orange Pi PC
  [...]
  console: Trying to unpack rootfs image as initramfs...
  console: Freeing initrd memory: 3256K
  console: Freeing unused kernel memory: 1024K
  console: Run /init as init process
  console: mount: mounting devtmpfs on /dev failed: Device or resource busy
  console: Starting logging: OK
  console: Initializing random number generator... random: dd: uninitialized urandom read (512 bytes read)
  console: done.
  console: Starting network: OK
  console: Found console ttyS0
  console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019
  console: Boot successful.
  console: cat /proc/cpuinfo
  console: / # cat /proc/cpuinfo
  console: processor      : 0
  console: model name     : ARMv7 Processor rev 5 (v7l)
  console: BogoMIPS       : 125.00
  console: Features       : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
  console: CPU implementer        : 0x41
  console: CPU architecture: 7
  console: CPU variant    : 0x0
  console: CPU part       : 0xc07
  console: CPU revision   : 5
  [...]
  console: processor      : 3
  console: model name     : ARMv7 Processor rev 5 (v7l)
  console: BogoMIPS       : 125.00
  console: Features       : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
  console: CPU implementer        : 0x41
  console: CPU architecture: 7
  console: CPU variant    : 0x0
  console: CPU part       : 0xc07
  console: CPU revision   : 5
  console: Hardware       : Allwinner sun8i Family
  console: Revision       : 0000
  console: Serial         : 0000000000000000
  console: cat /proc/iomem
  console: / # cat /proc/iomem
  console: 01000000-010fffff : clock@1000000
  console: 01c00000-01c00fff : system-control@1c00000
  console: 01c02000-01c02fff : dma-controller@1c02000
  [...]
  console: reboot
  console: / # reboot
  console: / # Found console ttyS0
  console: Stopping network: OK
  console: hrtimer: interrupt took 21852064 ns
  console: Saving random seed... random: dd: uninitialized urandom read (512 bytes read)
  console: done.
  console: Stopping logging: OK
  console: umount: devtmpfs busy - remounted read-only
  console: umount: can't unmount /: Invalid argument
  console: The system is going down NOW!
  console: Sent SIGTERM to all processes
  console: Sent SIGKILL to all processes
  console: Requesting system reboot
  console: reboot: Restarting system
  PASS (48.32 s)
  JOB TIME   : 49.16 s

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 7b4e400511..463aa65f4d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -510,6 +510,46 @@ class BootLinuxConsole(Test):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_arm_orangepi_initrd(self):
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
+        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
+                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
+                      'arm/rootfs-armv7a.cpio.gz')
+        initrd_hash = '604b2e45cdf35045846b8bbfbf2129b1891bdc9c'
+        initrd_path_gz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
+        archive.gzip_uncompress(initrd_path_gz, initrd_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0,115200 '
+                               'panic=-1 noreboot')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'Allwinner sun8i Family')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
+                                                'system-control@1c00000')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.17.1
