Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF623C531C9
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 12:43:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnbiB-0001i1-8j; Sat, 25 Jul 2026 08:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnbi9-0001gW-CB
 for qemu-arm@nongnu.org; Sat, 25 Jul 2026 08:42:37 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnbi7-0003gE-Rb
 for qemu-arm@nongnu.org; Sat, 25 Jul 2026 08:42:37 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-5bfc5b77c02so819624e0c.0
 for <qemu-arm@nongnu.org>; Sat, 25 Jul 2026 05:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784983355; x=1785588155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9AD+CeF8E5+1gZsnV8qJ0ILiMhnlxUFvylSOWxouULw=;
 b=GSy+Op33hrTfur9dcGIEgahLxBEcauW2Ep7eM0xE9oqNhAZKu9sTFNin8mypoati4/
 8qvytxfh8oRuUULQvbf/vyX0MT/0bbuUV9hzhGPCID6w4qPJBrIlaMYLcyKRFQg48PLT
 fu/qn7HJq8c2QguJncgFn958d8FikNM4hGs4Uiuh4BvTBEKfU4j6P+oJ23RYIC484qOI
 9P4g8NGmQOF71rswDHAVcsmdxVm71SLx5DxL7k5th0jf6O1z6i5lmlQxVY3JvZi/0Xdj
 IzEByCSxvEAqHi/WCWHwGH2c8aP+xb9IOniRh4CeOqNMr8wYeQLwnwt5kqbQL5iJmZxW
 Q/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784983355; x=1785588155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9AD+CeF8E5+1gZsnV8qJ0ILiMhnlxUFvylSOWxouULw=;
 b=SlqAQudrd9469jzOzE2oaRDQIpaw47Qa5rWBU9XFtS0unVAmpP8ntfxPFlqbpG3vfj
 0Zv7ofn1SZuRQFYkN3uGZkcCnqZNvSNw4VGFBKy9donIzBkJv9/taEQaIHnZbDR7r/aK
 JhuFKIfZgBkinhNevsPjhUZ0JmJOR6b8HE91FHXiGvOLYtibOzEKjfexHY+CKvoN7udA
 eP4XRXHOZx9dWgn0OUJkwgDj7Tb2j/UohfblK7EcT0skhfUqXUmgw/urrKnYIhwP8aJh
 NvgAqKkudC61D9r/i4fIW1WgFBDxKkpCn4LE8kZqjZhclQUAAECJW2PmlvIQzU6hLiYL
 XVRA==
X-Gm-Message-State: AOJu0YzkeRM5kXzTizsE4so6Iplk+hJF8IW48Hx5FnUWYPmPe2E/lk6/
 S7haJ4mc6zbzJdPKv5WXTz8k+DZggDa9A6ibnpitT4pvw19s49U8OcGW
X-Gm-Gg: AR+sD11wjYUre7baa0LJFHYn9G+JYBQ4QpS6wk2SSu2xiA6W8xRWFD15YFxPoqIWJ3K
 6OhfyBlSQ1YXN7mevcGsE2Gs9wzHYIFjK4m4747ksCgrPaPRI5DdC4Eqc5kUnT7iFrPy7BR7lHC
 ujnBRcDtILwfmCrcAjaQx5bym5bFh2yz0nLFEFVBuvrLHuK9sxOLGU9zIuD2vQkYOeiZSZW+gm6
 Uz0WDWJjWfwlAjb6PEuiyROMCDHw4Sl0DCcacoDmE0iiS+NyMQbrabDisY5k8QfaR2mmH0jxYjL
 vS7F67Xez38J5Uvl244tSsWu9v6Ldm0K4u43qkc8dOcMxnvNMKa1j7ZUhwNM+K1OffSaWmaoWit
 ro+7BE7ZakSzSYSBmi4yXdwb4jYXgUHxb0qB7MjaR9zvPW/GVS0VieU5FXuA/5uR4pF1ea/ls9x
 Rt3cZwm5LlvqdFoeKavKvGw47prNIy/Pg0
X-Received: by 2002:a05:6122:1d86:b0:5bf:9bfa:53a0 with SMTP id
 71dfb90a1353d-5c306bd1f69mr1142693e0c.1.1784983354697; 
 Sat, 25 Jul 2026 05:42:34 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c305734410sm1457106e0c.16.2026.07.25.05.42.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jul 2026 05:42:34 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 2/2] tests/functional/aarch64: add raspi4b PCIe enumeration
 test
Date: Sat, 25 Jul 2026 08:42:31 -0400
Message-ID: <20260725124231.86233-3-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260725124231.86233-1-marcelomanzo@gmail.com>
References: <20260725124231.86233-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vk1-xa36.google.com
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

Add test_arm_raspi4_pcie, exercising the fix in the previous patch:
attach a qemu-xhci controller to the PCIe root port, confirm the
guest's driver binds it, and confirm both the root port (00:00.0)
and the xHCI controller (01:00.0) show up in
/sys/bus/pci/devices/. Before the previous patch this would find no
devices at all.

Attaches with msi=off,msix=off: the BCM2838 PCIe root complex's own
MSI controller is not implemented, so a device relying on MSI/MSI-X
for interrupts never signals its driver. INTx works and is what this
test (and any real device behind this root port, for now) relies on.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 tests/functional/aarch64/test_raspi4.py | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
index 0e254a20..32542b84 100755
--- a/tests/functional/aarch64/test_raspi4.py
+++ b/tests/functional/aarch64/test_raspi4.py
@@ -122,5 +122,42 @@ def test_arm_raspi4_genet(self):
         exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
 
 
+    def test_arm_raspi4_pcie(self):
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
+                         # msi=off,msix=off: the BCM2838 PCIe root complex's
+                         # MSI controller is not implemented, so a device
+                         # relying on MSI/MSI-X for interrupts never signals
+                         # and its driver never probes. INTx works.
+                         '-device',
+                         'qemu-xhci,bus=pcie.1,id=xhci,msi=off,msix=off')
+        self.vm.launch()
+        self.wait_for_console_pattern(
+            'xhci_hcd 0000:01:00.0: xHCI Host Controller')
+        self.wait_for_console_pattern('Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
+                                                '0000:00:00.0')
+        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
+                                                '0000:01:00.0')
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
+
+
 if __name__ == '__main__':
     LinuxKernelTest.main()
-- 
2.47.1


