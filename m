Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E4F606A31B
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHOi4O4I
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLiDN-0007tC-97; Tue, 27 Oct 2026 10:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCm-0007LU-Kl
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:31:27 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCk-0005DI-Rx
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:31:12 -0400
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-93f259cdc86so375667785a.3
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 07:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793111470; x=1793716270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BTLX4E/wXPnRsvyWK12SwwoqMi9TXZxhEIuvci+/7pM=;
 b=AHOi4O4I2N7RjRIQrz0kXjYItwZOtVaJjaTZalnsQcXTdpMogQfK2UY/ZdQr8gmX8F
 95dPxCvJgqwfZQ09lytwcg5rz5ptZlCeM4Di77/oCaxyzzKXuWcKgCtjmW+6lt50Jhas
 cRBrQNecqm3E33T25NHMSNpT7bIDIlZhvMFNInjGEx189mjWeouT4TAmIqHtOw1U6hdi
 vPPdXw/NSf2oJNhytxiRixk30hZ56uFkqlu0C30y9KrSvDDwInktGy7Hh7HsovrYf4zp
 nsJ/7nT2E13RvP3znOeP57DS7GRH9MWauFso2YvP8caQYYrncdpoyOcF5viJGMt2oAKH
 INUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793111470; x=1793716270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BTLX4E/wXPnRsvyWK12SwwoqMi9TXZxhEIuvci+/7pM=;
 b=M2143egrgmFmOKNFByKdZt18C7Tw0EuBk1nOW/iM4olVEXeec5Bvz3lfyRIOslgm0+
 KeiKtf7q9zDuiB7Fq7da0ntjw5guq5uS30gqNx+qAqmUDkboQLRo8sfy3R6exLmBr08a
 XZ0GDo79hHMMwSgvGmSSVPzDwtzqnL5gdntqf9L8GQyW/TYku0MfZQ1kekXiEl7eT5Hp
 x5uiVj24IgU7G5mHYK6ODiVMKT3mAg31GwUqb1BxyrS5rhvIEfvltbhEI5FO6YmUB1cI
 OopwevCvcysrDXsT9/1AEJXmfDs1/L8fEzEnah/eM9OViE7YR5TsyIFlVWD+Lorxph1U
 ZEyQ==
X-Gm-Message-State: AFq9FYJkMTPadgEHuy90gXCNPSkYch3to0651/buCI1ohkl44exAXdH7
 HVBYL3hFGlsu8c6R01G2qKz6xmMxpKUZiiCvBaBOPvVvxpxms9r947Mf
X-Gm-Gg: AYBFou3Tz014PKujRSpRmrlhNGfpKzcuIE1Mq8Ne7V5mHWRITXCIJk6wqy0Hf4YhkKk
 zyJ5CFVrOC/ZXNrXMNtHqxuzL0kEMRx4Q2MHsyDWWkCUT+ZBFxfiCtK/ikjIHLUrtcLd8Y6bXmv
 4Owzner6bTtr1rtli72gcQxCMy4MCDfExI59loOtefknhmQR+3kZOxMnjN2YdVMhz1t5kRXlix0
 mYwBZJNQLPEl0K8ByKt/sPNdIwqRF3FWPUJ3xEk9GSsvHmsufxriaFMdTXNQVyGWHenCOG+CuqX
 u3BtYJiFeQ4tP/R53iU5fXg2vqaYOHyzwtBcB3Bd4TbJN3V42bVHxE6Hs5Vb7etVX9N1LhTtMJq
 LCwB75QMaY3tVyWvLlRLrxPISWiN+bbInZoMKPMRkqqR+97MEVhALF/nmRT5koy5nuUvMauXILG
 P+xi8HCdbLAco7U6VKv3qgaaC0fx52wgCoYdhCSsnRvSIENClPUAdclJVitINdiHBJrmafDlyl5
 6K+p8gqHHlLs7aKei+g9UVZAGlrXSpWBpMwuNp2P1uCoKgH6fM2SARCSXTZ41TZmUwbUVILA/o6
 V80fe33W+r84nvmcfmz+ZIfgjcDJ0/TLBHeKJJH/ulxu9FOT7KH8
X-Received: by 2002:a05:620a:40cb:b0:93e:c12c:f11b with SMTP id
 af79cd13be357-940ef94ce57mr1490721885a.71.1793111469824; 
 Tue, 27 Oct 2026 07:31:09 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:9872:3600:589:5f3a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f0a78c06sm986400885a.35.2026.10.27.07.31.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Oct 2026 07:31:05 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v6 17/17] tests/functional/aarch64: add raspi4b GENET
 networking test
Date: Tue, 27 Oct 2026 10:30:36 -0400
Message-ID: <20261027143036.44973-18-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027143036.44973-1-marcelomanzo@gmail.com>
References: <20261027143036.44973-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x72d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


