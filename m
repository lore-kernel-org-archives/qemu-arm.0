Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294508lfc;
        Wed, 11 Mar 2020 15:19:16 -0700 (PDT)
X-Received: by 2002:adf:ce0f:: with SMTP id p15mr6958079wrn.66.1583965156149;
        Wed, 11 Mar 2020 15:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965156; cv=none;
        d=google.com; s=arc-20160816;
        b=hwtYOpK7oPGYXiKlJhWPTCN8qo7kHoBwzYqCdQfuELeonF4ui05WXi9sLcRCOgCPvh
         4uvhwnUvXMfNjY6eP3GELZjwcvB51WfteWDUvej2JiEDd3IwNcjrJ0guBTKoAadAsvGZ
         rDv6hC4DqNkrk1xZbm+bw5o3bQHlAvQW4VFmE3B/s3TR3HxB01rjhf7W/oBSsvDTn0v8
         vzbSD4xxyb6xIi/26Y16yJEfX4a2MlhZpmnYHRRjUM6nagxwLPEY4y4lQql8yT6mNlKG
         4C98hRXvYUYLxBwBAFEMKIl03VSGG+u9V0L61rdA1lMS82NM6lCGiAUM6JunCOQ5tksM
         XYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=l7IYyGVp2xV/qjOXX/r39wrJQpfJnyhEV5xXNseHCcM=;
        b=lKjkQFKRFi1xWv40GQT4Qg9b6Fa/I064ZgHFtcgNdG/tLgKxU9/t1DF2LoOPtxh2nu
         WIrf3U697TP6kJ2tbmC8kPVIa6yK26PYuBXla9NAS0VfEWc8cUqgtdRmeFEOryzFoDCS
         248Uydypogf9tH7OYltHbiG2Me7FR5tf90+A9MJDRXcXgYgIIfTl+NKNVN9UaEAgppjD
         wfvosGzJhNVSHd9YncYBQRXYnzBEpEh4Lb9jMjiaT02PIg+LcfGNIXU07GFsaC0zQb+v
         JE2Nhmvt4Vjeqz06/7MwYzOxCugtz8H6uYGv9L7ZGn3rTAl5Vu1Rky2KyMyO0tDndrEl
         OsPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qXBPNygy;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k186sor2041918wma.18.2020.03.11.15.19.16
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qXBPNygy;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l7IYyGVp2xV/qjOXX/r39wrJQpfJnyhEV5xXNseHCcM=;
        b=qXBPNygyIG5J0NYd8n3pzZ4d4+ilq1dvFyxxOdaiJyFgbm0uyxnk3mk0JvOzP9hlHx
         fDQbLpKba3+6Zg3Yza4N5PQ/7AKkbnIwejZOyEM3Z4bMbUDjt8N94pJIQWwlOTf3d5CO
         OHLPTOT0D7rOxNEWYVgAuW9f4TVJreQv3oeMTJLYbAtNlkCR1FxXR/wRtZlQCbpNwDdm
         xKsNSUJpTrI9MUI3OgQChuMf/ENneB+icpC5ETdzriwTC7RTmtaMMrDl9+BcFpc+3OXc
         sE3j93XbcAdjH8EHKsswXiD8Wq8USwVoYnlq4OUWbqpbHSSi3JrIon46Gfq1RcIvyVaA
         B54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l7IYyGVp2xV/qjOXX/r39wrJQpfJnyhEV5xXNseHCcM=;
        b=dTZfFv/w90wKopSeOexI2AjNNKReDqCwqkGcT5EBTDVFf7VxrUfvXQmkPywMPg/VeF
         50VGuTNEyrzw8C/8ai11pi77W2vMFjDWLnm7ccdPc/q98OnsSmWWmNHEyaSE89gxTD8W
         dSY+qCwYv8H1oWypaBwRGEeSief38ujzvOPEAdJvBng5utUk8jPE13tjhG4pOzY+Wyu2
         Gg1rOjCXEQp9DiRTKN2CmSLZ7iH0c/h6iPgRxtKK2KBwuG5PPN0CNf6v3ErmZ1raH3Af
         dHHwg76aA8MzUrmv/TR74CB4MXtVR0SP4T4ZPzYC6CEGYNM/1HKJwPoxn7KO5DPBoYi+
         fD1w==
X-Gm-Message-State: ANhLgQ1yQCgLyiT04pmbuNRS2Aqjobw/Ha7NJg2def8D0jA5gWgfj7rx
	6AYBPPgqA5ROBb42ls5kDak=
X-Google-Smtp-Source: ADFU+vvoZlee590J6/PD39YCspG40JWdGooMqELRVvGuh/zXwb8nqM22+gl30WqHfTnBxVLREt4c7w==
X-Received: by 2002:a05:600c:414e:: with SMTP id h14mr779854wmm.179.1583965155710;
        Wed, 11 Mar 2020 15:19:15 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:15 -0700 (PDT)
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
Subject: [PATCH v8 14/18] tests/boot_linux_console: Add initrd test for the Orange Pi PC board
Date: Wed, 11 Mar 2020 23:18:50 +0100
Message-Id: <20200311221854.30370-15-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: klvN/TYKSfqV

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
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
---
 tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 6f5af582f3..dabc8ef2af 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -532,6 +532,46 @@ class BootLinuxConsole(Test):
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
