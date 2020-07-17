Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2148862lfm;
        Thu, 16 Jul 2020 23:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJhn1MV5sumSX45u6Q45dYOTojs46Ub20HzTHdGdJesfLNqmLFj4Ebceur6niuLLP+DF4q
X-Received: by 2002:a25:7b47:: with SMTP id w68mr13221581ybc.143.1594966301767;
        Thu, 16 Jul 2020 23:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594966301; cv=none;
        d=google.com; s=arc-20160816;
        b=MjV1Wx5Gn+vxhIUN33Z5JQrjaoO9fY1+4HKiAokvWbe9/wrSN8gof/hWhDLUoFJT8E
         1UOm6VsBdRtt8PeiEhENYJ52Rg65e2zc+qc5xB1CN9tTb7unar3VTx4QmT7skP2sVsQC
         yH0iKbMDtGgene5qnI/Hu7EhySowA3fzraEdxrZECkx4pGrIa8NLqycehlke2PkHsV/d
         fRc/q7NK+1lrSL5vOd7tiNj3loVkth3oFHPkApur3X7w/CQMzrEcamWxHc8Nm1yffv6i
         KSnUlR/+c3Z/GD18wWafDpP5KiHqUA81S1rF8njMDtTiABqOYMvRIrHdeygszobNu33V
         Ma9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=uKYickmWfL8+Bpz4+Fgl3zDCXqjlabRC8OPCW303i24=;
        b=Z536gAkvlcognDIkbl3sJhIEC8ORLkHbjY8GuRm1dKEvxFXvnW9MAf2TSPKLlTRX0i
         a815xesRM8wxBqahNegeBFrHw1yDywHmwxgZPjelKHi7ZAQlf467oac+fNTtQjAw1i//
         +ulkFwJA01yCPYIAaGL1TaZFC/2Bn/GoYAPiwdM4NhloY8hJkYmzVx5Gff9dvwCJ+QHz
         pxF0WiWZJm5t+TfY43bKpWZtcRfsK7YlLoSQzuQw4aVVHbkk1mygrn/1juYvP4FqCxFd
         CDfXSuhL9dErLUEg71QgiGBonliN71QsnmP9/WhL60vraYMpE2ojl7HwzAAZV5UchbEg
         TH0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=DtJCKWoy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 85si7448907ybf.251.2020.07.16.23.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 23:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=DtJCKWoy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwJav-0000ON-3R
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 02:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3OT8RXwsKCPojumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com>)
 id 1jwJTB-0003zF-NL
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 02:03:41 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:56205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3OT8RXwsKCPojumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com>)
 id 1jwJT9-0005Kv-Lw
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 02:03:41 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id r17so10093130ybj.22
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2020 23:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=uKYickmWfL8+Bpz4+Fgl3zDCXqjlabRC8OPCW303i24=;
 b=DtJCKWoyTbqCyJyptQo1hAbDf/mlqLPt9u/Y6hOFA08VJA7neJJOjZMJVTNUa72fzI
 Ebt541FTz5yT75aJy1CXE3ld/qMiWdwUETvoiZf1DmtSqP2LLG5tISeMAsHd7ROSoYMH
 bQHdv5SK0EBNCUSZnaUsqxcBvfitMUJYCtDhdLw8768lF9b73oRPAQSPCNv0nBKqjJHE
 oSDz+YtLKfSAj5iFExGZnrSgJbShiMYkUd0Pc/QHCAKOC3g+2BUtt/ipN4be1Onw3pRv
 n3J+/eoD42relsvUExE6PUja1g4hkk9zTtlwsno7yXuHZ5pQaD82TgToWDvnNgEIUaBi
 YFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=uKYickmWfL8+Bpz4+Fgl3zDCXqjlabRC8OPCW303i24=;
 b=cZPtIDUd7H0q/i9lpMjVnnv3uGOL3GCs8G1HX7e8NVYDJ1ZYxLeKgkkw1s76QnCbjw
 jzYDm+2AJM/T5+cigmsGrM7Jeq2DORo8yMS/LB6vwcKw6wPTCue4TVsA59i3U1trqsmI
 rl+zAtd+TugI/5/5awoLLc0+H4f19ExM6RU2igKJzwMQ6nyPkNaed+6gqYi2E+goksRp
 rzneoH7YQj19I9D556unH743Zv/lBNYCWc/JczQADvy6uLPRt5V6g+7RTU70cEhxGHjl
 wNf1qsTsWgAT+Ntuq+i5Axg7CHbGezhI/8zY1dSfrSekknAyW5MgeHrVVxgkQyczgLnO
 I3Zg==
