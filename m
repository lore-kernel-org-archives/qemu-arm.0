Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922BEC5B56A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtnar-00013B-4g; Tue, 11 Aug 2026 10:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaa-0000PM-9V
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:27 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaX-0001x3-J8
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:23 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-8eeb4508f29so18823596d6.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786458979; x=1787063779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KOt2p99qli37aLiRSGWi+DGEsvQgttAGvPBuWfl5IYw=;
 b=Nmyc1qgrEyvhz+Bfto2QFD/vjUDOl0zNgc+qifywD7WIgT41jTSjBDjoE+zNKoyIj9
 IELeOF3sW4QFd2f3dWrzrHdrz/fzo25V5ohqXtsAbXyzcy+1rlM8GrETP2jWw0jruNT/
 DNFeON7cXs0brqxEFycB0EwFhRg8RNql1UUjRHuRtjiRamWBtytjKCnnOSn7Sr2QvATA
 oN385wFRz18ooxSsVNZDY/u9PsVenwKJBcVy5eH3VatiEPH8KMKMl0RD7nM+4fnas4Ii
 Xq3l3Up4/eTaizLYUs9BnrFNZ6M/II2AtLwpGSqZjsPAhjXfLtWLueQMrMSEalaS6oxL
 RzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458979; x=1787063779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KOt2p99qli37aLiRSGWi+DGEsvQgttAGvPBuWfl5IYw=;
 b=SkdSkfST3JIOS6tOQemG6iF2KM/TnXqh1G5ruvWchSOQHk1awrG/CtaX3H+g8pbDQo
 QAtL0eGCe0bKwgzF8oxGq9IYzi+ui02nY/UcteQLE8tNp1NmW1AmMP+QjKRWMvZDOALb
 qeEjyJm0AbERJH0zRcYTXsQJ/JnfkA10utJEuJMNTTHPDs6tGIYSexusVRLfmAp6m7jz
 clcAZhlfOpc2UcQ28bTMf9KnMc8B8oh/bgXX4t08J8AqUced5CEFkUDpMHIzCzqYbWKy
 Zjkr9drlHI6ZHgxOp8bZawp7jsp7Ow5Q/HZncWnl48647/e03b0Nm4qWtxn45pbCxblD
 u3PQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RplNaYzT9gzeMpz85nxajA75+eS4gaqVBSpx5UPdVBbZcivxCW0LOzWDpogUaRR5LtgNnTuOCk8Ww==@nongnu.org
X-Gm-Message-State: AOJu0Yyphbibo1/oHtw3MPaXW7KAglA6xPBFn9+chddvSFmhDTBY0SRs
 a6exYom36C9KPhFx365jFFpP9k2cyp44c1PaBDBMAekaNxeERZJeLXY6
X-Gm-Gg: AR+sD127GAgqGVTisL9VxWw4qaOAfYk11QWiY+JEa7biY/tSfKwCuGVKyKS72ktRUZA
 JJPL9lJZfAV7UcDHXX3k1tlUgMvu8xM43vUU0ixnGYlddUSa1g5fCZCIFkrQchMtBbXlmoEVPIX
 lKhxu1hKMmBILe+i7Dzdtny9yQBIfBMXX3hEKaa6oHC2OOrrnFJjmJaHetn+AtVo1tyPqyrKaim
 Q9oHB5aJCBwrYLZJiN9CTLZW+hZ0NgiNQkkfSLZoRe0AbMma9SVSup+yzGOufZ8sQNZMGlBOMQo
 LxKfP86j0ixki1Z4yxUfwp2zSdxHGXu5eLrX843uOAI8UsjUxAOksU/vcrNYJah0Zw9FHy5xRwn
 T4XSenXc5BAWAGmqGBHoDGI6zIK+vNkuk/kuLU2Y8DswCEDmrw+DHbkmd3MHsEOrv7pfA8dklJ8
 Va7FiyFR93bJ58LG63bW1CxJfh7Z72CrEXsT/SBGjZNkNTeN+GShhXNwgvefpsEQqMbLIgsFBlR
 +VjvAuc+sz/GLa7VUg=
X-Received: by 2002:a05:6214:493:b0:8ef:aad6:dada with SMTP id
 6a1803df08f44-90a66ea44c6mr32735916d6.20.1786458979436; 
 Tue, 11 Aug 2026 07:36:19 -0700 (PDT)
Received: from localhost.localdomain ([198.16.145.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c26e074sm681286d6.2.2026.08.11.07.36.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 07:36:19 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v2 19/19] tests/functional/aarch64: add raspi4b GENET
 networking test
Date: Tue, 11 Aug 2026 10:35:56 -0400
Message-ID: <20260811143557.7862-20-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf2a.google.com
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
groeck linux-build-test rootfs): without the "fix PHY
autonegotiation-restart deadlock" patch earlier in this series, the
link never comes up and this test would hang at the "ip link show
eth0" step, so it also serves as a regression test for that fix.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 tests/functional/aarch64/test_raspi4.py | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
index 7a4302b0c5..0e254a2034 100755
--- a/tests/functional/aarch64/test_raspi4.py
+++ b/tests/functional/aarch64/test_raspi4.py
@@ -92,5 +92,35 @@ def test_arm_raspi4_initrd(self):
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
2.47.1


