Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CD0C531FC
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 01:27:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnRAC-00052D-3O; Fri, 24 Jul 2026 21:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnRAB-00051q-3L
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 21:26:51 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnRA9-0006Gy-NB
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 21:26:50 -0400
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-74a86e9d4a8so328482137.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 18:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784942809; x=1785547609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bJ2r/gMDRkwdyWL70QN40YSq4nEajyBo622BX23Tmqk=;
 b=gg6BEe9ikmCbnRRq6W+OTvT1k920os2O48Y6SDlLmP76yp2TT2xyaxcCQ5TJIohNab
 TjJHWHguVmZ3AbbhGQcIF2FThsaFoU6D+oX2uEX2rW10OGmEiOv0tm1MLuEFhdTH4Zz2
 whQLjVchAet+YX6XAzrUGZd/64jbPMuYdl3aioX5aJ8a51rVdfebAHQZwe+dv3J8MDMk
 NosVQyxr4GlJcWN0bNaD/EpmRp0cZ9j7tkzldGPN/0HGcDZEKqaJbf1kS30Akbbl5f6x
 TsDrUJVOuIboBALzo2FqNZKFaC3LF+canFo2rumpSe+YNRvjrH7a3BgdjClgFwjm1Mjm
 dhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784942809; x=1785547609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bJ2r/gMDRkwdyWL70QN40YSq4nEajyBo622BX23Tmqk=;
 b=n7hhSc7kFncwiiBDaH91cyEmjD4e3SkpK7XOIw8KhlGs5MAEfoqzvWBA2JgDM5nccP
 b5dzPz9M59JDuSSq+ReJA9o1boUcromrUhDua25TYM+GYw9Anc4xE3TGSWGkWPBXf0cl
 pVougqEOQrPSse7ozZ1h8FeqAsKTum5gfww35QWuq5ePyrxJkMVZ4yfUNRMLirDRy51e
 LKak8BmX+eyMBdm6yklOiSjGeEs31LY1I0RnQMqdGCICRAZLvoSBExPZLy0/Q8gPIA4q
 uB2QllHEkZvotkkmJcgT1VrjCe5VsCXfjEobonpa0nItd/8T0s6XOgTbCsNMiiFhU9n2
 Dk+g==
X-Gm-Message-State: AOJu0YxkyMidAdJYYXEsH1NTa12k2hp6V4wSnB1prke3ti7I9mPDxCMw
 fw12zbi31qx/wXtZVDotQhVbt9d/RmsDlP5ra9FOW5ttDEBdn0o8DJbp
X-Gm-Gg: AR+sD136yuRFRaA9Lvy9pY9caH3YfMaHKY02js5hCVtZqOgPuQ/KBRFcQX851Dk1jG9
 OQ16YshlY1Vya+1btv7uw6ruqVdxpYrRKCUYf8YgbXu97rcJWpEiaBQMXTkAGZ9LT5gZjHVOT0m
 OHEhRF2frvr+t+Fxne3L1xmAcNEPBCKvKGUMOOKeT9qMiv5BYfDFbNlUdbfOzjA9FCO86aHekbq
 I3CLpandY51xrI4ZTu+WU4Ft5w5aQjsfn7IGINWffQvcUQ9vr1dr2Oyaz/I3C5A8RFhWiSMtTiV
 VQq6obHJbHwlWtyV/EN10majNmm/GjbrM+dTL2bn2ioM8e6xdlhi1Fqn8UjMB0e2q8IPiYh5O4w
 8P396P8QdW0qNqNq1HpNh+CHIcYSCOhmF5tLpMKk2vMEH9ew84YdTk2EGlAD+PnHF5PZDZGqUc0
 3AN8DWyvVm7g1TK4W1c63CI+7P/YGPPiuJ
X-Received: by 2002:a05:6102:3711:b0:739:8c52:f2b with SMTP id
 ada2fe7eead31-7503fb97f37mr727666137.18.1784942808639; 
 Fri, 24 Jul 2026 18:26:48 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-97774c388d7sm1092856241.1.2026.07.24.18.26.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jul 2026 18:26:46 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 5/5] tests/functional/aarch64: add raspi4b RNG200/thermal test
Date: Fri, 24 Jul 2026 21:26:35 -0400
Message-ID: <20260725012635.4925-6-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260725012635.4925-1-marcelomanzo@gmail.com>
References: <20260725012635.4925-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add test_arm_raspi4_rng_thermal, exercising the raspi4b RNG200 and
thermal sensor devices added in this series: boot, confirm the
RNG200 driver probes it ("hwrng registered" in the kernel log),
reach a shell, and confirm the thermal zone reports the expected
fixed reading and /dev/hwrng actually yields data rather than just
existing.

Verified locally against this series with the exact kernel/initrd
assets this file already pins.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 tests/functional/aarch64/test_raspi4.py | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
index 0e254a20..69748ce5 100755
--- a/tests/functional/aarch64/test_raspi4.py
+++ b/tests/functional/aarch64/test_raspi4.py
@@ -122,5 +122,37 @@ def test_arm_raspi4_genet(self):
         exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
 
 
+    def test_arm_raspi4_rng_thermal(self):
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
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern(
+            'iproc-rng200 fe104000.rng: hwrng registered')
+        self.wait_for_console_pattern('Boot successful.')
+
+        exec_command_and_wait_for_pattern(
+            self, 'cat /sys/devices/virtual/thermal/thermal_zone0/temp',
+            '25310')
+        exec_command_and_wait_for_pattern(self, 'head -c 8 /dev/hwrng | xxd',
+                                                '00000000:')
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
+
+
 if __name__ == '__main__':
     LinuxKernelTest.main()
-- 
2.47.1