X-Gm-Message-State: AOAM532t8eM6pFXPykNRa9WakX0Nf7fBn9vtg7+AjPdM++GQKcyKpo7S
 hky0IhGLw1d1V8oNjvIg1A1iuIezCIW31j7pBA==
X-Received: by 2002:a25:21d6:: with SMTP id
 h205mr11269020ybh.460.1594965817938; 
 Thu, 16 Jul 2020 23:03:37 -0700 (PDT)
Date: Thu, 16 Jul 2020 23:02:58 -0700
In-Reply-To: <20200717060258.1602319-1-hskinnemoen@google.com>
Message-Id: <20200717060258.1602319-14-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200717060258.1602319-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v6 13/13] tests/acceptance: console boot tests for quanta-gsj
From: Havard Skinnemoen <hskinnemoen@google.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3OT8RXwsKCPojumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: Otls/WdH9u/l

This adds two acceptance tests for the quanta-gsj machine.

One test downloads a lightly patched openbmc flash image from github and
verifies that it boots all the way to the login prompt.

The other test downloads a kernel, initrd and dtb built from the same
openbmc source and verifies that the kernel detects all CPUs and boots
to the point where it can't find the root filesystem (because we have no
flash image in this case).

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 tests/acceptance/boot_linux_console.py | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 73cc69c499..1d82fc7ff8 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -569,6 +569,71 @@ class BootLinuxConsole(LinuxKernelTest):
                                                 'sda')
         # cubieboard's reboot is not functioning; omit reboot test.
 
+    def test_arm_quanta_gsj(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:quanta-gsj
+        """
+        # 25 MiB compressed, 32 MiB uncompressed.
+        image_url = (
+                'https://github.com/hskinnemoen/openbmc/releases/download/'
+                '20200711-gsj-qemu-0/obmc-phosphor-image-gsj.static.mtd.gz')
+        image_hash = '14895e634923345cb5c8776037ff7876df96f6b1'
+        image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash)
+        image_name = os.path.splitext(os.path.basename(image_path_gz))[0]
+        image_path = os.path.join(self.workdir, image_name)
+        archive.gzip_uncompress(image_path_gz, image_path)
+
+        self.vm.set_console()
+        drive_args = 'file=' + image_path + ',if=mtd,bus=0,unit=0'
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
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:quanta-gsj
+        """
+        initrd_url = (
+                'https://github.com/hskinnemoen/openbmc/releases/download/'
+                '20200711-gsj-qemu-0/obmc-phosphor-initramfs-gsj.cpio.xz')
+        initrd_hash = '98fefe5d7e56727b1eb17d5c00311b1b5c945300'
+        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+        kernel_url = (
+                'https://github.com/hskinnemoen/openbmc/releases/download/'
+                '20200711-gsj-qemu-0/uImage-gsj.bin')
+        kernel_hash = 'fa67b2f141d56d39b3c54305c0e8a899c99eb2c7'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        dtb_url = (
+                'https://github.com/hskinnemoen/openbmc/releases/download/'
+                '20200711-gsj-qemu-0/nuvoton-npcm730-gsj.dtb')
+        dtb_hash = '18315f7006d7b688d8312d5c727eecd819aa36a4'
+        dtb_path = self.fetch_asset(dtb_url, asset_hash=dtb_hash)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0,115200n8 '
+                               'earlycon=uart8250,mmio32,0xf0001000')
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
         :avocado: tags=arch:arm
-- 
2.28.0.rc0.105.gf9edc3c819-goog

