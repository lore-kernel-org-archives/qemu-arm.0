Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DB8C2D0A6
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 18:13:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHPvm-0001jD-Bc; Thu, 15 Oct 2026 14:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xHPvg-0001cd-EW
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 14:11:48 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xHPvd-0001XL-Vu
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 14:11:48 -0400
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-5338f65913dso19386421cf.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792087905; x=1792692705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=enGY8Mg8CmhgNg4I2/M1BECJVg3BBS7XEPbL+hW9bwo=;
 b=NoNn1XbIvwhgzUHdaLp9OgHKUx/y5pZar8gbQZp36FUfOK+xdej19qWei4I7xCjYEi
 tKx29rxBPHnfK640Tv/YCAlnkI++TUtjWNH5FqEPCl2dSiCXxkBFqSqqiKZsFDs6Krzn
 2VnOmQrkz1QggodnrQPKi5y6FM5Q25kpMz8utrSja82tOeG93/fcwQd8/bBlvDiN3tms
 zZaUeSilmaHJ9uNbSogl3GOs53b7HHIVLgGwOYd8cCPT2JcTf86cOkSYlyYX+o2K4D2y
 S4mMYl+JTjhNWYd5u5hvCp43ntVWceVIHsSbOCjt/Vv9bs/uqYTQja+WjYZxKyFIyZD1
 RnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792087905; x=1792692705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=enGY8Mg8CmhgNg4I2/M1BECJVg3BBS7XEPbL+hW9bwo=;
 b=Tx22SqMFP7RSGhWi8evqjrWte/Y4dEm2BeQpbVkiuli48J91dQLwKJnDxM2kXaPmvs
 YKJilDfTSTqjfp+lphTvZJb0mFFsgGVdBkQ3t0CglKrd7BZLEWvm/BYkjcj8AgW19rSD
 rpDmKk1aklBUqpuPrm/yNzkhKJct4EDpZzQh3kbdIZ+juB5WZ9EofCwcCHGCkt82mbW+
 B69UJhMTGDwNO6aZg1+xO0Nc6vXuahcB6Z73ubyDNuUzziLM18l5+bU4AVfhwVMrt9TZ
 6CsJk2YN4pET+F3VOY3L0pj08S3w9GaTKg3dU3Kx9LI9mW3YYtfT477IjGqyaVBO5ooY
 cT2w==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+73wTOM43nGWjcvQZ8c2L91RiQXeMSy0Y3+BIJbr6GShQSWwyGhSCX2tiQ3L1qrqf78Gl61w/3Q==@nongnu.org
X-Gm-Message-State: AFq9FYI2OjIx6rMK2DUqoxtsj3T/aP1c2w1LGWq2dKskFyaPo3C1poKo
 XkGoHUSDQbsWUuCiZy3XI5bAwOF2m1hXHI1AL7nHHcDmgWW+uCu9A/1ae8xyikAQ
X-Gm-Gg: AYBFou1OZ9HXVnfKywCeO0k8xylBYMuUQ7BRlN/SB6wLr1UGwpxsD+Q9XCfYw7n+zsU
 h6iME+kFl7XqCddKjzkdBrLm/ogDKtb1wzs0LC7G8fyfCTloz/vLuF+9LSkOXP2yPRuExtLaFNZ
 Og1v4+XcgVNy04IbQym4b+uyPWkTcpREipG/uOv+zcR9EltX4pAusI8YUfHBS6/wF1R4F6hRJck
 IWIrGf7/9y7zXifV7ezcINcc9TrM2X/Zz+6bfYNEtpOvNv2Nos/zMBZQzSwWv/NtL9gSy4kbNMN
 xQ4oOk7xfIGbrNGLkLKhL4lPel6DfXYFY3JuIaoIDmuax5cMdzJgrLaUI7oFg3dkgibgMOolfxz
 QaKcU59nXGtuLaw172XRxoNKxObILPWxMJxZi583p2PkUT3/e/ieJ9iiOepYsin6BpmlY4cc1/x
 wPXtPxc8hdtIR+vlFyjs7SmmjOmitGAjKJL2Um7h7FiJKcDxgt6f5vVwMpipOA016P9SEF5H/ZA
 o/5sEaRg8fck7PZH009k1F6Cpr070bjyzgoY3eFzwdqgBOPQYZkxZLYZ3GHnEntv2NmPg==
X-Received: by 2002:a05:622a:98e:b0:530:ea8c:1b6b with SMTP id
 d75a77b69052e-5359f498093mr317451441cf.3.1792087904887; 
 Thu, 15 Oct 2026 11:11:44 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:919:5388:4e10:5949])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536127efe4asm32130611cf.19.2026.10.15.11.11.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Oct 2026 11:11:44 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v3 16/16] tests/functional/aarch64: add raspi4b GENET
 networking test
Date: Thu, 15 Oct 2026 14:11:21 -0400
Message-ID: <20261015181122.60608-17-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015181122.60608-1-marcelomanzo@gmail.com>
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add test_arm_raspi4_genet, exercising the raspi4b GENET controller
end to end: boot with a -nic bcm2838-genet device attached, confirm
the guest driver probes it ("GENET 5.0 EPHY" in the kernel log),
reach a shell, and confirm the link actually comes up
("ip link show eth0" reports LOWER_UP) rather than just that the
device exists.

Verified locally against this series with the exact kernel/initrd
assets this file already pins (raspberrypi-kernel_1.20230106-1 /
groeck linux-build-test rootfs). The link only comes up because the
MDIO patch handles the PHY autonegotiation-restart request (BMCR
ANRESTART) correctly; without that the link never comes up and this
test would hang at the "ip link show eth0" step, so it also serves
as a regression test for it.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 tests/functional/aarch64/test_raspi4.py | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
index bacecbbe9c..f703fc69ae 100755
--- a/tests/functional/aarch64/test_raspi4.py
+++ b/tests/functional/aarch64/test_raspi4.py
@@ -109,5 +109,35 @@ def test_arm_raspi4_initrd(self):
         #self.vm.wait()
 
 
+    def test_arm_raspi4_genet(self):
+        kernel_path = self.archive_extract(self.ASSET_KERNEL_20190215,
+                                           member='boot/kernel8.img')
+        dtb_path = self.archive_extract(self.ASSET_KERNEL_20190215,
+                                        member='boot/bcm2711-rpi-4-b.dtb')
+        initrd_path = self.uncompress(self.ASSET_INITRD)
+
+        self.set_machine('raspi4b')
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=pl011,mmio32,0xfe201000 ' +
+                               'console=ttyAMA0,115200 ' +
+                               'panic=-1 noreboot ' +
+                               'dwc_otg.fiq_fsm_enable=0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot',
+                         '-nic', 'user,model=bcm2838-genet')
+        self.vm.launch()
+        self.wait_for_console_pattern(
+            'bcmgenet fd580000.ethernet: GENET 5.0 EPHY')
+        self.wait_for_console_pattern('Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'ip link show eth0',
+                                                'LOWER_UP')
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
+
+
 if __name__ == '__main__':
     LinuxKernelTest.main()
-- 
2.55.0


