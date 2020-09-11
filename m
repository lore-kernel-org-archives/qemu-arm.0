Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1943271lfq;
        Thu, 10 Sep 2020 22:28:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuvTzMTKWSReKyZ7FLUypSn8nGyNYOfGJa4AS6cYy+x5ZtkzGTs94t2r4cnhbZ9yKSl0nu
X-Received: by 2002:a37:a5c6:: with SMTP id o189mr143871qke.209.1599802124295;
        Thu, 10 Sep 2020 22:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599802124; cv=none;
        d=google.com; s=arc-20160816;
        b=K4Q1PlI1fAnU0W8yBldvK2V3SchI7n/xCalCXb/MLqScMYxV+oi978mmee4kooC2aU
         3T9dIyyT+9rzSmAH07SrxOVpyQgn6y0DHo4GVIT9JOSRnwrjZ+N4NTonNwrugmT9w6v0
         t/bjEz+Qi8lkJoHk2gPrnqpUndDCEze6A0nuCWrIC38xKub6DKubf/c4IZmNa7aJ8VFS
         okWi9CKg71RvcIoY8cfhHIGTSO6H1l0hIxFMncOdguXhpK0UmA0KaHvp+5s4Cw3tXy69
         g5nmhU79y6ymTQHgXrNEX0rJ2nDxL9P0AsJHlUMOI+AyJMKgRlocL23ixNxEICblDYd7
         j55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=jBZwDlWnsXv8fYpfjYXs3i4Ofn5g1IAL3EUrT3H87yo=;
        b=Eko+yQDa1n2g7HUaOurbKqslJbAsVAc9wg92AMWF0Dg7uQ/1rC4hN6HbqVS3AtjUB4
         WLXQckRh7310s/YYLc/6RdgqlaJYrmXZpSSleQm8Oqj0dYdM/lGsguxrtMpii9RFHX9E
         uKXY30FF0/LF7X2edCgRR/iYmyjwIkXUCgTuwFkwUXlhmxJVWw/grH1lfJC1PV5vljTU
         bQC/rXcacoJUlk7X8dEI/Sw7ustz9blleJqHEhdqDJ9BlUXQeMujnqsW4PkWxC8SRwaO
         bswmZH6Fz3IOhnTPfvG99zAg5pbB/iMjI1Pqw6g6thi/tMswpCA5MTLzxvFFxa5mvPLc
         f6IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=cFcAc0yh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si766443qvl.101.2020.09.10.22.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 22:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=cFcAc0yh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGbc3-0003Tl-N9
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 01:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XwlbXwsKCN4HSKINNEMOENGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--hskinnemoen.bounces.google.com>)
 id 1kGbVC-0006yo-Cf
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:38 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:36061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XwlbXwsKCN4HSKINNEMOENGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--hskinnemoen.bounces.google.com>)
 id 1kGbVA-0002QI-8h
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:38 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id h9so4711105qvr.3
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 22:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=jBZwDlWnsXv8fYpfjYXs3i4Ofn5g1IAL3EUrT3H87yo=;
 b=cFcAc0yhWKOGL9qIfC7puel5BdzOFStGI4JoclyQAyVCElDTMlWirdpx6/Foi5pQhA
 KFUBfTNSrtlm0EG08rBA6JfsrbZ204IveFdgbGtyeZGL5qf0D1N3pc2GAbKo0ZtkoFo/
 31TtOKL4YuVy36obJIP42dMOG1lKz6ccvdeowxpKqc891SmT1x/KW1cJipo91SNqQdot
 +9SFGx1Hg20qnydPNwfg025D6dCyA6z34TwtNmoAqnO/gU2pwmNdG9auGyCR6tNZkzCQ
 SkZaYrJ6ryt0XyJfvgr2S6XdVArCwWFfYT5dq42/ORPn95FMHNmZX+sqsB4exNWl9foG
 k6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=jBZwDlWnsXv8fYpfjYXs3i4Ofn5g1IAL3EUrT3H87yo=;
 b=ZOaO+6wSm1ilwebXzo7dBVQy3eNCi0yaE7qIhUnbZWfIoztiyoji1P/PnYJ6utobXv
 BQD3jxgLvz8WMcAaFDk9tbGMfIiieeYVUavgZmw97MXR6kxIejD60whQAyzYLByVItHB
 NL/ePVw0x4I6Yhdp8cFtwBMaC92WHPY3xd8/AA4w52n30MqvuKa4PtohYzI3148+csog
 d1+txbuxBmUVe6Un/2rzPn9Swj8+IQpQFxhwQE53T/twCVVQymowqbqFhS6lUthb9H2V
 0HzzysywkBcj5ZoorrwIvPRPs4hq4Grt1EUlBoRwtY4Fc39lPEJJqiBKc9/YR87+f3x8
 C7/g==
X-Gm-Message-State: AOAM533KhEyWgQ7QLAKsfzE6MZ8v8riBAuMv9pkAeKoVH/PC78kyB6yk
 w4RtZxQIzDAelQswi3Y+Bva+GRv4ISe221xQNw==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a05:6214:10c9:: with SMTP id
 r9mr520096qvs.0.1599801695003; Thu, 10 Sep 2020 22:21:35 -0700 (PDT)
Date: Thu, 10 Sep 2020 22:21:01 -0700
In-Reply-To: <20200911052101.2602693-1-hskinnemoen@google.com>
Message-Id: <20200911052101.2602693-15-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v9 14/14] tests/acceptance: console boot tests for quanta-gsj
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3XwlbXwsKCN4HSKINNEMOENGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--hskinnemoen.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: Zf628MKrhLtt

This adds two acceptance tests for the quanta-gsj machine.

One test downloads a lightly patched openbmc flash image from github and
verifies that it boots all the way to the login prompt.

The other test downloads a kernel, initrd and dtb built from the same
openbmc source and verifies that the kernel detects all CPUs and boots
to the point where it can't find the root filesystem (because we have no
flash image in this case).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
2.28.0.526.ge36021eeef-goog

