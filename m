Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5756479lfy;
        Mon, 10 Aug 2020 17:50:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9PHWCtsZMxDtrn4EQmiipdHDkfx9F1guTP6tlFtGcVQ3pzyO9HBvoElg8kwniGpWpZHuw
X-Received: by 2002:a25:1455:: with SMTP id 82mr45802964ybu.274.1597107058053;
        Mon, 10 Aug 2020 17:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597107058; cv=none;
        d=google.com; s=arc-20160816;
        b=sVPJge2eJTpvZJckSKp0cZkVrdj14M5f2wRlM9qmc0pjrudHyss8FTafP9pwsOPB85
         gjx+rIm3RPUfzsDaRzkYBaqu0iD2FrX0Mge3nbhFwLz1P1uohChXOz0WtvrxNWcoOcUM
         bgKie4mj7qDPiNvoOWu3TE7bXV5vMr3eyzP0cGPnHDrKR+CTCM3q65gMQQrIr93kW/ba
         O5GuR8RIFGkCB3JeYrliP81mfDdiZ3+Qs4rB1n2T90j9yn/8WhfUQzvlu1xMSj4wwaHQ
         Y+CbwH53Pb2H5tRAsBzIAsgxWh6P313KyBQgJAwjbwhnnf1L0nX/E9le9uzhYvgYTvSA
         +nBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=0UcimtGeCCXoNUS6I6jShi3xFp1h7udGR+4azPU9LSI=;
        b=pLDW0vRRxFwL/NMhefJXdzUt7e5Mva307IhaS+KmAMx4DlfwyJh2Rq+4JT1o9+XsBZ
         ZgiVT1kztO8sNHIk9wpL5scWITeaAqkw4XKXORuyURfpCajq0ZhtJcTvMAXU84hDaV0I
         HrCZoBnP9zi8e94W8Pkatxl8jGW8zyaVxgplW6U4p9A2B2Vv0RpLTEtS58kREjnX7gtu
         Boi/jbvN45sBE1OiZ5xYspeyJk/Jlwlfw7AJwkXHBUfVtaf0335vtqRpTjy44HEMPGWs
         0B0Jof3ML4eiq13sb7M8WK6DS406jBN4t1+GM4DTuSEvQHg6JvqeH0YGtxJMn7UgDFOo
         r7gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cMPxpqeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si17354751ybu.1.2020.08.10.17.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 17:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cMPxpqeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5IVF-0007Cm-B0
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 20:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3a-oxXwsKCAgp0sqvvmuwmvowwotm.kwuymu2-izuvwvov2.wzo@flex--hskinnemoen.bounces.google.com>)
 id 1k5IR4-0007X0-W9
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:39 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:41696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3a-oxXwsKCAgp0sqvvmuwmvowwotm.kwuymu2-izuvwvov2.wzo@flex--hskinnemoen.bounces.google.com>)
 id 1k5IR2-0004l8-TO
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:38 -0400
Received: by mail-yb1-xb49.google.com with SMTP id y9so13672288ybp.8
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2020 17:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=0UcimtGeCCXoNUS6I6jShi3xFp1h7udGR+4azPU9LSI=;
 b=cMPxpqeSksrU5hfY8e9DvT8q377Ae2Glu2DwRMvMlBBC+6BCdJYmbqwPDa/YvjPUZS
 ZFGhWQoibEiKlgrK8CN8g/UP+geKPowNL1pNnjmA4bAmM9PCdSjDxmnPzE19Kbzi49Xv
 Sup1FwqR8c6gD6JznOLuxOP7EW94OHGw7aLqow4Paz7aDcl8OndFtVUQoSoXYUvN1sZC
 lvh2pMtQGszZU8OV0iUEmeiIcs5jZ0VU+61Dgc8eTW7z41GT5RsRPYv9LP2lS7LH5jT1
 TJWPH6VlGiVLzxHrUPKKSDXyVHnfhMnnpIdHmpfGsZ7sB62/k1w/q29c88OxsBxGOJpW
 n9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=0UcimtGeCCXoNUS6I6jShi3xFp1h7udGR+4azPU9LSI=;
 b=CEJfcsvHqNMi/efZn4VeLz2icflTkOtV/Epxu8EqPckg3g8ImEIYA0qQFXXe4uH+Hk
 hkMHZ7ojoXObfaHf3SzodjsATHVyxygIYBcIIJYZLCWNOYnkIimhOjFk3fT8ekzINoaB
 U1sIWqiML7IePgq4o2luHURUYn67q1BnlKjRV63PhhgoWfNJU9HoVfxQXkZikw9AB5Aa
 s0NFiyui8gXdLvRLaw9177Ee9r2SJjfYgPTMC3M31Q5PRao6Dh8vuzQ6DCnQEWHXA6G9
 NdOlKIQPAEBq/iG0SMvTGRTMknvV0SgiUYkIOsOu3N1tuBBOHw9eaq7LvTXaZlzy0g4Z
 7X+A==
X-Gm-Message-State: AOAM5328exROLZSjEGAJdVgnwSd3HWITrvrEsQU35ecHzfHpBjJYqcrI
 pj/qjuxOnVIEQ6W2vCf+AETbO5atk/S4hsVUtA==
X-Received: by 2002:a25:ed6:: with SMTP id 205mr44310045ybo.315.1597106795269; 
 Mon, 10 Aug 2020 17:46:35 -0700 (PDT)
Date: Tue, 11 Aug 2020 00:46:07 +0000
In-Reply-To: <20200811004607.2133149-1-hskinnemoen@google.com>
Message-Id: <20200811004607.2133149-14-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200811004607.2133149-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v7 13/13] tests/acceptance: console boot tests for quanta-gsj
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3a-oxXwsKCAgp0sqvvmuwmvowwotm.kwuymu2-izuvwvov2.wzo@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
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
X-TUID: InBcA8nC6y8k

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
 tests/acceptance/boot_linux_console.py | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 73cc69c499..8592f33a41 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -569,6 +569,71 @@ class BootLinuxConsole(LinuxKernelTest):
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
+        self.wait_for_console_pattern('> BootBlock by Nuvoton')
+        self.wait_for_console_pattern('>Device: Poleg BMC NPCM730')
+        self.wait_for_console_pattern('>Skip DDR init.')
+        self.wait_for_console_pattern('U-Boot ')
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
2.28.0.236.gb10cc79966-goog

