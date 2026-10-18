Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02663CCF2C9
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 13:39:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIR3u-0002Xo-3e; Sun, 18 Oct 2026 09:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3q-0002Th-Mf
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:26 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xIR3o-0002LF-5m
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 09:36:26 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-93e6eb77f0bso129551585a.3
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792330583; x=1792935383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BTLX4E/wXPnRsvyWK12SwwoqMi9TXZxhEIuvci+/7pM=;
 b=C1CCEX4sorARda5BG+Hx6Sa5xScBfQqkUoKu2LwvXQK4aknIyWIp0lmAXrH1Czz6x8
 ovvkLPfpcJAbw8jH+t7iol3x0eApp9CXkA+uLxESBd8bVG8Y6mQGIZzuLyCdr3btXB8Q
 Vn5Lr6T/ePIzQHLuSPAn5DxdjlugeoO+FSpxtMOQERIPMccjF+0GsycNza+ePv5JBU4d
 jUIRm6kByEHaKqbnAnghdtaR1FopZ5a0QGonm68uEcJb6EXrM6gBbmhk1h0f/AiiH0A5
 CxO0PNhLMeb4Ufs0osdkyfbslpuVILphEO3QvsjMYRcRgSvJJLpxhElaqnqQqAhAx6TC
 JWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792330583; x=1792935383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BTLX4E/wXPnRsvyWK12SwwoqMi9TXZxhEIuvci+/7pM=;
 b=FW3JVUuiviw+3q/gpXVHmxKgAoujuQA/LJ41yUT3oixPuJ5Gby4JFwt3n6AhoZxuWn
 zqOnrqQ/EuvZkf9E8rxMnHixSLuHXWvQhkm+lFPMmPJz4XKO6Lt5XNGAcKXRhYG1Qx2P
 b1kww0W699Kg/Kr2odejbrM2hYp6cKcUDV89b/6/iGZuqRBp33s87FAhi1NUIXe6s++6
 zk39Ml4yhxMRjmtQuAlHcBDQ4oaXWEcmLFwW0J9Ij09SpQF9QGBwevuKJF9fLah0LCkP
 GU5BmllgglP1TrPMpDDTJtRWft1ztCgD0UjQT7MBPV+l/SyqN3ENsKDdtU2lCiwyThmi
 4QOA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwr67FzSx+kI6aTJJ8SVWMWBtq44EP6eiDzwPGl4Eyrba/xZlHh/P1GPG63fXpezCdmb4ou9djVPA==@nongnu.org
X-Gm-Message-State: AFq9FYLUr2EdlCFghHpZuOMk2t2ZPtvhj05mm1MCXdvUFurbAUDQE69Z
 SpfA1lwF97A98FkeQ23WO0IML6Wz1tSoHUL6Pi7sYhqfz6A5wlg3Emwi
X-Gm-Gg: AYBFou0nKDHhhadCcWmtQmLEB7LB2ZzKdBetHaZZ/orrAKUdbuDBtwjqFvyW8FlKeBg
 gHscja4nNHGjyaBAkmHozfWAkAwHL41VPVQnhO/7vNeoH1nO6EK0k9KcdELWF5PZ1JXu6WLu2U+
 gobDa8cEXEbH5RDYuPo9Pi7TvJVWlHPhnXMpGsQ+Upq/NvOHNYchHDfLINl+hru7fwWFq8uuOoL
 ERxgCOm+kP9+7yvcgFwNrSw5veYO0MAIQd9ssftMU1ZI0JGui1wuyBKVw3CtFK9swKm65dlGTOe
 TgnRUkdVAXs3YuLqlMmCUEv4RN2BdKL3AyNL1d6A8Ho6aGE4Jap2cpHfMpnCV9sIvT4zKnoLntU
 E0q/7uyNFRMnIENNFeZdOkI1gCn+KXMok59Pb7aIbl2ADabrUlFqtQi5hBQlV0W0S+JQ+NWNLo6
 o+Wwd7DspmMCbZTDvzwQhWSkq9/3Fb0KolUSt5mA602UsW/61egrxQuAoZatVxgo+cFyeVvOH+J
 ENyE8YhC6l/Ou58Worpkfmq4ywrZ0w85ZEK+1svIvIvCzi9Mb7k0y24TpBfz33ulmfTewQ=
X-Received: by 2002:a05:620a:461e:b0:93b:6113:218 with SMTP id
 af79cd13be357-93f29b76073mr807100885a.12.1792330583280; 
 Sun, 18 Oct 2026 06:36:23 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:ecfc:9d0d:b95b:11bf])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f2a854bb7sm459056485a.23.2026.10.18.06.36.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Oct 2026 06:36:22 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v4 17/17] tests/functional/aarch64: add raspi4b GENET
 networking test
Date: Sun, 18 Oct 2026 09:36:03 -0400
Message-ID: <20261018133603.64323-18-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018133603.64323-1-marcelomanzo@gmail.com>
References: <20261018133603.64323-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x72f.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/functional/aarch64/test_raspi4.py | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
index bacecbbe9c..748837d818 100755
--- a/tests/functional/aarch64/test_raspi4.py
+++ b/tests/functional/aarch64/test_raspi4.py
@@ -109,5 +109,36 @@ def test_arm_raspi4_initrd(self):
         #self.vm.wait()
 
 
+    def test_arm_raspi4_genet(self):
+        self.require_netdev('user')
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


