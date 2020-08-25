Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2987860lfy;
        Mon, 24 Aug 2020 17:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGmlS7OS7sb2EcNjycxIrZryE9PfwGexsikX5zlnzf72Ldp0oeznujl0VauQZbuTyqj5FZ
X-Received: by 2002:a25:6f85:: with SMTP id k127mr10678811ybc.12.1598314884243;
        Mon, 24 Aug 2020 17:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598314884; cv=none;
        d=google.com; s=arc-20160816;
        b=LThAIFB9YnD39NkvGrn7o0iMTvJzFVJPPIlPtBw00bqOlJz5NuwaNvrjmORlX0NVgX
         qSvMtg9hIrcv3rMdjlYKd0e3Fz3MdbTm93BFEILntaTC3tmwcFKuWfL6L+Fdysa8gka7
         PPFWPa51t6Mh85doQq5x5/uck5BZdDLu+ATJTaXEX7ZMSSdVy3eUkfrsQx0mCGr5soQB
         mrOOeHNQAE0lfEQHohhWsdMAajIMc0JNbBT5LhmznhUV8wvp7S4+zgRjD9FDn1tFanre
         PdA9aqlrcPMNYCTgv/TLD02SmekgI7bWdS8liDwsDJaLed+zF209B2Jc79BrwlCs5tI4
         GmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=Bm7spw+C0+41sKOlaxF7L66yvzmdTiJkotWkEKVYr68=;
        b=bQLvj8MGpjZzy48n3wzY4P4gr1OMEe8JvnpP8wy5atFCLLskBJExMHqNi6KIWIJS7R
         B0HR/GqXT50kbSAVezy9gaL20ux6gn5AvpRGFhAs613pFSbYdDX6dDOxfX6HGbNL+c/2
         dTmVLSYj93qOeByQ3XqZcwaHQbYmhnuFlFiGh7x31PEWUju5sl653LC1nSgvs9UGO7Bw
         GEa8gAIlMUk0ps9bvH9qykjFnDiwUaYjKu4jlyA5AfUsUxTXPa/7MwVkq4xXl+jyLwHR
         3T0EvmJ6HjC3uMlIuffPG9WqrLQul486IX01MM9b1j45eLLguF7lDyyonV7kXykq+LX9
         9lyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=HPKYKVap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o85si12717483yba.140.2020.08.24.17.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 17:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=HPKYKVap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAMiJ-00039M-HT
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 20:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3q1hEXwsKCG4TeWUZZQYaQZSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--hskinnemoen.bounces.google.com>)
 id 1kAMeu-0004Wy-B0
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 20:17:52 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3q1hEXwsKCG4TeWUZZQYaQZSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--hskinnemoen.bounces.google.com>)
 id 1kAMer-0006A9-LM
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 20:17:52 -0400
Received: by mail-pj1-x104a.google.com with SMTP id g7so441524pja.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 17:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=Bm7spw+C0+41sKOlaxF7L66yvzmdTiJkotWkEKVYr68=;
 b=HPKYKVapabI3RLWrwYaXngmKudG+ym6kGklYWil1WrqfyvLjFt+AIbfoXq+g3WS8Mb
 yxrxKkPz75HRTyUpYcsX9dyHdLJJOFRHd1CYpBlHMVLR6TGIQkpsjmfG/GDSAa6hzC1J
 DagqdsWNyI+sLY8VkDcaQj+6pHJC+2eiXsXEAS+RG1IW03FHyNUw8pN8tz9Kudj6+hPr
 MBi9Pt5nGLXcPSVztd6cqnDkypFIgt3bZ4e0x7IBpjZDE1HA+nZh3z4moxy2AWTIosSh
 p4VbR/MDVZQv6H70w/n+AqIoZ7o4GUSut/3Ho/+s+KoZToxGuYS9DukS8RkqRH8c/z6p
 YWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=Bm7spw+C0+41sKOlaxF7L66yvzmdTiJkotWkEKVYr68=;
 b=a4Y04omoqs1OqwT8jZ3m3iNVaWHEzPeQdWTa3F76MSpf0DzynIFE/BNfGHY8x9uHhW
 nFCGk73vvSLJN5lhiWhxolDZz64ifl/sswBN441Q8HRO21OeUqGWezNoC95OH0rVBTF3
 nqVIaB7FrZPpxnMmIMeVcomaFkrDOL174O9DehQ5cQ+8FjH4G/ciyPWFGhCwvR0AGzPa
 fzv7QXVESBRakwjFQkyGmnmzmGR9qGdp23bHK1NkQfbWVPXCnfIg3RrY9wEcBei3WMgv
 LHxmeo6iCnRBxOlQLMmRgXlrzLFQxV+8Lb2FcNLYJ2WTIis1LE8rM2jNGyOUtM5HAMbx
 PIRw==
X-Gm-Message-State: AOAM530hc+KrBW7Yqapx0boW8jt+fSMLomXKTHTnoKuL13IAbTYZKMFl
 PcjPnr7T+8HG83cPmU+kx1bm/0nSh7szIpl1rw==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a62:7812:: with SMTP id
 t18mr5806056pfc.73.1598314667592; Mon, 24 Aug 2020 17:17:47 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:17:11 -0700
