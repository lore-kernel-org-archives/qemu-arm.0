Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2439256ejm;
        Tue, 18 Apr 2023 04:24:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZuTkY0qHkogm/fCteoHR4VeHOjcREI69SWS9s8z46vB07LYC0fEBiLChABKA1Fa0Rksll8
X-Received: by 2002:a05:6214:5008:b0:5a6:24f6:724d with SMTP id jo8-20020a056214500800b005a624f6724dmr26884757qvb.13.1681817055100;
        Tue, 18 Apr 2023 04:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681817055; cv=none;
        d=google.com; s=arc-20160816;
        b=nh2jidrpjbqTOqLeWjdUMMuoRqTnkgu1cUYyUCOJ+QTLRXIT8yj04/LHZZBJpqGOvE
         ebo/SmV2SDHQZwYymzt31G6bADiRIBLbqrSGKXZQWMa+uuQTp6lEzH2A3KZEVShjM9Kb
         VXv1cixcRamuf0K7JDx2wV52zpEBGYyMfBDOoOgT6weOaen4iNJJJCjeelBycuiaGqjG
         asKQ82fEIIMt+R1Pr8gyxhfgLcYoVslR1ClXr0rcGkdCSiVZx1u9fVU2REutp671dduw
         AM5AMX52sXUpizhD7nSLGbGx2loiso4wRGAnsfoVPwv+XGmXOeXGR+zbJGyPf0iVdRyQ
         qnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Weu6nKau+D9s9+IvOxYdKyovTLJRNQwEMLTYbLqzJo4=;
        b=qjJqnTafVtm1VwsR4nvnqBIjULS/y6FTRnYvxckTMFk/kOEnbgUZ92sMiQTSeTshk9
         fNMkgq9hcl0DbJkkvWHHQT/Wf2u2KvI0m1p+44E5xFMbOJc5hqmoBy3PGb+KruBlBYnB
         ahZtSOVkY00lOg/vU7i9xygZeDtfXRJ79cSiu60JG3OG4OdSOw91Hashai9O7ioHKAPx
         VKJm4SGIVDsgoHAKGjMee9Kqib3AnJ3cqouUWT/ZHvSWNzk6LbikXemoz4Qpr+L0Y95F
         JKyomKP9DAfwtS+mp8is3mCEHfXus/CR/750lYmBPMG/2XT+AScZmmKepCGM+cYwo/Wk
         sC+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=Z+bMEPjg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020ad45aa7000000b005f03efb660asi994925qvg.111.2023.04.18.04.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 04:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=Z+bMEPjg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pojOQ-0006UG-Dm; Tue, 18 Apr 2023 07:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pojOO-0006S8-Rg; Tue, 18 Apr 2023 07:21:00 -0400
Received: from m12.mail.163.com ([220.181.12.217])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pojOI-0006jg-LC; Tue, 18 Apr 2023 07:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Weu6n
 Kau+D9s9+IvOxYdKyovTLJRNQwEMLTYbLqzJo4=; b=Z+bMEPjgb00tzA3r0ln1B
 Qqh2nTh0JKcDQKQvABoAkbo6hIG7ugKCSXgnFtCQ8z42jcpAzXPv+nBFHnqGL35p
 qm4g76CNoRhKIgK17229KOWPgzfx56mW2WNYCiygbj9mK36Bm5rGccOgC1+idtCW
 PiweD/btNmSJj42fAKW470=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id
 _____wDXy2EIfT5k6AUwBw--.24225S12; 
 Tue, 18 Apr 2023 19:20:45 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v3 10/11] tests: avocado: boot_linux_console: Add test case
 for bpim2u
Date: Tue, 18 Apr 2023 19:20:39 +0800
Message-Id: <20230418112040.12460-11-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230418112040.12460-1-qianfanguijin@163.com>
References: <20230418112040.12460-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXy2EIfT5k6AUwBw--.24225S12
X-Coremail-Antispam: 1Uf129KBjvJXoW3JrW3uw1UJw47Jw18WF18AFb_yoW3Cr4fpr
 WDJr13Gr18JFs8Jr4IkrWUu34UJw4vkay7JasrGrZ3WFsFk3yvgFyakr109rZ8Xa9av3sx
 Cayqya1xWryUJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR6by_UUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXQ9V7VWBpR1-UQAAso