In-Reply-To: <20200825001711.1340443-1-hskinnemoen@google.com>
Message-Id: <20200825001711.1340443-15-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200825001711.1340443-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v8 14/14] tests/acceptance: console boot tests for quanta-gsj
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3q1hEXwsKCG4TeWUZZQYaQZSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--hskinnemoen.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: 9ZfYv0QIwDIs

This adds two acceptance tests for the quanta-gsj machine.

One test downloads a lightly patched openbmc flash image from github and
verifies that it boots all the way to the login prompt.

The other test downloads a kernel, initrd and dtb built from the same
openbmc source and verifies that the kernel detects all CPUs and boots
to the point where it can't find the root filesystem (because we have no
flash image in this case).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 tests/acceptance/boot_linux_console.py | 83 ++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index aaa781a581..4a366ce93e 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -568,6 +568,89 @@ class BootLinuxConsole(LinuxKernelTest):
                                                 'sda')
         # cubieboard's reboot is not functioning; omit reboot test.
=20
+    def test_arm_quanta_gsj(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:quanta-gsj
+        """
+        # 25 MiB compressed, 32 MiB uncompressed.
+        image_url =3D (
+                'https://github.com/hskinnemoen/openbmc/releases/download/=
'
+                '20200711-gsj-qemu-0/obmc-phosphor-image-gsj.static.mtd.gz=
')
+        image_hash =3D '14895e634923345cb5c8776037ff7876df96f6b1'
+        image_path_gz =3D self.fetch_asset(image_url, asset_hash=3Dimage_h=
ash)
+        image_name =3D 'obmc.mtd'
+        image_path =3D os.path.join(self.workdir, image_name)
+        archive.gzip_uncompress(image_path_gz, image_path)
+
+        self.vm.set_console()
+        drive_args =3D 'file=3D' + image_path + ',if=3Dmtd,bus=3D0,unit=3D=
0'
+        self.vm.add_args('-drive', drive_args)
+        self.vm.launch()
+
+        # Disable drivers and services that stall for a long time during b=
oot,
+        # to avoid running past the 90-second timeout. These may be remove=
d
+        # as the corresponding device support is added.
+        kernel_command_line =3D self.KERNEL_COMMON_COMMAND_LINE + (
+                'console=3D${console} '
+                'mem=3D${mem} '
+                'initcall_blacklist=3Dnpcm_i2c_bus_driver_init '
+                'systemd.mask=3Dsystemd-random-seed.service '
+                'systemd.mask=3Ddropbearkey.service '
+        )
+
+        self.wait_for_console_pattern('> BootBlock by Nuvoton')
+        self.wait_for_console_pattern('>Device: Poleg BMC NPCM730')
+        self.wait_for_console_pattern('>Skip DDR init.')
+        self.wait_for_console_pattern('U-Boot ')
+        interrupt_interactive_console_until_pattern(
+                self, 'Hit any key to stop autoboot:', 'U-Boot>')
+        exec_command_and_wait_for_pattern(
+                self, "setenv bootargs ${bootargs} " + kernel_command_line=
,
+                'U-Boot>')
+        exec_command_and_wait_for_pattern(
+                self, 'run romboot', 'Booting Kernel from flash')
+        self.wait_for_console_pattern('Booting Linux on physical CPU 0x0')
+        self.wait_for_console_pattern('CPU1: thread -1, cpu 1, socket 0')
+        self.wait_for_console_pattern('OpenBMC Project Reference Distro')
+        self.wait_for_console_pattern('gsj login:')
+
+    def test_arm_quanta_gsj_initrd(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:quanta-gsj
+        """
+        initrd_url =3D (
+                'https://github.com/hskinnemoen/openbmc/releases/download/=
'
+                '20200711-gsj-qemu-0/obmc-phosphor-initramfs-gsj.cpio.xz')
+        initrd_hash =3D '98fefe5d7e56727b1eb17d5c00311b1b5c945300'
+        initrd_path =3D self.fetch_asset(initrd_url, asset_hash=3Dinitrd_h=
ash)
+        kernel_url =3D (
+                'https://github.com/hskinnemoen/openbmc/releases/download/=
'
+                '20200711-gsj-qemu-0/uImage-gsj.bin')
+        kernel_hash =3D 'fa67b2f141d56d39b3c54305c0e8a899c99eb2c7'
+        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash)
+        dtb_url =3D (
+                'https://github.com/hskinnemoen/openbmc/releases/download/=
'
+                '20200711-gsj-qemu-0/nuvoton-npcm730-gsj.dtb')
+        dtb_hash =3D '18315f7006d7b688d8312d5c727eecd819aa36a4'
+        dtb_path =3D self.fetch_asset(dtb_url, asset_hash=3Ddtb_hash)
+
+        self.vm.set_console()
+        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=3DttyS0,115200n8 '
+                               'earlycon=3Duart8250,mmio32,0xf0001000')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+
+        self.wait_for_console_pattern('Booting Linux on physical CPU 0x0')
+        self.wait_for_console_pattern('CPU1: thread -1, cpu 1, socket 0')
+        self.wait_for_console_pattern(
+                'Give root password for system maintenance')
+
     def test_arm_orangepi(self):
         """
         :avocado: tags=3Darch:arm
--=20
2.28.0.297.g1956fa8f8d-goog