Received-SPF: pass client-ip=220.181.12.217;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8pYvvdMruy+c

From: qianfan Zhao <qianfanguijin@163.com>

Add test case for booting from initrd and sd card.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 tests/avocado/boot_linux_console.py | 176 ++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 574609bf43..d17417828c 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -760,6 +760,182 @@ def test_arm_quanta_gsj_initrd(self):
         self.wait_for_console_pattern(
                 'Give root password for system maintenance')
 
+    def test_arm_bpim2u(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:bpim2u
+        :avocado: tags=accel:tcg
+        """
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
+                   'linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
+                    'sun8i-r40-bananapi-m2-ultra.dtb')
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
+    def test_arm_bpim2u_initrd(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=accel:tcg
+        :avocado: tags=machine:bpim2u
+        """
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
+                   'linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
+                    'sun8i-r40-bananapi-m2-ultra.dtb')
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
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
+
+    def test_arm_bpim2u_gmac(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=accel:tcg
+        :avocado: tags=machine:bpim2u
+        :avocado: tags=device:sd
+        """
+        self.require_netdev('user')
+
+        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.10.16-sunxi/'
+                   'linux-image-current-sunxi_21.02.2_armhf.deb')
+        deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinuz-5.10.16-sunxi')
+        dtb_path = ('/usr/lib/linux-image-current-sunxi/'
+                    'sun8i-r40-bananapi-m2-ultra.dtb')
+        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
+                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
+        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
+        rootfs_path_xz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
+        rootfs_path = os.path.join(self.workdir, 'rootfs.cpio')
+        archive.lzma_uncompress(rootfs_path_xz, rootfs_path)
+        image_pow2ceil_expand(rootfs_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0,115200 '
+                               'root=/dev/mmcblk0 rootwait rw '
+                               'panic=-1 noreboot')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-drive', 'file=' + rootfs_path + ',if=sd,format=raw',
+                         '-net', 'nic,model=gmac,netdev=host_gmac',
+                         '-netdev', 'user,id=host_gmac',
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        shell_ready = "/bin/sh: can't access tty; job control turned off"
+        self.wait_for_console_pattern(shell_ready)
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'Allwinner sun8i Family')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
+                                                'mmcblk0')
+        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 up',
+                                                 'eth0: Link is Up')
+        exec_command_and_wait_for_pattern(self, 'udhcpc eth0',
+            'udhcpc: lease of 10.0.2.15 obtained')
+        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
+            '3 packets transmitted, 3 packets received, 0% packet loss')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
+    def test_arm_bpim2u_openwrt_22_03_3(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:bpim2u
+        :avocado: tags=device:sd
+        """
+
+        # This test download a 8.9 MiB compressed image and expand it
+        # to 127 MiB.
+        image_url = ('https://downloads.openwrt.org/releases/22.03.3/targets/'
+                     'sunxi/cortexa7/openwrt-22.03.3-sunxi-cortexa7-'
+                     'sinovoip_bananapi-m2-ultra-ext4-sdcard.img.gz')
+        image_hash = ('5b41b4e11423e562c6011640f9a7cd3b'
+                      'dd0a3d42b83430f7caa70a432e6cd82c')
+        image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash,
+                                         algorithm='sha256')
+        image_path = archive.extract(image_path_gz, self.workdir)
+        image_pow2ceil_expand(image_path)
+
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image_path + ',if=sd,format=raw',
+                         '-nic', 'user',
+                         '-no-reboot')
+        self.vm.launch()
+
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'usbcore.nousb '
+                               'noreboot')
+
+        self.wait_for_console_pattern('U-Boot SPL')
+
+        interrupt_interactive_console_until_pattern(
+                self, 'Hit any key to stop autoboot:', '=>')
+        exec_command_and_wait_for_pattern(self, "setenv extraargs '" +
+                                                kernel_command_line + "'", '=>')
+        exec_command_and_wait_for_pattern(self, 'boot', 'Starting kernel ...');
+
+        self.wait_for_console_pattern(
+            'Please press Enter to activate this console.')
+
+        exec_command_and_wait_for_pattern(self, ' ', 'root@')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'Allwinner sun8i Family')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
+                                                'system-control@1c00000')
+
     def test_arm_orangepi(self):
         """
         :avocado: tags=arch:arm
-- 
2.25.1

